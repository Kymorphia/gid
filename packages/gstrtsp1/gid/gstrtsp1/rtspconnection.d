/// Module for [RTSPConnection] class
module gid.gstrtsp1.rtspconnection;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.cancellable;
import gid.gio2.socket;
import gid.gio2.tls_certificate;
import gid.gio2.tls_connection;
import gid.gio2.tls_database;
import gid.gio2.tls_interaction;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.time_val;
import gid.gobject2.object;
import gid.gstrtsp1.c.functions;
import gid.gstrtsp1.c.types;
import gid.gstrtsp1.rtspmessage;
import gid.gstrtsp1.rtspurl;
import gid.gstrtsp1.types;

/**
    This object manages the RTSP connection to the server. It provides function
    to receive and send bytes and messages.
*/
class RTSPConnection : OpaqueWrap!(GstRTSPConnection*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Add header to be appended to any HTTP request made by connection.
      If the header already exists then the old header is replaced by the new header.
      
      Only applicable in HTTP tunnel mode.
  
      Params:
        key = HTTP header name
        value = HTTP header value
  */
  void addExtraHttpRequestHeader(string key, string value) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    gst_rtsp_connection_add_extra_http_request_header(cast(GstRTSPConnection*)this._cPtr, _key, _value);
  }

  /**
      Clear the list of authentication directives stored in conn.
  */
  void clearAuthParams() nothrow
  {
    gst_rtsp_connection_clear_auth_params(cast(GstRTSPConnection*)this._cPtr);
  }

  /**
      Close the connected conn. After this call, the connection is in the same
      state as when it was first created.
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult close() nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_close(cast(GstRTSPConnection*)this._cPtr);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gid.gstrtsp1.rtspconnection.RTSPConnection.create]. If timeout is null this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a GTimeVal timeout
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gid.gstrtsp1.types.RTSPResult connect(gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect(cast(GstRTSPConnection*)this._cPtr, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gid.gstrtsp1.rtspconnection.RTSPConnection.create]. If timeout is 0 this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a timeout in microseconds
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gid.gstrtsp1.types.RTSPResult connectUsec(long timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect_usec(cast(GstRTSPConnection*)this._cPtr, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gid.gstrtsp1.rtspconnection.RTSPConnection.create]. If timeout is null this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.  If conn is set to tunneled,
      response will contain a response to the tunneling request messages.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a GTimeVal timeout
        response = a #GstRTSPMessage
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gid.gstrtsp1.types.RTSPResult connectWithResponse(gid.glib2.time_val.TimeVal timeout, gid.gstrtsp1.rtspmessage.RTSPMessage response) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect_with_response(cast(GstRTSPConnection*)this._cPtr, cast(GTimeVal*)&timeout, response ? cast(GstRTSPMessage*)response._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gid.gstrtsp1.rtspconnection.RTSPConnection.create]. If timeout is 0 this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.  If conn is set to tunneled,
      response will contain a response to the tunneling request messages.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a timeout in microseconds
        response = a #GstRTSPMessage
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gid.gstrtsp1.types.RTSPResult connectWithResponseUsec(long timeout, gid.gstrtsp1.rtspmessage.RTSPMessage response) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect_with_response_usec(cast(GstRTSPConnection*)this._cPtr, timeout, response ? cast(GstRTSPMessage*)response._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      If conn received the first tunnel connection and conn2 received
      the second tunnel connection, link the two connections together so that
      conn manages the tunneled connection.
      
      After this call, conn2 cannot be used anymore and must be freed with
      [gid.gstrtsp1.rtspconnection.RTSPConnection.free].
      
      If conn2 is null then only the base64 decoding context will be setup for
      conn.
  
      Params:
        conn2 = a #GstRTSPConnection or null
      Returns: return GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult doTunnel(gid.gstrtsp1.rtspconnection.RTSPConnection conn2 = null) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_do_tunnel(cast(GstRTSPConnection*)this._cPtr, conn2 ? cast(GstRTSPConnection*)conn2._cPtr : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Start or stop the flushing action on conn. When flushing, all current
      and future actions on conn will return #GST_RTSP_EINTR until the connection
      is set to non-flushing mode again.
  
      Params:
        flush = start or stop the flush
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult flush(bool flush) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_flush(cast(GstRTSPConnection*)this._cPtr, flush);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Get the ignore_x_server_reply value.
      Returns: returns true if the x-server-ip-address header reply will be
                 ignored, else returns false
  */
  bool getIgnoreXServerReply() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_connection_get_ignore_x_server_reply(cast(const(GstRTSPConnection)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the IP address of the other end of conn.
      Returns: The IP address as a string.
        This value remains valid until the connection is closed.
  */
  string getIp() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_connection_get_ip(cast(const(GstRTSPConnection)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the file descriptor for reading.
      Returns: the file descriptor used for reading or null on
        error. The file descriptor remains valid until the connection is closed.
  */
  gid.gio2.socket.Socket getReadSocket() nothrow
  {
    GSocket* _cretval;
    _cretval = gst_rtsp_connection_get_read_socket(cast(const(GstRTSPConnection)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket.Socket)(cast(GSocket*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getRememberSessionId() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_connection_get_remember_session_id(cast(GstRTSPConnection*)this._cPtr);
    return _retval;
  }

  /**
      Get the TLS connection of conn.
      
      For client side this will return the #GTlsClientConnection when connected
      over TLS.
      
      For server side connections, this function will create a GTlsServerConnection
      when called the first time and will return that same connection on subsequent
      calls. The server is then responsible for configuring the TLS connection.
      Returns: the TLS connection for conn.
      Throws: [ErrorWrap]
  */
  gid.gio2.tls_connection.TlsConnection getTls()
  {
    GTlsConnection* _cretval;
    GError *_err;
    _cretval = gst_rtsp_connection_get_tls(cast(GstRTSPConnection*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_connection.TlsConnection)(cast(GTlsConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the anchor certificate authorities database that will be used
      after a server certificate can't be verified with the default
      certificate database.
      Returns: the anchor certificate authorities database, or NULL if no
        database has been previously set. Use [gid.gobject2.object.ObjectWrap.unref] to release the
        certificate database.
  */
  gid.gio2.tls_database.TlsDatabase getTlsDatabase() nothrow
  {
    GTlsDatabase* _cretval;
    _cretval = gst_rtsp_connection_get_tls_database(cast(GstRTSPConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a #GTlsInteraction object to be used when the connection or certificate
      database need to interact with the user. This will be used to prompt the
      user for passwords where necessary.
      Returns: a reference on the #GTlsInteraction. Use
        [gid.gobject2.object.ObjectWrap.unref] to release.
  */
  gid.gio2.tls_interaction.TlsInteraction getTlsInteraction() nothrow
  {
    GTlsInteraction* _cretval;
    _cretval = gst_rtsp_connection_get_tls_interaction(cast(GstRTSPConnection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_interaction.TlsInteraction)(cast(GTlsInteraction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the TLS validation flags used to verify the peer certificate
      when a TLS connection is established.
      
      GLib guarantees that if certificate verification fails, at least one error
      will be set, but it does not guarantee that all possible errors will be
      set. Accordingly, you may not safely decide to ignore any particular type
      of error.
      
      For example, it would be incorrect to ignore [gid.gio2.types.TlsCertificateFlags.Expired] if
      you want to allow expired certificates, because this could potentially be
      the only error flag set even if other problems exist with the certificate.
      Returns: the validation flags.
  */
  gid.gio2.types.TlsCertificateFlags getTlsValidationFlags() nothrow
  {
    GTlsCertificateFlags _cretval;
    _cretval = gst_rtsp_connection_get_tls_validation_flags(cast(GstRTSPConnection*)this._cPtr);
    gid.gio2.types.TlsCertificateFlags _retval = cast(gid.gio2.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Get the tunnel session id the connection.
      Returns: returns a non-empty string if conn is being tunneled over HTTP.
  */
  string getTunnelid() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_connection_get_tunnelid(cast(const(GstRTSPConnection)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Retrieve the URL of the other end of conn.
      Returns: The URL. This value remains valid until the
        connection is freed.
  */
  gid.gstrtsp1.rtspurl.RTSPUrl getUrl() nothrow
  {
    GstRTSPUrl* _cretval;
    _cretval = gst_rtsp_connection_get_url(cast(const(GstRTSPConnection)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstrtsp1.rtspurl.RTSPUrl(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the file descriptor for writing.
      Returns: the file descriptor used for writing or NULL on
        error. The file descriptor remains valid until the connection is closed.
  */
  gid.gio2.socket.Socket getWriteSocket() nothrow
  {
    GSocket* _cretval;
    _cretval = gst_rtsp_connection_get_write_socket(cast(const(GstRTSPConnection)*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket.Socket)(cast(GSocket*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the tunneling state of the connection.
      Returns: if conn is using HTTP tunneling.
  */
  bool isTunneled() nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_connection_is_tunneled(cast(const(GstRTSPConnection)*)this._cPtr);
    return _retval;
  }

  /**
      Calculate the next timeout for conn, storing the result in timeout.
  
      Params:
        timeout = a timeout
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult nextTimeout(gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_next_timeout(cast(GstRTSPConnection*)this._cPtr, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Calculate the next timeout for conn
      Returns: #the next timeout in microseconds
  */
  long nextTimeoutUsec() nothrow
  {
    long _retval;
    _retval = gst_rtsp_connection_next_timeout_usec(cast(GstRTSPConnection*)this._cPtr);
    return _retval;
  }

  /**
      Wait up to the specified timeout for the connection to become available for
      at least one of the operations specified in events. When the function returns
      with #GST_RTSP_OK, revents will contain a bitmask of available operations on
      conn.
      
      timeout can be null, in which case this function might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        events = a bitmask of #GstRTSPEvent flags to check
        revents = location for result flags
        timeout = a timeout
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult poll(gid.gstrtsp1.types.RTSPEvent events, out gid.gstrtsp1.types.RTSPEvent revents, gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_poll(cast(GstRTSPConnection*)this._cPtr, events, &revents, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Wait up to the specified timeout for the connection to become available for
      at least one of the operations specified in events. When the function returns
      with #GST_RTSP_OK, revents will contain a bitmask of available operations on
      conn.
      
      timeout can be 0, in which case this function might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        events = a bitmask of #GstRTSPEvent flags to check
        revents = location for result flags
        timeout = a timeout in microseconds
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult pollUsec(gid.gstrtsp1.types.RTSPEvent events, out gid.gstrtsp1.types.RTSPEvent revents, long timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_poll_usec(cast(GstRTSPConnection*)this._cPtr, events, &revents, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read size bytes into data from the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to read
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult read(ubyte[] data, gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtsp_connection_read(cast(GstRTSPConnection*)this._cPtr, _data, _size, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read size bytes into data from the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to read
        timeout = a timeout value in microseconds
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult readUsec(ubyte[] data, long timeout) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtsp_connection_read_usec(cast(GstRTSPConnection*)this._cPtr, _data, _size, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read into message from the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to read
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult receive(gid.gstrtsp1.rtspmessage.RTSPMessage message, gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_receive(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read into message from the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to read
        timeout = a timeout value or 0
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult receiveUsec(gid.gstrtsp1.rtspmessage.RTSPMessage message, long timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_receive_usec(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Reset the timeout of conn.
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult resetTimeout() nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_reset_timeout(cast(GstRTSPConnection*)this._cPtr);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send message to the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to send
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult send(gid.gstrtsp1.rtspmessage.RTSPMessage message, gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_send(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send messages to the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        messages = the messages to send
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult sendMessages(gid.gstrtsp1.rtspmessage.RTSPMessage[] messages, gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    uint _nMessages;
    if (messages)
      _nMessages = cast(uint)messages.length;

    auto _messages_arr = new GstRTSPMessage[](messages.length);
    auto _messages = _messages_arr.ptr;
    foreach (i, obj; messages) _messages[i] = obj ? *cast(GstRTSPMessage*)obj._cPtr(No.Dup) : GstRTSPMessage.init;
    _cretval = gst_rtsp_connection_send_messages(cast(GstRTSPConnection*)this._cPtr, _messages, _nMessages, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send messages to the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        messages = the messages to send
        timeout = a timeout value in microseconds
      Returns: #GST_RTSP_OK on Since.
  */
  gid.gstrtsp1.types.RTSPResult sendMessagesUsec(gid.gstrtsp1.rtspmessage.RTSPMessage[] messages, long timeout) nothrow
  {
    GstRTSPResult _cretval;
    uint _nMessages;
    if (messages)
      _nMessages = cast(uint)messages.length;

    auto _messages_arr = new GstRTSPMessage[](messages.length);
    auto _messages = _messages_arr.ptr;
    foreach (i, obj; messages) _messages[i] = obj ? *cast(GstRTSPMessage*)obj._cPtr(No.Dup) : GstRTSPMessage.init;
    _cretval = gst_rtsp_connection_send_messages_usec(cast(GstRTSPConnection*)this._cPtr, _messages, _nMessages, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send message to the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to send
        timeout = a timeout value in microseconds
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult sendUsec(gid.gstrtsp1.rtspmessage.RTSPMessage message, long timeout) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_send_usec(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Sets a custom accept-certificate function for checking certificates for
      validity. This will directly map to #GTlsConnection 's "accept-certificate"
      signal and be performed after the default checks of #GstRTSPConnection
      (checking against the #GTlsDatabase with the given #GTlsCertificateFlags)
      have failed. If no #GTlsDatabase is set on this connection, only func will
      be called.
  
      Params:
        func = a #GstRTSPConnectionAcceptCertificateFunc to check certificates
  */
  void setAcceptCertificateFunc(gid.gstrtsp1.types.RTSPConnectionAcceptCertificateFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GTlsConnection* conn, GTlsCertificate* peerCert, GTlsCertificateFlags errors, void* userData) nothrow
    {
      bool _dretval;
      auto _dlg = cast(gid.gstrtsp1.types.RTSPConnectionAcceptCertificateFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_connection.TlsConnection)(cast(void*)conn, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(void*)peerCert, No.Take), errors);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gstrtsp1.types.RTSPConnectionAcceptCertificateFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gst_rtsp_connection_set_accept_certificate_func(cast(GstRTSPConnection*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Configure conn for authentication mode method with user and pass as the
      user and password respectively.
  
      Params:
        method = authentication method
        user = the user
        pass = the password
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult setAuth(gid.gstrtsp1.types.RTSPAuthMethod method, string user, string pass) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _user = user.toCString!(No.Malloc, No.Nullable);
    const(char)* _pass = pass.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_connection_set_auth(cast(GstRTSPConnection*)this._cPtr, method, _user, _pass);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Setup conn with authentication directives. This is not necessary for
      methods #GST_RTSP_AUTH_NONE and #GST_RTSP_AUTH_BASIC. For
      #GST_RTSP_AUTH_DIGEST, directives should be taken from the digest challenge
      in the WWW-Authenticate response header and can include realm, domain,
      nonce, opaque, stale, algorithm, qop as per RFC2617.
  
      Params:
        param = authentication directive
        value = value
  */
  void setAuthParam(string param, string value) nothrow
  {
    const(char)* _param = param.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    gst_rtsp_connection_set_auth_param(cast(GstRTSPConnection*)this._cPtr, _param, _value);
  }

  /**
      Configure conn to use the specified Content-Length limit.
      Both requests and responses are validated. If content-length is
      exceeded, ENOMEM error will be returned.
  
      Params:
        limit = Content-Length limit
  */
  void setContentLengthLimit(uint limit) nothrow
  {
    gst_rtsp_connection_set_content_length_limit(cast(GstRTSPConnection*)this._cPtr, limit);
  }

  /**
      By setting the HTTP mode to true the message parsing will support HTTP
      messages in addition to the RTSP messages. It will also disable the
      automatic handling of setting up an HTTP tunnel.
  
      Params:
        enable = true to enable manual HTTP mode
  */
  void setHttpMode(bool enable) nothrow
  {
    gst_rtsp_connection_set_http_mode(cast(GstRTSPConnection*)this._cPtr, enable);
  }

  /**
      Set whether to ignore the x-server-ip-address header reply or not. If the
      header is ignored, the original address will be used instead.
  
      Params:
        ignore = true to ignore the x-server-ip-address header reply or false to
                   comply with it (false is the default).
  */
  void setIgnoreXServerReply(bool ignore) nothrow
  {
    gst_rtsp_connection_set_ignore_x_server_reply(cast(GstRTSPConnection*)this._cPtr, ignore);
  }

  /**
      Set the IP address of the server.
  
      Params:
        ip = an ip address
  */
  void setIp(string ip) nothrow
  {
    const(char)* _ip = ip.toCString!(No.Malloc, No.Nullable);
    gst_rtsp_connection_set_ip(cast(GstRTSPConnection*)this._cPtr, _ip);
  }

  /**
      Set the proxy host and port.
  
      Params:
        host = the proxy host
        port = the proxy port
      Returns: #GST_RTSP_OK.
  */
  gid.gstrtsp1.types.RTSPResult setProxy(string host, uint port) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _host = host.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_rtsp_connection_set_proxy(cast(GstRTSPConnection*)this._cPtr, _host, port);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Configure conn to use the specified DSCP value.
  
      Params:
        qosDscp = DSCP value
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult setQosDscp(uint qosDscp) nothrow
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_set_qos_dscp(cast(GstRTSPConnection*)this._cPtr, qosDscp);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Sets if the #GstRTSPConnection should remember the session id from the last
      response received and force it onto any further requests.
      
      The default value is true
  
      Params:
        remember = true if the connection should remember the session id
  */
  void setRememberSessionId(bool remember) nothrow
  {
    gst_rtsp_connection_set_remember_session_id(cast(GstRTSPConnection*)this._cPtr, remember);
  }

  /**
      Sets the anchor certificate authorities database. This certificate
      database will be used to verify the server's certificate in case it
      can't be verified with the default certificate database first.
  
      Params:
        database = a #GTlsDatabase
  */
  void setTlsDatabase(gid.gio2.tls_database.TlsDatabase database = null) nothrow
  {
    gst_rtsp_connection_set_tls_database(cast(GstRTSPConnection*)this._cPtr, database ? cast(GTlsDatabase*)database._cPtr(No.Dup) : null);
  }

  /**
      Sets a #GTlsInteraction object to be used when the connection or certificate
      database need to interact with the user. This will be used to prompt the
      user for passwords where necessary.
  
      Params:
        interaction = a #GTlsInteraction
  */
  void setTlsInteraction(gid.gio2.tls_interaction.TlsInteraction interaction = null) nothrow
  {
    gst_rtsp_connection_set_tls_interaction(cast(GstRTSPConnection*)this._cPtr, interaction ? cast(GTlsInteraction*)interaction._cPtr(No.Dup) : null);
  }

  /**
      Sets the TLS validation flags to be used to verify the peer
      certificate when a TLS connection is established.
      
      GLib guarantees that if certificate verification fails, at least one error
      will be set, but it does not guarantee that all possible errors will be
      set. Accordingly, you may not safely decide to ignore any particular type
      of error.
      
      For example, it would be incorrect to mask [gid.gio2.types.TlsCertificateFlags.Expired] if
      you want to allow expired certificates, because this could potentially be
      the only error flag set even if other problems exist with the certificate.
  
      Params:
        flags = the validation flags.
      Returns: TRUE if the validation flags are set correctly, or FALSE if
        conn is NULL or is not a TLS connection.
  */
  bool setTlsValidationFlags(gid.gio2.types.TlsCertificateFlags flags) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_connection_set_tls_validation_flags(cast(GstRTSPConnection*)this._cPtr, flags);
    return _retval;
  }

  /**
      Set the HTTP tunneling state of the connection. This must be configured before
      the conn is connected.
  
      Params:
        tunneled = the new state
  */
  void setTunneled(bool tunneled) nothrow
  {
    gst_rtsp_connection_set_tunneled(cast(GstRTSPConnection*)this._cPtr, tunneled);
  }

  /**
      Attempt to write size bytes of data to the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to write
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult write(ubyte[] data, gid.glib2.time_val.TimeVal timeout) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtsp_connection_write(cast(GstRTSPConnection*)this._cPtr, _data, _size, cast(GTimeVal*)&timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to write size bytes of data to the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gid.gstrtsp1.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to write
        timeout = a timeout value or 0
      Returns: #GST_RTSP_OK on success.
  */
  gid.gstrtsp1.types.RTSPResult writeUsec(ubyte[] data, long timeout) nothrow
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtsp_connection_write_usec(cast(GstRTSPConnection*)this._cPtr, _data, _size, timeout);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Accept a new connection on socket and create a new #GstRTSPConnection for
      handling communication on new socket.
  
      Params:
        socket = a socket
        conn = storage for a #GstRTSPConnection
        cancellable = a #GCancellable to cancel the operation
      Returns: #GST_RTSP_OK when conn contains a valid connection.
  */
  static gid.gstrtsp1.types.RTSPResult accept(gid.gio2.socket.Socket socket, out gid.gstrtsp1.rtspconnection.RTSPConnection conn, gid.gio2.cancellable.Cancellable cancellable = null) nothrow
  {
    GstRTSPResult _cretval;
    GstRTSPConnection* _conn;
    _cretval = gst_rtsp_connection_accept(socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, &_conn, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_conn)
      conn = new gid.gstrtsp1.rtspconnection.RTSPConnection(cast(void*)_conn, Yes.Take);
    return _retval;
  }

  /**
      Create a newly allocated #GstRTSPConnection from url and store it in conn.
      The connection will not yet attempt to connect to url, use
      [gid.gstrtsp1.rtspconnection.RTSPConnection.connect].
      
      A copy of url will be made.
  
      Params:
        url = a #GstRTSPUrl
        conn = storage for a #GstRTSPConnection
      Returns: #GST_RTSP_OK when conn contains a valid connection.
  */
  static gid.gstrtsp1.types.RTSPResult create(gid.gstrtsp1.rtspurl.RTSPUrl url, out gid.gstrtsp1.rtspconnection.RTSPConnection conn) nothrow
  {
    GstRTSPResult _cretval;
    GstRTSPConnection* _conn;
    _cretval = gst_rtsp_connection_create(url ? cast(const(GstRTSPUrl)*)url._cPtr(No.Dup) : null, &_conn);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_conn)
      conn = new gid.gstrtsp1.rtspconnection.RTSPConnection(cast(void*)_conn, Yes.Take);
    return _retval;
  }

  /**
      Create a new #GstRTSPConnection for handling communication on the existing
      socket socket. The initial_buffer contains zero terminated data already
      read from socket which should be used before starting to read new data.
  
      Params:
        socket = a #GSocket
        ip = the IP address of the other end
        port = the port used by the other end
        initialBuffer = data already read from fd
        conn = storage for a #GstRTSPConnection
      Returns: #GST_RTSP_OK when conn contains a valid connection.
  */
  static gid.gstrtsp1.types.RTSPResult createFromSocket(gid.gio2.socket.Socket socket, string ip, ushort port, string initialBuffer, out gid.gstrtsp1.rtspconnection.RTSPConnection conn) nothrow
  {
    GstRTSPResult _cretval;
    const(char)* _ip = ip.toCString!(No.Malloc, No.Nullable);
    const(char)* _initialBuffer = initialBuffer.toCString!(No.Malloc, No.Nullable);
    GstRTSPConnection* _conn;
    _cretval = gst_rtsp_connection_create_from_socket(socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, _ip, port, _initialBuffer, &_conn);
    gid.gstrtsp1.types.RTSPResult _retval = cast(gid.gstrtsp1.types.RTSPResult)_cretval;
    if (_conn)
      conn = new gid.gstrtsp1.rtspconnection.RTSPConnection(cast(void*)_conn, Yes.Take);
    return _retval;
  }
}
