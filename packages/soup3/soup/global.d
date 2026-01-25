/// Global functions for soup3 library
module soup.global;

import gid.gid;
import glib.bytes;
import glib.date_time;
import glib.error;
import glib.string_;
import glib.uri;
import gobject.type_class;
import soup.c.functions;
import soup.c.types;
import soup.cookie;
import soup.message;
import soup.message_headers;
import soup.multipart;
import soup.server_message;
import soup.types;
import soup.websocket_extension;


/**
    Like `funcCHECK_VERSION`, but the check for soup_check_version is
    at runtime instead of compile time.
    
    This is useful for compiling against older versions of libsoup, but using
    features from newer versions.

    Params:
      major = the major version to check
      minor = the minor version to check
      micro = the micro version to check
    Returns: true if the version of the libsoup currently loaded
        is the same as or newer than the passed-in version.
*/
bool checkVersion(uint major, uint minor, uint micro)
{
  bool _retval;
  _retval = cast(bool)soup_check_version(major, minor, micro);
  return _retval;
}

/**
    Parses msg's Cookie request header and returns a [glib.slist.SList] of
    [soup.cookie.Cookie]s.
    
    As the "Cookie" header, unlike "Set-Cookie", only contains cookie names and
    values, none of the other #SoupCookie fields will be filled in. (Thus, you
    can't generally pass a cookie returned from this method directly to
    `funccookies_to_response`.)

    Params:
      msg = a #SoupMessage containing a "Cookie" request header
    Returns: a #GSList of
        [soup.cookie.Cookie]s, which can be freed with [soup.cookie.Cookie.free].
*/
soup.cookie.Cookie[] cookiesFromRequest(soup.message.Message msg)
{
  GSList* _cretval;
  _cretval = soup_cookies_from_request(msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
  auto _retval = gSListToD!(soup.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
  return _retval;
}

/**
    Parses msg's Set-Cookie response headers and returns a [glib.slist.SList]
    of [soup.cookie.Cookie]s.
    
    Cookies that do not specify "path" or "domain" attributes will have their
    values defaulted from msg.

    Params:
      msg = a #SoupMessage containing a "Set-Cookie" response header
    Returns: a #GSList of
        [soup.cookie.Cookie]s, which can be freed with [soup.cookie.Cookie.free].
*/
soup.cookie.Cookie[] cookiesFromResponse(soup.message.Message msg)
{
  GSList* _cretval;
  _cretval = soup_cookies_from_response(msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
  auto _retval = gSListToD!(soup.cookie.Cookie, GidOwnership.Full)(cast(GSList*)_cretval);
  return _retval;
}

/**
    Serializes a [glib.slist.SList] of #SoupCookie into a string suitable for
    setting as the value of the "Cookie" header.

    Params:
      cookies = a #GSList of #SoupCookie
    Returns: the serialization of cookies
*/
string cookiesToCookieHeader(soup.cookie.Cookie[] cookies)
{
  char* _cretval;
  auto _cookies = gSListFromD!(soup.cookie.Cookie)(cookies);
  scope(exit) containerFree!(GSList*, soup.cookie.Cookie, GidOwnership.None)(_cookies);
  _cretval = soup_cookies_to_cookie_header(_cookies);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Adds the name and value of each cookie in cookies to msg's
    "Cookie" request.
    
    If msg already has a "Cookie" request header, these cookies will be appended
    to the cookies already present. Be careful that you do not append the same
    cookies twice, eg, when requeuing a message.

    Params:
      cookies = a #GSList of #SoupCookie
      msg = a #SoupMessage
*/
void cookiesToRequest(soup.cookie.Cookie[] cookies, soup.message.Message msg)
{
  auto _cookies = gSListFromD!(soup.cookie.Cookie)(cookies);
  scope(exit) containerFree!(GSList*, soup.cookie.Cookie, GidOwnership.None)(_cookies);
  soup_cookies_to_request(_cookies, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
}

/**
    Appends a "Set-Cookie" response header to msg for each cookie in
    cookies.
    
    This is in addition to any other "Set-Cookie" headers
    msg may already have.

    Params:
      cookies = a #GSList of #SoupCookie
      msg = a #SoupMessage
*/
void cookiesToResponse(soup.cookie.Cookie[] cookies, soup.message.Message msg)
{
  auto _cookies = gSListFromD!(soup.cookie.Cookie)(cookies);
  scope(exit) containerFree!(GSList*, soup.cookie.Cookie, GidOwnership.None)(_cookies);
  soup_cookies_to_response(_cookies, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
}

/**
    Parses date_string and tries to extract a date from it.
    
    This recognizes all of the "HTTP-date" formats from RFC 2616, RFC 2822 dates,
    and reasonable approximations thereof. (Eg, it is lenient about whitespace,
    leading "0"s, etc.)

    Params:
      dateString = The date as a string
    Returns: a new #GDateTime, or null if date_string
        could not be parsed.
*/
glib.date_time.DateTime dateTimeNewFromHttpString(string dateString)
{
  GDateTime* _cretval;
  const(char)* _dateString = dateString.toCString(No.Alloc);
  _cretval = soup_date_time_new_from_http_string(_dateString);
  auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Converts date to a string in the format described by format.

    Params:
      date = a #GDateTime
      format = the format to generate the date in
    Returns: date as a string or null
*/
string dateTimeToString(glib.date_time.DateTime date, soup.types.DateFormat format)
{
  char* _cretval;
  _cretval = soup_date_time_to_string(date ? cast(GDateTime*)date._cPtr(No.Dup) : null, format);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Decodes form.
    
    which is an urlencoded dataset as defined in the HTML 4.01 spec.

    Params:
      encodedForm = data of type "application/x-www-form-urlencoded"
    Returns: a hash
        table containing the name/value pairs from encoded_form, which you
        can free with [glib.hash_table.HashTable.destroy].
*/
string[string] formDecode(string encodedForm)
{
  GHashTable* _cretval;
  const(char)* _encodedForm = encodedForm.toCString(No.Alloc);
  _cretval = soup_form_decode(_encodedForm);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Container)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
    Decodes the "multipart/form-data" request in multipart.
    
    this is a convenience method for the case when you have a single file upload
    control in a form. (Or when you don't have any file upload controls, but are
    still using "multipart/form-data" anyway.) Pass the name of the file upload
    control in file_control_name, and `funcform_decode_multipart` will extract
    the uploaded file data into filename, content_type, and file. All of the
    other form control data will be returned (as strings, as with
    `funcform_decode` in the returned [glib.hash_table.HashTable].
    
    You may pass null for filename, content_type and/or file if you do not
    care about those fields. `funcform_decode_multipart` may also
    return null in those fields if the client did not provide that
    information. You must free the returned filename and content-type
    with `funcGLib.free`, and the returned file data with `methodGlib.Bytes.unref`.
    
    If you have a form with more than one file upload control, you will
    need to decode it manually, using [soup.multipart.Multipart.newFromMessage]
    and [soup.multipart.Multipart.getPart].

    Params:
      multipart = a #SoupMultipart
      fileControlName = the name of the HTML file upload control
      filename = return location for the name of the uploaded file
      contentType = return location for the MIME type of the uploaded file
      file = return location for the uploaded file data
    Returns: a hash table containing the name/value pairs (other than
        file_control_name) from msg, which you can free with
        [glib.hash_table.HashTable.destroy]. On error, it will return null.
*/
string[string] formDecodeMultipart(soup.multipart.Multipart multipart, string fileControlName, out string filename, out string contentType, out glib.bytes.Bytes file)
{
  GHashTable* _cretval;
  const(char)* _fileControlName = fileControlName.toCString(No.Alloc);
  char* _filename;
  char* _contentType;
  GBytes* _file;
  _cretval = soup_form_decode_multipart(multipart ? cast(SoupMultipart*)multipart._cPtr(No.Dup) : null, _fileControlName, &_filename, &_contentType, &_file);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Container)(cast(GHashTable*)_cretval);
  filename = _filename.fromCString(Yes.Free);
  contentType = _contentType.fromCString(Yes.Free);
  file = new glib.bytes.Bytes(cast(void*)_file, Yes.Take);
  return _retval;
}

/**
    Encodes form_data_set into a value of type
    "application/x-www-form-urlencoded".
    
    Encodes as defined in the HTML 4.01 spec.
    
    Note that the HTML spec states that "The control names/values are
    listed in the order they appear in the document." Since this method
    takes a hash table, it cannot enforce that; if you care about the
    ordering of the form fields, use `funcform_encode_datalist`.
    
    See also: [soup.message.Message.newFromEncodedForm].

    Params:
      formDataSet = a hash table containing
          name/value pairs (as strings)
    Returns: the encoded form
*/
string formEncodeHash(string[string] formDataSet)
{
  char* _cretval;
  auto _formDataSet = gHashTableFromD!(string, string)(formDataSet);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_formDataSet);
  _cretval = soup_form_encode_hash(_formDataSet);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns the major version number of the libsoup library.
    
    e.g. in libsoup version 2.42.0 this is 2.
    
    This function is in the library, so it represents the libsoup library
    your code is running against. Contrast with the #SOUP_MAJOR_VERSION
    macro, which represents the major version of the libsoup headers you
    have included when compiling your code.
    Returns: the major version number of the libsoup library
*/
uint getMajorVersion()
{
  uint _retval;
  _retval = soup_get_major_version();
  return _retval;
}

/**
    Returns the micro version number of the libsoup library.
    
    e.g. in libsoup version 2.42.0 this is 0.
    
    This function is in the library, so it represents the libsoup library
    your code is running against. Contrast with the #SOUP_MICRO_VERSION
    macro, which represents the micro version of the libsoup headers you
    have included when compiling your code.
    Returns: the micro version number of the libsoup library
*/
uint getMicroVersion()
{
  uint _retval;
  _retval = soup_get_micro_version();
  return _retval;
}

/**
    Returns the minor version number of the libsoup library.
    
    e.g. in libsoup version 2.42.0 this is 42.
    
    This function is in the library, so it represents the libsoup library
    your code is running against. Contrast with the #SOUP_MINOR_VERSION
    macro, which represents the minor version of the libsoup headers you
    have included when compiling your code.
    Returns: the minor version number of the libsoup library
*/
uint getMinorVersion()
{
  uint _retval;
  _retval = soup_get_minor_version();
  return _retval;
}

/**
    Parses header to see if it contains the token token (matched
    case-insensitively).
    
    Note that this can't be used with lists that have qvalues.

    Params:
      header = An HTTP header suitable for parsing with
          `funcheader_parse_list`
      token = a token
    Returns: whether or not header contains token
*/
bool headerContains(string header, string token)
{
  bool _retval;
  const(char)* _header = header.toCString(No.Alloc);
  const(char)* _token = token.toCString(No.Alloc);
  _retval = cast(bool)soup_header_contains(_header, _token);
  return _retval;
}

/**
    Frees param_list.

    Params:
      paramList = a #GHashTable returned from
          `funcheader_parse_param_list` or `funcheader_parse_semi_param_list`
*/
void headerFreeParamList(string[string] paramList)
{
  auto _paramList = gHashTableFromD!(string, string)(paramList);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_paramList);
  soup_header_free_param_list(_paramList);
}

/**
    Appends something like `name=value` to string, taking care to quote value
    if needed, and if so, to escape any quotes or backslashes in value.
    
    Alternatively, if value is a non-ASCII UTF-8 string, it will be
    appended using RFC5987 syntax. Although in theory this is supposed
    to work anywhere in HTTP that uses this style of parameter, in
    reality, it can only be used portably with the Content-Disposition
    "filename" parameter.
    
    If value is null, this will just append name to string.

    Params:
      string_ = a #GString being used to construct an HTTP header value
      name = a parameter name
      value = a parameter value, or null
*/
void headerGStringAppendParam(glib.string_.String string_, string name, string value = null)
{
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  soup_header_g_string_append_param(string_ ? cast(GString*)string_._cPtr(No.Dup) : null, _name, _value);
}

/**
    Appends something like `name="value"` to
    string, taking care to escape any quotes or backslashes in value.
    
    If value is (non-ASCII) UTF-8, this will instead use RFC 5987
    encoding, just like `funcheader_g_string_append_param`.

    Params:
      string_ = a #GString being used to construct an HTTP header value
      name = a parameter name
      value = a parameter value
*/
void headerGStringAppendParamQuoted(glib.string_.String string_, string name, string value)
{
  const(char)* _name = name.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  soup_header_g_string_append_param_quoted(string_ ? cast(GString*)string_._cPtr(No.Dup) : null, _name, _value);
}

/**
    Parses a header whose content is described by RFC2616 as `#something`.
    
    "something" does not itself contain commas, except as part of quoted-strings.

    Params:
      header = a header value
    Returns: a #GSList of
        list elements, as allocated strings
*/
string[] headerParseList(string header)
{
  GSList* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_list(_header);
  auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
  return _retval;
}

/**
    Parses a header which is a comma-delimited list of something like:
    `token [ "=" ( token | quoted-string ) ]`.
    
    Tokens that don't have an associated value will still be added to
    the resulting hash table, but with a null value.
    
    This also handles RFC5987 encoding (which in HTTP is mostly used
    for giving UTF8-encoded filenames in the Content-Disposition
    header).

    Params:
      header = a header value
    Returns: a
        #GHashTable of list elements, which can be freed with
        `funcheader_free_param_list`.
*/
string[string] headerParseParamList(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_param_list(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
    A strict version of `funcheader_parse_param_list`
    that bails out if there are duplicate parameters.
    
    Note that this function will treat RFC5987-encoded
    parameters as duplicated if an ASCII version is also
    present. For header fields that might contain
    RFC5987-encoded parameters, use
    `funcheader_parse_param_list` instead.

    Params:
      header = a header value
    Returns: a #GHashTable of list elements, which can be freed with
        `funcheader_free_param_list` or null if there are duplicate
        elements.
*/
string[string] headerParseParamListStrict(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_param_list_strict(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
    Parses a header whose content is a list of items with optional
    "qvalue"s (eg, Accept, Accept-Charset, Accept-Encoding,
    Accept-Language, TE).
    
    If unacceptable is not null, then on return, it will contain the
    items with qvalue 0. Either way, those items will be removed from
    the main list.

    Params:
      header = a header value
      unacceptable = on
          return, will contain a list of unacceptable values
    Returns: a #GSList of
        acceptable values (as allocated strings), highest-qvalue first.
*/
string[] headerParseQualityList(string header, out string[] unacceptable)
{
  GSList* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  GSList* _unacceptable;
  _cretval = soup_header_parse_quality_list(_header, &_unacceptable);
  auto _retval = gSListToD!(string, GidOwnership.Full)(cast(GSList*)_cretval);
  unacceptable = gSListToD!(string, GidOwnership.Full)(_unacceptable);
  return _retval;
}

/**
    Parses a header which is a semicolon-delimited list of something
    like: `token [ "=" ( token | quoted-string ) ]`.
    
    Tokens that don't have an associated value will still be added to
    the resulting hash table, but with a null value.
    
    This also handles RFC5987 encoding (which in HTTP is mostly used
    for giving UTF8-encoded filenames in the Content-Disposition
    header).

    Params:
      header = a header value
    Returns: a
        #GHashTable of list elements, which can be freed with
        `funcheader_free_param_list`.
*/
string[string] headerParseSemiParamList(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_semi_param_list(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
    A strict version of `funcheader_parse_semi_param_list`
    that bails out if there are duplicate parameters.
    
    Note that this function will treat RFC5987-encoded
    parameters as duplicated if an ASCII version is also
    present. For header fields that might contain
    RFC5987-encoded parameters, use
    `funcheader_parse_semi_param_list` instead.

    Params:
      header = a header value
    Returns: a #GHashTable of list elements, which can be freed with
        `funcheader_free_param_list` or null if there are duplicate
        elements.
*/
string[string] headerParseSemiParamListStrict(string header)
{
  GHashTable* _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = soup_header_parse_semi_param_list_strict(_header);
  auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
  return _retval;
}

/**
    Parses the headers of an HTTP request or response in str and
    stores the results in dest.
    
    Beware that dest may be modified even on failure.
    
    This is a low-level method; normally you would use
    `funcheaders_parse_request` or `funcheaders_parse_response`.

    Params:
      str = the header string (including the Request-Line or Status-Line,
          but not the trailing blank line)
      dest = #SoupMessageHeaders to store the header values in
    Returns: success or failure
*/
bool headersParse(string str, soup.message_headers.MessageHeaders dest)
{
  bool _retval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _retval = cast(bool)soup_headers_parse(_str, _len, dest ? cast(SoupMessageHeaders*)dest._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Parses the headers of an HTTP request in str and stores the
    results in req_method, req_path, ver, and req_headers.
    
    Beware that req_headers may be modified even on failure.

    Params:
      str = the headers (up to, but not including, the trailing blank line)
      reqHeaders = #SoupMessageHeaders to store the header values in
      reqMethod = if non-null, will be filled in with the
          request method
      reqPath = if non-null, will be filled in with the
          request path
      ver = if non-null, will be filled in with the HTTP
          version
    Returns: [soup.types.Status.Ok] if the headers could be parsed, or an
        HTTP error to be returned to the client if they could not be.
*/
uint headersParseRequest(string str, soup.message_headers.MessageHeaders reqHeaders, out string reqMethod, out string reqPath, out soup.types.HTTPVersion ver)
{
  uint _retval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(char)*)str.ptr;
  char* _reqMethod;
  char* _reqPath;
  _retval = soup_headers_parse_request(_str, _len, reqHeaders ? cast(SoupMessageHeaders*)reqHeaders._cPtr(No.Dup) : null, &_reqMethod, &_reqPath, &ver);
  reqMethod = _reqMethod.fromCString(Yes.Free);
  reqPath = _reqPath.fromCString(Yes.Free);
  return _retval;
}

/**
    Parses the headers of an HTTP response in str and stores the
    results in ver, status_code, reason_phrase, and headers.
    
    Beware that headers may be modified even on failure.

    Params:
      str = the headers (up to, but not including, the trailing blank line)
      headers = #SoupMessageHeaders to store the header values in
      ver = if non-null, will be filled in with the HTTP
          version
      statusCode = if non-null, will be filled in with
          the status code
      reasonPhrase = if non-null, will be filled in with
          the reason phrase
    Returns: success or failure.
*/
bool headersParseResponse(string str, soup.message_headers.MessageHeaders headers, out soup.types.HTTPVersion ver, out uint statusCode, out string reasonPhrase)
{
  bool _retval;
  int _len;
  if (str)
    _len = cast(int)str.length;

  auto _str = cast(const(char)*)str.ptr;
  char* _reasonPhrase;
  _retval = cast(bool)soup_headers_parse_response(_str, _len, headers ? cast(SoupMessageHeaders*)headers._cPtr(No.Dup) : null, &ver, cast(uint*)&statusCode, &_reasonPhrase);
  reasonPhrase = _reasonPhrase.fromCString(Yes.Free);
  return _retval;
}

/**
    Parses the HTTP Status-Line string in status_line into ver,
    status_code, and reason_phrase.
    
    status_line must be terminated by either "\0" or "\r\n".

    Params:
      statusLine = an HTTP Status-Line
      ver = if non-null, will be filled in with the HTTP
          version
      statusCode = if non-null, will be filled in with
          the status code
      reasonPhrase = if non-null, will be filled in with
          the reason phrase
    Returns: true if status_line was parsed successfully.
*/
bool headersParseStatusLine(string statusLine, out soup.types.HTTPVersion ver, out uint statusCode, out string reasonPhrase)
{
  bool _retval;
  const(char)* _statusLine = statusLine.toCString(No.Alloc);
  char* _reasonPhrase;
  _retval = cast(bool)soup_headers_parse_status_line(_statusLine, &ver, cast(uint*)&statusCode, &_reasonPhrase);
  reasonPhrase = _reasonPhrase.fromCString(Yes.Free);
  return _retval;
}

/**
    Looks whether the domain passed as argument is a public domain
    suffix (.org, .com, .co.uk, etc) or not.
    
    Prior to libsoup 2.46, this function required that domain be in
    UTF-8 if it was an IDN. From 2.46 on, the name can be in either
    UTF-8 or ASCII format.

    Params:
      domain = a domain name
    Returns: true if it is a public domain, false otherwise.
*/
bool tldDomainIsPublicSuffix(string domain)
{
  bool _retval;
  const(char)* _domain = domain.toCString(No.Alloc);
  _retval = cast(bool)soup_tld_domain_is_public_suffix(_domain);
  return _retval;
}

/**
    Finds the base domain for a given hostname
    
    The base domain is composed by the top level domain (such as .org, .com,
    .co.uk, etc) plus the second level domain, for example for
    myhost.mydomain.com it will return mydomain.com.
    
    Note that null will be returned for private URLs (those not ending
    with any well known TLD) because choosing a base domain for them
    would be totally arbitrary.
    
    Prior to libsoup 2.46, this function required that hostname be in
    UTF-8 if it was an IDN. From 2.46 on, the name can be in either
    UTF-8 or ASCII format (and the return value will be in the same
    format).

    Params:
      hostname = a hostname
    Returns: a pointer to the start of the base domain in hostname. If
        an error occurs, null will be returned and error set.
    Throws: [ErrorWrap]
*/
string tldGetBaseDomain(string hostname)
{
  const(char)* _cretval;
  const(char)* _hostname = hostname.toCString(No.Alloc);
  GError *_err;
  _cretval = soup_tld_get_base_domain(_hostname, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Decodes the given data URI and returns its contents and content_type.

    Params:
      uri = a data URI, in string form
      contentType = location to store content type
    Returns: a #GBytes with the contents of uri,
         or null if uri is not a valid data URI
*/
glib.bytes.Bytes uriDecodeDataUri(string uri, out string contentType)
{
  GBytes* _cretval;
  const(char)* _uri = uri.toCString(No.Alloc);
  char* _contentType;
  _cretval = soup_uri_decode_data_uri(_uri, &_contentType);
  auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
  contentType = _contentType.fromCString(Yes.Free);
  return _retval;
}

/**
    Tests whether or not uri1 and uri2 are equal in all parts.

    Params:
      uri1 = a #GUri
      uri2 = another #GUri
    Returns: true if equal otherwise false
*/
bool uriEqual(glib.uri.Uri uri1, glib.uri.Uri uri2)
{
  bool _retval;
  _retval = cast(bool)soup_uri_equal(uri1 ? cast(GUri*)uri1._cPtr(No.Dup) : null, uri2 ? cast(GUri*)uri2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Adds the necessary headers to msg to request a WebSocket
    handshake including supported WebSocket extensions.
    
    The message body and non-WebSocket-related headers are
    not modified.
    
    This is a low-level function; if you use
    [soup.session.Session.websocketConnectAsync] to create a WebSocket connection, it
    will call this for you.

    Params:
      msg = a #SoupMessage
      origin = the "Origin" header to set
      protocols = list of
          protocols to offer
      supportedExtensions = list
          of supported extension types
*/
void websocketClientPrepareHandshake(soup.message.Message msg, string origin = null, string[] protocols = null, gobject.type_class.TypeClass[] supportedExtensions = null)
{
  const(char)* _origin = origin.toCString(No.Alloc);
  char*[] _tmpprotocols;
  foreach (s; protocols)
    _tmpprotocols ~= s.toCString(No.Alloc);
  _tmpprotocols ~= null;
  char** _protocols = _tmpprotocols.ptr;

  auto _supportedExtensions = gPtrArrayFromD!(gobject.type_class.TypeClass, false)(supportedExtensions);
  scope(exit) containerFree!(GPtrArray*, gobject.type_class.TypeClass, GidOwnership.None)(_supportedExtensions);
  soup_websocket_client_prepare_handshake(msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _origin, _protocols, _supportedExtensions);
}

/**
    Looks at the response status code and headers in msg and
    determines if they contain a valid WebSocket handshake response
    (given the handshake request in msg's request headers).
    
    If supported_extensions is non-null, extensions included in the
    response "Sec-WebSocket-Extensions" are verified too. Accepted
    extensions are returned in accepted_extensions parameter if non-null.
    
    This is a low-level function; if you use
    [soup.session.Session.websocketConnectAsync] to create a WebSocket
    connection, it will call this for you.

    Params:
      msg = #SoupMessage containing both client and server sides of a
          WebSocket handshake
      supportedExtensions = list
          of supported extension types
      acceptedExtensions = a
          #GList of #SoupWebsocketExtension objects
    Returns: true if msg contains a completed valid WebSocket
        handshake, false and an error if not.
    Throws: [ErrorWrap]
*/
bool websocketClientVerifyHandshake(soup.message.Message msg, gobject.type_class.TypeClass[] supportedExtensions, out soup.websocket_extension.WebsocketExtension[] acceptedExtensions)
{
  bool _retval;
  auto _supportedExtensions = gPtrArrayFromD!(gobject.type_class.TypeClass, false)(supportedExtensions);
  scope(exit) containerFree!(GPtrArray*, gobject.type_class.TypeClass, GidOwnership.None)(_supportedExtensions);
  GList* _acceptedExtensions;
  GError *_err;
  _retval = cast(bool)soup_websocket_client_verify_handshake(msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null, _supportedExtensions, &_acceptedExtensions, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  acceptedExtensions = gListToD!(soup.websocket_extension.WebsocketExtension, GidOwnership.Full)(_acceptedExtensions);
  return _retval;
}

/**
    Examines the method and request headers in msg and determines
    whether msg contains a valid handshake request.
    
    If origin is non-null, then only requests containing a matching
    "Origin" header will be accepted. If protocols is non-null, then
    only requests containing a compatible "Sec-WebSocket-Protocols"
    header will be accepted. If supported_extensions is non-null, then
    only requests containing valid supported extensions in
    "Sec-WebSocket-Extensions" header will be accepted.
    
    Normally `funcwebsocket_server_process_handshake`
    will take care of this for you, and if you use
    [soup.server.Server.addWebsocketHandler] to handle accepting WebSocket
    connections, it will call that for you. However, this function may
    be useful if you need to perform more complicated validation; eg,
    accepting multiple different Origins, or handling different protocols
    depending on the path.

    Params:
      msg = #SoupServerMessage containing the client side of a WebSocket handshake
      origin = expected Origin header
      protocols = allowed WebSocket
          protocols.
      supportedExtensions = list
          of supported extension types
    Returns: true if msg contained a valid WebSocket handshake,
        false and an error if not.
    Throws: [ErrorWrap]
*/
bool websocketServerCheckHandshake(soup.server_message.ServerMessage msg, string origin = null, string[] protocols = null, gobject.type_class.TypeClass[] supportedExtensions = null)
{
  bool _retval;
  const(char)* _origin = origin.toCString(No.Alloc);
  char*[] _tmpprotocols;
  foreach (s; protocols)
    _tmpprotocols ~= s.toCString(No.Alloc);
  _tmpprotocols ~= null;
  char** _protocols = _tmpprotocols.ptr;

  auto _supportedExtensions = gPtrArrayFromD!(gobject.type_class.TypeClass, false)(supportedExtensions);
  scope(exit) containerFree!(GPtrArray*, gobject.type_class.TypeClass, GidOwnership.None)(_supportedExtensions);
  GError *_err;
  _retval = cast(bool)soup_websocket_server_check_handshake(msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null, _origin, _protocols, _supportedExtensions, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Examines the method and request headers in msg and (assuming msg
    contains a valid handshake request), fills in the handshake
    response.
    
    If expected_origin is non-null, then only requests containing a matching
    "Origin" header will be accepted. If protocols is non-null, then
    only requests containing a compatible "Sec-WebSocket-Protocols"
    header will be accepted. If supported_extensions is non-null, then
    only requests containing valid supported extensions in
    "Sec-WebSocket-Extensions" header will be accepted. The accepted extensions
    will be returned in accepted_extensions parameter if non-null.
    
    This is a low-level function; if you use
    [soup.server.Server.addWebsocketHandler] to handle accepting WebSocket
    connections, it will call this for you.

    Params:
      msg = #SoupServerMessage containing the client side of a WebSocket handshake
      expectedOrigin = expected Origin header
      protocols = allowed WebSocket
          protocols.
      supportedExtensions = list
          of supported extension types
      acceptedExtensions = a
          #GList of #SoupWebsocketExtension objects
    Returns: true if msg contained a valid WebSocket handshake
        request and was updated to contain a handshake response. false if not.
*/
bool websocketServerProcessHandshake(soup.server_message.ServerMessage msg, string expectedOrigin, string[] protocols, gobject.type_class.TypeClass[] supportedExtensions, out soup.websocket_extension.WebsocketExtension[] acceptedExtensions)
{
  bool _retval;
  const(char)* _expectedOrigin = expectedOrigin.toCString(No.Alloc);
  char*[] _tmpprotocols;
  foreach (s; protocols)
    _tmpprotocols ~= s.toCString(No.Alloc);
  _tmpprotocols ~= null;
  char** _protocols = _tmpprotocols.ptr;

  auto _supportedExtensions = gPtrArrayFromD!(gobject.type_class.TypeClass, false)(supportedExtensions);
  scope(exit) containerFree!(GPtrArray*, gobject.type_class.TypeClass, GidOwnership.None)(_supportedExtensions);
  GList* _acceptedExtensions;
  _retval = cast(bool)soup_websocket_server_process_handshake(msg ? cast(SoupServerMessage*)msg._cPtr(No.Dup) : null, _expectedOrigin, _protocols, _supportedExtensions, &_acceptedExtensions);
  acceptedExtensions = gListToD!(soup.websocket_extension.WebsocketExtension, GidOwnership.Full)(_acceptedExtensions);
  return _retval;
}
