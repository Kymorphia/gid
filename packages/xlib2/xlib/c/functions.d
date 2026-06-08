/// C functions for xlib2 library
module xlib.c.functions;

public import gid.basictypes;
import gid.loader;
import xlib.c.types;
public import glib.c.types;

version(Windows)
  private immutable LIBS = ["libX11-6.dll;X11-6.dll;X11.dll"];
else version(OSX)
  private immutable LIBS = ["libX11.6.dylib"];
else
  private immutable LIBS = ["libX11.so.6;libX11.so"];

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
