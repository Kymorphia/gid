/// Module for [Statistics] class
module parquet.statistics;

import gid.gid;
import gobject.object;
import parquet.c.functions;
import parquet.c.types;
import parquet.types;

/** */
class Statistics : gobject.object.ObjectWrap
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
    return cast(void function())gparquet_statistics_get_type != &gidSymbolNotFound ? gparquet_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Statistics self()
  {
    return this;
  }

  /** */
  bool equal(parquet.statistics.Statistics otherStatistics)
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_equal(cast(GParquetStatistics*)this._cPtr, otherStatistics ? cast(GParquetStatistics*)otherStatistics._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  long getNDistinctValues()
  {
    long _retval;
    _retval = gparquet_statistics_get_n_distinct_values(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  long getNNulls()
  {
    long _retval;
    _retval = gparquet_statistics_get_n_nulls(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  long getNValues()
  {
    long _retval;
    _retval = gparquet_statistics_get_n_values(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasMinMax()
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_has_min_max(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasNDistinctValues()
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_has_n_distinct_values(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasNNulls()
  {
    bool _retval;
    _retval = cast(bool)gparquet_statistics_has_n_nulls(cast(GParquetStatistics*)this._cPtr);
    return _retval;
  }
}
