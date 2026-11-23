/// Module for [AsyncResult] interface mixin
module gid.gio2.async_result_mixin;

public import gid.core.basictypes;
public import gid.gio2.async_result_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.async_result.AsyncResult] provides a base class for implementing asynchronous function results.
    
    Asynchronous operations are broken up into two separate operations
    which are chained together by a [gid.gio2.types.AsyncReadyCallback]. To begin
    an asynchronous operation, provide a [gid.gio2.types.AsyncReadyCallback] to the
    asynchronous function. This callback will be triggered when the
    operation has completed, and must be run in a later iteration of
    the thread-default main context (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]) from where the operation was
    initiated. It will be passed a [gid.gio2.async_result.AsyncResult] instance filled with the
    details of the operation's success or failure, the object the asynchronous
    function was started for and any error codes returned. The asynchronous
    callback function is then expected to call the corresponding `_finish()`
    function, passing the object the function was called for, the
    [gid.gio2.async_result.AsyncResult] instance, and (optionally) an @error to grab any
    error conditions that may have occurred.
    
    The `_finish()` function for an operation takes the generic result
    (of type [gid.gio2.async_result.AsyncResult]) and returns the specific result that the
    operation in question yields (e.g. a [gid.gio2.file_enumerator.FileEnumerator] for a
    "enumerate children" operation). If the result or error status of the
    operation is not needed, there is no need to call the `_finish()`
    function; GIO will take care of cleaning up the result and error
    information after the [gid.gio2.types.AsyncReadyCallback] returns. You can pass
    `NULL` for the [gid.gio2.types.AsyncReadyCallback] if you don't need to take any
    action at all after the operation completes. Applications may also
    take a reference to the [gid.gio2.async_result.AsyncResult] and call `_finish()` later;
    however, the `_finish()` function may be called at most once.
    
    Example of a typical asynchronous operation flow:
    
    ```c
    void _theoretical_frobnitz_async (Theoretical         *t,
                                      GCancellable        *c,
                                      GAsyncReadyCallback  cb,
                                      gpointer             u);
    
    gboolean _theoretical_frobnitz_finish (Theoretical   *t,
                                           GAsyncResult  *res,
                                           GError       **e);
    
    static void
    frobnitz_result_func (GObject      *source_object,
    		 GAsyncResult *res,
    		 gpointer      user_data)
    {
      gboolean success = FALSE;
    
      success = _theoretical_frobnitz_finish (source_object, res, NULL);
    
      if (success)
        g_printf ("Hurray!\n");
      else
        g_printf ("Uh oh!\n");
    
      ...
    
    }
    
    int main (int argc, void *argv[])
    {
       ...
    
       _theoretical_frobnitz_async (theoretical_data,
                                    NULL,
                                    frobnitz_result_func,
                                    NULL);
    
       ...
    }
    ```
    
    The callback for an asynchronous operation is called only once, and is
    always called, even in the case of a cancelled operation. On cancellation
    the result is a [gid.gio2.types.IOErrorEnum.Cancelled] error.
    
    ## I/O Priority
    
    Many I/O-related asynchronous operations have a priority parameter,
    which is used in certain cases to determine the order in which
    operations are executed. They are not used to determine system-wide
    I/O scheduling. Priorities are integers, with lower numbers indicating
    higher priority. It is recommended to choose priorities between
    [gid.glib2.types.PRIORITY_LOW] and [gid.glib2.types.PRIORITY_HIGH], with [gid.glib2.types.PRIORITY_DEFAULT]
    as a default.
