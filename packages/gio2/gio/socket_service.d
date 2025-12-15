/// Module for [SocketService] class
module gio.socket_service;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_connection;
import gio.socket_listener;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    A [gio.socket_service.SocketService] is an object that represents a service that
    is provided to the network or over local sockets.  When a new
    connection is made to the service the [gio.socket_service.SocketService.incoming]
    signal is emitted.
    
    A [gio.socket_service.SocketService] is a subclass of [gio.socket_listener.SocketListener] and you need
    to add the addresses you want to accept connections on with the
    [gio.socket_listener.SocketListener] APIs.
    
    There are two options for implementing a network service based on
    [gio.socket_service.SocketService]. The first is to create the service using
    [gio.socket_service.SocketService.new_] and to connect to the
    [gio.socket_service.SocketService.incoming] signal. The second is to subclass
    [gio.socket_service.SocketService] and override the default signal handler implementation.
    
    In either case, the handler must immediately return, or else it
    will block additional incoming connections from being serviced.
    If you are interested in writing connection handlers that contain
    blocking code then see [gio.threaded_socket_service.ThreadedSocketService].
    
    The socket service runs on the main loop of the
    thread-default context (see
    [glib.main_context.MainContext.pushThreadDefault]) of the thread it is
    created in, and is not threadsafe in general. However, the calls to start and
    stop the service are thread-safe so these can be used from threads that
    handle incoming clients.
*/
class SocketService : gio.socket_listener.SocketListener
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
    return cast(void function())g_socket_service_get_type != &gidSymbolNotFound ? g_socket_service_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketService self()
  {
    return this;
  }

  /**
      Get `active` property.
      Returns: Whether the service is currently accepting connections.
  */
  @property bool active()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("active");
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the service is currently accepting connections.
  */
  @property void active(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("active", propval);
  }

  /**
      Creates a new #GSocketService with no sockets to listen for.
      New listeners can be added with e.g. [gio.socket_listener.SocketListener.addAddress]
      or [gio.socket_listener.SocketListener.addInetPort].
      
      New services are created active, there is no need to call
      [gio.socket_service.SocketService.start], unless [gio.socket_service.SocketService.stop] has been
      called before.
      Returns: a new #GSocketService.
  */
  this()
  {
    GSocketService* _cretval;
    _cretval = g_socket_service_new();
    this(_cretval, Yes.Take);
  }

  /**
      Check whether the service is active or not. An active
      service will accept new clients that connect, while
      a non-active service will let connecting clients queue
      up until the service is started.
      Returns: true if the service is active, false otherwise
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)g_socket_service_is_active(cast(GSocketService*)this._cPtr);
    return _retval;
  }

  /**
      Restarts the service, i.e. start accepting connections
      from the added sockets when the mainloop runs. This only needs
      to be called after the service has been stopped from
      [gio.socket_service.SocketService.stop].
      
      This call is thread-safe, so it may be called from a thread
      handling an incoming client request.
  */
  void start()
  {
    g_socket_service_start(cast(GSocketService*)this._cPtr);
  }

  /**
      Stops the service, i.e. stops accepting connections
      from the added sockets when the mainloop runs.
      
      This call is thread-safe, so it may be called from a thread
      handling an incoming client request.
      
      Note that this only stops accepting new connections; it does not
      close the listening sockets, and you can call
      [gio.socket_service.SocketService.start] again later to begin listening again. To
      close the listening sockets, call [gio.socket_listener.SocketListener.close]. (This
      will happen automatically when the #GSocketService is finalized.)
      
      This must be called before calling [gio.socket_listener.SocketListener.close] as
      the socket service will start accepting connections immediately
      when a new socket is added.
  */
  void stop()
  {
    g_socket_service_stop(cast(GSocketService*)this._cPtr);
  }

  /**
      Connect to `Incoming` signal.
  
      The ::incoming signal is emitted when a new incoming connection
      to service needs to be handled. The handler must initiate the
      handling of connection, but may not block; in essence,
      asynchronous operations must be used.
      
      connection will be unreffed once the signal handler returns,
      so you need to ref it yourself if you are planning to use it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.socket_connection.SocketConnection connection, gobject.object.ObjectWrap sourceObject, gio.socket_service.SocketService socketService))
  
          `connection` a new #GSocketConnection object (optional)
  
          `sourceObject` the source_object passed to
              [gio.socket_listener.SocketListener.addAddress] (optional)
  
          `socketService` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being called
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectIncoming(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.socket_connection.SocketConnection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.socket_service.SocketService)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("incoming", closure, after);
  }
}
