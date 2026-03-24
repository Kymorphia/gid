/// Module for [LoadableIcon] interface
module gio.loadable_icon;

public import gio.loadable_icon_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.input_stream;
import gio.types;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.loadable_icon.LoadableIcon] extends the [gio.icon.Icon] interface and adds the ability
    to load icons from streams.
*/
interface LoadableIcon
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_loadable_icon_get_type != &gidSymbolNotFound ? g_loadable_icon_get_type() : cast(GType)0;
  }

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
  gio.input_stream.InputStream load(int size, out string type, gio.cancellable.Cancellable cancellable = null);

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
  void loadAsync(int size, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes an asynchronous icon load started in [gio.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        res = a #GAsyncResult.
        type = a location to store the type of the loaded
                 icon, null to ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  */
  gio.input_stream.InputStream loadFinish(gio.async_result.AsyncResult res, out string type);
}

interface LoadableIconGidBuilderImpl(T)
{
}
