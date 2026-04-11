/// Module for [BooleanStatistics] class
module parquet.boolean_statistics;

import gid.gid;
import gobject.gid_builder;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class BooleanStatistics : parquet.statistics.Statistics
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
    return cast(void function())gparquet_boolean_statistics_get_type != &gidSymbolNotFound ? gparquet_boolean_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BooleanStatistics self()
  {
    return this;
  }

  /**
      Get builder for [parquet.boolean_statistics.BooleanStatistics]
      Returns: New builder object
  */
  static BooleanStatisticsGidBuilder builder()
  {
    return new BooleanStatisticsGidBuilder;
  }

  /** */
  bool getMax()
  {
    bool _retval;
    _retval = cast(bool)gparquet_boolean_statistics_get_max(cast(GParquetBooleanStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool getMin()
  {
    bool _retval;
    _retval = cast(bool)gparquet_boolean_statistics_get_min(cast(GParquetBooleanStatistics*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.boolean_statistics.BooleanStatistics]
class BooleanStatisticsGidBuilderImpl(T) : parquet.statistics.StatisticsGidBuilderImpl!T
{
}

/// Fluent builder for [parquet.boolean_statistics.BooleanStatistics]
final class BooleanStatisticsGidBuilder : BooleanStatisticsGidBuilderImpl!BooleanStatisticsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BooleanStatistics build()
  {
    return new BooleanStatistics(cast(void*)createGObject(BooleanStatistics._getGType), No.Take);
  }
}
