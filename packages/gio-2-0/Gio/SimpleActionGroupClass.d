module Gio.SimpleActionGroupClass;

import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class SimpleActionGroupClass
{
  GSimpleActionGroupClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.SimpleActionGroupClass");

    cInstance = *cast(GSimpleActionGroupClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }
}
