module Gio.DBusObjectProxyClass;

import GObject.ObjectClass;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Class structure for #GDBusObjectProxy.
 */
class DBusObjectProxyClass
{
  GDBusObjectProxyClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.DBusObjectProxyClass");

    cInstance = *cast(GDBusObjectProxyClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GDBusObjectProxyClass*)cPtr).parentClass);
  }
}
