/// Module for [DBusInterface] interface mixin
module gio.dbus_interface_mixin;

public import gio.dbus_interface_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.dbus_interface_info;
public import gio.dbus_object;
public import gio.types;
public import gobject.gid_builder;
public import gobject.object;

/**
    Base type for D-Bus interfaces.
    
    The [gio.dbus_interface.DBusInterface] type is the base type for D-Bus interfaces both
    on the service side (see [gio.dbus_interface_skeleton.DBusInterfaceSkeleton]) and client side
    (see [gio.dbus_proxy.DBusProxy]).
*/
template DBusInterfaceT()
{

  /**
      Gets the #GDBusObject that interface_ belongs to, if any.
      Returns: A #GDBusObject or null. The returned
        reference should be freed with [gobject.object.ObjectWrap.unref].
  */
  override gio.dbus_object.DBusObject getObject()
  {
    GDBusObject* _cretval;
    _cretval = g_dbus_interface_dup_object(cast(GDBusInterface*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_object.DBusObject)(cast(GDBusObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets D-Bus introspection information for the D-Bus interface
      implemented by interface_.
      Returns: A #GDBusInterfaceInfo. Do not free.
  */
  override gio.dbus_interface_info.DBusInterfaceInfo getInfo()
  {
    GDBusInterfaceInfo* _cretval;
    _cretval = g_dbus_interface_get_info(cast(GDBusInterface*)this._cPtr);
    auto _retval = _cretval ? new gio.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the #GDBusObject for interface_ to object.
      
      Note that interface_ will hold a weak reference to object.
  
      Params:
        object = A #GDBusObject or null.
  */
  override void setObject(gio.dbus_object.DBusObject object = null)
  {
    g_dbus_interface_set_object(cast(GDBusInterface*)this._cPtr, object ? cast(GDBusObject*)(cast(gobject.object.ObjectWrap)object)._cPtr(No.Dup) : null);
  }
}

template DBusInterfaceGidBuilderT()
{
}
