/// Module for [Codec] class
module arrow.codec;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/** */
class Codec : gobject.object.ObjectWrap
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
    return cast(void function())garrow_codec_get_type != &gidSymbolNotFound ? garrow_codec_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Codec self()
  {
    return this;
  }

  /**
  Get builder for [arrow.codec.Codec]
  Returns: New builder object
  */
  static CodecGidBuilder builder()
  {
    return new CodecGidBuilder;
  }

  /** */
  this(arrow.types.CompressionType type)
  {
    GArrowCodec* _cretval;
    GError *_err;
    _cretval = garrow_codec_new(type, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /** */
  int getCompressionLevel()
  {
    int _retval;
    _retval = garrow_codec_get_compression_level(cast(GArrowCodec*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.types.CompressionType getCompressionType()
  {
    GArrowCompressionType _cretval;
    _cretval = garrow_codec_get_compression_type(cast(GArrowCodec*)this._cPtr);
    arrow.types.CompressionType _retval = cast(arrow.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  string getName()
  {
    const(char)* _cretval;
    _cretval = garrow_codec_get_name(cast(GArrowCodec*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

class CodecGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T codec(void* propval)
  {
    return setProperty("codec", propval);
  }
}

/// Fluent builder for [arrow.codec.Codec]
final class CodecGidBuilder : CodecGidBuilderImpl!CodecGidBuilder
{
  Codec build()
  {
    return new Codec(cast(void*)createGObject(Codec._getGType), Yes.Take);
  }
}
