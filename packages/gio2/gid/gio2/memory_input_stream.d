/// Module for [MemoryInputStream] class
module gid.gio2.memory_input_stream;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.input_stream;
import gid.gio2.pollable_input_stream;
import gid.gio2.pollable_input_stream_mixin;
import gid.gio2.seekable;
import gid.gio2.seekable_mixin;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.memory_input_stream.MemoryInputStream] is a class for using arbitrary
    memory chunks as input for GIO streaming input operations.
    
    As of GLib 2.34, [gid.gio2.memory_input_stream.MemoryInputStream] implements
    [gid.gio2.pollable_input_stream.PollableInputStream].
*/
class MemoryInputStream : gid.gio2.input_stream.InputStream, gid.gio2.pollable_input_stream.PollableInputStream, gid.gio2.seekable.Seekable
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
    return cast(void function())g_memory_input_stream_get_type != &gidSymbolNotFound ? g_memory_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMemoryInputStream";
  }

  /** Returns `this`, for use in `with` statements. */
  override MemoryInputStream self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.memory_input_stream.MemoryInputStream]
      Returns: New builder object
  */
  static MemoryInputStreamGidBuilder builder() nothrow
  {
    return new MemoryInputStreamGidBuilder;
  }

  mixin PollableInputStreamT!();
  mixin SeekableT!();

  /**
      Creates a new empty #GMemoryInputStream.
      Returns: a new #GInputStream
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GInputStream* _cretval;
      _cretval = g_memory_input_stream_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a new #GMemoryInputStream with data from the given bytes.
  
      Params:
        bytes = a #GBytes
      Returns: new #GInputStream read from bytes
  */
  static gid.gio2.memory_input_stream.MemoryInputStream newFromBytes(gid.glib2.bytes.Bytes bytes) nothrow
  {
    GInputStream* _cretval;
    _cretval = g_memory_input_stream_new_from_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.memory_input_stream.MemoryInputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Appends bytes to data that can be read from the input stream.
  
      Params:
        bytes = input data
  */
  void addBytes(gid.glib2.bytes.Bytes bytes) nothrow
  {
    g_memory_input_stream_add_bytes(cast(GMemoryInputStream*)this._cPtr, bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gio2.memory_input_stream.MemoryInputStream]
class MemoryInputStreamGidBuilderImpl(T) : gid.gio2.input_stream.InputStreamGidBuilderImpl!T, gid.gio2.pollable_input_stream.PollableInputStreamGidBuilderImpl!T, gid.gio2.seekable.SeekableGidBuilderImpl!T
{

  mixin PollableInputStreamGidBuilderT!();
  mixin SeekableGidBuilderT!();
}

/// Fluent builder for [gid.gio2.memory_input_stream.MemoryInputStream]
final class MemoryInputStreamGidBuilder : MemoryInputStreamGidBuilderImpl!MemoryInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MemoryInputStream build() nothrow
  {
    return new MemoryInputStream(cast(void*)createGObject(MemoryInputStream._getGType), Yes.Take);
  }
}
