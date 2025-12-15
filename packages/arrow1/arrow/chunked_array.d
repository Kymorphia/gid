/// Module for [ChunkedArray] class
module arrow.chunked_array;

import arrow.array;
import arrow.boolean_array;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.filter_options;
import arrow.take_options;
import arrow.types;
import arrow.uint64_array;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ChunkedArray : gobject.object.ObjectWrap
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
    return cast(void function())garrow_chunked_array_get_type != &gidSymbolNotFound ? garrow_chunked_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ChunkedArray self()
  {
    return this;
  }

  /** */
  this(arrow.array.Array[] chunks)
  {
    GArrowChunkedArray* _cretval;
    auto _chunks = gListFromD!(arrow.array.Array)(chunks);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_chunks);
    GError *_err;
    _cretval = garrow_chunked_array_new(_chunks, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.chunked_array.ChunkedArray newEmpty(arrow.data_type.DataType dataType)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_new_empty(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array combine()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_combine(cast(GArrowChunkedArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.chunked_array.ChunkedArray otherChunkedArray)
  {
    bool _retval;
    _retval = cast(bool)garrow_chunked_array_equal(cast(GArrowChunkedArray*)this._cPtr, otherChunkedArray ? cast(GArrowChunkedArray*)otherChunkedArray._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray filter(arrow.boolean_array.BooleanArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_filter(cast(GArrowChunkedArray*)this._cPtr, filter ? cast(GArrowBooleanArray*)filter._cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray filterChunkedArray(arrow.chunked_array.ChunkedArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_filter_chunked_array(cast(GArrowChunkedArray*)this._cPtr, filter ? cast(GArrowChunkedArray*)filter._cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getChunk(uint i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_chunked_array_get_chunk(cast(GArrowChunkedArray*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array[] getChunks()
  {
    GList* _cretval;
    _cretval = garrow_chunked_array_get_chunks(cast(GArrowChunkedArray*)this._cPtr);
    auto _retval = gListToD!(arrow.array.Array, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /** */
  ulong getLength()
  {
    ulong _retval;
    _retval = garrow_chunked_array_get_length(cast(GArrowChunkedArray*)this._cPtr);
    return _retval;
  }

  /** */
  uint getNChunks()
  {
    uint _retval;
    _retval = garrow_chunked_array_get_n_chunks(cast(GArrowChunkedArray*)this._cPtr);
    return _retval;
  }

  /** */
  ulong getNNulls()
  {
    ulong _retval;
    _retval = garrow_chunked_array_get_n_nulls(cast(GArrowChunkedArray*)this._cPtr);
    return _retval;
  }

  /** */
  ulong getNRows()
  {
    ulong _retval;
    _retval = garrow_chunked_array_get_n_rows(cast(GArrowChunkedArray*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_chunked_array_get_value_data_type(cast(GArrowChunkedArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.types.Type getValueType()
  {
    GArrowType _cretval;
    _cretval = garrow_chunked_array_get_value_type(cast(GArrowChunkedArray*)this._cPtr);
    arrow.types.Type _retval = cast(arrow.types.Type)_cretval;
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray slice(ulong offset, ulong length)
  {
    GArrowChunkedArray* _cretval;
    _cretval = garrow_chunked_array_slice(cast(GArrowChunkedArray*)this._cPtr, offset, length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortIndices(arrow.types.SortOrder order)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_sort_indices(cast(GArrowChunkedArray*)this._cPtr, order, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray take(arrow.array.Array indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_take(cast(GArrowChunkedArray*)this._cPtr, indices ? cast(GArrowArray*)indices._cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray takeChunkedArray(arrow.chunked_array.ChunkedArray indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_take_chunked_array(cast(GArrowChunkedArray*)this._cPtr, indices ? cast(GArrowChunkedArray*)indices._cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.chunked_array.ChunkedArray)(cast(GArrowChunkedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string toString_()
  {
    char* _cretval;
    GError *_err;
    _cretval = garrow_chunked_array_to_string(cast(GArrowChunkedArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
