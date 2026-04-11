/// Module for [StreamableContent] interface
module atk.streamable_content;

public import atk.streamable_content_iface_proxy;
import atk.c.functions;
import atk.c.types;
import atk.types;
import gid.gid;
import glib.iochannel;
import gobject.gid_builder;

/**
    The ATK interface which provides access to streamable content.
    
    An interface whereby an object allows its backing content to be
    streamed to clients.  Typical implementors would be images or
    icons, HTML content, or multimedia display/rendering widgets.
    
    Negotiation of content type is allowed. Clients may examine the
    backing data and transform, convert, or parse the content in order
    to present it in an alternate form to end-users.
    
    The AtkStreamableContent interface is particularly useful for
    saving, printing, or post-processing entire documents, or for
    persisting alternate views of a document. If document content
    itself is being serialized, stored, or converted, then use of the
    AtkStreamableContent interface can help address performance
    issues. Unlike most ATK interfaces, this interface is not strongly
    tied to the current user-agent view of the a particular document,
    but may in some cases give access to the underlying model data.
*/
interface StreamableContent
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())atk_streamable_content_get_type != &gidSymbolNotFound ? atk_streamable_content_get_type() : cast(GType)0;
  }

  /**
      Gets the character string of the specified mime type. The first mime
      type is at position 0, the second at position 1, and so on.
  
      Params:
        i = a gint representing the position of the mime type starting from 0
      Returns: a gchar* representing the specified mime type; the caller
        should not free the character string.
  */
  string getMimeType(int i);

  /**
      Gets the number of mime types supported by this object.
      Returns: a gint which is the number of mime types supported by the object.
  */
  int getNMimeTypes();

  /**
      Gets the content in the specified mime type.
  
      Params:
        mimeType = a gchar* representing the mime type
      Returns: A #GIOChannel which contains the content in the
        specified mime type.
  */
  glib.iochannel.IOChannel getStream(string mimeType);

  /**
      Get a string representing a URI in IETF standard format
      (see http://www.ietf.org/rfc/rfc2396.txt) from which the object's content
      may be streamed in the specified mime-type, if one is available.
      If mime_type is NULL, the URI for the default (and possibly only) mime-type is
      returned.
      
      Note that it is possible for get_uri to return NULL but for
      get_stream to work nonetheless, since not all GIOChannels connect to URIs.
  
      Params:
        mimeType = a gchar* representing the mime type, or NULL to request a URI
          for the default mime type.
      Returns: Returns a string representing a URI, or null
        if no corresponding URI can be constructed.
  */
  string getUri(string mimeType);
}

/// Fluent builder implementation template for [atk.streamable_content.StreamableContent]
interface StreamableContentGidBuilderImpl(T)
{
}
