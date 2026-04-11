/// Module for [Int64Statistics] class
module parquet.int64_statistics;

import gid.gid;
import gobject.gid_builder;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class Int64Statistics : parquet.statistics.Statistics
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
    return cast(void function())gparquet_int64_statistics_get_type != &gidSymbolNotFound ? gparquet_int64_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int64Statistics self()
  {
    return this;
  }

  /**
      Get builder for [parquet.int64_statistics.Int64Statistics]
      Returns: New builder object
  */
  static Int64StatisticsGidBuilder builder()
  {
    return new Int64StatisticsGidBuilder;
  }

  /** */
  long getMax()
  {
    long _retval;
    _retval = gparquet_int64_statistics_get_max(cast(GParquetInt64Statistics*)this._cPtr);
    return _retval;
  }

  /** */
  long getMin()
  {
    long _retval;
    _retval = gparquet_int64_statistics_get_min(cast(GParquetInt64Statistics*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.int64_statistics.Int64Statistics]
class Int64StatisticsGidBuilderImpl(T) : parquet.statistics.StatisticsGidBuilderImpl!T
{
}

/// Fluent builder for [parquet.int64_statistics.Int64Statistics]
final class Int64StatisticsGidBuilder : Int64StatisticsGidBuilderImpl!Int64StatisticsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int64Statistics build()
  {
    return new Int64Statistics(cast(void*)createGObject(Int64Statistics._getGType), No.Take);
  }
}
