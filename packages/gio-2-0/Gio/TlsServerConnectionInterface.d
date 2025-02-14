module Gio.TlsServerConnectionInterface;

import GObject.TypeInterface;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * vtable for a #GTlsServerConnection implementation.
 */
class TlsServerConnectionInterface
{
  GTlsServerConnectionInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.TlsServerConnectionInterface");

    cInstance = *cast(GTlsServerConnectionInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface gIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GTlsServerConnectionInterface*)cPtr).gIface);
  }
}
