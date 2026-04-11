/// Module for [LargeStringArray] class
module arrow.large_string_array;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.large_binary_array;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class LargeStringArray : arrow.large_binary_array.LargeBinaryArray
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
    return cast(void function())garrow_large_string_array_get_type != &gidSymbolNotFound ? garrow_large_string_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override LargeStringArray self()
  {
    return this;
  }

  /**
      Get builder for [arrow.large_string_array.LargeStringArray]
      Returns: New builder object
  */
  static LargeStringArrayGidBuilder builder()
  {
    return new LargeStringArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer valueOffsets, arrow.buffer.Buffer valueData, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowLargeStringArray* _cretval;
    _cretval = garrow_large_string_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets._cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  string getString(long i)
  {
    char* _cretval;
    _cretval = garrow_large_string_array_get_string(cast(GArrowLargeStringArray*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.large_string_array.LargeStringArray]
class LargeStringArrayGidBuilderImpl(T) : arrow.large_binary_array.LargeBinaryArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.large_string_array.LargeStringArray]
final class LargeStringArrayGidBuilder : LargeStringArrayGidBuilderImpl!LargeStringArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LargeStringArray build()
  {
    return new LargeStringArray(cast(void*)createGObject(LargeStringArray._getGType), Yes.Take);
  }
}
