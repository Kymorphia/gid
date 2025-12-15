/// Module for [MutableBuffer] class
module arrow.mutable_buffer;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.bytes;
import glib.error;
import gobject.object;

/** */
class MutableBuffer : arrow.buffer.Buffer
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
    return cast(void function())garrow_mutable_buffer_get_type != &gidSymbolNotFound ? garrow_mutable_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MutableBuffer self()
  {
    return this;
  }

  /** */
  this(ubyte[] data)
  {
    GArrowMutableBuffer* _cretval;
    long _size;
    if (data)
      _size = cast(long)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = garrow_mutable_buffer_new(_data, _size);
    this(_cretval, Yes.Take);
  }

  /** */
  static arrow.mutable_buffer.MutableBuffer newBytes(glib.bytes.Bytes data)
  {
    GArrowMutableBuffer* _cretval;
    _cretval = garrow_mutable_buffer_new_bytes(data ? cast(GBytes*)data._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.mutable_buffer.MutableBuffer)(cast(GArrowMutableBuffer*)_cretval, Yes.Take);
    return _retval;
  }

  alias setData = gobject.object.ObjectWrap.setData;

  /** */
  bool setData(long offset, ubyte[] data)
  {
    bool _retval;
    long _size;
    if (data)
      _size = cast(long)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    GError *_err;
    _retval = cast(bool)garrow_mutable_buffer_set_data(cast(GArrowMutableBuffer*)this._cPtr, offset, _data, _size, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  override arrow.mutable_buffer.MutableBuffer slice(long offset, long size)
  {
    GArrowMutableBuffer* _cretval;
    _cretval = garrow_mutable_buffer_slice(cast(GArrowMutableBuffer*)this._cPtr, offset, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.mutable_buffer.MutableBuffer)(cast(GArrowMutableBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}
