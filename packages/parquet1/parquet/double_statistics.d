/// Module for [DoubleStatistics] class
module parquet.double_statistics;

import gid.gid;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class DoubleStatistics : parquet.statistics.Statistics
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
    return cast(void function())gparquet_double_statistics_get_type != &gidSymbolNotFound ? gparquet_double_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DoubleStatistics self()
  {
    return this;
  }

  /** */
  double getMax()
  {
    double _retval;
    _retval = gparquet_double_statistics_get_max(cast(GParquetDoubleStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  double getMin()
  {
    double _retval;
    _retval = gparquet_double_statistics_get_min(cast(GParquetDoubleStatistics*)this._cPtr);
    return _retval;
  }
}
