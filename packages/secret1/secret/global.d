/// Global functions for secret1 library
module secret.global;

import gid.gid;
import gio.async_result;
import gio.cancellable;
import glib.error;
import gobject.object;
import secret.c.functions;
import secret.c.types;
import secret.retrievable;
import secret.schema;
import secret.types;
import secret.value;


/**
    Get a secret storage schema of the given type.
    
    C code may access the schemas (such as `SECRET_SCHEMA_NOTE`) directly, but
    language bindings cannot, and must use this accessor.

    Params:
      type = type of schema to get
    Returns: schema type
*/
secret.schema.Schema getSchema(secret.types.SchemaType type)
{
  const(SecretSchema)* _cretval;
  _cretval = secret_get_schema(type);
  auto _retval = _cretval ? new secret.schema.Schema(cast(void*)_cretval, No.Take) : null;
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
bool passwordClearFinish(gio.async_result.AsyncResult result)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)secret_password_clear_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
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
bool passwordClearSync(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null)
{
  bool _retval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  GError *_err;
  _retval = cast(bool)secret_password_clearv_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
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
string passwordLookupFinish(gio.async_result.AsyncResult result)
{
  char* _cretval;
  GError *_err;
  _cretval = secret_password_lookup_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
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
string passwordLookupSync(secret.schema.Schema schema, string[string] attributes, gio.cancellable.Cancellable cancellable = null)
{
  char* _cretval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  GError *_err;
  _cretval = secret_password_lookupv_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Finish an asynchronous operation to search for items in the secret service.

    Params:
      result = the asynchronous result passed to the callback
    Returns: a list of
        `ifaceRetrievable` containing attributes of the matched items
    Throws: [ErrorWrap]
*/
secret.retrievable.Retrievable[] passwordSearchFinish(gio.async_result.AsyncResult result)
{
  GList* _cretval;
  GError *_err;
  _cretval = secret_password_search_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gListToD!(secret.retrievable.Retrievable, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
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
        `ifaceRetrievable` containing attributes of the matched items
    Throws: [ErrorWrap]
*/
secret.retrievable.Retrievable[] passwordSearchSync(secret.schema.Schema schema, string[string] attributes, secret.types.SearchFlags flags, gio.cancellable.Cancellable cancellable = null)
{
  GList* _cretval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  GError *_err;
  _cretval = secret_password_searchv_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  auto _retval = gListToD!(secret.retrievable.Retrievable, GidOwnership.Full)(cast(GList*)_cretval);
  return _retval;
}

/**
    Finish asynchronous operation to store a password in the secret service.

    Params:
      result = the asynchronous result passed to the callback
    Returns: whether the storage was successful or not
    Throws: [ErrorWrap]
*/
bool passwordStoreFinish(gio.async_result.AsyncResult result)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)secret_password_store_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Store a password in the secret service.
    
    This is similar to `funcpassword_storev_sync`, but takes a `structValue` as
    the argument instead of a null-terminated passwords.
    
    This method may block indefinitely and should not be used in user interface
    threads.

    Params:
      schema = the schema for attributes
      attributes = the attribute keys and values
      collection = a collection alias, or D-Bus object path of the
          collection where to store the secret
      label = label for the secret
      value = a `structValue`
      cancellable = optional cancellation object
    Returns: whether the storage was successful or not
    Throws: [ErrorWrap]
*/
bool passwordStoreBinarySync(secret.schema.Schema schema, string[string] attributes, string collection, string label, secret.value.Value value, gio.cancellable.Cancellable cancellable = null)
{
  bool _retval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  const(char)* _collection = collection.toCString(No.Alloc);
  const(char)* _label = label.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)secret_password_storev_binary_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, value ? cast(SecretValue*)value._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Store a password in the secret service.
    
    The attributes should be a set of key and value string pairs.
    
    If the attributes match a secret item already stored in the collection, then
    the item will be updated with these new values.
    
    If collection is null, then the default collection will be
    used. Use `constCOLLECTION_SESSION` to store the password in the session
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
bool passwordStoreSync(secret.schema.Schema schema, string[string] attributes, string collection, string label, string password, gio.cancellable.Cancellable cancellable = null)
{
  bool _retval;
  auto _attributes = gHashTableFromD!(string, string)(attributes);
  scope(exit) containerFree!(GHashTable*, string, GidOwnership.None)(_attributes);
  const(char)* _collection = collection.toCString(No.Alloc);
  const(char)* _label = label.toCString(No.Alloc);
  const(char)* _password = password.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)secret_password_storev_sync(schema ? cast(const(SecretSchema)*)schema._cPtr(No.Dup) : null, _attributes, _collection, _label, _password, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Clear the memory used by a password.

    Params:
      password = password to clear
*/
void passwordWipe(string password = null)
{
  char* _password = password.toCString(No.Alloc);
  secret_password_wipe(_password);
}
