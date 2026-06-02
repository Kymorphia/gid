/// C functions for freetype2 library
module freetype2.c.functions;

public import gid.basictypes;
import gid.loader;
import freetype2.c.types;
public import glib.c.types;

version(Windows)
  private immutable LIBS = [];
else version(OSX)
  private immutable LIBS = [];
else
  private immutable LIBS = [];

__gshared extern(C) nothrow
{
}

shared static this()
{
}