*/
template AsyncResultT()
{

  /**
      Gets the source object from a [gid.gio2.async_result.AsyncResult].
      Returns: a new reference to the source
           object for the res, or `NULL` if there is none.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetSourceObject`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gobject2.object.ObjectWrap vfuncGetSourceObject()
  {
    auto _klass = cast(GAsyncResultIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.async_result.AsyncResult._getGType);
    if (!_klass || !_klass.getSourceObject)
      return typeof(return).init;

    GObject* _cretval;
    _cretval = _klass.getSourceObject(cast(GAsyncResult*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the user data from a [gid.gio2.async_result.AsyncResult].
      Returns: the user data for res.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetUserData`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void* vfuncGetUserData()
  {
    auto _klass = cast(GAsyncResultIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.async_result.AsyncResult._getGType);
    if (!_klass || !_klass.getUserData)
      return typeof(return).init;

    auto _retval = _klass.getUserData(cast(GAsyncResult*)this._cPtr);
    return _retval;
  }

  /**
      Checks if res has the given source_tag (generally a function
      pointer indicating the function res was created by).
  
      Params:
        sourceTag = an application-defined tag
      Returns: `TRUE` if res has the indicated source_tag, `FALSE` if
          not.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsTagged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsTagged(void* sourceTag = null)
  {
    auto _klass = cast(GAsyncResultIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.async_result.AsyncResult._getGType);
    if (!_klass || !_klass.isTagged)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isTagged(cast(GAsyncResult*)this._cPtr, sourceTag);
    return _retval;
  }

  /**
      Gets the source object from a [gid.gio2.async_result.AsyncResult].
      Returns: a new reference to the source
           object for the res, or `NULL` if there is none.
  */
  override gid.gobject2.object.ObjectWrap getSourceObject() nothrow
  {
    GObject* _cretval;
    _cretval = g_async_result_get_source_object(cast(GAsyncResult*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the user data from a [gid.gio2.async_result.AsyncResult].
      Returns: the user data for res.
  */
  override void* getUserData() nothrow
  {
    auto _retval = g_async_result_get_user_data(cast(GAsyncResult*)this._cPtr);
    return _retval;
  }

  /**
      Checks if res has the given source_tag (generally a function
      pointer indicating the function res was created by).
  
      Params:
        sourceTag = an application-defined tag
      Returns: `TRUE` if res has the indicated source_tag, `FALSE` if
          not.
  */
  override bool isTagged(void* sourceTag = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_async_result_is_tagged(cast(GAsyncResult*)this._cPtr, sourceTag);
    return _retval;
  }

  /**
      If res is a [gid.gio2.simple_async_result.SimpleAsyncResult], this is equivalent to
      [gid.gio2.simple_async_result.SimpleAsyncResult.propagateError]. Otherwise it returns
      `FALSE`.
      
      This can be used for legacy error handling in async `*_finish()`
      wrapper functions that traditionally handled [gid.gio2.simple_async_result.SimpleAsyncResult]
      error returns themselves rather than calling into the virtual method.
      This should not be used in new code; [gid.gio2.async_result.AsyncResult] errors that are
      set by virtual methods should also be extracted by virtual methods,
      to enable subclasses to chain up correctly.
      Returns: `TRUE` if error is has been filled in with an error from
          res, `FALSE` if not.
      Throws: [ErrorWrap]
  */
  override bool legacyPropagateError()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_async_result_legacy_propagate_error(cast(GAsyncResult*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.async_result.AsyncResult (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_async_result_AsyncResult(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSourceObject", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUserData", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsTagged", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.async_result.AsyncResult vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_async_result_AsyncResult(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetSourceObject", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_async_result_AsyncResult(iface, "get_source_object");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetUserData", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_async_result_AsyncResult(iface, "get_user_data");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsTagged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_async_result_AsyncResult(iface, "is_tagged");
  }

  private static void _installIfaceVfunc_gid_gio2_async_result_AsyncResult(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GAsyncResultIface*)iface;

    switch (vfunc)
    {
      case "get_source_object":
      {
        static extern(C) GObject* _vfuncGetSourceObjectTramp(GAsyncResult* res) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)res);
          if (!_obj)
          {
            auto _klass = cast(GAsyncResultIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)res), gid.gio2.async_result.AsyncResult._getGType);
            if (_klass && _klass.getSourceObject)
              return (cast(typeof(&_vfuncGetSourceObjectTramp))_klass.getSourceObject)(res);
            return typeof(return).init;
          }

          gid.gobject2.object.ObjectWrap _dretval;

          try
          {
            _dretval = _obj.vfuncGetSourceObject();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.async_result.AsyncResult.vfuncGetSourceObject");
          }
          auto _retval = _dretval ? cast(GObject*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getSourceObject = cast(typeof(_klass.getSourceObject))&_vfuncGetSourceObjectTramp;
        break;
      }
      case "get_user_data":
      {
        static extern(C) void* _vfuncGetUserDataTramp(GAsyncResult* res) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)res);
          if (!_obj)
          {
            auto _klass = cast(GAsyncResultIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)res), gid.gio2.async_result.AsyncResult._getGType);
            if (_klass && _klass.getUserData)
              return (cast(typeof(&_vfuncGetUserDataTramp))_klass.getUserData)(res);
            return typeof(return).init;
          }

          void* _retval;

          try
          {
            _retval = _obj.vfuncGetUserData();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.async_result.AsyncResult.vfuncGetUserData");
          }
          return _retval;
        }

        _klass.getUserData = cast(typeof(_klass.getUserData))&_vfuncGetUserDataTramp;
        break;
      }
      case "is_tagged":
      {
        static extern(C) gboolean _vfuncIsTaggedTramp(GAsyncResult* res, void* sourceTag) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)res);
          if (!_obj)
          {
            auto _klass = cast(GAsyncResultIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)res), gid.gio2.async_result.AsyncResult._getGType);
            if (_klass && _klass.isTagged)
              return (cast(typeof(&_vfuncIsTaggedTramp))_klass.isTagged)(res, sourceTag);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsTagged(sourceTag);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.async_result.AsyncResult.vfuncIsTagged");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isTagged = cast(typeof(_klass.isTagged))&_vfuncIsTaggedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.async_result.AsyncResult]
template AsyncResultGidBuilderT()
{
}
