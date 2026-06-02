/// Module for [DBusInterfaceIfaceProxy] interface proxy object
module gio.dbus_interface_iface_proxy;

import gobject.object;
import gio.dbus_interface;
import gio.dbus_interface_mixin;

/// Proxy object for [gio.dbus_interface.DBusInterface] interface when a GObject has no applicable D binding
class DBusInterfaceIfaceProxy : IfaceProxy, gio.dbus_interface.DBusInterface
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.dbus_interface.DBusInterface);
  }

  mixin DBusInterfaceT!();
}
