/// Module for [ContentSniffer] class
module soup.content_sniffer;

import gid.gid;
import glib.bytes;
import gobject.gid_builder;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.message;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    Sniffs the mime type of messages.
    
    A #SoupContentSniffer tries to detect the actual content type of
    the files that are being downloaded by looking at some of the data
    before the `class@Message` emits its `signal@Message::got-headers` signal.
    #SoupContentSniffer implements `iface@SessionFeature`, so you can add
    content sniffing to a session with [soup.session.Session.addFeature] or
    [soup.session.Session.addFeatureByType].
*/
class ContentSniffer : gobject.object.ObjectWrap, soup.session_feature.SessionFeature
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
    return cast(void function())soup_content_sniffer_get_type != &gidSymbolNotFound ? soup_content_sniffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentSniffer self()
  {
    return this;
  }

  /**
  Get builder for [soup.content_sniffer.ContentSniffer]
  Returns: New builder object
  */
  static ContentSnifferGidBuilder builder()
  {
    return new ContentSnifferGidBuilder;
  }

  mixin SessionFeatureT!();

  /**
      Creates a new #SoupContentSniffer.
      Returns: a new #SoupContentSniffer
  */
  this()
  {
    SoupContentSniffer* _cretval;
    _cretval = soup_content_sniffer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Sniffs buffer to determine its Content-Type.
      
      The result may also be influenced by the Content-Type declared in msg's
      response headers.
  
      Params:
        msg = the message to sniff
        buffer = a buffer containing the start of msg's response body
        params = return
            location for Content-Type parameters (eg, "charset"), or null
      Returns: the sniffed Content-Type of buffer; this will never be null,
          but may be `application/octet-stream`.
  */
  string sniff(soup.message.Message msg, glib.bytes.Bytes buffer, out string[string] params)
  {
    char* _cretval;
    GHashTable* _params;
    _cretval = soup_content_sniffer_sniff(cast(SoupContentSniffer*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, buffer ? cast(GBytes*)buffer._cPtr(No.Dup) : null, &_params);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    params = gHashTableToD!(string, string, GidOwnership.Full)(_params);
    return _retval;
  }
}

class ContentSnifferGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, soup.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [soup.content_sniffer.ContentSniffer]
final class ContentSnifferGidBuilder : ContentSnifferGidBuilderImpl!ContentSnifferGidBuilder
{
  ContentSniffer build()
  {
    return new ContentSniffer(cast(void*)createGObject(ContentSniffer._getGType), Yes.Take);
  }
}
