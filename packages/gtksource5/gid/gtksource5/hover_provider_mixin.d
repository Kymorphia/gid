/// Module for [HoverProvider] interface mixin
module gid.gtksource5.hover_provider_mixin;

public import gid.core.basictypes;
public import gid.gtksource5.hover_provider_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
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
  override void populateAsync(gid.gtksource5.hover_context.HoverContext context, gid.gtksource5.hover_display.HoverDisplay display, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
}

/// Fluent builder implementation template for [gid.gtksource5.hover_provider.HoverProvider]
template HoverProviderGidBuilderT()
{
}
