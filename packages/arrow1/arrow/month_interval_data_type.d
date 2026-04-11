/// Module for [MonthIntervalDataType] class
module arrow.month_interval_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.interval_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class MonthIntervalDataType : arrow.interval_data_type.IntervalDataType
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
    return cast(void function())garrow_month_interval_data_type_get_type != &gidSymbolNotFound ? garrow_month_interval_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MonthIntervalDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.month_interval_data_type.MonthIntervalDataType]
      Returns: New builder object
  */
  static MonthIntervalDataTypeGidBuilder builder()
  {
    return new MonthIntervalDataTypeGidBuilder;
  }

  /** */
  this()
  {
    GArrowMonthIntervalDataType* _cretval;
    _cretval = garrow_month_interval_data_type_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.month_interval_data_type.MonthIntervalDataType]
class MonthIntervalDataTypeGidBuilderImpl(T) : arrow.interval_data_type.IntervalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.month_interval_data_type.MonthIntervalDataType]
final class MonthIntervalDataTypeGidBuilder : MonthIntervalDataTypeGidBuilderImpl!MonthIntervalDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MonthIntervalDataType build()
  {
    return new MonthIntervalDataType(cast(void*)createGObject(MonthIntervalDataType._getGType), Yes.Take);
  }
}
