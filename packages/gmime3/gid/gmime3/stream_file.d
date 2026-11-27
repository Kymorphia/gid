/// Module for [StreamFile] class
module gid.gmime3.stream_file;

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
    A #GMimeStream wrapper around standard-c FILE pointers.
*/
@gidGir("StreamFile", "StreamFileClass")
class StreamFile : gid.gmime3.stream.Stream
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_stream_file_get_type != &gidSymbolNotFound ? g_mime_stream_file_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamFile";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamFile self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_file.StreamFile]
      Returns: New builder object
  */
  static StreamFileGidBuilder builder() nothrow
  {
    return new StreamFileGidBuilder;
  }

  /**
      Creates a new #GMimeStreamFile object around fp.
      
      Note: The created #GMimeStreamFile object will own the FILE pointer
      passed in.
  
      Params:
        fp = a FILE pointer
      Returns: a stream using fp.
  */
  this(void* fp = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, fp !is null), Yes.Take);
    }
    else
    {
      GMimeStream* _cretval;
      _cretval = g_mime_stream_file_new(fp);
      this(_cretval, Yes.Take);
    }
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
  static gid.gmime3.stream_file.StreamFile newWithBounds(void* fp, long start, long end) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_file_new_with_bounds(fp, start, end);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream_file.StreamFile)(cast(GMimeStream*)_cretval, Yes.Take);
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
  static gid.gmime3.stream.Stream open(string path, string mode)
  {
    GMimeStream* _cretval;
    const(char)* _path = path.toCString!(No.Malloc, No.Nullable);
    const(char)* _mode = mode.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_mime_stream_file_open(_path, _mode, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream.Stream)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether or not stream owns the backend FILE pointer.
      Returns: true if stream owns the backend FILE pointer or false
        otherwise.
  */
  bool getOwner() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_stream_file_get_owner(cast(GMimeStreamFile*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not stream owns the backend FILE pointer.
      
      Note: owner should be true if the stream should fclose() the
      backend FILE pointer when destroyed or false otherwise.
  
      Params:
        owner = true if this stream should own the FILE pointer or false otherwise
  */
  void setOwner(bool owner) nothrow
  {
    g_mime_stream_file_set_owner(cast(GMimeStreamFile*)this._cPtr, owner);
  }
}

/// Fluent builder implementation template for [gid.gmime3.stream_file.StreamFile]
class StreamFileGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_file.StreamFile]
final class StreamFileGidBuilder : StreamFileGidBuilderImpl!StreamFileGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamFile build() nothrow
  {
    return new StreamFile(cast(void*)createGObject(StreamFile._getGType), Yes.Take);
  }
}
