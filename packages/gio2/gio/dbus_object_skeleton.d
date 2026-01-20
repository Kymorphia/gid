/// Module for [DBusObjectSkeleton] class
module gio.dbus_object_skeleton;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_interface_skeleton;
import gio.dbus_method_invocation;
import gio.dbus_object;
import gio.dbus_object_mixin;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    A [gio.dbus_object_skeleton.DBusObjectSkeleton] instance is essentially a group of D-Bus
    interfaces. The set of exported interfaces on the object may be
    dynamic and change at runtime.
    
    This type is intended to be used with [gio.dbus_object_manager.DBusObjectManager].
*/
class DBusObjectSkeleton : gobject.object.ObjectWrap, gio.dbus_object.DBusObject
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_skeleton_get_type != &gidSymbolNotFound ? g_dbus_object_skeleton_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusObjectSkeleton self()
  {
    return this;
  }

  /**
      Get `gObjectPath` property.
      Returns: The object path where the object is exported.
  */
  @property string gObjectPath()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("g-object-path");
  }

  /**
      Set `gObjectPath` property.
      Params:
        propval = The object path where the object is exported.
  */
  @property void gObjectPath(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("g-object-path", propval);
  }

  mixin DBusObjectT!();

  /**
      Creates a new #GDBusObjectSkeleton.
  
      Params:
        objectPath = An object path.
      Returns: A #GDBusObjectSkeleton. Free with [gobject.object.ObjectWrap.unref].
  */
  this(string objectPath)
  {
    GDBusObjectSkeleton* _cretval;
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_object_skeleton_new(_objectPath);
    this(_cretval, Yes.Take);
  }

  /**
      Adds interface_ to object.
      
      If object already contains a #GDBusInterfaceSkeleton with the same
      interface name, it is removed before interface_ is added.
      
      Note that object takes its own reference on interface_ and holds
      it until removed.
  
      Params:
        interface_ = A #GDBusInterfaceSkeleton.
  */
  void addInterface(gio.dbus_interface_skeleton.DBusInterfaceSkeleton interface_)
  {
    g_dbus_object_skeleton_add_interface(cast(GDBusObjectSkeleton*)this._cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_._cPtr(No.Dup) : null);
  }

  /**
      This method simply calls [gio.dbus_interface_skeleton.DBusInterfaceSkeleton.flush] on all
      interfaces belonging to object. See that method for when flushing
      is useful.
  */
  void flush()
  {
    g_dbus_object_skeleton_flush(cast(GDBusObjectSkeleton*)this._cPtr);
  }

  /**
      Removes interface_ from object.
  
      Params:
        interface_ = A #GDBusInterfaceSkeleton.
  */
  void removeInterface(gio.dbus_interface_skeleton.DBusInterfaceSkeleton interface_)
  {
    g_dbus_object_skeleton_remove_interface(cast(GDBusObjectSkeleton*)this._cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_._cPtr(No.Dup) : null);
  }

  /**
      Removes the #GDBusInterface with interface_name from object.
      
      If no D-Bus interface of the given interface exists, this function
      does nothing.
  
      Params:
        interfaceName = A D-Bus interface name.
  */
  void removeInterfaceByName(string interfaceName)
  {
    const(char)* _interfaceName = interfaceName.toCString(No.Alloc);
    g_dbus_object_skeleton_remove_interface_by_name(cast(GDBusObjectSkeleton*)this._cPtr, _interfaceName);
  }

  /**
      Sets the object path for object.
  
      Params:
        objectPath = A valid D-Bus object path.
  */
  void setObjectPath(string objectPath)
  {
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    g_dbus_object_skeleton_set_object_path(cast(GDBusObjectSkeleton*)this._cPtr, _objectPath);
  }

  /**
      Connect to `AuthorizeMethod` signal.
  
      Emitted when a method is invoked by a remote caller and used to
        determine if the method call is authorized.
        
        This signal is like #GDBusInterfaceSkeleton's
        #GDBusInterfaceSkeleton::g-authorize-method signal,
        except that it is for the enclosing object.
        
        The default class handler just returns true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.dbus_interface_skeleton.DBusInterfaceSkeleton interface_, gio.dbus_method_invocation.DBusMethodInvocation invocation, gio.dbus_object_skeleton.DBusObjectSkeleton dBusObjectSkeleton))
  
          `interface_` The #GDBusInterfaceSkeleton that invocation is for. (optional)
  
          `invocation` A #GDBusMethodInvocation. (optional)
  
          `dBusObjectSkeleton` the instance the signal is connected to (optional)
  
          `Returns` true if the call is authorized, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAuthorizeMethod(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_interface_skeleton.DBusInterfaceSkeleton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_method_invocation.DBusMethodInvocation)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.dbus_object_skeleton.DBusObjectSkeleton)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authorize-method", closure, after);
  }
}
