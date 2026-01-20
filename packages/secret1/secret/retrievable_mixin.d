/// Module for [Retrievable] interface mixin
module secret.retrievable_mixin;

public import secret.retrievable_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import gobject.object;
public import secret.c.functions;
public import secret.c.types;
public import secret.types;
public import secret.value;

/**
    A read-only view of a secret item in the Secret Service.
    
    #SecretRetrievable provides a read-only view of a secret item
    stored in the Secret Service.
    
    Each item has a value, represented by a `struct@Value`, which can be
    retrieved by [secret.retrievable.Retrievable.retrieveSecret] and
    [secret.retrievable.Retrievable.retrieveSecretFinish].
*/
template RetrievableT()
{

  /**
      Get `created` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was created.
  */
  @property ulong created()
  {
    return getCreated();
  }

  /**
      Set `created` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was created.
  */
  @property void created(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("created", propval);
  }

  /**
      Get `label` property.
      Returns: The human readable label for the item.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The human readable label for the item.
  */
  @property void label(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("label", propval);
  }

  /**
      Get `modified` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was last modified.
  */
  @property ulong modified()
  {
    return getModified();
  }

  /**
      Set `modified` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was last modified.
  */
  @property void modified(ulong propval)
  {
    gobject.object.ObjectWrap.setProperty!(ulong)("modified", propval);
  }

  /**
      Get the attributes of this object.
      
      The attributes are a mapping of string keys to string values.
      Attributes are used to search for items. Attributes are not stored
      or transferred securely by the secret service.
      
      Do not modify the attribute returned by this method.
      Returns: a new reference
          to the attributes, which should not be modified, and
          released with [glib.hash_table.HashTable.unref]
  */
  override string[string] getAttributes()
  {
    GHashTable* _cretval;
    _cretval = secret_retrievable_get_attributes(cast(SecretRetrievable*)this._cPtr);
    auto _retval = gHashTableToD!(string, string, GidOwnership.Full)(cast(GHashTable*)_cretval);
    return _retval;
  }

  /**
      Get the created date and time of the object.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the created date and time
  */
  override ulong getCreated()
  {
    ulong _retval;
    _retval = secret_retrievable_get_created(cast(SecretRetrievable*)this._cPtr);
    return _retval;
  }

  /**
      Get the label of this item.
      Returns: the label, which should be freed with `funcGLib.free`
  */
  override string getLabel()
  {
    char* _cretval;
    _cretval = secret_retrievable_get_label(cast(SecretRetrievable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the modified date and time of the object.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the modified date and time
  */
  override ulong getModified()
  {
    ulong _retval;
    _retval = secret_retrievable_get_modified(cast(SecretRetrievable*)this._cPtr);
    return _retval;
  }

  /**
      Retrieve the secret value of this object.
      
      Each retrievable object has a single secret which might be a
      password or some other secret binary value.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  override void retrieveSecret(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    secret_retrievable_retrieve_secret(cast(SecretRetrievable*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to retrieve the secret value of this object.
  
      Params:
        result = asynchronous result passed to callback
      Returns: the secret value which should be
          released with [secret.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  override secret.value.Value retrieveSecretFinish(gio.async_result.AsyncResult result)
  {
    SecretValue* _cretval;
    GError *_err;
    _cretval = secret_retrievable_retrieve_secret_finish(cast(SecretRetrievable*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new secret.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Retrieve the secret value of this object synchronously.
      
      Each retrievable object has a single secret which might be a
      password or some other secret binary value.
      
      This method may block indefinitely and should not be used in user interface
      threads.
  
      Params:
        cancellable = optional cancellation object
      Returns: the secret value which should be
          released with [secret.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  override secret.value.Value retrieveSecretSync(gio.cancellable.Cancellable cancellable = null)
  {
    SecretValue* _cretval;
    GError *_err;
    _cretval = secret_retrievable_retrieve_secret_sync(cast(SecretRetrievable*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new secret.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
