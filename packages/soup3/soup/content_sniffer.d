/// Module for [ContentSniffer] class
module soup.content_sniffer;

public import gid.basictypes;
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
    before the [soup.message.Message] emits its [soup.message.Message.gotHeaders] signal.
    #SoupContentSniffer implements [soup.session_feature.SessionFeature], so you can add
    content sniffing to a session with [soup.session.Session.addFeature] or
    [soup.session.Session.addFeatureByType].
*/
class ContentSniffer : gobject.object.ObjectWrap, soup.session_feature.SessionFeature
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
    return cast(void function())soup_content_sniffer_get_type != &gidSymbolNotFound ? soup_content_sniffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentSniffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [soup.content_sniffer.ContentSniffer]
      Returns: New builder object
  */
  static ContentSnifferGidBuilder builder() nothrow
  {
    return new ContentSnifferGidBuilder;
  }

  mixin SessionFeatureT!();

  /**
      Creates a new #SoupContentSniffer.
      Returns: a new #SoupContentSniffer
  */
  this() nothrow
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
  string sniff(soup.message.Message msg, glib.bytes.Bytes buffer, out string[string] params) nothrow
  {
    char* _cretval;
    GHashTable* _params;
    _cretval = soup_content_sniffer_sniff(cast(SoupContentSniffer*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, buffer ? cast(GBytes*)buffer._cPtr(No.Dup) : null, &_params);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    params = gHashTableToD!(string, string, GidOwnership.Full)(_params);
    return _retval;
  }
}

/// Fluent builder implementation template for [soup.content_sniffer.ContentSniffer]
class ContentSnifferGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, soup.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [soup.content_sniffer.ContentSniffer]
final class ContentSnifferGidBuilder : ContentSnifferGidBuilderImpl!ContentSnifferGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContentSniffer build() nothrow
  {
    return new ContentSniffer(cast(void*)createGObject(ContentSniffer._getGType), Yes.Take);
  }
}
