/// Module for [CompressedOutputStream] class
module arrow.compressed_output_stream;

import arrow.c.functions;
import arrow.c.types;
import arrow.codec;
import arrow.file;
import arrow.file_mixin;
import arrow.output_stream;
import arrow.types;
import arrow.writable;
import arrow.writable_mixin;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class CompressedOutputStream : arrow.output_stream.OutputStream
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
    return cast(void function())garrow_compressed_output_stream_get_type != &gidSymbolNotFound ? garrow_compressed_output_stream_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompressedOutputStream self()
  {
    return this;
  }

  /**
      Get builder for [arrow.compressed_output_stream.CompressedOutputStream]
      Returns: New builder object
  */
  static CompressedOutputStreamGidBuilder builder()
  {
    return new CompressedOutputStreamGidBuilder;
  }

  /** */
  @property arrow.codec.Codec codec()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.codec.Codec)("codec");
  }

  /** */
  @property arrow.output_stream.OutputStream raw()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.output_stream.OutputStream)("raw");
  }

  /** */
  this(arrow.codec.Codec codec, arrow.output_stream.OutputStream raw)
  {
    GArrowCompressedOutputStream* _cretval;
    GError *_err;
    _cretval = garrow_compressed_output_stream_new(codec ? cast(GArrowCodec*)codec._cPtr(No.Dup) : null, raw ? cast(GArrowOutputStream*)raw._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.compressed_output_stream.CompressedOutputStream]
class CompressedOutputStreamGidBuilderImpl(T) : arrow.output_stream.OutputStreamGidBuilderImpl!T
{


  /** */
  T codec(arrow.codec.Codec propval)
  {
    return setProperty("codec", propval);
  }

  /** */
  T raw(arrow.output_stream.OutputStream propval)
  {
    return setProperty("raw", propval);
  }
}

/// Fluent builder for [arrow.compressed_output_stream.CompressedOutputStream]
final class CompressedOutputStreamGidBuilder : CompressedOutputStreamGidBuilderImpl!CompressedOutputStreamGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompressedOutputStream build()
  {
    return new CompressedOutputStream(cast(void*)createGObject(CompressedOutputStream._getGType), Yes.Take);
  }
}
