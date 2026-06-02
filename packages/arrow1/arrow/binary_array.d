/// Module for [BinaryArray] class
module arrow.binary_array;

public import gid.basictypes;
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
class BinaryArray : arrow.array.Array
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
    return cast(void function())garrow_binary_array_get_type != &gidSymbolNotFound ? garrow_binary_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.binary_array.BinaryArray]
      Returns: New builder object
  */
  static BinaryArrayGidBuilder builder() nothrow
  {
    return new BinaryArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer valueOffsets, arrow.buffer.Buffer valueData, arrow.buffer.Buffer nullBitmap, long nNulls) nothrow
  {
    GArrowBinaryArray* _cretval;
    _cretval = garrow_binary_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets._cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.buffer.Buffer getBuffer() nothrow
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_buffer(cast(GArrowBinaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getDataBuffer() nothrow
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_data_buffer(cast(GArrowBinaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getOffsetsBuffer() nothrow
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_binary_array_get_offsets_buffer(cast(GArrowBinaryArray*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValue(long i) nothrow
  {
    GBytes* _cretval;
    _cretval = garrow_binary_array_get_value(cast(GArrowBinaryArray*)this._cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.binary_array.BinaryArray]
class BinaryArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.binary_array.BinaryArray]
final class BinaryArrayGidBuilder : BinaryArrayGidBuilderImpl!BinaryArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinaryArray build() nothrow
  {
    return new BinaryArray(cast(void*)createGObject(BinaryArray._getGType), Yes.Take);
  }
}
