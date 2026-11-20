/// Module for [ArrayStatistics] class
module arrow.array_statistics;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ArrayStatistics : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_array_statistics_get_type != &gidSymbolNotFound ? garrow_array_statistics_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowArrayStatistics";
  }

  /** Returns `this`, for use in `with` statements. */
  override ArrayStatistics self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.array_statistics.ArrayStatistics]
      Returns: New builder object
  */
  static ArrayStatisticsGidBuilder builder() nothrow
  {
    return new ArrayStatisticsGidBuilder;
  }

  /** */
  long getNullCount() nothrow
  {
    long _retval;
    _retval = garrow_array_statistics_get_null_count(cast(GArrowArrayStatistics*)this._cPtr);
    return _retval;
  }

  /** */
  bool hasNullCount() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_array_statistics_has_null_count(cast(GArrowArrayStatistics*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.array_statistics.ArrayStatistics]
class ArrayStatisticsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T statistics(void* propval) nothrow
  {
    return setProperty("statistics", propval);
  }
}

/// Fluent builder for [arrow.array_statistics.ArrayStatistics]
final class ArrayStatisticsGidBuilder : ArrayStatisticsGidBuilderImpl!ArrayStatisticsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ArrayStatistics build() nothrow
  {
    return new ArrayStatistics(cast(void*)createGObject(ArrayStatistics._getGType), Yes.Take);
  }
}
