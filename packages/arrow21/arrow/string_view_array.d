/// Module for [StringViewArray] class
module arrow.string_view_array;

public import gid.basictypes;
import arrow.binary_view_array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import gobject.gid_builder;

/** */
class StringViewArray : arrow.binary_view_array.BinaryViewArray
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_string_view_array_get_type != &gidSymbolNotFound ? garrow_string_view_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowStringViewArray";
  }

  /** Returns `this`, for use in `with` statements. */
  override StringViewArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.string_view_array.StringViewArray]
      Returns: New builder object
  */
  static StringViewArrayGidBuilder builder() nothrow
  {
    return new StringViewArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer views, arrow.buffer.Buffer[] dataBuffers, arrow.buffer.Buffer nullBitmap, long nNulls, long offset) nothrow
  {
    GArrowStringViewArray* _cretval;
    auto _dataBuffers = gListFromD!(arrow.buffer.Buffer)(dataBuffers);
    scope(exit) containerFree!(GList*, arrow.buffer.Buffer, GidOwnership.None)(_dataBuffers);
    _cretval = garrow_string_view_array_new(length, views ? cast(GArrowBuffer*)views._cPtr(No.Dup) : null, _dataBuffers, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls, offset);
    this(_cretval, Yes.Take);
  }

  /** */
  override glib.bytes.Bytes getValue(long i) nothrow
  {
    GBytes* _cretval;
    _cretval = garrow_string_view_array_get_value(cast(GArrowStringViewArray*)this._cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.string_view_array.StringViewArray]
class StringViewArrayGidBuilderImpl(T) : arrow.binary_view_array.BinaryViewArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.string_view_array.StringViewArray]
final class StringViewArrayGidBuilder : StringViewArrayGidBuilderImpl!StringViewArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StringViewArray build() nothrow
  {
    return new StringViewArray(cast(void*)createGObject(StringViewArray._getGType), Yes.Take);
  }
}
