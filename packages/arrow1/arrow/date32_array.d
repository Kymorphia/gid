/// Module for [Date32Array] class
module arrow.date32_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Date32Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_date32_array_get_type != &gidSymbolNotFound ? garrow_date32_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date32Array self()
  {
    return this;
  }

  /**
      Get builder for [arrow.date32_array.Date32Array]
      Returns: New builder object
  */
  static Date32ArrayGidBuilder builder()
  {
    return new Date32ArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowDate32Array* _cretval;
    _cretval = garrow_date32_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  int getValue(long i)
  {
    int _retval;
    _retval = garrow_date32_array_get_value(cast(GArrowDate32Array*)this._cPtr, i);
    return _retval;
  }

  /** */
  int[] getValues()
  {
    const(int)* _cretval;
    long _cretlength;
    _cretval = garrow_date32_array_get_values(cast(GArrowDate32Array*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.date32_array.Date32Array]
class Date32ArrayGidBuilderImpl(T) : arrow.numeric_array.NumericArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.date32_array.Date32Array]
final class Date32ArrayGidBuilder : Date32ArrayGidBuilderImpl!Date32ArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Date32Array build()
  {
    return new Date32Array(cast(void*)createGObject(Date32Array._getGType), Yes.Take);
  }
}
