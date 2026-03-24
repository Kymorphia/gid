/// Module for [Int32Statistics] class
module parquet.int32_statistics;

import gid.gid;
import gobject.gid_builder;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class Int32Statistics : parquet.statistics.Statistics
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
    return cast(void function())gparquet_int32_statistics_get_type != &gidSymbolNotFound ? gparquet_int32_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int32Statistics self()
  {
    return this;
  }

  /**
  Get builder for [parquet.int32_statistics.Int32Statistics]
  Returns: New builder object
  */
  static Int32StatisticsGidBuilder builder()
  {
    return new Int32StatisticsGidBuilder;
  }

  /** */
  int getMax()
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_max(cast(GParquetInt32Statistics*)this._cPtr);
    return _retval;
  }

  /** */
  int getMin()
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_min(cast(GParquetInt32Statistics*)this._cPtr);
    return _retval;
  }
}

class Int32StatisticsGidBuilderImpl(T) : parquet.statistics.StatisticsGidBuilderImpl!T
{
}

/// Fluent builder for [parquet.int32_statistics.Int32Statistics]
final class Int32StatisticsGidBuilder : Int32StatisticsGidBuilderImpl!Int32StatisticsGidBuilder
{
  Int32Statistics build()
  {
    return new Int32Statistics(cast(void*)createGObject(Int32Statistics._getGType), No.Take);
  }
}
