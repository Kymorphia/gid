/// Module for [DBusObjectIfaceProxy] interface proxy object
module gio.dbus_object_iface_proxy;

import gobject.object;
import gio.dbus_object;
import gio.dbus_object_mixin;

/// Proxy object for [gio.dbus_object.DBusObject] interface when a GObject has no applicable D binding
class DBusObjectIfaceProxy : IfaceProxy, gio.dbus_object.DBusObject
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.dbus_object.DBusObject);
  }

  mixin DBusObjectT!();
}
