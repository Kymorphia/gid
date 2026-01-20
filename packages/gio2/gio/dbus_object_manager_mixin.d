/// Module for [DBusObjectManager] interface mixin
module gio.dbus_object_manager_mixin;

public import gio.dbus_object_manager_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.dbus_interface;
public import gio.dbus_object;
public import gio.types;
public import gobject.dclosure;
public import gobject.object;

/**
    The [gio.dbus_object_manager.DBusObjectManager] type is the base type for service- and
    client-side implementations of the standardized
    [`org.freedesktop.DBus.ObjectManager`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface.
    
    See [gio.dbus_object_manager_client.DBusObjectManagerClient] for the client-side implementation
    and [gio.dbus_object_manager_server.DBusObjectManagerServer] for the service-side implementation.
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
          with [gobject.object.ObjectWrap.unref].
  */
  override gio.dbus_interface.DBusInterface getInterface(string objectPath, string interfaceName)
  {
    GDBusInterface* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    _cretval = g_dbus_object_manager_get_interface(cast(GDBusObjectManager*)this._cPtr, _objectPath, _interfaceName);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_interface.DBusInterface)(cast(GDBusInterface*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the #GDBusObject at object_path, if any.
  
      Params:
        objectPath = Object path to look up.
      Returns: A #GDBusObject or null. Free with
          [gobject.object.ObjectWrap.unref].
  */
  override gio.dbus_object.DBusObject getObject(string objectPath)
  {
    GDBusObject* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_object_manager_get_object(cast(GDBusObjectManager*)this._cPtr, _objectPath);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_object.DBusObject)(cast(GDBusObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the object path that manager is for.
      Returns: A string owned by manager. Do not free.
  */
  override string getObjectPath()
  {
    const(char)* _cretval;
    _cretval = g_dbus_object_manager_get_object_path(cast(GDBusObjectManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets all #GDBusObject objects known to manager.
      Returns: A list of
          #GDBusObject objects. The returned list should be freed with
          [glib.list.List.free] after each element has been freed with
          [gobject.object.ObjectWrap.unref].
  */
  override gio.dbus_object.DBusObject[] getObjects()
  {
    GList* _cretval;
    _cretval = g_dbus_object_manager_get_objects(cast(GDBusObjectManager*)this._cPtr);
    auto _retval = gListToD!(gio.dbus_object.DBusObject, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Connect to `InterfaceAdded` signal.
  
      Emitted when interface is added to object.
        
        This signal exists purely as a convenience to avoid having to
        connect signals to all objects managed by manager.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.dbus_object.DBusObject object, gio.dbus_interface.DBusInterface interface_, gio.dbus_object_manager.DBusObjectManager dBusObjectManager))
  
          `object` The #GDBusObject on which an interface was added. (optional)
  
          `interface_` The #GDBusInterface that was added. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInterfaceAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.dbus_object_manager.DBusObjectManager)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
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
  
          $(D void callback(gio.dbus_object.DBusObject object, gio.dbus_interface.DBusInterface interface_, gio.dbus_object_manager.DBusObjectManager dBusObjectManager))
  
          `object` The #GDBusObject on which an interface was removed. (optional)
  
          `interface_` The #GDBusInterface that was removed. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInterfaceRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.dbus_object_manager.DBusObjectManager)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("interface-removed", closure, after);
  }

  /**
      Connect to `ObjectAdded` signal.
  
      Emitted when object is added to manager.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.dbus_object.DBusObject object, gio.dbus_object_manager.DBusObjectManager dBusObjectManager))
  
          `object` The #GDBusObject that was added. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectObjectAdded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_object_manager.DBusObjectManager)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-added", closure, after);
  }

  /**
      Connect to `ObjectRemoved` signal.
  
      Emitted when object is removed from manager.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.dbus_object.DBusObject object, gio.dbus_object_manager.DBusObjectManager dBusObjectManager))
  
          `object` The #GDBusObject that was removed. (optional)
  
          `dBusObjectManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectObjectRemoved(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_object.DBusObject)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_object_manager.DBusObjectManager)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("object-removed", closure, after);
  }
}
