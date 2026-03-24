/// Module for [MemoryMappedInputStream] class
module arrow.memory_mapped_input_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.file;
import arrow.file_mixin;
import arrow.readable;
import arrow.readable_mixin;
import arrow.seekable_input_stream;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class MemoryMappedInputStream : arrow.seekable_input_stream.SeekableInputStream
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
    return cast(void function())garrow_memory_mapped_input_stream_get_type != &gidSymbolNotFound ? garrow_memory_mapped_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryMappedInputStream self()
  {
    return this;
  }

  /**
  Get builder for [arrow.memory_mapped_input_stream.MemoryMappedInputStream]
  Returns: New builder object
  */
  static MemoryMappedInputStreamGidBuilder builder()
  {
    return new MemoryMappedInputStreamGidBuilder;
  }

  /** */
  this(string path)
  {
    GArrowMemoryMappedInputStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = garrow_memory_mapped_input_stream_new(_path, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

class MemoryMappedInputStreamGidBuilderImpl(T) : arrow.seekable_input_stream.SeekableInputStreamGidBuilderImpl!T
{

}

/// Fluent builder for [arrow.memory_mapped_input_stream.MemoryMappedInputStream]
final class MemoryMappedInputStreamGidBuilder : MemoryMappedInputStreamGidBuilderImpl!MemoryMappedInputStreamGidBuilder
{
  MemoryMappedInputStream build()
  {
    return new MemoryMappedInputStream(cast(void*)createGObject(MemoryMappedInputStream._getGType), Yes.Take);
  }
}
