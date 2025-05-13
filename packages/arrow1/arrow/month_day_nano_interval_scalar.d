/// Module for [MonthDayNanoIntervalScalar] class
module arrow.month_day_nano_interval_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.month_day_nano;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class MonthDayNanoIntervalScalar : arrow.scalar.Scalar
{

  /** */
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_day_nano_interval_scalar_get_type != &gidSymbolNotFound ? garrow_month_day_nano_interval_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthDayNanoIntervalScalar self()
  {
    return this;
  }

  /** */
  this(arrow.month_day_nano.MonthDayNano value)
  {
    GArrowMonthDayNanoIntervalScalar* _cretval;
    _cretval = garrow_month_day_nano_interval_scalar_new(value ? cast(GArrowMonthDayNano*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.month_day_nano.MonthDayNano getValue()
  {
    GArrowMonthDayNano* _cretval;
    _cretval = garrow_month_day_nano_interval_scalar_get_value(cast(GArrowMonthDayNanoIntervalScalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.month_day_nano.MonthDayNano)(cast(GArrowMonthDayNano*)_cretval, No.Take);
    return _retval;
  }
}
