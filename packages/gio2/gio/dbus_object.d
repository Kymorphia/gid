/// Module for [DBusObject] interface
module gio.dbus_object;

public import gid.basictypes;
public import gio.dbus_object_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_interface;
import gio.types;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;

/**
    The [gio.dbus_object.DBusObject] type is the base type for D-Bus objects on both
    the service side (see [gio.dbus_object_skeleton.DBusObjectSkeleton]) and the client side
    (see [gio.dbus_object_proxy.DBusObjectProxy]). It is essentially just a container of
    interfaces.
*/
interface DBusObject : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_get_type != &gidSymbolNotFound ? g_dbus_object_get_type() : cast(GType)0;
  }

  /**
      Gets the D-Bus interface with name interface_name associated with
      object, if any.
  
      Params:
        interfaceName = A D-Bus interface name.
      Returns: null if not found, otherwise a
          #GDBusInterface that must be freed with [gobject.object.ObjectWrap.unref].
  */
  gio.dbus_interface.DBusInterface getInterface(string interfaceName);

  /**
      Gets the D-Bus interfaces associated with object.
      Returns: A list of #GDBusInterface instances.
          The returned list must be freed by [glib.list.List.free] after each element has been freed
          with [gobject.object.ObjectWrap.unref].
  */
  gio.dbus_interface.DBusInterface[] getInterfaces();

  /**
      Gets the object path for object.
      Returns: A string owned by object. Do not free.
  */
  string getObjectPath();

  /**
      Connect to `InterfaceAdded` signal.
  
      Emitted when interface is added to object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject)`
  
          `interface_` The #GDBusInterface that was added. (optional)
  
          `dBusObject` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceAdded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_object.DBusObject)))
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
        gidInvokeCallbackExceptionHandler(e, "gio.dbus_object.DBusObject.interfaceAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("interface-added", closure, after);
  }

  /**
      Connect to `InterfaceRemoved` signal.
  
      Emitted when interface is removed from object.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gio.dbus_interface.DBusInterface interface_, gio.dbus_object.DBusObject dBusObject)`
  
          `interface_` The #GDBusInterface that was removed. (optional)
  
          `dBusObject` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectInterfaceRemoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_interface.DBusInterface)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_object.DBusObject)))
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
        gidInvokeCallbackExceptionHandler(e, "gio.dbus_object.DBusObject.interfaceRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("interface-removed", closure, after);
  }
}

/// Fluent builder implementation template for [gio.dbus_object.DBusObject]
interface DBusObjectGidBuilderImpl(T)
{
}
