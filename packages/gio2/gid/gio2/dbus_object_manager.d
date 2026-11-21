/// Module for [DBusObjectManager] interface
module gid.gio2.dbus_object_manager;

public import gid.core.basictypes;
public import gid.gio2.dbus_object_manager_iface_proxy;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_interface;
import gid.gio2.dbus_object;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    The [gid.gio2.dbus_object_manager.DBusObjectManager] type is the base type for service- and
    client-side implementations of the standardized
    [`org.freedesktop.DBus.ObjectManager`](http://dbus.freedesktop.org/doc/dbus-specification.html#standard-interfaces-objectmanager)
    interface.
    
    See [gid.gio2.dbus_object_manager_client.DBusObjectManagerClient] for the client-side implementation
    and [gid.gio2.dbus_object_manager_server.DBusObjectManagerServer] for the service-side implementation.
*/
interface DBusObjectManager : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_manager_get_type != &gidSymbolNotFound ? g_dbus_object_manager_get_type() : cast(GType)0;
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
  gid.gio2.dbus_interface.DBusInterface getInterface(string objectPath, string interfaceName);

  /**
      Gets the #GDBusObject at object_path, if any.
  
      Params:
        objectPath = Object path to look up.
      Returns: A #GDBusObject or null. Free with
          [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.dbus_object.DBusObject getObject(string objectPath);

  /**
      Gets the object path that manager is for.
      Returns: A string owned by manager. Do not free.
  */
  string getObjectPath();

  /**
      Gets all #GDBusObject objects known to manager.
      Returns: A list of
          #GDBusObject objects. The returned list should be freed with
          [gid.glib2.list.List.free] after each element has been freed with
          [gid.gobject2.object.ObjectWrap.unref].
  */
  gid.gio2.dbus_object.DBusObject[] getObjects();

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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("interface-added", closure, after);
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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("interface-removed", closure, after);
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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("object-added", closure, after);
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
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("object-removed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_object_manager.DBusObjectManager]
interface DBusObjectManagerGidBuilderImpl(T)
{
}
