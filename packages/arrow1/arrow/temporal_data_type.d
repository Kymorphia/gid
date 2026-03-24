/// Module for [TemporalDataType] class
module arrow.temporal_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_width_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class TemporalDataType : arrow.fixed_width_data_type.FixedWidthDataType
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
    return cast(void function())garrow_temporal_data_type_get_type != &gidSymbolNotFound ? garrow_temporal_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TemporalDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.temporal_data_type.TemporalDataType]
  Returns: New builder object
  */
  static TemporalDataTypeGidBuilder builder()
  {
    return new TemporalDataTypeGidBuilder;
  }
}

class TemporalDataTypeGidBuilderImpl(T) : arrow.fixed_width_data_type.FixedWidthDataTypeGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.temporal_data_type.TemporalDataType]
final class TemporalDataTypeGidBuilder : TemporalDataTypeGidBuilderImpl!TemporalDataTypeGidBuilder
{
  TemporalDataType build()
  {
    return new TemporalDataType(cast(void*)createGObject(TemporalDataType._getGType), No.Take);
  }
}
