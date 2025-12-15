/// Module for [StreamFs] class
module gmime.stream_fs;

import gid.gid;
import glib.error;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A #GMimeStream wrapper around POSIX file descriptors.
*/
class StreamFs : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_fs_get_type != &gidSymbolNotFound ? g_mime_stream_fs_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamFs self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamFs object around fd.
  
      Params:
        fd = a file descriptor
      Returns: a stream using fd.
  */
  this(int fd)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_fs_new(fd);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMimeStreamFs object around fd with bounds start
      and end.
  
      Params:
        fd = a file descriptor
        start = start boundary
        end = end boundary
      Returns: a stream using fd with bounds start and end.
  */
  static gmime.stream_fs.StreamFs newWithBounds(int fd, long start, long end)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_fs_new_with_bounds(fd, start, end);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream_fs.StreamFs)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMimeStreamFs object for the specified path.
  
      Params:
        path = the path to a file
        flags = as in open(2)
        mode = as in open(2)
      Returns: a stream using for reading and/or writing to the
        specified file path or null on error.
      Throws: [ErrorWrap]
  */
  static gmime.stream.Stream open(string path, int flags, int mode)
  {
    GMimeStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_stream_fs_open(_path, flags, mode, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream.Stream)(cast(GMimeStream*)_cretval, Yes.Take);
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
    _retval = cast(bool)g_mime_stream_fs_get_owner(cast(GMimeStreamFs*)this._cPtr);
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
    g_mime_stream_fs_set_owner(cast(GMimeStreamFs*)this._cPtr, owner);
  }
}
