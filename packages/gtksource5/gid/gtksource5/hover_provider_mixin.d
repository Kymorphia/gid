/// Module for [HoverProvider] interface mixin
module gid.gtksource5.hover_provider_mixin;

public import gid.core.basictypes;
public import gid.gtksource5.hover_provider_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtksource5.c.functions;
public import gid.gtksource5.c.types;
public import gid.gtksource5.hover_context;
public import gid.gtksource5.hover_display;
public import gid.gtksource5.types;

/**
    Interface to populate interactive tooltips.
    
    [gid.gtksource5.hover_provider.HoverProvider] is an interface that should be implemented to extend
    the contents of a [gid.gtksource5.hover_display.HoverDisplay]. This is typical in editors that
    interact external tooling such as those utilizing Language Server Protocol.
    
    If you can populate the [gid.gtksource5.hover_display.HoverDisplay] synchronously, use
    `vfunc@HoverProvider.populate`. Otherwise, interface implementations that
    may take additional time should use `vfunc@HoverProvider.populate_async`
    to avoid blocking the main loop.
*/
template HoverProviderT()
{

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncPopulate(gid.gtksource5.hover_context.HoverContext context, gid.gtksource5.hover_display.HoverDisplay display)
  {
    auto _klass = cast(GtkSourceHoverProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.hover_provider.HoverProvider._getGType);
    if (!_klass || !_klass.populate)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.populate(cast(GtkSourceHoverProvider*)this._cPtr, context ? cast(GtkSourceHoverContext*)context._cPtr(No.Dup) : null, display ? cast(GtkSourceHoverDisplay*)display._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncPopulateAsync(gid.gtksource5.hover_context.HoverContext context, gid.gtksource5.hover_display.HoverDisplay display, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GtkSourceHoverProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.hover_provider.HoverProvider._getGType);
    if (!_klass || !_klass.populateAsync)
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
    _klass.populateAsync(cast(GtkSourceHoverProvider*)this._cPtr, context ? cast(GtkSourceHoverContext*)context._cPtr(No.Dup) : null, display ? cast(GtkSourceHoverDisplay*)display._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncPopulateFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GtkSourceHoverProviderInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtksource5.hover_provider.HoverProvider._getGType);
    if (!_klass || !_klass.populateFinish)
      return typeof(return).init;

    bool _retval;
    GError *_err;
    _retval = cast(bool)_klass.populateFinish(cast(GtkSourceHoverProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /** */
  override void populateAsync(gid.gtksource5.hover_context.HoverContext context, gid.gtksource5.hover_display.HoverDisplay display, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    gtk_source_hover_provider_populate_async(cast(GtkSourceHoverProvider*)this._cPtr, context ? cast(GtkSourceHoverContext*)context._cPtr(No.Dup) : null, display ? cast(GtkSourceHoverDisplay*)display._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  override bool populateFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_hover_provider_populate_finish(cast(GtkSourceHoverProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gtksource5.hover_provider.HoverProvider (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtksource5_hover_provider_HoverProvider(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtksource5.hover_provider.HoverProvider vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtksource5_hover_provider_HoverProvider(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_hover_provider_HoverProvider(iface, "populate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtksource5.hover_provider.HoverProvider.vfuncPopulateAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncPopulateFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtksource5_hover_provider_HoverProvider(iface, "populate_finish");
  }

  private static void _installIfaceVfunc_gid_gtksource5_hover_provider_HoverProvider(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkSourceHoverProviderInterface*)iface;

    switch (vfunc)
    {
      case "populate":
      {
        static extern(C) gboolean _vfuncPopulateTramp(GtkSourceHoverProvider* self, GtkSourceHoverContext* context, GtkSourceHoverDisplay* display, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceHoverProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.hover_provider.HoverProvider._getGType);
            if (_klass && _klass.populate)
              return (cast(typeof(&_vfuncPopulateTramp))_klass.populate)(self, context, display, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPopulate(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.hover_context.HoverContext)(cast(void*)context, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.hover_display.HoverDisplay)(cast(void*)display, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.populate = cast(typeof(_klass.populate))&_vfuncPopulateTramp;
        break;
      }
      case "populate_finish":
      {
        static extern(C) gboolean _vfuncPopulateFinishTramp(GtkSourceHoverProvider* self, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkSourceHoverProviderInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtksource5.hover_provider.HoverProvider._getGType);
            if (_klass && _klass.populateFinish)
              return (cast(typeof(&_vfuncPopulateFinishTramp))_klass.populateFinish)(self, result, _err);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncPopulateFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.populateFinish = cast(typeof(_klass.populateFinish))&_vfuncPopulateFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtksource5.hover_provider.HoverProvider]
template HoverProviderGidBuilderT()
{
}
