/// Module for [DayTimeIntervalDataType] class
module arrow.day_time_interval_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.interval_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class DayTimeIntervalDataType : arrow.interval_data_type.IntervalDataType
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
    return cast(void function())garrow_day_time_interval_data_type_get_type != &gidSymbolNotFound ? garrow_day_time_interval_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DayTimeIntervalDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.day_time_interval_data_type.DayTimeIntervalDataType]
      Returns: New builder object
  */
  static DayTimeIntervalDataTypeGidBuilder builder()
  {
    return new DayTimeIntervalDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowDayTimeIntervalDataType* _cretval;
    _cretval = garrow_day_time_interval_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.day_time_interval_data_type.DayTimeIntervalDataType]
class DayTimeIntervalDataTypeGidBuilderImpl(T) : arrow.interval_data_type.IntervalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.day_time_interval_data_type.DayTimeIntervalDataType]
final class DayTimeIntervalDataTypeGidBuilder : DayTimeIntervalDataTypeGidBuilderImpl!DayTimeIntervalDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DayTimeIntervalDataType build()
  {
    return new DayTimeIntervalDataType(cast(void*)createGObject(DayTimeIntervalDataType._getGType), Yes.Take);
  }
}
