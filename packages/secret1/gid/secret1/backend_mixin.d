/// Module for [Backend] interface mixin
module gid.secret1.backend_mixin;

public import gid.core.basictypes;
public import gid.secret1.backend;
public import gid.secret1.backend_iface_proxy;
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
    #SecretBackend represents a backend implementation of password
    storage.
*/
template BackendT()
{

  /**
      Get `flags` property.
      Returns: A set of flags describing which parts of the secret backend have
        been initialized.
  */
  @property gid.secret1.types.ServiceFlags flags() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.secret1.types.ServiceFlags)("flags");
  }



  /**
      implementation of `funcpassword_clear_finish`, required
  
      Params:
        result = 
      Returns: 
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncClearFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncClearFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.secret1.backend.Backend._getGType);
    if (!_klass || !_klass.clearFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.clearFinish(cast(SecretBackend*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      implementation of reinitialization step in constructor, optional
  
      Params:
        flags = 
        cancellable = 
        callback = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnsureForFlags`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncEnsureForFlags(gid.secret1.types.BackendFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.secret1.backend.Backend._getGType);
    if (!_klass || !_klass.ensureForFlags)
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
    _klass.ensureForFlags(cast(SecretBackend*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      implementation of reinitialization step in constructor, optional
  
      Params:
        result = 
      Returns: 
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnsureForFlagsFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncEnsureForFlagsFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.secret1.backend.Backend._getGType);
    if (!_klass || !_klass.ensureForFlagsFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.ensureForFlagsFinish(cast(SecretBackend*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      implementation of `funcpassword_lookup_finish`, required
  
      Params:
        result = 
      Returns: 
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLookupFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.secret1.value.Value vfuncLookupFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.secret1.backend.Backend._getGType);
    if (!_klass || !_klass.lookupFinish)
      return typeof(return).init;

    SecretValue* _cretval;
    GError *_err;
    _cretval = _klass.lookupFinish(cast(SecretBackend*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = _cretval ? new gid.secret1.value.Value(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      implementation of `funcpassword_store_finish`, required
  
      Params:
        result = 
      Returns: 
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncStoreFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncStoreFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.secret1.backend.Backend._getGType);
    if (!_klass || !_klass.storeFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.storeFinish(cast(SecretBackend*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.secret1.backend.Backend (DiG)
  enum bool _ifaceVfuncsOverridden_gid_secret1_backend_Backend(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClearFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnsureForFlags", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnsureForFlagsFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStoreFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.secret1.backend.Backend vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_secret1_backend_Backend(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncClearFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_secret1_backend_Backend(iface, "clear_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnsureForFlags", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.secret1.backend.Backend.vfuncEnsureForFlags is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnsureForFlagsFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_secret1_backend_Backend(iface, "ensure_for_flags_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_secret1_backend_Backend(iface, "lookup_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncStoreFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_secret1_backend_Backend(iface, "store_finish");
  }

  private static void _installIfaceVfunc_gid_secret1_backend_Backend(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(SecretBackendInterface*)iface;

    switch (vfunc)
    {
      case "clear_finish":
      {
        static extern(C) gboolean _vfuncClearFinishTramp(SecretBackend* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.secret1.backend.Backend._getGType);
            if (_klass && _klass.clearFinish)
              return (cast(typeof(&_vfuncClearFinishTramp))_klass.clearFinish)(self, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncClearFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.clearFinish = cast(typeof(_klass.clearFinish))&_vfuncClearFinishTramp;
        break;
      }
      case "ensure_for_flags_finish":
      {
        static extern(C) gboolean _vfuncEnsureForFlagsFinishTramp(SecretBackend* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.secret1.backend.Backend._getGType);
            if (_klass && _klass.ensureForFlagsFinish)
              return (cast(typeof(&_vfuncEnsureForFlagsFinishTramp))_klass.ensureForFlagsFinish)(self, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncEnsureForFlagsFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.ensureForFlagsFinish = cast(typeof(_klass.ensureForFlagsFinish))&_vfuncEnsureForFlagsFinishTramp;
        break;
      }
      case "lookup_finish":
      {
        static extern(C) SecretValue* _vfuncLookupFinishTramp(SecretBackend* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.secret1.backend.Backend._getGType);
            if (_klass && _klass.lookupFinish)
              return (cast(typeof(&_vfuncLookupFinishTramp))_klass.lookupFinish)(self, result, _err);
            return typeof(return).init;
          }

          gid.secret1.value.Value _dretval;

          try
          {
            _dretval = _obj.vfuncLookupFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(SecretValue*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.lookupFinish = cast(typeof(_klass.lookupFinish))&_vfuncLookupFinishTramp;
        break;
      }
      case "store_finish":
      {
        static extern(C) gboolean _vfuncStoreFinishTramp(SecretBackend* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(SecretBackendInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.secret1.backend.Backend._getGType);
            if (_klass && _klass.storeFinish)
              return (cast(typeof(&_vfuncStoreFinishTramp))_klass.storeFinish)(self, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStoreFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.storeFinish = cast(typeof(_klass.storeFinish))&_vfuncStoreFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.secret1.backend.Backend]
template BackendGidBuilderT()
{

  /**
      Set `flags` property.
      Params:
        propval = A set of flags describing which parts of the secret backend have
          been initialized.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.secret1.types.ServiceFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }
}
