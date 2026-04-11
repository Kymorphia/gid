/// Module for [TimestampArray] class
module arrow.timestamp_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.timestamp_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class TimestampArray : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_timestamp_array_get_type != &gidSymbolNotFound ? garrow_timestamp_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TimestampArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.timestamp_array.TimestampArray]
      Returns: New builder object
  */
  static TimestampArrayGidBuilder builder()
  {
    return new TimestampArrayGidBuilder;
  }

  /** */
  this(arrow.timestamp_data_type.TimestampDataType dataType, long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowTimestampArray* _cretval;
    _cretval = garrow_timestamp_array_new(dataType ? cast(GArrowTimestampDataType*)dataType._cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue(long i)
  {
    long _retval;
    _retval = garrow_timestamp_array_get_value(cast(GArrowTimestampArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  long[] getValues()
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_timestamp_array_get_values(cast(GArrowTimestampArray*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.timestamp_array.TimestampArray]
class TimestampArrayGidBuilderImpl(T) : arrow.numeric_array.NumericArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.timestamp_array.TimestampArray]
final class TimestampArrayGidBuilder : TimestampArrayGidBuilderImpl!TimestampArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TimestampArray build()
  {
    return new TimestampArray(cast(void*)createGObject(TimestampArray._getGType), Yes.Take);
  }
}
