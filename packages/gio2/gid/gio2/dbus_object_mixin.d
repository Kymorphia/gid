/// Module for [DBusObject] interface mixin
module gid.gio2.dbus_object_mixin;

public import gid.core.basictypes;
public import gid.gio2.dbus_object;
public import gid.gio2.dbus_object_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.dbus_interface;
public import gid.gio2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The [gid.gio2.dbus_object.DBusObject] type is the base type for D-Bus objects on both
    the service side (see [gid.gio2.dbus_object_skeleton.DBusObjectSkeleton]) and the client side
    (see [gid.gio2.dbus_object_proxy.DBusObjectProxy]). It is essentially just a container of
    interfaces.
*/
template DBusObjectT()
{

  /**
      Gets the D-Bus interface with name interface_name associated with
      object, if any.
  
      Params:
        interfaceName = A D-Bus interface name.
      Returns: null if not found, otherwise a
          #GDBusInterface that must be freed with [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInterface`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.dbus_interface.DBusInterface vfuncGetInterface(string interfaceName)
  {
    auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object.DBusObject._getGType);
    if (!_klass || !_klass.getInterface)
      return typeof(return).init;

    GDBusInterface* _cretval;
    const(char)* _interfaceName = interfaceName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getInterface(cast(GDBusObject*)this._cPtr, _interfaceName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(GDBusInterface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the D-Bus interfaces associated with object.
      Returns: A list of #GDBusInterface instances.
          The returned list must be freed by [gid.glib2.list.List.free] after each element has been freed
          with [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInterfaces`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.dbus_interface.DBusInterface[] vfuncGetInterfaces()
  {
    auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object.DBusObject._getGType);
    if (!_klass || !_klass.getInterfaces)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getInterfaces(cast(GDBusObject*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.dbus_interface.DBusInterface, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the object path for object.
      Returns: A string owned by object. Do not free.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetObjectPath`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetObjectPath()
  {
    auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object.DBusObject._getGType);
    if (!_klass || !_klass.getObjectPath)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getObjectPath(cast(GDBusObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Signal handler for the #GDBusObject::interface-added signal.
  
      Params:
        interface_ = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncInterfaceAdded`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncInterfaceAdded(gid.gio2.dbus_interface.DBusInterface interface_)
  {
    auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object.DBusObject._getGType);
    if (!_klass || !_klass.interfaceAdded)
      return;

    _klass.interfaceAdded(cast(GDBusObject*)this._cPtr, interface_ ? cast(GDBusInterface*)(cast(gid.gobject2.object.ObjectWrap)interface_)._cPtr(No.Dup) : null);
  }

  /**
      Signal handler for the #GDBusObject::interface-removed signal.
  
      Params:
        interface_ = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncInterfaceRemoved`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncInterfaceRemoved(gid.gio2.dbus_interface.DBusInterface interface_)
  {
    auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object.DBusObject._getGType);
    if (!_klass || !_klass.interfaceRemoved)
      return;

    _klass.interfaceRemoved(cast(GDBusObject*)this._cPtr, interface_ ? cast(GDBusInterface*)(cast(gid.gobject2.object.ObjectWrap)interface_)._cPtr(No.Dup) : null);
  }

  /**
      Gets the D-Bus interface with name interface_name associated with
      object, if any.
  
      Params:
        interfaceName = A D-Bus interface name.
      Returns: null if not found, otherwise a
          #GDBusInterface that must be freed with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.dbus_interface.DBusInterface getInterface(string interfaceName) nothrow
  {
    GDBusInterface* _cretval;
    const(char)* _interfaceName = interfaceName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_object_get_interface(cast(GDBusObject*)this._cPtr, _interfaceName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(GDBusInterface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the D-Bus interfaces associated with object.
      Returns: A list of #GDBusInterface instances.
          The returned list must be freed by [gid.glib2.list.List.free] after each element has been freed
          with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.dbus_interface.DBusInterface[] getInterfaces() nothrow
  {
    GList* _cretval;
    _cretval = g_dbus_object_get_interfaces(cast(GDBusObject*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.dbus_interface.DBusInterface, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the object path for object.
      Returns: A string owned by object. Do not free.
  */
  override string getObjectPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_object_get_object_path(cast(GDBusObject*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Connect to `InterfaceAdded` signal.
  
      Emitted when interface is added to object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_interface.DBusInterface interface_, gid.gio2.dbus_object.DBusObject dBusObject)`
  
          `interface_` The #GDBusInterface that was added. (optional)
  
          `dBusObject` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_object.DBusObject)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object.DBusObject.interfaceAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-added", closure, after);
  }

  /**
      Connect to `InterfaceRemoved` signal.
  
      Emitted when interface is removed from object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_interface.DBusInterface interface_, gid.gio2.dbus_object.DBusObject dBusObject)`
  
          `interface_` The #GDBusInterface that was removed. (optional)
  
          `dBusObject` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_object.DBusObject)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object.DBusObject.interfaceRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-removed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.dbus_object.DBusObject (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_dbus_object_DBusObject(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInterface", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInterfaces", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObjectPath", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceAdded", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.dbus_object.DBusObject vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_dbus_object_DBusObject(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInterface", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_DBusObject(iface, "get_interface");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInterfaces", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_DBusObject(iface, "get_interfaces");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObjectPath", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.dbus_object.DBusObject.vfuncGetObjectPath is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceAdded", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_DBusObject(iface, "interface_added");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_DBusObject(iface, "interface_removed");
  }

  private static void _installIfaceVfunc_gid_gio2_dbus_object_DBusObject(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GDBusObjectIface*)iface;

    switch (vfunc)
    {
      case "get_interface":
      {
        static extern(C) GDBusInterface* _vfuncGetInterfaceTramp(GDBusObject* object, const(char)* interfaceName) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object), gid.gio2.dbus_object.DBusObject._getGType);
            if (_klass && _klass.getInterface)
              return (cast(typeof(&_vfuncGetInterfaceTramp))_klass.getInterface)(object, interfaceName);
            return typeof(return).init;
          }

          gid.gio2.dbus_interface.DBusInterface _dretval;
          string _interfaceName = interfaceName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetInterface(_interfaceName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object.DBusObject.vfuncGetInterface");
          }
          auto _retval = _dretval ? cast(GDBusInterface*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getInterface = cast(typeof(_klass.getInterface))&_vfuncGetInterfaceTramp;
        break;
      }
      case "get_interfaces":
      {
        static extern(C) GList* _vfuncGetInterfacesTramp(GDBusObject* object) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object), gid.gio2.dbus_object.DBusObject._getGType);
            if (_klass && _klass.getInterfaces)
              return (cast(typeof(&_vfuncGetInterfacesTramp))_klass.getInterfaces)(object);
            return typeof(return).init;
          }

          gid.gio2.dbus_interface.DBusInterface[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetInterfaces();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object.DBusObject.vfuncGetInterfaces");
          }
          auto _retval = gListFromD!(gid.gio2.dbus_interface.DBusInterface)(_dretval);

          return _retval;
        }

        _klass.getInterfaces = cast(typeof(_klass.getInterfaces))&_vfuncGetInterfacesTramp;
        break;
      }
      case "interface_added":
      {
        static extern(C) void _vfuncInterfaceAddedTramp(GDBusObject* object, GDBusInterface* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object), gid.gio2.dbus_object.DBusObject._getGType);
            if (_klass && _klass.interfaceAdded)
              return (cast(typeof(&_vfuncInterfaceAddedTramp))_klass.interfaceAdded)(object, interface_);
            return;
          }

          try
          {
            _obj.vfuncInterfaceAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(void*)interface_, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object.DBusObject.vfuncInterfaceAdded");
          }
        }

        _klass.interfaceAdded = cast(typeof(_klass.interfaceAdded))&_vfuncInterfaceAddedTramp;
        break;
      }
      case "interface_removed":
      {
        static extern(C) void _vfuncInterfaceRemovedTramp(GDBusObject* object, GDBusInterface* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object), gid.gio2.dbus_object.DBusObject._getGType);
            if (_klass && _klass.interfaceRemoved)
              return (cast(typeof(&_vfuncInterfaceRemovedTramp))_klass.interfaceRemoved)(object, interface_);
            return;
          }

          try
          {
            _obj.vfuncInterfaceRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(void*)interface_, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object.DBusObject.vfuncInterfaceRemoved");
          }
        }

        _klass.interfaceRemoved = cast(typeof(_klass.interfaceRemoved))&_vfuncInterfaceRemovedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_object.DBusObject]
template DBusObjectGidBuilderT()
{
}
