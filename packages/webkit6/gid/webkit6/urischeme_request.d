/// Module for [URISchemeRequest] class
module gid.webkit6.urischeme_request;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.input_stream;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.message_headers;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;
import gid.webkit6.urischeme_response;
import gid.webkit6.web_view;

/**
    Represents a URI scheme request.
    
    If you register a particular URI scheme in a #WebKitWebContext,
    using [gid.webkit6.web_context.WebContext.registerUriScheme], you have to provide
    a #WebKitURISchemeRequestCallback. After that, when a URI request
    is made with that particular scheme, your callback will be
    called. There you will be able to access properties such as the
    scheme, the URI and path, and the #WebKitWebView that initiated the
    request, and also finish the request with
    [gid.webkit6.urischeme_request.URISchemeRequest.finish].
*/
@gidGir("URISchemeRequest", "URISchemeRequestClass")
class URISchemeRequest : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_uri_scheme_request_get_type != &gidSymbolNotFound ? webkit_uri_scheme_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitURISchemeRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override URISchemeRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.urischeme_request.URISchemeRequest]
      Returns: New builder object
  */
  static URISchemeRequestGidBuilder builder() nothrow
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
  void finish(gid.gio2.input_stream.InputStream stream, long streamLength, string contentType = null) nothrow
  {
    const(char)* _contentType = contentType.toCString!(No.Malloc, Yes.Nullable);
    webkit_uri_scheme_request_finish(cast(WebKitURISchemeRequest*)this._cPtr, stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, streamLength, _contentType);
  }

  /**
      Finish a #WebKitURISchemeRequest with a #GError.
  
      Params:
        error = a #GError that will be passed to the #WebKitWebView
  */
  void finishError(gid.glib2.error.ErrorWrap error) nothrow
  {
    webkit_uri_scheme_request_finish_error(cast(WebKitURISchemeRequest*)this._cPtr, error ? cast(GError*)error._cPtr(No.Dup) : null);
  }

  /**
      Finish a #WebKitURISchemeRequest by returning a #WebKitURISchemeResponse
  
      Params:
        response = a #WebKitURISchemeResponse
  */
  void finishWithResponse(gid.webkit6.urischeme_response.URISchemeResponse response) nothrow
  {
    webkit_uri_scheme_request_finish_with_response(cast(WebKitURISchemeRequest*)this._cPtr, response ? cast(WebKitURISchemeResponse*)response._cPtr(No.Dup) : null);
  }

  /**
      Get the request body.
      Returns: (nullable): the body of the request.
  */
  gid.gio2.input_stream.InputStream getHttpBody() nothrow
  {
    GInputStream* _cretval;
    _cretval = webkit_uri_scheme_request_get_http_body(cast(WebKitURISchemeRequest*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the #SoupMessageHeaders of the request.
      Returns: the #SoupMessageHeaders of the request.
  */
  gid.soup3.message_headers.MessageHeaders getHttpHeaders() nothrow
  {
    SoupMessageHeaders* _cretval;
    _cretval = webkit_uri_scheme_request_get_http_headers(cast(WebKitURISchemeRequest*)this._cPtr);
    auto _retval = _cretval ? new gid.soup3.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the HTTP method of the request.
      Returns: the HTTP method of the request
  */
  string getHttpMethod() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_http_method(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the URI path of request.
      Returns: the URI path of request
  */
  string getPath() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_path(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the URI scheme of request.
      Returns: the URI scheme of request
  */
  string getScheme() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_scheme(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the URI of request.
      Returns: the full URI of request
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_uri_scheme_request_get_uri(cast(WebKitURISchemeRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the #WebKitWebView that initiated the request.
      Returns: the #WebKitWebView that initiated request.
  */
  gid.webkit6.web_view.WebView getWebView() nothrow
  {
    WebKitWebView* _cretval;
    _cretval = webkit_uri_scheme_request_get_web_view(cast(WebKitURISchemeRequest*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.web_view.WebView)(cast(WebKitWebView*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.webkit6.urischeme_request.URISchemeRequest]
class URISchemeRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.urischeme_request.URISchemeRequest]
final class URISchemeRequestGidBuilder : URISchemeRequestGidBuilderImpl!URISchemeRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  URISchemeRequest build() nothrow
  {
    return new URISchemeRequest(cast(void*)createGObject(URISchemeRequest._getGType), Yes.Take);
  }
}
