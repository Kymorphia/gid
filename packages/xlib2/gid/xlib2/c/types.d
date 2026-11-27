/// C types for xlib2 library
module gid.xlib2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;

/// GIR namespace of the binding (used to export D-defined GObject types to GIR)
enum string _gidGirNamespace = "xlib";

/// GIR namespace version of the binding
enum string _gidGirVersion = "2.0";

/// C headers of the binding library (included by the C headers of D libraries using its types)
enum string[] _gidGirCIncludes = [];

/** */
alias Atom = gulong;

/** */
alias Colormap = gulong;

/** */
alias Cursor = gulong;

/** */
alias Drawable = gulong;

/** */
alias GC = void*;

/** */
alias KeyCode = ubyte;

/** */
alias KeySym = gulong;

/** */
alias Picture = gulong;

/** */
alias Time = gulong;

/** */
alias VisualID = gulong;

/** */
alias Window = gulong;

/** */
alias XID = gulong;

/** */
alias Pixmap = gulong;

/** */
@gidGir("Display")
struct Display;

/** */
@gidGir("Screen")
struct Screen;

/** */
@gidGir("Visual")
struct Visual;

/** */
@gidGir("XConfigureEvent")
struct XConfigureEvent;

/** */
@gidGir("XEvent")
struct XEvent;

/** */
@gidGir("XFontStruct")
struct XFontStruct;

/** */
@gidGir("XImage")
struct XImage;

/** */
@gidGir("XTrapezoid")
struct XTrapezoid;

/** */
@gidGir("XVisualInfo")
struct XVisualInfo;

/** */
@gidGir("XWindowAttributes")
struct XWindowAttributes;

