/// Module for [DBusError] enum namespace
module gio.dbus_error;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.dbus_error_entry;
import gio.types;
import glib.error;
import glib.types;

/// Namespace for [DBusError] enum
struct DBusError
{
  alias Enum = gio.types.DBusError; ///

  /**
      Creates a D-Bus error name to use for error. If error matches
      a registered error (cf. [gio.global.dbusErrorRegisterError]), the corresponding
      D-Bus error name will be returned.
      
      Otherwise the a name of the form
      `org.gtk.GDBus.UnmappedGError.Quark._ESCAPED_QUARK_NAME.Code_ERROR_CODE`
      will be used. This allows other GDBus applications to map the error
      on the wire back to a #GError using [gio.global.dbusErrorNewForDbusError].
      
      This function is typically only used in object mappings to put a
      #GError on the wire. Regular applications should not use it.
  
      Params:
        error = A #GError.
      Returns: A D-Bus error name (never null).
            Free with [glib.global.gfree].
  */
  static string encodeGerror(glib.error.ErrorWrap error)
  {
    char* _cretval;
    _cretval = g_dbus_error_encode_gerror(error ? cast(const(GError)*)error._cPtr : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the D-Bus error name used for error, if any.
      
      This function is guaranteed to return a D-Bus error name for all
      #GErrors returned from functions handling remote method calls
      (e.g. [gio.dbus_connection.DBusConnection.callFinish]) unless
      [gio.global.dbusErrorStripRemoteError] has been used on error.
  
      Params:
        error = a #GError
      Returns: an allocated string or null if the
            D-Bus error name could not be found. Free with [glib.global.gfree].
  */
  static string getRemoteError(glib.error.ErrorWrap error)
  {
    char* _cretval;
    _cretval = g_dbus_error_get_remote_error(error ? cast(const(GError)*)error._cPtr : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Checks if error represents an error received via D-Bus from a remote peer. If so,
      use [gio.global.dbusErrorGetRemoteError] to get the name of the error.
  
      Params:
        error = A #GError.
      Returns: true if error represents an error from a remote peer,
        false otherwise.
  */
  static bool isRemoteError(glib.error.ErrorWrap error)
  {
    bool _retval;
    _retval = cast(bool)g_dbus_error_is_remote_error(error ? cast(const(GError)*)error._cPtr : null);
    return _retval;
  }

  /**
      Creates a #GError based on the contents of dbus_error_name and
      dbus_error_message.
      
      Errors registered with [gio.global.dbusErrorRegisterError] will be looked
      up using dbus_error_name and if a match is found, the error domain
      and code is used. Applications can use [gio.global.dbusErrorGetRemoteError]
      to recover dbus_error_name.
      
      If a match against a registered error is not found and the D-Bus
      error name is in a form as returned by [gio.global.dbusErrorEncodeGerror]
      the error domain and code encoded in the name is used to
      create the #GError. Also, dbus_error_name is added to the error message
      such that it can be recovered with [gio.global.dbusErrorGetRemoteError].
      
      Otherwise, a #GError with the error code [gio.types.IOErrorEnum.DbusError]
      in the `G_IO_ERROR` error domain is returned. Also, dbus_error_name is
      added to the error message such that it can be recovered with
      [gio.global.dbusErrorGetRemoteError].
      
      In all three cases, dbus_error_name can always be recovered from the
      returned #GError using the [gio.global.dbusErrorGetRemoteError] function
      (unless [gio.global.dbusErrorStripRemoteError] hasn't been used on the returned error).
      
      This function is typically only used in object mappings to prepare
      #GError instances for applications. Regular applications should not use
      it.
  
      Params:
        dbusErrorName = D-Bus error name.
        dbusErrorMessage = D-Bus error message.
      Returns: An allocated #GError. Free with [glib.error.ErrorWrap.free].
  */
  static glib.error.ErrorWrap newForDbusError(string dbusErrorName, string dbusErrorMessage)
  {
    GError* _cretval;
    const(char)* _dbusErrorName = dbusErrorName.toCString(No.Alloc);
    const(char)* _dbusErrorMessage = dbusErrorMessage.toCString(No.Alloc);
    _cretval = g_dbus_error_new_for_dbus_error(_dbusErrorName, _dbusErrorMessage);
    auto _retval = _cretval ? new glib.error.ErrorWrap(cast(GError*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static glib.types.Quark quark()
  {
    glib.types.Quark _retval;
    _retval = g_dbus_error_quark();
    return _retval;
  }

  /**
      Creates an association to map between dbus_error_name and
      #GErrors specified by error_domain and error_code.
      
      This is typically done in the routine that returns the #GQuark for
      an error domain.
  
      Params:
        errorDomain = A #GQuark for an error domain.
        errorCode = An error code.
        dbusErrorName = A D-Bus error name.
      Returns: true if the association was created, false if it already
        exists.
  */
  static bool registerError(glib.types.Quark errorDomain, int errorCode, string dbusErrorName)
  {
    bool _retval;
    const(char)* _dbusErrorName = dbusErrorName.toCString(No.Alloc);
    _retval = cast(bool)g_dbus_error_register_error(errorDomain, errorCode, _dbusErrorName);
    return _retval;
  }

  /**
      Helper function for associating a #GError error domain with D-Bus error names.
      
      While quark_volatile has a `volatile` qualifier, this is a historical
      artifact and the argument passed to it should not be `volatile`.
  
      Params:
        errorDomainQuarkName = The error domain name.
        quarkVolatile = A pointer where to store the #GQuark.
        entries = A pointer to num_entries #GDBusErrorEntry struct items.
  */
  static void registerErrorDomain(string errorDomainQuarkName, out size_t quarkVolatile, gio.dbus_error_entry.DBusErrorEntry[] entries)
  {
    const(char)* _errorDomainQuarkName = errorDomainQuarkName.toCString(No.Alloc);
    uint _numEntries;
    if (entries)
      _numEntries = cast(uint)entries.length;

    GDBusErrorEntry[] _tmpentries;
    foreach (obj; entries)
      _tmpentries ~= obj._cInstance;
    const(GDBusErrorEntry)* _entries = _tmpentries.ptr;

    g_dbus_error_register_error_domain(_errorDomainQuarkName, cast(size_t*)&quarkVolatile, _entries, _numEntries);
  }

  /**
      Looks for extra information in the error message used to recover
      the D-Bus error name and strips it if found. If stripped, the
      message field in error will correspond exactly to what was
      received on the wire.
      
      This is typically used when presenting errors to the end user.
  
      Params:
        error = A #GError.
      Returns: true if information was stripped, false otherwise.
  */
  static bool stripRemoteError(glib.error.ErrorWrap error)
  {
    bool _retval;
    _retval = cast(bool)g_dbus_error_strip_remote_error(error ? cast(GError*)error._cPtr : null);
    return _retval;
  }

  /**
      Destroys an association previously set up with [gio.global.dbusErrorRegisterError].
  
      Params:
        errorDomain = A #GQuark for an error domain.
        errorCode = An error code.
        dbusErrorName = A D-Bus error name.
      Returns: true if the association was destroyed, false if it wasn't found.
  */
  static bool unregisterError(glib.types.Quark errorDomain, int errorCode, string dbusErrorName)
  {
    bool _retval;
    const(char)* _dbusErrorName = dbusErrorName.toCString(No.Alloc);
    _retval = cast(bool)g_dbus_error_unregister_error(errorDomain, errorCode, _dbusErrorName);
    return _retval;
  }
}

class DBusException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gio.dbus_error.DBusError.quark, cast(int)code, msg);
  }

  alias Code = gio.types.DBusError;
}
