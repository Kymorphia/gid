/// Module for [DBusObjectManager] interface mixin
module gid.gio2.dbus_object_manager_mixin;

public import gid.core.basictypes;
public import gid.gio2.dbus_object_manager;
public import gid.gio2.dbus_object_manager_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.dbus_interface;
public import gid.gio2.dbus_object;
public import gid.gio2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    The [gid.gio2.dbus_object_manager.DBusObjectManager] type is the base type for service- and
    client-side implementations of the standardized
    [`org.freedesktop.DBus.ObjectManager`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface.
    
    See [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] for the client-side implementation
    and [gid.gio2.dbus_object_manager_server.DBusObjectManagerServer] for the service-side implementation.
*/
template DBusObjectManagerT()
{

  /**
      Gets the interface proxy for interface_name at object_path, if
      any.
  
      Params:
        objectPath = Object path to look up.
        interfaceName = D-Bus interface name to look up.
      Returns: A #GDBusInterface instance or null. Free
          with [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetInterface`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.dbus_interface.DBusInterface vfuncGetInterface(string objectPath, string interfaceName)
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.getInterface)
      return typeof(return).init;

    GDBusInterface* _cretval;
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    const(char)* _interfaceName = interfaceName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getInterface(cast(GDBusObjectManager*)this._cPtr, _objectPath, _interfaceName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(GDBusInterface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #GDBusObject at object_path, if any.
  
      Params:
        objectPath = Object path to look up.
      Returns: A #GDBusObject or null. Free with
          [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetObject`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.dbus_object.DBusObject vfuncGetObject(string objectPath)
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.getObject)
      return typeof(return).init;

    GDBusObject* _cretval;
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getObject(cast(GDBusObjectManager*)this._cPtr, _objectPath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(GDBusObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the object path that manager is for.
      Returns: A string owned by manager. Do not free.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetObjectPath`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetObjectPath()
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.getObjectPath)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getObjectPath(cast(GDBusObjectManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets all #GDBusObject objects known to manager.
      Returns: A list of
          #GDBusObject objects. The returned list should be freed with
          [gid.glib2.list.List.free] after each element has been freed with
          [gid.gobject2.object.ObjectWrap.unref].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetObjects`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.dbus_object.DBusObject[] vfuncGetObjects()
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.getObjects)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getObjects(cast(GDBusObjectManager*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.dbus_object.DBusObject, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Signal handler for the #GDBusObjectManager::interface-added signal.
  
      Params:
        object = 
        interface_ = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncInterfaceAdded`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncInterfaceAdded(gid.gio2.dbus_object.DBusObject object, gid.gio2.dbus_interface.DBusInterface interface_)
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.interfaceAdded)
      return;

    _klass.interfaceAdded(cast(GDBusObjectManager*)this._cPtr, object ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)object)._cPtr(No.Dup) : null, interface_ ? cast(GDBusInterface*)(cast(gid.gobject2.object.ObjectWrap)interface_)._cPtr(No.Dup) : null);
  }

  /**
      Signal handler for the #GDBusObjectManager::interface-removed signal.
  
      Params:
        object = 
        interface_ = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncInterfaceRemoved`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncInterfaceRemoved(gid.gio2.dbus_object.DBusObject object, gid.gio2.dbus_interface.DBusInterface interface_)
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.interfaceRemoved)
      return;

    _klass.interfaceRemoved(cast(GDBusObjectManager*)this._cPtr, object ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)object)._cPtr(No.Dup) : null, interface_ ? cast(GDBusInterface*)(cast(gid.gobject2.object.ObjectWrap)interface_)._cPtr(No.Dup) : null);
  }

  /**
      Signal handler for the #GDBusObjectManager::object-added signal.
  
      Params:
        object = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncObjectAdded`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncObjectAdded(gid.gio2.dbus_object.DBusObject object)
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.objectAdded)
      return;

    _klass.objectAdded(cast(GDBusObjectManager*)this._cPtr, object ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)object)._cPtr(No.Dup) : null);
  }

  /**
      Signal handler for the #GDBusObjectManager::object-removed signal.
  
      Params:
        object = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncObjectRemoved`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncObjectRemoved(gid.gio2.dbus_object.DBusObject object)
  {
    auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
    if (!_klass || !_klass.objectRemoved)
      return;

    _klass.objectRemoved(cast(GDBusObjectManager*)this._cPtr, object ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)object)._cPtr(No.Dup) : null);
  }

  /**
      Gets the interface proxy for interface_name at object_path, if
      any.
  
      Params:
        objectPath = Object path to look up.
        interfaceName = D-Bus interface name to look up.
      Returns: A #GDBusInterface instance or null. Free
          with [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.dbus_interface.DBusInterface getInterface(string objectPath, string interfaceName) nothrow
  {
    GDBusInterface* _cretval;
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    const(char)* _interfaceName = interfaceName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_object_manager_get_interface(cast(GDBusObjectManager*)this._cPtr, _objectPath, _interfaceName);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(GDBusInterface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #GDBusObject at object_path, if any.
  
      Params:
        objectPath = Object path to look up.
      Returns: A #GDBusObject or null. Free with
          [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.dbus_object.DBusObject getObject(string objectPath) nothrow
  {
    GDBusObject* _cretval;
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_object_manager_get_object(cast(GDBusObjectManager*)this._cPtr, _objectPath);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(GDBusObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the object path that manager is for.
      Returns: A string owned by manager. Do not free.
  */
  override string getObjectPath() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_object_manager_get_object_path(cast(GDBusObjectManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets all #GDBusObject objects known to manager.
      Returns: A list of
          #GDBusObject objects. The returned list should be freed with
          [gid.glib2.list.List.free] after each element has been freed with
          [gid.gobject2.object.ObjectWrap.unref].
  */
  override gid.gio2.dbus_object.DBusObject[] getObjects() nothrow
  {
    GList* _cretval;
    _cretval = g_dbus_object_manager_get_objects(cast(GDBusObjectManager*)this._cPtr);
    auto _retval = gListToD!(gid.gio2.dbus_object.DBusObject, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Connect to `InterfaceAdded` signal.
  
      Emitted when interface is added to object.
        
        This signal exists purely as a convenience to avoid having to
        connect signals to all objects managed by manager.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_object.DBusObject object, gid.gio2.dbus_interface.DBusInterface interface_, gid.gio2.dbus_object_manager.DBusObjectManager dBusObjectManager)`
  
          `object` The #GDBusObject on which an interface was added. (optional)
  
          `interface_` The #GDBusInterface that was added. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.dbus_object_manager.DBusObjectManager)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.interfaceAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-added", closure, after);
  }

  /**
      Connect to `InterfaceRemoved` signal.
  
      Emitted when interface has been removed from object.
        
        This signal exists purely as a convenience to avoid having to
        connect signals to all objects managed by manager.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_object.DBusObject object, gid.gio2.dbus_interface.DBusInterface interface_, gid.gio2.dbus_object_manager.DBusObjectManager dBusObjectManager)`
  
          `object` The #GDBusObject on which an interface was removed. (optional)
  
          `interface_` The #GDBusInterface that was removed. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.dbus_object_manager.DBusObjectManager)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.interfaceRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-removed", closure, after);
  }

  /**
      Connect to `ObjectAdded` signal.
  
      Emitted when object is added to manager.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_object.DBusObject object, gid.gio2.dbus_object_manager.DBusObjectManager dBusObjectManager)`
  
          `object` The #GDBusObject that was added. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectObjectAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_object_manager.DBusObjectManager)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.objectAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-added", closure, after);
  }

  /**
      Connect to `ObjectRemoved` signal.
  
      Emitted when object is removed from manager.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.dbus_object.DBusObject object, gid.gio2.dbus_object_manager.DBusObjectManager dBusObjectManager)`
  
          `object` The #GDBusObject that was removed. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectObjectRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_object_manager.DBusObjectManager)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.objectRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-removed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.dbus_object_manager.DBusObjectManager (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_dbus_object_manager_DBusObjectManager(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInterface", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObjectPath", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObjects", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceAdded", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncObjectAdded", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncObjectRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.dbus_object_manager.DBusObjectManager vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_dbus_object_manager_DBusObjectManager(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetInterface", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(iface, "get_interface");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(iface, "get_object");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObjectPath", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.dbus_object_manager.DBusObjectManager.vfuncGetObjectPath is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetObjects", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(iface, "get_objects");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceAdded", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(iface, "interface_added");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInterfaceRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(iface, "interface_removed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncObjectAdded", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(iface, "object_added");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncObjectRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(iface, "object_removed");
  }

  private static void _installIfaceVfunc_gid_gio2_dbus_object_manager_DBusObjectManager(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GDBusObjectManagerIface*)iface;

    switch (vfunc)
    {
      case "get_interface":
      {
        static extern(C) GDBusInterface* _vfuncGetInterfaceTramp(GDBusObjectManager* manager, const(char)* objectPath, const(char)* interfaceName) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
            if (_klass && _klass.getInterface)
              return (cast(typeof(&_vfuncGetInterfaceTramp))_klass.getInterface)(manager, objectPath, interfaceName);
            return typeof(return).init;
          }

          gid.gio2.dbus_interface.DBusInterface _dretval;
          string _objectPath = objectPath.fromCString!(No.Free);
          string _interfaceName = interfaceName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetInterface(_objectPath, _interfaceName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.vfuncGetInterface");
          }
          auto _retval = _dretval ? cast(GDBusInterface*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getInterface = cast(typeof(_klass.getInterface))&_vfuncGetInterfaceTramp;
        break;
      }
      case "get_object":
      {
        static extern(C) GDBusObject* _vfuncGetObjectTramp(GDBusObjectManager* manager, const(char)* objectPath) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
            if (_klass && _klass.getObject)
              return (cast(typeof(&_vfuncGetObjectTramp))_klass.getObject)(manager, objectPath);
            return typeof(return).init;
          }

          gid.gio2.dbus_object.DBusObject _dretval;
          string _objectPath = objectPath.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetObject(_objectPath);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.vfuncGetObject");
          }
          auto _retval = _dretval ? cast(GDBusObject*)(cast(gid.gobject2.object.ObjectWrap)_dretval)._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getObject = cast(typeof(_klass.getObject))&_vfuncGetObjectTramp;
        break;
      }
      case "get_objects":
      {
        static extern(C) GList* _vfuncGetObjectsTramp(GDBusObjectManager* manager) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
            if (_klass && _klass.getObjects)
              return (cast(typeof(&_vfuncGetObjectsTramp))_klass.getObjects)(manager);
            return typeof(return).init;
          }

          gid.gio2.dbus_object.DBusObject[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetObjects();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.vfuncGetObjects");
          }
          auto _retval = gListFromD!(gid.gio2.dbus_object.DBusObject)(_dretval);

          return _retval;
        }

        _klass.getObjects = cast(typeof(_klass.getObjects))&_vfuncGetObjectsTramp;
        break;
      }
      case "interface_added":
      {
        static extern(C) void _vfuncInterfaceAddedTramp(GDBusObjectManager* manager, GDBusObject* object, GDBusInterface* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
            if (_klass && _klass.interfaceAdded)
              return (cast(typeof(&_vfuncInterfaceAddedTramp))_klass.interfaceAdded)(manager, object, interface_);
            return;
          }

          try
          {
            _obj.vfuncInterfaceAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(void*)object, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(void*)interface_, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.vfuncInterfaceAdded");
          }
        }

        _klass.interfaceAdded = cast(typeof(_klass.interfaceAdded))&_vfuncInterfaceAddedTramp;
        break;
      }
      case "interface_removed":
      {
        static extern(C) void _vfuncInterfaceRemovedTramp(GDBusObjectManager* manager, GDBusObject* object, GDBusInterface* interface_) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
            if (_klass && _klass.interfaceRemoved)
              return (cast(typeof(&_vfuncInterfaceRemovedTramp))_klass.interfaceRemoved)(manager, object, interface_);
            return;
          }

          try
          {
            _obj.vfuncInterfaceRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(void*)object, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface.DBusInterface)(cast(void*)interface_, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.vfuncInterfaceRemoved");
          }
        }

        _klass.interfaceRemoved = cast(typeof(_klass.interfaceRemoved))&_vfuncInterfaceRemovedTramp;
        break;
      }
      case "object_added":
      {
        static extern(C) void _vfuncObjectAddedTramp(GDBusObjectManager* manager, GDBusObject* object) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
            if (_klass && _klass.objectAdded)
              return (cast(typeof(&_vfuncObjectAddedTramp))_klass.objectAdded)(manager, object);
            return;
          }

          try
          {
            _obj.vfuncObjectAdded(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(void*)object, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.vfuncObjectAdded");
          }
        }

        _klass.objectAdded = cast(typeof(_klass.objectAdded))&_vfuncObjectAddedTramp;
        break;
      }
      case "object_removed":
      {
        static extern(C) void _vfuncObjectRemovedTramp(GDBusObjectManager* manager, GDBusObject* object) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)manager);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectManagerIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)manager), gid.gio2.dbus_object_manager.DBusObjectManager._getGType);
            if (_klass && _klass.objectRemoved)
              return (cast(typeof(&_vfuncObjectRemovedTramp))_klass.objectRemoved)(manager, object);
            return;
          }

          try
          {
            _obj.vfuncObjectRemoved(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_object.DBusObject)(cast(void*)object, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_manager.DBusObjectManager.vfuncObjectRemoved");
          }
        }

        _klass.objectRemoved = cast(typeof(_klass.objectRemoved))&_vfuncObjectRemovedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_object_manager.DBusObjectManager]
template DBusObjectManagerGidBuilderT()
{
}
