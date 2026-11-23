/// Module for [URIRequest] class
module gid.webkitwebprocessextension6.urirequest;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.message_headers;
import gid.webkitwebprocessextension6.c.functions;
import gid.webkitwebprocessextension6.c.types;
import gid.webkitwebprocessextension6.types;

/**
    Represents a URI request.
    
    A #WebKitURIRequest can be created with a URI using the
    [gid.webkitwebprocessextension6.urirequest.URIRequest.new_] method, and you can get the URI of an
    existing request with the [gid.webkitwebprocessextension6.urirequest.URIRequest.getUri] one.
*/
class URIRequest : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())webkit_uri_request_get_type != &gidSymbolNotFound ? webkit_uri_request_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitURIRequest";
  }

  /** Returns `this`, for use in `with` statements. */
  override URIRequest self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkitwebprocessextension6.urirequest.URIRequest]
      Returns: New builder object
  */
  static URIRequestGidBuilder builder() nothrow
  {
    return new URIRequestGidBuilder;
  }

  /**
      Get `uri` property.
      Returns: The URI to which the request will be made.
  */
  @property string uri() nothrow
  {
    return getUri();
  }

  /**
      Set `uri` property.
      Params:
        propval = The URI to which the request will be made.
  */
  @property void uri(string propval) nothrow
  {
    setUri(propval);
  }

  /**
      Creates a new #WebKitURIRequest for the given URI.
  
      Params:
        uri = an URI
      Returns: a new #WebKitURIRequest
  */
  this(string uri) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      WebKitURIRequest* _cretval;
      const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
      _cretval = webkit_uri_request_new(_uri);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Get the HTTP headers of a #WebKitURIRequest as a #SoupMessageHeaders.
      Returns: a #SoupMessageHeaders with the HTTP headers of request
           or null if request is not an HTTP request.
  */
  gid.soup3.message_headers.MessageHeaders getHttpHeaders() nothrow
  {
    SoupMessageHeaders* _cretval;
    _cretval = webkit_uri_request_get_http_headers(cast(WebKitURIRequest*)this._cPtr);
    auto _retval = _cretval ? new gid.soup3.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the HTTP method of the #WebKitURIRequest.
      Returns: the HTTP method of the #WebKitURIRequest or null if request is not
           an HTTP request.
  */
  string getHttpMethod() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_uri_request_get_http_method(cast(WebKitURIRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Obtains the request URI.
      Returns: request URI, as a string.
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_uri_request_get_uri(cast(WebKitURIRequest*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Set the URI of request
  
      Params:
        uri = an URI
  */
  void setUri(string uri) nothrow
  {
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    webkit_uri_request_set_uri(cast(WebKitURIRequest*)this._cPtr, _uri);
  }
}

/// Fluent builder implementation template for [gid.webkitwebprocessextension6.urirequest.URIRequest]
class URIRequestGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `uri` property.
      Params:
        propval = The URI to which the request will be made.
      Returns: Builder instance for fluent chaining
  */
  T uri(string propval) nothrow
  {
    return setProperty("uri", propval);
  }
}

/// Fluent builder for [gid.webkitwebprocessextension6.urirequest.URIRequest]
final class URIRequestGidBuilder : URIRequestGidBuilderImpl!URIRequestGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  URIRequest build() nothrow
  {
    return new URIRequest(cast(void*)createGObject(URIRequest._getGType), Yes.Take);
  }
}
