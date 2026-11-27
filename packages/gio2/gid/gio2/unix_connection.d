/// Module for [UnixConnection] class
module gid.gio2.unix_connection;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.credentials;
import gid.gio2.socket_connection;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    This is the subclass of [gid.gio2.socket_connection.SocketConnection] that is created
    for UNIX domain sockets.
    
    It contains functions to do some of the UNIX socket specific
    functionality like passing file descriptors.
    
    Since GLib 2.72, [gid.gio2.unix_connection.UnixConnection] is available on all platforms. It requires
    underlying system support (such as Windows 10 with `AF_UNIX`) at run time.
    
    Before GLib 2.72, `<gio/gunixconnection.h>` belonged to the UNIX-specific GIO
    interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file when
    using it. This is no longer necessary since GLib 2.72.
*/
@gidGir("UnixConnection", "UnixConnectionClass")
class UnixConnection : gid.gio2.socket_connection.SocketConnection
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
    return cast(void function())g_unix_connection_get_type != &gidSymbolNotFound ? g_unix_connection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GUnixConnection";
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixConnection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.unix_connection.UnixConnection]
      Returns: New builder object
  */
  static UnixConnectionGidBuilder builder() nothrow
  {
    return new UnixConnectionGidBuilder;
  }

  /**
      Receives credentials from the sending end of the connection.  The
      sending end has to call [gid.gio2.unix_connection.UnixConnection.sendCredentials] (or
      similar) for this to work.
      
      As well as reading the credentials this also reads (and discards) a
      single byte from the stream, as this is required for credentials
      passing to work on some implementations.
      
      This method can be expected to be available on the following platforms:
      
      - Linux since GLib 2.26
      - FreeBSD since GLib 2.26
      - GNU/kFreeBSD since GLib 2.36
      - Solaris, Illumos and OpenSolaris since GLib 2.40
      - GNU/Hurd since GLib 2.40
      
      Other ways to exchange credentials with a foreign peer includes the
      #GUnixCredentialsMessage type and [gid.gio2.socket.Socket.getCredentials] function.
  
      Params:
        cancellable = A #GCancellable or null.
      Returns: Received credentials on success (free with
        [gid.gobject2.object.ObjectWrap.unref]), null if error is set.
      Throws: [ErrorWrap]
  */
  gid.gio2.credentials.Credentials receiveCredentials(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GCredentials* _cretval;
    GError *_err;
    _cretval = g_unix_connection_receive_credentials(cast(GUnixConnection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.credentials.Credentials)(cast(GCredentials*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously receive credentials.
      
      For more details, see [gid.gio2.unix_connection.UnixConnection.receiveCredentials] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called. You can then call
      [gid.gio2.unix_connection.UnixConnection.receiveCredentialsFinish] to get the result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void receiveCredentialsAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    g_unix_connection_receive_credentials_async(cast(GUnixConnection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous receive credentials operation started with
      [gid.gio2.unix_connection.UnixConnection.receiveCredentialsAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: a #GCredentials, or null on error.
            Free the returned object with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gid.gio2.credentials.Credentials receiveCredentialsFinish(gid.gio2.async_result.AsyncResult result)
  {
    GCredentials* _cretval;
    GError *_err;
    _cretval = g_unix_connection_receive_credentials_finish(cast(GUnixConnection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.credentials.Credentials)(cast(GCredentials*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Receives a file descriptor from the sending end of the connection.
      The sending end has to call [gid.gio2.unix_connection.UnixConnection.sendFd] for this
      to work.
      
      As well as reading the fd this also reads a single byte from the
      stream, as this is required for fd passing to work on some
      implementations.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore
      Returns: a file descriptor on success, -1 on error.
      Throws: [ErrorWrap]
  */
  int receiveFd(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    int _retval;
    GError *_err;
    _retval = g_unix_connection_receive_fd(cast(GUnixConnection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Passes the credentials of the current user the receiving side
      of the connection. The receiving end has to call
      [gid.gio2.unix_connection.UnixConnection.receiveCredentials] (or similar) to accept the
      credentials.
      
      As well as sending the credentials this also writes a single NUL
      byte to the stream, as this is required for credentials passing to
      work on some implementations.
      
      This method can be expected to be available on the following platforms:
      
      - Linux since GLib 2.26
      - FreeBSD since GLib 2.26
      - GNU/kFreeBSD since GLib 2.36
      - Solaris, Illumos and OpenSolaris since GLib 2.40
      - GNU/Hurd since GLib 2.40
      
      Other ways to exchange credentials with a foreign peer includes the
      #GUnixCredentialsMessage type and [gid.gio2.socket.Socket.getCredentials] function.
  
      Params:
        cancellable = A #GCancellable or null.
      Returns: true on success, false if error is set.
      Throws: [ErrorWrap]
  */
  bool sendCredentials(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_unix_connection_send_credentials(cast(GUnixConnection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously send credentials.
      
      For more details, see [gid.gio2.unix_connection.UnixConnection.sendCredentials] which is
      the synchronous version of this call.
      
      When the operation is finished, callback will be called. You can then call
      [gid.gio2.unix_connection.UnixConnection.sendCredentialsFinish] to get the result of the operation.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  void sendCredentialsAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    g_unix_connection_send_credentials_async(cast(GUnixConnection*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous send credentials operation started with
      [gid.gio2.unix_connection.UnixConnection.sendCredentialsAsync].
  
      Params:
        result = a #GAsyncResult.
      Returns: true if the operation was successful, otherwise false.
      Throws: [ErrorWrap]
  */
  bool sendCredentialsFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_unix_connection_send_credentials_finish(cast(GUnixConnection*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Passes a file descriptor to the receiving side of the
      connection. The receiving end has to call [gid.gio2.unix_connection.UnixConnection.receiveFd]
      to accept the file descriptor.
      
      As well as sending the fd this also writes a single byte to the
      stream, as this is required for fd passing to work on some
      implementations.
  
      Params:
        fd = a file descriptor
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a true on success, null on error.
      Throws: [ErrorWrap]
  */
  bool sendFd(int fd, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_unix_connection_send_fd(cast(GUnixConnection*)this._cPtr, fd, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.unix_connection.UnixConnection]
class UnixConnectionGidBuilderImpl(T) : gid.gio2.socket_connection.SocketConnectionGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.unix_connection.UnixConnection]
final class UnixConnectionGidBuilder : UnixConnectionGidBuilderImpl!UnixConnectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UnixConnection build() nothrow
  {
    return new UnixConnection(cast(void*)createGObject(UnixConnection._getGType), Yes.Take);
  }
}
