#!/usr/bin/env python3
import os
import sys
import shutil
import tempfile
import subprocess
from pathlib import Path

import gi
gi.require_version('Gtk', '3.0')
gi.require_version('GdkPixbuf', '2.0')
from gi.repository import Gtk, Gdk, GdkPixbuf
from PIL import Image, ImageDraw, ImageFont

# ----------------------------------------------------------------------
# CONFIGURACIÓN Y RUTAS
# ----------------------------------------------------------------------
TEMP_DIR = Path(tempfile.gettempdir()) / "wallpaper_editor_cache"
TEMP_DIR.mkdir(parents=True, exist_ok=True)

def get_current_wallpaper_path():
    """Obtiene la ruta de la imagen actual verificando el esquema de color de GNOME."""
    
    # Decidir qué clave consultar según el esquema de color
    schema_key = "picture-uri"
    try:
        scheme_res = subprocess.run(
            ["gsettings", "get", "org.gnome.desktop.interface", "color-scheme"],
            capture_output=True, text=True, check=True
        )
        if "prefer-dark" in scheme_res.stdout:
            schema_key = "picture-uri-dark"
    except Exception as e:
        print(f"No se pudo consultar el esquema de color: {e}")

    # Intentar leer desde gsettings la clave correspondiente
    try:
        res = subprocess.run(
            ["gsettings", "get", "org.gnome.desktop.background", schema_key],
            capture_output=True, text=True, check=True
        )
        uri = res.stdout.strip().strip("'").strip('"')
        
        # Limpiar el prefijo URI file://
        if uri.startswith("file://"):
            uri = uri[7:]
            
        path = Path(uri)
        if path.exists():
            return path
        else:
            print(f"La ruta devuelta por gsettings ({schema_key}) no existe en disco: {path}")
    except Exception as e:
        print(f"Error al consultar gsettings ({schema_key}): {e}")

    # Respaldo: Buscar el archivo más reciente en el caché de wallpaper_manager
    cache_dir = Path("/tmp/wallpaper_manager_cache")
    if cache_dir.exists():
        files = [f for f in cache_dir.glob("*") if f.suffix.lower() in [".jpg", ".jpeg", ".png", ".webp"]]
        if files:
            files.sort(key=lambda x: x.stat().st_mtime, reverse=True)
            print(f"Usando imagen más reciente del caché: {files[0]}")
            return files[0]

    return None

def get_system_fonts():
    fonts = []
    base_dir = "/usr/share/fonts"
    if os.path.isdir(base_dir):
        for root, _, files in os.walk(base_dir):
            for filename in files:
                if filename.lower().endswith((".ttf", ".otf")):
                    fonts.append(os.path.join(root, filename))
    fonts.sort(key=lambda p: os.path.basename(p).lower())
    return fonts

SYSTEM_FONTS = get_system_fonts()

# ----------------------------------------------------------------------
# RENDERIZADO CON PILLOW
# ----------------------------------------------------------------------
def wrap_text(text, font, max_width, draw):
    words = text.split()
    lines, current = [], ""
    for word in words:
        test = f"{current} {word}".strip()
        bbox = draw.textbbox((0, 0), test, font=font)
        if (bbox[2] - bbox[0]) <= max_width:
            current = test
        else:
            if current: lines.append(current)
            current = word
    if current: lines.append(current)
    return lines

