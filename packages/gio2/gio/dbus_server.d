/// Module for [DBusServer] class
module gio.dbus_server;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.dbus_auth_observer;
import gio.dbus_connection;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    [gio.dbus_server.DBusServer] is a helper for listening to and accepting D-Bus
    connections. This can be used to create a new D-Bus server, allowing two
    peers to use the D-Bus protocol for their own specialized communication.
    A server instance provided in this way will not perform message routing or
    implement the
    [`org.freedesktop.DBus` interface](https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-messages).
    
    To just export an object on a well-known name on a message bus, such as the
    session or system bus, you should instead use `func@Gio.bus_own_name`.
    
    An example of peer-to-peer communication with GDBus can be found
    in [gdbus-example-peer.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c).
    
    Note that a minimal [gio.dbus_server.DBusServer] will accept connections from any
    peer. In many use-cases it will be necessary to add a
    [gio.dbus_auth_observer.DBusAuthObserver] that only accepts connections that have
    successfully authenticated as the same user that is running the
    [gio.dbus_server.DBusServer]. Since GLib 2.68 this can be achieved more simply by passing
    the [gio.types.DBusServerFlags.AuthenticationRequireSameUser] flag to the
    server.
*/
class DBusServer : gobject.object.ObjectWrap, gio.initable.Initable
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
    return cast(void function())g_dbus_server_get_type != &gidSymbolNotFound ? g_dbus_server_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusServer self()
  {
    return this;
  }

  /**
      Get `active` property.
      Returns: Whether the server is currently active.
  */
  @property bool active()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("active");
  }

  /**
      Get `clientAddress` property.
      Returns: The D-Bus address that clients can use.
  */
  @property string clientAddress()
  {
    return getClientAddress();
  }

  mixin InitableT!();

  /**
      Creates a new D-Bus server that listens on the first address in
      address that works.
      
      Once constructed, you can use [gio.dbus_server.DBusServer.getClientAddress] to
      get a D-Bus address string that clients can use to connect.
      
      To have control over the available authentication mechanisms and
      the users that are authorized to connect, it is strongly recommended
      to provide a non-null #GDBusAuthObserver.
      
      Connect to the #GDBusServer::new-connection signal to handle
      incoming connections.
      
      The returned #GDBusServer isn't active - you have to start it with
      [gio.dbus_server.DBusServer.start].
      
      #GDBusServer is used in this [example][gdbus-peer-to-peer].
      
      This is a synchronous failable constructor. There is currently no
      asynchronous version.
  
      Params:
        address = A D-Bus address.
        flags = Flags from the #GDBusServerFlags enumeration.
        guid = A D-Bus GUID.
        observer = A #GDBusAuthObserver or null.
        cancellable = A #GCancellable or null.
      Returns: A #GDBusServer or null if error is set. Free with
        [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gio.dbus_server.DBusServer newSync(string address, gio.types.DBusServerFlags flags, string guid, gio.dbus_auth_observer.DBusAuthObserver observer = null, gio.cancellable.Cancellable cancellable = null)
  {
    GDBusServer* _cretval;
    const(char)* _address = address.toCString(No.Alloc);
    const(char)* _guid = guid.toCString(No.Alloc);
    GError *_err;
    _cretval = g_dbus_server_new_sync(_address, flags, _guid, observer ? cast(GDBusAuthObserver*)observer._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_server.DBusServer)(cast(GDBusServer*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets a
      [D-Bus address](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses)
      string that can be used by clients to connect to server.
      
      This is valid and non-empty if initializing the #GDBusServer succeeded.
      Returns: A D-Bus address string. Do not free, the string is owned
        by server.
  */
  string getClientAddress()
  {
    const(char)* _cretval;
    _cretval = g_dbus_server_get_client_address(cast(GDBusServer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the flags for server.
      Returns: A set of flags from the #GDBusServerFlags enumeration.
  */
  gio.types.DBusServerFlags getFlags()
  {
    GDBusServerFlags _cretval;
    _cretval = g_dbus_server_get_flags(cast(GDBusServer*)this._cPtr);
    gio.types.DBusServerFlags _retval = cast(gio.types.DBusServerFlags)_cretval;
    return _retval;
  }

  /**
      Gets the GUID for server, as provided to [gio.dbus_server.DBusServer.newSync].
      Returns: A D-Bus GUID. Do not free this string, it is owned by server.
  */
  string getGuid()
  {
    const(char)* _cretval;
    _cretval = g_dbus_server_get_guid(cast(GDBusServer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether server is active.
      Returns: true if server is active, false otherwise.
  */
  bool isActive()
  {
    bool _retval;
    _retval = cast(bool)g_dbus_server_is_active(cast(GDBusServer*)this._cPtr);
    return _retval;
  }

  /**
      Starts server.
  */
  void start()
  {
    g_dbus_server_start(cast(GDBusServer*)this._cPtr);
  }

  /**
      Stops server.
  */
  void stop()
  {
    g_dbus_server_stop(cast(GDBusServer*)this._cPtr);
  }

  /**
      Connect to `NewConnection` signal.
  
      Emitted when a new authenticated connection has been made. Use
        [gio.dbus_connection.DBusConnection.getPeerCredentials] to figure out what
        identity (if any), was authenticated.
        
        If you want to accept the connection, take a reference to the
        connection object and return true. When you are done with the
        connection call [gio.dbus_connection.DBusConnection.close] and give up your
        reference. Note that the other peer may disconnect at any time -
        a typical thing to do when accepting a connection is to listen to
        the #GDBusConnection::closed signal.
        
        If #GDBusServer:flags contains [gio.types.DBusServerFlags.RunInThread]
        then the signal is emitted in a new thread dedicated to the
        connection. Otherwise the signal is emitted in the
        [thread-default main context][g-main-context-push-thread-default]
        of the thread that server was constructed in.
        
        You are guaranteed that signal handlers for this signal runs
        before incoming messages on connection are processed. This means
        that it's suitable to call [gio.dbus_connection.DBusConnection.registerObject] or
        similar from the signal handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.dbus_connection.DBusConnection connection, gio.dbus_server.DBusServer dBusServer))
  
          `connection` A #GDBusConnection for the new connection. (optional)
  
          `dBusServer` the instance the signal is connected to (optional)
  
          `Returns` true to claim connection, false to let other handlers
            run.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNewConnection(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_connection.DBusConnection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.dbus_server.DBusServer)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-connection", closure, after);
  }
}
