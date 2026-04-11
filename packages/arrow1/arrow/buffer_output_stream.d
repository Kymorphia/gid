/// Module for [BufferOutputStream] class
module arrow.buffer_output_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream;
import arrow.resizable_buffer;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.gid;
import gobject.gid_builder;

/** */
class BufferOutputStream : arrow.output_stream.OutputStream
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
    return cast(void function())garrow_buffer_output_stream_get_type != &gidSymbolNotFound ? garrow_buffer_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferOutputStream self()
  {
    return this;
  }

  /**
      Get builder for [arrow.buffer_output_stream.BufferOutputStream]
      Returns: New builder object
  */
  static BufferOutputStreamGidBuilder builder()
  {
    return new BufferOutputStreamGidBuilder;
  }

  /** */
  this(arrow.resizable_buffer.ResizableBuffer buffer)
  {
    GArrowBufferOutputStream* _cretval;
    _cretval = garrow_buffer_output_stream_new(buffer ? cast(GArrowResizableBuffer*)buffer._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.buffer_output_stream.BufferOutputStream]
class BufferOutputStreamGidBuilderImpl(T) : arrow.output_stream.OutputStreamGidBuilderImpl!T
{

}

/// Fluent builder for [arrow.buffer_output_stream.BufferOutputStream]
final class BufferOutputStreamGidBuilder : BufferOutputStreamGidBuilderImpl!BufferOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  BufferOutputStream build()
  {
    return new BufferOutputStream(cast(void*)createGObject(BufferOutputStream._getGType), Yes.Take);
  }
}
