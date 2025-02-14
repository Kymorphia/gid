module Gio.FilterInputStreamClass;

import Gid.gid;
import Gio.InputStreamClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class FilterInputStreamClass
{
  GFilterInputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.FilterInputStreamClass");

    cInstance = *cast(GFilterInputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property InputStreamClass parentClass()
  {
    return new InputStreamClass(cast(GInputStreamClass*)&(cast(GFilterInputStreamClass*)cPtr).parentClass);
  }
}
