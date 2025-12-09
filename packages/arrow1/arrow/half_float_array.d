/// Module for [HalfFloatArray] class
module arrow.half_float_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;

/** */
class HalfFloatArray : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_half_float_array_get_type != &gidSymbolNotFound ? garrow_half_float_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HalfFloatArray self()
  {
    return this;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowHalfFloatArray* _cretval;
    _cretval = garrow_half_float_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  ushort getValue(long i)
  {
    ushort _retval;
    _retval = garrow_half_float_array_get_value(cast(GArrowHalfFloatArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  ushort[] getValues()
  {
    const(ushort)* _cretval;
    long _cretlength;
    _cretval = garrow_half_float_array_get_values(cast(GArrowHalfFloatArray*)this._cPtr, &_cretlength);
    ushort[] _retval;

    if (_cretval)
    {
      _retval = cast(ushort[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }
}
