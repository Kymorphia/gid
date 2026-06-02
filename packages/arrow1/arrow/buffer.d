/// Module for [Buffer] class
module arrow.buffer;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class Buffer : gobject.object.ObjectWrap
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
    return cast(void function())garrow_buffer_get_type != &gidSymbolNotFound ? garrow_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Buffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.buffer.Buffer]
      Returns: New builder object
  */
  static BufferGidBuilder builder() nothrow
  {
    return new BufferGidBuilder;
  }

  /** */
  @property arrow.buffer.Buffer parent() nothrow
  {
    return getParent();
  }

  /** */
  this(ubyte[] data) nothrow
  {
    GArrowBuffer* _cretval;
    long _size;
    if (data)
      _size = cast(long)data.length;

    auto _data = data.ptr ? cast(const(ubyte)*)data.ptr : [ubyte.init].ptr;
    _cretval = garrow_buffer_new(_data, _size);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.buffer.Buffer newBytes(glib.bytes.Bytes data) nothrow
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_new_bytes(data ? cast(GBytes*)data._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer copy(long start, long size)
  {
    GArrowBuffer* _cretval;
    GError *_err;
    _cretval = garrow_buffer_copy(cast(GArrowBuffer*)this._cPtr, start, size, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  bool equal(arrow.buffer.Buffer otherBuffer) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_buffer_equal(cast(GArrowBuffer*)this._cPtr, otherBuffer ? cast(GArrowBuffer*)otherBuffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalNBytes(arrow.buffer.Buffer otherBuffer, long nBytes) nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_buffer_equal_n_bytes(cast(GArrowBuffer*)this._cPtr, otherBuffer ? cast(GArrowBuffer*)otherBuffer._cPtr(No.Dup) : null, nBytes);
    return _retval;
  }

  /** */
  long getCapacity() nothrow
  {
    long _retval;
    _retval = garrow_buffer_get_capacity(cast(GArrowBuffer*)this._cPtr);
    return _retval;
  }

  alias getData = gobject.object.ObjectWrap.getData;

  /** */
  glib.bytes.Bytes getData() nothrow
  {
    GBytes* _cretval;
    _cretval = garrow_buffer_get_data(cast(GArrowBuffer*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  glib.bytes.Bytes getMutableData() nothrow
  {
    GBytes* _cretval;
    _cretval = garrow_buffer_get_mutable_data(cast(GArrowBuffer*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getParent() nothrow
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_get_parent(cast(GArrowBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getSize() nothrow
  {
    long _retval;
    _retval = garrow_buffer_get_size(cast(GArrowBuffer*)this._cPtr);
    return _retval;
  }

  /** */
  bool isMutable() nothrow
  {
    bool _retval;
    _retval = cast(bool)garrow_buffer_is_mutable(cast(GArrowBuffer*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer slice(long offset, long size) nothrow
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_slice(cast(GArrowBuffer*)this._cPtr, offset, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.buffer.Buffer]
class BufferGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T buffer(void* propval) nothrow
  {
    return setProperty("buffer", propval);
  }

  /** */
  T data(glib.bytes.Bytes propval) nothrow
  {
    return setProperty("data", propval);
  }

  /** */
  T parent(arrow.buffer.Buffer propval) nothrow
  {
    return setProperty("parent", propval);
  }
}

/// Fluent builder for [arrow.buffer.Buffer]
final class BufferGidBuilder : BufferGidBuilderImpl!BufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Buffer build() nothrow
  {
    return new Buffer(cast(void*)createGObject(Buffer._getGType), Yes.Take);
  }
}
