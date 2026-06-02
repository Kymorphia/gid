/// Module for [Int32Statistics] class
module parquet.int32_statistics;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gparquet_int32_statistics_get_type != &gidSymbolNotFound ? gparquet_int32_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Int32Statistics self() nothrow
  {
    return this;
  }

  /**
      Get builder for [parquet.int32_statistics.Int32Statistics]
      Returns: New builder object
  */
  static Int32StatisticsGidBuilder builder() nothrow
  {
    return new Int32StatisticsGidBuilder;
  }

  /** */
  int getMax() nothrow
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_max(cast(GParquetInt32Statistics*)this._cPtr);
    return _retval;
  }

  /** */
  int getMin() nothrow
  {
    int _retval;
    _retval = gparquet_int32_statistics_get_min(cast(GParquetInt32Statistics*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.int32_statistics.Int32Statistics]
class Int32StatisticsGidBuilderImpl(T) : parquet.statistics.StatisticsGidBuilderImpl!T
{
}

/// Fluent builder for [parquet.int32_statistics.Int32Statistics]
final class Int32StatisticsGidBuilder : Int32StatisticsGidBuilderImpl!Int32StatisticsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Int32Statistics build() nothrow
  {
    return new Int32Statistics(cast(void*)createGObject(Int32Statistics._getGType), No.Take);
  }
}
