/// Module for [HoverProvider] interface mixin
module gtksource.hover_provider_mixin;

public import gtksource.hover_provider_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import gobject.object;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.hover_context;
public import gtksource.hover_display;
public import gtksource.types;

/**
    Interface to populate interactive tooltips.
    
    [gtksource.hover_provider.HoverProvider] is an interface that should be implemented to extend
    the contents of a `class@HoverDisplay`. This is typical in editors that
    interact external tooling such as those utilizing Language Server Protocol.
    
    If you can populate the `class@HoverDisplay` synchronously, use
    `vfunc@HoverProvider.populate`. Otherwise, interface implementations that
    may take additional time should use `vfunc@HoverProvider.populate_async`
    to avoid blocking the main loop.
*/
template HoverProviderT()
{

  /** */
  override void populateAsync(gtksource.hover_context.HoverContext context, gtksource.hover_display.HoverDisplay display, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    gtk_source_hover_provider_populate_async(cast(GtkSourceHoverProvider*)this._cPtr, context ? cast(GtkSourceHoverContext*)context._cPtr(No.Dup) : null, display ? cast(GtkSourceHoverDisplay*)display._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /** */
  override bool populateFinish(gio.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gtk_source_hover_provider_populate_finish(cast(GtkSourceHoverProvider*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
