module Gio.DBusObjectManagerClientClass;

import GObject.ObjectClass;
import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Class structure for #GDBusObjectManagerClient.
 */
class DBusObjectManagerClientClass
{
  GDBusObjectManagerClientClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.DBusObjectManagerClientClass");

    cInstance = *cast(GDBusObjectManagerClientClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property ObjectClass parentClass()
  {
    return new ObjectClass(cast(GObjectClass*)&(cast(GDBusObjectManagerClientClass*)cPtr).parentClass);
  }

  alias InterfaceProxySignalFuncType = extern(C) void function(GDBusObjectManagerClient* manager, GDBusObjectProxy* objectProxy, GDBusProxy* interfaceProxy, const(char)* senderName, const(char)* signalName, VariantC* parameters);

  @property InterfaceProxySignalFuncType interfaceProxySignal()
  {
    return (cast(GDBusObjectManagerClientClass*)cPtr).interfaceProxySignal;
  }

  alias InterfaceProxyPropertiesChangedFuncType = extern(C) void function(GDBusObjectManagerClient* manager, GDBusObjectProxy* objectProxy, GDBusProxy* interfaceProxy, VariantC* changedProperties, const(char*)* invalidatedProperties);

  @property InterfaceProxyPropertiesChangedFuncType interfaceProxyPropertiesChanged()
  {
    return (cast(GDBusObjectManagerClientClass*)cPtr).interfaceProxyPropertiesChanged;
  }
}
