/// Module for [Decimal64ArrayBuilder] class
module arrow.decimal64_array_builder;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal64;
import arrow.decimal64_data_type;
import arrow.fixed_size_binary_array_builder;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;

/** */
class Decimal64ArrayBuilder : arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder
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
    return cast(void function())garrow_decimal64_array_builder_get_type != &gidSymbolNotFound ? garrow_decimal64_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal64ArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.decimal64_data_type.Decimal64DataType dataType)
  {
    GArrowDecimal64ArrayBuilder* _cretval;
    _cretval = garrow_decimal64_array_builder_new(dataType ? cast(GArrowDecimal64DataType*)dataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  alias appendValue = arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder.appendValue;

  /** */
  bool appendValue(arrow.decimal64.Decimal64 value = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_decimal64_array_builder_append_value(cast(GArrowDecimal64ArrayBuilder*)this._cPtr, value ? cast(GArrowDecimal64*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  alias appendValues = arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder.appendValues;

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of #GArrowDecimal64.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth is_valids is true, the Nth values is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(arrow.decimal64.Decimal64[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowDecimal64*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowDecimal64*)obj._cPtr : null;
    GArrowDecimal64** _values = cast(GArrowDecimal64**)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_decimal64_array_builder_append_values(cast(GArrowDecimal64ArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
