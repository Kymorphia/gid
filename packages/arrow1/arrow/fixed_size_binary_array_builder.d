/// Module for [FixedSizeBinaryArrayBuilder] class
module arrow.fixed_size_binary_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;

/** */
class FixedSizeBinaryArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_fixed_size_binary_array_builder_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeBinaryArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType dataType)
  {
    GArrowFixedSizeBinaryArrayBuilder* _cretval;
    _cretval = garrow_fixed_size_binary_array_builder_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue(ubyte[] value = null)
  {
    bool _retval;
    int _length;
    if (value)
      _length = cast(int)value.length;

    auto _value = cast(const(ubyte)*)value.ptr;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_value(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValueBytes(glib.bytes.Bytes value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_value_bytes(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, value ? cast(GBytes*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of #GBytes.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth is_valids is true, the Nth values is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(glib.bytes.Bytes[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GBytes*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= cast(GBytes*)obj._cPtr;
    GBytes** _values = _tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_values(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
      
      This is more efficient than
      [arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder.appendValues].
  
      Params:
        values = A #GBytes that contains multiple values.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth is_valids is true, the Nth values is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValuesPacked(glib.bytes.Bytes values, bool[] isValids = null)
  {
    bool _retval;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_fixed_size_binary_array_builder_append_values_packed(cast(GArrowFixedSizeBinaryArrayBuilder*)this._cPtr, values ? cast(GBytes*)values._cPtr(No.Dup) : null, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
