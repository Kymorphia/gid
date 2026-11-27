/// Module for [Permission] class
module gid.gio2.permission;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.permission.Permission] represents the status of the caller’s permission to
    perform a certain action.
    
    You can query if the action is currently allowed and if it is
    possible to acquire the permission so that the action will be allowed
    in the future.
    
    There is also an API to actually acquire the permission and one to
    release it.
    
    As an example, a [gid.gio2.permission.Permission] might represent the ability for the
    user to write to a [gid.gio2.settings.Settings] object.  This [gid.gio2.permission.Permission] object
    could then be used to decide if it is appropriate to show a “Click here to
    unlock” button in a dialog and to provide the mechanism to invoke
    when that button is clicked.
*/
@gidGir("Permission", "PermissionClass")
class Permission : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_permission_get_type != &gidSymbolNotFound ? g_permission_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GPermission";
  }

  /** Returns `this`, for use in `with` statements. */
  override Permission self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.permission.Permission]
      Returns: New builder object
  */
  static PermissionGidBuilder builder() nothrow
  {
    return new PermissionGidBuilder;
  }

  /**
      Get `allowed` property.
      Returns: true if the caller currently has permission to perform the action that
        @permission represents the permission to perform.
  */
  @property bool allowed() nothrow
  {
    return getAllowed();
  }

  /**
      Get `canAcquire` property.
      Returns: true if it is generally possible to acquire the permission by calling
        [gid.gio2.permission.Permission.acquire].
  */
  @property bool canAcquire() nothrow
  {
    return getCanAcquire();
  }

  /**
      Get `canRelease` property.
      Returns: true if it is generally possible to release the permission by calling
        [gid.gio2.permission.Permission.release].
  */
  @property bool canRelease() nothrow
  {
    return getCanRelease();
  }

  /**
      Attempts to acquire the permission represented by permission.
      
      The precise method by which this happens depends on the permission
      and the underlying authentication mechanism.  A simple example is
      that a dialog may appear asking the user to enter their password.
      
      You should check with [gid.gio2.permission.Permission.getCanAcquire] before calling
      this function.
      
      If the permission is acquired then true is returned.  Otherwise,
      false is returned and error is set appropriately.
      
      This call is blocking, likely for a very long time (in the case that
      user interaction is required).  See [gid.gio2.permission.Permission.acquireAsync] for
      the non-blocking version.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: true if the permission was successfully acquired
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAcquire` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAcquire(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GPermissionClass*)_vfuncClass;
    if (!_klass.acquire)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.acquire(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Attempts to acquire the permission represented by permission.
      
      This is the first half of the asynchronous version of
      [gid.gio2.permission.Permission.acquire].
  
      Params:
        cancellable = a #GCancellable, or null
        callback = the #GAsyncReadyCallback to call when done
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAcquireAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncAcquireAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GPermissionClass*)_vfuncClass;
    if (!_klass.acquireAsync)
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
    _klass.acquireAsync(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Collects the result of attempting to acquire the permission
      represented by permission.
      
      This is the second half of the asynchronous version of
      [gid.gio2.permission.Permission.acquire].
  
      Params:
        result = the #GAsyncResult given to the #GAsyncReadyCallback
      Returns: true if the permission was successfully acquired
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncAcquireFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncAcquireFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GPermissionClass*)_vfuncClass;
    if (!_klass.acquireFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.acquireFinish(cast(GPermission*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Attempts to release the permission represented by permission.
      
      The precise method by which this happens depends on the permission
      and the underlying authentication mechanism.  In most cases the
      permission will be dropped immediately without further action.
      
      You should check with [gid.gio2.permission.Permission.getCanRelease] before calling
      this function.
      
      If the permission is released then true is returned.  Otherwise,
      false is returned and error is set appropriately.
      
      This call is blocking, likely for a very long time (in the case that
      user interaction is required).  See [gid.gio2.permission.Permission.releaseAsync] for
      the non-blocking version.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: true if the permission was successfully released
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRelease` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncRelease(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GPermissionClass*)_vfuncClass;
    if (!_klass.release)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.release(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Attempts to release the permission represented by permission.
      
      This is the first half of the asynchronous version of
      [gid.gio2.permission.Permission.release].
  
      Params:
        cancellable = a #GCancellable, or null
        callback = the #GAsyncReadyCallback to call when done
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReleaseAsync` to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  protected void vfuncReleaseAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GPermissionClass*)_vfuncClass;
    if (!_klass.releaseAsync)
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
    _klass.releaseAsync(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Collects the result of attempting to release the permission
      represented by permission.
      
      This is the second half of the asynchronous version of
      [gid.gio2.permission.Permission.release].
  
      Params:
        result = the #GAsyncResult given to the #GAsyncReadyCallback
      Returns: true if the permission was successfully released
      Throws: [ErrorWrap]
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReleaseFinish` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncReleaseFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GPermissionClass*)_vfuncClass;
    if (!_klass.releaseFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.releaseFinish(cast(GPermission*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Attempts to acquire the permission represented by permission.
      
      The precise method by which this happens depends on the permission
      and the underlying authentication mechanism.  A simple example is
      that a dialog may appear asking the user to enter their password.
      
      You should check with [gid.gio2.permission.Permission.getCanAcquire] before calling
      this function.
      
      If the permission is acquired then true is returned.  Otherwise,
      false is returned and error is set appropriately.
      
      This call is blocking, likely for a very long time (in the case that
      user interaction is required).  See [gid.gio2.permission.Permission.acquireAsync] for
      the non-blocking version.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: true if the permission was successfully acquired
      Throws: [ErrorWrap]
  */
  bool acquire(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_permission_acquire(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Attempts to acquire the permission represented by permission.
      
      This is the first half of the asynchronous version of
      [gid.gio2.permission.Permission.acquire].
  
      Params:
        cancellable = a #GCancellable, or null
        callback = the #GAsyncReadyCallback to call when done
  */
  void acquireAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_permission_acquire_async(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Collects the result of attempting to acquire the permission
      represented by permission.
      
      This is the second half of the asynchronous version of
      [gid.gio2.permission.Permission.acquire].
  
      Params:
        result = the #GAsyncResult given to the #GAsyncReadyCallback
      Returns: true if the permission was successfully acquired
      Throws: [ErrorWrap]
  */
  bool acquireFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_permission_acquire_finish(cast(GPermission*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of the 'allowed' property.  This property is true if
      the caller currently has permission to perform the action that
      permission represents the permission to perform.
      Returns: the value of the 'allowed' property
  */
  bool getAllowed() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_permission_get_allowed(cast(GPermission*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the 'can-acquire' property.  This property is true
      if it is generally possible to acquire the permission by calling
      [gid.gio2.permission.Permission.acquire].
      Returns: the value of the 'can-acquire' property
  */
  bool getCanAcquire() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_permission_get_can_acquire(cast(GPermission*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of the 'can-release' property.  This property is true
      if it is generally possible to release the permission by calling
      [gid.gio2.permission.Permission.release].
      Returns: the value of the 'can-release' property
  */
  bool getCanRelease() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_permission_get_can_release(cast(GPermission*)this._cPtr);
    return _retval;
  }

  /**
      This function is called by the #GPermission implementation to update
      the properties of the permission.  You should never call this
      function except from a #GPermission implementation.
      
      GObject notify signals are generated, as appropriate.
  
      Params:
        allowed = the new value for the 'allowed' property
        canAcquire = the new value for the 'can-acquire' property
        canRelease = the new value for the 'can-release' property
  */
  void implUpdate(bool allowed, bool canAcquire, bool canRelease) nothrow
  {
    g_permission_impl_update(cast(GPermission*)this._cPtr, allowed, canAcquire, canRelease);
  }

  /**
      Attempts to release the permission represented by permission.
      
      The precise method by which this happens depends on the permission
      and the underlying authentication mechanism.  In most cases the
      permission will be dropped immediately without further action.
      
      You should check with [gid.gio2.permission.Permission.getCanRelease] before calling
      this function.
      
      If the permission is released then true is returned.  Otherwise,
      false is returned and error is set appropriately.
      
      This call is blocking, likely for a very long time (in the case that
      user interaction is required).  See [gid.gio2.permission.Permission.releaseAsync] for
      the non-blocking version.
  
      Params:
        cancellable = a #GCancellable, or null
      Returns: true if the permission was successfully released
      Throws: [ErrorWrap]
  */
  bool release(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_permission_release(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Attempts to release the permission represented by permission.
      
      This is the first half of the asynchronous version of
      [gid.gio2.permission.Permission.release].
  
      Params:
        cancellable = a #GCancellable, or null
        callback = the #GAsyncReadyCallback to call when done
  */
  void releaseAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_permission_release_async(cast(GPermission*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Collects the result of attempting to release the permission
      represented by permission.
      
      This is the second half of the asynchronous version of
      [gid.gio2.permission.Permission.release].
  
      Params:
        result = the #GAsyncResult given to the #GAsyncReadyCallback
      Returns: true if the permission was successfully released
      Throws: [ErrorWrap]
  */
  bool releaseFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_permission_release_finish(cast(GPermission*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Permission
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.permission.Permission), T.stringof ~ " is not derived from gid.gio2.permission.Permission");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcquire", true)[0]) == gid.gio2.permission.Permission))
      _installVfunc(klass, "acquire");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcquireAsync", true)[0]) == gid.gio2.permission.Permission))
      static assert(0, "Overriding gid.gio2.permission.Permission.vfuncAcquireAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAcquireFinish", true)[0]) == gid.gio2.permission.Permission))
      _installVfunc(klass, "acquire_finish");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRelease", true)[0]) == gid.gio2.permission.Permission))
      _installVfunc(klass, "release");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReleaseAsync", true)[0]) == gid.gio2.permission.Permission))
      static assert(0, "Overriding gid.gio2.permission.Permission.vfuncReleaseAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReleaseFinish", true)[0]) == gid.gio2.permission.Permission))
      _installVfunc(klass, "release_finish");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GPermissionClass*)klass;

    switch (vfunc)
    {
      case "acquire":
      {
        static extern(C) gboolean _vfuncAcquireTramp(GPermission* permission, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.permission.Permission)(cast(void*)permission);
          if (!_obj)
          {
            auto _klass = cast(GPermissionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)permission);
            if (_klass.acquire)
              return (cast(typeof(&_vfuncAcquireTramp))_klass.acquire)(permission, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAcquire(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.acquire = cast(typeof(_klass.acquire))&_vfuncAcquireTramp;
        break;
      }
      case "acquire_finish":
      {
        static extern(C) gboolean _vfuncAcquireFinishTramp(GPermission* permission, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.permission.Permission)(cast(void*)permission);
          if (!_obj)
          {
            auto _klass = cast(GPermissionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)permission);
            if (_klass.acquireFinish)
              return (cast(typeof(&_vfuncAcquireFinishTramp))_klass.acquireFinish)(permission, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncAcquireFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.acquireFinish = cast(typeof(_klass.acquireFinish))&_vfuncAcquireFinishTramp;
        break;
      }
      case "release":
      {
        static extern(C) gboolean _vfuncReleaseTramp(GPermission* permission, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.permission.Permission)(cast(void*)permission);
          if (!_obj)
          {
            auto _klass = cast(GPermissionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)permission);
            if (_klass.release)
              return (cast(typeof(&_vfuncReleaseTramp))_klass.release)(permission, cancellable, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncRelease(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.release = cast(typeof(_klass.release))&_vfuncReleaseTramp;
        break;
      }
      case "release_finish":
      {
        static extern(C) gboolean _vfuncReleaseFinishTramp(GPermission* permission, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.permission.Permission)(cast(void*)permission);
          if (!_obj)
          {
            auto _klass = cast(GPermissionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)permission);
            if (_klass.releaseFinish)
              return (cast(typeof(&_vfuncReleaseFinishTramp))_klass.releaseFinish)(permission, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncReleaseFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.releaseFinish = cast(typeof(_klass.releaseFinish))&_vfuncReleaseFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.permission.Permission]
class PermissionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.permission.Permission]
final class PermissionGidBuilder : PermissionGidBuilderImpl!PermissionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Permission build() nothrow
  {
    return new Permission(cast(void*)createGObject(Permission._getGType), Yes.Take);
  }
}
