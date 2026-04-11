/// Module for [FixedSizeBinaryArray] class
module arrow.fixed_size_binary_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.fixed_size_binary_data_type;
import arrow.primitive_array;
import arrow.types;
import gid.gid;
import glib.bytes;
import gobject.gid_builder;

/** */
class FixedSizeBinaryArray : arrow.primitive_array.PrimitiveArray
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
    return cast(void function())garrow_fixed_size_binary_array_get_type != &gidSymbolNotFound ? garrow_fixed_size_binary_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FixedSizeBinaryArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.fixed_size_binary_array.FixedSizeBinaryArray]
      Returns: New builder object
  */
  static FixedSizeBinaryArrayGidBuilder builder()
  {
    return new FixedSizeBinaryArrayGidBuilder;
  }

  /** */
  this(arrow.fixed_size_binary_data_type.FixedSizeBinaryDataType dataType, long length, arrow.buffer.Buffer data, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowFixedSizeBinaryArray* _cretval;
    _cretval = garrow_fixed_size_binary_array_new(dataType ? cast(GArrowFixedSizeBinaryDataType*)dataType._cPtr(No.Dup) : null, length, data ? cast(GArrowBuffer*)data._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  int getByteWidth()
  {
    int _retval;
    _retval = garrow_fixed_size_binary_array_get_byte_width(cast(GArrowFixedSizeBinaryArray*)this._cPtr);
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValue(long i)
  {
    GBytes* _cretval;
    _cretval = garrow_fixed_size_binary_array_get_value(cast(GArrowFixedSizeBinaryArray*)this._cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  glib.bytes.Bytes getValuesBytes()
  {
    GBytes* _cretval;
    _cretval = garrow_fixed_size_binary_array_get_values_bytes(cast(GArrowFixedSizeBinaryArray*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.fixed_size_binary_array.FixedSizeBinaryArray]
class FixedSizeBinaryArrayGidBuilderImpl(T) : arrow.primitive_array.PrimitiveArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.fixed_size_binary_array.FixedSizeBinaryArray]
final class FixedSizeBinaryArrayGidBuilder : FixedSizeBinaryArrayGidBuilderImpl!FixedSizeBinaryArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FixedSizeBinaryArray build()
  {
    return new FixedSizeBinaryArray(cast(void*)createGObject(FixedSizeBinaryArray._getGType), Yes.Take);
  }
}
