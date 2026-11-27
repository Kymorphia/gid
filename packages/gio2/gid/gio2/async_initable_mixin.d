/// Module for [AsyncInitable] interface mixin
module gid.gio2.async_initable_mixin;

public import gid.core.basictypes;
public import gid.gio2.async_initable;
public import gid.gio2.async_initable_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gobject2.parameter;
public import gid.gobject2.types;

/**
    [gid.gio2.async_initable.AsyncInitable] is an interface for asynchronously initializable objects.
    
    This is the asynchronous version of [gid.gio2.initable.Initable]; it behaves the same
    in all ways except that initialization is asynchronous. For more details
    see the descriptions on [gid.gio2.initable.Initable].
    
    A class may implement both the [gid.gio2.initable.Initable] and [gid.gio2.async_initable.AsyncInitable] interfaces.
    
    Users of objects implementing this are not intended to use the interface
    method directly; instead it will be used automatically in various ways.
    For C applications you generally just call [gid.gio2.async_initable.AsyncInitable.newAsync]
    directly, or indirectly via a foo_thing_new_async() wrapper. This will call
    [gid.gio2.async_initable.AsyncInitable.initAsync] under the covers, calling back with `NULL`
    and a set [gid.glib2.error.ErrorWrap] on failure.
    
    A typical implementation might look something like this:
    
    ```c
    enum {
       NOT_INITIALIZED,
       INITIALIZING,
       INITIALIZED
    };
    
    static void
    _foo_ready_cb (Foo *self)
    {
      GList *l;
    
      self->priv->state = INITIALIZED;
    
      for (l = self->priv->init_results; l != NULL; l = l->next)
        {
          GTask *task = l->data;
    
          if (self->priv->success)
            g_task_return_boolean (task, TRUE);
          else
            g_task_return_new_error (task, ...);
          g_object_unref (task);
        }
    
      g_list_free (self->priv->init_results);
      self->priv->init_results = NULL;
    }
    
    static void
    foo_init_async (GAsyncInitable       *initable,
                    int                   io_priority,
                    GCancellable         *cancellable,
                    GAsyncReadyCallback   callback,
                    gpointer              user_data)
    {
      Foo *self = FOO (initable);
      GTask *task;
    
      task = g_task_new (initable, cancellable, callback, user_data);
      g_task_set_name (task, G_STRFUNC);
    
      switch (self->priv->state)
        {
          case NOT_INITIALIZED:
            _foo_get_ready (self);
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            self->priv->state = INITIALIZING;
            break;
          case INITIALIZING:
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            break;
          case INITIALIZED:
            if (!self->priv->success)
              g_task_return_new_error (task, ...);
            else
              g_task_return_boolean (task, TRUE);
            g_object_unref (task);
            break;
        }
    }
    
    static gboolean
    foo_init_finish (GAsyncInitable       *initable,
                     GAsyncResult         *result,
                     GError              **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, initable), FALSE);
    
      return g_task_propagate_boolean (G_TASK (result), error);
    }
    
    static void
    foo_async_initable_iface_init (gpointer g_iface,
                                   gpointer data)
    {
      GAsyncInitableIface *iface = g_iface;
    
      iface->init_async = foo_init_async;
      iface->init_finish = foo_init_finish;
    }
    ```
*/
template AsyncInitableT()
{


  /**
      Starts asynchronous initialization of the object implementing the
      interface. This must be done before any real use of the object after
      initial construction. If the object also implements #GInitable you can
      optionally call [gid.gio2.initable.Initable.init_] instead.
      
      This method is intended for language bindings. If writing in C,
      [gid.gio2.async_initable.AsyncInitable.newAsync] should typically be used instead.
      
      When the initialization is finished, callback will be called. You can
      then call [gid.gio2.async_initable.AsyncInitable.initFinish] to get the result of the
      initialization.
      
      Implementations may also support cancellation. If cancellable is not
      null, then initialization can be cancelled by triggering the cancellable
      object from another thread. If the operation was cancelled, the error
      [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If cancellable is not null, and
      the object doesn't support cancellable initialization, the error
      [gid.gio2.types.IOErrorEnum.NotSupported] will be returned.
      
      As with #GInitable, if the object is not initialized, or initialization
      returns with an error, then all operations on the object except
      [gid.gobject2.object.ObjectWrap.ref_] and [gid.gobject2.object.ObjectWrap.unref] are considered to be invalid, and
      have undefined behaviour. They will often fail with g_critical() or
      g_warning(), but this must not be relied on.
      
      Callers should not assume that a class which implements #GAsyncInitable can
      be initialized multiple times; for more information, see [gid.gio2.initable.Initable.init_].
      If a class explicitly supports being initialized multiple times,
      implementation requires yielding all subsequent calls to init_async() on the
      results of the first call.
      
      For classes that also support the #GInitable interface, the default
      implementation of this method will run the [gid.gio2.initable.Initable.init_] function
      in a thread, so if you want to support asynchronous initialization via
      threads, just implement the #GAsyncInitable interface without overriding
      any interface methods.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncInitAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncInitAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GAsyncInitableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.async_initable.AsyncInitable._getGType);
    if (!_klass || !_klass.initAsync)
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
    _klass.initAsync(cast(GAsyncInitable*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes asynchronous initialization and returns the result.
      See [gid.gio2.async_initable.AsyncInitable.initAsync].
  
      Params:
        res = a #GAsyncResult.
      Returns: true if successful. If an error has occurred, this function
        will return false and set error appropriately if present.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncInitFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncInitFinish(gid.gio2.async_result.AsyncResult res)
  {
    auto _klass = cast(GAsyncInitableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.async_initable.AsyncInitable._getGType);
    if (!_klass || !_klass.initFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.initFinish(cast(GAsyncInitable*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Starts asynchronous initialization of the object implementing the
      interface. This must be done before any real use of the object after
      initial construction. If the object also implements #GInitable you can
      optionally call [gid.gio2.initable.Initable.init_] instead.
      
      This method is intended for language bindings. If writing in C,
      [gid.gio2.async_initable.AsyncInitable.newAsync] should typically be used instead.
      
      When the initialization is finished, callback will be called. You can
      then call [gid.gio2.async_initable.AsyncInitable.initFinish] to get the result of the
      initialization.
      
      Implementations may also support cancellation. If cancellable is not
      null, then initialization can be cancelled by triggering the cancellable
      object from another thread. If the operation was cancelled, the error
      [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If cancellable is not null, and
      the object doesn't support cancellable initialization, the error
      [gid.gio2.types.IOErrorEnum.NotSupported] will be returned.
      
      As with #GInitable, if the object is not initialized, or initialization
      returns with an error, then all operations on the object except
      [gid.gobject2.object.ObjectWrap.ref_] and [gid.gobject2.object.ObjectWrap.unref] are considered to be invalid, and
      have undefined behaviour. They will often fail with g_critical() or
      g_warning(), but this must not be relied on.
      
      Callers should not assume that a class which implements #GAsyncInitable can
      be initialized multiple times; for more information, see [gid.gio2.initable.Initable.init_].
      If a class explicitly supports being initialized multiple times,
      implementation requires yielding all subsequent calls to init_async() on the
      results of the first call.
      
      For classes that also support the #GInitable interface, the default
      implementation of this method will run the [gid.gio2.initable.Initable.init_] function
      in a thread, so if you want to support asynchronous initialization via
      threads, just implement the #GAsyncInitable interface without overriding
      any interface methods.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  override void initAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_async_initable_init_async(cast(GAsyncInitable*)this._cPtr, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes asynchronous initialization and returns the result.
      See [gid.gio2.async_initable.AsyncInitable.initAsync].
  
      Params:
        res = a #GAsyncResult.
      Returns: true if successful. If an error has occurred, this function
        will return false and set error appropriately if present.
      Throws: [ErrorWrap]
  */
  override bool initFinish(gid.gio2.async_result.AsyncResult res)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_async_initable_init_finish(cast(GAsyncInitable*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Finishes the async construction for the various g_async_initable_new
      calls, returning the created object or null on error.
  
      Params:
        res = the #GAsyncResult from the callback
      Returns: a newly created #GObject,
             or null on error. Free with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  override gid.gobject2.object.ObjectWrap newFinish(gid.gio2.async_result.AsyncResult res)
  {
    GObject* _cretval;
    GError *_err;
    _cretval = g_async_initable_new_finish(cast(GAsyncInitable*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.async_initable.AsyncInitable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_async_initable_AsyncInitable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInitAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInitFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.async_initable.AsyncInitable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_async_initable_AsyncInitable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInitAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.async_initable.AsyncInitable.vfuncInitAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncInitFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_async_initable_AsyncInitable(iface, "init_finish");
  }

  private static void _installIfaceVfunc_gid_gio2_async_initable_AsyncInitable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GAsyncInitableIface*)iface;

    switch (vfunc)
    {
      case "init_finish":
      {
        static extern(C) gboolean _vfuncInitFinishTramp(GAsyncInitable* initable, GAsyncResult* res, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)initable);
          if (!_obj)
          {
            auto _klass = cast(GAsyncInitableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)initable), gid.gio2.async_initable.AsyncInitable._getGType);
            if (_klass && _klass.initFinish)
              return (cast(typeof(&_vfuncInitFinishTramp))_klass.initFinish)(initable, res, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncInitFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.initFinish = cast(typeof(_klass.initFinish))&_vfuncInitFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.async_initable.AsyncInitable]
template AsyncInitableGidBuilderT()
{
}
