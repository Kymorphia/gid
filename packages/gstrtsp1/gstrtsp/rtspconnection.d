/// Module for [RTSPConnection] class
module gstrtsp.rtspconnection;

import gid.gid;
import gio.cancellable;
import gio.socket;
import gio.tls_certificate;
import gio.tls_connection;
import gio.tls_database;
import gio.tls_interaction;
import gio.types;
import glib.error;
import glib.time_val;
import gobject.object;
import gstrtsp.c.functions;
import gstrtsp.c.types;
import gstrtsp.rtspmessage;
import gstrtsp.rtspurl;
import gstrtsp.types;

/**
    This object manages the RTSP connection to the server. It provides function
    to receive and send bytes and messages.
*/
class RTSPConnection
{
  GstRTSPConnection* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtsp.rtspconnection.RTSPConnection");

    cInstancePtr = cast(GstRTSPConnection*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Add header to be appended to any HTTP request made by connection.
      If the header already exists then the old header is replaced by the new header.
      
      Only applicable in HTTP tunnel mode.
  
      Params:
        key = HTTP header name
        value = HTTP header value
  */
  void addExtraHttpRequestHeader(string key, string value)
  {
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    gst_rtsp_connection_add_extra_http_request_header(cast(GstRTSPConnection*)this._cPtr, _key, _value);
  }

  /**
      Clear the list of authentication directives stored in conn.
  */
  void clearAuthParams()
  {
    gst_rtsp_connection_clear_auth_params(cast(GstRTSPConnection*)this._cPtr);
  }

  /**
      Close the connected conn. After this call, the connection is in the same
      state as when it was first created.
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult close()
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_close(cast(GstRTSPConnection*)this._cPtr);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gstrtsp.rtspconnection.RTSPConnection.create]. If timeout is null this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a GTimeVal timeout
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gstrtsp.types.RTSPResult connect(glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect(cast(GstRTSPConnection*)this._cPtr, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gstrtsp.rtspconnection.RTSPConnection.create]. If timeout is 0 this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a timeout in microseconds
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gstrtsp.types.RTSPResult connectUsec(long timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect_usec(cast(GstRTSPConnection*)this._cPtr, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gstrtsp.rtspconnection.RTSPConnection.create]. If timeout is null this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.  If conn is set to tunneled,
      response will contain a response to the tunneling request messages.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a GTimeVal timeout
        response = a #GstRTSPMessage
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gstrtsp.types.RTSPResult connectWithResponse(glib.time_val.TimeVal timeout, gstrtsp.rtspmessage.RTSPMessage response)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect_with_response(cast(GstRTSPConnection*)this._cPtr, timeout ? cast(GTimeVal*)timeout._cPtr : null, response ? cast(GstRTSPMessage*)response._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to connect to the url of conn made with
      [gstrtsp.rtspconnection.RTSPConnection.create]. If timeout is 0 this function can block
      forever. If timeout contains a valid timeout, this function will return
      #GST_RTSP_ETIMEOUT after the timeout expired.  If conn is set to tunneled,
      response will contain a response to the tunneling request messages.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        timeout = a timeout in microseconds
        response = a #GstRTSPMessage
      Returns: #GST_RTSP_OK when a connection could be made.
  */
  gstrtsp.types.RTSPResult connectWithResponseUsec(long timeout, gstrtsp.rtspmessage.RTSPMessage response)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_connect_with_response_usec(cast(GstRTSPConnection*)this._cPtr, timeout, response ? cast(GstRTSPMessage*)response._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      If conn received the first tunnel connection and conn2 received
      the second tunnel connection, link the two connections together so that
      conn manages the tunneled connection.
      
      After this call, conn2 cannot be used anymore and must be freed with
      [gstrtsp.rtspconnection.RTSPConnection.free].
      
      If conn2 is null then only the base64 decoding context will be setup for
      conn.
  
      Params:
        conn2 = a #GstRTSPConnection or null
      Returns: return GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult doTunnel(gstrtsp.rtspconnection.RTSPConnection conn2 = null)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_do_tunnel(cast(GstRTSPConnection*)this._cPtr, conn2 ? cast(GstRTSPConnection*)conn2._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
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
  gstrtsp.types.RTSPResult flush(bool flush)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_flush(cast(GstRTSPConnection*)this._cPtr, flush);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Get the ignore_x_server_reply value.
      Returns: returns true if the x-server-ip-address header reply will be
                 ignored, else returns false
  */
  bool getIgnoreXServerReply()
  {
    bool _retval;
    _retval = cast(bool)gst_rtsp_connection_get_ignore_x_server_reply(cast(const(GstRTSPConnection)*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the IP address of the other end of conn.
      Returns: The IP address as a string. this value remains valid until the
        connection is closed.
  */
  string getIp()
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_connection_get_ip(cast(const(GstRTSPConnection)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the file descriptor for reading.
      Returns: the file descriptor used for reading or null on
        error. The file descriptor remains valid until the connection is closed.
  */
  gio.socket.Socket getReadSocket()
  {
    GSocket* _cretval;
    _cretval = gst_rtsp_connection_get_read_socket(cast(const(GstRTSPConnection)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket.Socket)(cast(GSocket*)_cretval, No.Take);
    return _retval;
  }

  /** */
  bool getRememberSessionId()
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
  gio.tls_connection.TlsConnection getTls()
  {
    GTlsConnection* _cretval;
    GError *_err;
    _cretval = gst_rtsp_connection_get_tls(cast(GstRTSPConnection*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_connection.TlsConnection)(cast(GTlsConnection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the anchor certificate authorities database that will be used
      after a server certificate can't be verified with the default
      certificate database.
      Returns: the anchor certificate authorities database, or NULL if no
        database has been previously set. Use [gobject.object.ObjectWrap.unref] to release the
        certificate database.
  */
  gio.tls_database.TlsDatabase getTlsDatabase()
  {
    GTlsDatabase* _cretval;
    _cretval = gst_rtsp_connection_get_tls_database(cast(GstRTSPConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_database.TlsDatabase)(cast(GTlsDatabase*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a #GTlsInteraction object to be used when the connection or certificate
      database need to interact with the user. This will be used to prompt the
      user for passwords where necessary.
      Returns: a reference on the #GTlsInteraction. Use
        [gobject.object.ObjectWrap.unref] to release.
  */
  gio.tls_interaction.TlsInteraction getTlsInteraction()
  {
    GTlsInteraction* _cretval;
    _cretval = gst_rtsp_connection_get_tls_interaction(cast(GstRTSPConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_interaction.TlsInteraction)(cast(GTlsInteraction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the TLS validation flags used to verify the peer certificate
      when a TLS connection is established.
      
      GLib guarantees that if certificate verification fails, at least one error
      will be set, but it does not guarantee that all possible errors will be
      set. Accordingly, you may not safely decide to ignore any particular type
      of error.
      
      For example, it would be incorrect to ignore [gio.types.TlsCertificateFlags.Expired] if
      you want to allow expired certificates, because this could potentially be
      the only error flag set even if other problems exist with the certificate.
      Returns: the validation flags.
  */
  gio.types.TlsCertificateFlags getTlsValidationFlags()
  {
    GTlsCertificateFlags _cretval;
    _cretval = gst_rtsp_connection_get_tls_validation_flags(cast(GstRTSPConnection*)this._cPtr);
    gio.types.TlsCertificateFlags _retval = cast(gio.types.TlsCertificateFlags)_cretval;
    return _retval;
  }

  /**
      Get the tunnel session id the connection.
      Returns: returns a non-empty string if conn is being tunneled over HTTP.
  */
  string getTunnelid()
  {
    const(char)* _cretval;
    _cretval = gst_rtsp_connection_get_tunnelid(cast(const(GstRTSPConnection)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Retrieve the URL of the other end of conn.
      Returns: The URL. This value remains valid until the
        connection is freed.
  */
  gstrtsp.rtspurl.RTSPUrl getUrl()
  {
    GstRTSPUrl* _cretval;
    _cretval = gst_rtsp_connection_get_url(cast(const(GstRTSPConnection)*)this._cPtr);
    auto _retval = _cretval ? new gstrtsp.rtspurl.RTSPUrl(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the file descriptor for writing.
      Returns: the file descriptor used for writing or NULL on
        error. The file descriptor remains valid until the connection is closed.
  */
  gio.socket.Socket getWriteSocket()
  {
    GSocket* _cretval;
    _cretval = gst_rtsp_connection_get_write_socket(cast(const(GstRTSPConnection)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket.Socket)(cast(GSocket*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the tunneling state of the connection.
      Returns: if conn is using HTTP tunneling.
  */
  bool isTunneled()
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
  gstrtsp.types.RTSPResult nextTimeout(glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_next_timeout(cast(GstRTSPConnection*)this._cPtr, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Calculate the next timeout for conn
      Returns: #the next timeout in microseconds
  */
  long nextTimeoutUsec()
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
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        events = a bitmask of #GstRTSPEvent flags to check
        revents = location for result flags
        timeout = a timeout
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult poll(gstrtsp.types.RTSPEvent events, out gstrtsp.types.RTSPEvent revents, glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_poll(cast(GstRTSPConnection*)this._cPtr, events, &revents, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Wait up to the specified timeout for the connection to become available for
      at least one of the operations specified in events. When the function returns
      with #GST_RTSP_OK, revents will contain a bitmask of available operations on
      conn.
      
      timeout can be 0, in which case this function might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        events = a bitmask of #GstRTSPEvent flags to check
        revents = location for result flags
        timeout = a timeout in microseconds
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult pollUsec(gstrtsp.types.RTSPEvent events, out gstrtsp.types.RTSPEvent revents, long timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_poll_usec(cast(GstRTSPConnection*)this._cPtr, events, &revents, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read size bytes into data from the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to read
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult read(ubyte[] data, glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtsp_connection_read(cast(GstRTSPConnection*)this._cPtr, _data, _size, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read size bytes into data from the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to read
        timeout = a timeout value in microseconds
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult readUsec(ubyte[] data, long timeout)
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtsp_connection_read_usec(cast(GstRTSPConnection*)this._cPtr, _data, _size, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read into message from the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to read
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult receive(gstrtsp.rtspmessage.RTSPMessage message, glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_receive(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to read into message from the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to read
        timeout = a timeout value or 0
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult receiveUsec(gstrtsp.rtspmessage.RTSPMessage message, long timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_receive_usec(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Reset the timeout of conn.
      Returns: #GST_RTSP_OK.
  */
  gstrtsp.types.RTSPResult resetTimeout()
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_reset_timeout(cast(GstRTSPConnection*)this._cPtr);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send message to the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to send
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult send(gstrtsp.rtspmessage.RTSPMessage message, glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_send(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send messages to the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        messages = the messages to send
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult sendMessages(gstrtsp.rtspmessage.RTSPMessage[] messages, glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    uint _nMessages;
    if (messages)
      _nMessages = cast(uint)messages.length;

    GstRTSPMessage[] _tmpmessages;
    foreach (obj; messages)
      _tmpmessages ~= *cast(GstRTSPMessage*)obj._cPtr;
    GstRTSPMessage* _messages = _tmpmessages.ptr;
    _cretval = gst_rtsp_connection_send_messages(cast(GstRTSPConnection*)this._cPtr, _messages, _nMessages, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send messages to the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        messages = the messages to send
        timeout = a timeout value in microseconds
      Returns: #GST_RTSP_OK on Since.
  */
  gstrtsp.types.RTSPResult sendMessagesUsec(gstrtsp.rtspmessage.RTSPMessage[] messages, long timeout)
  {
    GstRTSPResult _cretval;
    uint _nMessages;
    if (messages)
      _nMessages = cast(uint)messages.length;

    GstRTSPMessage[] _tmpmessages;
    foreach (obj; messages)
      _tmpmessages ~= *cast(GstRTSPMessage*)obj._cPtr;
    GstRTSPMessage* _messages = _tmpmessages.ptr;
    _cretval = gst_rtsp_connection_send_messages_usec(cast(GstRTSPConnection*)this._cPtr, _messages, _nMessages, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to send message to the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        message = the message to send
        timeout = a timeout value in microseconds
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult sendUsec(gstrtsp.rtspmessage.RTSPMessage message, long timeout)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_send_usec(cast(GstRTSPConnection*)this._cPtr, message ? cast(GstRTSPMessage*)message._cPtr(No.Dup) : null, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
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
  void setAcceptCertificateFunc(gstrtsp.types.RTSPConnectionAcceptCertificateFunc func)
  {
    extern(C) gboolean _funcCallback(GTlsConnection* conn, GTlsCertificate* peerCert, GTlsCertificateFlags errors, void* userData)
    {
      auto _dlg = cast(gstrtsp.types.RTSPConnectionAcceptCertificateFunc*)userData;

      gboolean _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.tls_connection.TlsConnection)(cast(void*)conn, No.Take), gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(void*)peerCert, No.Take), errors);
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
  gstrtsp.types.RTSPResult setAuth(gstrtsp.types.RTSPAuthMethod method, string user, string pass)
  {
    GstRTSPResult _cretval;
    const(char)* _user = user.toCString(No.Alloc);
    const(char)* _pass = pass.toCString(No.Alloc);
    _cretval = gst_rtsp_connection_set_auth(cast(GstRTSPConnection*)this._cPtr, method, _user, _pass);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
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
  void setAuthParam(string param, string value)
  {
    const(char)* _param = param.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    gst_rtsp_connection_set_auth_param(cast(GstRTSPConnection*)this._cPtr, _param, _value);
  }

  /**
      Configure conn to use the specified Content-Length limit.
      Both requests and responses are validated. If content-length is
      exceeded, ENOMEM error will be returned.
  
      Params:
        limit = Content-Length limit
  */
  void setContentLengthLimit(uint limit)
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
  void setHttpMode(bool enable)
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
  void setIgnoreXServerReply(bool ignore)
  {
    gst_rtsp_connection_set_ignore_x_server_reply(cast(GstRTSPConnection*)this._cPtr, ignore);
  }

  /**
      Set the IP address of the server.
  
      Params:
        ip = an ip address
  */
  void setIp(string ip)
  {
    const(char)* _ip = ip.toCString(No.Alloc);
    gst_rtsp_connection_set_ip(cast(GstRTSPConnection*)this._cPtr, _ip);
  }

  /**
      Set the proxy host and port.
  
      Params:
        host = the proxy host
        port = the proxy port
      Returns: #GST_RTSP_OK.
  */
  gstrtsp.types.RTSPResult setProxy(string host, uint port)
  {
    GstRTSPResult _cretval;
    const(char)* _host = host.toCString(No.Alloc);
    _cretval = gst_rtsp_connection_set_proxy(cast(GstRTSPConnection*)this._cPtr, _host, port);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Configure conn to use the specified DSCP value.
  
      Params:
        qosDscp = DSCP value
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult setQosDscp(uint qosDscp)
  {
    GstRTSPResult _cretval;
    _cretval = gst_rtsp_connection_set_qos_dscp(cast(GstRTSPConnection*)this._cPtr, qosDscp);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Sets if the #GstRTSPConnection should remember the session id from the last
      response received and force it onto any further requests.
      
      The default value is true
  
      Params:
        remember = true if the connection should remember the session id
  */
  void setRememberSessionId(bool remember)
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
  void setTlsDatabase(gio.tls_database.TlsDatabase database = null)
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
  void setTlsInteraction(gio.tls_interaction.TlsInteraction interaction = null)
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
      
      For example, it would be incorrect to mask [gio.types.TlsCertificateFlags.Expired] if
      you want to allow expired certificates, because this could potentially be
      the only error flag set even if other problems exist with the certificate.
  
      Params:
        flags = the validation flags.
      Returns: TRUE if the validation flags are set correctly, or FALSE if
        conn is NULL or is not a TLS connection.
  */
  bool setTlsValidationFlags(gio.types.TlsCertificateFlags flags)
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
  void setTunneled(bool tunneled)
  {
    gst_rtsp_connection_set_tunneled(cast(GstRTSPConnection*)this._cPtr, tunneled);
  }

  /**
      Attempt to write size bytes of data to the connected conn, blocking up to
      the specified timeout. timeout can be null, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to write
        timeout = a timeout value or null
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult write(ubyte[] data, glib.time_val.TimeVal timeout)
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _cretval = gst_rtsp_connection_write(cast(GstRTSPConnection*)this._cPtr, _data, _size, timeout ? cast(GTimeVal*)timeout._cPtr : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    return _retval;
  }

  /**
      Attempt to write size bytes of data to the connected conn, blocking up to
      the specified timeout. timeout can be 0, in which case this function
      might block forever.
      
      This function can be cancelled with [gstrtsp.rtspconnection.RTSPConnection.flush].
  
      Params:
        data = the data to write
        timeout = a timeout value or 0
      Returns: #GST_RTSP_OK on success.
  */
  gstrtsp.types.RTSPResult writeUsec(ubyte[] data, long timeout)
  {
    GstRTSPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _cretval = gst_rtsp_connection_write_usec(cast(GstRTSPConnection*)this._cPtr, _data, _size, timeout);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
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
  static gstrtsp.types.RTSPResult accept(gio.socket.Socket socket, out gstrtsp.rtspconnection.RTSPConnection conn, gio.cancellable.Cancellable cancellable = null)
  {
    GstRTSPResult _cretval;
    GstRTSPConnection* _conn;
    _cretval = gst_rtsp_connection_accept(socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, &_conn, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    conn = new gstrtsp.rtspconnection.RTSPConnection(cast(void*)_conn, Yes.Take);
    return _retval;
  }

  /**
      Create a newly allocated #GstRTSPConnection from url and store it in conn.
      The connection will not yet attempt to connect to url, use
      [gstrtsp.rtspconnection.RTSPConnection.connect].
      
      A copy of url will be made.
  
      Params:
        url = a #GstRTSPUrl
        conn = storage for a #GstRTSPConnection
      Returns: #GST_RTSP_OK when conn contains a valid connection.
  */
  static gstrtsp.types.RTSPResult create(gstrtsp.rtspurl.RTSPUrl url, out gstrtsp.rtspconnection.RTSPConnection conn)
  {
    GstRTSPResult _cretval;
    GstRTSPConnection* _conn;
    _cretval = gst_rtsp_connection_create(url ? cast(const(GstRTSPUrl)*)url._cPtr(No.Dup) : null, &_conn);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    conn = new gstrtsp.rtspconnection.RTSPConnection(cast(void*)_conn, Yes.Take);
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
  static gstrtsp.types.RTSPResult createFromSocket(gio.socket.Socket socket, string ip, ushort port, string initialBuffer, out gstrtsp.rtspconnection.RTSPConnection conn)
  {
    GstRTSPResult _cretval;
    const(char)* _ip = ip.toCString(No.Alloc);
    const(char)* _initialBuffer = initialBuffer.toCString(No.Alloc);
    GstRTSPConnection* _conn;
    _cretval = gst_rtsp_connection_create_from_socket(socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, _ip, port, _initialBuffer, &_conn);
    gstrtsp.types.RTSPResult _retval = cast(gstrtsp.types.RTSPResult)_cretval;
    conn = new gstrtsp.rtspconnection.RTSPConnection(cast(void*)_conn, Yes.Take);
    return _retval;
  }
}
