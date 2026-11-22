/// Module for [Registry] class
module gid.atk1.registry;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object_factory;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;

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
class Registry : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())atk_registry_get_type != &gidSymbolNotFound ? atk_registry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkRegistry";
  }

  /** Returns `this`, for use in `with` statements. */
  override Registry self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.registry.Registry]
      Returns: New builder object
  */
  static RegistryGidBuilder builder() nothrow
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
  gid.atk1.object_factory.ObjectFactory getFactory(gid.gobject2.types.GType type) nothrow
  {
    AtkObjectFactory* _cretval;
    _cretval = atk_registry_get_factory(cast(AtkRegistry*)this._cPtr, type);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.atk1.object_factory.ObjectFactory)(cast(AtkObjectFactory*)_cretval, No.Take);
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
  gid.gobject2.types.GType getFactoryType(gid.gobject2.types.GType type) nothrow
  {
    gid.gobject2.types.GType _retval;
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
  void setFactoryType(gid.gobject2.types.GType type, gid.gobject2.types.GType factoryType) nothrow
  {
    atk_registry_set_factory_type(cast(AtkRegistry*)this._cPtr, type, factoryType);
  }
}

/// Fluent builder implementation template for [gid.atk1.registry.Registry]
class RegistryGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.atk1.registry.Registry]
final class RegistryGidBuilder : RegistryGidBuilderImpl!RegistryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Registry build() nothrow
  {
    return new Registry(cast(void*)createGObject(Registry._getGType), Yes.Take);
  }
}
