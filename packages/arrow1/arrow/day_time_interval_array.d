/// Module for [DayTimeIntervalArray] class
module arrow.day_time_interval_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.day_millisecond;
import arrow.primitive_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class DayTimeIntervalArray : arrow.primitive_array.PrimitiveArray
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
    return cast(void function())garrow_day_time_interval_array_get_type != &gidSymbolNotFound ? garrow_day_time_interval_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DayTimeIntervalArray self()
  {
    return this;
  }

  /**
  Get builder for [arrow.day_time_interval_array.DayTimeIntervalArray]
  Returns: New builder object
  */
  static DayTimeIntervalArrayGidBuilder builder()
  {
    return new DayTimeIntervalArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowDayTimeIntervalArray* _cretval;
    _cretval = garrow_day_time_interval_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.day_millisecond.DayMillisecond getValue(long i)
  {
    GArrowDayMillisecond* _cretval;
    _cretval = garrow_day_time_interval_array_get_value(cast(GArrowDayTimeIntervalArray*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.day_millisecond.DayMillisecond)(cast(GArrowDayMillisecond*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.day_millisecond.DayMillisecond[] getValues()
  {
    GList* _cretval;
    _cretval = garrow_day_time_interval_array_get_values(cast(GArrowDayTimeIntervalArray*)this._cPtr);
    auto _retval = gListToD!(arrow.day_millisecond.DayMillisecond, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }
}

class DayTimeIntervalArrayGidBuilderImpl(T) : arrow.primitive_array.PrimitiveArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.day_time_interval_array.DayTimeIntervalArray]
final class DayTimeIntervalArrayGidBuilder : DayTimeIntervalArrayGidBuilderImpl!DayTimeIntervalArrayGidBuilder
{
  DayTimeIntervalArray build()
  {
    return new DayTimeIntervalArray(cast(void*)createGObject(DayTimeIntervalArray._getGType), Yes.Take);
  }
}
