/// Module for [StringArray] class
module arrow.string_array;

import arrow.binary_array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class StringArray : arrow.binary_array.BinaryArray
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
    return cast(void function())garrow_string_array_get_type != &gidSymbolNotFound ? garrow_string_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StringArray self()
  {
    return this;
  }

  /**
  Get builder for [arrow.string_array.StringArray]
  Returns: New builder object
  */
  static StringArrayGidBuilder builder()
  {
    return new StringArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer valueOffsets, arrow.buffer.Buffer valueData, arrow.buffer.Buffer nullBitmap, long nNulls)
  {
    GArrowStringArray* _cretval;
    _cretval = garrow_string_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets._cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData._cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  /** */
  string getString(long i)
  {
    char* _cretval;
    _cretval = garrow_string_array_get_string(cast(GArrowStringArray*)this._cPtr, i);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

class StringArrayGidBuilderImpl(T) : arrow.binary_array.BinaryArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.string_array.StringArray]
final class StringArrayGidBuilder : StringArrayGidBuilderImpl!StringArrayGidBuilder
{
  StringArray build()
  {
    return new StringArray(cast(void*)createGObject(StringArray._getGType), Yes.Take);
  }
}
