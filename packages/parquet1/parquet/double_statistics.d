/// Module for [DoubleStatistics] class
module parquet.double_statistics;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class DoubleStatistics : parquet.statistics.Statistics
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
    return cast(void function())gparquet_double_statistics_get_type != &gidSymbolNotFound ? gparquet_double_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DoubleStatistics self() nothrow
  {
    return this;
  }

  /**
      Get builder for [parquet.double_statistics.DoubleStatistics]
      Returns: New builder object
  */
  static DoubleStatisticsGidBuilder builder() nothrow
  {
    return new DoubleStatisticsGidBuilder;
  }

  /** */
  double getMax() nothrow
  {
    double _retval;
    _retval = gparquet_double_statistics_get_max(cast(GParquetDoubleStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  double getMin() nothrow
  {
    double _retval;
    _retval = gparquet_double_statistics_get_min(cast(GParquetDoubleStatistics*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.double_statistics.DoubleStatistics]
class DoubleStatisticsGidBuilderImpl(T) : parquet.statistics.StatisticsGidBuilderImpl!T
{
}

/// Fluent builder for [parquet.double_statistics.DoubleStatistics]
final class DoubleStatisticsGidBuilder : DoubleStatisticsGidBuilderImpl!DoubleStatisticsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DoubleStatistics build() nothrow
  {
    return new DoubleStatistics(cast(void*)createGObject(DoubleStatistics._getGType), No.Take);
  }
}
