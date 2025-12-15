/// Module for [StringDictionaryArrayBuilder] class
module arrow.string_dictionary_array_builder;

import arrow.array;
import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.string_array;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class StringDictionaryArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_string_dictionary_array_builder_get_type != &gidSymbolNotFound ? garrow_string_dictionary_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringDictionaryArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowStringDictionaryArrayBuilder* _cretval;
    _cretval = garrow_string_dictionary_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendArray(arrow.string_array.StringArray array)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_string_dictionary_array_builder_append_array(cast(GArrowStringDictionaryArrayBuilder*)this._cPtr, array ? cast(GArrowStringArray*)array._cPtr(No.Dup) : null, &_err);
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
    _retval = cast(bool)garrow_string_dictionary_array_builder_append_indices(cast(GArrowStringDictionaryArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendString(string value)
  {
    bool _retval;
    const(char)* _value = value.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)garrow_string_dictionary_array_builder_append_string(cast(GArrowStringDictionaryArrayBuilder*)this._cPtr, _value, &_err);
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
    _retval = cast(bool)garrow_string_dictionary_array_builder_finish_delta(cast(GArrowStringDictionaryArrayBuilder*)this._cPtr, &_outIndices, &_outDelta, &_err);
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
    _retval = garrow_string_dictionary_array_builder_get_dictionary_length(cast(GArrowStringDictionaryArrayBuilder*)this._cPtr);
    return _retval;
  }

  /** */
  bool insertMemoValues(arrow.string_array.StringArray values)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_string_dictionary_array_builder_insert_memo_values(cast(GArrowStringDictionaryArrayBuilder*)this._cPtr, values ? cast(GArrowStringArray*)values._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Reset and also clear accumulated dictionary values in memo table.
  */
  void resetFull()
  {
    garrow_string_dictionary_array_builder_reset_full(cast(GArrowStringDictionaryArrayBuilder*)this._cPtr);
  }
}
