/// Module for [DayMillisecond] class
module arrow.day_millisecond;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class DayMillisecond : gobject.object.ObjectWrap
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
    return cast(void function())garrow_day_millisecond_get_type != &gidSymbolNotFound ? garrow_day_millisecond_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DayMillisecond self()
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
      Get `millisecond` property.
      Returns: The millisecond part value.
  */
  @property int millisecond()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("millisecond");
  }

  /**
      Set `millisecond` property.
      Params:
        propval = The millisecond part value.
  */
  @property void millisecond(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("millisecond", propval);
  }

  /** */
  this(int day, int millisecond)
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_millisecond_new(day, millisecond);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.day_millisecond.DayMillisecond otherDayMillisecond)
  {
    bool _retval;
    _retval = cast(bool)garrow_day_millisecond_equal(cast(GArrowDayMillisecond*)this._cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.day_millisecond.DayMillisecond otherDayMillisecond)
  {
    bool _retval;
    _retval = cast(bool)garrow_day_millisecond_less_than(cast(GArrowDayMillisecond*)this._cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond._cPtr(No.Dup) : null);
    return _retval;
  }
}
