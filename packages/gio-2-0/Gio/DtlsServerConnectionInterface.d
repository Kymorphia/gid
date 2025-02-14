module Gio.DtlsServerConnectionInterface;

import GObject.TypeInterface;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * vtable for a #GDtlsServerConnection implementation.
 */
class DtlsServerConnectionInterface
{
  GDtlsServerConnectionInterface cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.DtlsServerConnectionInterface");

    cInstance = *cast(GDtlsServerConnectionInterface*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property TypeInterface gIface()
  {
    return new TypeInterface(cast(GTypeInterface*)&(cast(GDtlsServerConnectionInterface*)cPtr).gIface);
  }
}
