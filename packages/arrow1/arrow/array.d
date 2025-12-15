/// Module for [Array] class
module arrow.array;

import arrow.boolean_array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.cast_options;
import arrow.chunked_array;
import arrow.count_options;
import arrow.data_type;
import arrow.dictionary_array;
import arrow.equal_options;
import arrow.filter_options;
import arrow.run_end_encode_options;
import arrow.run_end_encoded_array;
import arrow.struct_array;
import arrow.take_options;
import arrow.types;
import arrow.uint64_array;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class Array : gobject.object.ObjectWrap
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
    return cast(void function())garrow_array_get_type != &gidSymbolNotFound ? garrow_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Array self()
  {
    return this;
  }

  /** */
  static arrow.array.Array import_(void* cAbiArray, arrow.data_type.DataType dataType)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_import(cAbiArray, dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array cast_(arrow.data_type.DataType targetDataType, arrow.cast_options.CastOptions options = null)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_cast(cast(GArrowArray*)this._cPtr, targetDataType ? cast(GArrowDataType*)targetDataType._cPtr(No.Dup) : null, options ? cast(GArrowCastOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array concatenate(arrow.array.Array[] otherArrays)
  {
    GArrowArray* _cretval;
    auto _otherArrays = gListFromD!(arrow.array.Array)(otherArrays);
    scope(exit) containerFree!(GList*, arrow.array.Array, GidOwnership.None)(_otherArrays);
    GError *_err;
    _cretval = garrow_array_concatenate(cast(GArrowArray*)this._cPtr, _otherArrays, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long count(arrow.count_options.CountOptions options = null)
  {
    long _retval;
    GError *_err;
    _retval = garrow_array_count(cast(GArrowArray*)this._cPtr, options ? cast(GArrowCountOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.struct_array.StructArray countValues()
  {
    GArrowStructArray* _cretval;
    GError *_err;
    _cretval = garrow_array_count_values(cast(GArrowArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.struct_array.StructArray)(cast(GArrowStructArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.dictionary_array.DictionaryArray dictionaryEncode()
  {
    GArrowDictionaryArray* _cretval;
    GError *_err;
    _cretval = garrow_array_dictionary_encode(cast(GArrowArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.dictionary_array.DictionaryArray)(cast(GArrowDictionaryArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  string diffUnified(arrow.array.Array otherArray)
  {
    char* _cretval;
    _cretval = garrow_array_diff_unified(cast(GArrowArray*)this._cPtr, otherArray ? cast(GArrowArray*)otherArray._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  bool equal(arrow.array.Array otherArray)
  {
    bool _retval;
    _retval = cast(bool)garrow_array_equal(cast(GArrowArray*)this._cPtr, otherArray ? cast(GArrowArray*)otherArray._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalApprox(arrow.array.Array otherArray)
  {
    bool _retval;
    _retval = cast(bool)garrow_array_equal_approx(cast(GArrowArray*)this._cPtr, otherArray ? cast(GArrowArray*)otherArray._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalOptions(arrow.array.Array otherArray, arrow.equal_options.EqualOptions options = null)
  {
    bool _retval;
    _retval = cast(bool)garrow_array_equal_options(cast(GArrowArray*)this._cPtr, otherArray ? cast(GArrowArray*)otherArray._cPtr(No.Dup) : null, options ? cast(GArrowEqualOptions*)options._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalRange(long startIndex, arrow.array.Array otherArray, long otherStartIndex, long endIndex, arrow.equal_options.EqualOptions options = null)
  {
    bool _retval;
    _retval = cast(bool)garrow_array_equal_range(cast(GArrowArray*)this._cPtr, startIndex, otherArray ? cast(GArrowArray*)otherArray._cPtr(No.Dup) : null, otherStartIndex, endIndex, options ? cast(GArrowEqualOptions*)options._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool export_(out void* cAbiArray, out void* cAbiSchema)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_array_export(cast(GArrowArray*)this._cPtr, cast(void**)&cAbiArray, cast(void**)&cAbiSchema, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  arrow.array.Array filter(arrow.boolean_array.BooleanArray filter, arrow.filter_options.FilterOptions options = null)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_filter(cast(GArrowArray*)this._cPtr, filter ? cast(GArrowBooleanArray*)filter._cPtr(No.Dup) : null, options ? cast(GArrowFilterOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getLength()
  {
    long _retval;
    _retval = garrow_array_get_length(cast(GArrowArray*)this._cPtr);
    return _retval;
  }

  /** */
  long getNNulls()
  {
    long _retval;
    _retval = garrow_array_get_n_nulls(cast(GArrowArray*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getNullBitmap()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_array_get_null_bitmap(cast(GArrowArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getOffset()
  {
    long _retval;
    _retval = garrow_array_get_offset(cast(GArrowArray*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.data_type.DataType getValueDataType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_array_get_value_data_type(cast(GArrowArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.types.Type getValueType()
  {
    GArrowType _cretval;
    _cretval = garrow_array_get_value_type(cast(GArrowArray*)this._cPtr);
    arrow.types.Type _retval = cast(arrow.types.Type)_cretval;
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray isIn(arrow.array.Array right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_array_is_in(cast(GArrowArray*)this._cPtr, right ? cast(GArrowArray*)right._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.boolean_array.BooleanArray isInChunkedArray(arrow.chunked_array.ChunkedArray right)
  {
    GArrowBooleanArray* _cretval;
    GError *_err;
    _cretval = garrow_array_is_in_chunked_array(cast(GArrowArray*)this._cPtr, right ? cast(GArrowChunkedArray*)right._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.boolean_array.BooleanArray)(cast(GArrowBooleanArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool isNull(long i)
  {
    bool _retval;
    _retval = cast(bool)garrow_array_is_null(cast(GArrowArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  bool isValid(long i)
  {
    bool _retval;
    _retval = cast(bool)garrow_array_is_valid(cast(GArrowArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  arrow.run_end_encoded_array.RunEndEncodedArray runEndEncode(arrow.run_end_encode_options.RunEndEncodeOptions options = null)
  {
    GArrowRunEndEncodedArray* _cretval;
    GError *_err;
    _cretval = garrow_array_run_end_encode(cast(GArrowArray*)this._cPtr, options ? cast(GArrowRunEndEncodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.run_end_encoded_array.RunEndEncodedArray)(cast(GArrowRunEndEncodedArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array slice(long offset, long length)
  {
    GArrowArray* _cretval;
    _cretval = garrow_array_slice(cast(GArrowArray*)this._cPtr, offset, length);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortIndices(arrow.types.SortOrder order)
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_array_sort_indices(cast(GArrowArray*)this._cPtr, order, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.uint64_array.UInt64Array sortToIndices()
  {
    GArrowUInt64Array* _cretval;
    GError *_err;
    _cretval = garrow_array_sort_to_indices(cast(GArrowArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.uint64_array.UInt64Array)(cast(GArrowUInt64Array*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array take(arrow.array.Array indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_take(cast(GArrowArray*)this._cPtr, indices ? cast(GArrowArray*)indices._cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.chunked_array.ChunkedArray takeChunkedArray(arrow.chunked_array.ChunkedArray indices, arrow.take_options.TakeOptions options = null)
  {
    GArrowChunkedArray* _cretval;
    GError *_err;
    _cretval = garrow_array_take_chunked_array(cast(GArrowArray*)this._cPtr, indices ? cast(GArrowChunkedArray*)indices._cPtr(No.Dup) : null, options ? cast(GArrowTakeOptions*)options._cPtr(No.Dup) : null, &_err);
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
    _cretval = garrow_array_to_string(cast(GArrowArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /** */
  arrow.array.Array unique()
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_unique(cast(GArrowArray*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array view(arrow.data_type.DataType returnType)
  {
    GArrowArray* _cretval;
    GError *_err;
    _cretval = garrow_array_view(cast(GArrowArray*)this._cPtr, returnType ? cast(GArrowDataType*)returnType._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
