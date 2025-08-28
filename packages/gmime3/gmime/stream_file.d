/// Module for [StreamFile] class
module gmime.stream_file;

import gid.gid;
import glib.error;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A #GMimeStream wrapper around standard-c FILE pointers.
*/
class StreamFile : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_file_get_type != &gidSymbolNotFound ? g_mime_stream_file_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamFile self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamFile object around fp.
      
      Note: The created #GMimeStreamFile object will own the FILE pointer
      passed in.
  
      Params:
        fp = a FILE pointer
      Returns: a stream using fp.
  */
  this(void* fp = null)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_file_new(fp);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMimeStreamFile object around fp with bounds start
      and end.
      
      Note: The created #GMimeStreamFile object will own the FILE pointer
      passed in.
  
      Params:
        fp = a FILE pointer
        start = start boundary
        end = end boundary
      Returns: a stream using fp with bounds start and end.
  */
  static gmime.stream_file.StreamFile newWithBounds(void* fp, long start, long end)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_file_new_with_bounds(fp, start, end);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream_file.StreamFile)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMimeStreamFile object for the specified path.
  
      Params:
        path = the path to a file
        mode = as in fopen(3)
      Returns: a stream using for reading and/or writing to the
        specified file path or null on error.
      Throws: [ErrorWrap]
  */
  static gmime.stream.Stream open(string path, string mode)
  {
    GMimeStream* _cretval;
    const(char)* _path = path.toCString(No.Alloc);
    const(char)* _mode = mode.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_stream_file_open(_path, _mode, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream.Stream)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether or not stream owns the backend FILE pointer.
      Returns: true if stream owns the backend FILE pointer or false
        otherwise.
  */
  bool getOwner()
  {
    bool _retval;
    _retval = g_mime_stream_file_get_owner(cast(GMimeStreamFile*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not stream owns the backend FILE pointer.
      
      Note: owner should be true if the stream should fclose() the
      backend FILE pointer when destroyed or false otherwise.
  
      Params:
        owner = true if this stream should own the FILE pointer or false otherwise
  */
  void setOwner(bool owner)
  {
    g_mime_stream_file_set_owner(cast(GMimeStreamFile*)this._cPtr, owner);
  }
}
