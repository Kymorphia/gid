/// Module for [LargeBinaryArrayBuilder] class
module arrow.large_binary_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;

/** */
class LargeBinaryArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_large_binary_array_builder_get_type != &gidSymbolNotFound ? garrow_large_binary_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeBinaryArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowLargeBinaryArrayBuilder* _cretval;
    _cretval = garrow_large_binary_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue(ubyte[] value)
  {
    bool _retval;
    long _length;
    if (value)
      _length = cast(long)value.length;

    auto _value = cast(const(ubyte)*)value.ptr;
    GError *_err;
    _retval = cast(bool)garrow_large_binary_array_builder_append_value(cast(GArrowLargeBinaryArrayBuilder*)this._cPtr, _value, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValueBytes(glib.bytes.Bytes value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_large_binary_array_builder_append_value_bytes(cast(GArrowLargeBinaryArrayBuilder*)this._cPtr, value ? cast(GBytes*)value._cPtr(No.Dup) : null, &_err);
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
    _retval = cast(bool)garrow_large_binary_array_builder_append_values(cast(GArrowLargeBinaryArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
