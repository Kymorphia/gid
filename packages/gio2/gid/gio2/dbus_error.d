/// Module for [DBusError] enum namespace
module gid.gio2.dbus_error;

import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.dbus_error_entry;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.types;

/// Namespace for [DBusError] enum
struct DBusError
{
  alias Enum = gid.gio2.types.DBusError; ///

  /**
      Creates a D-Bus error name to use for error.
      
      If error matches a registered error (see
      `funcGio.DBusError.register_error`), the corresponding D-Bus error name
      will be returned.
      
      Otherwise the a name of the form
      `org.gtk.GDBus.UnmappedGError.Quark._ESCAPED_QUARK_NAME.Code_ERROR_CODE`
      will be used. This allows other GDBus applications to map the error
      on the wire back to a [gid.glib2.error.ErrorWrap] using
      `funcGio.DBusError.new_for_dbus_error`.
      
      This function is typically only used in object mappings to put a
      [gid.glib2.error.ErrorWrap] on the wire. Regular applications should not use it.
  
      Params:
        error = an error
      Returns: a D-Bus error name
  */
  static string encodeGerror(gid.glib2.error.ErrorWrap error) nothrow
  {
    char* _cretval;
    _cretval = g_dbus_error_encode_gerror(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the D-Bus error name used for error, if any.
      
      This function is guaranteed to return a D-Bus error name for all
      [gid.glib2.error.ErrorWrap]s returned from functions handling remote method calls
      (for example, [gid.gio2.dbus_connection.DBusConnection.callFinish]) unless
      `funcGio.DBusError.strip_remote_error` has already been used on error.
  
      Params:
        error = an error
      Returns: an allocated string, or `NULL` if the
          D-Bus error name could not be found
  */
  static string getRemoteError(gid.glib2.error.ErrorWrap error) nothrow
  {
    char* _cretval;
    _cretval = g_dbus_error_get_remote_error(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Checks if error represents an error received via D-Bus from a remote peer.
      
      If so, use `funcGio.DBusError.get_remote_error` to get the name of the error.
  
      Params:
        error = an error
      Returns: true if error represents an error from a remote peer; false otherwise
  */
  static bool isRemoteError(gid.glib2.error.ErrorWrap error) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_dbus_error_is_remote_error(error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a [gid.glib2.error.ErrorWrap] based on the contents of dbus_error_name and
      dbus_error_message.
      
      Errors registered with `funcGio.DBusError.register_error` will be looked
      up using dbus_error_name and if a match is found, the error domain
      and code is used. Applications can use `funcGio.DBusError.get_remote_error`
      to recover dbus_error_name.
      
      If a match against a registered error is not found and the D-Bus
      error name is in a form as returned by `funcGio.DBusError.encode_gerror`
      the error domain and code encoded in the name is used to
      create the [gid.glib2.error.ErrorWrap]. Also, dbus_error_name is added to the error
      message such that it can be recovered with
      `funcGio.DBusError.get_remote_error`.
      
      Otherwise, a [gid.glib2.error.ErrorWrap] with the error code
      `errorGio.IOErrorEnum.DBUS_ERROR`
      in the [gid.gio2.types.IOErrorEnum] error domain is returned. Also, dbus_error_name is
      added to the error message such that it can be recovered with
      `funcGio.DBusError.get_remote_error`.
      
      In all three cases, dbus_error_name can always be recovered from the
      returned [gid.glib2.error.ErrorWrap] using the `funcGio.DBusError.get_remote_error`
      function (unless `funcGio.DBusError.strip_remote_error` hasn’t been used on
      the returned error).
      
      This function is typically only used in object mappings to prepare
      [gid.glib2.error.ErrorWrap] instances for applications. Regular applications should not
      use it.
  
      Params:
        dbusErrorName = D-Bus error name
        dbusErrorMessage = D-Bus error message
      Returns: an allocated [gid.glib2.error.ErrorWrap]
  */
  static gid.glib2.error.ErrorWrap newForDbusError(string dbusErrorName, string dbusErrorMessage) nothrow
  {
    GError* _cretval;
    const(char)* _dbusErrorName = dbusErrorName.toCString!(No.Malloc, No.Nullable);
    const(char)* _dbusErrorMessage = dbusErrorMessage.toCString!(No.Malloc, No.Nullable);
    _cretval = g_dbus_error_new_for_dbus_error(_dbusErrorName, _dbusErrorMessage);
    auto _retval = _cretval ? new gid.glib2.error.ErrorWrap(cast(GError*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  static gid.glib2.types.Quark quark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = g_dbus_error_quark();
    return _retval;
  }

  /**
      Creates an association mapping between dbus_error_name and
      [gid.glib2.error.ErrorWrap]s specified by error_domain and error_code.
      
      This is typically done in the function that returns the [gid.glib2.types.uint] for
      an error domain.
  
      Params:
        errorDomain = a [gid.glib2.types.uint] for an error domain
        errorCode = an error code
        dbusErrorName = a D-Bus error name
      Returns: true if the association was created, false if it already
          exists
  */
  static bool registerError(gid.glib2.types.Quark errorDomain, int errorCode, string dbusErrorName) nothrow
  {
    bool _retval;
    const(char)* _dbusErrorName = dbusErrorName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_dbus_error_register_error(errorDomain, errorCode, _dbusErrorName);
    return _retval;
  }

  /**
      Helper function for associating a [gid.glib2.error.ErrorWrap] error domain with D-Bus
      error names.
      
      While quark_volatile has a `volatile` qualifier, this is a historical
      artifact and the argument passed to it should not be `volatile`.
  
      Params:
        errorDomainQuarkName = the error domain name
        quarkVolatile = return location for the [gid.glib2.types.uint] representing the
            error domain
        entries = items to register
  */
  static void registerErrorDomain(string errorDomainQuarkName, out size_t quarkVolatile, gid.gio2.dbus_error_entry.DBusErrorEntry[] entries) nothrow
  {
    const(char)* _errorDomainQuarkName = errorDomainQuarkName.toCString!(No.Malloc, No.Nullable);
    uint _numEntries;
    if (entries)
      _numEntries = cast(uint)entries.length;

    auto _entries_arr = new GDBusErrorEntry[](entries.length);
    auto _entries = _entries_arr.ptr;
    foreach (i, obj; entries) _entries[i] = *cast(GDBusErrorEntry*)obj._cPtr;
    g_dbus_error_register_error_domain(_errorDomainQuarkName, cast(size_t*)&quarkVolatile, _entries, _numEntries);
  }

  /**
      Looks for extra information in the error message used to recover
      the D-Bus error name and strips it if found.
      
      If stripped, the
      message field in error will correspond exactly to what was
      received on the wire.
      
      This is typically used when presenting errors to the end user.
  
      Params:
        error = an error
      Returns: true if information was stripped; false otherwise
  */
  static bool stripRemoteError(gid.glib2.error.ErrorWrap error) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_dbus_error_strip_remote_error(error ? cast(GError*)error._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Destroys an association previously set up with
      `funcGio.DBusError.register_error`.
  
      Params:
        errorDomain = a [gid.glib2.types.uint] for an error domain
        errorCode = an error code
        dbusErrorName = a D-Bus error name
      Returns: true if the association was destroyed, false if it wasn’t found
  */
  static bool unregisterError(gid.glib2.types.Quark errorDomain, int errorCode, string dbusErrorName) nothrow
  {
    bool _retval;
    const(char)* _dbusErrorName = dbusErrorName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_dbus_error_unregister_error(errorDomain, errorCode, _dbusErrorName);
    return _retval;
  }
}

class DBusException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.gio2.dbus_error.DBusError.quark, cast(int)code, msg);
  }

  alias Code = gid.gio2.types.DBusError;
}
