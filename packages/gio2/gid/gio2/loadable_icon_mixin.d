/// Module for [LoadableIcon] interface mixin
module gid.gio2.loadable_icon_mixin;

public import gid.core.basictypes;
public import gid.gio2.loadable_icon_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.input_stream;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.loadable_icon.LoadableIcon] extends the [gid.gio2.icon.Icon] interface and adds the ability
    to load icons from streams.
*/
template LoadableIconT()
{

  /**
      Loads a loadable icon. For the asynchronous version of this function,
      see [gid.gio2.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        size = an integer.
        type = a location to store the type of the loaded
          icon, null to ignore.
        cancellable = optional #GCancellable object, null to
          ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLoad`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.input_stream.InputStream vfuncLoad(int size, out string type, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GLoadableIconIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.loadable_icon.LoadableIcon._getGType);
    if (!_klass || !_klass.load)
      return typeof(return).init;

    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = _klass.load(cast(GLoadableIcon*)this._cPtr, size, &_type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Loads an icon asynchronously. To finish this function, see
      [gid.gio2.loadable_icon.LoadableIcon.loadFinish]. For the synchronous, blocking
      version of this function, see [gid.gio2.loadable_icon.LoadableIcon.load].
  
      Params:
        size = an integer.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLoadAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncLoadAsync(int size, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GLoadableIconIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.loadable_icon.LoadableIcon._getGType);
    if (!_klass || !_klass.loadAsync)
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
    _klass.loadAsync(cast(GLoadableIcon*)this._cPtr, size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous icon load started in [gid.gio2.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        res = a #GAsyncResult.
        type = a location to store the type of the loaded
                 icon, null to ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLoadFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.input_stream.InputStream vfuncLoadFinish(gid.gio2.async_result.AsyncResult res, out string type)
  {
    auto _klass = cast(GLoadableIconIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.loadable_icon.LoadableIcon._getGType);
    if (!_klass || !_klass.loadFinish)
      return typeof(return).init;

    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = _klass.loadFinish(cast(GLoadableIcon*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_type, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Loads a loadable icon. For the asynchronous version of this function,
      see [gid.gio2.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        size = an integer.
        type = a location to store the type of the loaded
          icon, null to ignore.
        cancellable = optional #GCancellable object, null to
          ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  */
  override gid.gio2.input_stream.InputStream load(int size, out string type, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = g_loadable_icon_load(cast(GLoadableIcon*)this._cPtr, size, &_type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Loads an icon asynchronously. To finish this function, see
      [gid.gio2.loadable_icon.LoadableIcon.loadFinish]. For the synchronous, blocking
      version of this function, see [gid.gio2.loadable_icon.LoadableIcon.load].
  
      Params:
        size = an integer.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void loadAsync(int size, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_loadable_icon_load_async(cast(GLoadableIcon*)this._cPtr, size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous icon load started in [gid.gio2.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        res = a #GAsyncResult.
        type = a location to store the type of the loaded
                 icon, null to ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  */
  override gid.gio2.input_stream.InputStream loadFinish(gid.gio2.async_result.AsyncResult res, out string type)
  {
    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = g_loadable_icon_load_finish(cast(GLoadableIcon*)this._cPtr, res ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_type, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString!(Yes.Free);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.loadable_icon.LoadableIcon (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_loadable_icon_LoadableIcon(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoad", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoadAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoadFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.loadable_icon.LoadableIcon vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_loadable_icon_LoadableIcon(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoad", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_loadable_icon_LoadableIcon(iface, "load");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoadAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.loadable_icon.LoadableIcon.vfuncLoadAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLoadFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_loadable_icon_LoadableIcon(iface, "load_finish");
  }

  private static void _installIfaceVfunc_gid_gio2_loadable_icon_LoadableIcon(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GLoadableIconIface*)iface;

    switch (vfunc)
    {
      case "load":
      {
        static extern(C) GInputStream* _vfuncLoadTramp(GLoadableIcon* icon, int size, char** type, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)icon);
          if (!_obj)
          {
            auto _klass = cast(GLoadableIconIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)icon), gid.gio2.loadable_icon.LoadableIcon._getGType);
            if (_klass && _klass.load)
              return (cast(typeof(&_vfuncLoadTramp))_klass.load)(icon, size, type, cancellable, _err);
            return typeof(return).init;
          }

          typeof(*type) _typeNull;
          if (!type)
            type = &_typeNull;

          gid.gio2.input_stream.InputStream _dretval;
          string _type;

          try
          {
            _dretval = _obj.vfuncLoad(size, _type, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GInputStream*)_dretval._cPtr(Yes.Dup) : null;
          *type = _type.toCString!(Yes.Malloc, No.Nullable);

          return _retval;
        }

        _klass.load = cast(typeof(_klass.load))&_vfuncLoadTramp;
        break;
      }
      case "load_finish":
      {
        static extern(C) GInputStream* _vfuncLoadFinishTramp(GLoadableIcon* icon, GAsyncResult* res, char** type, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)icon);
          if (!_obj)
          {
            auto _klass = cast(GLoadableIconIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)icon), gid.gio2.loadable_icon.LoadableIcon._getGType);
            if (_klass && _klass.loadFinish)
              return (cast(typeof(&_vfuncLoadFinishTramp))_klass.loadFinish)(icon, res, type, _err);
            return typeof(return).init;
          }

          typeof(*type) _typeNull;
          if (!type)
            type = &_typeNull;

          gid.gio2.input_stream.InputStream _dretval;
          string _type;

          try
          {
            _dretval = _obj.vfuncLoadFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take), _type);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GInputStream*)_dretval._cPtr(Yes.Dup) : null;
          *type = _type.toCString!(Yes.Malloc, No.Nullable);

          return _retval;
        }

        _klass.loadFinish = cast(typeof(_klass.loadFinish))&_vfuncLoadFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.loadable_icon.LoadableIcon]
template LoadableIconGidBuilderT()
{
}
