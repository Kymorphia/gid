/// Module for [NoOpObjectFactory] class
module atk.no_op_object_factory;

import atk.c.functions;
import atk.c.types;
import atk.object_factory;
import atk.types;
import gid.gid;
import gobject.gid_builder;

/**
    The AtkObjectFactory which creates an AtkNoOpObject.
    
    The AtkObjectFactory which creates an AtkNoOpObject. An instance of
    this is created by an AtkRegistry if no factory type has not been
    specified to create an accessible object of a particular type.
*/
class NoOpObjectFactory : atk.object_factory.ObjectFactory
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
    return cast(void function())atk_no_op_object_factory_get_type != &gidSymbolNotFound ? atk_no_op_object_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NoOpObjectFactory self()
  {
    return this;
  }

  /**
  Get builder for [atk.no_op_object_factory.NoOpObjectFactory]
  Returns: New builder object
  */
  static NoOpObjectFactoryGidBuilder builder()
  {
    return new NoOpObjectFactoryGidBuilder;
  }

  /**
      Creates an instance of an #AtkObjectFactory which generates primitive
      (non-functioning) #AtkObjects.
      Returns: an instance of an #AtkObjectFactory
  */
  this()
  {
    AtkObjectFactory* _cretval;
    _cretval = atk_no_op_object_factory_new();
    this(_cretval, Yes.Take);
  }
}

class NoOpObjectFactoryGidBuilderImpl(T) : atk.object_factory.ObjectFactoryGidBuilderImpl!T
{
}

/// Fluent builder for [atk.no_op_object_factory.NoOpObjectFactory]
final class NoOpObjectFactoryGidBuilder : NoOpObjectFactoryGidBuilderImpl!NoOpObjectFactoryGidBuilder
{
  NoOpObjectFactory build()
  {
    return new NoOpObjectFactory(cast(void*)createGObject(NoOpObjectFactory._getGType), Yes.Take);
  }
}
