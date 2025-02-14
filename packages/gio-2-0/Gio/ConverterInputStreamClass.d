module Gio.ConverterInputStreamClass;

import Gid.gid;
import Gio.FilterInputStreamClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class ConverterInputStreamClass
{
  GConverterInputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.ConverterInputStreamClass");

    cInstance = *cast(GConverterInputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FilterInputStreamClass parentClass()
  {
    return new FilterInputStreamClass(cast(GFilterInputStreamClass*)&(cast(GConverterInputStreamClass*)cPtr).parentClass);
  }
}
