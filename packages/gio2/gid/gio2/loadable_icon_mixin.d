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
}

/// Fluent builder implementation template for [gid.gio2.loadable_icon.LoadableIcon]
template LoadableIconGidBuilderT()
{
}
