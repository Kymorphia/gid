/// Module for [WebsocketConnection] class
module soup.websocket_connection;

import gid.gid;
import gio.iostream;
import glib.bytes;
import glib.error;
import glib.uri;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.types;
import soup.websocket_extension;

/**
    The WebSocket Protocol
    
    Provides support for the [WebSocket](http://tools.ietf.org/html/rfc6455)
    protocol.
    
    To connect to a WebSocket server, create a `class@Session` and call
    [soup.session.Session.websocketConnectAsync]. To accept WebSocket
    connections, create a `class@Server` and add a handler to it with
    [soup.server.Server.addWebsocketHandler].
    
    (Lower-level support is available via
    `func@websocket_client_prepare_handshake` and
    `func@websocket_client_verify_handshake`, for handling the client side of the
    WebSocket handshake, and `func@websocket_server_process_handshake` for
    handling the server side.)
    
    #SoupWebsocketConnection handles the details of WebSocket communication. You
    can use [soup.websocket_connection.WebsocketConnection.sendText] and
    [soup.websocket_connection.WebsocketConnection.sendBinary] to send data, and the
    `signal@WebsocketConnection::message` signal to receive data.
    (#SoupWebsocketConnection currently only supports asynchronous I/O.)
*/
class WebsocketConnection : gobject.object.ObjectWrap
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
    return cast(void function())soup_websocket_connection_get_type != &gidSymbolNotFound ? soup_websocket_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WebsocketConnection self()
  {
    return this;
  }

  /**
  Get builder for [soup.websocket_connection.WebsocketConnection]
  Returns: New builder object
  */
  static WebsocketConnectionGidBuilder builder()
  {
    return new WebsocketConnectionGidBuilder;
  }

  /**
      Get `connectionType` property.
      Returns: The type of connection (client/server).
  */
  @property soup.types.WebsocketConnectionType connectionType()
  {
    return getConnectionType();
  }

  /**
      Get `extensions` property.
      Returns: List of `class@WebsocketExtension` objects that are active in the connection.
  */
  @property void* extensions()
  {
    return gobject.object.ObjectWrap.getProperty!(void*)("extensions");
  }

  /**
      Get `ioStream` property.
      Returns: The underlying IO stream the WebSocket is communicating
        over.
        
        The input and output streams must be pollable streams.
  */
  @property gio.iostream.IOStream ioStream()
  {
    return getIoStream();
  }

  /**
      Get `keepaliveInterval` property.
      Returns: Interval in seconds on when to send a ping message which will
        serve as a keepalive message.
        
        If set to 0 the keepalive message is disabled.
  */
  @property uint keepaliveInterval()
  {
    return getKeepaliveInterval();
  }

  /**
      Set `keepaliveInterval` property.
      Params:
        propval = Interval in seconds on when to send a ping message which will
          serve as a keepalive message.
          
          If set to 0 the keepalive message is disabled.
  */
  @property void keepaliveInterval(uint propval)
  {
    setKeepaliveInterval(propval);
  }

  /**
      Get `maxIncomingPayloadSize` property.
      Returns: The maximum payload size for incoming packets.
        
        The protocol expects or 0 to not limit it.
  */
  @property ulong maxIncomingPayloadSize()
  {
    return getMaxIncomingPayloadSize();
  }

  /**
      Set `maxIncomingPayloadSize` property.
      Params:
        propval = The maximum payload size for incoming packets.
          
          The protocol expects or 0 to not limit it.
  */
  @property void maxIncomingPayloadSize(ulong propval)
  {
    setMaxIncomingPayloadSize(propval);
  }

  /**
      Get `origin` property.
      Returns: The client's Origin.
  */
  @property string origin()
  {
    return getOrigin();
  }

  /**
      Get `protocol` property.
      Returns: The chosen protocol, or null if a protocol was not agreed
        upon.
  */
  @property string protocol()
  {
    return getProtocol();
  }

  /**
      Get `state` property.
      Returns: The current state of the WebSocket.
  */
  @property soup.types.WebsocketState state()
  {
    return getState();
  }

  /**
      Get `uri` property.
      Returns: The URI of the WebSocket.
        
        For servers this represents the address of the WebSocket,
        and for clients it is the address connected to.
  */
  @property glib.uri.Uri uri()
  {
    return getUri();
  }

  /**
      Close the connection in an orderly fashion.
      
      Note that until the `signalWebsocketConnection::closed` signal fires, the connection
      is not yet completely closed. The close message is not even sent until the
      main loop runs.
      
      The code and data are sent to the peer along with the close request.
      If code is [soup.types.WebsocketCloseCode.NoStatus] a close message with no body
      (without code and data) is sent.
      Note that the data must be UTF-8 valid.
  
      Params:
        code = close code
        data = close data
  */
  void close(ushort code, string data = null)
  {
    const(char)* _data = data.toCString(No.Alloc);
    soup_websocket_connection_close(cast(SoupWebsocketConnection*)this._cPtr, code, _data);
  }

  /**
      Get the close code received from the WebSocket peer.
      
      This only becomes valid once the WebSocket is in the
      [soup.types.WebsocketState.Closed] state. The value will often be in the
      `enumWebsocketCloseCode` enumeration, but may also be an application
      defined close code.
      Returns: the close code or zero.
  */
  ushort getCloseCode()
  {
    ushort _retval;
    _retval = soup_websocket_connection_get_close_code(cast(SoupWebsocketConnection*)this._cPtr);
    return _retval;
  }

  /**
      Get the close data received from the WebSocket peer.
      
      This only becomes valid once the WebSocket is in the
      [soup.types.WebsocketState.Closed] state. The data may be freed once
      the main loop is run, so copy it if you need to keep it around.
      Returns: the close data or null
  */
  string getCloseData()
  {
    const(char)* _cretval;
    _cretval = soup_websocket_connection_get_close_data(cast(SoupWebsocketConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the connection type (client/server) of the connection.
      Returns: the connection type
  */
  soup.types.WebsocketConnectionType getConnectionType()
  {
    SoupWebsocketConnectionType _cretval;
    _cretval = soup_websocket_connection_get_connection_type(cast(SoupWebsocketConnection*)this._cPtr);
    soup.types.WebsocketConnectionType _retval = cast(soup.types.WebsocketConnectionType)_cretval;
    return _retval;
  }

  /**
      Get the extensions chosen via negotiation with the peer.
      Returns: a #GList of #SoupWebsocketExtension objects
  */
  soup.websocket_extension.WebsocketExtension[] getExtensions()
  {
    GList* _cretval;
    _cretval = soup_websocket_connection_get_extensions(cast(SoupWebsocketConnection*)this._cPtr);
    auto _retval = gListToD!(soup.websocket_extension.WebsocketExtension, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Get the I/O stream the WebSocket is communicating over.
      Returns: the WebSocket's I/O stream.
  */
  gio.iostream.IOStream getIoStream()
  {
    GIOStream* _cretval;
    _cretval = soup_websocket_connection_get_io_stream(cast(SoupWebsocketConnection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.iostream.IOStream)(cast(GIOStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the keepalive interval in seconds or 0 if disabled.
      Returns: the keepalive interval.
  */
  uint getKeepaliveInterval()
  {
    uint _retval;
    _retval = soup_websocket_connection_get_keepalive_interval(cast(SoupWebsocketConnection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum payload size allowed for incoming packets.
      Returns: the maximum payload size.
  */
  ulong getMaxIncomingPayloadSize()
  {
    ulong _retval;
    _retval = soup_websocket_connection_get_max_incoming_payload_size(cast(SoupWebsocketConnection*)this._cPtr);
    return _retval;
  }

  /**
      Get the origin of the WebSocket.
      Returns: the origin
  */
  string getOrigin()
  {
    const(char)* _cretval;
    _cretval = soup_websocket_connection_get_origin(cast(SoupWebsocketConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the protocol chosen via negotiation with the peer.
      Returns: the chosen protocol
  */
  string getProtocol()
  {
    const(char)* _cretval;
    _cretval = soup_websocket_connection_get_protocol(cast(SoupWebsocketConnection*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the current state of the WebSocket.
      Returns: the state
  */
  soup.types.WebsocketState getState()
  {
    SoupWebsocketState _cretval;
    _cretval = soup_websocket_connection_get_state(cast(SoupWebsocketConnection*)this._cPtr);
    soup.types.WebsocketState _retval = cast(soup.types.WebsocketState)_cretval;
    return _retval;
  }

  /**
      Get the URI of the WebSocket.
      
      For servers this represents the address of the WebSocket, and
      for clients it is the address connected to.
      Returns: the URI
  */
  glib.uri.Uri getUri()
  {
    GUri* _cretval;
    _cretval = soup_websocket_connection_get_uri(cast(SoupWebsocketConnection*)this._cPtr);
    auto _retval = _cretval ? new glib.uri.Uri(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Send a binary message to the peer.
      
      If length is 0, data may be null.
      
      The message is queued to be sent and will be sent when the main loop
      is run.
  
      Params:
        data = the message contents
  */
  void sendBinary(ubyte[] data = null)
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(void)*)data.ptr;
    soup_websocket_connection_send_binary(cast(SoupWebsocketConnection*)this._cPtr, _data, _length);
  }

  /**
      Send a message of the given type to the peer. Note that this method,
      allows to send text messages containing null characters.
      
      The message is queued to be sent and will be sent when the main loop
      is run.
  
      Params:
        type = the type of message contents
        message = the message data as #GBytes
  */
  void sendMessage(soup.types.WebsocketDataType type, glib.bytes.Bytes message)
  {
    soup_websocket_connection_send_message(cast(SoupWebsocketConnection*)this._cPtr, type, message ? cast(GBytes*)message._cPtr(No.Dup) : null);
  }

  /**
      Send a null-terminated text (UTF-8) message to the peer.
      
      If you need to send text messages containing null characters use
      [soup.websocket_connection.WebsocketConnection.sendMessage] instead.
      
      The message is queued to be sent and will be sent when the main loop
      is run.
  
      Params:
        text = the message contents
  */
  void sendText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    soup_websocket_connection_send_text(cast(SoupWebsocketConnection*)this._cPtr, _text);
  }

  /**
      Sets the interval in seconds on when to send a ping message which will serve
      as a keepalive message.
      
      If set to 0 the keepalive message is disabled.
  
      Params:
        interval = the interval to send a ping message or 0 to disable it
  */
  void setKeepaliveInterval(uint interval)
  {
    soup_websocket_connection_set_keepalive_interval(cast(SoupWebsocketConnection*)this._cPtr, interval);
  }

  /**
      Sets the maximum payload size allowed for incoming packets.
      
      It does not limit the outgoing packet size.
  
      Params:
        maxIncomingPayloadSize = the maximum payload size
  */
  void setMaxIncomingPayloadSize(ulong maxIncomingPayloadSize)
  {
    soup_websocket_connection_set_max_incoming_payload_size(cast(SoupWebsocketConnection*)this._cPtr, maxIncomingPayloadSize);
  }

  /**
      Connect to `Closed` signal.
  
      Emitted when the connection has completely closed.
        
        This happens either due to an orderly close from the peer, one
        initiated via [soup.websocket_connection.WebsocketConnection.close] or a fatal error
        condition that caused a close.
        
        This signal will be emitted once.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.websocket_connection.WebsocketConnection websocketConnection))
  
          `websocketConnection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClosed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.websocket_connection.WebsocketConnection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closed", closure, after);
  }

  /**
      Connect to `Closing` signal.
  
      This signal will be emitted during an orderly close.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(soup.websocket_connection.WebsocketConnection websocketConnection))
  
          `websocketConnection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClosing(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : soup.websocket_connection.WebsocketConnection)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("closing", closure, after);
  }

  /**
      Connect to `Error` signal.
  
      Emitted when an error occurred on the WebSocket.
        
        This may be fired multiple times. Fatal errors will be followed by
        the `signalWebsocketConnection::closed` signal being emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(glib.error.ErrorWrap error, soup.websocket_connection.WebsocketConnection websocketConnection))
  
          `error` the error that occured (optional)
  
          `websocketConnection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectError(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.error.ErrorWrap)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.websocket_connection.WebsocketConnection)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("error", closure, after);
  }

  /**
      Connect to `Message` signal.
  
      Emitted when we receive a message from the peer.
        
        As a convenience, the message data will always be
        null-terminated, but the NUL byte will not be included in
        the length count.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int type, glib.bytes.Bytes message, soup.websocket_connection.WebsocketConnection websocketConnection))
  
          `type` the type of message contents (optional)
  
          `message` the message data (optional)
  
          `websocketConnection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMessage(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == glib.bytes.Bytes)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : soup.websocket_connection.WebsocketConnection)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("message", closure, after);
  }

  /**
      Connect to `Pong` signal.
  
      Emitted when we receive a Pong frame (solicited or
        unsolicited) from the peer.
        
        As a convenience, the message data will always be
        null-terminated, but the NUL byte will not be included in
        the length count.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(glib.bytes.Bytes message, soup.websocket_connection.WebsocketConnection websocketConnection))
  
          `message` the application data (if any) (optional)
  
          `websocketConnection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPong(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.bytes.Bytes)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : soup.websocket_connection.WebsocketConnection)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pong", closure, after);
  }
}

class WebsocketConnectionGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `connectionType` property.
      Params:
        propval = The type of connection (client/server).
      Returns: Builder instance for fluent chaining
  */
  T connectionType(soup.types.WebsocketConnectionType propval)
  {
    return setProperty("connection-type", propval);
  }

  /**
      Set `extensions` property.
      Params:
        propval = List of `class@WebsocketExtension` objects that are active in the connection.
      Returns: Builder instance for fluent chaining
  */
  T extensions(void* propval)
  {
    return setProperty("extensions", propval);
  }

  /**
      Set `ioStream` property.
      Params:
        propval = The underlying IO stream the WebSocket is communicating
          over.
          
          The input and output streams must be pollable streams.
      Returns: Builder instance for fluent chaining
  */
  T ioStream(gio.iostream.IOStream propval)
  {
    return setProperty("io-stream", propval);
  }

  /**
      Set `keepaliveInterval` property.
      Params:
        propval = Interval in seconds on when to send a ping message which will
          serve as a keepalive message.
          
          If set to 0 the keepalive message is disabled.
      Returns: Builder instance for fluent chaining
  */
  T keepaliveInterval(uint propval)
  {
    return setProperty("keepalive-interval", propval);
  }

  /**
      Set `maxIncomingPayloadSize` property.
      Params:
        propval = The maximum payload size for incoming packets.
          
          The protocol expects or 0 to not limit it.
      Returns: Builder instance for fluent chaining
  */
  T maxIncomingPayloadSize(ulong propval)
  {
    return setProperty("max-incoming-payload-size", propval);
  }

  /**
      Set `origin` property.
      Params:
        propval = The client's Origin.
      Returns: Builder instance for fluent chaining
  */
  T origin(string propval)
  {
    return setProperty("origin", propval);
  }

  /**
      Set `protocol` property.
      Params:
        propval = The chosen protocol, or null if a protocol was not agreed
          upon.
      Returns: Builder instance for fluent chaining
  */
  T protocol(string propval)
  {
    return setProperty("protocol", propval);
  }

  /**
      Set `uri` property.
      Params:
        propval = The URI of the WebSocket.
          
          For servers this represents the address of the WebSocket,
          and for clients it is the address connected to.
      Returns: Builder instance for fluent chaining
  */
  T uri(glib.uri.Uri propval)
  {
    return setProperty("uri", propval);
  }
}

/// Fluent builder for [soup.websocket_connection.WebsocketConnection]
final class WebsocketConnectionGidBuilder : WebsocketConnectionGidBuilderImpl!WebsocketConnectionGidBuilder
{
  WebsocketConnection build()
  {
    return new WebsocketConnection(cast(void*)createGObject(WebsocketConnection._getGType), Yes.Take);
  }
}
