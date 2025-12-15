/// Module for [MonthDayNano] class
module arrow.month_day_nano;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class MonthDayNano : gobject.object.ObjectWrap
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
    return cast(void function())garrow_month_day_nano_get_type != &gidSymbolNotFound ? garrow_month_day_nano_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthDayNano self()
  {
    return this;
  }

  /**
      Get `day` property.
      Returns: The day part value.
  */
  @property int day()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("day");
  }

  /**
      Set `day` property.
      Params:
        propval = The day part value.
  */
  @property void day(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("day", propval);
  }

  /**
      Get `month` property.
      Returns: The month part value.
  */
  @property int month()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("month");
  }

  /**
      Set `month` property.
      Params:
        propval = The month part value.
  */
  @property void month(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("month", propval);
  }

  /**
      Get `nanosecond` property.
      Returns: The nanosecond part value.
  */
  @property long nanosecond()
  {
    return gobject.object.ObjectWrap.getProperty!(long)("nanosecond");
  }

  /**
      Set `nanosecond` property.
      Params:
        propval = The nanosecond part value.
  */
  @property void nanosecond(long propval)
  {
    gobject.object.ObjectWrap.setProperty!(long)("nanosecond", propval);
  }

  /** */
  this(int month, int day, long nanosecond)
  {
    GArrowMonthDayNano* _cretval;
    _cretval = garrow_month_day_nano_new(month, day, nanosecond);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.month_day_nano.MonthDayNano otherMonthNanoDay)
  {
    bool _retval;
    _retval = cast(bool)garrow_month_day_nano_equal(cast(GArrowMonthDayNano*)this._cPtr, otherMonthNanoDay ? cast(GArrowMonthDayNano*)otherMonthNanoDay._cPtr(No.Dup) : null);
    return _retval;
  }
}
