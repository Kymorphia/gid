/// Module for [StreamMmap] class
module gmime.stream_mmap;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.gid_builder;
import gobject.object;

/**
    A memory-mapped #GMimeStream.
*/
class StreamMmap : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_mmap_get_type != &gidSymbolNotFound ? g_mime_stream_mmap_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamMmap self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.stream_mmap.StreamMmap]
      Returns: New builder object
  */
  static StreamMmapGidBuilder builder() nothrow
  {
    return new StreamMmapGidBuilder;
  }

  /**
      Creates a new #GMimeStreamMmap object around fd.
  
      Params:
        fd = file descriptor
        prot = protection flags
        flags = map flags
      Returns: a stream using fd.
  */
  this(int fd, int prot, int flags) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_mmap_new(fd, prot, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMimeStreamMmap object around fd with bounds start
      and end.
  
      Params:
        fd = file descriptor
        prot = protection flags
        flags = map flags
        start = start boundary
        end = end boundary
      Returns: a stream using fd with bounds start and end.
  */
  static gmime.stream_mmap.StreamMmap newWithBounds(int fd, int prot, int flags, long start, long end) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_mmap_new_with_bounds(fd, prot, flags, start, end);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream_mmap.StreamMmap)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether or not stream owns the backend file descriptor.
      Returns: true if stream owns the backend file descriptor or false
        otherwise.
  */
  bool getOwner() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_stream_mmap_get_owner(cast(GMimeStreamMmap*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not stream owns the backend file descriptor.
      
      Note: owner should be true if the stream should close() the
      backend file descriptor when destroyed or false otherwise.
  
      Params:
        owner = true if this stream should own the file descriptor or false otherwise
  */
  void setOwner(bool owner) nothrow
  {
    g_mime_stream_mmap_set_owner(cast(GMimeStreamMmap*)this._cPtr, owner);
  }
}

/// Fluent builder implementation template for [gmime.stream_mmap.StreamMmap]
class StreamMmapGidBuilderImpl(T) : gmime.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.stream_mmap.StreamMmap]
final class StreamMmapGidBuilder : StreamMmapGidBuilderImpl!StreamMmapGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamMmap build() nothrow
  {
    return new StreamMmap(cast(void*)createGObject(StreamMmap._getGType), Yes.Take);
  }
}
