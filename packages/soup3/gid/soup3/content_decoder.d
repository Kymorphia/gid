/// Module for [ContentDecoder] class
module gid.soup3.content_decoder;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    Handles decoding of HTTP messages.
    
    [gid.soup3.content_decoder.ContentDecoder] handles adding the "Accept-Encoding" header on
    outgoing messages, and processing the "Content-Encoding" header on
    incoming ones. Currently it supports the "gzip", "deflate", and "br"
    content codings.
    
    A [gid.soup3.content_decoder.ContentDecoder] will automatically be
    added to the session by default. (You can use
    [gid.soup3.session.Session.removeFeatureByType] if you don't
    want this.)
    
    If [gid.soup3.content_decoder.ContentDecoder] successfully decodes the Content-Encoding,
    the message body will contain the decoded data; however, the message headers
    will be unchanged (and so "Content-Encoding" will still be present,
    "Content-Length" will describe the original encoded length, etc).
    
    If "Content-Encoding" contains any encoding types that
    [gid.soup3.content_decoder.ContentDecoder] doesn't recognize, then none of the encodings
    will be decoded.
    
    (Note that currently there is no way to (automatically) use
    Content-Encoding when sending a request body, or to pick specific
    encoding types to support.)
*/
class ContentDecoder : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
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
    return cast(void function())soup_content_decoder_get_type != &gidSymbolNotFound ? soup_content_decoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupContentDecoder";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentDecoder self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.content_decoder.ContentDecoder]
      Returns: New builder object
  */
  static ContentDecoderGidBuilder builder() nothrow
  {
    return new ContentDecoderGidBuilder;
  }

  mixin SessionFeatureT!();
}

/// Fluent builder implementation template for [gid.soup3.content_decoder.ContentDecoder]
class ContentDecoderGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [gid.soup3.content_decoder.ContentDecoder]
final class ContentDecoderGidBuilder : ContentDecoderGidBuilderImpl!ContentDecoderGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContentDecoder build() nothrow
  {
    return new ContentDecoder(cast(void*)createGObject(ContentDecoder._getGType), Yes.Take);
  }
}
