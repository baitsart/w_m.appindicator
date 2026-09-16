#!/usr/bin/env python3
import io
import json
import os
import random
import re
import shutil
import subprocess
import tempfile
import threading
import urllib.parse
import urllib.request
import urllib.error
from pathlib import Path

import gi
gi.require_version('Gtk', '3.0')
gi.require_version('GdkPixbuf', '2.0')
from gi.repository import Gtk, Gdk, GdkPixbuf, GLib
from PIL import Image, ImageDraw, ImageFont

# ----------------------------------------------------------------------
# CONFIGURACIÓN Y RUTAS DE ALMACENAMIENTO
# ----------------------------------------------------------------------
TEMP_DIR = Path(tempfile.gettempdir()) / "wallpaper_manager_cache"
TEMP_DIR.mkdir(parents=True, exist_ok=True)

def obtener_directorios():
    try:
        res = subprocess.run(["xdg-user-dir", "PICTURES"], capture_output=True, text=True, check=True)
        base = Path(res.stdout.strip())
    except Exception:
        base = Path.home() / "Imágenes"

    dir_citas = base / "wallpaper manager_citas"
    dir_auto = dir_citas / "Automatica"

    dir_citas.mkdir(parents=True, exist_ok=True)
    dir_auto.mkdir(parents=True, exist_ok=True)
    return dir_citas, dir_auto

SAVE_DIR, AUTO_DIR = obtener_directorios()
WALLHAVEN_API_KEY = os.environ.get("WALLHAVEN_API_KEY", "jJm5diseSPiDVIqvvE7aUS4fWwgJ0koW")

HTTP_HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0",
    "Accept": "application/json, text/plain, */*",
    "Accept-Language": "es-ES,es;q=0.9,en;q=0.8"
}

IMAGE_STYLES = {
    "Naturaleza": "nature",
    "Paisajes": "landscape",
    "Montañas": "mountains",
    "Espacio": "space",
    "Arquitectura": "architecture",
    "Borobudur Temple": "Borobudur temple",
    "Japón": "Japan",
}

# ----------------------------------------------------------------------
# FUENTES DEL SISTEMA
# ----------------------------------------------------------------------
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
# PARSER Y BANCO DE CITAS
# ----------------------------------------------------------------------
BASE_QUOTES_DIR = Path("/home/pc/Descargas/Buenas imágenes con citas")

def ejecutar_y_parsear_script(script_path):
    datos = {"Cita": "", "Autor": "", "Fecha": "", "URL": ""}
    try:
        res = subprocess.run(["python3", str(script_path)], capture_output=True, text=True, timeout=5)
        if res.returncode == 0:
            for line in res.stdout.splitlines():
                if line.startswith("Cita:"):
                    datos["Cita"] = line.replace("Cita:", "").strip()
                elif line.startswith("Autor:"):
                    datos["Autor"] = line.replace("Autor:", "").strip()
                elif line.startswith("Fecha:"):
                    datos["Fecha"] = line.replace("Fecha:", "").strip()
                elif line.startswith("URL:"):
                    datos["URL"] = line.replace("URL:", "").strip()
    except Exception as e:
        print(f"Error al ejecutar script {script_path}: {e}")
    return datos

SIVA_QUOTES = [
    {"Cita": "La conciencia es el refugio inmortal en medio del cambio continuo.", "Autor": "Siva P.", "Fecha": "PVH", "URL": ""},
    {"Cita": "En el silencio de la mente se revela la naturaleza indivisible del ser.", "Autor": "Siva P.", "Fecha": "PVH", "URL": ""},
    {"Cita": "El observador trasciende toda forma y movimiento constante.", "Autor": "Siva P.", "Fecha": "PVH", "URL": ""}
]

SRI_SRI_QUOTES = [
    {"Cita": "La sonrisa es la verdadera riqueza del alma.", "Autor": "Sri Sri Ravi Shankar", "Fecha": "", "URL": ""},
    {"Cita": "El amor no es una emoción, es la naturaleza misma de tu existencia.", "Autor": "Sri Sri Ravi Shankar", "Fecha": "", "URL": ""},
    {"Cita": "La fe es darse cuenta de que siempre estás protegido.", "Autor": "Sri Sri Ravi Shankar", "Fecha": "", "URL": ""}
]

