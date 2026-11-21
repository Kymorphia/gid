/// C functions for xlib2 library
module gid.xlib2.c.functions;

public import gid.core.basictypes;
import gid.core.loader;
import gid.xlib2.c.types;
public import gid.glib2.c.types;

private immutable LIBS = ["X11_6"];

// global
private alias c_XOpenDisplayFn = extern(C) void function() nothrow;
__gshared c_XOpenDisplayFn c_XOpenDisplay; ///

// global

/** */
alias XOpenDisplay = c_XOpenDisplay;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // global
  gidLink(cast(void**)&XOpenDisplay, "XOpenDisplay", libs);
}
