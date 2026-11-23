/// Module for [Retrievable] interface mixin
module gid.secret1.retrievable_mixin;

public import gid.core.basictypes;
public import gid.secret1.retrievable_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.secret1.c.functions;
public import gid.secret1.c.types;
public import gid.secret1.types;
public import gid.secret1.value;

/**
    A read-only view of a secret item in the Secret Service.
    
    #SecretRetrievable provides a read-only view of a secret item
    stored in the Secret Service.
    
    Each item has a value, represented by a [gid.secret1.value.Value], which can be
    retrieved by [gid.secret1.retrievable.Retrievable.retrieveSecret] and
    [gid.secret1.retrievable.Retrievable.retrieveSecretFinish].
*/
template RetrievableT()
{

  /**
      Get `created` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was created.
  */
  @property ulong created() nothrow
  {
    return getCreated();
  }

  /**
      Set `created` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was created.
  */
  @property void created(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("created", propval);
  }

  /**
      Get `label` property.
      Returns: The human readable label for the item.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The human readable label for the item.
  */
  @property void label(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("label", propval);
  }

  /**
      Get `modified` property.
      Returns: The date and time (in seconds since the UNIX epoch) that this
        item was last modified.
  */
  @property ulong modified() nothrow
  {
    return getModified();
  }

  /**
      Set `modified` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was last modified.
  */
  @property void modified(ulong propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(ulong)("modified", propval);
  }

  /**
      Retrieve the secret value of this object.
      
      Each retrievable object has a single secret which might be a
      password or some other secret binary value.
      
      This function returns immediately and completes asynchronously.
  
      Params:
        cancellable = optional cancellation object
        callback = called when the operation completes
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRetrieveSecret`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRetrieveSecret(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(SecretRetrievableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.secret1.retrievable.Retrievable._getGType);
    if (!_klass || !_klass.retrieveSecret)
      return;

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
    _klass.retrieveSecret(cast(SecretRetrievable*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to retrieve the secret value of this object.
  
      Params:
        result = asynchronous result passed to callback
      Returns: the secret value which should be
          released with [gid.secret1.value.Value.unref], or null
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRetrieveSecretFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.secret1.value.Value vfuncRetrieveSecretFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(SecretRetrievableInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.secret1.retrievable.Retrievable._getGType);
    if (!_klass || !_klass.retrieveSecretFinish)
      return typeof(return).init;

    SecretValue* _cretval;
    GError *_err;
    _cretval = _klass.retrieveSecretFinish(cast(SecretRetrievable*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.secret1.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the attributes of this object.
      
      The attributes are a mapping of string keys to string values.
      Attributes are used to search for items. Attributes are not stored
      or transferred securely by the secret service.
      
      Do not modify the attribute returned by this method.
      Returns: a new reference
          to the attributes, which should not be modified, and
          released with [gid.glib2.hash_table.HashTable.unref]
  */
  override string[string] getAttributes() nothrow
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
  override ulong getCreated() nothrow
  {
    ulong _retval;
    _retval = secret_retrievable_get_created(cast(SecretRetrievable*)this._cPtr);
    return _retval;
  }

  /**
      Get the label of this item.
      Returns: the label, which should be freed with `funcGLib.free`
  */
  override string getLabel() nothrow
  {
    char* _cretval;
    _cretval = secret_retrievable_get_label(cast(SecretRetrievable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the modified date and time of the object.
      
      The return value is the number of seconds since the unix epoch, January 1st
      1970.
      Returns: the modified date and time
  */
  override ulong getModified() nothrow
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
  override void retrieveSecret(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    secret_retrievable_retrieve_secret(cast(SecretRetrievable*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete asynchronous operation to retrieve the secret value of this object.
  
      Params:
        result = asynchronous result passed to callback
      Returns: the secret value which should be
          released with [gid.secret1.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  override gid.secret1.value.Value retrieveSecretFinish(gid.gio2.async_result.AsyncResult result)
  {
    SecretValue* _cretval;
    GError *_err;
    _cretval = secret_retrievable_retrieve_secret_finish(cast(SecretRetrievable*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.secret1.value.Value(cast(void*)_cretval, Yes.Take) : null;
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
          released with [gid.secret1.value.Value.unref], or null
      Throws: [ErrorWrap]
  */
  override gid.secret1.value.Value retrieveSecretSync(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    SecretValue* _cretval;
    GError *_err;
    _cretval = secret_retrievable_retrieve_secret_sync(cast(SecretRetrievable*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.secret1.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.secret1.retrievable.Retrievable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_secret1_retrievable_Retrievable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRetrieveSecret", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRetrieveSecretFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.secret1.retrievable.Retrievable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_secret1_retrievable_Retrievable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRetrieveSecret", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.secret1.retrievable.Retrievable.vfuncRetrieveSecret is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRetrieveSecretFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_secret1_retrievable_Retrievable(iface, "retrieve_secret_finish");
  }

  private static void _installIfaceVfunc_gid_secret1_retrievable_Retrievable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(SecretRetrievableInterface*)iface;

    switch (vfunc)
    {
      case "retrieve_secret_finish":
      {
        static extern(C) SecretValue* _vfuncRetrieveSecretFinishTramp(SecretRetrievable* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretRetrievableInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.secret1.retrievable.Retrievable._getGType);
            if (_klass && _klass.retrieveSecretFinish)
              return (cast(typeof(&_vfuncRetrieveSecretFinishTramp))_klass.retrieveSecretFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.secret1.value.Value _dretval;

          try
          {
            _dretval = _obj.vfuncRetrieveSecretFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(SecretValue*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.retrieveSecretFinish = cast(typeof(_klass.retrieveSecretFinish))&_vfuncRetrieveSecretFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.secret1.retrievable.Retrievable]
template RetrievableGidBuilderT()
{

  /**
      Set `created` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was created.
      Returns: Builder instance for fluent chaining
  */
  T created(ulong propval) nothrow
  {
    return setProperty("created", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = The human readable label for the item.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `modified` property.
      Params:
        propval = The date and time (in seconds since the UNIX epoch) that this
          item was last modified.
      Returns: Builder instance for fluent chaining
  */
  T modified(ulong propval) nothrow
  {
    return setProperty("modified", propval);
  }
}
