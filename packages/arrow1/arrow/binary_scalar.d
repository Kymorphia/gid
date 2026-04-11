/// Module for [BinaryScalar] class
module arrow.binary_scalar;

import arrow.base_binary_scalar;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class BinaryScalar : arrow.base_binary_scalar.BaseBinaryScalar
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
    return cast(void function())garrow_binary_scalar_get_type != &gidSymbolNotFound ? garrow_binary_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.binary_scalar.BinaryScalar]
      Returns: New builder object
  */
  static BinaryScalarGidBuilder builder()
  {
    return new BinaryScalarGidBuilder;
  }

  /** */
  this(arrow.buffer.Buffer value)
  {
    GArrowBinaryScalar* _cretval;
    _cretval = garrow_binary_scalar_new(value ? cast(GArrowBuffer*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.binary_scalar.BinaryScalar]
class BinaryScalarGidBuilderImpl(T) : arrow.base_binary_scalar.BaseBinaryScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.binary_scalar.BinaryScalar]
final class BinaryScalarGidBuilder : BinaryScalarGidBuilderImpl!BinaryScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinaryScalar build()
  {
    return new BinaryScalar(cast(void*)createGObject(BinaryScalar._getGType), Yes.Take);
  }
}
