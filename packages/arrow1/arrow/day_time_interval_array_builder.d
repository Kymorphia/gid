/// Module for [DayTimeIntervalArrayBuilder] class
module arrow.day_time_interval_array_builder;

import arrow.array_builder;
import arrow.c.functions;
import arrow.c.types;
import arrow.day_millisecond;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class DayTimeIntervalArrayBuilder : arrow.array_builder.ArrayBuilder
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
    return cast(void function())garrow_day_time_interval_array_builder_get_type != &gidSymbolNotFound ? garrow_day_time_interval_array_builder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DayTimeIntervalArrayBuilder self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowDayTimeIntervalArrayBuilder* _cretval;
    _cretval = garrow_day_time_interval_array_builder_new();
    this(_cretval, Yes.Take);
  }

  /** */
  bool appendValue(arrow.day_millisecond.DayMillisecond value)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_day_time_interval_array_builder_append_value(cast(GArrowDayTimeIntervalArrayBuilder*)this._cPtr, value ? cast(GArrowDayMillisecond*)value._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Append multiple values at once. It's more efficient than multiple
      `append` calls.
  
      Params:
        values = The array of a #GArrowDayMillisecond.
        isValids = The array of
            boolean that shows whether the Nth value is valid or not. If the
            Nth `is_valids` is true, the Nth `values` is valid value. Otherwise
            the Nth value is null value.
      Returns: true on success, false if there was an error.
      Throws: [ErrorWrap]
  */
  bool appendValues(arrow.day_millisecond.DayMillisecond[] values, bool[] isValids = null)
  {
    bool _retval;
    long _valuesLength;
    if (values)
      _valuesLength = cast(long)values.length;

    GArrowDayMillisecond*[] _tmpvalues;
    foreach (obj; values)
      _tmpvalues ~= obj ? cast(GArrowDayMillisecond*)obj._cPtr : null;
    const(GArrowDayMillisecond*)* _values = cast(const(GArrowDayMillisecond*)*)_tmpvalues.ptr;

    long _isValidsLength;
    if (isValids)
      _isValidsLength = cast(long)isValids.length;

    auto _isValids = cast(const(gboolean)*)isValids.ptr;
    GError *_err;
    _retval = cast(bool)garrow_day_time_interval_array_builder_append_values(cast(GArrowDayTimeIntervalArrayBuilder*)this._cPtr, _values, _valuesLength, _isValids, _isValidsLength, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
