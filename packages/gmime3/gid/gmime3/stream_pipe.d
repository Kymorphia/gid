/// Module for [StreamPipe] class
module gid.gmime3.stream_pipe;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A #GMimeStream wrapper around pipes.
*/
class StreamPipe : gid.gmime3.stream.Stream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_stream_pipe_get_type != &gidSymbolNotFound ? g_mime_stream_pipe_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamPipe";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamPipe self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_pipe.StreamPipe]
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
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeStream* _cretval;
      _cretval = g_mime_stream_pipe_new(fd);
      this(_cretval, Yes.Take);
    }
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

/// Fluent builder implementation template for [gid.gmime3.stream_pipe.StreamPipe]
class StreamPipeGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_pipe.StreamPipe]
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
