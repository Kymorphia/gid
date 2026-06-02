/// Module for [DayMillisecond] class
module arrow.day_millisecond;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DayMillisecond : gobject.object.ObjectWrap
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
    return cast(void function())garrow_day_millisecond_get_type != &gidSymbolNotFound ? garrow_day_millisecond_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DayMillisecond self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.day_millisecond.DayMillisecond]
      Returns: New builder object
  */
  static DayMillisecondGidBuilder builder() nothrow
  {
    return new DayMillisecondGidBuilder;
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
      Get `millisecond` property.
      Returns: The millisecond part value.
  */
  @property int millisecond() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("millisecond");
  }

  /**
      Set `millisecond` property.
      Params:
        propval = The millisecond part value.
  */
  @property void millisecond(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("millisecond", propval);
  }

  /** */
  this(int day, int millisecond) nothrow
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_millisecond_new(day, millisecond);
    this(_cretval, Yes.Take);
  }

  /** */
  bool equal(arrow.day_millisecond.DayMillisecond otherDayMillisecond) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_day_millisecond_equal(cast(GArrowDayMillisecond*)this._cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool lessThan(arrow.day_millisecond.DayMillisecond otherDayMillisecond) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_day_millisecond_less_than(cast(GArrowDayMillisecond*)this._cPtr, otherDayMillisecond ? cast(GArrowDayMillisecond*)otherDayMillisecond._cPtr(No.Dup) : null);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.day_millisecond.DayMillisecond]
class DayMillisecondGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
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
      Set `millisecond` property.
      Params:
        propval = The millisecond part value.
      Returns: Builder instance for fluent chaining
  */
  T millisecond(int propval) nothrow
  {
    return setProperty("millisecond", propval);
  }
}

/// Fluent builder for [arrow.day_millisecond.DayMillisecond]
final class DayMillisecondGidBuilder : DayMillisecondGidBuilderImpl!DayMillisecondGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DayMillisecond build() nothrow
  {
    return new DayMillisecond(cast(void*)createGObject(DayMillisecond._getGType), Yes.Take);
  }
}
