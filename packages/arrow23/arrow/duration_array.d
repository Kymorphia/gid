/// Module for [DurationArray] class
module arrow.duration_array;

public import gid.basictypes;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.duration_data_type;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class DurationArray : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_duration_array_get_type != &gidSymbolNotFound ? garrow_duration_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowDurationArray";
  }

  /** Returns `this`, for use in `with` statements. */
  override DurationArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.duration_array.DurationArray]
      Returns: New builder object
  */
  static DurationArrayGidBuilder builder() nothrow
  {
    return new DurationArrayGidBuilder;
  }

  /** */
  this(arrow.duration_data_type.DurationDataType dataType, long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls) nothrow
  {
    GArrowDurationArray* _cretval;
    _cretval = garrow_duration_array_new(dataType ? cast(GArrowDurationDataType*)dataType._cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue(long i) nothrow
  {
    long _retval;
    _retval = garrow_duration_array_get_value(cast(GArrowDurationArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  long[] getValues() nothrow
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_duration_array_get_values(cast(GArrowDurationArray*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.duration_array.DurationArray]
class DurationArrayGidBuilderImpl(T) : arrow.numeric_array.NumericArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.duration_array.DurationArray]
final class DurationArrayGidBuilder : DurationArrayGidBuilderImpl!DurationArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DurationArray build() nothrow
  {
    return new DurationArray(cast(void*)createGObject(DurationArray._getGType), Yes.Take);
  }
}
