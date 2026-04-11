/// Module for [Registry] class
module atk.registry;

import atk.c.functions;
import atk.c.types;
import atk.object_factory;
import atk.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gobject.types;

/**
    An object used to store the GType of the
    factories used to create an accessible object for an object of a
    particular GType.
    
    The AtkRegistry is normally used to create appropriate ATK "peers"
    for user interface components.  Application developers usually need
    only interact with the AtkRegistry by associating appropriate ATK
    implementation classes with GObject classes via the
    atk_registry_set_factory_type call, passing the appropriate GType
    for application custom widget classes.
*/
class Registry : gobject.object.ObjectWrap
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
    return cast(void function())atk_registry_get_type != &gidSymbolNotFound ? atk_registry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Registry self()
  {
    return this;
  }

  /**
      Get builder for [atk.registry.Registry]
      Returns: New builder object
  */
  static RegistryGidBuilder builder()
  {
    return new RegistryGidBuilder;
  }

  /**
      Gets an #AtkObjectFactory appropriate for creating #AtkObjects
      appropriate for type.
  
      Params:
        type = a #GType with which to look up the associated #AtkObjectFactory
      Returns: an #AtkObjectFactory appropriate for creating
        #AtkObjects appropriate for type.
  */
  atk.object_factory.ObjectFactory getFactory(gobject.types.GType type)
  {
    AtkObjectFactory* _cretval;
    _cretval = atk_registry_get_factory(cast(AtkRegistry*)this._cPtr, type);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object_factory.ObjectFactory)(cast(AtkObjectFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Provides a #GType indicating the #AtkObjectFactory subclass
      associated with type.
  
      Params:
        type = a #GType with which to look up the associated #AtkObjectFactory
          subclass
      Returns: a #GType associated with type type
  */
  gobject.types.GType getFactoryType(gobject.types.GType type)
  {
    gobject.types.GType _retval;
    _retval = atk_registry_get_factory_type(cast(AtkRegistry*)this._cPtr, type);
    return _retval;
  }

  /**
      Associate an #AtkObjectFactory subclass with a #GType. Note:
      The associated factory_type will thereafter be responsible for
      the creation of new #AtkObject implementations for instances
      appropriate for type.
  
      Params:
        type = an #AtkObject type
        factoryType = an #AtkObjectFactory type to associate with type.  Must
          implement AtkObject appropriate for type.
  */
  void setFactoryType(gobject.types.GType type, gobject.types.GType factoryType)
  {
    atk_registry_set_factory_type(cast(AtkRegistry*)this._cPtr, type, factoryType);
  }
}

/// Fluent builder implementation template for [atk.registry.Registry]
class RegistryGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [atk.registry.Registry]
final class RegistryGidBuilder : RegistryGidBuilderImpl!RegistryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Registry build()
  {
    return new Registry(cast(void*)createGObject(Registry._getGType), No.Take);
  }
}
