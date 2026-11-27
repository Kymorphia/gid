/// Module for [RTSPMessage] class
module gid.gstrtsp1.rtspmessage;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.string_;
import gid.gobject2.boxed;
import gid.gst1.buffer;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.rtspauth_credential;
import gid.gstrtsp1.types;

/**
    Provides methods for creating and parsing request, response and data messages.
*/
@gidGir("RTSPMessage")
class RTSPMessage : gid.gobject2.boxed.BoxedWrap!(gst_rtsp_msg_get_type)
{
  /**
      Create a `rtspmessage.RTSPMessage` boxed type.
      Params:
        type = the message type
  */
  this(gid.gstrtsp1.types.RTSPMsgType type = gid.gstrtsp1.types.RTSPMsgType.init) nothrow
  {
    super(boxedNew!GstRTSPMessage(_getGType), Yes.Take);
    this.type = type;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override RTSPMessage self() nothrow
  {
    return this;
  }

  /**
      Get `type` field.
      Returns: the message type
  */
  @property gid.gstrtsp1.types.RTSPMsgType type() nothrow
  {
    return cast(gid.gstrtsp1.types.RTSPMsgType)(cast(GstRTSPMessage*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the message type
  */
  @property void type(gid.gstrtsp1.types.RTSPMsgType propval) nothrow
  {
    (cast(GstRTSPMessage*)this._cPtr).type = cast(GstRTSPMsgType)propval;
  }

  /**
      Add a header with key field and value to msg. This function takes a copy
      of value.
  
      Params:
        field = a #GstRTSPHeaderField
        value = the value of the header
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult addHeader(gid.gstrtsp1.types.RTSPHeaderField field, string value) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_message_add_header(cast(GstRTSPMessage*)this._cPtr, field, _value);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Add a header with key header and value to msg. This function takes a copy
      of value.
  
      Params:
        header = header string
        value = the value of the header
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult addHeaderByName(string header, string value) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _header = header.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_message_add_header_by_name(cast(GstRTSPMessage*)this._cPtr, _header, _value);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Append the currently configured headers in msg to the #GString str suitable
      for transmission.
  
      Params:
        str = a string
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult appendHeaders(gid.glib2.string_.String str) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_append_headers(cast(const(GstRTSPMessage)*)this._cPtr, str ? cast(GString*)str._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Allocate a new copy of msg and store the result in copy. The value in
      copy should be release with gst_rtsp_message_free function.
  
      Params:
        copy = pointer to new #GstRTSPMessage
      Returns: a #GstRTSPResult
  */
  gid.gstrtsp1.types.RTSPResult copy(out gid.gstrtsp1.rtspmessage.RTSPMessage copy) nothrow
  {
    GstRTSPResult _cretval;
    GstRTSPMessage* _copy;
    _cretval = gst_rtsp_message_copy(cast(const(GstRTSPMessage)*)this._cPtr, &_copy);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_copy)
      copy = new gid.gstrtsp1.rtspmessage.RTSPMessage(cast(void*)_copy, Yes.Take);
    return _retval;
  }

  /**
      Dump the contents of msg to stdout.
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult dump() nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_dump(cast(GstRTSPMessage*)this._cPtr);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Get the body of msg. data remains valid for as long as msg is valid and
      unchanged.
      
      If the message body was set as a #GstBuffer before this will cause the data
      to be copied and stored in the message. The #GstBuffer will no longer be
      kept in the message.
  
      Params:
        data = location for the data
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult getBody(out ubyte[] data) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    ubyte* _data;
    _cretval = gst_rtsp_message_get_body(cast(const(GstRTSPMessage)*)this._cPtr, &_data, &_size);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    data.length = _size;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _size];
    return _retval;
  }

  /**
      Get the body of msg. buffer remains valid for as long as msg is valid and
      unchanged.
      
      If body data was set from raw memory instead of a #GstBuffer this function
      will always return null. The caller can check if there is a body buffer by
      calling [gid.gstrtsp1.rtspmessage.RTSPMessage.hasBodyBuffer].
  
      Params:
        buffer = location for the buffer
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult getBodyBuffer(out gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstRTSPResult _cretval;
    GstBuffer* _buffer;
    _cretval = gst_rtsp_message_get_body_buffer(cast(const(GstRTSPMessage)*)this._cPtr, &_buffer);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, No.Take);
    return _retval;
  }

  /**
      Get the indx header value with key field from msg. The result in value
      stays valid as long as it remains present in msg.
  
      Params:
        field = a #GstRTSPHeaderField
        value = pointer to hold the result
        indx = the index of the header
      Returns: #GST_RTSP_OK when field was found, #GST_RTSP_ENOTIMPL if the key
        was not found.
  */
  gid.gstrtsp1.types.RTSPResult getHeader(gid.gstrtsp1.types.RTSPHeaderField field, out string value, int indx) nothrow
  {
    GstRTSPResult _cretval;
    char* _value;
    _cretval = gst_rtsp_message_get_header(cast(const(GstRTSPMessage)*)this._cPtr, field, &_value, indx);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    value = _value.fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the index header value with key header from msg. The result in value
      stays valid as long as it remains present in msg.
  
      Params:
        header = a #GstRTSPHeaderField
        value = pointer to hold the result
        index = the index of the header
      Returns: #GST_RTSP_OK when field was found, #GST_RTSP_ENOTIMPL if the key
        was not found.
  */
  gid.gstrtsp1.types.RTSPResult getHeaderByName(string header, out string value, int index) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _header = header.toCString!(No.Malloc, No.Nullable);
    char* _value;
    _cretval = gst_rtsp_message_get_header_by_name(cast(GstRTSPMessage*)this._cPtr, _header, &_value, index);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    value = _value.fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the message type of msg.
      Returns: the message type.
  */
  gid.gstrtsp1.types.RTSPMsgType getType() nothrow
  {
    GstRTSPMsgType _cretval;
    _cretval = gst_rtsp_message_get_type(cast(GstRTSPMessage*)this._cPtr);
    gid.gstrtsp1.types.RTSPMsgType _retval = cast(gid.gstrtsp1.types.RTSPMsgType)_cretval;
    return _retval;
  }

  /**
      Checks if msg has a body and the body is stored as #GstBuffer.
      Returns: true if msg has a body and it's stored as #GstBuffer, false
        otherwise.
  */
  bool hasBodyBuffer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_message_has_body_buffer(cast(const(GstRTSPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Initialize msg. This function is mostly used when msg is allocated on the
      stack. The reverse operation of this is [gid.gstrtsp1.rtspmessage.RTSPMessage.unset].
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult init_() nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_init(cast(GstRTSPMessage*)this._cPtr);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Initialize a new data #GstRTSPMessage for channel.
  
      Params:
        channel = a channel
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult initData(ubyte channel) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_init_data(cast(GstRTSPMessage*)this._cPtr, channel);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Initialize msg as a request message with method and uri. To clear msg
      again, use [gid.gstrtsp1.rtspmessage.RTSPMessage.unset].
  
      Params:
        method = the request method to use
        uri = the uri of the request
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult initRequest(gid.gstrtsp1.types.RTSPMethod method, string uri) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_message_init_request(cast(GstRTSPMessage*)this._cPtr, method, _uri);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Initialize msg with code and reason.
      
      When reason is null, the default reason for code will be used.
      
      When request is not null, the relevant headers will be copied to the new
      response message.
  
      Params:
        code = the status code
        reason = the status reason or null
        request = the request that triggered the response or null
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult initResponse(gid.gstrtsp1.types.RTSPStatusCode code, string reason = null, gid.gstrtsp1.rtspmessage.RTSPMessage request = null) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _reason = reason.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_rtsp_message_init_response(cast(GstRTSPMessage*)this._cPtr, code, _reason, request ? cast(const(GstRTSPMessage)*)request._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Parses the credentials given in a WWW-Authenticate or Authorization header.
  
      Params:
        field = a #GstRTSPHeaderField
      Returns: null-terminated array of GstRTSPAuthCredential or null.
  */
  gid.gstrtsp1.rtspauth_credential.RTSPAuthCredential[] parseAuthCredentials(gid.gstrtsp1.types.RTSPHeaderField field) nothrow
  {
    GstRTSPAuthCredential** _cretval;
    _cretval = gst_rtsp_message_parse_auth_credentials(cast(GstRTSPMessage*)this._cPtr, field);
    gid.gstrtsp1.rtspauth_credential.RTSPAuthCredential[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new gid.gstrtsp1.rtspauth_credential.RTSPAuthCredential[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = new gid.gstrtsp1.rtspauth_credential.RTSPAuthCredential(cast(void*)_cretval[i], Yes.Take);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Parse the data message msg and store the channel in channel.
  
      Params:
        channel = location to hold the channel
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult parseData(out ubyte channel) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_parse_data(cast(GstRTSPMessage*)this._cPtr, cast(ubyte*)&channel);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Parse the request message msg and store the values method, uri and
      version. The result locations can be null if one is not interested in its
      value.
      
      uri remains valid for as long as msg is valid and unchanged.
  
      Params:
        method = location to hold the method
        uri = location to hold the uri
        version_ = location to hold the version
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult parseRequest(out gid.gstrtsp1.types.RTSPMethod method, out string uri, out gid.gstrtsp1.types.RTSPVersion version_) nothrow
  {
    GstRTSPResult _cretval;
    char* _uri;
    _cretval = gst_rtsp_message_parse_request(cast(GstRTSPMessage*)this._cPtr, &method, &_uri, &version_);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    uri = _uri.fromCString!(No.Free);
    return _retval;
  }

  /**
      Parse the response message msg and store the values code, reason and
      version. The result locations can be null if one is not interested in its
      value.
      
      reason remains valid for as long as msg is valid and unchanged.
  
      Params:
        code = location to hold the status code
        reason = location to hold the status reason
        version_ = location to hold the version
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult parseResponse(out gid.gstrtsp1.types.RTSPStatusCode code, out string reason, out gid.gstrtsp1.types.RTSPVersion version_) nothrow
  {
    GstRTSPResult _cretval;
    char* _reason;
    _cretval = gst_rtsp_message_parse_response(cast(GstRTSPMessage*)this._cPtr, &code, &_reason, &version_);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    reason = _reason.fromCString!(No.Free);
    return _retval;
  }

  /**
      Remove the indx header with key field from msg. If indx equals -1, all
      headers will be removed.
  
      Params:
        field = a #GstRTSPHeaderField
        indx = the index of the header
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult removeHeader(gid.gstrtsp1.types.RTSPHeaderField field, int indx) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_remove_header(cast(GstRTSPMessage*)this._cPtr, field, indx);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Remove the index header with key header from msg. If index equals -1,
      all matching headers will be removed.
  
      Params:
        header = the header string
        index = the index of the header
      Returns: a #GstRTSPResult
  */
  gid.gstrtsp1.types.RTSPResult removeHeaderByName(string header, int index) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _header = header.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_message_remove_header_by_name(cast(GstRTSPMessage*)this._cPtr, _header, index);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Set the body of msg to a copy of data. Any existing body or body buffer
      will be replaced by the new body.
  
      Params:
        data = the data
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult setBody(ubyte[] data) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtsp_message_set_body(cast(GstRTSPMessage*)this._cPtr, _data, _size);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Set the body of msg to buffer. Any existing body or body buffer
      will be replaced by the new body.
  
      Params:
        buffer = a #GstBuffer
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult setBodyBuffer(gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_set_body_buffer(cast(GstRTSPMessage*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Take the body of msg and store it in data and size. After this method,
      the body and size of msg will be set to null and 0 respectively.
  
      Params:
        data = location for the data
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult stealBody(out ubyte[] data) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    ubyte* _data;
    _cretval = gst_rtsp_message_steal_body(cast(GstRTSPMessage*)this._cPtr, &_data, &_size);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    data.length = _size;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _size];
    gFree(cast(void*)_data);
    return _retval;
  }

  /**
      Take the body of msg and store it in buffer. After this method,
      the body and size of msg will be set to null and 0 respectively.
      
      If body data was set from raw memory instead of a #GstBuffer this function
      will always return null. The caller can check if there is a body buffer by
      calling [gid.gstrtsp1.rtspmessage.RTSPMessage.hasBodyBuffer].
  
      Params:
        buffer = location for the buffer
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult stealBodyBuffer(out gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstRTSPResult _cretval;
    GstBuffer* _buffer;
    _cretval = gst_rtsp_message_steal_body_buffer(cast(GstRTSPMessage*)this._cPtr, &_buffer);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_buffer)
      buffer = new gid.gst1.buffer.Buffer(cast(void*)_buffer, Yes.Take);
    return _retval;
  }

  /**
      Set the body of msg to data and size. This method takes ownership of
      data. Any existing body or body buffer will be replaced by the new body.
  
      Params:
        data = the data
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult takeBody(ubyte[] data) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)gMalloc((data.length) * (ubyte).sizeof);
    _data[0 .. data.length] = data[];
    _cretval = gst_rtsp_message_take_body(cast(GstRTSPMessage*)this._cPtr, _data, _size);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Set the body of msg to buffer. This method takes ownership of buffer.
      Any existing body or body buffer will be replaced by the new body.
  
      Params:
        buffer = a #GstBuffer
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult takeBodyBuffer(gid.gst1.buffer.Buffer buffer) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_take_body_buffer(cast(GstRTSPMessage*)this._cPtr, buffer ? cast(GstBuffer*)buffer._cPtr(Yes.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Add a header with key field and value to msg. This function takes
      ownership of value.
  
      Params:
        field = a #GstRTSPHeaderField
        value = the value of the header
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult takeHeader(gid.gstrtsp1.types.RTSPHeaderField field, string value) nothrow
  {
    GstRTSPResult _cretval;
    char* _value = value.toCString!(Yes.Malloc, No.Nullable);
    _cretval = gst_rtsp_message_take_header(cast(GstRTSPMessage*)this._cPtr, field, _value);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Add a header with key header and value to msg. This function takes
      ownership of value, but not of header.
  
      Params:
        header = a header string
        value = the value of the header
      Returns: a #GstRTSPResult.
  */
  gid.gstrtsp1.types.RTSPResult takeHeaderByName(string header, string value) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _header = header.toCString!(No.Malloc, No.Nullable);
    char* _value = value.toCString!(Yes.Malloc, No.Nullable);
    _cretval = gst_rtsp_message_take_header_by_name(cast(GstRTSPMessage*)this._cPtr, _header, _value);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Unset the contents of msg so that it becomes an uninitialized
      #GstRTSPMessage again. This function is mostly used in combination with
      [gid.gstrtsp1.rtspmessage.RTSPMessage.initRequest], [gid.gstrtsp1.rtspmessage.RTSPMessage.initResponse] and
      [gid.gstrtsp1.rtspmessage.RTSPMessage.initData] on stack allocated #GstRTSPMessage structures.
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult unset() nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_message_unset(cast(GstRTSPMessage*)this._cPtr);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }
}
