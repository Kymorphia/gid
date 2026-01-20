/// Module for [ThreadedSocketService] class
module gio.threaded_socket_service;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_connection;
import gio.socket_service;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    A [gio.threaded_socket_service.ThreadedSocketService] is a simple subclass of [gio.socket_service.SocketService]
    that handles incoming connections by creating a worker thread and
    dispatching the connection to it by emitting the
    [gio.threaded_socket_service.ThreadedSocketService.run] in the new thread.
    
    The signal handler may perform blocking I/O and need not return
    until the connection is closed.
    
    The service is implemented using a thread pool, so there is a
    limited amount of threads available to serve incoming requests.
    The service automatically stops the [gio.socket_service.SocketService] from accepting
    new connections when all threads are busy.
    
    As with [gio.socket_service.SocketService], you may connect to
    [gio.threaded_socket_service.ThreadedSocketService.run], or subclass and override the default
    handler.
*/
class ThreadedSocketService : gio.socket_service.SocketService
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
    return cast(void function())g_threaded_socket_service_get_type != &gidSymbolNotFound ? g_threaded_socket_service_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ThreadedSocketService self()
  {
    return this;
  }

  /**
      Creates a new #GThreadedSocketService with no listeners. Listeners
      must be added with one of the #GSocketListener "add" methods.
  
      Params:
        maxThreads = the maximal number of threads to execute concurrently
            handling incoming clients, -1 means no limit
      Returns: a new #GSocketService.
  */
  this(int maxThreads)
  {
    GSocketService* _cretval;
    _cretval = g_threaded_socket_service_new(maxThreads);
    this(_cretval, Yes.Take);
  }

  /**
      Connect to `Run` signal.
  
      The ::run signal is emitted in a worker thread in response to an
        incoming connection. This thread is dedicated to handling
        connection and may perform blocking IO. The signal handler need
        not return until the connection is closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.socket_connection.SocketConnection connection, gobject.object.ObjectWrap sourceObject, gio.threaded_socket_service.ThreadedSocketService threadedSocketService))
  
          `connection` a new #GSocketConnection object. (optional)
  
          `sourceObject` the source_object passed to [gio.socket_listener.SocketListener.addAddress]. (optional)
  
          `threadedSocketService` the instance the signal is connected to (optional)
  
          `Returns` true to stop further signal handlers from being called
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRun(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.socket_connection.SocketConnection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gobject.object.ObjectWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gio.threaded_socket_service.ThreadedSocketService)))
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
    return connectSignalClosure("run", closure, after);
  }
}
