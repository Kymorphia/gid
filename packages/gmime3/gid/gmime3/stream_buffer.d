/// Module for [StreamBuffer] class
module gid.gmime3.stream_buffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;

/**
    A buffered stream wrapper around any #GMimeStream object.
*/
class StreamBuffer : gid.gmime3.stream.Stream
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
    return cast(void function())g_mime_stream_buffer_get_type != &gidSymbolNotFound ? g_mime_stream_buffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeStreamBuffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override StreamBuffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.stream_buffer.StreamBuffer]
      Returns: New builder object
  */
  static StreamBufferGidBuilder builder() nothrow
  {
    return new StreamBufferGidBuilder;
  }

  /**
      Creates a new GMimeStreamBuffer object.
  
      Params:
        source = source stream
        mode = buffering mode
      Returns: a new buffer stream with source source and mode mode.
  */
  this(gid.gmime3.stream.Stream source, gid.gmime3.types.StreamBufferMode mode) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GMimeStream* _cretval;
      _cretval = g_mime_stream_buffer_new(source ? cast(GMimeStream*)source._cPtr(No.Dup) : null, mode);
      this(_cretval, Yes.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gmime3.stream_buffer.StreamBuffer]
class StreamBufferGidBuilderImpl(T) : gid.gmime3.stream.StreamGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.stream_buffer.StreamBuffer]
final class StreamBufferGidBuilder : StreamBufferGidBuilderImpl!StreamBufferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StreamBuffer build() nothrow
  {
    return new StreamBuffer(cast(void*)createGObject(StreamBuffer._getGType), Yes.Take);
  }
}
