/// C functions for xlib2 library
module xlib.c.functions;

public import gid.basictypes;
import gid.loader;
import xlib.c.types;
public import glib.c.types;

private immutable LIBS = ["X11_6"];

__gshared extern(C) nothrow
{
  // global
  void function() c_XOpenDisplay; ///
}

// global

/** */
alias XOpenDisplay = c_XOpenDisplay;

shared static this()
{
  auto libs = gidResolveLibs(LIBS);

  // global
  gidLink(cast(void**)&XOpenDisplay, "XOpenDisplay", libs);
}
