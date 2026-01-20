/// Module for [SocketListener] class
module gio.socket_listener;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.socket;
import gio.socket_address;
import gio.socket_connection;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    A [gio.socket_listener.SocketListener] is an object that keeps track of a set
    of server sockets and helps you accept sockets from any of the
    socket, either sync or async.
    
    Add addresses and ports to listen on using
    [gio.socket_listener.SocketListener.addAddress] and
    [gio.socket_listener.SocketListener.addInetPort]. These will be listened on until
    [gio.socket_listener.SocketListener.close] is called. Dropping your final reference to
    the [gio.socket_listener.SocketListener] will not cause [gio.socket_listener.SocketListener.close] to be
    called implicitly, as some references to the [gio.socket_listener.SocketListener] may be held
    internally.
    
    If you want to implement a network server, also look at
    [gio.socket_service.SocketService] and [gio.threaded_socket_service.ThreadedSocketService] which are
    subclasses of [gio.socket_listener.SocketListener] that make this even easier.
*/
class SocketListener : gobject.object.ObjectWrap
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
    return cast(void function())g_socket_listener_get_type != &gidSymbolNotFound ? g_socket_listener_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketListener self()
  {
    return this;
  }

  /**
      Get `listenBacklog` property.
      Returns: The number of outstanding connections in the listen queue.
  */
  @property int listenBacklog()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("listen-backlog");
  }

  /**
      Set `listenBacklog` property.
      Params:
        propval = The number of outstanding connections in the listen queue.
  */
  @property void listenBacklog(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("listen-backlog", propval);
  }

  /**
      Creates a new #GSocketListener with no sockets to listen for.
      New listeners can be added with e.g. [gio.socket_listener.SocketListener.addAddress]
      or [gio.socket_listener.SocketListener.addInetPort].
      Returns: a new #GSocketListener.
  */
  this()
  {
    GSocketListener* _cretval;
    _cretval = g_socket_listener_new();
    this(_cretval, Yes.Take);
  }

  /**
      Blocks waiting for a client to connect to any of the sockets added
      to the listener. Returns a #GSocketConnection for the socket that was
      accepted.
      
      If source_object is not null it will be filled out with the source
      object specified when the corresponding socket or address was added
      to the listener.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        sourceObject = location where #GObject pointer will be stored, or null
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection accept(out gobject.object.ObjectWrap sourceObject, gio.cancellable.Cancellable cancellable = null)
  {
    GSocketConnection* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept(cast(GSocketListener*)this._cPtr, &_sourceObject, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    sourceObject = new gobject.object.ObjectWrap(cast(void*)_sourceObject, No.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of [gio.socket_listener.SocketListener.accept].
      
      When the operation is finished callback will be
      called. You can then call [gio.socket_listener.SocketListener.acceptFinish]
      to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void acceptAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_listener_accept_async(cast(GSocketListener*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async accept operation. See [gio.socket_listener.SocketListener.acceptAsync]
  
      Params:
        result = a #GAsyncResult.
        sourceObject = Optional #GObject identifying this source
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket_connection.SocketConnection acceptFinish(gio.async_result.AsyncResult result, out gobject.object.ObjectWrap sourceObject)
  {
    GSocketConnection* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept_finish(cast(GSocketListener*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_sourceObject, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    sourceObject = new gobject.object.ObjectWrap(cast(void*)_sourceObject, No.Take);
    return _retval;
  }

  /**
      Blocks waiting for a client to connect to any of the sockets added
      to the listener. Returns the #GSocket that was accepted.
      
      If you want to accept the high-level #GSocketConnection, not a #GSocket,
      which is often the case, then you should use [gio.socket_listener.SocketListener.accept]
      instead.
      
      If source_object is not null it will be filled out with the source
      object specified when the corresponding socket or address was added
      to the listener.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gio.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        sourceObject = location where #GObject pointer will be stored, or null.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocket on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket.Socket acceptSocket(out gobject.object.ObjectWrap sourceObject, gio.cancellable.Cancellable cancellable = null)
  {
    GSocket* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept_socket(cast(GSocketListener*)this._cPtr, &_sourceObject, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket.Socket)(cast(GSocket*)_cretval, Yes.Take);
    sourceObject = new gobject.object.ObjectWrap(cast(void*)_sourceObject, No.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of [gio.socket_listener.SocketListener.acceptSocket].
      
      When the operation is finished callback will be
      called. You can then call [gio.socket_listener.SocketListener.acceptSocketFinish]
      to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void acceptSocketAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_listener_accept_socket_async(cast(GSocketListener*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async accept operation. See [gio.socket_listener.SocketListener.acceptSocketAsync]
  
      Params:
        result = a #GAsyncResult.
        sourceObject = Optional #GObject identifying this source
      Returns: a #GSocket on success, null on error.
      Throws: [ErrorWrap]
  */
  gio.socket.Socket acceptSocketFinish(gio.async_result.AsyncResult result, out gobject.object.ObjectWrap sourceObject)
  {
    GSocket* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept_socket_finish(cast(GSocketListener*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_sourceObject, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket.Socket)(cast(GSocket*)_cretval, Yes.Take);
    sourceObject = new gobject.object.ObjectWrap(cast(void*)_sourceObject, No.Take);
    return _retval;
  }

  /**
      Creates a socket of type type and protocol protocol, binds
      it to address and adds it to the set of sockets we're accepting
      sockets from.
      
      Note that adding an IPv6 address, depending on the platform,
      may or may not result in a listener that also accepts IPv4
      connections.  For more deterministic behavior, see
      [gio.socket_listener.SocketListener.addInetPort].
      
      source_object will be passed out in the various calls
      to accept to identify this particular source, which is
      useful if you're listening on multiple addresses and do
      different things depending on what address is connected to.
      
      If successful and effective_address is non-null then it will
      be set to the address that the binding actually occurred at.  This
      is helpful for determining the port number that was used for when
      requesting a binding to port 0 (ie: "any port").  This address, if
      requested, belongs to the caller and must be freed.
      
      Call [gio.socket_listener.SocketListener.close] to stop listening on address; this will not
      be done automatically when you drop your final reference to listener, as
      references may be held internally.
  
      Params:
        address = a #GSocketAddress
        type = a #GSocketType
        protocol = a #GSocketProtocol
        sourceObject = Optional #GObject identifying this source
        effectiveAddress = location to store the address that was bound to, or null.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool addAddress(gio.socket_address.SocketAddress address, gio.types.SocketType type, gio.types.SocketProtocol protocol, gobject.object.ObjectWrap sourceObject, out gio.socket_address.SocketAddress effectiveAddress)
  {
    bool _retval;
    GSocketAddress* _effectiveAddress;
    GError *_err;
    _retval = cast(bool)g_socket_listener_add_address(cast(GSocketListener*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, type, protocol, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_effectiveAddress, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    effectiveAddress = new gio.socket_address.SocketAddress(cast(void*)_effectiveAddress, Yes.Take);
    return _retval;
  }

  /**
      Listens for TCP connections on any available port number for both
      IPv6 and IPv4 (if each is available).
      
      This is useful if you need to have a socket for incoming connections
      but don't care about the specific port number.
      
      source_object will be passed out in the various calls
      to accept to identify this particular source, which is
      useful if you're listening on multiple addresses and do
      different things depending on what address is connected to.
  
      Params:
        sourceObject = Optional #GObject identifying this source
      Returns: the port number, or 0 in case of failure.
      Throws: [ErrorWrap]
  */
  ushort addAnyInetPort(gobject.object.ObjectWrap sourceObject = null)
  {
    ushort _retval;
    GError *_err;
    _retval = g_socket_listener_add_any_inet_port(cast(GSocketListener*)this._cPtr, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Helper function for [gio.socket_listener.SocketListener.addAddress] that
      creates a TCP/IP socket listening on IPv4 and IPv6 (if
      supported) on the specified port on all interfaces.
      
      source_object will be passed out in the various calls
      to accept to identify this particular source, which is
      useful if you're listening on multiple addresses and do
      different things depending on what address is connected to.
      
      Call [gio.socket_listener.SocketListener.close] to stop listening on port; this will not
      be done automatically when you drop your final reference to listener, as
      references may be held internally.
  
      Params:
        port = an IP port number (non-zero)
        sourceObject = Optional #GObject identifying this source
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool addInetPort(ushort port, gobject.object.ObjectWrap sourceObject = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_listener_add_inet_port(cast(GSocketListener*)this._cPtr, port, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Adds socket to the set of sockets that we try to accept
      new clients from. The socket must be bound to a local
      address and listened to.
      
      source_object will be passed out in the various calls
      to accept to identify this particular source, which is
      useful if you're listening on multiple addresses and do
      different things depending on what address is connected to.
      
      The socket will not be automatically closed when the listener is finalized
      unless the listener held the final reference to the socket. Before GLib 2.42,
      the socket was automatically closed on finalization of the listener, even
      if references to it were held elsewhere.
  
      Params:
        socket = a listening #GSocket
        sourceObject = Optional #GObject identifying this source
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool addSocket(gio.socket.Socket socket, gobject.object.ObjectWrap sourceObject = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_listener_add_socket(cast(GSocketListener*)this._cPtr, socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Closes all the sockets in the listener.
  */
  void close()
  {
    g_socket_listener_close(cast(GSocketListener*)this._cPtr);
  }

  /**
      Sets the listen backlog on the sockets in the listener. This must be called
      before adding any sockets, addresses or ports to the #GSocketListener (for
      example, by calling [gio.socket_listener.SocketListener.addInetPort]) to be effective.
      
      See [gio.socket.Socket.setListenBacklog] for details
  
      Params:
        listenBacklog = an integer
  */
  void setBacklog(int listenBacklog)
  {
    g_socket_listener_set_backlog(cast(GSocketListener*)this._cPtr, listenBacklog);
  }

  /**
      Connect to `Event` signal.
  
      Emitted when listener's activity on socket changes state.
        Note that when listener is used to listen on both IPv4 and
        IPv6, a separate set of signals will be emitted for each, and
        the order they happen in is undefined.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.types.SocketListenerEvent event, gio.socket.Socket socket, gio.socket_listener.SocketListener socketListener))
  
          `event` the event that is occurring (optional)
  
          `socket` the #GSocket the event is occurring on (optional)
  
          `socketListener` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEvent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gio.types.SocketListenerEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.socket.Socket)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.socket_listener.SocketListener)))
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
    return connectSignalClosure("event", closure, after);
  }
}
