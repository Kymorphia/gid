/// Module for [DBusInterface] interface
module gid.gio2.dbus_interface;

public import gid.core.basictypes;
public import gid.gio2.dbus_interface_iface_proxy;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_interface_info;
import gid.gio2.dbus_object;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Base type for D-Bus interfaces.
    
    The [gid.gio2.dbus_interface.DBusInterface] type is the base type for D-Bus interfaces both
    on the service side (see [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton]) and client side
    (see [gid.gio2.dbus_proxy.DBusProxy]).
*/
interface DBusInterface : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_interface_get_type != &gidSymbolNotFound ? g_dbus_interface_get_type() : cast(GType)0;
  }




  /**
      Gets the #GDBusObject that interface_ belongs to, if any.
      Returns: A #GDBusObject or null. The returned
        reference should be freed with [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.dbus_object.DBusObject getObject();

  /**
      Gets D-Bus introspection information for the D-Bus interface
      implemented by interface_.
      
      This can return null if no #GDBusInterfaceInfo was provided during
      construction of interface_ and is also not made available otherwise.
      For example, #GDBusProxy implements #GDBusInterface but allows for a null
      #GDBusInterfaceInfo.
      Returns: A #GDBusInterfaceInfo. Do not free.
  */
  gid.gio2.dbus_interface_info.DBusInterfaceInfo getInfo();

  /**
      Sets the #GDBusObject for interface_ to object.
      
      Note that interface_ will hold a weak reference to object.
  
      Params:
        object = A #GDBusObject or null.
  */
  void setObject(gid.gio2.dbus_object.DBusObject object = null);
}

/// Fluent builder implementation template for [gid.gio2.dbus_interface.DBusInterface]
interface DBusInterfaceGidBuilderImpl(T)
{
}
