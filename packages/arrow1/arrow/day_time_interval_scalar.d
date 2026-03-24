/// Module for [DayTimeIntervalScalar] class
module arrow.day_time_interval_scalar;

import arrow.c.functions;
import arrow.c.types;
import arrow.day_millisecond;
import arrow.scalar;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DayTimeIntervalScalar : arrow.scalar.Scalar
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
    return cast(void function())garrow_day_time_interval_scalar_get_type != &gidSymbolNotFound ? garrow_day_time_interval_scalar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DayTimeIntervalScalar self()
  {
    return this;
  }

  /**
  Get builder for [arrow.day_time_interval_scalar.DayTimeIntervalScalar]
  Returns: New builder object
  */
  static DayTimeIntervalScalarGidBuilder builder()
  {
    return new DayTimeIntervalScalarGidBuilder;
  }

  /** */
  this(arrow.day_millisecond.DayMillisecond value)
  {
    GArrowDayTimeIntervalScalar* _cretval;
    _cretval = garrow_day_time_interval_scalar_new(value ? cast(GArrowDayMillisecond*)value._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.day_millisecond.DayMillisecond getValue()
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_time_interval_scalar_get_value(cast(GArrowDayTimeIntervalScalar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.day_millisecond.DayMillisecond)(cast(GArrowDayMillisecond*)_cretval, No.Take);
    return _retval;
  }
}

class DayTimeIntervalScalarGidBuilderImpl(T) : arrow.scalar.ScalarGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.day_time_interval_scalar.DayTimeIntervalScalar]
final class DayTimeIntervalScalarGidBuilder : DayTimeIntervalScalarGidBuilderImpl!DayTimeIntervalScalarGidBuilder
{
  DayTimeIntervalScalar build()
  {
    return new DayTimeIntervalScalar(cast(void*)createGObject(DayTimeIntervalScalar._getGType), Yes.Take);
  }
}
