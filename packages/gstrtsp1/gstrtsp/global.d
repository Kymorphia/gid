/// Global functions for gstrtsp1 library
module gstrtsp.global;

import gid.gid;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtspauth_credential;
import gstrtsp.rtspmessage;
import gstrtsp.types;


/**
    Free a null-terminated array of credentials returned from
    [gstrtsp.rtspmessage.RTSPMessage.parseAuthCredentials].

    Params:
      credentials = a null-terminated array of #GstRTSPAuthCredential
*/
void rtspAuthCredentialsFree(gstrtsp.rtspauth_credential.RTSPAuthCredential credentials)
{
  gst_rtsp_auth_credentials_free(credentials ? cast(GstRTSPAuthCredential**)credentials._cPtr(No.Dup) : null);
}

/**
    Convert header to a #GstRTSPHeaderField.

    Params:
      header = a header string
    Returns: a #GstRTSPHeaderField for header or #GST_RTSP_HDR_INVALID if the
      header field is unknown.
*/
gstrtsp.types.RTSPHeaderField rtspFindHeaderField(string header)
{
  GstRTSPHeaderField _cretval;
  const(char)* _header = header.toCString(No.Alloc);
  _cretval = gst_rtsp_find_header_field(_header);
  gstrtsp.types.RTSPHeaderField _retval = cast(gstrtsp.types.RTSPHeaderField)_cretval;
  return _retval;
}

