/// Module for [DBusAuthObserver] class
module gid.gio2.dbus_auth_observer;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.credentials;
import gid.gio2.iostream;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.dbus_auth_observer.DBusAuthObserver] provides a mechanism for participating
    in how a [gid.gio2.dbus_server.DBusServer] (or a [gid.gio2.dbus_connection.DBusConnection])
    authenticates remote peers.
    
    Simply instantiate a [gid.gio2.dbus_auth_observer.DBusAuthObserver] and connect to the
    signals you are interested in. Note that new signals may be added
    in the future.
    
    ## Controlling Authentication Mechanisms
    
    By default, a [gid.gio2.dbus_server.DBusServer] or server-side [gid.gio2.dbus_connection.DBusConnection] will allow
    any authentication mechanism to be used. If you only want to allow D-Bus
    connections with the `EXTERNAL` mechanism, which makes use of credentials
    passing and is the recommended mechanism for modern Unix platforms such
    as Linux and the BSD family, you would use a signal handler like this:
    
    ```c
    static gboolean
    on_allow_mechanism (GDBusAuthObserver *observer,
                        const gchar       *mechanism,
                        gpointer           user_data)
    {
      if (g_strcmp0 (mechanism, "EXTERNAL") == 0)
        {
          return TRUE;
        }
    
      return FALSE;
    }
    ```
    
    ## Controlling Authorization
    
    By default, a [gid.gio2.dbus_server.DBusServer] or server-side [gid.gio2.dbus_connection.DBusConnection] will accept
    connections from any successfully authenticated user (but not from
    anonymous connections using the `ANONYMOUS` mechanism). If you only
    want to allow D-Bus connections from processes owned by the same uid
    as the server, since GLib 2.68, you should use the
    [gid.gio2.types.DBusServerFlags.AuthenticationRequireSameUser] flag. It’s equivalent
    to the following signal handler:
    
    ```c
    static gboolean
    on_authorize_authenticated_peer (GDBusAuthObserver *observer,
                                     GIOStream         *stream,
                                     GCredentials      *credentials,
                                     gpointer           user_data)
    {
      gboolean authorized;
    
      authorized = FALSE;
      if (credentials != NULL)
        {
          GCredentials *own_credentials;
          own_credentials = g_credentials_new ();
          if (g_credentials_is_same_user (credentials, own_credentials, NULL))
            authorized = TRUE;
          g_object_unref (own_credentials);
        }
    
      return authorized;
    }
    ```
*/
class DBusAuthObserver : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_dbus_auth_observer_get_type != &gidSymbolNotFound ? g_dbus_auth_observer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GDBusAuthObserver";
  }

  /** Returns `this`, for use in `with` statements. */
  override DBusAuthObserver self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.dbus_auth_observer.DBusAuthObserver]
      Returns: New builder object
  */
  static DBusAuthObserverGidBuilder builder() nothrow
  {
    return new DBusAuthObserverGidBuilder;
  }

  /**
      Creates a new #GDBusAuthObserver object.
      Returns: A #GDBusAuthObserver. Free with [gid.gobject2.object.ObjectWrap.unref].
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GDBusAuthObserver* _cretval;
      _cretval = g_dbus_auth_observer_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Emits the #GDBusAuthObserver::allow-mechanism signal on observer.
  
      Params:
        mechanism = The name of the mechanism, e.g. `DBUS_COOKIE_SHA1`.
      Returns: true if mechanism can be used to authenticate the other peer, false if not.
  */
  bool allowMechanism(string mechanism) nothrow
  {
    bool _retval;
    const(char)* _mechanism = mechanism.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_dbus_auth_observer_allow_mechanism(cast(GDBusAuthObserver*)this._cPtr, _mechanism);
    return _retval;
  }

  /**
      Emits the #GDBusAuthObserver::authorize-authenticated-peer signal on observer.
  
      Params:
        stream = A #GIOStream for the #GDBusConnection.
        credentials = Credentials received from the peer or null.
      Returns: true if the peer is authorized, false if not.
  */
  bool authorizeAuthenticatedPeer(gid.gio2.iostream.IOStream stream, gid.gio2.credentials.Credentials credentials = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_dbus_auth_observer_authorize_authenticated_peer(cast(GDBusAuthObserver*)this._cPtr, stream ? cast(GIOStream*)stream._cPtr(No.Dup) : null, credentials ? cast(GCredentials*)credentials._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `AllowMechanism` signal.
  
      Emitted to check if mechanism is allowed to be used.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(string mechanism, gid.gio2.dbus_auth_observer.DBusAuthObserver dBusAuthObserver)`
  
          `mechanism` The name of the mechanism, e.g. `DBUS_COOKIE_SHA1`. (optional)
  
          `dBusAuthObserver` the instance the signal is connected to (optional)
  
          `Returns` true if mechanism can be used to authenticate the other peer, false if not.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAllowMechanism(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.dbus_auth_observer.DBusAuthObserver)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_auth_observer.DBusAuthObserver.allowMechanism");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("allow-mechanism", closure, after);
  }

  /**
      Connect to `AuthorizeAuthenticatedPeer` signal.
  
      Emitted to check if a peer that is successfully authenticated
        is authorized.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gio2.iostream.IOStream stream, gid.gio2.credentials.Credentials credentials, gid.gio2.dbus_auth_observer.DBusAuthObserver dBusAuthObserver)`
  
          `stream` A #GIOStream for the #GDBusConnection. (optional)
  
          `credentials` Credentials received from the peer or null. (optional)
  
          `dBusAuthObserver` the instance the signal is connected to (optional)
  
          `Returns` true if the peer is authorized, false if not.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAuthorizeAuthenticatedPeer(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.iostream.IOStream)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.credentials.Credentials)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.dbus_auth_observer.DBusAuthObserver)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.dbus_auth_observer.DBusAuthObserver.authorizeAuthenticatedPeer");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("authorize-authenticated-peer", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.dbus_auth_observer.DBusAuthObserver]
class DBusAuthObserverGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.dbus_auth_observer.DBusAuthObserver]
final class DBusAuthObserverGidBuilder : DBusAuthObserverGidBuilderImpl!DBusAuthObserverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DBusAuthObserver build() nothrow
  {
    return new DBusAuthObserver(cast(void*)createGObject(DBusAuthObserver._getGType), Yes.Take);
  }
}
