/// Module for [Statistics] class
module parquet.statistics;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.types;

/** */
class Statistics : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_statistics_get_type != &gidSymbolNotFound ? gparquet_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Statistics self() nothrow
  {
    return this;
  }

  /**
      Get builder for [parquet.statistics.Statistics]
      Returns: New builder object
  */
  static StatisticsGidBuilder builder() nothrow
  {
    return new StatisticsGidBuilder;
  }

  /** */
  bool equal(parquet.statistics.Statistics otherStatistics) nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_equal(cast(GParquetStatistics*)this._cPtr, otherStatistics ? cast(GParquetStatistics*)otherStatistics._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  long getNDistinctValues() nothrow
  {
    long _retval;
    _retval = gparquet_statistics_get_n_distinct_values(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  long getNNulls() nothrow
  {
    long _retval;
    _retval = gparquet_statistics_get_n_nulls(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  long getNValues() nothrow
  {
    long _retval;
    _retval = gparquet_statistics_get_n_values(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasMinMax() nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_has_min_max(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasNDistinctValues() nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_has_n_distinct_values(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasNNulls() nothrow
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_has_n_nulls(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [parquet.statistics.Statistics]
class StatisticsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T statistics(void* propval) nothrow
  {
    return setProperty("statistics", propval);
  }
}

/// Fluent builder for [parquet.statistics.Statistics]
final class StatisticsGidBuilder : StatisticsGidBuilderImpl!StatisticsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Statistics build() nothrow
  {
    return new Statistics(cast(void*)createGObject(Statistics._getGType), No.Take);
  }
}
