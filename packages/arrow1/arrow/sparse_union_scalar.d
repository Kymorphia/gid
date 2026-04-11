/// Module for [SparseUnionScalar] class
module arrow.sparse_union_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.scalar;
import arrow.sparse_union_data_type;
import arrow.types;
import arrow.union_scalar;
import gid.gid;
import gobject.gid_builder;

/** */
class SparseUnionScalar : arrow.union_scalar.UnionScalar
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
    return cast(void function())garrow_sparse_union_scalar_get_type != &gidSymbolNotFound ? garrow_sparse_union_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SparseUnionScalar self()
  {
    return this;
  }

  /**
      Get builder for [arrow.sparse_union_scalar.SparseUnionScalar]
      Returns: New builder object
  */
  static SparseUnionScalarGidBuilder builder()
  {
    return new SparseUnionScalarGidBuilder;
  }

  /** */
  this(arrow.sparse_union_data_type.SparseUnionDataType dataType, byte typeCode, arrow.scalar.Scalar value)
  {
    GArrowSparseUnionScalar* _cretval;
    _cretval = garrow_sparse_union_scalar_new(dataType ? cast(GArrowSparseUnionDataType*)dataType._cPtr(No.Dup) : null, typeCode, value ? cast(GArrowScalar*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.sparse_union_scalar.SparseUnionScalar]
class SparseUnionScalarGidBuilderImpl(T) : arrow.union_scalar.UnionScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.sparse_union_scalar.SparseUnionScalar]
final class SparseUnionScalarGidBuilder : SparseUnionScalarGidBuilderImpl!SparseUnionScalarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SparseUnionScalar build()
  {
    return new SparseUnionScalar(cast(void*)createGObject(SparseUnionScalar._getGType), Yes.Take);
  }
}
