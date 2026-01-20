/// Module for [LoadableIcon] interface mixin
module gio.loadable_icon_mixin;

public import gio.loadable_icon_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.input_stream;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.loadable_icon.LoadableIcon] extends the [gio.icon.Icon] interface and adds the ability
    to load icons from streams.
*/
template LoadableIconT()
{

  /**
      Loads a loadable icon. For the asynchronous version of this function,
      see [gio.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        size = an integer.
        type = a location to store the type of the loaded
          icon, null to ignore.
        cancellable = optional #GCancellable object, null to
          ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  */
  override gio.input_stream.InputStream load(int size, out string type, gio.cancellable.Cancellable cancellable = null)
  {
    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = g_loadable_icon_load(cast(GLoadableIcon*)this._cPtr, size, &_type, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Loads an icon asynchronously. To finish this function, see
      [gio.loadable_icon.LoadableIcon.loadFinish]. For the synchronous, blocking
      version of this function, see [gio.loadable_icon.LoadableIcon.load].
  
      Params:
        size = an integer.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback
            to call when the request is satisfied
  */
  override void loadAsync(int size, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_loadable_icon_load_async(cast(GLoadableIcon*)this._cPtr, size, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Finishes an asynchronous icon load started in [gio.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        res = a #GAsyncResult.
        type = a location to store the type of the loaded
                 icon, null to ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  */
  override gio.input_stream.InputStream loadFinish(gio.async_result.AsyncResult res, out string type)
  {
    GInputStream* _cretval;
    char* _type;
    GError *_err;
    _cretval = g_loadable_icon_load_finish(cast(GLoadableIcon*)this._cPtr, res ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)res)._cPtr(No.Dup) : null, &_type, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    type = _type.fromCString(Yes.Free);
    return _retval;
  }
}
