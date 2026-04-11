/// Module for [FloatStatistics] class
module parquet.float_statistics;

import gid.gid;
import gobject.gid_builder;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class FloatStatistics : parquet.statistics.Statistics
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
    return cast(void function())gparquet_float_statistics_get_type != &gidSymbolNotFound ? gparquet_float_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FloatStatistics self()
  {
    return this;
  }

  /**
      Get builder for [parquet.float_statistics.FloatStatistics]
      Returns: New builder object
  */
  static FloatStatisticsGidBuilder builder()
  {
    return new FloatStatisticsGidBuilder;
  }

  /** */
  float getMax()
  {
    float _retval;
    _retval = gparquet_float_statistics_get_max(cast(GParquetFloatStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  float getMin()
  {
    float _retval;
    _retval = gparquet_float_statistics_get_min(cast(GParquetFloatStatistics*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.float_statistics.FloatStatistics]
class FloatStatisticsGidBuilderImpl(T) : parquet.statistics.StatisticsGidBuilderImpl!T
{
}

/// Fluent builder for [parquet.float_statistics.FloatStatistics]
final class FloatStatisticsGidBuilder : FloatStatisticsGidBuilderImpl!FloatStatisticsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FloatStatistics build()
  {
    return new FloatStatistics(cast(void*)createGObject(FloatStatistics._getGType), No.Take);
  }
}
