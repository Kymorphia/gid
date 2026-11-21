/// Global functions for secret1 library
module gid.secret1.global;

import gid.core.gid;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.object;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.retrievable;
import gid.secret1.schema;
import gid.secret1.types;
import gid.secret1.value;


/**
    Check if attributes are valid according to the provided schema.
    
    Verifies schema name if available, attribute names and parsing
    of attribute values.

    Params:
      schema = the schema for the attributes
      attributes = the attributes to be validated
    Returns: whether or not the given attributes table is valid
    Throws: [ErrorWrap]
*/
bool attributesValidate(gid.secret1.schema.Schema schema, string[string] attributes)
{
  bool _retval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  GError *_err;
  _retval = cast(bool)secret_attributes_validate(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Get a secret storage schema of the given type.
    
    C code may access the schemas (such as `SECRET_SCHEMA_NOTE`) directly, but
    language bindings cannot, and must use this accessor.

    Params:
      type = type of schema to get
    Returns: schema type
*/
gid.secret1.schema.Schema getSchema(gid.secret1.types.SchemaType type) nothrow
{
  const(SecretSchema)* _cretval;
  _cretval = secret_get_schema(type);
  auto _retval = _cretval ? new gid.secret1.schema.Schema(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Finish an asynchronous operation to remove passwords from the secret
    service.

    Params:
      result = the asynchronous result passed to the callback
    Returns: whether any passwords were removed
    Throws: [ErrorWrap]
*/
bool passwordClearFinish(gid.gio2.async_result.AsyncResult result)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)secret_password_clear_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Remove unlocked matching passwords from the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    All unlocked items that match the attributes will be deleted.
    
    This method will return immediately and complete asynchronously.

    Params:
      schema = the schema for the attributes
      attributes = the attribute keys and values
      cancellable = optional cancellation object
      callback = called when the operation completes
*/
void passwordClear(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
  {
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
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  secret_password_clearv(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Remove unlocked matching passwords from the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    All unlocked items that match the attributes will be deleted.
    
    This method may block indefinitely and should not be used in user interface
    threads.

    Params:
      schema = the schema for the attributes
      attributes = the attribute keys and values
      cancellable = optional cancellation object
    Returns: whether any passwords were removed
    Throws: [ErrorWrap]
*/
bool passwordClearSync(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null)
{
  bool _retval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  GError *_err;
  _retval = cast(bool)secret_password_clearv_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Finish an asynchronous operation to lookup a password in the secret service.

    Params:
      result = the asynchronous result passed to the callback
    Returns: a new password string which should be freed with
        `funcpassword_free` or may be freed with `funcGLib.free` when done
    Throws: [ErrorWrap]
*/
string passwordLookupFinish(gid.gio2.async_result.AsyncResult result)
{
  char* _cretval;
  GError *_err;
  _cretval = secret_password_lookup_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Lookup a password in the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    If no secret is found then null is returned.
    
    This method will return immediately and complete asynchronously.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      cancellable = optional cancellation object
      callback = called when the operation completes
*/
void passwordLookup(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
  {
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
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  secret_password_lookupv(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Lookup a password in the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    If no secret is found then null is returned.
    
    This method may block indefinitely and should not be used in user interface
    threads.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      cancellable = optional cancellation object
    Returns: a new password string which should be freed with
        `funcpassword_free` or may be freed with `funcGLib.free` when done
    Throws: [ErrorWrap]
*/
string passwordLookupSync(gid.secret1.schema.Schema schema, string[string] attributes, gid.gio2.cancellable.Cancellable cancellable = null)
{
  char* _cretval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  GError *_err;
  _cretval = secret_password_lookupv_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Finish an asynchronous operation to search for items in the secret service.

    Params:
      result = the asynchronous result passed to the callback
    Returns: a list of
        [gid.secret1.retrievable.Retrievable] containing attributes of the matched items
    Throws: [ErrorWrap]
*/
gid.secret1.retrievable.Retrievable[] passwordSearchFinish(gid.gio2.async_result.AsyncResult result)
{
  GList* _cretval;
  GError *_err;
  _cretval = secret_password_search_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  auto _retval = gListToD!(gid.secret1.retrievable.Retrievable, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Search for items in the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    This method will return immediately and complete asynchronously.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      flags = search option flags
      cancellable = optional cancellation object
      callback = called when the operation completes
*/
void passwordSearch(gid.secret1.schema.Schema schema, string[string] attributes, gid.secret1.types.SearchFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
  {
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
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  secret_password_searchv(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Search for items in the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    If no secret is found then null is returned.
    
    This method may block indefinitely and should not be used in user interface
    threads.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      flags = search option flags
      cancellable = optional cancellation object
    Returns: a list of
        [gid.secret1.retrievable.Retrievable] containing attributes of the matched items
    Throws: [ErrorWrap]
*/
gid.secret1.retrievable.Retrievable[] passwordSearchSync(gid.secret1.schema.Schema schema, string[string] attributes, gid.secret1.types.SearchFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
{
  GList* _cretval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  GError *_err;
  _cretval = secret_password_searchv_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  auto _retval = gListToD!(gid.secret1.retrievable.Retrievable, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Finish asynchronous operation to store a password in the secret service.

    Params:
      result = the asynchronous result passed to the callback
    Returns: whether the storage was successful or not
    Throws: [ErrorWrap]
*/
bool passwordStoreFinish(gid.gio2.async_result.AsyncResult result)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)secret_password_store_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Store a password in the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    If the attributes match a secret item already stored in the collection, then
    the item will be updated with these new values.
    
    If collection is null, then the default collection will be
    used. Use [gid.secret1.types.COLLECTION_SESSION] to store the password in the session
    collection, which doesn't get stored across login sessions.
    
    This method will return immediately and complete asynchronously.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      collection = a collection alias, or D-Bus object path of the
          collection where to store the secret
      label = label for the secret
      password = the null-terminated password to store
      cancellable = optional cancellation object
      callback = called when the operation completes
*/
void passwordStore(gid.secret1.schema.Schema schema, string[string] attributes, string collection, string label, string password, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
  {
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
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  const(char)* _collection = collection.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
  const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  secret_password_storev(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, _password, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Store a password in the secret service.
    
    This is similar to `funcpassword_storev`, but takes a
    [gid.secret1.value.Value] as the argument instead of a null-terminated password.
    
    This method will return immediately and complete asynchronously.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      collection = a collection alias, or D-Bus object path of the
          collection where to store the secret
      label = label for the secret
      value = a [gid.secret1.value.Value]
      cancellable = optional cancellation object
      callback = called when the operation completes
*/
void passwordStoreBinary(gid.secret1.schema.Schema schema, string[string] attributes, string collection, string label, gid.secret1.value.Value value, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
{
  extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
  {
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
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  const(char)* _collection = collection.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
  auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
  secret_password_storev_binary(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
}

/**
    Store a password in the secret service.
    
    This is similar to `funcpassword_storev_sync`, but takes a [gid.secret1.value.Value] as
    the argument instead of a null-terminated passwords.
    
    This method may block indefinitely and should not be used in user interface
    threads.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      collection = a collection alias, or D-Bus object path of the
          collection where to store the secret
      label = label for the secret
      value = a [gid.secret1.value.Value]
      cancellable = optional cancellation object
    Returns: whether the storage was successful or not
    Throws: [ErrorWrap]
*/
bool passwordStoreBinarySync(gid.secret1.schema.Schema schema, string[string] attributes, string collection, string label, gid.secret1.value.Value value, gid.gio2.cancellable.Cancellable cancellable = null)
{
  bool _retval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  const(char)* _collection = collection.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
  GError *_err;
  _retval = cast(bool)secret_password_storev_binary_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Store a password in the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    If the attributes match a secret item already stored in the collection, then
    the item will be updated with these new values.
    
    If collection is null, then the default collection will be
    used. Use [gid.secret1.types.COLLECTION_SESSION] to store the password in the session
    collection, which doesn't get stored across login sessions.
    
    This method may block indefinitely and should not be used in user interface
    threads.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      collection = a collection alias, or D-Bus object path of the
          collection where to store the secret
      label = label for the secret
      password = the null-terminated password to store
      cancellable = optional cancellation object
    Returns: whether the storage was successful or not
    Throws: [ErrorWrap]
*/
bool passwordStoreSync(gid.secret1.schema.Schema schema, string[string] attributes, string collection, string label, string password, gid.gio2.cancellable.Cancellable cancellable = null)
{
  bool _retval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  const(char)* _collection = collection.toCString!(No.Malloc, Yes.Nullable);
  const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
  const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
  GError *_err;
  _retval = cast(bool)secret_password_storev_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, _password, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Clear the memory used by a password.

    Params:
      password = password to clear
*/
void passwordWipe(string password = null) nothrow
{
  char* _password = password.toCString!(No.Malloc, Yes.Nullable);
  secret_password_wipe(_password);
}
