/// Module for [DBusObjectIfaceProxy] interface proxy object
module gid.gio2.dbus_object_iface_proxy;

import gid.gobject2.object;
import gid.gio2.dbus_object;
import gid.gio2.dbus_object_mixin;

/// Proxy object for [gid.gio2.dbus_object.DBusObject] interface when a GObject has no applicable D binding
class DBusObjectIfaceProxy : IfaceProxy, gid.gio2.dbus_object.DBusObject
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.dbus_object.DBusObject);
  }

  mixin DBusObjectT!();
}
