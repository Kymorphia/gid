/// Module for [URIHandler] interface mixin
module gst.urihandler_mixin;

public import gst.urihandler_iface_proxy;
public import gid.gid;
public import glib.error;
public import gst.c.functions;
public import gst.c.types;
public import gst.types;

/**
    The #GstURIHandler is an interface that is implemented by Source and Sink
    #GstElement to unify handling of URI.
    
    An application can use the following functions to quickly get an element
    that handles the given URI for reading or writing
    ([gst.element.Element.makeFromUri]).
    
    Source and Sink plugins should implement this interface when possible.
*/
template URIHandlerT()
{

  /**
      Gets the list of protocols supported by handler. This list may not be
      modified.
      Returns: the
            supported protocols.  Returns null if the handler isn't
            implemented properly, or the handler doesn't support any
            protocols.
  */
  override string[] getProtocols()
  {
    const(char*)* _cretval;
    _cretval = gst_uri_handler_get_protocols(cast(GstURIHandler*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the currently handled URI.
      Returns: the URI currently handled by
          the handler.  Returns null if there are no URI currently
          handled. The returned string must be freed with [glib.global.gfree] when no
          longer needed.
  */
  override string getUri()
  {
    char* _cretval;
    _cretval = gst_uri_handler_get_uri(cast(GstURIHandler*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the type of the given URI handler
      Returns: the #GstURIType of the URI handler.
        Returns #GST_URI_UNKNOWN if the handler isn't implemented correctly.
  */
  override gst.types.URIType getUriType()
  {
    GstURIType _cretval;
    _cretval = gst_uri_handler_get_uri_type(cast(GstURIHandler*)this._cPtr);
    gst.types.URIType _retval = cast(gst.types.URIType)_cretval;
    return _retval;
  }

  /**
      Tries to set the URI of the given handler.
  
      Params:
        uri = URI to set
      Returns: true if the URI was set successfully, else false.
      Throws: [ErrorWrap]
  */
  override bool setUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _retval = cast(bool)gst_uri_handler_set_uri(cast(GstURIHandler*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
