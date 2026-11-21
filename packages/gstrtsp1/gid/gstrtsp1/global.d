/// Global functions for gstrtsp1 library
module gid.gstrtsp1.global;

import gid.core.gid;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.rtspmessage;
import gid.gstrtsp1.types;


/**
    Convert header to a #GstRTSPHeaderField.

    Params:
      header = a header string
    Returns: a #GstRTSPHeaderField for header or #GST_RTSP_HDR_INVALID if the
      header field is unknown.
*/
gid.gstrtsp1.types.RTSPHeaderField rtspFindHeaderField(string header) nothrow
{
  GstRTSPHeaderField _cretval;
  const(char)* _header = header.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_rtsp_find_header_field(_header);
  gid.gstrtsp1.types.RTSPHeaderField _retval = cast(gid.gstrtsp1.types.RTSPHeaderField)_cretval;
  return _retval;
}

/**
    Convert method to a #GstRTSPMethod.

    Params:
      method = a method
    Returns: a #GstRTSPMethod for method or #GST_RTSP_INVALID if the
      method is unknown.
*/
gid.gstrtsp1.types.RTSPMethod rtspFindMethod(string method) nothrow
{
  GstRTSPMethod _cretval;
  const(char)* _method = method.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_rtsp_find_method(_method);
  gid.gstrtsp1.types.RTSPMethod _retval = cast(gid.gstrtsp1.types.RTSPMethod)_cretval;
  return _retval;
}

