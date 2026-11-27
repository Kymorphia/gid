/// Module for [ContentSniffer] class
module gid.soup3.content_sniffer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.bytes;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    Sniffs the mime type of messages.
    
    A [gid.soup3.content_sniffer.ContentSniffer] tries to detect the actual content type of
    the files that are being downloaded by looking at some of the data
    before the [gid.soup3.message.Message] emits its [gid.soup3.message.Message.gotHeaders] signal.
    [gid.soup3.content_sniffer.ContentSniffer] implements [gid.soup3.session_feature.SessionFeature], so you can add
    content sniffing to a session with [gid.soup3.session.Session.addFeature] or
    [gid.soup3.session.Session.addFeatureByType].
*/
@gidGir("ContentSniffer", "ContentSnifferClass")
class ContentSniffer : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
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
    return cast(void function())soup_content_sniffer_get_type != &gidSymbolNotFound ? soup_content_sniffer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupContentSniffer";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContentSniffer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.content_sniffer.ContentSniffer]
      Returns: New builder object
  */
  static ContentSnifferGidBuilder builder() nothrow
  {
    return new ContentSnifferGidBuilder;
  }

  mixin SessionFeatureT!();

  /**
      Creates a new [gid.soup3.content_sniffer.ContentSniffer].
      Returns: a new #SoupContentSniffer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      SoupContentSniffer* _cretval;
      _cretval = soup_content_sniffer_new();
      this(_cretval, Yes.Take);
    }
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
  string sniff(gid.soup3.message.Message msg, gid.glib2.bytes.Bytes buffer, out string[string] params) nothrow
  {
    char* _cretval;
    GHashTable* _params;
    _cretval = soup_content_sniffer_sniff(cast(SoupContentSniffer*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, buffer ? cast(GBytes*)buffer._cPtr(No.Dup) : null, &_params);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    params = gHashTableToD!(string, string, GidOwnership.Full)(_params);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.soup3.content_sniffer.ContentSniffer]
class ContentSnifferGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();
}

/// Fluent builder for [gid.soup3.content_sniffer.ContentSniffer]
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
