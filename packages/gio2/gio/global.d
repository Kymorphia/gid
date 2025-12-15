/// Global functions for gio2 library
module gio.global;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.dbus_connection;
import gio.file;
import gio.icon;
import gio.input_stream;
import gio.iomodule_scope;
import gio.ioscheduler_job;
import gio.iostream;
import gio.output_stream;
import gio.resource;
import gio.settings_backend;
import gio.types;
import gio.unix_mount_entry;
import gio.unix_mount_point;
import glib.bytes;
import glib.error;
import glib.source;
import glib.types;
import glib.variant;
import glib.variant_type;
import gobject.closure;
import gobject.object;
import gobject.value;


/**
    Asynchronously connects to the message bus specified by bus_type.
    
    When the operation is finished, callback will be invoked. You can
    then call [gio.global.busGetFinish] to get the result of the operation.
    
    This is an asynchronous failable function. See [gio.global.busGetSync] for
    the synchronous version.

    Params:
      busType = a #GBusType
      cancellable = a #GCancellable or null
      callback = a #GAsyncReadyCallback to call when the request is satisfied
*/
void busGet(gio.types.BusType busType, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

    (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
  }
  auto _callbackCB = callback ? &_callbackCallback : null;

  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  g_bus_get(busType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Finishes an operation started with [gio.global.busGet].
    
    The returned object is a singleton, that is, shared with other
    callers of [gio.global.busGet] and [gio.global.busGetSync] for bus_type. In the
    event that you need a private message bus connection, use
    [gio.global.dbusAddressGetForBusSync] and
    [gio.dbus_connection.DBusConnection.newForAddress] with
    G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT and
    G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION flags.
    
    Note that the returned #GDBusConnection object will (usually) have
    the #GDBusConnection:exit-on-close property set to true.

    Params:
      res = a #GAsyncResult obtained from the #GAsyncReadyCallback passed
            to [gio.global.busGet]
    Returns: a #GDBusConnection or null if error is set.
          Free with [gobject.object.ObjectWrap.unref].
    Throws: [ErrorWrap]
*/
gio.dbus_connection.DBusConnection busGetFinish(gio.async_result.AsyncResult res)
{
  GDBusConnection* _cretval;
  GError *_err;
  _cretval = g_bus_get_finish(res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, Yes.Take);
  return _retval;
}

/**
    Synchronously connects to the message bus specified by bus_type.
    Note that the returned object may shared with other callers,
    e.g. if two separate parts of a process calls this function with
    the same bus_type, they will share the same object.
    
    This is a synchronous failable function. See [gio.global.busGet] and
    [gio.global.busGetFinish] for the asynchronous version.
    
    The returned object is a singleton, that is, shared with other
    callers of [gio.global.busGet] and [gio.global.busGetSync] for bus_type. In the
    event that you need a private message bus connection, use
    [gio.global.dbusAddressGetForBusSync] and
    [gio.dbus_connection.DBusConnection.newForAddress] with
    G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT and
    G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION flags.
    
    Note that the returned #GDBusConnection object will (usually) have
    the #GDBusConnection:exit-on-close property set to true.

    Params:
      busType = a #GBusType
      cancellable = a #GCancellable or null
    Returns: a #GDBusConnection or null if error is set.
          Free with [gobject.object.ObjectWrap.unref].
    Throws: [ErrorWrap]
*/
gio.dbus_connection.DBusConnection busGetSync(gio.types.BusType busType, gio.cancellable.Cancellable cancellable = null)
{
  GDBusConnection* _cretval;
  GError *_err;
  _cretval = g_bus_get_sync(busType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.dbus_connection.DBusConnection)(cast(GDBusConnection*)_cretval, Yes.Take);
  return _retval;
}

/**
    Version of [gio.global.busOwnNameOnConnection] using closures instead of
    callbacks for easier binding in other languages.

    Params:
      connection = a #GDBusConnection
      name = the well-known name to own
      flags = a set of flags from the #GBusNameOwnerFlags enumeration
      nameAcquiredClosure = #GClosure to invoke when name is
            acquired or null
      nameLostClosure = #GClosure to invoke when name is lost
            or null
    Returns: an identifier (never 0) that can be used with
          [gio.global.busUnownName] to stop owning the name.
*/
uint busOwnNameOnConnection(gio.dbus_connection.DBusConnection connection, string name, gio.types.BusNameOwnerFlags flags, gobject.closure.Closure nameAcquiredClosure = null, gobject.closure.Closure nameLostClosure = null)
{
  uint _retval;
  const(char)* _name = name.toCString(No.Alloc);
  _retval = g_bus_own_name_on_connection_with_closures(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _name, flags, nameAcquiredClosure ? cast(GClosure*)nameAcquiredClosure._cPtr(No.Dup) : null, nameLostClosure ? cast(GClosure*)nameLostClosure._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Version of [gio.global.busOwnName] using closures instead of callbacks for
    easier binding in other languages.

    Params:
      busType = the type of bus to own a name on
      name = the well-known name to own
      flags = a set of flags from the #GBusNameOwnerFlags enumeration
      busAcquiredClosure = #GClosure to invoke when connected to
            the bus of type bus_type or null
      nameAcquiredClosure = #GClosure to invoke when name is
            acquired or null
      nameLostClosure = #GClosure to invoke when name is lost or
            null
    Returns: an identifier (never 0) that can be used with
          [gio.global.busUnownName] to stop owning the name.
*/
uint busOwnName(gio.types.BusType busType, string name, gio.types.BusNameOwnerFlags flags, gobject.closure.Closure busAcquiredClosure = null, gobject.closure.Closure nameAcquiredClosure = null, gobject.closure.Closure nameLostClosure = null)
{
  uint _retval;
  const(char)* _name = name.toCString(No.Alloc);
  _retval = g_bus_own_name_with_closures(busType, _name, flags, busAcquiredClosure ? cast(GClosure*)busAcquiredClosure._cPtr(No.Dup) : null, nameAcquiredClosure ? cast(GClosure*)nameAcquiredClosure._cPtr(No.Dup) : null, nameLostClosure ? cast(GClosure*)nameLostClosure._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Stops owning a name.
    
    Note that there may still be D-Bus traffic to process (relating to owning
    and unowning the name) in the current thread-default #GMainContext after
    this function has returned. You should continue to iterate the #GMainContext
    until the #GDestroyNotify function passed to [gio.global.busOwnName] is called, in
    order to avoid memory leaks through callbacks queued on the #GMainContext
    after it’s stopped being iterated.

    Params:
      ownerId = an identifier obtained from [gio.global.busOwnName]
*/
void busUnownName(uint ownerId)
{
  g_bus_unown_name(ownerId);
}

/**
    Stops watching a name.
    
    Note that there may still be D-Bus traffic to process (relating to watching
    and unwatching the name) in the current thread-default #GMainContext after
    this function has returned. You should continue to iterate the #GMainContext
    until the #GDestroyNotify function passed to [gio.global.busWatchName] is called, in
    order to avoid memory leaks through callbacks queued on the #GMainContext
    after it’s stopped being iterated.

    Params:
      watcherId = An identifier obtained from [gio.global.busWatchName]
*/
void busUnwatchName(uint watcherId)
{
  g_bus_unwatch_name(watcherId);
}

/**
    Version of [gio.global.busWatchNameOnConnection] using closures instead of callbacks for
    easier binding in other languages.

    Params:
      connection = A #GDBusConnection.
      name = The name (well-known or unique) to watch.
      flags = Flags from the #GBusNameWatcherFlags enumeration.
      nameAppearedClosure = #GClosure to invoke when name is known
        to exist or null.
      nameVanishedClosure = #GClosure to invoke when name is known
        to not exist or null.
    Returns: An identifier (never 0) that can be used with
      [gio.global.busUnwatchName] to stop watching the name.
*/
uint busWatchNameOnConnection(gio.dbus_connection.DBusConnection connection, string name, gio.types.BusNameWatcherFlags flags, gobject.closure.Closure nameAppearedClosure = null, gobject.closure.Closure nameVanishedClosure = null)
{
  uint _retval;
  const(char)* _name = name.toCString(No.Alloc);
  _retval = g_bus_watch_name_on_connection_with_closures(connection ? cast(GDBusConnection*)connection._cPtr(No.Dup) : null, _name, flags, nameAppearedClosure ? cast(GClosure*)nameAppearedClosure._cPtr(No.Dup) : null, nameVanishedClosure ? cast(GClosure*)nameVanishedClosure._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Version of [gio.global.busWatchName] using closures instead of callbacks for
    easier binding in other languages.

    Params:
      busType = The type of bus to watch a name on.
      name = The name (well-known or unique) to watch.
      flags = Flags from the #GBusNameWatcherFlags enumeration.
      nameAppearedClosure = #GClosure to invoke when name is known
        to exist or null.
      nameVanishedClosure = #GClosure to invoke when name is known
        to not exist or null.
    Returns: An identifier (never 0) that can be used with
      [gio.global.busUnwatchName] to stop watching the name.
*/
uint busWatchName(gio.types.BusType busType, string name, gio.types.BusNameWatcherFlags flags, gobject.closure.Closure nameAppearedClosure = null, gobject.closure.Closure nameVanishedClosure = null)
{
  uint _retval;
  const(char)* _name = name.toCString(No.Alloc);
  _retval = g_bus_watch_name_with_closures(busType, _name, flags, nameAppearedClosure ? cast(GClosure*)nameAppearedClosure._cPtr(No.Dup) : null, nameVanishedClosure ? cast(GClosure*)nameVanishedClosure._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Checks if a content type can be executable. Note that for instance
    things like text files can be executables (i.e. scripts and batch files).

    Params:
      type = a content type string
    Returns: true if the file type corresponds to a type that
          can be executable, false otherwise.
*/
bool contentTypeCanBeExecutable(string type)
{
  bool _retval;
  const(char)* _type = type.toCString(No.Alloc);
  _retval = cast(bool)g_content_type_can_be_executable(_type);
  return _retval;
}

/**
    Compares two content types for equality.

    Params:
      type1 = a content type string
      type2 = a content type string
    Returns: true if the two strings are identical or equivalent,
          false otherwise.
*/
bool contentTypeEquals(string type1, string type2)
{
  bool _retval;
  const(char)* _type1 = type1.toCString(No.Alloc);
  const(char)* _type2 = type2.toCString(No.Alloc);
  _retval = cast(bool)g_content_type_equals(_type1, _type2);
  return _retval;
}

/**
    Tries to find a content type based on the mime type name.

    Params:
      mimeType = a mime type string
    Returns: Newly allocated string with content type or
          null. Free with [glib.global.gfree]
*/
string contentTypeFromMimeType(string mimeType)
{
  char* _cretval;
  const(char)* _mimeType = mimeType.toCString(No.Alloc);
  _cretval = g_content_type_from_mime_type(_mimeType);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the human readable description of the content type.

    Params:
      type = a content type string
    Returns: a short description of the content type type. Free the
          returned string with [glib.global.gfree]
*/
string contentTypeGetDescription(string type)
{
  char* _cretval;
  const(char)* _type = type.toCString(No.Alloc);
  _cretval = g_content_type_get_description(_type);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the generic icon name for a content type.
    
    See the
    [shared-mime-info](http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec)
    specification for more on the generic icon name.

    Params:
      type = a content type string
    Returns: the registered generic icon name for the given type,
          or null if unknown. Free with [glib.global.gfree]
*/
string contentTypeGetGenericIconName(string type)
{
  char* _cretval;
  const(char)* _type = type.toCString(No.Alloc);
  _cretval = g_content_type_get_generic_icon_name(_type);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the icon for a content type.

    Params:
      type = a content type string
    Returns: #GIcon corresponding to the content type. Free the returned
          object with [gobject.object.ObjectWrap.unref]
*/
gio.icon.Icon contentTypeGetIcon(string type)
{
  GIcon* _cretval;
  const(char)* _type = type.toCString(No.Alloc);
  _cretval = g_content_type_get_icon(_type);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
  return _retval;
}

/**
    Get the list of directories which MIME data is loaded from. See
    [gio.global.contentTypeSetMimeDirs] for details.
    Returns: null-terminated list of
         directories to load MIME data from, including any `mime/` subdirectory,
         and with the first directory to try listed first
*/
string[] contentTypeGetMimeDirs()
{
  const(char*)* _cretval;
  _cretval = g_content_type_get_mime_dirs();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Gets the mime type for the content type, if one is registered.

    Params:
      type = a content type string
    Returns: the registered mime type for the
          given type, or null if unknown; free with [glib.global.gfree].
*/
string contentTypeGetMimeType(string type)
{
  char* _cretval;
  const(char)* _type = type.toCString(No.Alloc);
  _cretval = g_content_type_get_mime_type(_type);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the symbolic icon for a content type.

    Params:
      type = a content type string
    Returns: symbolic #GIcon corresponding to the content type.
          Free the returned object with [gobject.object.ObjectWrap.unref]
*/
gio.icon.Icon contentTypeGetSymbolicIcon(string type)
{
  GIcon* _cretval;
  const(char)* _type = type.toCString(No.Alloc);
  _cretval = g_content_type_get_symbolic_icon(_type);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
  return _retval;
}

/**
    Guesses the content type based on example data. If the function is
    uncertain, result_uncertain will be set to true. Either filename
    or data may be null, in which case the guess will be based solely
    on the other argument.

    Params:
      filename = a path, or null
      data = a stream of data, or null
      resultUncertain = return location for the certainty
            of the result, or null
    Returns: a string indicating a guessed content type for the
          given data. Free with [glib.global.gfree]
*/
string contentTypeGuess(string filename, ubyte[] data, out bool resultUncertain)
{
  char* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  size_t _dataSize;
  if (data)
    _dataSize = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  gboolean _resultUncertain;
  _cretval = g_content_type_guess(_filename, _data, _dataSize, &_resultUncertain);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  resultUncertain = cast(bool)_resultUncertain;
  return _retval;
}

/**
    Tries to guess the type of the tree with root root, by
    looking at the files it contains. The result is an array
    of content types, with the best guess coming first.
    
    The types returned all have the form x-content/foo, e.g.
    x-content/audio-cdda (for audio CDs) or x-content/image-dcf
    (for a camera memory card). See the
    [shared-mime-info](http://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec)
    specification for more on x-content types.
    
    This function is useful in the implementation of
    [gio.mount.Mount.guessContentType].

    Params:
      root = the root of the tree to guess a type for
    Returns: an null-terminated
          array of zero or more content types. Free with [glib.global.strfreev]
*/
string[] contentTypeGuessForTree(gio.file.File root)
{
  char** _cretval;
  _cretval = g_content_type_guess_for_tree(root ? cast(GFile*)(cast(gobject.object.ObjectWrap)root)._cPtr(No.Dup) : null);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Determines if type is a subset of supertype.

    Params:
      type = a content type string
      supertype = a content type string
    Returns: true if type is a kind of supertype,
          false otherwise.
*/
bool contentTypeIsA(string type, string supertype)
{
  bool _retval;
  const(char)* _type = type.toCString(No.Alloc);
  const(char)* _supertype = supertype.toCString(No.Alloc);
  _retval = cast(bool)g_content_type_is_a(_type, _supertype);
  return _retval;
}

/**
    Determines if type is a subset of mime_type.
    Convenience wrapper around [gio.global.contentTypeIsA].

    Params:
      type = a content type string
      mimeType = a mime type string
    Returns: true if type is a kind of mime_type,
          false otherwise.
*/
bool contentTypeIsMimeType(string type, string mimeType)
{
  bool _retval;
  const(char)* _type = type.toCString(No.Alloc);
  const(char)* _mimeType = mimeType.toCString(No.Alloc);
  _retval = cast(bool)g_content_type_is_mime_type(_type, _mimeType);
  return _retval;
}

/**
    Checks if the content type is the generic "unknown" type.
    On UNIX this is the "application/octet-stream" mimetype,
    while on win32 it is "*" and on OSX it is a dynamic type
    or octet-stream.

    Params:
      type = a content type string
    Returns: true if the type is the unknown type.
*/
bool contentTypeIsUnknown(string type)
{
  bool _retval;
  const(char)* _type = type.toCString(No.Alloc);
  _retval = cast(bool)g_content_type_is_unknown(_type);
  return _retval;
}

/**
    Set the list of directories used by GIO to load the MIME database.
    If dirs is null, the directories used are the default:
    
     $(LIST
        * the `mime` subdirectory of the directory in `$XDG_DATA_HOME`
        * the `mime` subdirectory of every directory in `$XDG_DATA_DIRS`
     )
       
    This function is intended to be used when writing tests that depend on
    information stored in the MIME database, in order to control the data.
    
    Typically, in case your tests use `G_TEST_OPTION_ISOLATE_DIRS`, but they
    depend on the system’s MIME database, you should call this function
    with dirs set to null before calling [glib.global.testInit], for instance:
    
    ```c
      // Load MIME data from the system
      g_content_type_set_mime_dirs (NULL);
      // Isolate the environment
      g_test_init (&argc, &argv, G_TEST_OPTION_ISOLATE_DIRS, NULL);
    
      …
    
      return g_test_run ();
    ```

    Params:
      dirs = null-terminated list of
           directories to load MIME data from, including any `mime/` subdirectory,
           and with the first directory to try listed first
*/
void contentTypeSetMimeDirs(string[] dirs = null)
{
  char*[] _tmpdirs;
  foreach (s; dirs)
    _tmpdirs ~= s.toCString(No.Alloc);
  _tmpdirs ~= null;
  const(char*)* _dirs = _tmpdirs.ptr;
  g_content_type_set_mime_dirs(_dirs);
}

/**
    Gets a list of strings containing all the registered content types
    known to the system. The list and its data should be freed using
    `g_list_free_full (list, g_free)`.
    Returns: list of the registered
          content types
*/
string[] contentTypesGetRegistered()
{
  GList* _cretval;
  _cretval = g_content_types_get_registered();
  auto _retval = gListToD!(string, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Escape string so it can appear in a D-Bus address as the value
    part of a key-value pair.
    
    For instance, if string is `/run/bus-for-:0`,
    this function would return `/run/bus-for-`3A0``,
    which could be used in a D-Bus address like
    `unix:nonce-tcp:host=127.0.0.1,port=42,noncefile=/run/bus-for-`3A0``.

    Params:
      string_ = an unescaped string to be included in a D-Bus address
            as the value in a key-value pair
    Returns: a copy of string with all
          non-optionally-escaped bytes escaped
*/
string dbusAddressEscapeValue(string string_)
{
  char* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = g_dbus_address_escape_value(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Synchronously looks up the D-Bus address for the well-known message
    bus instance specified by bus_type. This may involve using various
    platform specific mechanisms.
    
    The returned address will be in the
    [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).

    Params:
      busType = a #GBusType
      cancellable = a #GCancellable or null
    Returns: a valid D-Bus address string for bus_type or
          null if error is set
    Throws: [ErrorWrap]
*/
string dbusAddressGetForBusSync(gio.types.BusType busType, gio.cancellable.Cancellable cancellable = null)
{
  char* _cretval;
  GError *_err;
  _cretval = g_dbus_address_get_for_bus_sync(busType, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Asynchronously connects to an endpoint specified by address and
    sets up the connection so it is in a state to run the client-side
    of the D-Bus authentication conversation. address must be in the
    [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).
    
    When the operation is finished, callback will be invoked. You can
    then call [gio.global.dbusAddressGetStreamFinish] to get the result of
    the operation.
    
    This is an asynchronous failable function. See
    [gio.global.dbusAddressGetStreamSync] for the synchronous version.

    Params:
      address = A valid D-Bus address.
      cancellable = A #GCancellable or null.
      callback = A #GAsyncReadyCallback to call when the request is satisfied.
*/
void dbusAddressGetStream(string address, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

    (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
  }
  auto _callbackCB = callback ? &_callbackCallback : null;

  const(char)* _address = address.toCString(No.Alloc);
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  g_dbus_address_get_stream(_address, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Finishes an operation started with [gio.global.dbusAddressGetStream].
    
    A server is not required to set a GUID, so out_guid may be set to null
    even on success.

    Params:
      res = A #GAsyncResult obtained from the GAsyncReadyCallback passed to [gio.global.dbusAddressGetStream].
      outGuid = null or return location to store the GUID extracted from address, if any.
    Returns: A #GIOStream or null if error is set.
    Throws: [ErrorWrap]
*/
gio.iostream.IOStream dbusAddressGetStreamFinish(gio.async_result.AsyncResult res, out string outGuid)
{
  GIOStream* _cretval;
  char* _outGuid;
  GError *_err;
  _cretval = g_dbus_address_get_stream_finish(res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_outGuid, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.iostream.IOStream)(cast(GIOStream*)_cretval, Yes.Take);
  outGuid = _outGuid.fromCString(Yes.Free);
  return _retval;
}

/**
    Synchronously connects to an endpoint specified by address and
    sets up the connection so it is in a state to run the client-side
    of the D-Bus authentication conversation. address must be in the
    [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).
    
    A server is not required to set a GUID, so out_guid may be set to null
    even on success.
    
    This is a synchronous failable function. See
    [gio.global.dbusAddressGetStream] for the asynchronous version.

    Params:
      address = A valid D-Bus address.
      outGuid = null or return location to store the GUID extracted from address, if any.
      cancellable = A #GCancellable or null.
    Returns: A #GIOStream or null if error is set.
    Throws: [ErrorWrap]
*/
gio.iostream.IOStream dbusAddressGetStreamSync(string address, out string outGuid, gio.cancellable.Cancellable cancellable = null)
{
  GIOStream* _cretval;
  const(char)* _address = address.toCString(No.Alloc);
  char* _outGuid;
  GError *_err;
  _cretval = g_dbus_address_get_stream_sync(_address, &_outGuid, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.iostream.IOStream)(cast(GIOStream*)_cretval, Yes.Take);
  outGuid = _outGuid.fromCString(Yes.Free);
  return _retval;
}

/**
    This is a language binding friendly version of [gio.global.dbusEscapeObjectPathBytestring].

    Params:
      s = the string to escape
    Returns: an escaped version of `s`. Free with [glib.global.gfree].
*/
string dbusEscapeObjectPath(string s)
{
  char* _cretval;
  const(char)* _s = s.toCString(No.Alloc);
  _cretval = g_dbus_escape_object_path(_s);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Escapes bytes for use in a D-Bus object path component.
    bytes is an array of zero or more nonzero bytes in an
    unspecified encoding, followed by a single zero byte.
    
    The escaping method consists of replacing all non-alphanumeric
    characters (see g_ascii_isalnum()) with their hexadecimal value
    preceded by an underscore (`_`). For example:
    `foo.bar.baz` will become `foo_2ebar_2ebaz`.
    
    This method is appropriate to use when the input is nearly
    a valid object path component but is not when your input
    is far from being a valid object path component.
    Other escaping algorithms are also valid to use with
    D-Bus object paths.
    
    This can be reversed with [gio.global.dbusUnescapeObjectPath].

    Params:
      bytes = the string of bytes to escape
    Returns: an escaped version of bytes. Free with [glib.global.gfree].
*/
string dbusEscapeObjectPathBytestring(ubyte[] bytes)
{
  char* _cretval;
  auto _bytes = cast(const(ubyte)*)(bytes ~ ubyte.init).ptr;
  _cretval = g_dbus_escape_object_path_bytestring(_bytes);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Generate a D-Bus GUID that can be used with
    e.g. [gio.dbus_connection.DBusConnection.new_].
    
    See the
    [D-Bus specification](https://dbus.freedesktop.org/doc/dbus-specification.html#uuids)
    regarding what strings are valid D-Bus GUIDs. The specification refers to
    these as ‘UUIDs’ whereas GLib (for historical reasons) refers to them as
    ‘GUIDs’. The terms are interchangeable.
    
    Note that D-Bus GUIDs do not follow
    [RFC 4122](https://datatracker.ietf.org/doc/html/rfc4122).
    Returns: A valid D-Bus GUID. Free with [glib.global.gfree].
*/
string dbusGenerateGuid()
{
  char* _cretval;
  _cretval = g_dbus_generate_guid();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a #GValue to a #GVariant of the type indicated by the type
    parameter.
    
    The conversion is using the following rules:
    
    $(LIST
      * `G_TYPE_STRING`: 's', 'o', 'g' or 'ay'
      * `G_TYPE_STRV`: 'as', 'ao' or 'aay'
      * `G_TYPE_BOOLEAN`: 'b'
      * `G_TYPE_UCHAR`: 'y'
      * `G_TYPE_INT`: 'i', 'n'
      * `G_TYPE_UINT`: 'u', 'q'
      * `G_TYPE_INT64`: 'x'
      * `G_TYPE_UINT64`: 't'
      * `G_TYPE_DOUBLE`: 'd'
      * `G_TYPE_VARIANT`: Any #GVariantType
    )
      
    This can fail if e.g. gvalue is of type `G_TYPE_STRING` and type
    is 'i', i.e. `G_VARIANT_TYPE_INT32`. It will also fail for any #GType
    (including e.g. `G_TYPE_OBJECT` and `G_TYPE_BOXED` derived-types) not
    in the table above.
    
    Note that if gvalue is of type `G_TYPE_VARIANT` and its value is
    null, the empty #GVariant instance (never null) for type is
    returned (e.g. 0 for scalar types, the empty string for string types,
    '/' for object path types, the empty array for any array type and so on).
    
    See the [gio.global.dbusGvariantToGvalue] function for how to convert a
    #GVariant to a #GValue.

    Params:
      gvalue = A #GValue to convert to a #GVariant
      type = A #GVariantType
    Returns: A #GVariant (never floating) of
          #GVariantType type holding the data from gvalue or an empty #GVariant
          in case of failure. Free with [glib.variant.Variant.unref].
*/
glib.variant.Variant dbusGvalueToGvariant(gobject.value.Value gvalue, glib.variant_type.VariantType type)
{
  GVariant* _cretval;
  _cretval = g_dbus_gvalue_to_gvariant(gvalue ? cast(const(GValue)*)gvalue._cPtr(No.Dup) : null, type ? cast(const(GVariantType)*)type._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Converts a #GVariant to a #GValue. If value is floating, it is consumed.
    
    The rules specified in the [gio.global.dbusGvalueToGvariant] function are
    used - this function is essentially its reverse form. So, a #GVariant
    containing any basic or string array type will be converted to a #GValue
    containing a basic value or string array. Any other #GVariant (handle,
    variant, tuple, dict entry) will be converted to a #GValue containing that
    #GVariant.
    
    The conversion never fails - a valid #GValue is always returned in
    out_gvalue.

    Params:
      value = A #GVariant.
      outGvalue = Return location pointing to a zero-filled (uninitialized) #GValue.
*/
void dbusGvariantToGvalue(glib.variant.Variant value, out gobject.value.Value outGvalue)
{
  GValue _outGvalue;
  g_dbus_gvariant_to_gvalue(value ? cast(GVariant*)value._cPtr(No.Dup) : null, &_outGvalue);
  outGvalue = new gobject.value.Value(cast(void*)&_outGvalue, No.Take);
}

/**
    Checks if string is a
    [D-Bus address](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).
    
    This doesn't check if string is actually supported by #GDBusServer
    or #GDBusConnection - use [gio.global.dbusIsSupportedAddress] to do more
    checks.

    Params:
      string_ = A string.
    Returns: true if string is a valid D-Bus address, false otherwise.
*/
bool dbusIsAddress(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_dbus_is_address(_string_);
  return _retval;
}

/**
    Check whether string is a valid D-Bus error name.
    
    This function returns the same result as [gio.global.dbusIsInterfaceName],
    because D-Bus error names are defined to have exactly the
    same syntax as interface names.

    Params:
      string_ = The string to check.
    Returns: true if valid, false otherwise.
*/
bool dbusIsErrorName(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_dbus_is_error_name(_string_);
  return _retval;
}

/**
    Checks if string is a D-Bus GUID.
    
    See the documentation for [gio.global.dbusGenerateGuid] for more information about
    the format of a GUID.

    Params:
      string_ = The string to check.
    Returns: true if string is a GUID, false otherwise.
*/
bool dbusIsGuid(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_dbus_is_guid(_string_);
  return _retval;
}

/**
    Checks if string is a valid D-Bus interface name.

    Params:
      string_ = The string to check.
    Returns: true if valid, false otherwise.
*/
bool dbusIsInterfaceName(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_dbus_is_interface_name(_string_);
  return _retval;
}

/**
    Checks if string is a valid D-Bus member (e.g. signal or method) name.

    Params:
      string_ = The string to check.
    Returns: true if valid, false otherwise.
*/
bool dbusIsMemberName(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_dbus_is_member_name(_string_);
  return _retval;
}

/**
    Checks if string is a valid D-Bus bus name (either unique or well-known).

    Params:
      string_ = The string to check.
    Returns: true if valid, false otherwise.
*/
bool dbusIsName(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_dbus_is_name(_string_);
  return _retval;
}

/**
    Like [gio.global.dbusIsAddress] but also checks if the library supports the
    transports in string and that key/value pairs for each transport
    are valid. See the specification of the
    [D-Bus address format](https://dbus.freedesktop.org/doc/dbus-specification.html#addresses).

    Params:
      string_ = A string.
    Returns: true if string is a valid D-Bus address that is
      supported by this library, false if error is set.
    Throws: [ErrorWrap]
*/
bool dbusIsSupportedAddress(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)g_dbus_is_supported_address(_string_, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Checks if string is a valid D-Bus unique bus name.

    Params:
      string_ = The string to check.
    Returns: true if valid, false otherwise.
*/
bool dbusIsUniqueName(string string_)
{
  bool _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_dbus_is_unique_name(_string_);
  return _retval;
}

/**
    Unescapes an string that was previously escaped with
    [gio.global.dbusEscapeObjectPath]. If the string is in a format that could
    not have been returned by [gio.global.dbusEscapeObjectPath], this function
    returns null.
    
    Encoding alphanumeric characters which do not need to be
    encoded is not allowed (e.g `_63` is not valid, the string
    should contain `c` instead).

    Params:
      s = the string to unescape
    Returns: an
        unescaped version of `s`, or null if `s` is not a string returned
        from [gio.global.dbusEscapeObjectPath]. Free with [glib.global.gfree].
*/
ubyte[] dbusUnescapeObjectPath(string s)
{
  ubyte* _cretval;
  const(char)* _s = s.toCString(No.Alloc);
  _cretval = g_dbus_unescape_object_path(_s);
  ubyte[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] != 0; _cretlength++)
      break;
    _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Converts `errno.h` error codes into GIO error codes.
    
    The fallback value [gio.types.IOErrorEnum.Failed] is returned for error codes not
    currently handled (but note that future GLib releases may return a more
    specific value instead).
    
    As `errno` is global and may be modified by intermediate function
    calls, you should save its value immediately after the call returns,
    and use the saved value instead of `errno`:
    
    
    ```c
      int saved_errno;
    
      ret = read (blah);
      saved_errno = errno;
    
      g_io_error_from_errno (saved_errno);
    ```

    Params:
      errNo = Error number as defined in errno.h.
    Returns: #GIOErrorEnum value for the given `errno.h` error number
*/
gio.types.IOErrorEnum ioErrorFromErrno(int errNo)
{
  GIOErrorEnum _cretval;
  _cretval = g_io_error_from_errno(errNo);
  gio.types.IOErrorEnum _retval = cast(gio.types.IOErrorEnum)_cretval;
  return _retval;
}

/**
    Converts #GFileError error codes into GIO error codes.

    Params:
      fileError = a #GFileError.
    Returns: #GIOErrorEnum value for the given #GFileError error value.
*/
gio.types.IOErrorEnum ioErrorFromFileError(glib.types.FileError fileError)
{
  GIOErrorEnum _cretval;
  _cretval = g_io_error_from_file_error(fileError);
  gio.types.IOErrorEnum _retval = cast(gio.types.IOErrorEnum)_cretval;
  return _retval;
}

/**
    Gets the GIO Error Quark.
    Returns: a #GQuark.
*/
glib.types.Quark ioErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_io_error_quark();
  return _retval;
}

/**
    Scans all the modules in the specified directory, ensuring that
    any extension point implemented by a module is registered.
    
    This may not actually load and initialize all the types in each
    module, some modules may be lazily loaded and initialized when
    an extension point it implements is used with e.g.
    [gio.ioextension_point.IOExtensionPoint.getExtensions] or
    [gio.ioextension_point.IOExtensionPoint.getExtensionByName].
    
    If you need to guarantee that all types are loaded in all the modules,
    use [gio.global.ioModulesLoadAllInDirectory].

    Params:
      dirname = pathname for a directory containing modules
            to scan.
*/
void ioModulesScanAllInDirectory(string dirname)
{
  const(char)* _dirname = dirname.toCString(No.Alloc);
  g_io_modules_scan_all_in_directory(_dirname);
}

/**
    Scans all the modules in the specified directory, ensuring that
    any extension point implemented by a module is registered.
    
    This may not actually load and initialize all the types in each
    module, some modules may be lazily loaded and initialized when
    an extension point it implements is used with e.g.
    [gio.ioextension_point.IOExtensionPoint.getExtensions] or
    [gio.ioextension_point.IOExtensionPoint.getExtensionByName].
    
    If you need to guarantee that all types are loaded in all the modules,
    use [gio.global.ioModulesLoadAllInDirectory].

    Params:
      dirname = pathname for a directory containing modules
            to scan.
      scope_ = a scope to use when scanning the modules
*/
void ioModulesScanAllInDirectoryWithScope(string dirname, gio.iomodule_scope.IOModuleScope scope_)
{
  const(char)* _dirname = dirname.toCString(No.Alloc);
  g_io_modules_scan_all_in_directory_with_scope(_dirname, scope_ ? cast(GIOModuleScope*)scope_._cPtr : null);
}

/**
    Cancels all cancellable I/O jobs.
    
    A job is cancellable if a #GCancellable was passed into
    [gio.global.ioSchedulerPushJob].

    Deprecated: You should never call this function, since you don't
      know how other libraries in your program might be making use of
      gioscheduler.
*/
void ioSchedulerCancelAllJobs()
{
  g_io_scheduler_cancel_all_jobs();
}

/**
    Schedules the I/O job to run in another thread.
    
    notify will be called on user_data after job_func has returned,
    regardless whether the job was cancelled or has run to completion.
    
    If cancellable is not null, it can be used to cancel the I/O job
    by calling [gio.cancellable.Cancellable.cancel] or by calling
    [gio.global.ioSchedulerCancelAllJobs].

    Params:
      jobFunc = a #GIOSchedulerJobFunc.
      ioPriority = the [I/O priority][io-priority]
        of the request.
      cancellable = optional #GCancellable object, null to ignore.

    Deprecated: use #GThreadPool or [gio.task.Task.runInThread]
*/
void ioSchedulerPushJob(gio.types.IOSchedulerJobFunc jobFunc, int ioPriority, gio.cancellable.Cancellable cancellable = null)
{
  extern(C) gboolean _jobFuncCallback(GIOSchedulerJob* job, GCancellable* cancellable, void* data)
  {
    auto _dlg = cast(gio.types.IOSchedulerJobFunc*)data;

    gboolean _retval = (*_dlg)(job ? new gio.ioscheduler_job.IOSchedulerJob(cast(void*)job, No.Take) : null, gobject.object.ObjectWrap._getDObject!(gio.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
    return _retval;
  }
  auto _jobFuncCB = jobFunc ? &_jobFuncCallback : null;

  auto _jobFunc = jobFunc ? freezeDelegate(cast(void*)&jobFunc) : null;
  GDestroyNotify _jobFuncDestroyCB = jobFunc ? &thawDelegate : null;
  g_io_scheduler_push_job(_jobFuncCB, _jobFunc, _jobFuncDestroyCB, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
}

/**
    Creates a keyfile-backed #GSettingsBackend.
    
    The filename of the keyfile to use is given by filename.
    
    All settings read to or written from the backend must fall under the
    path given in root_path (which must start and end with a slash and
    not contain two consecutive slashes).  root_path may be "/".
    
    If root_group is non-null then it specifies the name of the keyfile
    group used for keys that are written directly below root_path.  For
    example, if root_path is "/apps/example/" and root_group is
    "toplevel", then settings the key "/apps/example/enabled" to a value
    of true will cause the following to appear in the keyfile:
    
    ```
      [toplevel]
      enabled=true
    ```
    
    If root_group is null then it is not permitted to store keys
    directly below the root_path.
    
    For keys not stored directly below root_path (ie: in a sub-path),
    the name of the subpath (with the final slash stripped) is used as
    the name of the keyfile group.  To continue the example, if
    "/apps/example/profiles/default/font-size" were set to
    12 then the following would appear in the keyfile:
    
    ```
      [profiles/default]
      font-size=12
    ```
    
    The backend will refuse writes (and return writability as being
    false) for keys outside of root_path and, in the event that
    root_group is null, also for keys directly under root_path.
    Writes will also be refused if the backend detects that it has the
    inability to rewrite the keyfile (ie: the containing directory is not
    writable).
    
    There is no checking done for your key namespace clashing with the
    syntax of the key file format.  For example, if you have '[' or ']'
    characters in your path names or '=' in your key names you may be in
    trouble.
    
    The backend reads default values from a keyfile called `defaults` in
    the directory specified by the #GKeyfileSettingsBackend:defaults-dir property,
    and a list of locked keys from a text file with the name `locks` in
    the same location.

    Params:
      filename = the filename of the keyfile
      rootPath = the path under which all settings keys appear
      rootGroup = the group name corresponding to
                     root_path, or null
    Returns: a keyfile-backed #GSettingsBackend
*/
gio.settings_backend.SettingsBackend keyfileSettingsBackendNew(string filename, string rootPath, string rootGroup = null)
{
  GSettingsBackend* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  const(char)* _rootPath = rootPath.toCString(No.Alloc);
  const(char)* _rootGroup = rootGroup.toCString(No.Alloc);
  _cretval = g_keyfile_settings_backend_new(_filename, _rootPath, _rootGroup);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings_backend.SettingsBackend)(cast(GSettingsBackend*)_cretval, Yes.Take);
  return _retval;
}

/**
    Creates a memory-backed #GSettingsBackend.
    
    This backend allows changes to settings, but does not write them
    to any backing storage, so the next time you run your application,
    the memory backend will start out with the default values again.
    Returns: a newly created #GSettingsBackend
*/
gio.settings_backend.SettingsBackend memorySettingsBackendNew()
{
  GSettingsBackend* _cretval;
  _cretval = g_memory_settings_backend_new();
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings_backend.SettingsBackend)(cast(GSettingsBackend*)_cretval, Yes.Take);
  return _retval;
}

/**
    Initializes the platform networking libraries (eg, on Windows, this
    calls WSAStartup()). GLib will call this itself if it is needed, so
    you only need to call it if you directly call system networking
    functions (without calling any GLib networking functions first).
*/
void networkingInit()
{
  g_networking_init();
}

/**
    Creates a readonly #GSettingsBackend.
    
    This backend does not allow changes to settings, so all settings
    will always have their default values.
    Returns: a newly created #GSettingsBackend
*/
gio.settings_backend.SettingsBackend nullSettingsBackendNew()
{
  GSettingsBackend* _cretval;
  _cretval = g_null_settings_backend_new();
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.settings_backend.SettingsBackend)(cast(GSettingsBackend*)_cretval, Yes.Take);
  return _retval;
}

/**
    Utility method for #GPollableInputStream and #GPollableOutputStream
    implementations. Creates a new #GSource that expects a callback of
    type #GPollableSourceFunc. The new source does not actually do
    anything on its own; use [glib.source.Source.addChildSource] to add other
    sources to it to cause it to trigger.

    Params:
      pollableStream = the stream associated with the new source
    Returns: the new #GSource.
*/
glib.source.Source pollableSourceNew(gobject.object.ObjectWrap pollableStream)
{
  GSource* _cretval;
  _cretval = g_pollable_source_new(pollableStream ? cast(GObject*)pollableStream._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Utility method for #GPollableInputStream and #GPollableOutputStream
    implementations. Creates a new #GSource, as with
    [gio.global.pollableSourceNew], but also attaching child_source (with a
    dummy callback), and cancellable, if they are non-null.

    Params:
      pollableStream = the stream associated with the
          new source
      childSource = optional child source to attach
      cancellable = optional #GCancellable to attach
    Returns: the new #GSource.
*/
glib.source.Source pollableSourceNewFull(gobject.object.ObjectWrap pollableStream, glib.source.Source childSource = null, gio.cancellable.Cancellable cancellable = null)
{
  GSource* _cretval;
  _cretval = g_pollable_source_new_full(pollableStream ? cast(GObject*)pollableStream._cPtr(No.Dup) : null, childSource ? cast(GSource*)childSource._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Tries to read from stream, as with [gio.input_stream.InputStream.read] (if
    blocking is true) or [gio.pollable_input_stream.PollableInputStream.readNonblocking]
    (if blocking is false). This can be used to more easily share
    code between blocking and non-blocking implementations of a method.
    
    If blocking is false, then stream must be a
    #GPollableInputStream for which [gio.pollable_input_stream.PollableInputStream.canPoll]
    returns true, or else the behavior is undefined. If blocking is
    true, then stream does not need to be a #GPollableInputStream.

    Params:
      stream = a #GInputStream
      buffer = a buffer to
          read data into
      blocking = whether to do blocking I/O
      cancellable = optional #GCancellable object, null to ignore.
    Returns: the number of bytes read, or -1 on error.
    Throws: [ErrorWrap]
*/
ptrdiff_t pollableStreamRead(gio.input_stream.InputStream stream, ubyte[] buffer, bool blocking, gio.cancellable.Cancellable cancellable = null)
{
  ptrdiff_t _retval;
  size_t _count;
  if (buffer)
    _count = cast(size_t)buffer.length;

  auto _buffer = cast(void*)buffer.ptr;
  GError *_err;
  _retval = g_pollable_stream_read(stream ? cast(GInputStream*)stream._cPtr(No.Dup) : null, _buffer, _count, blocking, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Tries to write to stream, as with [gio.output_stream.OutputStream.write] (if
    blocking is true) or [gio.pollable_output_stream.PollableOutputStream.writeNonblocking]
    (if blocking is false). This can be used to more easily share
    code between blocking and non-blocking implementations of a method.
    
    If blocking is false, then stream must be a
    #GPollableOutputStream for which
    [gio.pollable_output_stream.PollableOutputStream.canPoll] returns true or else the
    behavior is undefined. If blocking is true, then stream does not
    need to be a #GPollableOutputStream.

    Params:
      stream = a #GOutputStream.
      buffer = the buffer
          containing the data to write.
      blocking = whether to do blocking I/O
      cancellable = optional #GCancellable object, null to ignore.
    Returns: the number of bytes written, or -1 on error.
    Throws: [ErrorWrap]
*/
ptrdiff_t pollableStreamWrite(gio.output_stream.OutputStream stream, ubyte[] buffer, bool blocking, gio.cancellable.Cancellable cancellable = null)
{
  ptrdiff_t _retval;
  size_t _count;
  if (buffer)
    _count = cast(size_t)buffer.length;

  auto _buffer = cast(void*)buffer.ptr;
  GError *_err;
  _retval = g_pollable_stream_write(stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, _buffer, _count, blocking, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Tries to write count bytes to stream, as with
    [gio.output_stream.OutputStream.writeAll], but using [gio.global.pollableStreamWrite]
    rather than [gio.output_stream.OutputStream.write].
    
    On a successful write of count bytes, true is returned, and
    bytes_written is set to count.
    
    If there is an error during the operation (including
    [gio.types.IOErrorEnum.WouldBlock] in the non-blocking case), false is
    returned and error is set to indicate the error status,
    bytes_written is updated to contain the number of bytes written
    into the stream before the error occurred.
    
    As with [gio.global.pollableStreamWrite], if blocking is false, then
    stream must be a #GPollableOutputStream for which
    [gio.pollable_output_stream.PollableOutputStream.canPoll] returns true or else the
    behavior is undefined. If blocking is true, then stream does not
    need to be a #GPollableOutputStream.

    Params:
      stream = a #GOutputStream.
      buffer = the buffer
          containing the data to write.
      blocking = whether to do blocking I/O
      bytesWritten = location to store the number of bytes that was
          written to the stream
      cancellable = optional #GCancellable object, null to ignore.
    Returns: true on success, false if there was an error
    Throws: [ErrorWrap]
*/
bool pollableStreamWriteAll(gio.output_stream.OutputStream stream, ubyte[] buffer, bool blocking, out size_t bytesWritten, gio.cancellable.Cancellable cancellable = null)
{
  bool _retval;
  size_t _count;
  if (buffer)
    _count = cast(size_t)buffer.length;

  auto _buffer = cast(void*)buffer.ptr;
  GError *_err;
  _retval = cast(bool)g_pollable_stream_write_all(stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, _buffer, _count, blocking, cast(size_t*)&bytesWritten, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Returns all the names of children at the specified path in the set of
    globally registered resources.
    The return result is a null terminated list of strings which should
    be released with [glib.global.strfreev].
    
    lookup_flags controls the behaviour of the lookup.

    Params:
      path = A pathname inside the resource
      lookupFlags = A #GResourceLookupFlags
    Returns: an array of constant strings
    Throws: [ErrorWrap]
*/
string[] resourcesEnumerateChildren(string path, gio.types.ResourceLookupFlags lookupFlags)
{
  char** _cretval;
  const(char)* _path = path.toCString(No.Alloc);
  GError *_err;
  _cretval = g_resources_enumerate_children(_path, lookupFlags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    for (; _cretval[_cretlength] !is null; _cretlength++)
      break;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Looks for a file at the specified path in the set of
    globally registered resources and if found returns information about it.
    
    lookup_flags controls the behaviour of the lookup.

    Params:
      path = A pathname inside the resource
      lookupFlags = A #GResourceLookupFlags
      size = a location to place the length of the contents of the file,
           or null if the length is not needed
      flags = a location to place the #GResourceFlags about the file,
           or null if the flags are not needed
    Returns: true if the file was found. false if there were errors
    Throws: [ErrorWrap]
*/
bool resourcesGetInfo(string path, gio.types.ResourceLookupFlags lookupFlags, out size_t size, out uint flags)
{
  bool _retval;
  const(char)* _path = path.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)g_resources_get_info(_path, lookupFlags, cast(size_t*)&size, cast(uint*)&flags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Looks for a file at the specified path in the set of
    globally registered resources and returns a #GBytes that
    lets you directly access the data in memory.
    
    The data is always followed by a zero byte, so you
    can safely use the data as a C string. However, that byte
    is not included in the size of the GBytes.
    
    For uncompressed resource files this is a pointer directly into
    the resource bundle, which is typically in some readonly data section
    in the program binary. For compressed files we allocate memory on
    the heap and automatically uncompress the data.
    
    lookup_flags controls the behaviour of the lookup.

    Params:
      path = A pathname inside the resource
      lookupFlags = A #GResourceLookupFlags
    Returns: #GBytes or null on error.
          Free the returned object with [glib.bytes.Bytes.unref]
    Throws: [ErrorWrap]
*/
glib.bytes.Bytes resourcesLookupData(string path, gio.types.ResourceLookupFlags lookupFlags)
{
  GBytes* _cretval;
  const(char)* _path = path.toCString(No.Alloc);
  GError *_err;
  _cretval = g_resources_lookup_data(_path, lookupFlags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Looks for a file at the specified path in the set of
    globally registered resources and returns a #GInputStream
    that lets you read the data.
    
    lookup_flags controls the behaviour of the lookup.

    Params:
      path = A pathname inside the resource
      lookupFlags = A #GResourceLookupFlags
    Returns: #GInputStream or null on error.
          Free the returned object with [gobject.object.ObjectWrap.unref]
    Throws: [ErrorWrap]
*/
gio.input_stream.InputStream resourcesOpenStream(string path, gio.types.ResourceLookupFlags lookupFlags)
{
  GInputStream* _cretval;
  const(char)* _path = path.toCString(No.Alloc);
  GError *_err;
  _cretval = g_resources_open_stream(_path, lookupFlags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
  return _retval;
}

/**
    Registers the resource with the process-global set of resources.
    Once a resource is registered the files in it can be accessed
    with the global resource lookup functions like [gio.global.resourcesLookupData].

    Params:
      resource = A #GResource
*/
void resourcesRegister(gio.resource.Resource resource)
{
  g_resources_register(resource ? cast(GResource*)resource._cPtr(No.Dup) : null);
}

/**
    Unregisters the resource from the process-global set of resources.

    Params:
      resource = A #GResource
*/
void resourcesUnregister(gio.resource.Resource resource)
{
  g_resources_unregister(resource ? cast(GResource*)resource._cPtr(No.Dup) : null);
}

/**
    Reports an error in an idle function. Similar to
    [gio.global.simpleAsyncReportErrorInIdle], but takes a #GError rather
    than building a new one.

    Params:
      object = a #GObject, or null
      callback = a #GAsyncReadyCallback.
      error = the #GError to report

    Deprecated: Use [gio.task.Task.reportError].
*/
void simpleAsyncReportGerrorInIdle(gobject.object.ObjectWrap object, gio.types.AsyncReadyCallback callback, glib.error.ErrorWrap error)
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

    (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
  }
  auto _callbackCB = callback ? &_callbackCallback : null;

  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  g_simple_async_report_gerror_in_idle(object ? cast(GObject*)object._cPtr(No.Dup) : null, _callbackCB, _callback, error ? cast(const(GError)*)error._cPtr : null);
}

/**
    Determines if mount_path is considered an implementation of the
    OS. This is primarily used for hiding mountable and mounted volumes
    that only are used in the OS and has little to no relevance to the
    casual user.

    Params:
      mountPath = a mount path, e.g. `/media/disk` or `/usr`
    Returns: true if mount_path is considered an implementation detail
          of the OS.
*/
bool unixIsMountPathSystemInternal(string mountPath)
{
  bool _retval;
  const(char)* _mountPath = mountPath.toCString(No.Alloc);
  _retval = cast(bool)g_unix_is_mount_path_system_internal(_mountPath);
  return _retval;
}

/**
    Determines if device_path is considered a block device path which is only
    used in implementation of the OS. This is primarily used for hiding
    mounted volumes that are intended as APIs for programs to read, and system
    administrators at a shell; rather than something that should, for example,
    appear in a GUI. For example, the Linux `/proc` filesystem.
    
    The list of device paths considered ‘system’ ones may change over time.

    Params:
      devicePath = a device path, e.g. `/dev/loop0` or `nfsd`
    Returns: true if device_path is considered an implementation detail of
         the OS.
*/
bool unixIsSystemDevicePath(string devicePath)
{
  bool _retval;
  const(char)* _devicePath = devicePath.toCString(No.Alloc);
  _retval = cast(bool)g_unix_is_system_device_path(_devicePath);
  return _retval;
}

/**
    Determines if fs_type is considered a type of file system which is only
    used in implementation of the OS. This is primarily used for hiding
    mounted volumes that are intended as APIs for programs to read, and system
    administrators at a shell; rather than something that should, for example,
    appear in a GUI. For example, the Linux `/proc` filesystem.
    
    The list of file system types considered ‘system’ ones may change over time.

    Params:
      fsType = a file system type, e.g. `procfs` or `tmpfs`
    Returns: true if fs_type is considered an implementation detail of the OS.
*/
bool unixIsSystemFsType(string fsType)
{
  bool _retval;
  const(char)* _fsType = fsType.toCString(No.Alloc);
  _retval = cast(bool)g_unix_is_system_fs_type(_fsType);
  return _retval;
}

/**
    Gets a #GUnixMountEntry for a given mount path. If time_read
    is set, it will be filled with a unix timestamp for checking
    if the mounts have changed since with [gio.global.unixMountsChangedSince].
    
    If more mounts have the same mount path, the last matching mount
    is returned.
    
    This will return null if there is no mount point at mount_path.

    Params:
      mountPath = path for a possible unix mount.
      timeRead = guint64 to contain a timestamp.
    Returns: a #GUnixMountEntry.
*/
gio.unix_mount_entry.UnixMountEntry unixMountAt(string mountPath, out ulong timeRead)
{
  GUnixMountEntry* _cretval;
  const(char)* _mountPath = mountPath.toCString(No.Alloc);
  _cretval = g_unix_mount_at(_mountPath, cast(ulong*)&timeRead);
  auto _retval = _cretval ? new gio.unix_mount_entry.UnixMountEntry(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Compares two unix mounts.

    Params:
      mount1 = first #GUnixMountEntry to compare.
      mount2 = second #GUnixMountEntry to compare.
    Returns: 1, 0 or -1 if mount1 is greater than, equal to,
      or less than mount2, respectively.
*/
int unixMountCompare(gio.unix_mount_entry.UnixMountEntry mount1, gio.unix_mount_entry.UnixMountEntry mount2)
{
  int _retval;
  _retval = g_unix_mount_compare(mount1 ? cast(GUnixMountEntry*)mount1._cPtr(No.Dup) : null, mount2 ? cast(GUnixMountEntry*)mount2._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Makes a copy of mount_entry.

    Params:
      mountEntry = a #GUnixMountEntry.
    Returns: a new #GUnixMountEntry
*/
gio.unix_mount_entry.UnixMountEntry unixMountCopy(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  GUnixMountEntry* _cretval;
  _cretval = g_unix_mount_copy(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  auto _retval = _cretval ? new gio.unix_mount_entry.UnixMountEntry(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Gets a #GUnixMountEntry for a given file path. If time_read
    is set, it will be filled with a unix timestamp for checking
    if the mounts have changed since with [gio.global.unixMountsChangedSince].
    
    If more mounts have the same mount path, the last matching mount
    is returned.
    
    This will return null if looking up the mount entry fails, if
    file_path doesn’t exist or there is an I/O error.

    Params:
      filePath = file path on some unix mount.
      timeRead = guint64 to contain a timestamp.
    Returns: a #GUnixMountEntry.
*/
gio.unix_mount_entry.UnixMountEntry unixMountFor(string filePath, out ulong timeRead)
{
  GUnixMountEntry* _cretval;
  const(char)* _filePath = filePath.toCString(No.Alloc);
  _cretval = g_unix_mount_for(_filePath, cast(ulong*)&timeRead);
  auto _retval = _cretval ? new gio.unix_mount_entry.UnixMountEntry(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Frees a unix mount.

    Params:
      mountEntry = a #GUnixMountEntry.
*/
void unixMountFree(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  g_unix_mount_free(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
}

/**
    Gets the device path for a unix mount.

    Params:
      mountEntry = a #GUnixMount.
    Returns: a string containing the device path.
*/
string unixMountGetDevicePath(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_device_path(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the filesystem type for the unix mount.

    Params:
      mountEntry = a #GUnixMount.
    Returns: a string containing the file system type.
*/
string unixMountGetFsType(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_fs_type(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the mount path for a unix mount.

    Params:
      mountEntry = input #GUnixMountEntry to get the mount path for.
    Returns: the mount path for mount_entry.
*/
string unixMountGetMountPath(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_mount_path(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets a comma-separated list of mount options for the unix mount. For example,
    `rw,relatime,seclabel,data=ordered`.
    
    This is similar to [gio.unix_mount_point.UnixMountPoint.getOptions], but it takes
    a #GUnixMountEntry as an argument.

    Params:
      mountEntry = a #GUnixMountEntry.
    Returns: a string containing the options, or null if not
      available.
*/
string unixMountGetOptions(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_options(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the root of the mount within the filesystem. This is useful e.g. for
    mounts created by bind operation, or btrfs subvolumes.
    
    For example, the root path is equal to "/" for mount created by
    "mount /dev/sda1 /mnt/foo" and "/bar" for
    "mount --bind /mnt/foo/bar /mnt/bar".

    Params:
      mountEntry = a #GUnixMountEntry.
    Returns: a string containing the root, or null if not supported.
*/
string unixMountGetRootPath(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  const(char)* _cretval;
  _cretval = g_unix_mount_get_root_path(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Guesses whether a Unix mount can be ejected.

    Params:
      mountEntry = a #GUnixMountEntry
    Returns: true if mount_entry is deemed to be ejectable.
*/
bool unixMountGuessCanEject(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_guess_can_eject(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Guesses the icon of a Unix mount.

    Params:
      mountEntry = a #GUnixMountEntry
    Returns: a #GIcon
*/
gio.icon.Icon unixMountGuessIcon(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  GIcon* _cretval;
  _cretval = g_unix_mount_guess_icon(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
  return _retval;
}

/**
    Guesses the name of a Unix mount.
    The result is a translated string.

    Params:
      mountEntry = a #GUnixMountEntry
    Returns: A newly allocated string that must
          be freed with [glib.global.gfree]
*/
string unixMountGuessName(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  char* _cretval;
  _cretval = g_unix_mount_guess_name(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Guesses whether a Unix mount should be displayed in the UI.

    Params:
      mountEntry = a #GUnixMountEntry
    Returns: true if mount_entry is deemed to be displayable.
*/
bool unixMountGuessShouldDisplay(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_guess_should_display(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Guesses the symbolic icon of a Unix mount.

    Params:
      mountEntry = a #GUnixMountEntry
    Returns: a #GIcon
*/
gio.icon.Icon unixMountGuessSymbolicIcon(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  GIcon* _cretval;
  _cretval = g_unix_mount_guess_symbolic_icon(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
  return _retval;
}

/**
    Checks if a unix mount is mounted read only.

    Params:
      mountEntry = a #GUnixMount.
    Returns: true if mount_entry is read only.
*/
bool unixMountIsReadonly(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_is_readonly(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Checks if a Unix mount is a system mount. This is the Boolean OR of
    [gio.global.unixIsSystemFsType], [gio.global.unixIsSystemDevicePath] and
    [gio.global.unixIsMountPathSystemInternal] on mount_entry’s properties.
    
    The definition of what a ‘system’ mount entry is may change over time as new
    file system types and device paths are ignored.

    Params:
      mountEntry = a #GUnixMount.
    Returns: true if the unix mount is for a system path.
*/
bool unixMountIsSystemInternal(gio.unix_mount_entry.UnixMountEntry mountEntry)
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_is_system_internal(mountEntry ? cast(GUnixMountEntry*)mountEntry._cPtr(No.Dup) : null);
  return _retval;
}

/**
    Checks if the unix mount points have changed since a given unix time.

    Params:
      time = guint64 to contain a timestamp.
    Returns: true if the mount points have changed since time.
*/
bool unixMountPointsChangedSince(ulong time)
{
  bool _retval;
  _retval = cast(bool)g_unix_mount_points_changed_since(time);
  return _retval;
}

/**
    Gets a #GList of #GUnixMountPoint containing the unix mount points.
    If time_read is set, it will be filled with the mount timestamp,
    allowing for checking if the mounts have changed with
    [gio.global.unixMountPointsChangedSince].

    Params:
      timeRead = guint64 to contain a timestamp.
    Returns: a #GList of the UNIX mountpoints.
*/
gio.unix_mount_point.UnixMountPoint[] unixMountPointsGet(out ulong timeRead)
{
  GList* _cretval;
  _cretval = g_unix_mount_points_get(cast(ulong*)&timeRead);
  auto _retval = gListToD!(gio.unix_mount_point.UnixMountPoint, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Checks if the unix mounts have changed since a given unix time.

    Params:
      time = guint64 to contain a timestamp.
    Returns: true if the mounts have changed since time.
*/
bool unixMountsChangedSince(ulong time)
{
  bool _retval;
  _retval = cast(bool)g_unix_mounts_changed_since(time);
  return _retval;
}

/**
    Gets a #GList of #GUnixMountEntry containing the unix mounts.
    If time_read is set, it will be filled with the mount
    timestamp, allowing for checking if the mounts have changed
    with [gio.global.unixMountsChangedSince].

    Params:
      timeRead = guint64 to contain a timestamp, or null
    Returns: a #GList of the UNIX mounts.
*/
gio.unix_mount_entry.UnixMountEntry[] unixMountsGet(out ulong timeRead)
{
  GList* _cretval;
  _cretval = g_unix_mounts_get(cast(ulong*)&timeRead);
  auto _retval = gListToD!(gio.unix_mount_entry.UnixMountEntry, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}
