/// Module for [DBusObjectSkeleton] class
module gid.gio2.dbus_object_skeleton;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_interface_skeleton;
import gid.gio2.dbus_method_invocation;
import gid.gio2.dbus_object;
import gid.gio2.dbus_object_mixin;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.dbus_object_skeleton.DBusObjectSkeleton] instance is essentially a group of D-Bus
    interfaces. The set of exported interfaces on the object may be
    dynamic and change at runtime.
    
    This type is intended to be used with [gid.gio2.dbus_object_manager.DBusObjectManager].
*/
@gidGir("DBusObjectSkeleton", "DBusObjectSkeletonClass")
class DBusObjectSkeleton : gid.gobject2.object.ObjectWrap, gid.gio2.dbus_object.DBusObject
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_object_skeleton_get_type != &gidSymbolNotFound ? g_dbus_object_skeleton_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusObjectSkeleton";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusObjectSkeleton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_object_skeleton.DBusObjectSkeleton]
      Returns: New builder object
  */
  static DBusObjectSkeletonGidBuilder builder() nothrow
  {
    return new DBusObjectSkeletonGidBuilder;
  }

  /**
      Get `gObjectPath` property.
      Returns: The object path where the object is exported.
  */
  @property string gObjectPath() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("g-object-path");
  }

  /**
      Set `gObjectPath` property.
      Params:
        propval = The object path where the object is exported.
  */
  @property void gObjectPath(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("g-object-path", propval);
  }

  mixin DBusObjectT!();

  /**
      Creates a new #GDBusObjectSkeleton.
  
      Params:
        objectPath = An object path.
      Returns: A #GDBusObjectSkeleton. Free with [gid.gobject2.object.ObjectWrap.unref].
  */
  this(string objectPath) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GDBusObjectSkeleton* _cretval;
      const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
      _cretval = g_dbus_object_skeleton_new(_objectPath);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Signal class handler for the #GDBusObjectSkeleton::authorize-method signal.
  
      Params:
        interface_ = 
        invocation = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAuthorizeMethod` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAuthorizeMethod(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton interface_, gid.gio2.dbus_method_invocation.DBusMethodInvocation invocation)
  {
    auto _klass = cast(GDBusObjectSkeletonClass*)_vfuncClass;
    if (!_klass.authorizeMethod)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.authorizeMethod(cast(GDBusObjectSkeleton*)this._cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_._cPtr(No.Dup) : null, invocation ? cast(GDBusMethodInvocation*)invocation._cPtr(No.Dup) : null);
    return _retval;
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
  void addInterface(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton interface_) nothrow
  {
    g_dbus_object_skeleton_add_interface(cast(GDBusObjectSkeleton*)this._cPtr, interface_ ? cast(GDBusInterfaceSkeleton*)interface_._cPtr(No.Dup) : null);
  }

  /**
      This method simply calls [gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton.flush] on all
      interfaces belonging to object. See that method for when flushing
      is useful.
  */
  void flush() nothrow
  {
    g_dbus_object_skeleton_flush(cast(GDBusObjectSkeleton*)this._cPtr);
  }

  /**
      Removes interface_ from object.
  
      Params:
        interface_ = A #GDBusInterfaceSkeleton.
  */
  void removeInterface(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton interface_) nothrow
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
  void removeInterfaceByName(string interfaceName) nothrow
  {
    const(char)* _interfaceName = interfaceName.toCString!(No.Malloc, No.Nullable);
    g_dbus_object_skeleton_remove_interface_by_name(cast(GDBusObjectSkeleton*)this._cPtr, _interfaceName);
  }

  /**
      Sets the object path for object.
  
      Params:
        objectPath = A valid D-Bus object path.
  */
  void setObjectPath(string objectPath) nothrow
  {
    const(char)* _objectPath = objectPath.toCString!(No.Malloc, No.Nullable);
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
  
          `bool callback(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton interface_, gid.gio2.dbus_method_invocation.DBusMethodInvocation invocation, gid.gio2.dbus_object_skeleton.DBusObjectSkeleton dBusObjectSkeleton)`
  
          `interface_` The #GDBusInterfaceSkeleton that invocation is for. (optional)
  
          `invocation` A #GDBusMethodInvocation. (optional)
  
          `dBusObjectSkeleton` the instance the signal is connected to (optional)
  
          `Returns` true if the call is authorized, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAuthorizeMethod(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_method_invocation.DBusMethodInvocation)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.dbus_object_skeleton.DBusObjectSkeleton)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_skeleton.DBusObjectSkeleton.authorizeMethod");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authorize-method", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from DBusObjectSkeleton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.dbus_object_skeleton.DBusObjectSkeleton), T.stringof ~ " is not derived from gid.gio2.dbus_object_skeleton.DBusObjectSkeleton");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAuthorizeMethod", true)[0]) == gid.gio2.dbus_object_skeleton.DBusObjectSkeleton))
      _installVfunc(klass, "authorize_method");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GDBusObjectSkeletonClass*)klass;

    switch (vfunc)
    {
      case "authorize_method":
      {
        static extern(C) gboolean _vfuncAuthorizeMethodTramp(GDBusObjectSkeleton* object, GDBusInterfaceSkeleton* interface_, GDBusMethodInvocation* invocation) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.dbus_object_skeleton.DBusObjectSkeleton)(cast(void*)object);
          if (!_obj)
          {
            auto _klass = cast(GDBusObjectSkeletonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)object);
            if (_klass.authorizeMethod)
              return (cast(typeof(&_vfuncAuthorizeMethodTramp))_klass.authorizeMethod)(object, interface_, invocation);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAuthorizeMethod(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_interface_skeleton.DBusInterfaceSkeleton)(cast(void*)interface_, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_method_invocation.DBusMethodInvocation)(cast(void*)invocation, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_object_skeleton.DBusObjectSkeleton.vfuncAuthorizeMethod");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.authorizeMethod = cast(typeof(_klass.authorizeMethod))&_vfuncAuthorizeMethodTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_object_skeleton.DBusObjectSkeleton]
class DBusObjectSkeletonGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.dbus_object.DBusObjectGidBuilderImpl!T
{

  mixin DBusObjectGidBuilderT!();

  /**
      Set `gObjectPath` property.
      Params:
        propval = The object path where the object is exported.
      Returns: Builder instance for fluent chaining
  */
  T gObjectPath(string propval) nothrow
  {
    return setProperty("g-object-path", propval);
  }
}

/// Fluent builder for [gid.gio2.dbus_object_skeleton.DBusObjectSkeleton]
final class DBusObjectSkeletonGidBuilder : DBusObjectSkeletonGidBuilderImpl!DBusObjectSkeletonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusObjectSkeleton build() nothrow
  {
    return new DBusObjectSkeleton(cast(void*)createGObject(DBusObjectSkeleton._getGType), Yes.Take);
  }
}
