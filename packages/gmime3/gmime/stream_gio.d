/// Module for [StreamGIO] class
module gmime.stream_gio;

import gid.gid;
import gio.file;
import gmime.c.functions;
import gmime.c.types;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A #GMimeStream wrapper around GLib's GIO streams.
*/
class StreamGIO : gmime.stream.Stream
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
    return cast(void function())g_mime_stream_gio_get_type != &gidSymbolNotFound ? g_mime_stream_gio_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamGIO self()
  {
    return this;
  }

  /**
      Creates a new #GMimeStreamGIO wrapper around a #GFile object.
  
      Params:
        file = a #GFile
      Returns: a stream using file.
  */
  this(gio.file.File file)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_gio_new(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null);
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
  static gmime.stream_gio.StreamGIO newWithBounds(gio.file.File file, long start, long end)
  {
    GMimeStream* _cretval;
    _cretval = g_mime_stream_gio_new_with_bounds(file ? cast(GFile*)(cast(gobject.object.ObjectWrap)file)._cPtr(No.Dup) : null, start, end);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.stream_gio.StreamGIO)(cast(GMimeStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets whether or not stream owns the backend #GFile.
      Returns: true if stream owns the backend #GFile or false
        otherwise.
  */
  bool getOwner()
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
  void setOwner(bool owner)
  {
    g_mime_stream_gio_set_owner(cast(GMimeStreamGIO*)this._cPtr, owner);
  }
}
