/// Module for [LoadableIcon] interface
module gid.gio2.loadable_icon;

public import gid.core.basictypes;
public import gid.gio2.loadable_icon_iface_proxy;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.icon;
import gid.gio2.input_stream;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.loadable_icon.LoadableIcon] extends the [gid.gio2.icon.Icon] interface and adds the ability
    to load icons from streams.
*/
@gidGir("LoadableIcon", "LoadableIconIface")
interface LoadableIcon : gid.gio2.icon.Icon
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_loadable_icon_get_type != &gidSymbolNotFound ? g_loadable_icon_get_type() : cast(GType)0;
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
  gid.gio2.input_stream.InputStream load(int size, out string type, gid.gio2.cancellable.Cancellable cancellable = null);

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
  void loadAsync(int size, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes an asynchronous icon load started in [gid.gio2.loadable_icon.LoadableIcon.loadAsync].
  
      Params:
        res = a #GAsyncResult.
        type = a location to store the type of the loaded
                 icon, null to ignore.
      Returns: a #GInputStream to read the icon from.
      Throws: [ErrorWrap]
  */
  gid.gio2.input_stream.InputStream loadFinish(gid.gio2.async_result.AsyncResult res, out string type);
}

/// Fluent builder implementation template for [gid.gio2.loadable_icon.LoadableIcon]
interface LoadableIconGidBuilderImpl(T) : gid.gio2.icon.IconGidBuilderImpl!T
{
}
