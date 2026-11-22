/// Module for [StreamGIO] class
module gid.gmime3.stream_gio;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.file;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A #GMimeStream wrapper around GLib's GIO streams.
*/
class StreamGIO : gid.gmime3.stream.Stream
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
    return cast(void function())g_mime_stream_gio_get_type != &gidSymbolNotFound ? g_mime_stream_gio_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamGIO";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamGIO self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_gio.StreamGIO]
      Returns: New builder object
  */
  static StreamGIOGidBuilder builder() nothrow
  {
    return new StreamGIOGidBuilder;
  }

  /**
      Creates a new #GMimeStreamGIO wrapper around a #GFile object.
  
      Params:
        file = a #GFile
      Returns: a stream using file.
  */
  this(gid.gio2.file.File file) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_gio_new(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMimeStreamGIO stream around a #GFile with bounds
      start and end.
  
      Params:
        file = a #GFile
        start = start boundary
        end = end boundary
      Returns: a stream using file with bounds start
        and end.
  */
  static gid.gmime3.stream_gio.StreamGIO newWithBounds(gid.gio2.file.File file, long start, long end) nothrow
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_gio_new_with_bounds(file ? cast(GFile*)(cast(gid.gobject2.object.ObjectWrap)file)._cPtr(No.Dup) : null, start, end);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.stream_gio.StreamGIO)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether or not stream owns the backend #GFile.
      Returns: true if stream owns the backend #GFile or false
        otherwise.
  */
  bool getOwner() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_mime_stream_gio_get_owner(cast(GMimeStreamGIO*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not stream owns the backend GIO pointer.
      
      Note: owner should be true if the stream should close() the
      backend file descriptor when destroyed or false otherwise.
  
      Params:
        owner = true if this stream should own the #GFile or false otherwise
  */
  void setOwner(bool owner) nothrow
  {
    g_mime_stream_gio_set_owner(cast(GMimeStreamGIO*)this._cPtr, owner);
  }
}

/// Fluent builder implementation template for [gid.gmime3.stream_gio.StreamGIO]
class StreamGIOGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_gio.StreamGIO]
final class StreamGIOGidBuilder : StreamGIOGidBuilderImpl!StreamGIOGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamGIO build() nothrow
  {
    return new StreamGIO(cast(void*)createGObject(StreamGIO._getGType), Yes.Take);
  }
}
