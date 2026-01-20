/// Module for [DebugControllerDBus] class
module gio.debug_controller_dbus;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.dbus_connection;
import gio.dbus_method_invocation;
import gio.debug_controller;
import gio.debug_controller_mixin;
import gio.initable;
import gio.initable_mixin;
import gio.types;
import glib.error;
import gobject.dclosure;
import gobject.object;

/**
    [gio.debug_controller_dbus.DebugControllerDBus] is an implementation of [gio.debug_controller.DebugController]
    which exposes debug settings as a D-Bus object.
    
    It is a [gio.initable.Initable] object, and will register an object at
    `/org/gtk/Debugging` on the bus given as
    [gio.debug_controller_dbus.DebugControllerDBus.connection] once it’s initialized. The
    object will be unregistered when the last reference to the
    [gio.debug_controller_dbus.DebugControllerDBus] is dropped.
    
    This D-Bus object can be used by remote processes to enable or disable debug
    output in this process. Remote processes calling
    `org.gtk.Debugging.SetDebugEnabled()` will affect the value of
    `property@Gio.DebugController:debug-enabled` and, by default,
    `func@GLib.log_get_debug_enabled`.
    
    By default, no processes are allowed to call `SetDebugEnabled()` unless a
    [gio.debug_controller_dbus.DebugControllerDBus.authorize] signal handler is installed. This
    is because the process may be privileged, or might expose sensitive
    information in its debug output. You may want to restrict the ability to
    enable debug output to privileged users or processes.
    
    One option is to install a D-Bus security policy which restricts access to
    `SetDebugEnabled()`, installing something like the following in
    `$datadir/dbus-1/system.d/`:
    
    ```xml
    <?xml version="1.0"?> <!--*-nxml-*-->
    <!DOCTYPE busconfig PUBLIC "-//freedesktop//DTD D-BUS Bus Configuration 1.0//EN"
         "http://www.freedesktop.org/standards/dbus/1.0/busconfig.dtd">
    <busconfig>
      <policy user="root">
        <allow send_destination="com.example.MyService" send_interface="org.gtk.Debugging"/>
      </policy>
      <policy context="default">
        <deny send_destination="com.example.MyService" send_interface="org.gtk.Debugging"/>
      </policy>
    </busconfig>
    ```
    
    This will prevent the `SetDebugEnabled()` method from being called by all
    except root. It will not prevent the `DebugEnabled` property from being read,
    as it’s accessed through the `org.freedesktop.DBus.Properties` interface.
    
    Another option is to use polkit to allow or deny requests on a case-by-case
    basis, allowing for the possibility of dynamic authorisation. To do this,
    connect to the [gio.debug_controller_dbus.DebugControllerDBus.authorize] signal and query
    polkit in it:
    
    ```c
      g_autoptr(GError) child_error = NULL;
      g_autoptr(GDBusConnection) connection = g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, NULL);
      gulong debug_controller_authorize_id = 0;
    
      // Set up the debug controller.
      debug_controller = G_DEBUG_CONTROLLER (g_debug_controller_dbus_new (priv->connection, NULL, &child_error));
      if (debug_controller == NULL)
        {
          g_error ("Could not register debug controller on bus: %s"),
                   child_error->message);
        }
    
      debug_controller_authorize_id = g_signal_connect (debug_controller,
                                                        "authorize",
                                                        G_CALLBACK (debug_controller_authorize_cb),
                                                        self);
    
      static gboolean
      debug_controller_authorize_cb (GDebugControllerDBus  *debug_controller,
                                     GDBusMethodInvocation *invocation,
                                     gpointer               user_data)
      {
        g_autoptr(PolkitAuthority) authority = NULL;
        g_autoptr(PolkitSubject) subject = NULL;
        g_autoptr(PolkitAuthorizationResult) auth_result = NULL;
        g_autoptr(GError) local_error = NULL;
        GDBusMessage *message;
        GDBusMessageFlags message_flags;
        PolkitCheckAuthorizationFlags flags = POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE;
    
        message = g_dbus_method_invocation_get_message (invocation);
        message_flags = g_dbus_message_get_flags (message);
    
        authority = polkit_authority_get_sync (NULL, &local_error);
        if (authority == NULL)
          {
            g_warning ("Failed to get polkit authority: %s", local_error->message);
            return FALSE;
          }
    
        if (message_flags & G_DBUS_MESSAGE_FLAGS_ALLOW_INTERACTIVE_AUTHORIZATION)
          flags |= POLKIT_CHECK_AUTHORIZATION_FLAGS_ALLOW_USER_INTERACTION;
    
        subject = polkit_system_bus_name_new (g_dbus_method_invocation_get_sender (invocation));
    
        auth_result = polkit_authority_check_authorization_sync (authority,
                                                                 subject,
                                                                 "com.example.MyService.set-debug-enabled",
                                                                 NULL,
                                                                 flags,
                                                                 NULL,
                                                                 &local_error);
        if (auth_result == NULL)
          {
            g_warning ("Failed to get check polkit authorization: %s", local_error->message);
            return FALSE;
          }
    
        return polkit_authorization_result_get_is_authorized (auth_result);
      }
    ```
*/
class DebugControllerDBus : gobject.object.ObjectWrap, gio.debug_controller.DebugController, gio.initable.Initable
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
    return cast(void function())g_debug_controller_dbus_get_type != &gidSymbolNotFound ? g_debug_controller_dbus_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DebugControllerDBus self()
  {
    return this;
  }

  mixin DebugControllerT!();
  mixin InitableT!();

  /**
      Create a new #GDebugControllerDBus and synchronously initialize it.
      
      Initializing the object will export the debug object on connection. The
      object will remain registered until the last reference to the
      #GDebugControllerDBus is dropped.
      
      Initialization may fail if registering the object on connection fails.
  
      Params:
        connection = a #GDBusConnection to register the debug object on
        cancellable = a #GCancellable, or null
      Returns: a new #GDebugControllerDBus, or null
          on failure
      Throws: [ErrorWrap]
  */
  this(gio.dbus_connection.DBusConnection connection, gio.cancellable.Cancellable cancellable = null)
  {
    GDebugControllerDBus* _cretval;
    GError *_err;
    _cretval = g_debug_controller_dbus_new(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /**
      Stop the debug controller, unregistering its object from the bus.
      
      Any pending method calls to the object will complete successfully, but new
      ones will return an error. This method will block until all pending
      #GDebugControllerDBus::authorize signals have been handled. This is expected
      to not take long, as it will just be waiting for threads to join. If any
      #GDebugControllerDBus::authorize signal handlers are still executing in other
      threads, this will block until after they have returned.
      
      This method will be called automatically when the final reference to the
      #GDebugControllerDBus is dropped. You may want to call it explicitly to know
      when the controller has been fully removed from the bus, or to break
      reference count cycles.
      
      Calling this method from within a #GDebugControllerDBus::authorize signal
      handler will cause a deadlock and must not be done.
  */
  void stop()
  {
    g_debug_controller_dbus_stop(cast(GDebugControllerDBus*)this._cPtr);
  }

  /**
      Connect to `Authorize` signal.
  
      Emitted when a D-Bus peer is trying to change the debug settings and used
        to determine if that is authorized.
        
        This signal is emitted in a dedicated worker thread, so handlers are
        allowed to perform blocking I/O. This means that, for example, it is
        appropriate to call `polkit_authority_check_authorization_sync()` to check
        authorization using polkit.
        
        If false is returned then no further handlers are run and the request to
        change the debug settings is rejected.
        
        Otherwise, if true is returned, signal emission continues. If no handlers
        return false, then the debug settings are allowed to be changed.
        
        Signal handlers must not modify invocation, or cause it to return a value.
        
        The default class handler just returns true.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gio.dbus_method_invocation.DBusMethodInvocation invocation, gio.debug_controller_dbus.DebugControllerDBus debugControllerDBus))
  
          `invocation` A #GDBusMethodInvocation. (optional)
  
          `debugControllerDBus` the instance the signal is connected to (optional)
  
          `Returns` true if the call is authorized, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAuthorize(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.dbus_method_invocation.DBusMethodInvocation)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.debug_controller_dbus.DebugControllerDBus)))
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
    return connectSignalClosure("authorize", closure, after);
  }
}
