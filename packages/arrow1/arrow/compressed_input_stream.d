/// Module for [CompressedInputStream] class
module arrow.compressed_input_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.codec;
import arrow.file;
import arrow.file_mixin;
import arrow.input_stream;
import arrow.readable;
import arrow.readable_mixin;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class CompressedInputStream : arrow.input_stream.InputStream
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
    return cast(void function())garrow_compressed_input_stream_get_type != &gidSymbolNotFound ? garrow_compressed_input_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompressedInputStream self()
  {
    return this;
  }

  /**
      Get builder for [arrow.compressed_input_stream.CompressedInputStream]
      Returns: New builder object
  */
  static CompressedInputStreamGidBuilder builder()
  {
    return new CompressedInputStreamGidBuilder;
  }

  /** */
  @property arrow.codec.Codec codec()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.codec.Codec)("codec");
  }

  /** */
  @property arrow.input_stream.InputStream raw()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.input_stream.InputStream)("raw");
  }

  /** */
  this(arrow.codec.Codec codec, arrow.input_stream.InputStream raw)
  {
    GArrowCompressedInputStream* _cretval;
    GError *_err;
    _cretval = garrow_compressed_input_stream_new(codec ? cast(GArrowCodec*)codec._cPtr(No.Dup) : null, raw ? cast(GArrowInputStream*)raw._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.compressed_input_stream.CompressedInputStream]
class CompressedInputStreamGidBuilderImpl(T) : arrow.input_stream.InputStreamGidBuilderImpl!T
{


  /** */
  T codec(arrow.codec.Codec propval)
  {
    return setProperty("codec", propval);
  }

  /** */
  T raw(arrow.input_stream.InputStream propval)
  {
    return setProperty("raw", propval);
  }
}

/// Fluent builder for [arrow.compressed_input_stream.CompressedInputStream]
final class CompressedInputStreamGidBuilder : CompressedInputStreamGidBuilderImpl!CompressedInputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompressedInputStream build()
  {
    return new CompressedInputStream(cast(void*)createGObject(CompressedInputStream._getGType), Yes.Take);
  }
}
