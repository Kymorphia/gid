/// Module for [MonthDayNano] class
module arrow.month_day_nano;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class MonthDayNano : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_month_day_nano_get_type != &gidSymbolNotFound ? garrow_month_day_nano_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthDayNano self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.month_day_nano.MonthDayNano]
      Returns: New builder object
  */
  static MonthDayNanoGidBuilder builder() nothrow
  {
    return new MonthDayNanoGidBuilder;
  }

  /**
      Get `day` property.
      Returns: The day part value.
  */
  @property int day() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("day");
  }

  /**
      Set `day` property.
      Params:
        propval = The day part value.
  */
  @property void day(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("day", propval);
  }

  /**
      Get `month` property.
      Returns: The month part value.
  */
  @property int month() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("month");
  }

  /**
      Set `month` property.
      Params:
        propval = The month part value.
  */
  @property void month(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("month", propval);
  }

  /**
      Get `nanosecond` property.
      Returns: The nanosecond part value.
  */
  @property long nanosecond() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("nanosecond");
  }

  /**
      Set `nanosecond` property.
      Params:
        propval = The nanosecond part value.
  */
  @property void nanosecond(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("nanosecond", propval);
  }

  /** */
  this(int month, int day, long nanosecond) nothrow
  {
    GArrowMonthDayNano* _cretval;
    _cretval = garrow_month_day_nano_new(month, day, nanosecond);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.month_day_nano.MonthDayNano otherMonthNanoDay) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_month_day_nano_equal(cast(GArrowMonthDayNano*)this._cPtr, otherMonthNanoDay ? cast(GArrowMonthDayNano*)otherMonthNanoDay._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.month_day_nano.MonthDayNano]
class MonthDayNanoGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `day` property.
      Params:
        propval = The day part value.
      Returns: Builder instance for fluent chaining
  */
  T day(int propval) nothrow
  {
    return setProperty("day", propval);
  }

  /**
      Set `month` property.
      Params:
        propval = The month part value.
      Returns: Builder instance for fluent chaining
  */
  T month(int propval) nothrow
  {
    return setProperty("month", propval);
  }

  /**
      Set `nanosecond` property.
      Params:
        propval = The nanosecond part value.
      Returns: Builder instance for fluent chaining
  */
  T nanosecond(long propval) nothrow
  {
    return setProperty("nanosecond", propval);
  }
}

/// Fluent builder for [arrow.month_day_nano.MonthDayNano]
final class MonthDayNanoGidBuilder : MonthDayNanoGidBuilderImpl!MonthDayNanoGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MonthDayNano build() nothrow
  {
    return new MonthDayNano(cast(void*)createGObject(MonthDayNano._getGType), Yes.Take);
  }
}
