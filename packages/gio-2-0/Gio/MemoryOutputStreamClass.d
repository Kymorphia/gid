module Gio.MemoryOutputStreamClass;

import Gid.gid;
import Gio.OutputStreamClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class MemoryOutputStreamClass
{
  GMemoryOutputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.MemoryOutputStreamClass");

    cInstance = *cast(GMemoryOutputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property OutputStreamClass parentClass()
  {
    return new OutputStreamClass(cast(GOutputStreamClass*)&(cast(GMemoryOutputStreamClass*)cPtr).parentClass);
  }
}
