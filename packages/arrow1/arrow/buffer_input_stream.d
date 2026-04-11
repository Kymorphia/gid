/// Module for [BufferInputStream] class
module arrow.buffer_input_stream;

import arrow.buffer;
import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.readable;
import arrow.readable_mixin;
import arrow.seekable_input_stream;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class BufferInputStream : arrow.seekable_input_stream.SeekableInputStream
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
    return cast(void function())garrow_buffer_input_stream_get_type != &gidSymbolNotFound ? garrow_buffer_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferInputStream self()
  {
    return this;
  }

  /**
      Get builder for [arrow.buffer_input_stream.BufferInputStream]
      Returns: New builder object
  */
  static BufferInputStreamGidBuilder builder()
  {
    return new BufferInputStreamGidBuilder;
  }

  /** */
  @property arrow.buffer.Buffer buffer()
  {
    return getBuffer();
  }

  /** */
  this(arrow.buffer.Buffer buffer)
  {
    GArrowBufferInputStream* _cretval;
    _cretval = garrow_buffer_input_stream_new(buffer ? cast(GArrowBuffer*)buffer._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.buffer.Buffer getBuffer()
  {
    GArrowBuffer* _cretval;
    _cretval = garrow_buffer_input_stream_get_buffer(cast(GArrowBufferInputStream*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.buffer.Buffer)(cast(GArrowBuffer*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.buffer_input_stream.BufferInputStream]
class BufferInputStreamGidBuilderImpl(T) : arrow.seekable_input_stream.SeekableInputStreamGidBuilderImpl!T
{


  /** */
  T buffer(arrow.buffer.Buffer propval)
  {
    return setProperty("buffer", propval);
  }
}

/// Fluent builder for [arrow.buffer_input_stream.BufferInputStream]
final class BufferInputStreamGidBuilder : BufferInputStreamGidBuilderImpl!BufferInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BufferInputStream build()
  {
    return new BufferInputStream(cast(void*)createGObject(BufferInputStream._getGType), Yes.Take);
  }
}
