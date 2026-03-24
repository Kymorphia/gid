/// Module for [URIHandler] interface
module gst.urihandler;

public import gst.urihandler_iface_proxy;
import gid.gid;
import glib.error;
import gobject.gid_builder;
import gst.c.functions;
import gst.c.types;
import gst.types;

/**
    The #GstURIHandler is an interface that is implemented by Source and Sink
    #GstElement to unify handling of URI.
    
    An application can use the following functions to quickly get an element
    that handles the given URI for reading or writing
    ([gst.element.Element.makeFromUri]).
    
    Source and Sink plugins should implement this interface when possible.
*/
interface URIHandler
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_uri_handler_get_type != &gidSymbolNotFound ? gst_uri_handler_get_type() : cast(GType)0;
  }

  /**
      Gets the list of protocols supported by handler. This list may not be
      modified.
      Returns: the
            supported protocols.  Returns null if the handler isn't
            implemented properly, or the handler doesn't support any
            protocols.
  */
  string[] getProtocols();

  /**
      Gets the currently handled URI.
      Returns: the URI currently handled by
          the handler.  Returns null if there are no URI currently
          handled. The returned string must be freed with [glib.global.gfree] when no
          longer needed.
  */
  string getUri();

  /**
      Gets the type of the given URI handler
      Returns: the #GstURIType of the URI handler.
        Returns #GST_URI_UNKNOWN if the handler isn't implemented correctly.
  */
  gst.types.URIType getUriType();

  /**
      Tries to set the URI of the given handler.
  
      Params:
        uri = URI to set
      Returns: true if the URI was set successfully, else false.
      Throws: [ErrorWrap]
  */
  bool setUri(string uri);
}

interface URIHandlerGidBuilderImpl(T)
{
}
