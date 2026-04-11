/// Module for [SparseUnionArray] class
module arrow.sparse_union_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.int8_array;
import arrow.sparse_union_data_type;
import arrow.types;
import arrow.union_array;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class SparseUnionArray : arrow.union_array.UnionArray
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
    return cast(void function())garrow_sparse_union_array_get_type != &gidSymbolNotFound ? garrow_sparse_union_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SparseUnionArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.sparse_union_array.SparseUnionArray]
      Returns: New builder object
  */
  static SparseUnionArrayGidBuilder builder()
  {
    return new SparseUnionArrayGidBuilder;
  }

  /** */
  this(arrow.int8_array.Int8Array typeIds, arrow.array.Array[] fields)
  {
    GArrowSparseUnionArray* _cretval;
    auto _fields = gListFromD!(arrow.array.Array)(fields);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_sparse_union_array_new(typeIds ? cast(GArrowInt8Array*)typeIds._cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.sparse_union_array.SparseUnionArray newDataType(arrow.sparse_union_data_type.SparseUnionDataType dataType, arrow.int8_array.Int8Array typeIds, arrow.array.Array[] fields)
  {
    GArrowSparseUnionArray* _cretval;
    auto _fields = gListFromD!(arrow.array.Array)(fields);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_sparse_union_array_new_data_type(dataType ? cast(GArrowSparseUnionDataType*)dataType._cPtr(No.Dup) : null, typeIds ? cast(GArrowInt8Array*)typeIds._cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.sparse_union_array.SparseUnionArray)(cast(GArrowSparseUnionArray*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.sparse_union_array.SparseUnionArray]
class SparseUnionArrayGidBuilderImpl(T) : arrow.union_array.UnionArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.sparse_union_array.SparseUnionArray]
final class SparseUnionArrayGidBuilder : SparseUnionArrayGidBuilderImpl!SparseUnionArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SparseUnionArray build()
  {
    return new SparseUnionArray(cast(void*)createGObject(SparseUnionArray._getGType), Yes.Take);
  }
}
