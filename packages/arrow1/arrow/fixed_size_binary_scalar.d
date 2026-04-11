/// Module for [FixedSizeBinaryScalar] class
module arrow.fixed_size_binary_scalar;

import arrow.base_binary_scalar;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class FixedSizeBinaryScalar : arrow.base_binary_scalar.BaseBinaryScalar
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
    return cast(void function())garrow_fixed_size_binary_scalar_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeBinaryScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_size_binary_scalar.FixedSizeBinaryScalar]
      Returns: New builder object
  */
  static FixedSizeBinaryScalarGidBuilder builder()
  {
    return new FixedSizeBinaryScalarGidBuilder;
  }

  /** */
  this(arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType dataType, arrow.buffer.Buffer value)
  {
    GArrowFixedSizeBinaryScalar* _cretval;
    _cretval = garrow_fixed_size_binary_scalar_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType._cPtr(No.Dup) : null, value ? cast(GArrowBuffer*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.fixed_size_binary_scalar.FixedSizeBinaryScalar]
class FixedSizeBinaryScalarGidBuilderImpl(T) : arrow.base_binary_scalar.BaseBinaryScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_size_binary_scalar.FixedSizeBinaryScalar]
final class FixedSizeBinaryScalarGidBuilder : FixedSizeBinaryScalarGidBuilderImpl!FixedSizeBinaryScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedSizeBinaryScalar build()
  {
    return new FixedSizeBinaryScalar(cast(void*)createGObject(FixedSizeBinaryScalar._getGType), Yes.Take);
  }
}
