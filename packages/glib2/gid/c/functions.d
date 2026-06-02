/// C functions for gid library
module gid.c.functions;

public import gid.basictypes;
import gid.loader;
import gid.c.types;

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
