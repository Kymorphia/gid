/// Module for [Time32Array] class
module arrow.time32_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.time32_data_type;
import arrow.types;
import gid.gid;

/** */
class Time32Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_time32_array_get_type != &gidSymbolNotFound ? garrow_time32_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Time32Array self()
  {
    return this;
  }

  /** */
  this(arrow.time32_data_type.Time32DataType dataType, long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowTime32Array* _cretval;
    _cretval = garrow_time32_array_new(dataType ? cast(GArrowTime32DataType*)dataType._cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  int getValue(long i)
  {
    int _retval;
    _retval = garrow_time32_array_get_value(cast(GArrowTime32Array*)this._cPtr, i);
    return _retval;
  }

  /** */
  int[] getValues()
  {
    const(int)* _cretval;
    long _cretlength;
    _cretval = garrow_time32_array_get_values(cast(GArrowTime32Array*)this._cPtr, &_cretlength);
    int[] _retval;

    if (_cretval)
    {
      _retval = cast(int[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}
