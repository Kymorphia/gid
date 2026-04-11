/// Module for [ObjectFactory] class
module atk.object_factory;

import atk.c.functions;
import atk.c.types;
import atk.object;
import atk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gobject.types;

/**
    The base object class for a factory used to
     create accessible objects for objects of a specific GType.
    
    This class is the base object class for a factory used to create an
    accessible object for a specific GType. The function
    [atk.registry.Registry.setFactoryType] is normally called to store in the
    registry the factory type to be used to create an accessible of a
    particular GType.
*/
class ObjectFactory : gobject.object.ObjectWrap
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
    return cast(void function())atk_object_factory_get_type != &gidSymbolNotFound ? atk_object_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ObjectFactory self()
  {
    return this;
  }

  /**
      Get builder for [atk.object_factory.ObjectFactory]
      Returns: New builder object
  */
  static ObjectFactoryGidBuilder builder()
  {
    return new ObjectFactoryGidBuilder;
  }

  /**
      Provides an #AtkObject that implements an accessibility interface
      on behalf of obj
  
      Params:
        obj = a #GObject
      Returns: an #AtkObject that implements an accessibility
        interface on behalf of obj
  */
  atk.object.ObjectWrap createAccessible(gobject.object.ObjectWrap obj)
  {
    AtkObject* _cretval;
    _cretval = atk_object_factory_create_accessible(cast(AtkObjectFactory*)this._cPtr, obj ? cast(GObject*)obj._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the GType of the accessible which is created by the factory.
      Returns: the type of the accessible which is created by the factory.
        The value G_TYPE_INVALID is returned if no type if found.
  */
  gobject.types.GType getAccessibleType()
  {
    gobject.types.GType _retval;
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
  void invalidate()
  {
    atk_object_factory_invalidate(cast(AtkObjectFactory*)this._cPtr);
  }
}

/// Fluent builder implementation template for [atk.object_factory.ObjectFactory]
class ObjectFactoryGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [atk.object_factory.ObjectFactory]
final class ObjectFactoryGidBuilder : ObjectFactoryGidBuilderImpl!ObjectFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ObjectFactory build()
  {
    return new ObjectFactory(cast(void*)createGObject(ObjectFactory._getGType), No.Take);
  }
}
