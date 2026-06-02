/// Module for [UInt16Array] class
module arrow.uint16_array;

public import gid.basictypes;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.numeric_array;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class UInt16Array : arrow.numeric_array.NumericArray
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
    return cast(void function())garrow_uint16_array_get_type != &gidSymbolNotFound ? garrow_uint16_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override UInt16Array self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.uint16_array.UInt16Array]
      Returns: New builder object
  */
  static UInt16ArrayGidBuilder builder() nothrow
  {
    return new UInt16ArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls) nothrow
  {
    GArrowUInt16Array* _cretval;
    _cretval = garrow_uint16_array_new(length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  ushort getValue(long i) nothrow
  {
    ushort _retval;
    _retval = garrow_uint16_array_get_value(cast(GArrowUInt16Array*)this._cPtr, i);
    return _retval;
  }

  /** */
  ushort[] getValues() nothrow
  {
    const(ushort)* _cretval;
    long _cretlength;
    _cretval = garrow_uint16_array_get_values(cast(GArrowUInt16Array*)this._cPtr, &_cretlength);
    ushort[] _retval;

    if (_cretval)
    {
      _retval = cast(ushort[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /** */
  ulong sum()
  {
    ulong _retval;
    GError *_err;
    _retval = garrow_uint16_array_sum(cast(GArrowUInt16Array*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.uint16_array.UInt16Array]
class UInt16ArrayGidBuilderImpl(T) : arrow.numeric_array.NumericArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.uint16_array.UInt16Array]
final class UInt16ArrayGidBuilder : UInt16ArrayGidBuilderImpl!UInt16ArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UInt16Array build() nothrow
  {
    return new UInt16Array(cast(void*)createGObject(UInt16Array._getGType), Yes.Take);
  }
}
