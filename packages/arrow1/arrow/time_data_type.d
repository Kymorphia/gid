/// Module for [TimeDataType] class
module arrow.time_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class TimeDataType : arrow.temporal_data_type.TemporalDataType
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
    return cast(void function())garrow_time_data_type_get_type != &gidSymbolNotFound ? garrow_time_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimeDataType self()
  {
    return this;
  }

  /**
      Get builder for [arrow.time_data_type.TimeDataType]
      Returns: New builder object
  */
  static TimeDataTypeGidBuilder builder()
  {
    return new TimeDataTypeGidBuilder;
  }

  /** */
  arrow.types.TimeUnit getUnit()
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_time_data_type_get_unit(cast(GArrowTimeDataType*)this._cPtr);
    arrow.types.TimeUnit _retval = cast(arrow.types.TimeUnit)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.time_data_type.TimeDataType]
class TimeDataTypeGidBuilderImpl(T) : arrow.temporal_data_type.TemporalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.time_data_type.TimeDataType]
final class TimeDataTypeGidBuilder : TimeDataTypeGidBuilderImpl!TimeDataTypeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TimeDataType build()
  {
    return new TimeDataType(cast(void*)createGObject(TimeDataType._getGType), No.Take);
  }
}