def generate_composite_image(bg_path, text_content, font_path=None, font_size=42, 
                             offset_x=0, offset_y=0, align_mode="center", 
                             width_ratio=0.7, draw_background=True):
    bg_image = Image.open(bg_path).convert("RGB")
    bg_image.thumbnail((1920, 1080), Image.Resampling.LANCZOS)
    canvas_w, canvas_h = bg_image.size

    try:
        font = ImageFont.truetype(font_path, font_size) if font_path else ImageFont.load_default()
    except Exception:
        font = ImageFont.load_default()

    box_w = int(canvas_w * width_ratio)
    max_text_w = box_w - 40
    dummy = Image.new("RGB", (1, 1))
    draw_dummy = ImageDraw.Draw(dummy)

    lines_text = wrap_text(text_content, font, max_text_w, draw_dummy) if text_content else []
    if not lines_text:
        return bg_image

    total_lines = len(lines_text)
    bbox = draw_dummy.textbbox((0, 0), "Ag", font=font)
    line_h = bbox[3] - bbox[1] + 8
    box_h = (total_lines * line_h) + 40

    margin = 20
    hpos = max(margin, min(margin + offset_x, canvas_w - box_w - margin))
    vpos = max(margin, min(margin + offset_y, canvas_h - box_h - margin))

    overlay = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    draw_overlay = ImageDraw.Draw(overlay)

    if draw_background:
        small = bg_image.resize((1, 1), Image.Resampling.LANCZOS).convert("RGB")
        pixel = small.getpixel((0, 0))
        r, g, b = pixel[0], pixel[1], pixel[2]
        draw_overlay.rectangle([hpos, vpos, hpos + box_w, vpos + box_h], fill=(r, g, b, 150))

    result = Image.alpha_composite(bg_image.convert("RGBA"), overlay)
    draw = ImageDraw.Draw(result)

    text_y = vpos + 20

    def calcular_x(line_text):
        line_box = draw.textbbox((0, 0), line_text, font=font)
        line_w = line_box[2] - line_box[0]
        if align_mode == "left":
            return hpos + 20
        elif align_mode == "right":
            return hpos + box_w - line_w - 20
        else:
            return hpos + (box_w - line_w) // 2

    for line in lines_text:
        text_x = calcular_x(line)
        draw.text((text_x + 2, text_y + 2), line, font=font, fill=(0, 0, 0, 180))
        draw.text((text_x, text_y), line, font=font, fill=(255, 255, 255, 255))
        text_y += line_h

    return result.convert("RGB")

