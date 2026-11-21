/// Module for [DBusObjectManagerIfaceProxy] interface proxy object
module gid.gio2.dbus_object_manager_iface_proxy;

import gid.gobject2.object;
import gid.gio2.dbus_object_manager;
import gid.gio2.dbus_object_manager_mixin;

/// Proxy object for [gid.gio2.dbus_object_manager.DBusObjectManager] interface when a GObject has no applicable D binding
class DBusObjectManagerIfaceProxy : IfaceProxy, gid.gio2.dbus_object_manager.DBusObjectManager
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.dbus_object_manager.DBusObjectManager);
  }

  mixin DBusObjectManagerT!();
}
