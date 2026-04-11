/// Module for [MemoryOutputStream] class
module gio.memory_output_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.output_stream;
import gio.pollable_output_stream;
import gio.pollable_output_stream_mixin;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.bytes;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.memory_output_stream.MemoryOutputStream] is a class for using arbitrary
    memory chunks as output for GIO streaming output operations.
    
    As of GLib 2.34, [gio.memory_output_stream.MemoryOutputStream] trivially implements
    [gio.pollable_output_stream.PollableOutputStream]: it always polls as ready.
*/
class MemoryOutputStream : gio.output_stream.OutputStream, gio.pollable_output_stream.PollableOutputStream, gio.seekable.Seekable
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
    return cast(void function())g_memory_output_stream_get_type != &gidSymbolNotFound ? g_memory_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryOutputStream self()
  {
    return this;
  }

  /**
      Get builder for [gio.memory_output_stream.MemoryOutputStream]
      Returns: New builder object
  */
  static MemoryOutputStreamGidBuilder builder()
  {
    return new MemoryOutputStreamGidBuilder;
  }

  /**
      Get `data` property.
      Returns: Pointer to buffer where data will be written.
  */
  @property void* data()
  {
    return getData();
  }

  /**
      Get `dataSize` property.
      Returns: Size of data written to the buffer.
  */
  @property gulong dataSize()
  {
    return gobject.object.ObjectWrap.getProperty!(gulong)("data-size");
  }

  /**
      Get `size` property.
      Returns: Current size of the data buffer.
  */
  @property gulong size()
  {
    return gobject.object.ObjectWrap.getProperty!(gulong)("size");
  }

  mixin PollableOutputStreamT!();
  mixin SeekableT!();

  /**
      Creates a new #GMemoryOutputStream, using [glib.global.realloc] and [glib.global.gfree]
      for memory allocation.
      Returns: 
  */
  static gio.memory_output_stream.MemoryOutputStream newResizable()
  {
    GOutputStream* _cretval;
    _cretval = g_memory_output_stream_new_resizable();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.memory_output_stream.MemoryOutputStream)(cast(GOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  alias getData = gobject.object.ObjectWrap.getData;

  /**
      Gets any loaded data from the ostream.
      
      Note that the returned pointer may become invalid on the next
      write or truncate operation on the stream.
      Returns: pointer to the stream's data, or null if the data
           has been stolen
  */
  void* getData()
  {
    auto _retval = g_memory_output_stream_get_data(cast(GMemoryOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of bytes from the start up to including the last
      byte written in the stream that has not been truncated away.
      Returns: the number of bytes written to the stream
  */
  size_t getDataSize()
  {
    size_t _retval;
    _retval = g_memory_output_stream_get_data_size(cast(GMemoryOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of the currently allocated data area (available from
      [gio.memory_output_stream.MemoryOutputStream.getData]).
      
      You probably don't want to use this function on resizable streams.
      See [gio.memory_output_stream.MemoryOutputStream.getDataSize] instead.  For resizable
      streams the size returned by this function is an implementation
      detail and may be change at any time in response to operations on the
      stream.
      
      If the stream is fixed-sized (ie: no realloc was passed to
      [gio.memory_output_stream.MemoryOutputStream.new_]) then this is the maximum size of the
      stream and further writes will return [gio.types.IOErrorEnum.NoSpace].
      
      In any case, if you want the number of bytes currently written to the
      stream, use [gio.memory_output_stream.MemoryOutputStream.getDataSize].
      Returns: the number of bytes allocated for the data buffer
  */
  size_t getSize()
  {
    size_t _retval;
    _retval = g_memory_output_stream_get_size(cast(GMemoryOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns data from the ostream as a #GBytes. ostream must be
      closed before calling this function.
      Returns: the stream's data
  */
  glib.bytes.Bytes stealAsBytes()
  {
    GBytes* _cretval;
    _cretval = g_memory_output_stream_steal_as_bytes(cast(GMemoryOutputStream*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  alias stealData = gobject.object.ObjectWrap.stealData;

  /**
      Gets any loaded data from the ostream. Ownership of the data
      is transferred to the caller; when no longer needed it must be
      freed using the free function set in ostream's
      #GMemoryOutputStream:destroy-function property.
      
      ostream must be closed before calling this function.
      Returns: the stream's data, or null if it has previously
           been stolen
  */
  void* stealData()
  {
    auto _retval = g_memory_output_stream_steal_data(cast(GMemoryOutputStream*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.memory_output_stream.MemoryOutputStream]
class MemoryOutputStreamGidBuilderImpl(T) : gio.output_stream.OutputStreamGidBuilderImpl!T, gio.pollable_output_stream.PollableOutputStreamGidBuilderImpl!T, gio.seekable.SeekableGidBuilderImpl!T
{

  mixin PollableOutputStreamGidBuilderT!();
  mixin SeekableGidBuilderT!();

  /**
      Set `data` property.
      Params:
        propval = Pointer to buffer where data will be written.
      Returns: Builder instance for fluent chaining
  */
  T data(void* propval)
  {
    return setProperty("data", propval);
  }

  /**
      Set `size` property.
      Params:
        propval = Current size of the data buffer.
      Returns: Builder instance for fluent chaining
  */
  T size(gulong propval)
  {
    return setProperty("size", propval);
  }
}

/// Fluent builder for [gio.memory_output_stream.MemoryOutputStream]
final class MemoryOutputStreamGidBuilder : MemoryOutputStreamGidBuilderImpl!MemoryOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MemoryOutputStream build()
  {
    return new MemoryOutputStream(cast(void*)createGObject(MemoryOutputStream._getGType), Yes.Take);
  }
}
