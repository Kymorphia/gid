/// Module for [LargeBinaryArray] class
module arrow.large_binary_array;

import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import gobject.gid_builder;
import gobject.object;

/** */
class LargeBinaryArray : arrow.array.Array
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
    return cast(void function())garrow_large_binary_array_get_type != &gidSymbolNotFound ? garrow_large_binary_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeBinaryArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.large_binary_array.LargeBinaryArray]
      Returns: New builder object
  */
  static LargeBinaryArrayGidBuilder builder()
  {
    return new LargeBinaryArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer valueOffsets, arrow.buffer.Buffer valueData, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowLargeBinaryArray* _cretval;
    _cretval = garrow_large_binary_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets._cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.buffer.Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_large_binary_array_get_buffer(cast(GArrowLargeBinaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getDataBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_large_binary_array_get_data_buffer(cast(GArrowLargeBinaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getOffsetsBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_large_binary_array_get_offsets_buffer(cast(GArrowLargeBinaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValue(long i)
  {
    GBytes* _cretval;
    _cretval = garrow_large_binary_array_get_value(cast(GArrowLargeBinaryArray*)this._cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.large_binary_array.LargeBinaryArray]
class LargeBinaryArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.large_binary_array.LargeBinaryArray]
final class LargeBinaryArrayGidBuilder : LargeBinaryArrayGidBuilderImpl!LargeBinaryArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LargeBinaryArray build()
  {
    return new LargeBinaryArray(cast(void*)createGObject(LargeBinaryArray._getGType), Yes.Take);
  }
}
