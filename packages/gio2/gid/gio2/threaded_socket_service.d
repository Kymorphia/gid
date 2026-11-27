/// Module for [ThreadedSocketService] class
module gid.gio2.threaded_socket_service;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_connection;
import gid.gio2.socket_service;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.threaded_socket_service.ThreadedSocketService] is a simple subclass of [gid.gio2.socket_service.SocketService]
    that handles incoming connections by creating a worker thread and
    dispatching the connection to it by emitting the
    [gid.gio2.threaded_socket_service.ThreadedSocketService.run] in the new thread.
    
    The signal handler may perform blocking I/O and need not return
    until the connection is closed.
    
    The service is implemented using a thread pool, so there is a
    limited amount of threads available to serve incoming requests.
    The service automatically stops the [gid.gio2.socket_service.SocketService] from accepting
    new connections when all threads are busy.
    
    As with [gid.gio2.socket_service.SocketService], you may connect to
    [gid.gio2.threaded_socket_service.ThreadedSocketService.run], or subclass and override the default
    handler.
*/
@gidGir("ThreadedSocketService", "ThreadedSocketServiceClass")
class ThreadedSocketService : gid.gio2.socket_service.SocketService
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_threaded_socket_service_get_type != &gidSymbolNotFound ? g_threaded_socket_service_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GThreadedSocketService";
  }

  /** Returns `this`, for use in `with` statements. */
  override ThreadedSocketService self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.threaded_socket_service.ThreadedSocketService]
      Returns: New builder object
  */
  static ThreadedSocketServiceGidBuilder builder() nothrow
  {
    return new ThreadedSocketServiceGidBuilder;
  }

  /**
      Get `maxThreads` property.
      Returns: The maximum number of threads handling clients for this service.
  */
  @property int maxThreads() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(int)("max-threads");
  }

  /**
      Creates a new #GThreadedSocketService with no listeners. Listeners
      must be added with one of the #GSocketListener "add" methods.
  
      Params:
        maxThreads = the maximal number of threads to execute concurrently
            handling incoming clients, -1 means no limit
      Returns: a new #GSocketService.
  */
  this(int maxThreads) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GSocketService* _cretval;
      _cretval = g_threaded_socket_service_new(maxThreads);
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected bool vfuncRun(gid.gio2.socket_connection.SocketConnection connection, gid.gobject2.object.ObjectWrap sourceObject)
  {
    auto _klass = cast(GThreadedSocketServiceClass*)_vfuncClass;
    if (!_klass.run)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.run(cast(GThreadedSocketService*)this._cPtr, connection ? cast(GSocketConnection*)connection._cPtr(No.Dup) : null, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `Run` signal.
  
      The ::run signal is emitted in a worker thread in response to an
        incoming connection. This thread is dedicated to handling
        connection and may perform blocking IO. The signal handler need
        not return until the connection is closed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.socket_connection.SocketConnection connection, gid.gobject2.object.ObjectWrap sourceObject, gid.gio2.threaded_socket_service.ThreadedSocketService threadedSocketService)`
  
          `connection` a new #GSocketConnection object. (optional)
  
          `sourceObject` the source_object passed to [gid.gio2.socket_listener.SocketListener.addAddress]. (optional)
  
          `threadedSocketService` the instance the signal is connected to (optional)
  
          `Returns` true to stop further signal handlers from being called
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRun(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.socket_connection.SocketConnection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gobject2.object.ObjectWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.threaded_socket_service.ThreadedSocketService)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.threaded_socket_service.ThreadedSocketService.run");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("run", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ThreadedSocketService
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.threaded_socket_service.ThreadedSocketService), T.stringof ~ " is not derived from gid.gio2.threaded_socket_service.ThreadedSocketService");

    gid.gio2.socket_service.SocketService._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRun", true)[0]) == gid.gio2.threaded_socket_service.ThreadedSocketService))
      _installVfunc(klass, "run");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GThreadedSocketServiceClass*)klass;

    switch (vfunc)
    {
      case "run":
      {
        static extern(C) gboolean _vfuncRunTramp(GThreadedSocketService* service, GSocketConnection* connection, GObject* sourceObject) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.threaded_socket_service.ThreadedSocketService)(cast(void*)service);
          if (!_obj)
          {
            auto _klass = cast(GThreadedSocketServiceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)service);
            if (_klass.run)
              return (cast(typeof(&_vfuncRunTramp))_klass.run)(service, connection, sourceObject);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRun(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_connection.SocketConnection)(cast(void*)connection, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.threaded_socket_service.ThreadedSocketService.vfuncRun");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.run = cast(typeof(_klass.run))&_vfuncRunTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.threaded_socket_service.ThreadedSocketService]
class ThreadedSocketServiceGidBuilderImpl(T) : gid.gio2.socket_service.SocketServiceGidBuilderImpl!T
{

  /**
      Set `maxThreads` property.
      Params:
        propval = The maximum number of threads handling clients for this service.
      Returns: Builder instance for fluent chaining
  */
  T maxThreads(int propval) nothrow
  {
    return setProperty("max-threads", propval);
  }
}

/// Fluent builder for [gid.gio2.threaded_socket_service.ThreadedSocketService]
final class ThreadedSocketServiceGidBuilder : ThreadedSocketServiceGidBuilderImpl!ThreadedSocketServiceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThreadedSocketService build() nothrow
  {
    return new ThreadedSocketService(cast(void*)createGObject(ThreadedSocketService._getGType), Yes.Take);
  }
}
