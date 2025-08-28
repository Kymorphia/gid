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

RSvg 2
------

Librsvg is a library to render SVG files using cairo as a rendering engine. For example, you can 
render SVG to in-memory RGBA surfaces, or to PDF streams.

Trivia: rsvg stands for "Resplendent SVG".

Website: https://wiki.gnome.org/Projects/LibRsvg

In order to use gid:rsvg2 you need the following:

```
sudo dnf install librsvg2-devel
```

Soup 3
------

`sudo dnf install libsoup3-devel` is needed if you want to use gid:soup3

Adwaita
-------

For gid:libadwaita1 you need the following:

`sudo dnf install libadwaita-devel`

Panel
-----

For gid:panel1 you need the following:

`sudo dnf install libpanel-devel`

WebKitGTK
---------

For gid:webkitgtk6 you need the following:

`sudo dnf install webkitgtk6.0-devel`

( Will install the `javascriptcoregtk6.0-devel` package as it depends on it. )

GMime 3
-------

For gid:gmime3 you need the following:

`sudo dnf install gmime30-devel`
