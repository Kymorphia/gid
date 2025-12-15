/// Module for [BinaryDictionaryArrayBuilder] class
module arrow.binary_dictionary_array_builder;

import arrow.array;
import arrow.array_builder;
import arrow.binary_array;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;

/** */
class BinaryDictionaryArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_binary_dictionary_array_builder_get_type != &gidSymbolNotFound ? garrow_binary_dictionary_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryDictionaryArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowBinaryDictionaryArrayBuilder* _cretval;
    _cretval = garrow_binary_dictionary_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendArray(arrow.binary_array.BinaryArray array)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_binary_dictionary_array_builder_append_array(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr, array ? cast(GArrowBinaryArray*)array._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append dictionary indices directly without modifying the internal memo.
  
      Params:
        values = The array of indices.
        isValids = The array of
            true or false that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendIndices(long[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(long)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_binary_dictionary_array_builder_append_indices(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(ubyte[] value)
  {
    bool _retval;
    int _length;
    if (value)
      _length = cast(int)value.length;

    auto _value = cast(const(ubyte)*)value.ptr;
    GError *_err;
    _retval = cast(bool)garrow_binary_dictionary_array_builder_append_value(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValueBytes(glib.bytes.Bytes value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_binary_dictionary_array_builder_append_value_bytes(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr, value ? cast(GBytes*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool finishDelta(out arrow.array.Array outIndices, out arrow.array.Array outDelta)
  {
    bool _retval;
    GArrowArray* _outIndices;
    GArrowArray* _outDelta;
    GError *_err;
    _retval = cast(bool)garrow_binary_dictionary_array_builder_finish_delta(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr, &_outIndices, &_outDelta, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    outIndices = new arrow.array.Array(cast(void*)_outIndices, Yes.Take);
    outDelta = new arrow.array.Array(cast(void*)_outDelta, Yes.Take);
    return _retval;
  }

  /** */
  long getDictionaryLength()
  {
    long _retval;
    _retval = garrow_binary_dictionary_array_builder_get_dictionary_length(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  bool insertMemoValues(arrow.binary_array.BinaryArray values)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_binary_dictionary_array_builder_insert_memo_values(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr, values ? cast(GArrowBinaryArray*)values._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reset and also clear accumulated dictionary values in memo table.
  */
  void resetFull()
  {
    garrow_binary_dictionary_array_builder_reset_full(cast(GArrowBinaryDictionaryArrayBuilder*)this._cPtr);
  }
}
