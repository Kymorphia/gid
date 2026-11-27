/// Module for [ObjectFactory] class
module gid.atk1.object_factory;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

/**
    The base object class for a factory used to
     create accessible objects for objects of a specific GType.
    
    This class is the base object class for a factory used to create an
    accessible object for a specific GType. The function
    [gid.atk1.registry.Registry.setFactoryType] is normally called to store in the
    registry the factory type to be used to create an accessible of a
    particular GType.
*/
@gidGir("ObjectFactory", "ObjectFactoryClass")
class ObjectFactory : gid.gobject2.object.ObjectWrap
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
    return cast(void function())atk_object_factory_get_type != &gidSymbolNotFound ? atk_object_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkObjectFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override ObjectFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.object_factory.ObjectFactory]
      Returns: New builder object
  */
  static ObjectFactoryGidBuilder builder() nothrow
  {
    return new ObjectFactoryGidBuilder;
  }

  /**
      Inform factory that it is no longer being used to create
      accessibles. When called, factory may need to inform
      #AtkObjects which it has created that they need to be re-instantiated.
      Note: primarily used for runtime replacement of #AtkObjectFactorys
      in object registries.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncInvalidate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncInvalidate()
  {
    auto _klass = cast(AtkObjectFactoryClass*)_vfuncClass;
    if (!_klass.invalidate)
      return;

    _klass.invalidate(cast(AtkObjectFactory*)this._cPtr);
  }

  /**
      Provides an #AtkObject that implements an accessibility interface
      on behalf of obj
  
      Params:
        obj = a #GObject
      Returns: an #AtkObject that implements an accessibility
        interface on behalf of obj
  */
  gid.atk1.object.ObjectWrap createAccessible(gid.gobject2.object.ObjectWrap obj) nothrow
  {
    AtkObject* _cretval;
    _cretval = atk_object_factory_create_accessible(cast(AtkObjectFactory*)this._cPtr, obj ? cast(GObject*)obj._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the GType of the accessible which is created by the factory.
      Returns: the type of the accessible which is created by the factory.
        The value G_TYPE_INVALID is returned if no type if found.
  */
  gid.gobject2.types.GType getAccessibleType() nothrow
  {
    gid.gobject2.types.GType _retval;
    _retval = atk_object_factory_get_accessible_type(cast(AtkObjectFactory*)this._cPtr);
    return _retval;
  }

  /**
      Inform factory that it is no longer being used to create
      accessibles. When called, factory may need to inform
      #AtkObjects which it has created that they need to be re-instantiated.
      Note: primarily used for runtime replacement of #AtkObjectFactorys
      in object registries.
  */
  void invalidate() nothrow
  {
    atk_object_factory_invalidate(cast(AtkObjectFactory*)this._cPtr);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ObjectFactory
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.atk1.object_factory.ObjectFactory), T.stringof ~ " is not derived from gid.atk1.object_factory.ObjectFactory");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncInvalidate", true)[0]) == gid.atk1.object_factory.ObjectFactory))
      _installVfunc(klass, "invalidate");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(AtkObjectFactoryClass*)klass;

    switch (vfunc)
    {
      case "invalidate":
      {
        static extern(C) void _vfuncInvalidateTramp(AtkObjectFactory* factory) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.atk1.object_factory.ObjectFactory)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)factory);
          if (!_obj)
          {
            auto _klass = cast(AtkObjectFactoryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)factory);
            if (_klass.invalidate)
              return (cast(typeof(&_vfuncInvalidateTramp))_klass.invalidate)(factory);
            return;
          }

          try
          {
            _obj.vfuncInvalidate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.atk1.object_factory.ObjectFactory.vfuncInvalidate");
          }
        }

        _klass.invalidate = cast(typeof(_klass.invalidate))&_vfuncInvalidateTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.atk1.object_factory.ObjectFactory]
class ObjectFactoryGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.atk1.object_factory.ObjectFactory]
final class ObjectFactoryGidBuilder : ObjectFactoryGidBuilderImpl!ObjectFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ObjectFactory build() nothrow
  {
    return new ObjectFactory(cast(void*)createGObject(ObjectFactory._getGType), Yes.Take);
  }
}
