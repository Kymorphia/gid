/// Module for [Time64Array] class
module arrow.time64_array;

public import gid.basictypes;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.time64_data_type;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Time64Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_time64_array_get_type != &gidSymbolNotFound ? garrow_time64_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time64Array self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.time64_array.Time64Array]
      Returns: New builder object
  */
  static Time64ArrayGidBuilder builder() nothrow
  {
    return new Time64ArrayGidBuilder;
  }

  /** */
  this(arrow.time64_data_type.Time64DataType dataType, long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls) nothrow
  {
    GArrowTime64Array* _cretval;
    _cretval = garrow_time64_array_new(dataType ? cast(GArrowTime64DataType*)dataType._cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue(long i) nothrow
  {
    long _retval;
    _retval = garrow_time64_array_get_value(cast(GArrowTime64Array*)this._cPtr, i);
    return _retval;
  }

  /** */
  long[] getValues() nothrow
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_time64_array_get_values(cast(GArrowTime64Array*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.time64_array.Time64Array]
class Time64ArrayGidBuilderImpl(T) : arrow.numeric_array.NumericArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.time64_array.Time64Array]
final class Time64ArrayGidBuilder : Time64ArrayGidBuilderImpl!Time64ArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Time64Array build() nothrow
  {
    return new Time64Array(cast(void*)createGObject(Time64Array._getGType), Yes.Take);
  }
}