/**
    Calculates the digest auth response from the values given by the server and
    the username and password. See RFC2069 for details.
    
    Currently only supported algorithm "md5".

    Params:
      algorithm = Hash algorithm to use, or null for MD5
      method = Request method, e.g. PLAY
      realm = Realm
      username = Username
      password = Password
      uri = Original request URI
      nonce = Nonce
    Returns: Authentication response or null if unsupported
*/
string rtspGenerateDigestAuthResponse(string algorithm, string method, string realm, string username, string password, string uri, string nonce) nothrow
{
  char* _cretval;
  const(char)* _algorithm = algorithm.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _method = method.toCString!(No.Malloc, No.Nullable);
  const(char)* _realm = realm.toCString!(No.Malloc, No.Nullable);
  const(char)* _username = username.toCString!(No.Malloc, No.Nullable);
  const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
  const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
  const(char)* _nonce = nonce.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_rtsp_generate_digest_auth_response(_algorithm, _method, _realm, _username, _password, _uri, _nonce);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Calculates the digest auth response from the values given by the server and
    the md5sum. See RFC2069 for details.
    
    This function is useful when the passwords are not stored in clear text,
    but instead in the same format as the .htdigest file.
    
    Currently only supported algorithm "md5".

    Params:
      algorithm = Hash algorithm to use, or null for MD5
      method = Request method, e.g. PLAY
      md5 = The md5 sum of username:realm:password
      uri = Original request URI
      nonce = Nonce
    Returns: Authentication response or null if unsupported
*/
string rtspGenerateDigestAuthResponseFromMd5(string algorithm, string method, string md5, string uri, string nonce) nothrow
{
  char* _cretval;
  const(char)* _algorithm = algorithm.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _method = method.toCString!(No.Malloc, No.Nullable);
  const(char)* _md5 = md5.toCString!(No.Malloc, No.Nullable);
  const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
  const(char)* _nonce = nonce.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_rtsp_generate_digest_auth_response_from_md5(_algorithm, _method, _md5, _uri, _nonce);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Check whether field may appear multiple times in a message.

    Params:
      field = a #GstRTSPHeaderField
    Returns: true if multiple headers are allowed.
*/
bool rtspHeaderAllowMultiple(gid.gstrtsp1.types.RTSPHeaderField field) nothrow
{
  bool _retval;
  _retval = cast(bool)gst_rtsp_header_allow_multiple(field);
  return _retval;
}

/**
    Convert field to a string.

    Params:
      field = a #GstRTSPHeaderField
    Returns: a string representation of field.
*/
string rtspHeaderAsText(gid.gstrtsp1.types.RTSPHeaderField field) nothrow
{
  const(char)* _cretval;
  _cretval = gst_rtsp_header_as_text(field);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Create a new initialized #GstRTSPMessage. Free with [gid.gstrtsp1.rtspmessage.RTSPMessage.free].

    Params:
      msg = a location for the new #GstRTSPMessage
    Returns: a #GstRTSPResult.
*/
gid.gstrtsp1.types.RTSPResult rtspMessageNew(out gid.gstrtsp1.rtspmessage.RTSPMessage msg) nothrow
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  _cretval = gst_rtsp_message_new(&_msg);
  gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
  if (_msg)
    msg = new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Create a new data #GstRTSPMessage with channel and store the
    result message in msg. Free with [gid.gstrtsp1.rtspmessage.RTSPMessage.free].

    Params:
      msg = a location for the new #GstRTSPMessage
      channel = the channel
    Returns: a #GstRTSPResult.
*/
gid.gstrtsp1.types.RTSPResult rtspMessageNewData(out gid.gstrtsp1.rtspmessage.RTSPMessage msg, ubyte channel) nothrow
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  _cretval = gst_rtsp_message_new_data(&_msg, channel);
  gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
  if (_msg)
    msg = new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Create a new #GstRTSPMessage with method and uri and store the result
    request message in msg. Free with [gid.gstrtsp1.rtspmessage.RTSPMessage.free].

    Params:
      msg = a location for the new #GstRTSPMessage
      method = the request method to use
      uri = the uri of the request
    Returns: a #GstRTSPResult.
*/
gid.gstrtsp1.types.RTSPResult rtspMessageNewRequest(out gid.gstrtsp1.rtspmessage.RTSPMessage msg, gid.gstrtsp1.types.RTSPMethod method, string uri) nothrow
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_rtsp_message_new_request(&_msg, method, _uri);
  gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
  if (_msg)
    msg = new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Create a new response #GstRTSPMessage with code and reason and store the
    result message in msg. Free with [gid.gstrtsp1.rtspmessage.RTSPMessage.free].
    
    When reason is null, the default reason for code will be used.
    
    When request is not null, the relevant headers will be copied to the new
    response message.

    Params:
      msg = a location for the new #GstRTSPMessage
      code = the status code
      reason = the status reason or null
      request = the request that triggered the response or null
    Returns: a #GstRTSPResult.
*/
gid.gstrtsp1.types.RTSPResult rtspMessageNewResponse(out gid.gstrtsp1.rtspmessage.RTSPMessage msg, gid.gstrtsp1.types.RTSPStatusCode code, string reason = null, gid.gstrtsp1.rtspmessage.RTSPMessage request = null) nothrow
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  const(char)* _reason = reason.toCString!(No.Malloc, Yes.Nullable);
  _cretval = gst_rtsp_message_new_response(&_msg, code, _reason, request ? cast(const(GstRTSPMessage)*)request._cPtr(No.Dup) : null);
  gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
  if (_msg)
    msg = new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Convert options to a string.

    Params:
      options = one or more #GstRTSPMethod
    Returns: a new string of options. [gid.glib2.global.gfree] after usage.
*/
string rtspOptionsAsText(gid.gstrtsp1.types.RTSPMethod options) nothrow
{
  char* _cretval;
  _cretval = gst_rtsp_options_as_text(options);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Convert the comma separated list options to a #GstRTSPMethod bitwise or
    of methods. This functions is the reverse of [gid.gstrtsp1.global.rtspOptionsAsText].

    Params:
      options = a comma separated list of options
    Returns: a #GstRTSPMethod
*/
gid.gstrtsp1.types.RTSPMethod rtspOptionsFromText(string options) nothrow
{
  GstRTSPMethod _cretval;
  const(char)* _options = options.toCString!(No.Malloc, No.Nullable);
  _cretval = gst_rtsp_options_from_text(_options);
  gid.gstrtsp1.types.RTSPMethod _retval = cast(gid.gstrtsp1.types.RTSPMethod)_cretval;
  return _retval;
}

/**
    Convert code to a string.

    Params:
      code = a #GstRTSPStatusCode
    Returns: a string representation of code.
*/
string rtspStatusAsText(gid.gstrtsp1.types.RTSPStatusCode code) nothrow
{
  const(char)* _cretval;
  _cretval = gst_rtsp_status_as_text(code);
  string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
  return _retval;
}

/**
    Convert result in a human readable string.

    Params:
      result = a #GstRTSPResult
    Returns: a newly allocated string. [gid.glib2.global.gfree] after usage.
*/
string rtspStrresult(gid.gstrtsp1.types.RTSPResult result) nothrow
{
  char* _cretval;
  _cretval = gst_rtsp_strresult(result);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}
