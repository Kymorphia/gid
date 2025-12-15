/// Module for [BooleanStatistics] class
module parquet.boolean_statistics;

import gid.gid;
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
