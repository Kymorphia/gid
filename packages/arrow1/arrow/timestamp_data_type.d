/// Module for [TimestampDataType] class
module arrow.timestamp_data_type;

import arrow.c.functions;
import arrow.c.types;
import arrow.temporal_data_type;
import arrow.types;
import gid.gid;
import glib.time_zone;
import gobject.gid_builder;
import gobject.object;

/** */
class TimestampDataType : arrow.temporal_data_type.TemporalDataType
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
    return cast(void function())garrow_timestamp_data_type_get_type != &gidSymbolNotFound ? garrow_timestamp_data_type_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimestampDataType self()
  {
    return this;
  }

  /**
  Get builder for [arrow.timestamp_data_type.TimestampDataType]
  Returns: New builder object
  */
  static TimestampDataTypeGidBuilder builder()
  {
    return new TimestampDataTypeGidBuilder;
  }

  /**
      Get `timeZone` property.
      Returns: The time zone of this data type.
  */
  @property glib.time_zone.TimeZone timeZone()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.time_zone.TimeZone)("time-zone");
  }

  /** */
  this(arrow.types.TimeUnit unit, glib.time_zone.TimeZone timeZone = null)
  {
    GArrowTimestampDataType* _cretval;
    _cretval = garrow_timestamp_data_type_new(unit, timeZone ? cast(GTimeZone*)timeZone._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.types.TimeUnit getUnit()
  {
    GArrowTimeUnit _cretval;
    _cretval = garrow_timestamp_data_type_get_unit(cast(GArrowTimestampDataType*)this._cPtr);
    arrow.types.TimeUnit _retval = cast(arrow.types.TimeUnit)_cretval;
    return _retval;
  }
}

class TimestampDataTypeGidBuilderImpl(T) : arrow.temporal_data_type.TemporalDataTypeGidBuilderImpl!T
{

  /**
      Set `timeZone` property.
      Params:
        propval = The time zone of this data type.
      Returns: Builder instance for fluent chaining
  */
  T timeZone(glib.time_zone.TimeZone propval)
  {
    return setProperty("time-zone", propval);
  }
}

/// Fluent builder for [arrow.timestamp_data_type.TimestampDataType]
final class TimestampDataTypeGidBuilder : TimestampDataTypeGidBuilderImpl!TimestampDataTypeGidBuilder
{
  TimestampDataType build()
  {
    return new TimestampDataType(cast(void*)createGObject(TimestampDataType._getGType), Yes.Take);
  }
}
