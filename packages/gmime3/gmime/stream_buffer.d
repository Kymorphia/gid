/// Module for [StreamBuffer] class
module gmime.stream_buffer;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;

/**
    A buffered stream wrapper around any #GMimeStream object.
*/
class StreamBuffer : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_buffer_get_type != &gidSymbolNotFound ? g_mime_stream_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamBuffer self()
  {
    return this;
  }

  /**
      Creates a new GMimeStreamBuffer object.
  
      Params:
        source = source stream
        mode = buffering mode
      Returns: a new buffer stream with source source and mode mode.
  */
  this(gmime.stream.Stream source, gmime.types.StreamBufferMode mode)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_buffer_new(source ? cast(GMimeStream*)source._cPtr(No.Dup) : null, mode);
    this(_cretval, Yes.Take);
  }
}
