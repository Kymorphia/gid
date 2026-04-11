/// Module for [Date64Array] class
module arrow.date64_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class Date64Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_date64_array_get_type != &gidSymbolNotFound ? garrow_date64_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Date64Array self()
  {
    return this;
  }

  /**
      Get builder for [arrow.date64_array.Date64Array]
      Returns: New builder object
  */
  static Date64ArrayGidBuilder builder()
  {
    return new Date64ArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowDate64Array* _cretval;
    _cretval = garrow_date64_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  long getValue(long i)
  {
    long _retval;
    _retval = garrow_date64_array_get_value(cast(GArrowDate64Array*)this._cPtr, i);
    return _retval;
  }

  /** */
  long[] getValues()
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_date64_array_get_values(cast(GArrowDate64Array*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.date64_array.Date64Array]
class Date64ArrayGidBuilderImpl(T) : arrow.numeric_array.NumericArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.date64_array.Date64Array]
final class Date64ArrayGidBuilder : Date64ArrayGidBuilderImpl!Date64ArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Date64Array build()
  {
    return new Date64Array(cast(void*)createGObject(Date64Array._getGType), Yes.Take);
  }
}
