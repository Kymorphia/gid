/// Module for [LargeListArray] class
module arrow.large_list_array;

import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.data_type;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class LargeListArray : arrow.array.Array
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
    return cast(void function())garrow_large_list_array_get_type != &gidSymbolNotFound ? garrow_large_list_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeListArray self()
  {
    return this;
  }

  /** */
  this(arrow.data_type.DataType dataType, long length, arrow.buffer.Buffer valueOffsets, arrow.array.Array values, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowLargeListArray* _cretval;
    _cretval = garrow_large_list_array_new(dataType ? cast(GArrowDataType*)dataType._cPtr(No.Dup) : null, length, valueOffsets ? cast(GArrowBuffer*)valueOffsets._cPtr(No.Dup) : null, values ? cast(GArrowArray*)values._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.array.Array getValue(long i)
  {
    GArrowArray* _cretval;
    _cretval = garrow_large_list_array_get_value(cast(GArrowLargeListArray*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getValueLength(long i)
  {
    long _retval;
    _retval = garrow_large_list_array_get_value_length(cast(GArrowLargeListArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  long getValueOffset(long i)
  {
    long _retval;
    _retval = garrow_large_list_array_get_value_offset(cast(GArrowLargeListArray*)this._cPtr, i);
    return _retval;
  }

  /** */
  long[] getValueOffsets()
  {
    const(long)* _cretval;
    long _cretlength;
    _cretval = garrow_large_list_array_get_value_offsets(cast(GArrowLargeListArray*)this._cPtr, &_cretlength);
    long[] _retval;

    if (_cretval)
    {
      _retval = cast(long[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  alias getValueType = arrow.array.Array.getValueType;

  /** */
  arrow.data_type.DataType getValueType()
  {
    GArrowDataType* _cretval;
    _cretval = garrow_large_list_array_get_value_type(cast(GArrowLargeListArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.data_type.DataType)(cast(GArrowDataType*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.array.Array getValues()
  {
    GArrowArray* _cretval;
    _cretval = garrow_large_list_array_get_values(cast(GArrowLargeListArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.array.Array)(cast(GArrowArray*)_cretval, Yes.Take);
    return _retval;
  }
}
