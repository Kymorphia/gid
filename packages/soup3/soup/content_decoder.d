/// Module for [ContentDecoder] class
module soup.content_decoder;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    Handles decoding of HTTP messages.
    
    #SoupContentDecoder handles adding the "Accept-Encoding" header on
    outgoing messages, and processing the "Content-Encoding" header on
    incoming ones. Currently it supports the "gzip", "deflate", and "br"
    content codings.
    
    A #SoupContentDecoder will automatically be
    added to the session by default. (You can use
    [soup.session.Session.removeFeatureByType] if you don't
    want this.)
    
    If #SoupContentDecoder successfully decodes the Content-Encoding,
    the message body will contain the decoded data; however, the message headers
    will be unchanged (and so "Content-Encoding" will still be present,
    "Content-Length" will describe the original encoded length, etc).
    
    If "Content-Encoding" contains any encoding types that
    #SoupContentDecoder doesn't recognize, then none of the encodings
    will be decoded.
    
    (Note that currently there is no way to (automatically) use
    Content-Encoding when sending a request body, or to pick specific
    encoding types to support.)
*/
class ContentDecoder : gobject.object.ObjectWrap, soup.session_feature.SessionFeature
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
    return cast(void function())soup_content_decoder_get_type != &gidSymbolNotFound ? soup_content_decoder_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentDecoder self()
  {
    return this;
  }

  /**
  Get builder for [soup.content_decoder.ContentDecoder]
  Returns: New builder object
  */
  static ContentDecoderGidBuilder builder()
  {
    return new ContentDecoderGidBuilder;
  }

  mixin SessionFeatureT!();
}

class ContentDecoderGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, soup.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [soup.content_decoder.ContentDecoder]
final class ContentDecoderGidBuilder : ContentDecoderGidBuilderImpl!ContentDecoderGidBuilder
{
  ContentDecoder build()
  {
    return new ContentDecoder(cast(void*)createGObject(ContentDecoder._getGType), No.Take);
  }
}
