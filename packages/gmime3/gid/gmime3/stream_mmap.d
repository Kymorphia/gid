/// Module for [StreamMmap] class
module gid.gmime3.stream_mmap;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A memory-mapped #GMimeStream.
*/
@gidGir("StreamMmap", "StreamMmapClass")
class StreamMmap : gid.gmime3.stream.Stream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_stream_mmap_get_type != &gidSymbolNotFound ? g_mime_stream_mmap_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamMmap";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamMmap self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_mmap.StreamMmap]
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
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeStream* _cretval;
      _cretval = g_mime_stream_mmap_new(fd, prot, flags);
      this(_cretval, Yes.Take);
    }
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
  static gid.gmime3.stream_mmap.StreamMmap newWithBounds(int fd, int prot, int flags, long start, long end) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_mmap_new_with_bounds(fd, prot, flags, start, end);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream_mmap.StreamMmap)(cast(GMimeStream*)_cretval, Yes.Take);
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

/// Fluent builder implementation template for [gid.gmime3.stream_mmap.StreamMmap]
class StreamMmapGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_mmap.StreamMmap]
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
