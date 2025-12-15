/// Module for [MessageHeaders] class
module soup.message_headers;

import gid.gid;
import gobject.boxed;
import soup.c.functions;
import soup.c.types;
import soup.types;

/**
    The HTTP message headers associated with a request or response.
*/
class MessageHeaders : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())soup_message_headers_get_type != &gidSymbolNotFound ? soup_message_headers_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MessageHeaders self()
  {
    return this;
  }

  /**
      Creates a #SoupMessageHeaders.
      
      (`classMessage` does this automatically for its own headers. You would only
      need to use this method if you are manually parsing or generating message
      headers.)
  
      Params:
        type = the type of headers
      Returns: a new #SoupMessageHeaders
  */
  this(soup.types.MessageHeadersType type)
  {
    SoupMessageHeaders* _cretval;
    _cretval = soup_message_headers_new(type);
    this(_cretval, Yes.Take);
  }

  /**
      Appends a new header with name name and value value to hdrs.
      
      (If there is an existing header with name name, then this creates a second
      one, which is only allowed for list-valued headers; see also
      [soup.message_headers.MessageHeaders.replace].)
      
      The caller is expected to make sure that name and value are
      syntactically correct.
  
      Params:
        name = the header name to add
        value = the new value of name
  */
  void append(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    soup_message_headers_append(cast(SoupMessageHeaders*)this._cPtr, _name, _value);
  }

  /**
      Removes all the headers listed in the Connection header.
  */
  void cleanConnectionHeaders()
  {
    soup_message_headers_clean_connection_headers(cast(SoupMessageHeaders*)this._cPtr);
  }

  /**
      Clears hdrs.
  */
  void clear()
  {
    soup_message_headers_clear(cast(SoupMessageHeaders*)this._cPtr);
  }

  /**
      Calls func once for each header value in hdrs.
      
      Beware that unlike [soup.message_headers.MessageHeaders.getList], this processes the
      headers in exactly the way they were added, rather than
      concatenating multiple same-named headers into a single value.
      (This is intentional; it ensures that if you call
      [soup.message_headers.MessageHeaders.append] multiple times with the same name,
      then the I/O code will output multiple copies of the header when
      sending the message to the remote implementation, which may be
      required for interoperability in some cases.)
      
      You may not modify the headers from func.
  
      Params:
        func = callback function to run for each header
  */
  void foreach_(soup.types.MessageHeadersForeachFunc func)
  {
    extern(C) void _funcCallback(const(char)* name, const(char)* value, void* userData)
    {
      auto _dlg = cast(soup.types.MessageHeadersForeachFunc*)userData;
      string _name = name.fromCString(No.Free);
      string _value = value.fromCString(No.Free);

      (*_dlg)(_name, _value);
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? cast(void*)&(func) : null;
    soup_message_headers_foreach(cast(SoupMessageHeaders*)this._cPtr, _funcCB, _func);
  }

  /**
      Frees the array of ranges returned from [soup.message_headers.MessageHeaders.getRanges].
  
      Params:
        ranges = an array of #SoupRange
  */
  void freeRanges(soup.types.Range ranges)
  {
    soup_message_headers_free_ranges(cast(SoupMessageHeaders*)this._cPtr, &ranges);
  }

  /**
      Looks up the "Content-Disposition" header in hdrs, parses it, and
      returns its value in *disposition and *params.
      
      params can be null if you are only interested in the disposition-type.
      
      In HTTP, the most common use of this header is to set a
      disposition-type of "attachment", to suggest to the browser that a
      response should be saved to disk rather than displayed in the
      browser. If params contains a "filename" parameter, this is a
      suggestion of a filename to use. (If the parameter value in the
      header contains an absolute or relative path, libsoup will truncate
      it down to just the final path component, so you do not need to
      test this yourself.)
      
      Content-Disposition is also used in "multipart/form-data", however
      this is handled automatically by `structMultipart` and the associated
      form methods.
  
      Params:
        disposition = return location for the
            disposition-type, or null
        params = return
            location for the Content-Disposition parameters, or null
      Returns: true if hdrs contains a "Content-Disposition"
          header, false if not (in which case *disposition and *params
          will be unchanged).
  */
  bool getContentDisposition(out string disposition, out string[string] params)
  {
    bool _retval;
    char* _disposition;
    GHashTable* _params;
    _retval = cast(bool)soup_message_headers_get_content_disposition(cast(SoupMessageHeaders*)this._cPtr, &_disposition, &_params);
    disposition = _disposition.fromCString(Yes.Free);
    params = gHashTableToD!(string, string, GidOwnership.Full)(_params);
    return _retval;
  }

  /**
      Gets the message body length that hdrs declare.
      
      This will only be non-0 if [soup.message_headers.MessageHeaders.getEncoding] returns
      [soup.types.Encoding.ContentLength].
      Returns: the message body length declared by hdrs.
  */
  long getContentLength()
  {
    long _retval;
    _retval = soup_message_headers_get_content_length(cast(SoupMessageHeaders*)this._cPtr);
    return _retval;
  }

  /**
      Parses hdrs's Content-Range header and returns it in start,
      end, and total_length. If the total length field in the header
      was specified as "*", then total_length will be set to -1.
  
      Params:
        start = return value for the start of the range
        end = return value for the end of the range
        totalLength = return value for the total length of the
            resource, or null if you don't care.
      Returns: true if hdrs contained a "Content-Range" header
          containing a byte range which could be parsed, false otherwise.
  */
  bool getContentRange(out long start, out long end, out long totalLength)
  {
    bool _retval;
    _retval = cast(bool)soup_message_headers_get_content_range(cast(SoupMessageHeaders*)this._cPtr, cast(long*)&start, cast(long*)&end, cast(long*)&totalLength);
    return _retval;
  }

  /**
      Looks up the "Content-Type" header in hdrs, parses it, and returns
      its value in *content_type and *params.
      
      params can be null if you are only interested in the content type itself.
  
      Params:
        params = return location for the Content-Type parameters (eg, "charset"), or
            null
      Returns: a string with the value of the
          "Content-Type" header or null if hdrs does not contain that
          header or it cannot be parsed (in which case *params will be
          unchanged).
  */
  string getContentType(out string[string] params)
  {
    const(char)* _cretval;
    GHashTable* _params;
    _cretval = soup_message_headers_get_content_type(cast(SoupMessageHeaders*)this._cPtr, &_params);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    params = gHashTableToD!(string, string, GidOwnership.Full)(_params);
    return _retval;
  }

  /**
      Gets the message body encoding that hdrs declare.
      
      This may not always correspond to the encoding used on the wire; eg, a HEAD
      response may declare a Content-Length or Transfer-Encoding, but it will never
      actually include a body.
      Returns: the encoding declared by hdrs.
  */
  soup.types.Encoding getEncoding()
  {
    SoupEncoding _cretval;
    _cretval = soup_message_headers_get_encoding(cast(SoupMessageHeaders*)this._cPtr);
    soup.types.Encoding _retval = cast(soup.types.Encoding)_cretval;
    return _retval;
  }

  /**
      Gets the expectations declared by hdrs's "Expect" header.
      
      Currently this will either be [soup.types.Expectation.Continue] or
      [soup.types.Expectation.Unrecognized].
      Returns: the contents of hdrs's "Expect" header
  */
  soup.types.Expectation getExpectations()
  {
    SoupExpectation _cretval;
    _cretval = soup_message_headers_get_expectations(cast(SoupMessageHeaders*)this._cPtr);
    soup.types.Expectation _retval = cast(soup.types.Expectation)_cretval;
    return _retval;
  }

  /**
      Gets the type of headers.
      Returns: the header's type.
  */
  soup.types.MessageHeadersType getHeadersType()
  {
    SoupMessageHeadersType _cretval;
    _cretval = soup_message_headers_get_headers_type(cast(SoupMessageHeaders*)this._cPtr);
    soup.types.MessageHeadersType _retval = cast(soup.types.MessageHeadersType)_cretval;
    return _retval;
  }

  /**
      Gets the value of header name in hdrs.
      
      Use this for headers whose values are comma-delimited lists, and which are
      therefore allowed to appear multiple times in the headers. For
      non-list-valued headers, use [soup.message_headers.MessageHeaders.getOne].
      
      If name appears multiple times in hdrs,
      [soup.message_headers.MessageHeaders.getList] will concatenate all of the values
      together, separated by commas. This is sometimes awkward to parse
      (eg, WWW-Authenticate, Set-Cookie), but you have to be able to deal
      with it anyway, because the HTTP spec explicitly states that this
      transformation is allowed, and so an upstream proxy could do the
      same thing.
  
      Params:
        name = header name
      Returns: the header's value or null if not found.
  */
  string getList(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = soup_message_headers_get_list(cast(SoupMessageHeaders*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the value of header name in hdrs.
      
      Use this for headers whose values are *not* comma-delimited lists, and which
      therefore can only appear at most once in the headers. For list-valued
      headers, use [soup.message_headers.MessageHeaders.getList].
      
      If hdrs does erroneously contain multiple copies of the header, it
      is not defined which one will be returned. (Ideally, it will return
      whichever one makes libsoup most compatible with other HTTP
      implementations.)
  
      Params:
        name = header name
      Returns: the header's value or null if not found.
  */
  string getOne(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = soup_message_headers_get_one(cast(SoupMessageHeaders*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Parses hdrs's Range header and returns an array of the requested
      byte ranges.
      
      The returned array must be freed with [soup.message_headers.MessageHeaders.freeRanges].
      
      If total_length is non-0, its value will be used to adjust the
      returned ranges to have explicit start and end values, and the
      returned ranges will be sorted and non-overlapping. If
      total_length is 0, then some ranges may have an end value of -1,
      as described under `structRange`, and some of the ranges may be
      redundant.
      
      Beware that even if given a total_length, this function does not
      check that the ranges are satisfiable.
      
      #SoupServer has built-in handling for range requests. If your
      server handler returns a [soup.types.Status.Ok] response containing the
      complete response body (rather than pausing the message and
      returning some of the response body later), and there is a Range
      header in the request, then libsoup will automatically convert the
      response to a [soup.types.Status.PartialContent] response containing only
      the range(s) requested by the client.
      
      The only time you need to process the Range header yourself is if
      either you need to stream the response body rather than returning
      it all at once, or you do not already have the complete response
      body available, and only want to generate the parts that were
      actually requested by the client.
  
      Params:
        totalLength = the total_length of the response body
        ranges = return location for an array
            of #SoupRange
      Returns: true if hdrs contained a syntactically-valid
          "Range" header, false otherwise (in which case range and length
          will not be set).
  */
  bool getRanges(long totalLength, out soup.types.Range[] ranges)
  {
    bool _retval;
    int _length;
    SoupRange* _ranges;
    _retval = cast(bool)soup_message_headers_get_ranges(cast(SoupMessageHeaders*)this._cPtr, totalLength, &_ranges, &_length);
    ranges.length = _length;
    ranges[0 .. $] = (cast(soup.types.Range*)_ranges)[0 .. _length];
    gFree(cast(void*)_ranges);
    return _retval;
  }

  /**
      Checks whether the list-valued header name is present in hdrs,
      and contains a case-insensitive match for token.
      
      (If name is present in hdrs, then this is equivalent to calling
      `funcheader_contains` on its value.)
  
      Params:
        name = header name
        token = token to look for
      Returns: true if the header is present and contains token,
          false otherwise.
  */
  bool headerContains(string name, string token)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _token = token.toCString(No.Alloc);
    _retval = cast(bool)soup_message_headers_header_contains(cast(SoupMessageHeaders*)this._cPtr, _name, _token);
    return _retval;
  }

  /**
      Checks whether the header name is present in hdrs and is
      (case-insensitively) equal to value.
  
      Params:
        name = header name
        value = expected value
      Returns: true if the header is present and its value is
          value, false otherwise.
  */
  bool headerEquals(string name, string value)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _retval = cast(bool)soup_message_headers_header_equals(cast(SoupMessageHeaders*)this._cPtr, _name, _value);
    return _retval;
  }

  /**
      Removes name from hdrs.
      
      If there are multiple values for name, they are all removed.
  
      Params:
        name = the header name to remove
  */
  void remove(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    soup_message_headers_remove(cast(SoupMessageHeaders*)this._cPtr, _name);
  }

  /**
      Replaces the value of the header name in hdrs with value.
      
      See also [soup.message_headers.MessageHeaders.append].
      
      The caller is expected to make sure that name and value are
      syntactically correct.
  
      Params:
        name = the header name to replace
        value = the new value of name
  */
  void replace(string name, string value)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    soup_message_headers_replace(cast(SoupMessageHeaders*)this._cPtr, _name, _value);
  }

  /**
      Sets the "Content-Disposition" header in hdrs to disposition,
      optionally with additional parameters specified in params.
      
      See [soup.message_headers.MessageHeaders.getContentDisposition] for a discussion
      of how Content-Disposition is used in HTTP.
  
      Params:
        disposition = the disposition-type
        params = additional parameters
  */
  void setContentDisposition(string disposition, string[string] params = null)
  {
    const(char)* _disposition = disposition.toCString(No.Alloc);
    auto _params = gHashTableFromD!(string, string)(params);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_params);
    soup_message_headers_set_content_disposition(cast(SoupMessageHeaders*)this._cPtr, _disposition, _params);
  }

  /**
      Sets the message body length that hdrs will declare, and sets
      hdrs's encoding to [soup.types.Encoding.ContentLength].
      
      You do not normally need to call this; if hdrs is set to use
      Content-Length encoding, libsoup will automatically set its
      Content-Length header for you immediately before sending the
      headers. One situation in which this method is useful is when
      generating the response to a HEAD request; Calling
      [soup.message_headers.MessageHeaders.setContentLength] allows you to put the
      correct content length into the response without needing to waste
      memory by filling in a response body which won't actually be sent.
  
      Params:
        contentLength = the message body length
  */
  void setContentLength(long contentLength)
  {
    soup_message_headers_set_content_length(cast(SoupMessageHeaders*)this._cPtr, contentLength);
  }

  /**
      Sets hdrs's Content-Range header according to the given values.
      
      (Note that total_length is the total length of the entire resource
      that this is a range of, not simply end - start + 1.)
      
      `classServer` has built-in handling for range requests, and you do
      not normally need to call this function youself. See
      [soup.message_headers.MessageHeaders.getRanges] for more details.
  
      Params:
        start = the start of the range
        end = the end of the range
        totalLength = the total length of the resource, or -1 if unknown
  */
  void setContentRange(long start, long end, long totalLength)
  {
    soup_message_headers_set_content_range(cast(SoupMessageHeaders*)this._cPtr, start, end, totalLength);
  }

  /**
      Sets the "Content-Type" header in hdrs to content_type.
      
      Accepts additional parameters specified in params.
  
      Params:
        contentType = the MIME type
        params = additional parameters
  */
  void setContentType(string contentType, string[string] params = null)
  {
    const(char)* _contentType = contentType.toCString(No.Alloc);
    auto _params = gHashTableFromD!(string, string)(params);
    scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_params);
    soup_message_headers_set_content_type(cast(SoupMessageHeaders*)this._cPtr, _contentType, _params);
  }

  /**
      Sets the message body encoding that hdrs will declare.
      
      In particular, you should use this if you are going to send a request or
      response in chunked encoding.
  
      Params:
        encoding = a #SoupEncoding
  */
  void setEncoding(soup.types.Encoding encoding)
  {
    soup_message_headers_set_encoding(cast(SoupMessageHeaders*)this._cPtr, encoding);
  }

  /**
      Sets hdrs's "Expect" header according to expectations.
      
      Currently [soup.types.Expectation.Continue] is the only known expectation
      value. You should set this value on a request if you are sending a
      large message body (eg, via POST or PUT), and want to give the
      server a chance to reject the request after seeing just the headers
      (eg, because it will require authentication before allowing you to
      post, or because you're POSTing to a URL that doesn't exist). This
      saves you from having to transmit the large request body when the
      server is just going to ignore it anyway.
  
      Params:
        expectations = the expectations to set
  */
  void setExpectations(soup.types.Expectation expectations)
  {
    soup_message_headers_set_expectations(cast(SoupMessageHeaders*)this._cPtr, expectations);
  }

  /**
      Sets hdrs's Range header to request the indicated range.
      
      start and end are interpreted as in a `structRange`.
      
      If you need to request multiple ranges, use
      [soup.message_headers.MessageHeaders.setRanges].
  
      Params:
        start = the start of the range to request
        end = the end of the range to request
  */
  void setRange(long start, long end)
  {
    soup_message_headers_set_range(cast(SoupMessageHeaders*)this._cPtr, start, end);
  }

  /**
      Sets hdrs's Range header to request the indicated ranges.
      
      If you only want to request a single range, you can use
      [soup.message_headers.MessageHeaders.setRange].
  
      Params:
        ranges = an array of #SoupRange
        length = the length of range
  */
  void setRanges(soup.types.Range ranges, int length)
  {
    soup_message_headers_set_ranges(cast(SoupMessageHeaders*)this._cPtr, &ranges, length);
  }
}
