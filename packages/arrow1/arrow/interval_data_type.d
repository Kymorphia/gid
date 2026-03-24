/// Module for [IntervalDataType] class
module arrow.interval_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class IntervalDataType : arrow.temporal_data_type.TemporalDataType
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
    return cast(void function())garrow_interval_data_type_get_type != &gidSymbolNotFound ? garrow_interval_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IntervalDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.interval_data_type.IntervalDataType]
  Returns: New builder object
  */
  static IntervalDataTypeGidBuilder builder()
  {
    return new IntervalDataTypeGidBuilder;
  }

  /** */
  arrow.types.IntervalType getIntervalType()
  {
    GArrowIntervalType _cretval;
    _cretval = garrow_interval_data_type_get_interval_type(cast(GArrowIntervalDataType*)this._cPtr);
    arrow.types.IntervalType _retval = cast(arrow.types.IntervalType)_cretval;
    return _retval;
  }
}

class IntervalDataTypeGidBuilderImpl(T) : arrow.temporal_data_type.TemporalDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.interval_data_type.IntervalDataType]
final class IntervalDataTypeGidBuilder : IntervalDataTypeGidBuilderImpl!IntervalDataTypeGidBuilder
{
  IntervalDataType build()
  {
    return new IntervalDataType(cast(void*)createGObject(IntervalDataType._getGType), No.Take);
  }
}
