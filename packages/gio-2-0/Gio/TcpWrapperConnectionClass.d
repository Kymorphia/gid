module Gio.TcpWrapperConnectionClass;

import Gid.gid;
import Gio.TcpConnectionClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class TcpWrapperConnectionClass
{
  GTcpWrapperConnectionClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.TcpWrapperConnectionClass");

    cInstance = *cast(GTcpWrapperConnectionClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TcpConnectionClass parentClass()
  {
    return new TcpConnectionClass(cast(GTcpConnectionClass*)&(cast(GTcpWrapperConnectionClass*)cPtr).parentClass);
  }
}
