/// Module for [URIHandler] interface
module gid.gst1.urihandler;

public import gid.core.basictypes;
public import gid.gst1.urihandler_iface_proxy;
import gid.core.utils;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.types;

/**
    The #GstURIHandler is an interface that is implemented by Source and Sink
    #GstElement to unify handling of URI.
    
    An application can use the following functions to quickly get an element
    that handles the given URI for reading or writing
    ([gid.gst1.element.Element.makeFromUri]).
    
    Source and Sink plugins should implement this interface when possible.
*/
@gidGir("URIHandler", "URIHandlerInterface")
interface URIHandler : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
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
          handled. The returned string must be freed with [gid.glib2.global.gfree] when no
          longer needed.
  */
  string getUri();

  /**
      Gets the type of the given URI handler
      Returns: the #GstURIType of the URI handler.
        Returns #GST_URI_UNKNOWN if the handler isn't implemented correctly.
  */
  gid.gst1.types.URIType getUriType();

  /**
      Tries to set the URI of the given handler.
  
      Params:
        uri = URI to set
      Returns: true if the URI was set successfully, else false.
      Throws: [ErrorWrap]
  */
  bool setUri(string uri);
}

/// Fluent builder implementation template for [gid.gst1.urihandler.URIHandler]
interface URIHandlerGidBuilderImpl(T)
{
}
