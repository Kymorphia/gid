/// Module for [Int8ArrayBuilder] class
module arrow.int8_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class Int8ArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_int8_array_builder_get_type != &gidSymbolNotFound ? garrow_int8_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int8ArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowInt8ArrayBuilder* _cretval;
    _cretval = garrow_int8_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool append(byte value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_int8_array_builder_append(cast(GArrowInt8ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool appendValue(byte value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_int8_array_builder_append_value(cast(GArrowInt8ArrayBuilder*)this._cPtr, value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of int8.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(byte[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    auto _values = cast(const(byte)*)values.ptr;
    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_int8_array_builder_append_values(cast(GArrowInt8ArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
