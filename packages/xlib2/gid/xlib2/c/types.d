/// C types for xlib2 library
module gid.xlib2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;

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
struct Display;

/** */
struct Screen;

/** */
struct Visual;

/** */
struct XConfigureEvent;

/** */
struct XEvent;

/** */
struct XFontStruct;

/** */
struct XImage;

/** */
struct XTrapezoid;

/** */
struct XVisualInfo;

/** */
struct XWindowAttributes;

