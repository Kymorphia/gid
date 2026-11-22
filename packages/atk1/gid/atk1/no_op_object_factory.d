/// Module for [NoOpObjectFactory] class
module gid.atk1.no_op_object_factory;

public import gid.core.basictypes;
import gid.atk1.c.functions;
import gid.atk1.c.types;
import gid.atk1.object_factory;
import gid.atk1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;

/**
    The AtkObjectFactory which creates an AtkNoOpObject.
    
    The AtkObjectFactory which creates an AtkNoOpObject. An instance of
    this is created by an AtkRegistry if no factory type has not been
    specified to create an accessible object of a particular type.
*/
class NoOpObjectFactory : gid.atk1.object_factory.ObjectFactory
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
    return cast(void function())atk_no_op_object_factory_get_type != &gidSymbolNotFound ? atk_no_op_object_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AtkNoOpObjectFactory";
  }

  /** Returns `this`, for use in `with` statements. */
  override NoOpObjectFactory self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.atk1.no_op_object_factory.NoOpObjectFactory]
      Returns: New builder object
  */
  static NoOpObjectFactoryGidBuilder builder() nothrow
  {
    return new NoOpObjectFactoryGidBuilder;
  }

  /**
      Creates an instance of an #AtkObjectFactory which generates primitive
      (non-functioning) #AtkObjects.
      Returns: an instance of an #AtkObjectFactory
  */
  this() nothrow
  {
    AtkObjectFactory* _cretval;
    _cretval = atk_no_op_object_factory_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [gid.atk1.no_op_object_factory.NoOpObjectFactory]
class NoOpObjectFactoryGidBuilderImpl(T) : gid.atk1.object_factory.ObjectFactoryGidBuilderImpl!T
{
}

/// Fluent builder for [gid.atk1.no_op_object_factory.NoOpObjectFactory]
final class NoOpObjectFactoryGidBuilder : NoOpObjectFactoryGidBuilderImpl!NoOpObjectFactoryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NoOpObjectFactory build() nothrow
  {
    return new NoOpObjectFactory(cast(void*)createGObject(NoOpObjectFactory._getGType), Yes.Take);
  }
}