OTROS_AUTORES_QUOTES = [
    {"Cita": "El conocimiento de uno mismo es el comienzo de toda sabiduría.", "Autor": "Aristóteles", "Fecha": "", "URL": ""},
    {"Cita": "La paz viene del interior. No la busques fuera.", "Autor": "Buda Gautama", "Fecha": "", "URL": ""},
    {"Cita": "La naturaleza no se apresura, sin embargo, todo se logra.", "Autor": "Lao Tsé", "Fecha": "", "URL": ""},
    {"Cita": "Quien mira hacia afuera, sueña; quien mira hacia adentro, despierta.", "Autor": "Carl Jung", "Fecha": "", "URL": ""}
]

def obtener_cita_datos(autor_id):
    if autor_id == "sadhguru":
        return ejecutar_y_parsear_script(BASE_QUOTES_DIR / "sadhguru_quotes.py")
    elif autor_id == "prem_rawat":
        return ejecutar_y_parsear_script(BASE_QUOTES_DIR / "prem_rawat_quotes.py")
    elif autor_id == "siva":
        return random.choice(SIVA_QUOTES)
    elif autor_id == "ravi_shankar":
        return random.choice(SRI_SRI_QUOTES)
    elif autor_id == "otros":
        return random.choice(OTROS_AUTORES_QUOTES)
    else:
        return {
            "Cita": "El conocimiento libera la mente.",
            "Autor": "Autor Desconocido",
            "Fecha": "",
            "URL": ""
        }

def descargar_archivo(url, destino_path):
    req = urllib.request.Request(url, headers=HTTP_HEADERS)
    with urllib.request.urlopen(req, timeout=15) as response, open(destino_path, "wb") as out_file:
        out_file.write(response.read())

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

def generate_composite_image(bg_path, quote_text, author_text, font_path=None, font_size=42, offset_x=0, offset_y=0, align_mode="center", width_ratio=0.7):
    bg_image = Image.open(bg_path).convert("RGB")
    canvas_w, canvas_h = bg_image.size

    try:
        font = ImageFont.truetype(font_path, font_size) if font_path else ImageFont.load_default()
    except Exception:
        font = ImageFont.load_default()

    overlay = Image.new("RGBA", (canvas_w, canvas_h), (0, 0, 0, 0))
    draw_overlay = ImageDraw.Draw(overlay)

    small = bg_image.resize((1, 1), Image.Resampling.LANCZOS)
    r, g, b = small.getpixel((0, 0))

    box_w = int(canvas_w * width_ratio)
    max_text_w = box_w - 40
    dummy = Image.new("RGB", (1, 1))
    draw_dummy = ImageDraw.Draw(dummy)

    clean_quote = quote_text.strip("“”).")
    lines_quote = wrap_text(f"“{clean_quote}”", font, max_text_w, draw_dummy)

    author_line = f"— {author_text}" if author_text else ""

    total_lines = len(lines_quote) + (1 if author_line else 0)

    bbox = draw_dummy.textbbox((0, 0), "Ag", font=font)
    line_h = bbox[3] - bbox[1] + 8
    box_h = (total_lines * line_h) + 40

    margin = 20
    hpos = max(margin, min(margin + offset_x, canvas_w - box_w - margin))
    vpos = max(margin, min(margin + offset_y, canvas_h - box_h - margin))

    draw_overlay.rectangle([hpos, vpos, hpos + box_w, vpos + box_h], fill=(r, g, b, 150))
    result = Image.alpha_composite(bg_image.convert("RGBA"), overlay)
    draw = ImageDraw.Draw(result)

    text_y = vpos + 20

    def calcular_x(line_text, align_type):
        line_box = draw.textbbox((0, 0), line_text, font=font)
        line_w = line_box[2] - line_box[0]
        if align_type == "left":
            return hpos + 20
        elif align_type == "right":
            return hpos + box_w - line_w - 20
        else:
            return hpos + (box_w - line_w) // 2

    if align_mode == "left":
        q_align, a_align = "left", "left"
    elif align_mode == "right":
        q_align, a_align = "right", "right"
    elif align_mode == "q_left_a_right":
        q_align, a_align = "left", "right"
    elif align_mode == "q_right_a_left":
        q_align, a_align = "right", "left"
    else:
        q_align, a_align = "center", "center"

    for line in lines_quote:
        text_x = calcular_x(line, q_align)
        draw.text((text_x + 2, text_y + 2), line, font=font, fill=(0, 0, 0, 180))
        draw.text((text_x, text_y), line, font=font, fill=(255, 255, 255, 255))
        text_y += line_h

    if author_line:
        text_x = calcular_x(author_line, a_align)
        draw.text((text_x + 2, text_y + 2), author_line, font=font, fill=(0, 0, 0, 180))
        draw.text((text_x, text_y), author_line, font=font, fill=(255, 255, 255, 255))

    return result.convert("RGB")

