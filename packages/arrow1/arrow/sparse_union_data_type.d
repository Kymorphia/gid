/// Module for [SparseUnionDataType] class
module arrow.sparse_union_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.field;
import arrow.types;
import arrow.union_data_type;
import gid.gid;
import gobject.gid_builder;

/** */
class SparseUnionDataType : arrow.union_data_type.UnionDataType
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
    return cast(void function())garrow_sparse_union_data_type_get_type != &gidSymbolNotFound ? garrow_sparse_union_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SparseUnionDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.sparse_union_data_type.SparseUnionDataType]
      Returns: New builder object
  */
  static SparseUnionDataTypeGidBuilder builder()
  {
    return new SparseUnionDataTypeGidBuilder;
  }

  /** */
  this(arrow.field.Field[] fields, byte[] typeCodes)
  {
    GArrowSparseUnionDataType* _cretval;
    auto _fields = gListFromD!(arrow.field.Field)(fields);
    scope(exit) containerFree!(GList*, arrow.field.Field, GidOwnership.None)(_fields);
    size_t _nTypeCodes;
    if (typeCodes)
      _nTypeCodes = cast(size_t)typeCodes.length;

    auto _typeCodes = typeCodes.ptr ? cast(byte*)typeCodes.ptr : [byte.init].ptr;
    _cretval = garrow_sparse_union_data_type_new(_fields, _typeCodes, _nTypeCodes);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.sparse_union_data_type.SparseUnionDataType]
class SparseUnionDataTypeGidBuilderImpl(T) : arrow.union_data_type.UnionDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.sparse_union_data_type.SparseUnionDataType]
final class SparseUnionDataTypeGidBuilder : SparseUnionDataTypeGidBuilderImpl!SparseUnionDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SparseUnionDataType build()
  {
    return new SparseUnionDataType(cast(void*)createGObject(SparseUnionDataType._getGType), Yes.Take);
  }
}
