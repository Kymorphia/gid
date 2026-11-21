/// Module for [DBusInterface] interface mixin
module gid.gio2.dbus_interface_mixin;

public import gid.core.basictypes;
public import gid.gio2.dbus_interface_iface_proxy;
public import gid.core.gid;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.dbus_interface_info;
public import gid.gio2.dbus_object;
public import gid.gio2.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    Base type for D-Bus interfaces.
    
    The [gid.gio2.dbus_interface.DBusInterface] type is the base type for D-Bus interfaces both
    on the service side (see [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton]) and client side
    (see [gid.gio2.dbus_proxy.DBusProxy]).
*/
template DBusInterfaceT()
{

  /**
      Gets the #GDBusObject that interface_ belongs to, if any.
      Returns: A #GDBusObject or null. The returned
        reference should be freed with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.dbus_object.DBusObject getObject() nothrow
  {
    GDBusObject* _cretval;
    _cretval = g_dbus_interface_dup_object(cast(GDBusInterface*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(GDBusObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets D-Bus introspection information for the D-Bus interface
      implemented by interface_.
      
      This can return null if no #GDBusInterfaceInfo was provided during
      construction of interface_ and is also not made available otherwise.
      For example, #GDBusProxy implements #GDBusInterface but allows for a null
      #GDBusInterfaceInfo.
      Returns: A #GDBusInterfaceInfo. Do not free.
  */
  override gid.gio2.dbus_interface_info.DBusInterfaceInfo getInfo() nothrow
  {
    GDBusInterfaceInfo* _cretval;
    _cretval = g_dbus_interface_get_info(cast(GDBusInterface*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the #GDBusObject for interface_ to object.
      
      Note that interface_ will hold a weak reference to object.
  
      Params:
        object = A #GDBusObject or null.
  */
  override void setObject(gid.gio2.dbus_object.DBusObject object = null) nothrow
  {
    g_dbus_interface_set_object(cast(GDBusInterface*)this._cPtr, object ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)object)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_interface.DBusInterface]
template DBusInterfaceGidBuilderT()
{
}
