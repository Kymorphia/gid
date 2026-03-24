/// Module for [FixedLengthByteArrayStatistics] class
module parquet.fixed_length_byte_array_statistics;

import gid.gid;
import glib.bytes;
import gobject.gid_builder;
import parquet.c.functions;
import parquet.c.types;
import parquet.statistics;
import parquet.types;

/** */
class FixedLengthByteArrayStatistics : parquet.statistics.Statistics
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
    return cast(void function())gparquet_fixed_length_byte_array_statistics_get_type != &gidSymbolNotFound ? gparquet_fixed_length_byte_array_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedLengthByteArrayStatistics self()
  {
    return this;
  }

  /**
  Get builder for [parquet.fixed_length_byte_array_statistics.FixedLengthByteArrayStatistics]
  Returns: New builder object
  */
  static FixedLengthByteArrayStatisticsGidBuilder builder()
  {
    return new FixedLengthByteArrayStatisticsGidBuilder;
  }

  /** */
  glib.bytes.Bytes getMax()
  {
    GBytes* _cretval;
    _cretval = gparquet_fixed_length_byte_array_statistics_get_max(cast(GParquetFixedLengthByteArrayStatistics*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  glib.bytes.Bytes getMin()
  {
    GBytes* _cretval;
    _cretval = gparquet_fixed_length_byte_array_statistics_get_min(cast(GParquetFixedLengthByteArrayStatistics*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}

class FixedLengthByteArrayStatisticsGidBuilderImpl(T) : parquet.statistics.StatisticsGidBuilderImpl!T
{
}

/// Fluent builder for [parquet.fixed_length_byte_array_statistics.FixedLengthByteArrayStatistics]
final class FixedLengthByteArrayStatisticsGidBuilder : FixedLengthByteArrayStatisticsGidBuilderImpl!FixedLengthByteArrayStatisticsGidBuilder
{
  FixedLengthByteArrayStatistics build()
  {
    return new FixedLengthByteArrayStatistics(cast(void*)createGObject(FixedLengthByteArrayStatistics._getGType), No.Take);
  }
}
