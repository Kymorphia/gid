/// Module for [Decimal256ArrayBuilder] class
module arrow.decimal256_array_builder;

import arrow.c.functions;
import arrow.c.types;
import arrow.decimal256;
import arrow.decimal256_data_type;
import arrow.fixed_size_binary_array_builder;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;

/** */
class Decimal256ArrayBuilder : arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder
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
    return cast(void function())garrow_decimal256_array_builder_get_type != &gidSymbolNotFound ? garrow_decimal256_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Decimal256ArrayBuilder self()
  {
    return this;
  }

  /** */
  this(arrow.decimal256_data_type.Decimal256DataType dataType)
  {
    GArrowDecimal256ArrayBuilder* _cretval;
    _cretval = garrow_decimal256_array_builder_new(dataType ? cast(GArrowDecimal256DataType*)dataType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  alias appendValue = arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder.appendValue;

  /** */
  bool appendValue(arrow.decimal256.Decimal256 value = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_decimal256_array_builder_append_value(cast(GArrowDecimal256ArrayBuilder*)this._cPtr, value ? cast(GArrowDecimal256*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  alias appendValues = arrow.fixed_size_binary_array_builder.FixedSizeBinaryArrayBuilder.appendValues;

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` and `append_null` calls.
  
      Params:
        values = The array of #GArrowDecimal256.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth is_valids is true, the Nth values is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(arrow.decimal256.Decimal256[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowDecimal256*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowDecimal256*)obj._cPtr : null;
    GArrowDecimal256** _values = cast(GArrowDecimal256**)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_decimal256_array_builder_append_values(cast(GArrowDecimal256ArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
