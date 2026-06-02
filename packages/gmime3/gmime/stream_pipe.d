/// Module for [StreamPipe] class
module gmime.stream_pipe;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.gid_builder;

/**
    A #GMimeStream wrapper around pipes.
*/
class StreamPipe : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_pipe_get_type != &gidSymbolNotFound ? g_mime_stream_pipe_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamPipe self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.stream_pipe.StreamPipe]
      Returns: New builder object
  */
  static StreamPipeGidBuilder builder() nothrow
  {
    return new StreamPipeGidBuilder;
  }

  /**
      Creates a new #GMimeStreamPipe object around fd.
  
      Params:
        fd = a pipe descriptor
      Returns: a stream using fd.
  */
  this(int fd) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_pipe_new(fd);
    this(_cretval, Yes.Take);
  }

  /**
      Gets whether or not stream owns the backend pipe descriptor.
      Returns: true if stream owns the backend pipe descriptor or false
        otherwise.
  */
  bool getOwner() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_stream_pipe_get_owner(cast(GMimeStreamPipe*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not stream owns the backend pipe descriptor.
      
      Note: owner should be true if the stream should close() the
      backend pipe descriptor when destroyed or false otherwise.
  
      Params:
        owner = owner
  */
  void setOwner(bool owner) nothrow
  {
    g_mime_stream_pipe_set_owner(cast(GMimeStreamPipe*)this._cPtr, owner);
  }
}

/// Fluent builder implementation template for [gmime.stream_pipe.StreamPipe]
class StreamPipeGidBuilderImpl(T) : gmime.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.stream_pipe.StreamPipe]
final class StreamPipeGidBuilder : StreamPipeGidBuilderImpl!StreamPipeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamPipe build() nothrow
  {
    return new StreamPipe(cast(void*)createGObject(StreamPipe._getGType), Yes.Take);
  }
}
