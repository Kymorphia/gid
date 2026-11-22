/// Module for [SocketListener] class
module gid.gio2.socket_listener;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.socket;
import gid.gio2.socket_address;
import gid.gio2.socket_connection;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.socket_listener.SocketListener] is an object that keeps track of a set
    of server sockets and helps you accept sockets from any of the
    socket, either sync or async.
    
    Add addresses and ports to listen on using
    [gid.gio2.socket_listener.SocketListener.addAddress] and
    [gid.gio2.socket_listener.SocketListener.addInetPort]. These will be listened on until
    [gid.gio2.socket_listener.SocketListener.close] is called. Dropping your final reference to
    the [gid.gio2.socket_listener.SocketListener] will not cause [gid.gio2.socket_listener.SocketListener.close] to be
    called implicitly, as some references to the [gid.gio2.socket_listener.SocketListener] may be held
    internally.
    
    If you want to implement a network server, also look at
    [gid.gio2.socket_service.SocketService] and [gid.gio2.threaded_socket_service.ThreadedSocketService] which are
    subclasses of [gid.gio2.socket_listener.SocketListener] that make this even easier.
*/
class SocketListener : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_socket_listener_get_type != &gidSymbolNotFound ? g_socket_listener_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSocketListener";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketListener self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.socket_listener.SocketListener]
      Returns: New builder object
  */
  static SocketListenerGidBuilder builder() nothrow
  {
    return new SocketListenerGidBuilder;
  }

  /**
      Get `listenBacklog` property.
      Returns: The number of outstanding connections in the listen queue.
  */
  @property int listenBacklog() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("listen-backlog");
  }

  /**
      Set `listenBacklog` property.
      Params:
        propval = The number of outstanding connections in the listen queue.
  */
  @property void listenBacklog(int propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(int)("listen-backlog", propval);
  }

  /**
      Creates a new #GSocketListener with no sockets to listen for.
      New listeners can be added with e.g. [gid.gio2.socket_listener.SocketListener.addAddress]
      or [gid.gio2.socket_listener.SocketListener.addInetPort].
      Returns: a new #GSocketListener.
  */
  this() nothrow
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
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        sourceObject = location where #GObject pointer will be stored, or null
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_connection.SocketConnection accept(out gid.gobject2.object.ObjectWrap sourceObject, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GSocketConnection* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept(cast(GSocketListener*)this._cPtr, &_sourceObject, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    sourceObject = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(_sourceObject, No.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of [gid.gio2.socket_listener.SocketListener.accept].
      
      When the operation is finished callback will be
      called. You can then call [gid.gio2.socket_listener.SocketListener.acceptFinish]
      to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void acceptAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_listener_accept_async(cast(GSocketListener*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async accept operation. See [gid.gio2.socket_listener.SocketListener.acceptAsync]
  
      Params:
        result = a #GAsyncResult.
        sourceObject = Optional #GObject identifying this source
      Returns: a #GSocketConnection on success, null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_connection.SocketConnection acceptFinish(gid.gio2.async_result.AsyncResult result, out gid.gobject2.object.ObjectWrap sourceObject)
  {
    GSocketConnection* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept_finish(cast(GSocketListener*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_sourceObject, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_connection.SocketConnection)(cast(GSocketConnection*)_cretval, Yes.Take);
    sourceObject = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(_sourceObject, No.Take);
    return _retval;
  }

  /**
      Blocks waiting for a client to connect to any of the sockets added
      to the listener. Returns the #GSocket that was accepted.
      
      If you want to accept the high-level #GSocketConnection, not a #GSocket,
      which is often the case, then you should use [gid.gio2.socket_listener.SocketListener.accept]
      instead.
      
      If source_object is not null it will be filled out with the source
      object specified when the corresponding socket or address was added
      to the listener.
      
      If cancellable is not null, then the operation can be cancelled by
      triggering the cancellable object from another thread. If the operation
      was cancelled, the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned.
  
      Params:
        sourceObject = location where #GObject pointer will be stored, or null.
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocket on success, null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket.Socket acceptSocket(out gid.gobject2.object.ObjectWrap sourceObject, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GSocket* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept_socket(cast(GSocketListener*)this._cPtr, &_sourceObject, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket.Socket)(cast(GSocket*)_cretval, Yes.Take);
    sourceObject = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(_sourceObject, No.Take);
    return _retval;
  }

  /**
      This is the asynchronous version of [gid.gio2.socket_listener.SocketListener.acceptSocket].
      
      When the operation is finished callback will be
      called. You can then call [gid.gio2.socket_listener.SocketListener.acceptSocketFinish]
      to get the result of the operation.
  
      Params:
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback
  */
  void acceptSocketAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_listener_accept_socket_async(cast(GSocketListener*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an async accept operation. See [gid.gio2.socket_listener.SocketListener.acceptSocketAsync]
  
      Params:
        result = a #GAsyncResult.
        sourceObject = Optional #GObject identifying this source
      Returns: a #GSocket on success, null on error.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket.Socket acceptSocketFinish(gid.gio2.async_result.AsyncResult result, out gid.gobject2.object.ObjectWrap sourceObject)
  {
    GSocket* _cretval;
    GObject* _sourceObject;
    GError *_err;
    _cretval = g_socket_listener_accept_socket_finish(cast(GSocketListener*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_sourceObject, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket.Socket)(cast(GSocket*)_cretval, Yes.Take);
    sourceObject = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(_sourceObject, No.Take);
    return _retval;
  }

  /**
      Creates a socket of type type and protocol protocol, binds
      it to address and adds it to the set of sockets we're accepting
      sockets from.
      
      Note that adding an IPv6 address, depending on the platform,
      may or may not result in a listener that also accepts IPv4
      connections.  For more deterministic behavior, see
      [gid.gio2.socket_listener.SocketListener.addInetPort].
      
      source_object will be passed out in the various calls
      to accept to identify this particular source, which is
      useful if you're listening on multiple addresses and do
      different things depending on what address is connected to.
      
      If successful and effective_address is non-null then it will
      be set to the address that the binding actually occurred at.  This
      is helpful for determining the port number that was used for when
      requesting a binding to port 0 (ie: "any port").  This address, if
      requested, belongs to the caller and must be freed.
      
      Call [gid.gio2.socket_listener.SocketListener.close] to stop listening on address; this will not
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
  bool addAddress(gid.gio2.socket_address.SocketAddress address, gid.gio2.types.SocketType type, gid.gio2.types.SocketProtocol protocol, gid.gobject2.object.ObjectWrap sourceObject, out gid.gio2.socket_address.SocketAddress effectiveAddress)
  {
    bool _retval;
    GSocketAddress* _effectiveAddress;
    GError *_err;
    _retval = cast(bool)g_socket_listener_add_address(cast(GSocketListener*)this._cPtr, address ? cast(GSocketAddress*)address._cPtr(No.Dup) : null, type, protocol, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_effectiveAddress, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    effectiveAddress = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(_effectiveAddress, Yes.Take);
    return _retval;
  }

  /**
      Listens for TCP connections on any available port number for both
      IPv6 and IPv4 (if each is available).
      
      This is useful if you need to have a socket for incoming connections
      but don't care about the specific port number.
      
      If possible, the [gid.gio2.socket_listener.SocketListener] will listen on both IPv4 and
      IPv6 (listening on the same port on both). If listening on one of the socket
      families fails, the [gid.gio2.socket_listener.SocketListener] will only listen on the other.
      If listening on both fails, an error will be returned.
      
      If you need to distinguish whether listening on IPv4 or IPv6 or both was
      successful, connect to [gid.gio2.socket_listener.SocketListener.event].
      
      source_object will be passed out in the various calls
      to accept to identify this particular source, which is
      useful if you're listening on multiple addresses and do
      different things depending on what address is connected to.
  
      Params:
        sourceObject = Optional #GObject identifying this source
      Returns: the port number, or 0 in case of failure.
      Throws: [ErrorWrap]
  */
  ushort addAnyInetPort(gid.gobject2.object.ObjectWrap sourceObject = null)
  {
    ushort _retval;
    GError *_err;
    _retval = g_socket_listener_add_any_inet_port(cast(GSocketListener*)this._cPtr, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Helper function for [gid.gio2.socket_listener.SocketListener.addAddress] that
      creates a TCP/IP socket listening on IPv4 and IPv6 (if
      supported) on the specified port on all interfaces.
      
      If possible, the [gid.gio2.socket_listener.SocketListener] will listen on both IPv4 and
      IPv6 (listening on the same port on both). If listening on one of the socket
      families fails, the [gid.gio2.socket_listener.SocketListener] will only listen on the other.
      If listening on both fails, an error will be returned.
      
      If you need to distinguish whether listening on IPv4 or IPv6 or both was
      successful, connect to [gid.gio2.socket_listener.SocketListener.event].
      
      source_object will be passed out in the various calls
      to accept to identify this particular source, which is
      useful if you're listening on multiple addresses and do
      different things depending on what address is connected to.
      
      Call [gid.gio2.socket_listener.SocketListener.close] to stop listening on port; this will not
      be done automatically when you drop your final reference to listener, as
      references may be held internally.
  
      Params:
        port = an IP port number (non-zero)
        sourceObject = Optional #GObject identifying this source
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool addInetPort(ushort port, gid.gobject2.object.ObjectWrap sourceObject = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_listener_add_inet_port(cast(GSocketListener*)this._cPtr, port, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Adds socket to the set of sockets that we try to accept
      new clients from. The socket must be bound to a local
      address and listened to.
      
      For parallel calls to [gid.gio2.socket_listener.SocketListener] methods to work, the socket
      must be in non-blocking mode. (See [gid.gio2.socket.Socket.blocking].)
      
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
  bool addSocket(gid.gio2.socket.Socket socket, gid.gobject2.object.ObjectWrap sourceObject = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_socket_listener_add_socket(cast(GSocketListener*)this._cPtr, socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Closes all the sockets in the listener.
  */
  void close() nothrow
  {
    g_socket_listener_close(cast(GSocketListener*)this._cPtr);
  }

  /**
      Sets the listen backlog on the sockets in the listener. This must be called
      before adding any sockets, addresses or ports to the #GSocketListener (for
      example, by calling [gid.gio2.socket_listener.SocketListener.addInetPort]) to be effective.
      
      See [gid.gio2.socket.Socket.setListenBacklog] for details
  
      Params:
        listenBacklog = an integer
  */
  void setBacklog(int listenBacklog) nothrow
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
  
          `void callback(gid.gio2.types.SocketListenerEvent event, gid.gio2.socket.Socket socket, gid.gio2.socket_listener.SocketListener socketListener)`
  
          `event` the event that is occurring (optional)
  
          `socket` the #GSocket the event is occurring on (optional)
  
          `socketListener` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEvent(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gio2.types.SocketListenerEvent)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.socket.Socket)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.socket_listener.SocketListener)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_listener.SocketListener.event");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("event", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_listener.SocketListener]
class SocketListenerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `listenBacklog` property.
      Params:
        propval = The number of outstanding connections in the listen queue.
      Returns: Builder instance for fluent chaining
  */
  T listenBacklog(int propval) nothrow
  {
    return setProperty("listen-backlog", propval);
  }
}

/// Fluent builder for [gid.gio2.socket_listener.SocketListener]
final class SocketListenerGidBuilder : SocketListenerGidBuilderImpl!SocketListenerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketListener build() nothrow
  {
    return new SocketListener(cast(void*)createGObject(SocketListener._getGType), Yes.Take);
  }
}