/**
    Convert method to a #GstRTSPMethod.

    Params:
      method = a method
    Returns: a #GstRTSPMethod for method or #GST_RTSP_INVALID if the
      method is unknown.
*/
gstrtsp.types.RTSPMethod rtspFindMethod(string method)
{
  GstRTSPMethod _cretval;
  const(char)* _method = method.toCString(No.Alloc);
  _cretval = gst_rtsp_find_method(_method);
  gstrtsp.types.RTSPMethod _retval = cast(gstrtsp.types.RTSPMethod)_cretval;
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
string rtspGenerateDigestAuthResponse(string algorithm, string method, string realm, string username, string password, string uri, string nonce)
{
  char* _cretval;
  const(char)* _algorithm = algorithm.toCString(No.Alloc);
  const(char)* _method = method.toCString(No.Alloc);
  const(char)* _realm = realm.toCString(No.Alloc);
  const(char)* _username = username.toCString(No.Alloc);
  const(char)* _password = password.toCString(No.Alloc);
  const(char)* _uri = uri.toCString(No.Alloc);
  const(char)* _nonce = nonce.toCString(No.Alloc);
  _cretval = gst_rtsp_generate_digest_auth_response(_algorithm, _method, _realm, _username, _password, _uri, _nonce);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
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
string rtspGenerateDigestAuthResponseFromMd5(string algorithm, string method, string md5, string uri, string nonce)
{
  char* _cretval;
  const(char)* _algorithm = algorithm.toCString(No.Alloc);
  const(char)* _method = method.toCString(No.Alloc);
  const(char)* _md5 = md5.toCString(No.Alloc);
  const(char)* _uri = uri.toCString(No.Alloc);
  const(char)* _nonce = nonce.toCString(No.Alloc);
  _cretval = gst_rtsp_generate_digest_auth_response_from_md5(_algorithm, _method, _md5, _uri, _nonce);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Check whether field may appear multiple times in a message.

    Params:
      field = a #GstRTSPHeaderField
    Returns: true if multiple headers are allowed.
*/
bool rtspHeaderAllowMultiple(gstrtsp.types.RTSPHeaderField field)
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
string rtspHeaderAsText(gstrtsp.types.RTSPHeaderField field)
{
  const(char)* _cretval;
  _cretval = gst_rtsp_header_as_text(field);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Create a new initialized #GstRTSPMessage. Free with [gstrtsp.rtspmessage.RTSPMessage.free].

    Params:
      msg = a location for the new #GstRTSPMessage
    Returns: a #GstRTSPResult.
*/
gstrtsp.types.RTSPResult rtspMessageNew(out gstrtsp.rtspmessage.RTSPMessage msg)
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  _cretval = gst_rtsp_message_new(&_msg);
  gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
  msg = new gstrtsp.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Create a new data #GstRTSPMessage with channel and store the
    result message in msg. Free with [gstrtsp.rtspmessage.RTSPMessage.free].

    Params:
      msg = a location for the new #GstRTSPMessage
      channel = the channel
    Returns: a #GstRTSPResult.
*/
gstrtsp.types.RTSPResult rtspMessageNewData(out gstrtsp.rtspmessage.RTSPMessage msg, ubyte channel)
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  _cretval = gst_rtsp_message_new_data(&_msg, channel);
  gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
  msg = new gstrtsp.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Create a new #GstRTSPMessage with method and uri and store the result
    request message in msg. Free with [gstrtsp.rtspmessage.RTSPMessage.free].

    Params:
      msg = a location for the new #GstRTSPMessage
      method = the request method to use
      uri = the uri of the request
    Returns: a #GstRTSPResult.
*/
gstrtsp.types.RTSPResult rtspMessageNewRequest(out gstrtsp.rtspmessage.RTSPMessage msg, gstrtsp.types.RTSPMethod method, string uri)
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  const(char)* _uri = uri.toCString(No.Alloc);
  _cretval = gst_rtsp_message_new_request(&_msg, method, _uri);
  gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
  msg = new gstrtsp.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Create a new response #GstRTSPMessage with code and reason and store the
    result message in msg. Free with [gstrtsp.rtspmessage.RTSPMessage.free].
    
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
gstrtsp.types.RTSPResult rtspMessageNewResponse(out gstrtsp.rtspmessage.RTSPMessage msg, gstrtsp.types.RTSPStatusCode code, string reason = null, gstrtsp.rtspmessage.RTSPMessage request = null)
{
  GstRTSPResult _cretval;
  GstRTSPMessage* _msg;
  const(char)* _reason = reason.toCString(No.Alloc);
  _cretval = gst_rtsp_message_new_response(&_msg, code, _reason, request ? cast(const(GstRTSPMessage)*)request._cPtr(No.Dup) : null);
  gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
  msg = new gstrtsp.rtspmessage.RTSPMessage(cast(void*)_msg, Yes.Take);
  return _retval;
}

/**
    Convert options to a string.

    Params:
      options = one or more #GstRTSPMethod
    Returns: a new string of options. [glib.global.gfree] after usage.
*/
string rtspOptionsAsText(gstrtsp.types.RTSPMethod options)
{
  char* _cretval;
  _cretval = gst_rtsp_options_as_text(options);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Convert the comma separated list options to a #GstRTSPMethod bitwise or
    of methods. This functions is the reverse of [gstrtsp.global.rtspOptionsAsText].

    Params:
      options = a comma separated list of options
    Returns: a #GstRTSPMethod
*/
gstrtsp.types.RTSPMethod rtspOptionsFromText(string options)
{
  GstRTSPMethod _cretval;
  const(char)* _options = options.toCString(No.Alloc);
  _cretval = gst_rtsp_options_from_text(_options);
  gstrtsp.types.RTSPMethod _retval = cast(gstrtsp.types.RTSPMethod)_cretval;
  return _retval;
}

/**
    Convert code to a string.

    Params:
      code = a #GstRTSPStatusCode
    Returns: a string representation of code.
*/
string rtspStatusAsText(gstrtsp.types.RTSPStatusCode code)
{
  const(char)* _cretval;
  _cretval = gst_rtsp_status_as_text(code);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Convert result in a human readable string.

    Params:
      result = a #GstRTSPResult
    Returns: a newly allocated string. [glib.global.gfree] after usage.
*/
string rtspStrresult(gstrtsp.types.RTSPResult result)
{
  char* _cretval;
  _cretval = gst_rtsp_strresult(result);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}
