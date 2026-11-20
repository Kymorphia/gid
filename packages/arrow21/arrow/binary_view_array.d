/// Module for [BinaryViewArray] class
module arrow.binary_view_array;

public import gid.basictypes;
import arrow.array;
import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import gobject.gid_builder;

/** */
class BinaryViewArray : arrow.array.Array
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
    return cast(void function())garrow_binary_view_array_get_type != &gidSymbolNotFound ? garrow_binary_view_array_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowBinaryViewArray";
  }

  /** Returns `this`, for use in `with` statements. */
  override BinaryViewArray self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.binary_view_array.BinaryViewArray]
      Returns: New builder object
  */
  static BinaryViewArrayGidBuilder builder() nothrow
  {
    return new BinaryViewArrayGidBuilder;
  }

  /** */
  this(long length, arrow.buffer.Buffer views, arrow.buffer.Buffer[] dataBuffers, arrow.buffer.Buffer nullBitmap, long nNulls, long offset) nothrow
  {
    GArrowBinaryViewArray* _cretval;
    auto _dataBuffers = gListFromD!(arrow.buffer.Buffer)(dataBuffers);
    scope(exit) containerFree!(GList*, arrow.buffer.Buffer, GidOwnership.None)(_dataBuffers);
    _cretval = garrow_binary_view_array_new(length, views ? cast(GArrowBuffer*)views._cPtr(No.Dup) : null, _dataBuffers, nullBitmap ? cast(GArrowBuffer*)nullBitmap._cPtr(No.Dup) : null, nNulls, offset);
    this(_cretval, Yes.Take);
  }

  /** */
  glib.bytes.Bytes getValue(long i) nothrow
  {
    GBytes* _cretval;
    _cretval = garrow_binary_view_array_get_value(cast(GArrowBinaryViewArray*)this._cPtr, i);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.binary_view_array.BinaryViewArray]
class BinaryViewArrayGidBuilderImpl(T) : arrow.array.ArrayGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.binary_view_array.BinaryViewArray]
final class BinaryViewArrayGidBuilder : BinaryViewArrayGidBuilderImpl!BinaryViewArrayGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BinaryViewArray build() nothrow
  {
    return new BinaryViewArray(cast(void*)createGObject(BinaryViewArray._getGType), Yes.Take);
  }
}