# ----------------------------------------------------------------------
# VENTANA PRINCIPAL DE EDICIÓN
# ----------------------------------------------------------------------
class TextImageEditorWindow(Gtk.Window):
    def __init__(self, image_path=None):
        super().__init__(title="Editor de Texto sobre Imagen")
        self.set_default_size(900, 650)
        self.set_position(Gtk.WindowPosition.CENTER)

        # Si no se pasa ruta por argumento, se busca la que está en gsettings picture-uri
        if image_path:
            self.image_path = Path(image_path)
        else:
            self.image_path = get_current_wallpaper_path()

        self.font_path = SYSTEM_FONTS[0] if SYSTEM_FONTS else None
        self.font_size = 42
        self.offset_x = 0
        self.offset_y = 0
        self.width_ratio = 0.7
        self.align_mode = "center"
        self.draw_background = True
        self.text_content = ""

        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=8)
        main_box.set_margin_top(8)
        main_box.set_margin_bottom(8)
        main_box.set_margin_start(8)
        main_box.set_margin_end(8)
        self.add(main_box)

        # Bar de Controles Superior
        top_bar = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)

        # Selector de Fuente y Tamaño
        box_font = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
        box_font.pack_start(Gtk.Label(label="Fuente:"), False, False, 0)
        self.combo_fonts = Gtk.ComboBoxText()
        for font in SYSTEM_FONTS:
            self.combo_fonts.append_text(os.path.basename(font))
        if SYSTEM_FONTS:
            self.combo_fonts.set_active(0)
        self.combo_fonts.connect("changed", self.on_font_changed)
        box_font.pack_start(self.combo_fonts, False, False, 0)

        box_font.pack_start(Gtk.Label(label="Tamaño:"), False, False, 0)
        self.spin_size = Gtk.SpinButton.new_with_range(16, 120, 2)
        self.spin_size.set_value(self.font_size)
        self.spin_size.connect("value-changed", self.on_size_changed)
        box_font.pack_start(self.spin_size, False, False, 0)
        top_bar.pack_start(box_font, False, False, 0)

        # Ajuste de Ancho
        box_width = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=2)
        box_width.pack_start(Gtk.Label(label="Ancho:"), False, False, 0)
        btn_w_dec = Gtk.Button(label="➖")
        btn_w_dec.connect("clicked", lambda w: self.ajustar_ancho(-0.05))
        btn_w_inc = Gtk.Button(label="➕")
        btn_w_inc.connect("clicked", lambda w: self.ajustar_ancho(0.05))
        box_width.pack_start(btn_w_dec, False, False, 0)
        box_width.pack_start(btn_w_inc, False, False, 0)
        top_bar.pack_start(box_width, False, False, 0)

        # Alineación
        box_align = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
        box_align.pack_start(Gtk.Label(label="Alineación:"), False, False, 0)
        self.combo_align = Gtk.ComboBoxText()
        self.combo_align.append("center", "↔ Centrado")
        self.combo_align.append("left", "⇤ Izquierda")
        self.combo_align.append("right", "⇥ Derecha")
        self.combo_align.set_active(0)
        self.combo_align.connect("changed", self.on_align_changed)
        box_align.pack_start(self.combo_align, False, False, 0)
        top_bar.pack_start(box_align, False, False, 0)

        # Controles de Posición
        grid_pad = Gtk.Grid()
        grid_pad.set_column_spacing(2)
        grid_pad.set_row_spacing(2)
        btn_up = Gtk.Button(label="▲")
        btn_up.connect("clicked", lambda w: self.mover_posicion(0, -40))
        btn_down = Gtk.Button(label="▼")
        btn_down.connect("clicked", lambda w: self.mover_posicion(0, 40))
        btn_left = Gtk.Button(label="◄")
        btn_left.connect("clicked", lambda w: self.mover_posicion(-40, 0))
        btn_right = Gtk.Button(label="►")
        btn_right.connect("clicked", lambda w: self.mover_posicion(40, 0))
        grid_pad.attach(btn_up, 1, 0, 1, 1)
        grid_pad.attach(btn_left, 0, 1, 1, 1)
        grid_pad.attach(btn_right, 2, 1, 1, 1)
        grid_pad.attach(btn_down, 1, 2, 1, 1)

        box_pad = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
        box_pad.pack_start(Gtk.Label(label="Mover:"), False, False, 0)
        box_pad.pack_start(grid_pad, False, False, 0)
        top_bar.pack_start(box_pad, False, False, 0)

        main_box.pack_start(top_bar, False, False, 0)

        # Área de Vista Previa
        self.image_widget = Gtk.Image()
        scrolled_preview = Gtk.ScrolledWindow()
        scrolled_preview.add(self.image_widget)
        main_box.pack_start(scrolled_preview, True, True, 0)

        # Botones de Acción
        action_bar = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        action_bar.set_halign(Gtk.Align.CENTER)

        btn_open_local = Gtk.Button(label="📂 Abrir Imagen")
        btn_open_local.connect("clicked", self.on_abrir_imagen)
        action_bar.pack_start(btn_open_local, False, False, 0)

        btn_text_input = Gtk.Button(label="✏️ Entrada de Texto")
        btn_text_input.connect("clicked", self.on_editar_texto)
        action_bar.pack_start(btn_text_input, False, False, 0)

        self.chk_bg = Gtk.CheckButton(label="Fondo transparente")
        self.chk_bg.set_active(True)
        self.chk_bg.connect("toggled", self.on_toggle_fondo)
        action_bar.pack_start(self.chk_bg, False, False, 0)

        btn_wallpaper = Gtk.Button(label="🖥️ Set as wallpaper")
        btn_wallpaper.connect("clicked", self.on_set_wallpaper)
        action_bar.pack_start(btn_wallpaper, False, False, 0)

        main_box.pack_start(action_bar, False, False, 0)

        self.show_all()
        if self.image_path and self.image_path.exists():
            self.renderizar_vista_previa()

    # ----------------------------------------------------------------------
    # EVENTOS DE ACCIÓN Y RENDERIZADO
    # ----------------------------------------------------------------------
    def ajustar_ancho(self, delta):
        self.width_ratio = max(0.3, min(0.9, self.width_ratio + delta))
        self.renderizar_vista_previa()

    def mover_posicion(self, dx, dy):
        self.offset_x = max(0, self.offset_x + dx)
        self.offset_y = max(0, self.offset_y + dy)
        self.renderizar_vista_previa()

    def on_align_changed(self, combo):
        self.align_mode = combo.get_active_id()
        self.renderizar_vista_previa()

    def on_font_changed(self, combo):
        idx = combo.get_active()
        if 0 <= idx < len(SYSTEM_FONTS):
            self.font_path = SYSTEM_FONTS[idx]
            self.renderizar_vista_previa()

    def on_size_changed(self, spin):
        self.font_size = int(spin.get_value())
        self.renderizar_vista_previa()

    def on_toggle_fondo(self, widget):
        self.draw_background = widget.get_active()
        self.renderizar_vista_previa()

    def renderizar_vista_previa(self):
        if not self.image_path or not self.image_path.exists():
            return
        try:
            comp = generate_composite_image(
                str(self.image_path),
                self.text_content,
                font_path=self.font_path,
                font_size=self.font_size,
                offset_x=self.offset_x,
                offset_y=self.offset_y,
                align_mode=self.align_mode,
                width_ratio=self.width_ratio,
                draw_background=self.draw_background
            )
            preview_path = TEMP_DIR / "preview_current.jpg"
            comp.save(preview_path, quality=90)
            pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(str(preview_path), 850, 500, True)
            self.image_widget.set_from_pixbuf(pixbuf)
        except Exception as e:
            print(f"Error al renderizar la vista previa: {e}")

    def on_abrir_imagen(self, widget):
        dialog = Gtk.FileChooserDialog(
            title="Seleccionar Imagen", parent=self,
            action=Gtk.FileChooserAction.OPEN,
            buttons=(Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL, Gtk.STOCK_OPEN, Gtk.ResponseType.ACCEPT)
        )
        filter_img = Gtk.FileFilter()
        filter_img.set_name("Imágenes")
        filter_img.add_mime_type("image/jpeg")
        filter_img.add_mime_type("image/png")
        filter_img.add_mime_type("image/webp")
        dialog.add_filter(filter_img)

        if dialog.run() == Gtk.ResponseType.ACCEPT:
            self.image_path = Path(dialog.get_filename())
            self.renderizar_vista_previa()
        dialog.destroy()

    def on_editar_texto(self, widget):
        dialog = Gtk.Dialog(title="Entrada de Texto", transient_for=self, flags=0)
        dialog.set_default_size(500, 200)
        dialog.add_buttons(Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL, Gtk.STOCK_OK, Gtk.ResponseType.OK)

        content = dialog.get_content_area()
        content.set_spacing(8)
        content.set_margin_top(12)
        content.set_margin_bottom(12)
        content.set_margin_start(12)
        content.set_margin_end(12)

        content.pack_start(Gtk.Label(label="Escribe el texto a superponer:"), False, False, 0)
        text_view = Gtk.TextView()
        text_view.set_wrap_mode(Gtk.WrapMode.WORD_CHAR)
        text_view.set_vexpand(True)
        buffer = text_view.get_buffer()
        buffer.set_text(self.text_content)
        content.pack_start(text_view, True, True, 0)

        dialog.show_all()
        if dialog.run() == Gtk.ResponseType.OK:
            start, end = buffer.get_bounds()
            self.text_content = buffer.get_text(start, end, True).strip()
            self.renderizar_vista_previa()
        dialog.destroy()

    def on_set_wallpaper(self, widget):
        if not self.image_path or not self.image_path.exists():
            return

        try:
            comp = generate_composite_image(
                str(self.image_path),
                self.text_content,
                font_path=self.font_path,
                font_size=self.font_size,
                offset_x=self.offset_x,
                offset_y=self.offset_y,
                align_mode=self.align_mode,
                width_ratio=self.width_ratio,
                draw_background=self.draw_background
            )
            base_stem = self.image_path.stem
            output_file = self.image_path.parent / f"{base_stem}_texto.jpg"
            comp.save(output_file, quality=100)

            action_script = Path("/usr/share/wallpaper_manager/w_m/actions/ir-prev.sh")
            if action_script.exists():
                subprocess.run(["bash", str(action_script), str(output_file)])
            else:
                uri = f"file://{output_file.resolve()}"
                subprocess.run(["gsettings", "set", "org.gnome.desktop.background", "picture-uri", uri], check=False)
                subprocess.run(["gsettings", "set", "org.gnome.desktop.background", "picture-uri-dark", uri], check=False)

        except Exception as e:
            dialog = Gtk.MessageDialog(
                transient_for=self, flags=0, message_type=Gtk.MessageType.ERROR,
                buttons=Gtk.ButtonsType.OK, text="Error al cambiar el fondo"
            )
            dialog.format_secondary_text(str(e))
            dialog.run()
            dialog.destroy()


if __name__ == "__main__":
    img_arg = sys.argv[1] if len(sys.argv) > 1 else None
    app = TextImageEditorWindow(image_path=img_arg)
    app.connect("destroy", Gtk.main_quit)
    Gtk.main()
