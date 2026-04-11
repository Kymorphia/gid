/// Module for [DenseUnionArray] class
module arrow.dense_union_array;

import arrow.array;
import arrow.c.functions;
import arrow.c.types;
import arrow.dense_union_data_type;
import arrow.int32_array;
import arrow.int8_array;
import arrow.types;
import arrow.union_array;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class DenseUnionArray : arrow.union_array.UnionArray
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
    return cast(void function())garrow_dense_union_array_get_type != &gidSymbolNotFound ? garrow_dense_union_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DenseUnionArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.dense_union_array.DenseUnionArray]
      Returns: New builder object
  */
  static DenseUnionArrayGidBuilder builder()
  {
    return new DenseUnionArrayGidBuilder;
  }

  /** */
  @property arrow.int32_array.Int32Array valueOffsets()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.int32_array.Int32Array)("value-offsets");
  }

  /** */
  this(arrow.int8_array.Int8Array typeIds, arrow.int32_array.Int32Array valueOffsets, arrow.array.Array[] fields)
  {
    GArrowDenseUnionArray* _cretval;
    auto _fields = gListFromD!(arrow.array.Array)(fields);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_dense_union_array_new(typeIds ? cast(GArrowInt8Array*)typeIds._cPtr(No.Dup) : null, valueOffsets ? cast(GArrowInt32Array*)valueOffsets._cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.dense_union_array.DenseUnionArray newDataType(arrow.dense_union_data_type.DenseUnionDataType dataType, arrow.int8_array.Int8Array typeIds, arrow.int32_array.Int32Array valueOffsets, arrow.array.Array[] fields)
  {
    GArrowDenseUnionArray* _cretval;
    auto _fields = gListFromD!(arrow.array.Array)(fields);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_fields);
    GError *_err;
    _cretval = garrow_dense_union_array_new_data_type(dataType ? cast(GArrowDenseUnionDataType*)dataType._cPtr(No.Dup) : null, typeIds ? cast(GArrowInt8Array*)typeIds._cPtr(No.Dup) : null, valueOffsets ? cast(GArrowInt32Array*)valueOffsets._cPtr(No.Dup) : null, _fields, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.dense_union_array.DenseUnionArray)(cast(GArrowDenseUnionArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  int getValueOffset(long i)
  {
    int _retval;
    _retval = garrow_dense_union_array_get_value_offset(cast(GArrowDenseUnionArray*)this._cPtr, i);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.dense_union_array.DenseUnionArray]
class DenseUnionArrayGidBuilderImpl(T) : arrow.union_array.UnionArrayGidBuilderImpl!T
{

  /** */
  T valueOffsets(arrow.int32_array.Int32Array propval)
  {
    return setProperty("value-offsets", propval);
  }
}

/// Fluent builder for [arrow.dense_union_array.DenseUnionArray]
final class DenseUnionArrayGidBuilder : DenseUnionArrayGidBuilderImpl!DenseUnionArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DenseUnionArray build()
  {
    return new DenseUnionArray(cast(void*)createGObject(DenseUnionArray._getGType), Yes.Take);
  }
}
