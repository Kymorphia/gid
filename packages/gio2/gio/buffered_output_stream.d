/// Module for [BufferedOutputStream] class
module gio.buffered_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.filter_output_stream;
import gio.output_stream;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import gobject.object;

/**
    Buffered output stream implements [gio.filter_output_stream.FilterOutputStream] and provides
    for buffered writes.
    
    By default, [gio.buffered_output_stream.BufferedOutputStream]'s buffer size is set at 4 kilobytes.
    
    To create a buffered output stream, use [gio.buffered_output_stream.BufferedOutputStream.new_],
    or [gio.buffered_output_stream.BufferedOutputStream.newSized] to specify the buffer's size
    at construction.
    
    To get the size of a buffer within a buffered input stream, use
    [gio.buffered_output_stream.BufferedOutputStream.getBufferSize]. To change the size of a
    buffered output stream's buffer, use [gio.buffered_output_stream.BufferedOutputStream.setBufferSize].
    Note that the buffer's size cannot be reduced below the size of the data within the buffer.
*/
class BufferedOutputStream : gio.filter_output_stream.FilterOutputStream, gio.seekable.Seekable
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
    return cast(void function())g_buffered_output_stream_get_type != &gidSymbolNotFound ? g_buffered_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override BufferedOutputStream self()
  {
    return this;
  }

  /**
      Get `autoGrow` property.
      Returns: Whether the buffer should automatically grow.
  */
  @property bool autoGrow()
  {
    return getAutoGrow();
  }

  /**
      Set `autoGrow` property.
      Params:
        propval = Whether the buffer should automatically grow.
  */
  @property void autoGrow(bool propval)
  {
    return setAutoGrow(propval);
  }

  /**
      Get `bufferSize` property.
      Returns: The size of the backend buffer, in bytes.
  */
  @property uint bufferSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("buffer-size");
  }

  /**
      Set `bufferSize` property.
      Params:
        propval = The size of the backend buffer, in bytes.
  */
  @property void bufferSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("buffer-size", propval);
  }

  mixin SeekableT!();

  /**
      Creates a new buffered output stream for a base stream.
  
      Params:
        baseStream = a #GOutputStream.
      Returns: a #GOutputStream for the given base_stream.
  */
  this(gio.output_stream.OutputStream baseStream)
  {
    GOutputStream* _cretval;
    _cretval = g_buffered_output_stream_new(baseStream ? cast(GOutputStream*)baseStream._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new buffered output stream with a given buffer size.
  
      Params:
        baseStream = a #GOutputStream.
        size = a #gsize.
      Returns: a #GOutputStream with an internal buffer set to size.
  */
  static gio.buffered_output_stream.BufferedOutputStream newSized(gio.output_stream.OutputStream baseStream, size_t size)
  {
    GOutputStream* _cretval;
    _cretval = g_buffered_output_stream_new_sized(baseStream ? cast(GOutputStream*)baseStream._cPtr(No.Dup) : null, size);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.buffered_output_stream.BufferedOutputStream)(cast(GOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if the buffer automatically grows as data is added.
      Returns: true if the stream's buffer automatically grows,
        false otherwise.
  */
  bool getAutoGrow()
  {
    bool _retval;
    _retval = cast(bool)g_buffered_output_stream_get_auto_grow(cast(GBufferedOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of the buffer in the stream.
      Returns: the current size of the buffer.
  */
  size_t getBufferSize()
  {
    size_t _retval;
    _retval = g_buffered_output_stream_get_buffer_size(cast(GBufferedOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether or not the stream's buffer should automatically grow.
      If auto_grow is true, then each write will just make the buffer
      larger, and you must manually flush the buffer to actually write out
      the data to the underlying stream.
  
      Params:
        autoGrow = a #gboolean.
  */
  void setAutoGrow(bool autoGrow)
  {
    g_buffered_output_stream_set_auto_grow(cast(GBufferedOutputStream*)this._cPtr, autoGrow);
  }

  /**
      Sets the size of the internal buffer to size.
  
      Params:
        size = a #gsize.
  */
  void setBufferSize(size_t size)
  {
    g_buffered_output_stream_set_buffer_size(cast(GBufferedOutputStream*)this._cPtr, size);
  }
}
