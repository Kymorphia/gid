/// Module for [MonthDayNanoIntervalDataType] class
module arrow.month_day_nano_interval_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.interval_data_type;
import arrow.types;
import gid.gid;

/** */
class MonthDayNanoIntervalDataType : arrow.interval_data_type.IntervalDataType
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
    return cast(void function())garrow_month_day_nano_interval_data_type_get_type != &gidSymbolNotFound ? garrow_month_day_nano_interval_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthDayNanoIntervalDataType self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowMonthDayNanoIntervalDataType* _cretval;
    _cretval = garrow_month_day_nano_interval_data_type_new();
    this(_cretval, Yes.Take);
  }
}
