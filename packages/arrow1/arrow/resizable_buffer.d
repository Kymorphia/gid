/// Module for [ResizableBuffer] class
module arrow.resizable_buffer;

import arrow.c.functions;
import arrow.c.types;
import arrow.mutable_buffer;
import arrow.types;
import gid.gid;
import glib.error;

/** */
class ResizableBuffer : arrow.mutable_buffer.MutableBuffer
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
    return cast(void function())garrow_resizable_buffer_get_type != &gidSymbolNotFound ? garrow_resizable_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ResizableBuffer self()
  {
    return this;
  }

  /** */
  this(long initialSize)
  {
    GArrowResizableBuffer* _cretval;
    GError *_err;
    _cretval = garrow_resizable_buffer_new(initialSize, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  bool reserve(long newCapacity)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_resizable_buffer_reserve(cast(GArrowResizableBuffer*)this._cPtr, newCapacity, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /** */
  bool resize(long newSize)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_resizable_buffer_resize(cast(GArrowResizableBuffer*)this._cPtr, newSize, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
