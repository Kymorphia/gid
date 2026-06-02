/// Module for [WriteOptions] class
module arrow.write_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.codec;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class WriteOptions : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_write_options_get_type != &gidSymbolNotFound ? garrow_write_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WriteOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.write_options.WriteOptions]
      Returns: New builder object
  */
  static WriteOptionsGidBuilder builder() nothrow
  {
    return new WriteOptionsGidBuilder;
  }

  /**
      Get `alignment` property.
      Returns: Write padding after memory buffers to this multiple of
        bytes. Generally 8 or 64.
  */
  @property int alignment() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("alignment");
  }

  /**
      Set `alignment` property.
      Params:
        propval = Write padding after memory buffers to this multiple of
          bytes. Generally 8 or 64.
  */
  @property void alignment(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("alignment", propval);
  }

  /**
      Get `allow64bit` property.
      Returns: Whether to allow field lengths that don't fit in a signed 32-bit
        int. Some implementations may not be able to parse such streams.
  */
  @property bool allow64bit() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("allow-64bit");
  }

  /**
      Set `allow64bit` property.
      Params:
        propval = Whether to allow field lengths that don't fit in a signed 32-bit
          int. Some implementations may not be able to parse such streams.
  */
  @property void allow64bit(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("allow-64bit", propval);
  }

  /**
      Get `codec` property.
      Returns: Codec to use for compressing and decompressing record batch body
        buffers. This is not part of the Arrow IPC protocol and only for
        internal use (e.g. Feather files).
        
        May only be UNCOMPRESSED, LZ4_FRAME and ZSTD.
  */
  @property arrow.codec.Codec codec() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.codec.Codec)("codec");
  }

  /**
      Set `codec` property.
      Params:
        propval = Codec to use for compressing and decompressing record batch body
          buffers. This is not part of the Arrow IPC protocol and only for
          internal use (e.g. Feather files).
          
          May only be UNCOMPRESSED, LZ4_FRAME and ZSTD.
  */
  @property void codec(arrow.codec.Codec propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(arrow.codec.Codec)("codec", propval);
  }

  /**
      Get `maxRecursionDepth` property.
      Returns: The maximum permitted schema nesting depth.
  */
  @property int maxRecursionDepth() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(int)("max-recursion-depth");
  }

  /**
      Set `maxRecursionDepth` property.
      Params:
        propval = The maximum permitted schema nesting depth.
  */
  @property void maxRecursionDepth(int propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(int)("max-recursion-depth", propval);
  }

  /**
      Get `useThreads` property.
      Returns: Whether to use the global CPU thread pool.
  */
  @property bool useThreads() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("use-threads");
  }

  /**
      Set `useThreads` property.
      Params:
        propval = Whether to use the global CPU thread pool.
  */
  @property void useThreads(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("use-threads", propval);
  }

  /**
      Get `writeLegacyIpcFormat` property.
      Returns: Whether to write the pre-0.15.0 encapsulated IPC message format
        consisting of a 4-byte prefix instead of 8 byte.
  */
  @property bool writeLegacyIpcFormat() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("write-legacy-ipc-format");
  }

  /**
      Set `writeLegacyIpcFormat` property.
      Params:
        propval = Whether to write the pre-0.15.0 encapsulated IPC message format
          consisting of a 4-byte prefix instead of 8 byte.
  */
  @property void writeLegacyIpcFormat(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("write-legacy-ipc-format", propval);
  }

  /** */
  this() nothrow
  {
    GArrowWriteOptions* _cretval;
    _cretval = garrow_write_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.write_options.WriteOptions]
class WriteOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `alignment` property.
      Params:
        propval = Write padding after memory buffers to this multiple of
          bytes. Generally 8 or 64.
      Returns: Builder instance for fluent chaining
  */
  T alignment(int propval) nothrow
  {
    return setProperty("alignment", propval);
  }

  /**
      Set `allow64bit` property.
      Params:
        propval = Whether to allow field lengths that don't fit in a signed 32-bit
          int. Some implementations may not be able to parse such streams.
      Returns: Builder instance for fluent chaining
  */
  T allow64bit(bool propval) nothrow
  {
    return setProperty("allow-64bit", propval);
  }

  /**
      Set `codec` property.
      Params:
        propval = Codec to use for compressing and decompressing record batch body
          buffers. This is not part of the Arrow IPC protocol and only for
          internal use (e.g. Feather files).
          
          May only be UNCOMPRESSED, LZ4_FRAME and ZSTD.
      Returns: Builder instance for fluent chaining
  */
  T codec(arrow.codec.Codec propval) nothrow
  {
    return setProperty("codec", propval);
  }

  /**
      Set `maxRecursionDepth` property.
      Params:
        propval = The maximum permitted schema nesting depth.
      Returns: Builder instance for fluent chaining
  */
  T maxRecursionDepth(int propval) nothrow
  {
    return setProperty("max-recursion-depth", propval);
  }

  /**
      Set `useThreads` property.
      Params:
        propval = Whether to use the global CPU thread pool.
      Returns: Builder instance for fluent chaining
  */
  T useThreads(bool propval) nothrow
  {
    return setProperty("use-threads", propval);
  }

  /**
      Set `writeLegacyIpcFormat` property.
      Params:
        propval = Whether to write the pre-0.15.0 encapsulated IPC message format
          consisting of a 4-byte prefix instead of 8 byte.
      Returns: Builder instance for fluent chaining
  */
  T writeLegacyIpcFormat(bool propval) nothrow
  {
    return setProperty("write-legacy-ipc-format", propval);
  }
}

/// Fluent builder for [arrow.write_options.WriteOptions]
final class WriteOptionsGidBuilder : WriteOptionsGidBuilderImpl!WriteOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WriteOptions build() nothrow
  {
    return new WriteOptions(cast(void*)createGObject(WriteOptions._getGType), Yes.Take);
  }
}
