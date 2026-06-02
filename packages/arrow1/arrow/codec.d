/// Module for [Codec] class
module arrow.codec;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_codec_get_type != &gidSymbolNotFound ? garrow_codec_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Codec self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.codec.Codec]
      Returns: New builder object
  */
  static CodecGidBuilder builder() nothrow
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
  int getCompressionLevel() nothrow
  {
    int _retval;
    _retval = garrow_codec_get_compression_level(cast(GArrowCodec*)this._cPtr);
    return _retval;
  }

  /** */
  arrow.types.CompressionType getCompressionType() nothrow
  {
    GArrowCompressionType _cretval;
    _cretval = garrow_codec_get_compression_type(cast(GArrowCodec*)this._cPtr);
    arrow.types.CompressionType _retval = cast(arrow.types.CompressionType)_cretval;
    return _retval;
  }

  /** */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = garrow_codec_get_name(cast(GArrowCodec*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.codec.Codec]
class CodecGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T codec(void* propval) nothrow
  {
    return setProperty("codec", propval);
  }
}

/// Fluent builder for [arrow.codec.Codec]
final class CodecGidBuilder : CodecGidBuilderImpl!CodecGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Codec build() nothrow
  {
    return new Codec(cast(void*)createGObject(Codec._getGType), Yes.Take);
  }
}
