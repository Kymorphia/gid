Fedora
======

Various notes for Fedora users. These should probably apply to RedHat
derivatives as well.

This document mostly gives information about the required Fedora packages for each GID subpackage.

If you have any questions, please ask on giddy's [General](https://github.com/Kymorphia/gid/discussions/categories/general) forum.

GTK SourceView
--------------

### GTK4

```
dnf install gtksourceview5-devel
```

The package above provides the `/usr/share/gir-1.0/GtkSource-5.gir` GIR file.

VTE
---

### GTK3

```
sudo dnf install vte291-devel
```

The command above will bring the `/usr/share/gir-1.0/Vte-2.91.gir` GIR file.

### GTK4

```
sudo dnf install vte291-gtk4-devel
```

The command above will bring the `/usr/share/gir-1.0/Vte-3.91.gir` GIR file.
Quite confusing, but that is how it is on Fedora 40.

# RSvg

Librsvg is a library to render SVG files using cairo as a rendering engine. For example, you can 
render SVG to in-memory RGBA surfaces, or to PDF streams.

Trivia: rsvg stands for "Resplendent SVG".

Website: https://wiki.gnome.org/Projects/LibRsvg

In order to use gid:rsvg2 you need the following:

```
sudo dnf install librsvg2-devel
```
