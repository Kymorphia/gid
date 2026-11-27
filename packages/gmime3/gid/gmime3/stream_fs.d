/// Module for [StreamFs] class
module gid.gmime3.stream_fs;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A #GMimeStream wrapper around POSIX file descriptors.
*/
@gidGir("StreamFs", "StreamFsClass")
class StreamFs : gid.gmime3.stream.Stream
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
    return cast(void function())g_mime_stream_fs_get_type != &gidSymbolNotFound ? g_mime_stream_fs_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamFs";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamFs self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_fs.StreamFs]
      Returns: New builder object
  */
  static StreamFsGidBuilder builder() nothrow
  {
    return new StreamFsGidBuilder;
  }

  /**
      Creates a new #GMimeStreamFs object around fd.
  
      Params:
        fd = a file descriptor
      Returns: a stream using fd.
  */
  this(int fd) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeStream* _cretval;
      _cretval = g_mime_stream_fs_new(fd);
      this(_cretval, Yes.Take);
    }
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
  static gid.gmime3.stream_fs.StreamFs newWithBounds(int fd, long start, long end) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_fs_new_with_bounds(fd, start, end);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream_fs.StreamFs)(cast(GMimeStream*)_cretval, Yes.Take);
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
  static gid.gmime3.stream.Stream open(string path, int flags, int mode)
  {
    GMimeStream* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_mime_stream_fs_open(_path, flags, mode, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream.Stream)(cast(GMimeStream*)_cretval, Yes.Take);
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
  void setOwner(bool owner) nothrow
  {
    g_mime_stream_fs_set_owner(cast(GMimeStreamFs*)this._cPtr, owner);
  }
}

/// Fluent builder implementation template for [gid.gmime3.stream_fs.StreamFs]
class StreamFsGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_fs.StreamFs]
final class StreamFsGidBuilder : StreamFsGidBuilderImpl!StreamFsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamFs build() nothrow
  {
    return new StreamFs(cast(void*)createGObject(StreamFs._getGType), Yes.Take);
  }
}
