/// Module for [DBusInterfaceIfaceProxy] interface proxy object
module gid.gio2.dbus_interface_iface_proxy;

import gid.gobject2.object;
import gid.gio2.dbus_interface;
import gid.gio2.dbus_interface_mixin;

/// Proxy object for [gid.gio2.dbus_interface.DBusInterface] interface when a GObject has no applicable D binding
class DBusInterfaceIfaceProxy : IfaceProxy, gid.gio2.dbus_interface.DBusInterface
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.dbus_interface.DBusInterface);
  }

  mixin DBusInterfaceT!();
}
