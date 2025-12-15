/// Module for [MonthDayNanoIntervalArrayBuilder] class
module arrow.month_day_nano_interval_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.month_day_nano;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class MonthDayNanoIntervalArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_month_day_nano_interval_array_builder_get_type != &gidSymbolNotFound ? garrow_month_day_nano_interval_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthDayNanoIntervalArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowMonthDayNanoIntervalArrayBuilder* _cretval;
    _cretval = garrow_month_day_nano_interval_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue(arrow.month_day_nano.MonthDayNano value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_month_day_nano_interval_array_builder_append_value(cast(GArrowMonthDayNanoIntervalArrayBuilder*)this._cPtr, value ? cast(GArrowMonthDayNano*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` calls.
  
      Params:
        values = The array of a #GArrowMonthDayNano.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(arrow.month_day_nano.MonthDayNano[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowMonthDayNano*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowMonthDayNano*)obj._cPtr : null;
    const(GArrowMonthDayNano*)* _values = cast(const(GArrowMonthDayNano*)*)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_month_day_nano_interval_array_builder_append_values(cast(GArrowMonthDayNanoIntervalArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
