#!/usr/bin/env python3

import os
import subprocess

import gi

gi.require_version("Gtk", "3.0")

from gi.repository import (
    Gtk,
    Gdk,
    GdkPixbuf,
    Pango,
    GLib
)


# ----------------------------
# Leer historial
# ----------------------------

HIST_FILE = os.path.expanduser(
    "~/.wallpaper_manager/historial"
)

images = []

if os.path.isfile(HIST_FILE):

    with open(HIST_FILE) as f:

        for line in reversed(f.readlines()):

            path = line.strip()

            if os.path.isfile(path):
                images.append(path)


# ----------------------------
# FlowBox (galería)
# ----------------------------

flow = Gtk.FlowBox()

flow.set_max_children_per_line(5)
flow.set_selection_mode(Gtk.SelectionMode.NONE)
flow.set_row_spacing(15)
flow.set_column_spacing(15)


# ----------------------------
# Eventos
# ----------------------------

def open_image(widget, path):

    subprocess.Popen([
        "xdg-open",
        path
    ])


def on_press(widget, event, path):

    # DOBLE CLIC = abrir imagen
    if event.type == Gdk.EventType._2BUTTON_PRESS:

        subprocess.Popen([
            "xdg-open",
            path
        ])

        return True


# ----------------------------
# Crear items
# ----------------------------

for image_path in images:

    try:
        pixbuf = GdkPixbuf.Pixbuf.new_from_file_at_scale(
            image_path,
            128,
            128,
            True
        )

    except GLib.Error:
        continue

    image = Gtk.Image.new_from_pixbuf(pixbuf)

    btn = Gtk.Button()

    inner = Gtk.Box(
        orientation=Gtk.Orientation.VERTICAL,
        spacing=6
    )

    inner.pack_start(image, True, True, 0)

    label = Gtk.Label(
        label=os.path.splitext(
            os.path.basename(image_path)
        )[0]
    )

    label.set_max_width_chars(30)
    label.set_ellipsize(Pango.EllipsizeMode.END)

    inner.pack_start(label, False, False, 0)

    btn.add(inner)

    btn.set_tooltip_text(image_path)

    btn.connect(
        "button-press-event",
        on_press,
        image_path
    )

    flow.add(btn)


# ----------------------------
# Ventana (ESTO es lo que te faltaba)
# ----------------------------

window = Gtk.Window()
window.set_title("Wallpaper Gallery")
window.set_default_size(900, 600)

scroll = Gtk.ScrolledWindow()
scroll.set_hexpand(True)
scroll.set_vexpand(True)

scroll.add(flow)

window.add(scroll)

window.connect("destroy", Gtk.main_quit)

window.show_all()

Gtk.main()
