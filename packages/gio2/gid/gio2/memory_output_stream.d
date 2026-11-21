/// Module for [MemoryOutputStream] class
module gid.gio2.memory_output_stream;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.output_stream;
import gid.gio2.pollable_output_stream;
import gid.gio2.pollable_output_stream_mixin;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.memory_output_stream.MemoryOutputStream] is a class for using arbitrary
    memory chunks as output for GIO streaming output operations.
    
    As of GLib 2.34, [gid.gio2.memory_output_stream.MemoryOutputStream] trivially implements
    [gid.gio2.pollable_output_stream.PollableOutputStream]: it always polls as ready.
*/
class MemoryOutputStream : gid.gio2.output_stream.OutputStream, gid.gio2.pollable_output_stream.PollableOutputStream, gid.gio2.seekable.Seekable
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
    return cast(void function())g_memory_output_stream_get_type != &gidSymbolNotFound ? g_memory_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMemoryOutputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryOutputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.memory_output_stream.MemoryOutputStream]
      Returns: New builder object
  */
  static MemoryOutputStreamGidBuilder builder() nothrow
  {
    return new MemoryOutputStreamGidBuilder;
  }

  /**
      Get `data` property.
      Returns: Pointer to buffer where data will be written.
  */
  @property void* data() nothrow
  {
    return getData();
  }

  /**
      Get `dataSize` property.
      Returns: Size of data written to the buffer.
  */
  @property gulong dataSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gulong)("data-size");
  }

  /**
      Get `size` property.
      Returns: Current size of the data buffer.
  */
  @property gulong size() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gulong)("size");
  }

  mixin PollableOutputStreamT!();
  mixin SeekableT!();

  /**
      Creates a new #GMemoryOutputStream, using [gid.glib2.global.realloc] and [gid.glib2.global.gfree]
      for memory allocation.
      Returns: 
  */
  static gid.gio2.memory_output_stream.MemoryOutputStream newResizable() nothrow
  {
    GOutputStream* _cretval;
    _cretval = g_memory_output_stream_new_resizable();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.memory_output_stream.MemoryOutputStream)(cast(GOutputStream*)_cretval, Yes.Take);
    return _retval;
  }

  alias getData = gid.gobject2.object.ObjectWrap.getData;

  /**
      Gets any loaded data from the ostream.
      
      Note that the returned pointer may become invalid on the next
      write or truncate operation on the stream.
      Returns: pointer to the stream's data, or null if the data
           has been stolen
  */
  void* getData() nothrow
  {
    auto _retval = g_memory_output_stream_get_data(cast(GMemoryOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of bytes from the start up to including the last
      byte written in the stream that has not been truncated away.
      Returns: the number of bytes written to the stream
  */
  size_t getDataSize() nothrow
  {
    size_t _retval;
    _retval = g_memory_output_stream_get_data_size(cast(GMemoryOutputStream*)this._cPtr);
    return _retval;
  }

  /**
      Gets the size of the currently allocated data area (available from
      [gid.gio2.memory_output_stream.MemoryOutputStream.getData]).
      
      You probably don't want to use this function on resizable streams.
      See [gid.gio2.memory_output_stream.MemoryOutputStream.getDataSize] instead.  For resizable
      streams the size returned by this function is an implementation
      detail and may be change at any time in response to operations on the
      stream.
      
      If the stream is fixed-sized (ie: no realloc was passed to
      [gid.gio2.memory_output_stream.MemoryOutputStream.new_]) then this is the maximum size of the
      stream and further writes will return [gid.gio2.types.IOErrorEnum.NoSpace].
      
      In any case, if you want the number of bytes currently written to the
      stream, use [gid.gio2.memory_output_stream.MemoryOutputStream.getDataSize].
      Returns: the number of bytes allocated for the data buffer
  */
  size_t getSize() nothrow
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
  gid.glib2.bytes.Bytes stealAsBytes() nothrow
  {
    GBytes* _cretval;
    _cretval = g_memory_output_stream_steal_as_bytes(cast(GMemoryOutputStream*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  alias stealData = gid.gobject2.object.ObjectWrap.stealData;

  /**
      Gets any loaded data from the ostream. Ownership of the data
      is transferred to the caller; when no longer needed it must be
      freed using the free function set in ostream's
      #GMemoryOutputStream:destroy-function property.
      
      ostream must be closed before calling this function.
      Returns: the stream's data, or null if it has previously
           been stolen
  */
  void* stealData() nothrow
  {
    auto _retval = g_memory_output_stream_steal_data(cast(GMemoryOutputStream*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.memory_output_stream.MemoryOutputStream]
class MemoryOutputStreamGidBuilderImpl(T) : gid.gio2.output_stream.OutputStreamGidBuilderImpl!T, gid.gio2.pollable_output_stream.PollableOutputStreamGidBuilderImpl!T, gid.gio2.seekable.SeekableGidBuilderImpl!T
{

  mixin PollableOutputStreamGidBuilderT!();
  mixin SeekableGidBuilderT!();

  /**
      Set `data` property.
      Params:
        propval = Pointer to buffer where data will be written.
      Returns: Builder instance for fluent chaining
  */
  T data(void* propval) nothrow
  {
    return setProperty("data", propval);
  }

  /**
      Set `size` property.
      Params:
        propval = Current size of the data buffer.
      Returns: Builder instance for fluent chaining
  */
  T size(gulong propval) nothrow
  {
    return setProperty("size", propval);
  }
}

/// Fluent builder for [gid.gio2.memory_output_stream.MemoryOutputStream]
final class MemoryOutputStreamGidBuilder : MemoryOutputStreamGidBuilderImpl!MemoryOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MemoryOutputStream build() nothrow
  {
    return new MemoryOutputStream(cast(void*)createGObject(MemoryOutputStream._getGType), Yes.Take);
  }
}
