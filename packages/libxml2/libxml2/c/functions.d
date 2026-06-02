/// C functions for libxml2 library
module libxml2.c.functions;

public import gid.basictypes;
import gid.loader;
import libxml2.c.types;
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
