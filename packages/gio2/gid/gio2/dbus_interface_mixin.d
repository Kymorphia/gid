/// Module for [DBusInterface] interface mixin
module gid.gio2.dbus_interface_mixin;

public import gid.core.basictypes;
public import gid.gio2.dbus_interface_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.dbus_interface_info;
public import gid.gio2.dbus_object;
public import gid.gio2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDupObject`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.dbus_object.DBusObject vfuncDupObject()
  {
    auto _klass = cast(GDBusInterfaceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_interface.DBusInterface._getGType);
    if (!_klass || !_klass.dupObject)
      return typeof(return).init;

    GDBusObject* _cretval;
    _cretval = _klass.dupObject(cast(GDBusInterface*)this._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncDBusInterfaceGetInfo`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.dbus_interface_info.DBusInterfaceInfo vfuncDBusInterfaceGetInfo()
  {
    auto _klass = cast(GDBusInterfaceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_interface.DBusInterface._getGType);
    if (!_klass || !_klass.getInfo)
      return typeof(return).init;

    GDBusInterfaceInfo* _cretval;
    _cretval = _klass.getInfo(cast(GDBusInterface*)this._cPtr);
    auto _retval = _cretval ? new gid.gio2.dbus_interface_info.DBusInterfaceInfo(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Sets the #GDBusObject for interface_ to object.
      
      Note that interface_ will hold a weak reference to object.
  
      Params:
        object = A #GDBusObject or null.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetObject`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetObject(gid.gio2.dbus_object.DBusObject object = null)
  {
    auto _klass = cast(GDBusInterfaceIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_interface.DBusInterface._getGType);
    if (!_klass || !_klass.setObject)
      return;

    _klass.setObject(cast(GDBusInterface*)this._cPtr, object ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)object)._cPtr(No.Dup) : null);
  }

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

  /// True if the D class T overrides any vfunc method of gid.gio2.dbus_interface.DBusInterface (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_dbus_interface_DBusInterface(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDupObject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDBusInterfaceGetInfo", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetObject", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.dbus_interface.DBusInterface vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_dbus_interface_DBusInterface(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDupObject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_interface_DBusInterface(iface, "dup_object");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncDBusInterfaceGetInfo", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_interface_DBusInterface(iface, "get_info");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetObject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_interface_DBusInterface(iface, "set_object");
  }

  private static void _installIfaceVfunc_gid_gio2_dbus_interface_DBusInterface(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GDBusInterfaceIface*)iface;

    switch (vfunc)
    {
      case "dup_object":
      {
        static extern(C) GDBusObject* _vfuncDupObjectTramp(GDBusInterface* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interface_);
          if (!_obj)
          {
            auto _klass = cast(GDBusInterfaceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interface_), gid.gio2.dbus_interface.DBusInterface._getGType);
            if (_klass && _klass.dupObject)
              return (cast(typeof(&_vfuncDupObjectTramp))_klass.dupObject)(interface_);
            return typeof(return).init;
          }

          gid.gio2.dbus_object.DBusObject _dretval;

          try
          {
            _dretval = _obj.vfuncDupObject();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface.DBusInterface.vfuncDupObject");
          }
          auto _retval = _dretval ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.dupObject = cast(typeof(_klass.dupObject))&_vfuncDupObjectTramp;
        break;
      }
      case "get_info":
      {
        static extern(C) GDBusInterfaceInfo* _vfuncDBusInterfaceGetInfoTramp(GDBusInterface* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interface_);
          if (!_obj)
          {
            auto _klass = cast(GDBusInterfaceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interface_), gid.gio2.dbus_interface.DBusInterface._getGType);
            if (_klass && _klass.getInfo)
              return (cast(typeof(&_vfuncDBusInterfaceGetInfoTramp))_klass.getInfo)(interface_);
            return typeof(return).init;
          }

          gid.gio2.dbus_interface_info.DBusInterfaceInfo _dretval;

          try
          {
            _dretval = _obj.vfuncDBusInterfaceGetInfo();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface.DBusInterface.vfuncDBusInterfaceGetInfo");
          }
          auto _retval = _dretval ? cast(GDBusInterfaceInfo*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getInfo = cast(typeof(_klass.getInfo))&_vfuncDBusInterfaceGetInfoTramp;
        break;
      }
      case "set_object":
      {
        static extern(C) void _vfuncSetObjectTramp(GDBusInterface* interface_, GDBusObject* object) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)interface_);
          if (!_obj)
          {
            auto _klass = cast(GDBusInterfaceIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)interface_), gid.gio2.dbus_interface.DBusInterface._getGType);
            if (_klass && _klass.setObject)
              return (cast(typeof(&_vfuncSetObjectTramp))_klass.setObject)(interface_, object);
            return;
          }

          try
          {
            _obj.vfuncSetObject(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(void*)object, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_interface.DBusInterface.vfuncSetObject");
          }
        }

        _klass.setObject = cast(typeof(_klass.setObject))&_vfuncSetObjectTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_interface.DBusInterface]
template DBusInterfaceGidBuilderT()
{
}
