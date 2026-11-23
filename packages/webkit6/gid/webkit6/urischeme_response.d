/// Module for [URISchemeResponse] class
module gid.webkit6.urischeme_response;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.input_stream;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.message_headers;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Represents a URI scheme response.
    
    If you register a particular URI scheme in a #WebKitWebContext,
    using [gid.webkit6.web_context.WebContext.registerUriScheme], you have to provide
    a #WebKitURISchemeRequestCallback. After that, when a URI response
    is made with that particular scheme, your callback will be
    called. There you will be able to provide more response parameters
    when the methods and properties of a #WebKitURISchemeRequest is not
    enough.
    
    When you finished setting up your #WebKitURISchemeResponse, call
    webkit_uri_request_finish_with_response() with it to return the response.
*/
class URISchemeResponse : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_uri_scheme_response_get_type != &gidSymbolNotFound ? webkit_uri_scheme_response_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitURISchemeResponse";
  }

  /** Returns `this`, for use in `with` statements. */
  override URISchemeResponse self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.urischeme_response.URISchemeResponse]
      Returns: New builder object
  */
  static URISchemeResponseGidBuilder builder() nothrow
  {
    return new URISchemeResponseGidBuilder;
  }

  /**
      Create a new #WebKitURISchemeResponse
  
      Params:
        inputStream = a #GInputStream to read the contents of the request
        streamLength = the length of the stream or -1 if not known
      Returns: the newly created #WebKitURISchemeResponse.
  */
  this(gid.gio2.input_stream.InputStream inputStream, long streamLength) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      WebKitURISchemeResponse* _cretval;
      _cretval = webkit_uri_scheme_response_new(inputStream ? cast(GInputStream*)inputStream._cPtr(No.Dup) : null, streamLength);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Sets the content type for the response
  
      Params:
        contentType = the content type of the stream
  */
  void setContentType(string contentType) nothrow
  {
    const(char)* _contentType = contentType.toCString!(No.Malloc, No.Nullable);
    webkit_uri_scheme_response_set_content_type(cast(WebKitURISchemeResponse*)this._cPtr, _contentType);
  }

  /**
      Assign the provided #SoupMessageHeaders to the response.
      
      headers need to be of the type [gid.soup3.types.MessageHeadersType.Response].
      Any existing headers will be overwritten.
  
      Params:
        headers = the HTTP headers to be set
  */
  void setHttpHeaders(gid.soup3.message_headers.MessageHeaders headers) nothrow
  {
    webkit_uri_scheme_response_set_http_headers(cast(WebKitURISchemeResponse*)this._cPtr, headers ? cast(SoupMessageHeaders*)headers._cPtr(Yes.Dup) : null);
  }

  /**
      Sets the status code and reason phrase for the response.
      
      If status_code is a known value and reason_phrase is null, the reason_phrase will be set automatically.
  
      Params:
        statusCode = the HTTP status code to be returned
        reasonPhrase = a reason phrase
  */
  void setStatus(uint statusCode, string reasonPhrase = null) nothrow
  {
    const(char)* _reasonPhrase = reasonPhrase.toCString!(No.Malloc, Yes.Nullable);
    webkit_uri_scheme_response_set_status(cast(WebKitURISchemeResponse*)this._cPtr, statusCode, _reasonPhrase);
  }
}

/// Fluent builder implementation template for [gid.webkit6.urischeme_response.URISchemeResponse]
class URISchemeResponseGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `stream` property.
      Params:
        propval = The input stream to read from.
      Returns: Builder instance for fluent chaining
  */
  T stream(gid.gio2.input_stream.InputStream propval) nothrow
  {
    return setProperty("stream", propval);
  }

  /**
      Set `streamLength` property.
      Params:
        propval = The input stream length in bytes, `-1` for unknown length.
      Returns: Builder instance for fluent chaining
  */
  T streamLength(long propval) nothrow
  {
    return setProperty("stream-length", propval);
  }
}

/// Fluent builder for [gid.webkit6.urischeme_response.URISchemeResponse]
final class URISchemeResponseGidBuilder : URISchemeResponseGidBuilderImpl!URISchemeResponseGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  URISchemeResponse build() nothrow
  {
    return new URISchemeResponse(cast(void*)createGObject(URISchemeResponse._getGType), Yes.Take);
  }
}