# ----------------------------------------------------------------------
# VENTANA PRINCIPAL GTK
# ----------------------------------------------------------------------
class WallpaperManagerWindow(Gtk.Window):

    def __init__(self):
        super().__init__(title="Wallpaper Manager — Citas & Wallpapers")
        self.set_default_size(1050, 700)
        self.set_position(Gtk.WindowPosition.CENTER)

        self.citas_activas = True
        self.autor_seleccionado = "prem_rawat"
        self.imagenes_cache = []
        self.imagenes_limpias_abiertas = set()

        self.connect("delete-event", self.on_close_window)
        self.aplicar_estilos_css()

        main_box = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=10)
        main_box.set_margin_top(12); main_box.set_margin_bottom(12)
        main_box.set_margin_start(12); main_box.set_margin_end(12)
        self.add(main_box)

        main_box.pack_start(self.crear_panel_superior(), False, False, 0)
        main_box.pack_start(Gtk.Separator(orientation=Gtk.Orientation.HORIZONTAL), False, False, 5)

        scrolled_window = Gtk.ScrolledWindow()
        scrolled_window.set_policy(Gtk.PolicyType.NEVER, Gtk.PolicyType.AUTOMATIC)

        self.flowbox = Gtk.FlowBox()
        self.flowbox.set_valign(Gtk.Align.START)
        self.flowbox.set_max_children_per_line(5)
        self.flowbox.set_selection_mode(Gtk.SelectionMode.SINGLE)
        self.flowbox.connect("child-activated", self.on_imagen_doble_click)

        scrolled_window.add(self.flowbox)
        main_box.pack_start(scrolled_window, True, True, 0)

        bottom_bar = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)
        self.lbl_status = Gtk.Label(label="Listo.")
        bottom_bar.pack_start(self.lbl_status, False, False, 0)

        btn_refresh = Gtk.Button(label="🔄 Cargar Imágenes")
        btn_refresh.connect("clicked", lambda w: self.cargar_imagenes_async())
        bottom_bar.pack_end(btn_refresh, False, False, 0)

        main_box.pack_start(bottom_bar, False, False, 0)
        self.cargar_imagenes_async()

    def crear_panel_superior(self):
        hbox = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=15)

        exp_citas = Gtk.Expander(label="<b>📜 Citas</b>")
        exp_citas.get_label_widget().set_use_markup(True)
        exp_citas.set_expanded(True)

        vbox_citas = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=5)
        self.chk_citas = Gtk.CheckButton(label="Activar citas en imágenes")
        self.chk_citas.set_active(True)
        self.chk_citas.connect("toggled", self.on_citas_toggled)
        vbox_citas.pack_start(self.chk_citas, False, False, 0)

        self.vbox_autores = Gtk.Box(orientation=Gtk.Orientation.VERTICAL, spacing=2)
        self.vbox_autores.set_margin_start(12)

        r1 = Gtk.RadioButton.new_with_label(None, "Prem Rawat")
        r1.connect("toggled", self.on_autor_changed, "prem_rawat")
        r2 = Gtk.RadioButton.new_with_label_from_widget(r1, "Sadhguru")
        r2.connect("toggled", self.on_autor_changed, "sadhguru")
        r3 = Gtk.RadioButton.new_with_label_from_widget(r1, "Siva P. de PVH")
        r3.connect("toggled", self.on_autor_changed, "siva")
        r4 = Gtk.RadioButton.new_with_label_from_widget(r1, "Sri Sri Ravi Shankar")
        r4.connect("toggled", self.on_autor_changed, "ravi_shankar")
        r5 = Gtk.RadioButton.new_with_label_from_widget(r1, "Otros Autores")
        r5.connect("toggled", self.on_autor_changed, "otros")

        for r in [r1, r2, r3, r4, r5]:
            self.vbox_autores.pack_start(r, False, False, 0)

        vbox_citas.pack_start(self.vbox_autores, False, False, 0)
        exp_citas.add(vbox_citas)
        hbox.pack_start(exp_citas, True, True, 0)

        exp_estilos = Gtk.Expander(label="<b>🎨 Estilos de imágenes</b>")
        exp_estilos.get_label_widget().set_use_markup(True)
        exp_estilos.set_expanded(True)

        grid = Gtk.Grid()
        grid.set_column_spacing(12); grid.set_row_spacing(4)

        self.chk_estilos = {}
        row, col = 0, 0
        for nombre, tag in IMAGE_STYLES.items():
            chk = Gtk.CheckButton(label=nombre)
            chk.set_active(True)
            self.chk_estilos[tag] = chk
            grid.attach(chk, col, row, 1, 1)
            col += 1
            if col > 1: col = 0; row += 1

        exp_estilos.add(grid)
        hbox.pack_start(exp_estilos, True, True, 0)
        return hbox

    def on_citas_toggled(self, widget):
        self.citas_activas = widget.get_active()
        self.vbox_autores.set_visible(self.citas_activas)

    def on_autor_changed(self, widget, autor_id):
        if widget.get_active():
            self.autor_seleccionado = autor_id
            if autor_id == "siva":
                tag = IMAGE_STYLES["Borobudur Temple"]
                if tag in self.chk_estilos:
                    self.chk_estilos[tag].set_active(True)

    def cargar_imagenes_async(self):
        self.lbl_status.set_text("Obteniendo catálogo desde Wallhaven...")
        for child in self.flowbox.get_children():
            self.flowbox.remove(child)

        tags_activos = [tag for tag, chk in self.chk_estilos.items() if chk.get_active()]
        if not tags_activos:
            tags_activos = ["nature"]

        query_tag = random.choice(tags_activos)

        def worker():
            params_base = {"q": query_tag, "sorting": "random", "purity": "100"}
            intentos = [{**params_base, "apikey": WALLHAVEN_API_KEY}, params_base]

            data = None
            ultimo_error = ""

            for params in intentos:
                try:
                    query = urllib.parse.urlencode(params)
                    api_url = f"https://wallhaven.cc/api/v1/search?{query}"
                    req = urllib.request.Request(api_url, headers=HTTP_HEADERS)

                    with urllib.request.urlopen(req, timeout=10) as resp:
                        if resp.status == 200:
                            data = json.loads(resp.read().decode("utf-8"))
                            break
                except urllib.error.HTTPError as e:
                    ultimo_error = f"HTTP {e.code}: {e.reason}"
                    if e.code == 403: continue
                except Exception as e:
                    ultimo_error = str(e)

            if not data or "data" not in data:
                GLib.idle_add(self.lbl_status.set_text, f"Error al conectar: {ultimo_error}")
                return

            try:
                items = []
                for item in data.get("data", [])[:25]:
                    thumb_path = TEMP_DIR / f"thumb_{item['id']}.jpg"
                    if not thumb_path.exists():
                        descargar_archivo(item["thumbs"]["small"], thumb_path)
                    items.append({
                        "id": item["id"],
                        "thumb_path": str(thumb_path),
                        "full_url": item["path"],
                        "source_url": item.get("url", item["path"])
                    })
                GLib.idle_add(self.actualizar_grid_miniaturas, items)
            except Exception as e:
                GLib.idle_add(self.lbl_status.set_text, f"Error cargando miniaturas: {e}")

        threading.Thread(target=worker, daemon=True).start()

    def actualizar_grid_miniaturas(self, items):
        self.imagenes_cache = items
        self.lbl_status.set_text(f"{len(items)} miniaturas listas.")

        for item in items:
            pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(item["thumb_path"], 170, 110, True)
            img = Gtk.Image.new_from_pixbuf(pixbuf)
            box = Gtk.EventBox()
            box.add(img)
            box.item_data = item
            self.flowbox.add(box)
        self.flowbox.show_all()

    def on_imagen_doble_click(self, flowbox, child):
        item_data = getattr(child.get_child(), "item_data", None)
        if item_data:
            dialog = PreviewDialog(self, item_data)
            dialog.run()
            dialog.destroy()

    def on_close_window(self, widget, event):
        dialog = Gtk.MessageDialog(
            transient_for=self, flags=0, message_type=Gtk.MessageType.QUESTION,
            buttons=Gtk.ButtonsType.YES_NO, text="Al cerrar, ¿guardamos las imágenes de la sesión?"
        )
        dialog.format_secondary_text(
            f"• Descargando imágenes limpias de las miniaturas en: {AUTO_DIR}\n"
            f"• Guardado de imágenes seleccionadas en: {SAVE_DIR}"
        )
        resp = dialog.run()
        dialog.destroy()

        if resp == Gtk.ResponseType.YES:
            progress_dialog = Gtk.MessageDialog(
                transient_for=self, flags=0, message_type=Gtk.MessageType.INFO,
                buttons=Gtk.ButtonsType.NONE, text="Guardando y descargando imágenes..."
            )
            progress_dialog.format_secondary_text("Por favor espera un momento mientras finaliza la descarga.")
            progress_dialog.show_all()

            def process_saving():
                for src_clean_path in list(self.imagenes_limpias_abiertas):
                    if os.path.exists(src_clean_path):
                        dest_clean_path = AUTO_DIR / f"limpia_{Path(src_clean_path).name}"
                        shutil.copy(src_clean_path, dest_clean_path)

                for item in self.imagenes_cache:
                    hd_path = TEMP_DIR / f"full_{item['id']}.jpg"
                    if not hd_path.exists():
                        try:
                            descargar_archivo(item["full_url"], hd_path)
                        except Exception as e:
                            print(f"Error al descargar {item['id']}: {e}")
                    if hd_path.exists():
                        dest_path = AUTO_DIR / f"miniatura_{item['id']}.jpg"
                        shutil.copy(hd_path, dest_path)

                def finish():
                    progress_dialog.destroy()
                    Gtk.main_quit()

                GLib.idle_add(finish)

            threading.Thread(target=process_saving, daemon=True).start()
            return True

        return False

    def aplicar_estilos_css(self):
        css = b"""
        window { background-color: #0f172a; color: #f8fafc; }
        checkbutton, radiobutton, label { color: #f8fafc; font-size: 13px; }
        button { background-color: #1e293b; color: #ffffff; border: 1px solid #475569; border-radius: 6px; padding: 4px 8px; }
        button:hover { background-color: #334155; }
        expander label { font-size: 13px; font-weight: bold; color: #3b82f6; }
        .arrow-btn { font-size: 16px; font-weight: bold; padding: 2px 10px; }
        """
        provider = Gtk.CssProvider()
        provider.load_from_data(css)
        Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

