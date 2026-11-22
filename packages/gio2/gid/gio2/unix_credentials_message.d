/// Module for [UnixCredentialsMessage] class
module gid.gio2.unix_credentials_message;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.credentials;
import gid.gio2.socket_control_message;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    This [gid.gio2.socket_control_message.SocketControlMessage] contains a [gid.gio2.credentials.Credentials]
    instance.  It may be sent using [gid.gio2.socket.Socket.sendMessage] and received
    using [gid.gio2.socket.Socket.receiveMessage] over UNIX sockets (ie: sockets in
    the [gid.gio2.types.SocketFamily.Unix] family).
    
    For an easier way to send and receive credentials over
    stream-oriented UNIX sockets, see
    [gid.gio2.unix_connection.UnixConnection.sendCredentials] and
    [gid.gio2.unix_connection.UnixConnection.receiveCredentials]. To receive credentials of
    a foreign process connected to a socket, use
    [gid.gio2.socket.Socket.getCredentials].
    
    Since GLib 2.72, `GUnixCredentialMessage` is available on all platforms. It
    requires underlying system support (such as Windows 10 with `AF_UNIX`) at run
    time.
    
    Before GLib 2.72, `<gio/gunixcredentialsmessage.h>` belonged to the UNIX-specific
    GIO interfaces, thus you had to use the `gio-unix-2.0.pc` pkg-config file
    when using it. This is no longer necessary since GLib 2.72.
*/
class UnixCredentialsMessage : gid.gio2.socket_control_message.SocketControlMessage
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
    return cast(void function())g_unix_credentials_message_get_type != &gidSymbolNotFound ? g_unix_credentials_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GUnixCredentialsMessage";
  }

  /** Returns `this`, for use in `with` statements. */
  override UnixCredentialsMessage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.unix_credentials_message.UnixCredentialsMessage]
      Returns: New builder object
  */
  static UnixCredentialsMessageGidBuilder builder() nothrow
  {
    return new UnixCredentialsMessageGidBuilder;
  }

  /**
      Get `credentials` property.
      Returns: The credentials stored in the message.
  */
  @property gid.gio2.credentials.Credentials credentials() nothrow
  {
    return getCredentials();
  }

  /**
      Creates a new #GUnixCredentialsMessage with credentials matching the current processes.
      Returns: a new #GUnixCredentialsMessage
  */
  this() nothrow
  {
    GSocketControlMessage* _cretval;
    _cretval = g_unix_credentials_message_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GUnixCredentialsMessage holding credentials.
  
      Params:
        credentials = A #GCredentials object.
      Returns: a new #GUnixCredentialsMessage
  */
  static gid.gio2.unix_credentials_message.UnixCredentialsMessage newWithCredentials(gid.gio2.credentials.Credentials credentials) nothrow
  {
    GSocketControlMessage* _cretval;
    _cretval = g_unix_credentials_message_new_with_credentials(credentials ? cast(GCredentials*)credentials._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.unix_credentials_message.UnixCredentialsMessage)(cast(GSocketControlMessage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if passing #GCredentials on a #GSocket is supported on this platform.
      Returns: true if supported, false otherwise
  */
  static bool isSupported() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_unix_credentials_message_is_supported();
    return _retval;
  }

  /**
      Gets the credentials stored in message.
      Returns: A #GCredentials instance. Do not free, it is owned by message.
  */
  gid.gio2.credentials.Credentials getCredentials() nothrow
  {
    GCredentials* _cretval;
    _cretval = g_unix_credentials_message_get_credentials(cast(GUnixCredentialsMessage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.credentials.Credentials)(cast(GCredentials*)_cretval, No.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.unix_credentials_message.UnixCredentialsMessage]
class UnixCredentialsMessageGidBuilderImpl(T) : gid.gio2.socket_control_message.SocketControlMessageGidBuilderImpl!T
{

  /**
      Set `credentials` property.
      Params:
        propval = The credentials stored in the message.
      Returns: Builder instance for fluent chaining
  */
  T credentials(gid.gio2.credentials.Credentials propval) nothrow
  {
    return setProperty("credentials", propval);
  }
}

/// Fluent builder for [gid.gio2.unix_credentials_message.UnixCredentialsMessage]
final class UnixCredentialsMessageGidBuilder : UnixCredentialsMessageGidBuilderImpl!UnixCredentialsMessageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  UnixCredentialsMessage build() nothrow
  {
    return new UnixCredentialsMessage(cast(void*)createGObject(UnixCredentialsMessage._getGType), Yes.Take);
  }
}
