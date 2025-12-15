/// Module for [Credentials] class
module gio.credentials;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import gobject.object;

/**
    The [gio.credentials.Credentials] type is a reference-counted wrapper for native
    credentials.
    
    The information in [gio.credentials.Credentials] is typically used for identifying,
    authenticating and authorizing other processes.
    
    Some operating systems supports looking up the credentials of the remote
    peer of a communication endpoint - see e.g. [gio.socket.Socket.getCredentials].
    
    Some operating systems supports securely sending and receiving
    credentials over a Unix Domain Socket, see [gio.unix_credentials_message.UnixCredentialsMessage],
    [gio.unix_connection.UnixConnection.sendCredentials] and
    [gio.unix_connection.UnixConnection.receiveCredentials] for details.
    
    On Linux, the native credential type is a `struct ucred` - see the
    [`unix(7)` man page](man:unix(7)) for details. This corresponds to
    [gio.types.CredentialsType.LinuxUcred].
    
    On Apple operating systems (including iOS, tvOS, and macOS), the native credential
    type is a `struct xucred`. This corresponds to [gio.types.CredentialsType.AppleXucred].
    
    On FreeBSD, Debian GNU/kFreeBSD, and GNU/Hurd, the native credential type is a
    `struct cmsgcred`. This corresponds to [gio.types.CredentialsType.FreebsdCmsgcred].
    
    On NetBSD, the native credential type is a `struct unpcbid`.
    This corresponds to [gio.types.CredentialsType.NetbsdUnpcbid].
    
    On OpenBSD, the native credential type is a `struct sockpeercred`.
    This corresponds to [gio.types.CredentialsType.OpenbsdSockpeercred].
    
    On Solaris (including OpenSolaris and its derivatives), the native credential type
    is a `ucred_t`. This corresponds to [gio.types.CredentialsType.SolarisUcred].
    
    Since GLib 2.72, on Windows, the native credentials may contain the PID of a
    process. This corresponds to [gio.types.CredentialsType.Win32Pid].
*/
class Credentials : gobject.object.ObjectWrap
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
    return cast(void function())g_credentials_get_type != &gidSymbolNotFound ? g_credentials_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Credentials self()
  {
    return this;
  }

  /**
      Creates a new #GCredentials object with credentials matching the
      the current process.
      Returns: A #GCredentials. Free with [gobject.object.ObjectWrap.unref].
  */
  this()
  {
    GCredentials* _cretval;
    _cretval = g_credentials_new();
    this(_cretval, Yes.Take);
  }

  /**
      Tries to get the UNIX process identifier from credentials. This
      method is only available on UNIX platforms.
      
      This operation can fail if #GCredentials is not supported on the
      OS or if the native credentials type does not contain information
      about the UNIX process ID.
      Returns: The UNIX process ID, or `-1` if error is set.
      Throws: [ErrorWrap]
  */
  int getUnixPid()
  {
    int _retval;
    GError *_err;
    _retval = g_credentials_get_unix_pid(cast(GCredentials*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Tries to get the UNIX user identifier from credentials. This
      method is only available on UNIX platforms.
      
      This operation can fail if #GCredentials is not supported on the
      OS or if the native credentials type does not contain information
      about the UNIX user.
      Returns: The UNIX user identifier or `-1` if error is set.
      Throws: [ErrorWrap]
  */
  uint getUnixUser()
  {
    uint _retval;
    GError *_err;
    _retval = g_credentials_get_unix_user(cast(GCredentials*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Checks if credentials and other_credentials is the same user.
      
      This operation can fail if #GCredentials is not supported on the
      the OS.
  
      Params:
        otherCredentials = A #GCredentials.
      Returns: true if credentials and other_credentials has the same
        user, false otherwise or if error is set.
      Throws: [ErrorWrap]
  */
  bool isSameUser(gio.credentials.Credentials otherCredentials)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_credentials_is_same_user(cast(GCredentials*)this._cPtr, otherCredentials ? cast(GCredentials*)otherCredentials._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Copies the native credentials of type native_type from native
      into credentials.
      
      It is a programming error (which will cause a warning to be
      logged) to use this method if there is no #GCredentials support for
      the OS or if native_type isn't supported by the OS.
  
      Params:
        nativeType = The type of native credentials to set.
        native = A pointer to native credentials.
  */
  void setNative(gio.types.CredentialsType nativeType, void* native)
  {
    g_credentials_set_native(cast(GCredentials*)this._cPtr, nativeType, native);
  }

  /**
      Tries to set the UNIX user identifier on credentials. This method
      is only available on UNIX platforms.
      
      This operation can fail if #GCredentials is not supported on the
      OS or if the native credentials type does not contain information
      about the UNIX user. It can also fail if the OS does not allow the
      use of "spoofed" credentials.
  
      Params:
        uid = The UNIX user identifier to set.
      Returns: true if uid was set, false if error is set.
      Throws: [ErrorWrap]
  */
  bool setUnixUser(uint uid)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_credentials_set_unix_user(cast(GCredentials*)this._cPtr, uid, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a human-readable textual representation of credentials
      that can be used in logging and debug messages. The format of the
      returned string may change in future GLib release.
      Returns: A string that should be freed with [glib.global.gfree].
  */
  string toString_()
  {
    char* _cretval;
    _cretval = g_credentials_to_string(cast(GCredentials*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
