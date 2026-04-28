/// Module for [DenseUnionDataType] class
module arrow.dense_union_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.field;
import arrow.types;
import arrow.union_data_type;
import gid.gid;
import gobject.gid_builder;

/** */
class DenseUnionDataType : arrow.union_data_type.UnionDataType
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
    return cast(void function())garrow_dense_union_data_type_get_type != &gidSymbolNotFound ? garrow_dense_union_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DenseUnionDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.dense_union_data_type.DenseUnionDataType]
      Returns: New builder object
  */
  static DenseUnionDataTypeGidBuilder builder()
  {
    return new DenseUnionDataTypeGidBuilder;
  }

  /** */
  this(arrow.field.Field[] fields, byte[] typeCodes)
  {
    GArrowDenseUnionDataType* _cretval;
    auto _fields = gListFromD!(arrow.field.Field)(fields);
    scope(exit) containerFree!(GList*, arrow.field.Field, GidOwnership.None)(_fields);
    size_t _nTypeCodes;
    if (typeCodes)
      _nTypeCodes = cast(size_t)typeCodes.length;

    auto _typeCodes = typeCodes.ptr ? cast(byte*)typeCodes.ptr : [byte.init].ptr;
    _cretval = garrow_dense_union_data_type_new(_fields, _typeCodes, _nTypeCodes);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.dense_union_data_type.DenseUnionDataType]
class DenseUnionDataTypeGidBuilderImpl(T) : arrow.union_data_type.UnionDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.dense_union_data_type.DenseUnionDataType]
final class DenseUnionDataTypeGidBuilder : DenseUnionDataTypeGidBuilderImpl!DenseUnionDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DenseUnionDataType build()
  {
    return new DenseUnionDataType(cast(void*)createGObject(DenseUnionDataType._getGType), Yes.Take);
  }
}