# ----------------------------------------------------------------------
# DIÁLOGO DE VISTA PREVIA Y EDICIÓN
# ----------------------------------------------------------------------
class PreviewDialog(Gtk.Dialog):

    def __init__(self, parent, item_data):
        super().__init__(title="Vista Previa y Edición", transient_for=parent, flags=0)
        self.set_default_size(1020, 750)
        self.main_app = parent
        self.item_data = item_data

        self.font_path = SYSTEM_FONTS[0] if SYSTEM_FONTS else None
        self.font_size = 42
        self.offset_x = 0
        self.offset_y = 0
        self.width_ratio = 0.7
        self.align_mode = "center"
        self.cita_data = {"Cita": "", "Autor": "", "Fecha": "", "URL": ""}

        if self.main_app.citas_activas:
            self.cita_data = obtener_cita_datos(self.main_app.autor_seleccionado)

        main_box = self.get_content_area()
        main_box.set_spacing(8)
        main_box.set_margin_top(8); main_box.set_margin_bottom(8)

        # 1. CONTROLES SUPERIORES (FUENTE, TAMAÑO, ANCHO, ALINEACIÓN Y MOVER)
        top_bar = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=10)

        box_font = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
        box_font.pack_start(Gtk.Label(label="Fuente:"), False, False, 0)
        self.combo_fonts = Gtk.ComboBoxText()
        for font in SYSTEM_FONTS:
            self.combo_fonts.append_text(os.path.basename(font))
        self.combo_fonts.set_active(0)
        self.combo_fonts.connect("changed", self.on_font_changed)
        box_font.pack_start(self.combo_fonts, False, False, 0)

        box_font.pack_start(Gtk.Label(label="Tamaño:"), False, False, 0)
        self.spin_size = Gtk.SpinButton.new_with_range(16, 120, 2)
        self.spin_size.set_value(self.font_size)
        self.spin_size.connect("value-changed", self.on_size_changed)
        box_font.pack_start(self.spin_size, False, False, 0)

        top_bar.pack_start(box_font, False, False, 0)

        box_width = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=2)
        box_width.pack_start(Gtk.Label(label="Ancho:"), False, False, 0)
        btn_w_dec = Gtk.Button(label="➖")
        btn_w_dec.connect("clicked", lambda w: self.ajustar_ancho(-0.05))
        btn_w_inc = Gtk.Button(label="➕")
        btn_w_inc.connect("clicked", lambda w: self.ajustar_ancho(0.05))
        box_width.pack_start(btn_w_dec, False, False, 0)
        box_width.pack_start(btn_w_inc, False, False, 0)

        top_bar.pack_start(box_width, False, False, 0)

        box_align = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
        box_align.pack_start(Gtk.Label(label="Alineación:"), False, False, 0)
        self.combo_align = Gtk.ComboBoxText()
        self.combo_align.append("center", "↔ Centrado")
        self.combo_align.append("left", "⇤ Izquierda")
        self.combo_align.append("right", "⇥ Derecha")
        self.combo_align.append("q_left_a_right", " Cita ⇤ / Autor ⇥")
        self.combo_align.append("q_right_a_left", " Cita ⇥ / Autor ⇤")
        self.combo_align.set_active(0)
        self.combo_align.connect("changed", self.on_align_changed)
        box_align.pack_start(self.combo_align, False, False, 0)

        top_bar.pack_start(box_align, False, False, 0)

        grid_pad = Gtk.Grid()
        grid_pad.set_column_spacing(2); grid_pad.set_row_spacing(2)

        btn_up = Gtk.Button(label="▲")
        btn_up.get_style_context().add_class("arrow-btn")
        btn_up.connect("clicked", lambda w: self.mover_posicion(0, -40))

        btn_down = Gtk.Button(label="▼")
        btn_down.get_style_context().add_class("arrow-btn")
        btn_down.connect("clicked", lambda w: self.mover_posicion(0, 40))

        btn_left = Gtk.Button(label="◄")
        btn_left.get_style_context().add_class("arrow-btn")
        btn_left.connect("clicked", lambda w: self.mover_posicion(-40, 0))

        btn_right = Gtk.Button(label="►")
        btn_right.get_style_context().add_class("arrow-btn")
        btn_right.connect("clicked", lambda w: self.mover_posicion(40, 0))

        grid_pad.attach(btn_up, 1, 0, 1, 1)
        grid_pad.attach(btn_left, 0, 1, 1, 1)
        grid_pad.attach(btn_right, 2, 1, 1, 1)
        grid_pad.attach(btn_down, 1, 2, 1, 1)

        box_pad = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=4)
        box_pad.pack_start(Gtk.Label(label="Mover:"), False, False, 0)
        box_pad.pack_start(grid_pad, False, False, 0)

        top_bar.pack_start(box_pad, False, False, 0)

        btn_info = Gtk.Button(label="ℹ️ Info")
        btn_info.connect("clicked", self.mostrar_info_metadatos)
        top_bar.pack_end(btn_info, False, False, 0)

        main_box.pack_start(top_bar, False, False, 0)

        # 2. ÁREA DE IMAGEN
        self.image_widget = Gtk.Image()
        main_box.pack_start(self.image_widget, True, True, 0)

        # 3. ACCIONES DE NAVEGACIÓN Y EDICIÓN
        action_bar_1 = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        action_bar_1.set_halign(Gtk.Align.CENTER)

        btn_open_local = Gtk.Button(label="📂 Abrir Imagen")
        btn_open_local.connect("clicked", self.on_abrir_imagen_local)
        action_bar_1.pack_start(btn_open_local, False, False, 0)

        btn_custom_quote = Gtk.Button(label="✏️ Escribir Cita")
        btn_custom_quote.connect("clicked", self.on_escribir_cita)
        action_bar_1.pack_start(btn_custom_quote, False, False, 0)

        btn_change_quote = Gtk.Button(label="🔄 Cambiar Cita")
        btn_change_quote.connect("clicked", self.on_cambiar_cita)
        action_bar_1.pack_start(btn_change_quote, False, False, 0)

        btn_change_img = Gtk.Button(label="🖼️ Cambiar Imagen")
        btn_change_img.connect("clicked", self.on_cambiar_imagen)
        action_bar_1.pack_start(btn_change_img, False, False, 0)

        main_box.pack_start(action_bar_1, False, False, 0)

        # 4. ACCIONES DE GUARDADO Y FONDO
        action_bar_2 = Gtk.Box(orientation=Gtk.Orientation.HORIZONTAL, spacing=8)
        action_bar_2.set_halign(Gtk.Align.CENTER)

        btn_dl_raw = Gtk.Button(label="📥 Solo Imagen Libre")
        btn_dl_raw.connect("clicked", self.on_descargar_solo_imagen)
        action_bar_2.pack_start(btn_dl_raw, False, False, 0)

        btn_dl_comp = Gtk.Button(label="💾 Guardar con Cita")
        btn_dl_comp.connect("clicked", self.on_descargar_con_cita)
        action_bar_2.pack_start(btn_dl_comp, False, False, 0)

        btn_copy = Gtk.Button(label="📋 Copiar Cita")
        btn_copy.connect("clicked", self.on_copiar_cita)
        action_bar_2.pack_start(btn_copy, False, False, 0)

        btn_set_wp = Gtk.Button(label="🖼️ Establecer Fondo")
        btn_set_wp.connect("clicked", self.on_set_wallpaper)
        action_bar_2.pack_start(btn_set_wp, False, False, 0)

        main_box.pack_start(action_bar_2, False, False, 0)

        self.show_all()
        self.cargar_y_renderizar_async()

    def ajustar_ancho(self, delta):
        self.width_ratio = max(0.3, min(0.9, self.width_ratio + delta))
        self.cargar_y_renderizar_async()

    def mover_posicion(self, dx, dy):
        self.offset_x = max(0, self.offset_x + dx)
        self.offset_y = max(0, self.offset_y + dy)
        self.cargar_y_renderizar_async()

    def on_align_changed(self, combo):
        self.align_mode = combo.get_active_id()
        self.cargar_y_renderizar_async()

    def cargar_y_renderizar_async(self):
        def worker():
            try:
                if "local_path" in self.item_data:
                    hd_path = Path(self.item_data["local_path"])
                else:
                    hd_path = TEMP_DIR / f"full_{self.item_data['id']}.jpg"
                    if not hd_path.exists():
                        descargar_archivo(self.item_data["full_url"], hd_path)

                self.hd_path = str(hd_path)
                self.main_app.imagenes_limpias_abiertas.add(self.hd_path)

                if self.main_app.citas_activas and self.cita_data.get("Cita"):
                    comp = generate_composite_image(
                        self.hd_path,
                        self.cita_data["Cita"],
                        self.cita_data.get("Autor", ""),
                        self.font_path,
                        self.font_size,
                        self.offset_x,
                        self.offset_y,
                        self.align_mode,
                        self.width_ratio
                    )
                    self.current_composite = comp

                    out_buf = io.BytesIO()
                    comp.save(out_buf, format="JPEG", quality=90)
                    out_buf.seek(0)
                    loader = GdkPixbuf.PixbufLoader.new_with_type("jpeg")
                    loader.write(out_buf.read())
                    loader.close()
                    pixbuf = loader.get_pixbuf()
                else:
                    self.current_composite = None
                    pixbuf = GdkPixbuf.Pixbuf.new_from_file(self.hd_path)

                w, h = pixbuf.get_width(), pixbuf.get_height()
                scale = min(800 / w, 450 / h)
                pixbuf_scaled = pixbuf.scale_simple(int(w * scale), int(h * scale), GdkPixbuf.InterpType.BILINEAR)

                GLib.idle_add(self.image_widget.set_from_pixbuf, pixbuf_scaled)

            except Exception as e:
                print(f"Error procesando vista previa: {e}")

        threading.Thread(target=worker, daemon=True).start()

    def on_font_changed(self, combo):
        idx = combo.get_active()
        if idx >= 0:
            self.font_path = SYSTEM_FONTS[idx]
            self.cargar_y_renderizar_async()

    def on_size_changed(self, spin):
        self.font_size = int(spin.get_value())
        self.cargar_y_renderizar_async()

    def on_cambiar_cita(self, widget):
        self.cita_data = obtener_cita_datos(self.main_app.autor_seleccionado)
        self.cargar_y_renderizar_async()

    def on_cambiar_imagen(self, widget):
        if self.main_app.imagenes_cache:
            self.item_data = random.choice(self.main_app.imagenes_cache)
            self.cargar_y_renderizar_async()

    def on_abrir_imagen_local(self, widget):
        dialog = Gtk.FileChooserDialog(
            title="Seleccionar una Imagen Local", parent=self, action=Gtk.FileChooserAction.OPEN,
            buttons=(Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL, Gtk.STOCK_OPEN, Gtk.ResponseType.ACCEPT)
        )
        filter_img = Gtk.FileFilter()
        filter_img.set_name("Imágenes")
        filter_img.add_mime_type("image/jpeg")
        filter_img.add_mime_type("image/png")
        dialog.add_filter(filter_img)

        if dialog.run() == Gtk.ResponseType.ACCEPT:
            filepath = dialog.get_filename()
            self.item_data = {
                "id": f"local_{random.randint(100,999)}",
                "local_path": filepath,
                "source_url": filepath
            }
            self.cargar_y_renderizar_async()
        dialog.destroy()

    def on_escribir_cita(self, widget):
        dialog = Gtk.Dialog(title="Escribir Cita Personalizada", transient_for=self, flags=0)
        dialog.add_buttons(Gtk.STOCK_CANCEL, Gtk.ResponseType.CANCEL, Gtk.STOCK_OK, Gtk.ResponseType.OK)

        box = dialog.get_content_area()
        box.set_spacing(8); box.set_margin_top(10); box.set_margin_start(10); box.set_margin_end(10)

        lbl_cita = Gtk.Label(label="Cita:")
        txt_cita = Gtk.Entry()
        txt_cita.set_text(self.cita_data.get("Cita", ""))

        lbl_autor = Gtk.Label(label="Autor:")
        txt_autor = Gtk.Entry()
        txt_autor.set_text(self.cita_data.get("Autor", ""))

        box.pack_start(lbl_cita, False, False, 0)
        box.pack_start(txt_cita, False, False, 0)
        box.pack_start(lbl_autor, False, False, 0)
        box.pack_start(txt_autor, False, False, 0)
        dialog.show_all()

        if dialog.run() == Gtk.ResponseType.OK:
            self.cita_data = {
                "Cita": txt_cita.get_text(),
                "Autor": txt_autor.get_text(),
                "Fecha": "",
                "URL": ""
            }
            self.cargar_y_renderizar_async()
        dialog.destroy()

    def on_descargar_solo_imagen(self, widget):
        if hasattr(self, 'hd_path') and os.path.exists(self.hd_path):
            dest = SAVE_DIR / f"limpia_{Path(self.hd_path).name}"
            shutil.copy(self.hd_path, dest)
            self.mostrar_mensaje("Imagen Guardada", f"Guardada limpia en:\n{dest}")

    def on_descargar_con_cita(self, widget):
        if getattr(self, 'current_composite', None):
            dest = SAVE_DIR / f"cita_{random.randint(1000,9999)}.jpg"
            self.current_composite.save(dest, quality=95)
            self.mostrar_mensaje("Cita Guardada", f"Imagen con cita guardada en:\n{dest}")

    def on_copiar_cita(self, widget):
        cita = self.cita_data.get("Cita", "")
        autor = self.cita_data.get("Autor", "")
        texto = f"“{cita}” — {autor}" if autor else cita
        clipboard = Gtk.Clipboard.get(Gdk.SELECTION_CLIPBOARD)
        clipboard.set_text(texto, -1)
        self.mostrar_mensaje("Copiado", "Cita copiada al portapapeles.")

    def on_set_wallpaper(self, widget):
        target_path = None
        if getattr(self, 'current_composite', None):
            target_path = TEMP_DIR / "current_wallpaper.jpg"
            self.current_composite.save(target_path, quality=95)
        elif hasattr(self, 'hd_path'):
            target_path = self.hd_path

        if target_path and os.path.exists(target_path):
            uri = f"file://{os.path.abspath(target_path)}"
            try:
                subprocess.run([
                    "gsettings", "set", "org.gnome.desktop.background", "picture-uri", uri
                ], check=True)
                subprocess.run([
                    "gsettings", "set", "org.gnome.desktop.background", "picture-uri-dark", uri
                ], check=True)
                self.mostrar_mensaje("Fondo Establecido", "Se actualizó el fondo de pantalla.")
            except Exception as e:
                self.mostrar_mensaje("Error", f"No se pudo cambiar el fondo: {e}")

    def mostrar_info_metadatos(self, widget):
        msg = f"<b>Autor:</b> {self.cita_data.get('Autor', 'N/A')}\n"
        msg += f"<b>Fecha:</b> {self.cita_data.get('Fecha', 'N/A')}\n"
        msg += f"<b>URL Cita:</b> {self.cita_data.get('URL', 'N/A')}\n"
        msg += f"<b>Origen Imagen:</b> {self.item_data.get('source_url', 'N/A')}"
        dialog = Gtk.MessageDialog(
            transient_for=self, flags=0, message_type=Gtk.MessageType.INFO,
            buttons=Gtk.ButtonsType.OK, text="Información y Metadatos"
        )
        dialog.format_secondary_markup(msg)
        dialog.run()
        dialog.destroy()

    def mostrar_mensaje(self, titulo, mensaje):
        dialog = Gtk.MessageDialog(
            transient_for=self, flags=0, message_type=Gtk.MessageType.INFO,
            buttons=Gtk.ButtonsType.OK, text=titulo
        )
        dialog.format_secondary_text(mensaje)
        dialog.run()
        dialog.destroy()

# ----------------------------------------------------------------------
# PUNTO DE ENTRADA
# ----------------------------------------------------------------------
if __name__ == "__main__":
    app = WallpaperManagerWindow()
    app.connect("destroy", Gtk.main_quit)
    app.show_all()
    Gtk.main()
