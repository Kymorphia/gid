/// Module for [SocketService] class
module gid.gio2.socket_service;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.socket_connection;
import gid.gio2.socket_listener;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.socket_service.SocketService] is an object that represents a service that
    is provided to the network or over local sockets.  When a new
    connection is made to the service the [gid.gio2.socket_service.SocketService.incoming]
    signal is emitted.
    
    A [gid.gio2.socket_service.SocketService] is a subclass of [gid.gio2.socket_listener.SocketListener] and you need
    to add the addresses you want to accept connections on with the
    [gid.gio2.socket_listener.SocketListener] APIs.
    
    There are two options for implementing a network service based on
    [gid.gio2.socket_service.SocketService]. The first is to create the service using
    [gid.gio2.socket_service.SocketService.new_] and to connect to the
    [gid.gio2.socket_service.SocketService.incoming] signal. The second is to subclass
    [gid.gio2.socket_service.SocketService] and override the default signal handler implementation.
    
    In either case, the handler must immediately return, or else it
    will block additional incoming connections from being serviced.
    If you are interested in writing connection handlers that contain
    blocking code then see [gid.gio2.threaded_socket_service.ThreadedSocketService].
    
    The socket service runs on the main loop of the
    thread-default context (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]) of the thread it is
    created in, and is not threadsafe in general. However, the calls to start and
    stop the service are thread-safe so these can be used from threads that
    handle incoming clients.
*/
@gidGir("SocketService", "SocketServiceClass")
class SocketService : gid.gio2.socket_listener.SocketListener
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
    return cast(void function())g_socket_service_get_type != &gidSymbolNotFound ? g_socket_service_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSocketService";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketService self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.socket_service.SocketService]
      Returns: New builder object
  */
  static SocketServiceGidBuilder builder() nothrow
  {
    return new SocketServiceGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the service is currently accepting connections.
  */
  @property bool active() nothrow
  {
    return isActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the service is currently accepting connections.
  */
  @property void active(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("active", propval);
  }

  /**
      Creates a new #GSocketService with no sockets to listen for.
      New listeners can be added with e.g. [gid.gio2.socket_listener.SocketListener.addAddress]
      or [gid.gio2.socket_listener.SocketListener.addInetPort].
      
      New services are created active, there is no need to call
      [gid.gio2.socket_service.SocketService.start], unless [gid.gio2.socket_service.SocketService.stop] has been
      called before.
      Returns: a new #GSocketService.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GSocketService* _cretval;
      _cretval = g_socket_service_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      signal emitted when new connections are accepted
  
      Params:
        connection = 
        sourceObject = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIncoming` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIncoming(gid.gio2.socket_connection.SocketConnection connection, gid.gobject2.object.ObjectWrap sourceObject)
  {
    auto _klass = cast(GSocketServiceClass*)_vfuncClass;
    if (!_klass.incoming)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.incoming(cast(GSocketService*)this._cPtr, connection ? cast(GSocketConnection*)connection._cPtr(No.Dup) : null, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check whether the service is active or not. An active
      service will accept new clients that connect, while
      a non-active service will let connecting clients queue
      up until the service is started.
      Returns: true if the service is active, false otherwise
  */
  bool isActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_socket_service_is_active(cast(GSocketService*)this._cPtr);
    return _retval;
  }

  /**
      Restarts the service, i.e. start accepting connections
      from the added sockets when the mainloop runs. This only needs
      to be called after the service has been stopped from
      [gid.gio2.socket_service.SocketService.stop].
      
      This call is thread-safe, so it may be called from a thread
      handling an incoming client request.
  */
  void start() nothrow
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
      [gid.gio2.socket_service.SocketService.start] again later to begin listening again. To
      close the listening sockets, call [gid.gio2.socket_listener.SocketListener.close]. (This
      will happen automatically when the #GSocketService is finalized.)
      
      This must be called before calling [gid.gio2.socket_listener.SocketListener.close] as
      the socket service will start accepting connections immediately
      when a new socket is added.
  */
  void stop() nothrow
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
  
          `bool callback(gid.gio2.socket_connection.SocketConnection connection, gid.gobject2.object.ObjectWrap sourceObject, gid.gio2.socket_service.SocketService socketService)`
  
          `connection` a new #GSocketConnection object (optional)
  
          `sourceObject` the source_object passed to
                [gid.gio2.socket_listener.SocketListener.addAddress] (optional)
  
          `socketService` the instance the signal is connected to (optional)
  
          `Returns` true to stop other handlers from being called
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectIncoming(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.socket_connection.SocketConnection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gobject2.object.ObjectWrap)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.socket_service.SocketService)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_service.SocketService.incoming");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("incoming", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from SocketService
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.socket_service.SocketService), T.stringof ~ " is not derived from gid.gio2.socket_service.SocketService");

    gid.gio2.socket_listener.SocketListener._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIncoming", true)[0]) == gid.gio2.socket_service.SocketService))
      _installVfunc(klass, "incoming");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GSocketServiceClass*)klass;

    switch (vfunc)
    {
      case "incoming":
      {
        static extern(C) gboolean _vfuncIncomingTramp(GSocketService* service, GSocketConnection* connection, GObject* sourceObject) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gio2.socket_service.SocketService)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)service);
          if (!_obj)
          {
            auto _klass = cast(GSocketServiceClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)service);
            if (_klass.incoming)
              return (cast(typeof(&_vfuncIncomingTramp))_klass.incoming)(service, connection, sourceObject);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIncoming(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_connection.SocketConnection)(cast(void*)connection, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_service.SocketService.vfuncIncoming");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.incoming = cast(typeof(_klass.incoming))&_vfuncIncomingTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_service.SocketService]
class SocketServiceGidBuilderImpl(T) : gid.gio2.socket_listener.SocketListenerGidBuilderImpl!T
{

  /**
      Set `active` property.
      Params:
        propval = Whether the service is currently accepting connections.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }
}

/// Fluent builder for [gid.gio2.socket_service.SocketService]
final class SocketServiceGidBuilder : SocketServiceGidBuilderImpl!SocketServiceGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketService build() nothrow
  {
    return new SocketService(cast(void*)createGObject(SocketService._getGType), Yes.Take);
  }
}
