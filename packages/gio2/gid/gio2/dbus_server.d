/// Module for [DBusServer] class
module gid.gio2.dbus_server;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.dbus_auth_observer;
import gid.gio2.dbus_connection;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.dbus_server.DBusServer] is a helper for listening to and accepting D-Bus
    connections. This can be used to create a new D-Bus server, allowing two
    peers to use the D-Bus protocol for their own specialized communication.
    A server instance provided in this way will not perform message routing or
    implement the
    [`org.freedesktop.DBus` interface](https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-messages).
    
    To just export an object on a well-known name on a message bus, such as the
    session or system bus, you should instead use `func@Gio.bus_own_name`.
    
    An example of peer-to-peer communication with GDBus can be found
    in [gdbus-example-peer.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c).
    
    Note that a minimal [gid.gio2.dbus_server.DBusServer] will accept connections from any
    peer. In many use-cases it will be necessary to add a
    [gid.gio2.dbus_auth_observer.DBusAuthObserver] that only accepts connections that have
    successfully authenticated as the same user that is running the
    [gid.gio2.dbus_server.DBusServer]. Since GLib 2.68 this can be achieved more simply by passing
    the [gid.gio2.types.DBusServerFlags.AuthenticationRequireSameUser] flag to the
    server.
*/
class DBusServer : gid.gobject2.object.ObjectWrap, gid.gio2.initable.Initable
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
    return cast(void function())g_dbus_server_get_type != &gidSymbolNotFound ? g_dbus_server_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusServer";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusServer self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_server.DBusServer]
      Returns: New builder object
  */
  static DBusServerGidBuilder builder() nothrow
  {
    return new DBusServerGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the server is currently active.
  */
  @property bool active() nothrow
  {
    return isActive();
  }

  /**
      Get `address` property.
      Returns: The D-Bus address to listen on.
  */
  @property string address() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("address");
  }

  /**
      Get `authenticationObserver` property.
      Returns: A #GDBusAuthObserver object to assist in the authentication process or null.
  */
  @property gid.gio2.dbus_auth_observer.DBusAuthObserver authenticationObserver() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.dbus_auth_observer.DBusAuthObserver)("authentication-observer");
  }

  /**
      Get `clientAddress` property.
      Returns: The D-Bus address that clients can use.
  */
  @property string clientAddress() nothrow
  {
    return getClientAddress();
  }

  /**
      Get `flags` property.
      Returns: Flags from the #GDBusServerFlags enumeration.
  */
  @property gid.gio2.types.DBusServerFlags flags() nothrow
  {
    return getFlags();
  }

  /**
      Get `guid` property.
      Returns: The GUID of the server.
        
        See #GDBusConnection:guid for more details.
  */
  @property string guid() nothrow
  {
    return getGuid();
  }

  mixin InitableT!();

  /**
      Creates a new D-Bus server that listens on the first address in
      address that works.
      
      Once constructed, you can use [gid.gio2.dbus_server.DBusServer.getClientAddress] to
      get a D-Bus address string that clients can use to connect.
      
      To have control over the available authentication mechanisms and
      the users that are authorized to connect, it is strongly recommended
      to provide a non-null #GDBusAuthObserver.
      
      Connect to the #GDBusServer::new-connection signal to handle
      incoming connections.
      
      The returned #GDBusServer isn't active - you have to start it with
      [gid.gio2.dbus_server.DBusServer.start].
      
      #GDBusServer is used in this [example](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gdbus-example-peer.c).
      
      This is a synchronous failable constructor. There is currently no
      asynchronous version.
  
      Params:
        address = A D-Bus address.
        flags = Flags from the #GDBusServerFlags enumeration.
        guid = A D-Bus GUID.
        observer = A #GDBusAuthObserver or null.
        cancellable = A #GCancellable or null.
      Returns: A #GDBusServer or null if error is set. Free with
        [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.gio2.dbus_server.DBusServer newSync(string address, gid.gio2.types.DBusServerFlags flags, string guid, gid.gio2.dbus_auth_observer.DBusAuthObserver observer = null, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GDBusServer* _cretval;
    const(char)* _address = address.toCString!(No.Malloc, No.Nullable);
    const(char)* _guid = guid.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_dbus_server_new_sync(_address, flags, _guid, observer ? cast(GDBusAuthObserver*)observer._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.dbus_server.DBusServer)(cast(GDBusServer*)_cretval, Yes.Take);
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
  string getClientAddress() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_server_get_client_address(cast(GDBusServer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the flags for server.
      Returns: A set of flags from the #GDBusServerFlags enumeration.
  */
  gid.gio2.types.DBusServerFlags getFlags() nothrow
  {
    GDBusServerFlags _cretval;
    _cretval = g_dbus_server_get_flags(cast(GDBusServer*)this._cPtr);
    gid.gio2.types.DBusServerFlags _retval = cast(gid.gio2.types.DBusServerFlags)_cretval;
    return _retval;
  }

  /**
      Gets the GUID for server, as provided to [gid.gio2.dbus_server.DBusServer.newSync].
      Returns: A D-Bus GUID. Do not free this string, it is owned by server.
  */
  string getGuid() nothrow
  {
    const(char)* _cretval;
    _cretval = g_dbus_server_get_guid(cast(GDBusServer*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether server is active.
      Returns: true if server is active, false otherwise.
  */
  bool isActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_dbus_server_is_active(cast(GDBusServer*)this._cPtr);
    return _retval;
  }

  /**
      Starts server.
  */
  void start() nothrow
  {
    g_dbus_server_start(cast(GDBusServer*)this._cPtr);
  }

  /**
      Stops server.
  */
  void stop() nothrow
  {
    g_dbus_server_stop(cast(GDBusServer*)this._cPtr);
  }

  /**
      Connect to `NewConnection` signal.
  
      Emitted when a new authenticated connection has been made. Use
        [gid.gio2.dbus_connection.DBusConnection.getPeerCredentials] to figure out what
        identity (if any), was authenticated.
        
        If you want to accept the connection, take a reference to the
        connection object and return true. When you are done with the
        connection call [gid.gio2.dbus_connection.DBusConnection.close] and give up your
        reference. Note that the other peer may disconnect at any time -
        a typical thing to do when accepting a connection is to listen to
        the #GDBusConnection::closed signal.
        
        If #GDBusServer:flags contains [gid.gio2.types.DBusServerFlags.RunInThread]
        then the signal is emitted in a new thread dedicated to the
        connection. Otherwise the signal is emitted in the thread-default
        main context (see [gid.glib2.main_context.MainContext.pushThreadDefault])
        of the thread that server was constructed in.
        
        You are guaranteed that signal handlers for this signal runs
        before incoming messages on connection are processed. This means
        that it's suitable to call [gid.gio2.dbus_connection.DBusConnection.registerObject] or
        similar from the signal handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.dbus_connection.DBusConnection connection, gid.gio2.dbus_server.DBusServer dBusServer)`
  
          `connection` A #GDBusConnection for the new connection. (optional)
  
          `dBusServer` the instance the signal is connected to (optional)
  
          `Returns` true to claim connection, false to let other handlers
            run.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNewConnection(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.dbus_connection.DBusConnection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_server.DBusServer)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_server.DBusServer.newConnection");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("new-connection", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_server.DBusServer]
class DBusServerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.initable.InitableGidBuilderImpl!T
{

  mixin InitableGidBuilderT!();

  /**
      Set `address` property.
      Params:
        propval = The D-Bus address to listen on.
      Returns: Builder instance for fluent chaining
  */
  T address(string propval) nothrow
  {
    return setProperty("address", propval);
  }

  /**
      Set `authenticationObserver` property.
      Params:
        propval = A #GDBusAuthObserver object to assist in the authentication process or null.
      Returns: Builder instance for fluent chaining
  */
  T authenticationObserver(gid.gio2.dbus_auth_observer.DBusAuthObserver propval) nothrow
  {
    return setProperty("authentication-observer", propval);
  }

  /**
      Set `flags` property.
      Params:
        propval = Flags from the #GDBusServerFlags enumeration.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.gio2.types.DBusServerFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }

  /**
      Set `guid` property.
      Params:
        propval = The GUID of the server.
          
          See #GDBusConnection:guid for more details.
      Returns: Builder instance for fluent chaining
  */
  T guid(string propval) nothrow
  {
    return setProperty("guid", propval);
  }
}

/// Fluent builder for [gid.gio2.dbus_server.DBusServer]
final class DBusServerGidBuilder : DBusServerGidBuilderImpl!DBusServerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusServer build() nothrow
  {
    return new DBusServer(cast(void*)createGObject(DBusServer._getGType), Yes.Take);
  }
}
