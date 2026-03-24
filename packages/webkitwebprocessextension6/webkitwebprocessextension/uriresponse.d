/// Module for [URIResponse] class
module webkitwebprocessextension.uriresponse;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import soup.message_headers;
import webkitwebprocessextension.c.functions;
import webkitwebprocessextension.c.types;
import webkitwebprocessextension.types;

/**
    Represents an URI response.
    
    A #WebKitURIResponse contains information such as the URI, the
    status code, the content length, the mime type, the HTTP status or
    the suggested filename.
*/
class URIResponse : gobject.object.ObjectWrap
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
    return cast(void function())webkit_uri_response_get_type != &gidSymbolNotFound ? webkit_uri_response_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override URIResponse self()
  {
    return this;
  }

  /**
  Get builder for [webkitwebprocessextension.uriresponse.URIResponse]
  Returns: New builder object
  */
  static URIResponseGidBuilder builder()
  {
    return new URIResponseGidBuilder;
  }

  /**
      Get `contentLength` property.
      Returns: The expected content length of the response.
  */
  @property ulong contentLength()
  {
    return getContentLength();
  }

  /**
      Get `httpHeaders` property.
      Returns: The HTTP headers of the response, or null if the response is not an HTTP response.
  */
  @property soup.message_headers.MessageHeaders httpHeaders()
  {
    return getHttpHeaders();
  }

  /**
      Get `mimeType` property.
      Returns: The MIME type of the response.
  */
  @property string mimeType()
  {
    return getMimeType();
  }

  /**
      Get `statusCode` property.
      Returns: The status code of the response as returned by the server.
  */
  @property uint statusCode()
  {
    return getStatusCode();
  }

  /**
      Get `suggestedFilename` property.
      Returns: The suggested filename for the URI response.
  */
  @property string suggestedFilename()
  {
    return getSuggestedFilename();
  }

  /**
      Get `uri` property.
      Returns: The URI for which the response was made.
  */
  @property string uri()
  {
    return getUri();
  }

  /**
      Get the expected content length of the #WebKitURIResponse.
      
      It can be 0 if the server provided an incorrect or missing Content-Length.
      Returns: the expected content length of response.
  */
  ulong getContentLength()
  {
    ulong _retval;
    _retval = webkit_uri_response_get_content_length(cast(WebKitURIResponse*)this._cPtr);
    return _retval;
  }

  /**
      Get the HTTP headers of a #WebKitURIResponse as a #SoupMessageHeaders.
      Returns: a #SoupMessageHeaders with the HTTP headers of response
           or null if response is not an HTTP response.
  */
  soup.message_headers.MessageHeaders getHttpHeaders()
  {
    SoupMessageHeaders* _cretval;
    _cretval = webkit_uri_response_get_http_headers(cast(WebKitURIResponse*)this._cPtr);
    auto _retval = _cretval ? new soup.message_headers.MessageHeaders(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the MIME type of the response.
      Returns: MIME type, as a string.
  */
  string getMimeType()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_response_get_mime_type(cast(WebKitURIResponse*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the status code of the #WebKitURIResponse.
      
      Get the status code of the #WebKitURIResponse as returned by
      the server. It will normally be a #SoupKnownStatusCode, for
      example [soup.types.Status.Ok], though the server can respond with any
      unsigned integer.
      Returns: the status code of response
  */
  uint getStatusCode()
  {
    uint _retval;
    _retval = webkit_uri_response_get_status_code(cast(WebKitURIResponse*)this._cPtr);
    return _retval;
  }

  /**
      Get the suggested filename for response.
      
      Get the suggested filename for response, as specified by
      the 'Content-Disposition' HTTP header, or null if it's not
      present.
      Returns: the suggested filename or null if
           the 'Content-Disposition' HTTP header is not present.
  */
  string getSuggestedFilename()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_response_get_suggested_filename(cast(WebKitURIResponse*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the URI which resulted in the response.
      Returns: response URI, as a string.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = webkit_uri_response_get_uri(cast(WebKitURIResponse*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }
}

class URIResponseGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [webkitwebprocessextension.uriresponse.URIResponse]
final class URIResponseGidBuilder : URIResponseGidBuilderImpl!URIResponseGidBuilder
{
  URIResponse build()
  {
    return new URIResponse(cast(void*)createGObject(URIResponse._getGType), No.Take);
  }
}
