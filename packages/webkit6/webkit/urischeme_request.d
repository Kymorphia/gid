/// Module for [URISchemeRequest] class
module webkit.urischeme_request;

import gid.gid;
import gio.input_stream;
import glib.error;
import gobject.gid_builder;
import gobject.object;
import soup.message_headers;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;
import webkit.urischeme_response;
import webkit.web_view;

/**
    Represents a URI scheme request.
    
    If you register a particular URI scheme in a #WebKitWebContext,
    using [webkit.web_context.WebContext.registerUriScheme], you have to provide
    a #WebKitURISchemeRequestCallback. After that, when a URI request
    is made with that particular scheme, your callback will be
    called. There you will be able to access properties such as the
    scheme, the URI and path, and the #WebKitWebView that initiated the
    request, and also finish the request with
    [webkit.urischeme_request.URISchemeRequest.finish].
*/
class URISchemeRequest : gobject.object.ObjectWrap
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
    return cast(void function())webkit_uri_scheme_request_get_type != &gidSymbolNotFound ? webkit_uri_scheme_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override URISchemeRequest self()
  {
    return this;
  }

  /**
  Get builder for [webkit.urischeme_request.URISchemeRequest]
  Returns: New builder object
  */
  static URISchemeRequestGidBuilder builder()
  {
    return new URISchemeRequestGidBuilder;
  }

  /**
      Finish a #WebKitURISchemeRequest by setting the contents of the request and its mime type.
  
      Params:
        stream = a #GInputStream to read the contents of the request
        streamLength = the length of the stream or -1 if not known
        contentType = the content type of the stream or null if not known
  */
  void finish(gio.input_stream.InputStream stream, long streamLength, string contentType = null)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    webkit_uri_scheme_request_finish(cast(WebKitURISchemeRequest*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, streamLength, _contentType);
  }

  /**
      Finish a #WebKitURISchemeRequest with a #GError.
  
      Params:
        error = a #GError that will be passed to the #WebKitWebView
  */
  void finishError(glib.error.ErrorWrap error)
  {
    webkit_uri_scheme_request_finish_error(cast(WebKitURISchemeRequest*)this._cPtr, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Finish a #WebKitURISchemeRequest by returning a #WebKitURISchemeResponse
  
      Params:
        response = a #WebKitURISchemeResponse
  */
  void finishWithResponse(webkit.urischeme_response.URISchemeResponse response)
  {
    webkit_uri_scheme_request_finish_with_response(cast(WebKitURISchemeRequest*)this._cPtr, response ? cast(WebKitURISchemeResponse*)response._cPtr(No.Dup) : null);
  }

  /**
      Get the request body.
      Returns: (nullable): the body of the request.
  */
  gio.input_stream.InputStream getHttpBody()
  {
    GInputStream* _cretval;
    _cretval = webkit_uri_scheme_request_get_http_body(cast(WebKitURISchemeRequest*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #SoupMessageHeaders of the request.
      Returns: the #SoupMessageHeaders of the request.
  */
  soup.message_headers.MessageHeaders getHttpHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = webkit_uri_scheme_request_get_http_headers(cast(WebKitURISchemeRequest*)this._cPtr);
    auto _retval = _cretval ? new soup.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the HTTP method of the request.
      Returns: the HTTP method of the request
  */
  string getHttpMethod()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_http_method(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the URI path of request.
      Returns: the URI path of request
  */
  string getPath()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_path(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the URI scheme of request.
      Returns: the URI scheme of request
  */
  string getScheme()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_scheme(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the URI of request.
      Returns: the full URI of request
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_uri(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitWebView that initiated the request.
      Returns: the #WebKitWebView that initiated request.
  */
  webkit.web_view.WebView getWebView()
  {
    WebKitWebView* _cretval;
    _cretval = webkit_uri_scheme_request_get_web_view(cast(WebKitURISchemeRequest*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.web_view.WebView)(cast(WebKitWebView*)_cretval, No.Take);
    return _retval;
  }
}

class URISchemeRequestGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [webkit.urischeme_request.URISchemeRequest]
final class URISchemeRequestGidBuilder : URISchemeRequestGidBuilderImpl!URISchemeRequestGidBuilder
{
  URISchemeRequest build()
  {
    return new URISchemeRequest(cast(void*)createGObject(URISchemeRequest._getGType), No.Take);
  }
}
