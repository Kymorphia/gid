/// Module for [DenseUnionScalar] class
module arrow.dense_union_scalar;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.dense_union_data_type;
import arrow.scalar;
import arrow.types;
import arrow.union_scalar;
import gid.gid;
import gobject.gid_builder;

/** */
class DenseUnionScalar : arrow.union_scalar.UnionScalar
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_dense_union_scalar_get_type != &gidSymbolNotFound ? garrow_dense_union_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DenseUnionScalar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.dense_union_scalar.DenseUnionScalar]
      Returns: New builder object
  */
  static DenseUnionScalarGidBuilder builder() nothrow
  {
    return new DenseUnionScalarGidBuilder;
  }

  /** */
  this(arrow.dense_union_data_type.DenseUnionDataType dataType, byte typeCode, arrow.scalar.Scalar value) nothrow
  {
    GArrowDenseUnionScalar* _cretval;
    _cretval = garrow_dense_union_scalar_new(dataType ? cast(GArrowDenseUnionDataType*)dataType._cPtr(No.Dup) : null, typeCode, value ? cast(GArrowScalar*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.dense_union_scalar.DenseUnionScalar]
class DenseUnionScalarGidBuilderImpl(T) : arrow.union_scalar.UnionScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.dense_union_scalar.DenseUnionScalar]
final class DenseUnionScalarGidBuilder : DenseUnionScalarGidBuilderImpl!DenseUnionScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DenseUnionScalar build() nothrow
  {
    return new DenseUnionScalar(cast(void*)createGObject(DenseUnionScalar._getGType), Yes.Take);
  }
}
