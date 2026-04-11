/// Module for [MemoryInputStream] class
module gio.memory_input_stream;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.input_stream;
import gio.pollable_input_stream;
import gio.pollable_input_stream_mixin;
import gio.seekable;
import gio.seekable_mixin;
import gio.types;
import glib.bytes;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.memory_input_stream.MemoryInputStream] is a class for using arbitrary
    memory chunks as input for GIO streaming input operations.
    
    As of GLib 2.34, [gio.memory_input_stream.MemoryInputStream] implements
    [gio.pollable_input_stream.PollableInputStream].
*/
class MemoryInputStream : gio.input_stream.InputStream, gio.pollable_input_stream.PollableInputStream, gio.seekable.Seekable
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
    return cast(void function())g_memory_input_stream_get_type != &gidSymbolNotFound ? g_memory_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryInputStream self()
  {
    return this;
  }

  /**
      Get builder for [gio.memory_input_stream.MemoryInputStream]
      Returns: New builder object
  */
  static MemoryInputStreamGidBuilder builder()
  {
    return new MemoryInputStreamGidBuilder;
  }

  mixin PollableInputStreamT!();
  mixin SeekableT!();

  /**
      Creates a new empty #GMemoryInputStream.
      Returns: a new #GInputStream
  */
  this()
  {
    GInputStream* _cretval;
    _cretval = g_memory_input_stream_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMemoryInputStream with data from the given bytes.
  
      Params:
        bytes = a #GBytes
      Returns: new #GInputStream read from bytes
  */
  static gio.memory_input_stream.MemoryInputStream newFromBytes(glib.bytes.Bytes bytes)
  {
    GInputStream* _cretval;
    _cretval = g_memory_input_stream_new_from_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.memory_input_stream.MemoryInputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends bytes to data that can be read from the input stream.
  
      Params:
        bytes = input data
  */
  void addBytes(glib.bytes.Bytes bytes)
  {
    g_memory_input_stream_add_bytes(cast(GMemoryInputStream*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gio.memory_input_stream.MemoryInputStream]
class MemoryInputStreamGidBuilderImpl(T) : gio.input_stream.InputStreamGidBuilderImpl!T, gio.pollable_input_stream.PollableInputStreamGidBuilderImpl!T, gio.seekable.SeekableGidBuilderImpl!T
{

  mixin PollableInputStreamGidBuilderT!();
  mixin SeekableGidBuilderT!();
}

/// Fluent builder for [gio.memory_input_stream.MemoryInputStream]
final class MemoryInputStreamGidBuilder : MemoryInputStreamGidBuilderImpl!MemoryInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MemoryInputStream build()
  {
    return new MemoryInputStream(cast(void*)createGObject(MemoryInputStream._getGType), Yes.Take);
  }
}
