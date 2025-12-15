/// Module for [Buffer] class
module arrow.buffer;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class Buffer : gobject.object.ObjectWrap
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
    return cast(void function())garrow_buffer_get_type != &gidSymbolNotFound ? garrow_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Buffer self()
  {
    return this;
  }

  /** */
  this(ubyte[] data)
  {
    GArrowBuffer* _cretval;
    long _size;
    if (data)
      _size = cast(long)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _cretval = garrow_buffer_new(_data, _size);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.buffer.Buffer newBytes(glib.bytes.Bytes data)
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
  bool equal(arrow.buffer.Buffer otherBuffer)
  {
    bool _retval;
    _retval = cast(bool)garrow_buffer_equal(cast(GArrowBuffer*)this._cPtr, otherBuffer ? cast(GArrowBuffer*)otherBuffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /** */
  bool equalNBytes(arrow.buffer.Buffer otherBuffer, long nBytes)
  {
    bool _retval;
    _retval = cast(bool)garrow_buffer_equal_n_bytes(cast(GArrowBuffer*)this._cPtr, otherBuffer ? cast(GArrowBuffer*)otherBuffer._cPtr(No.Dup) : null, nBytes);
    return _retval;
  }

  /** */
  long getCapacity()
  {
    long _retval;
    _retval = garrow_buffer_get_capacity(cast(GArrowBuffer*)this._cPtr);
    return _retval;
  }

  alias getData = gobject.object.ObjectWrap.getData;

  /** */
  glib.bytes.Bytes getData()
  {
    GBytes* _cretval;
    _cretval = garrow_buffer_get_data(cast(GArrowBuffer*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  glib.bytes.Bytes getMutableData()
  {
    GBytes* _cretval;
    _cretval = garrow_buffer_get_mutable_data(cast(GArrowBuffer*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  arrow.buffer.Buffer getParent()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_get_parent(cast(GArrowBuffer*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  long getSize()
  {
    long _retval;
    _retval = garrow_buffer_get_size(cast(GArrowBuffer*)this._cPtr);
    return _retval;
  }

  /** */
  bool isMutable()
  {
    bool _retval;
    _retval = cast(bool)garrow_buffer_is_mutable(cast(GArrowBuffer*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.buffer.Buffer slice(long offset, long size)
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_slice(cast(GArrowBuffer*)this._cPtr, offset, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
