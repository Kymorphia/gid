/// Module for [DBusObject] interface mixin
module gid.gio2.dbus_object_mixin;

public import gid.core.basictypes;
public import gid.gio2.dbus_object_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.dbus_interface;
public import gid.gio2.types;
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
}

/// Fluent builder implementation template for [gid.gio2.dbus_object.DBusObject]
template DBusObjectGidBuilderT()
{
}
