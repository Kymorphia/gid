/// Module for [StreamMmap] class
module gmime.stream_mmap;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A memory-mapped #GMimeStream.
*/
class StreamMmap : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_mmap_get_type != &gidSymbolNotFound ? g_mime_stream_mmap_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamMmap self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamMmap object around fd.
  
      Params:
        fd = file descriptor
        prot = protection flags
        flags = map flags
      Returns: a stream using fd.
  */
  this(int fd, int prot, int flags)
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
  static gmime.stream_mmap.StreamMmap newWithBounds(int fd, int prot, int flags, long start, long end)
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
  bool getOwner()
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
  void setOwner(bool owner)
  {
    g_mime_stream_mmap_set_owner(cast(GMimeStreamMmap*)this._cPtr, owner);
  }
}
