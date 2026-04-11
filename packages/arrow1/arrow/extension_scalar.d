/// Module for [ExtensionScalar] class
module arrow.extension_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class ExtensionScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_extension_scalar_get_type != &gidSymbolNotFound ? garrow_extension_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExtensionScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.extension_scalar.ExtensionScalar]
      Returns: New builder object
  */
  static ExtensionScalarGidBuilder builder()
  {
    return new ExtensionScalarGidBuilder;
  }
}

/// Fluent builder implementation template for [arrow.extension_scalar.ExtensionScalar]
class ExtensionScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.extension_scalar.ExtensionScalar]
final class ExtensionScalarGidBuilder : ExtensionScalarGidBuilderImpl!ExtensionScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ExtensionScalar build()
  {
    return new ExtensionScalar(cast(void*)createGObject(ExtensionScalar._getGType), No.Take);
  }
}
