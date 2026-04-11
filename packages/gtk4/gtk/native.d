/// Module for [Native] interface
module gtk.native;

public import gtk.native_iface_proxy;
import gdk.surface;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gsk.renderer;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/**
    [gtk.native.Native] is the interface implemented by all widgets that have
    their own [gdk.surface.Surface].
    
    The obvious example of a [gtk.native.Native] is [gtk.window.Window].
    
    Every widget that is not itself a [gtk.native.Native] is contained in one,
    and you can get it with [gtk.widget.Widget.getNative].
    
    To get the surface of a [gtk.native.Native], use [gtk.native.Native.getSurface].
    It is also possible to find the [gtk.native.Native] to which a surface
    belongs, with [gtk.native.Native.getForSurface].
    
    In addition to a [gdk.surface.Surface], a [gtk.native.Native] also provides
    a [gsk.renderer.Renderer] for rendering on that surface. To get the
    renderer, use [gtk.native.Native.getRenderer].
*/
interface Native
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_native_get_type != &gidSymbolNotFound ? gtk_native_get_type() : cast(GType)0;
  }

  /**
      Finds the [gtk.native.Native] associated with the surface.
  
      Params:
        surface = a [gdk.surface.Surface]
      Returns: the [gtk.native.Native] that is associated with surface
  */
  static gtk.native.Native getForSurface(gdk.surface.Surface surface)
  {
    GtkNative* _cretval;
    _cretval = gtk_native_get_for_surface(surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.native.Native)(cast(GtkNative*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the renderer that is used for this [gtk.native.Native].
      Returns: the renderer for self
  */
  gsk.renderer.Renderer getRenderer();

  /**
      Returns the surface of this [gtk.native.Native].
      Returns: the surface of self
  */
  gdk.surface.Surface getSurface();

  /**
      Retrieves the surface transform of self.
      
      This is the translation from self's surface coordinates into
      self's widget coordinates.
  
      Params:
        x = return location for the x coordinate
        y = return location for the y coordinate
  */
  void getSurfaceTransform(out double x, out double y);

  /**
      Realizes a [gtk.native.Native].
      
      This should only be used by subclasses.
  */
  void realize();

  /**
      Unrealizes a [gtk.native.Native].
      
      This should only be used by subclasses.
  */
  void unrealize();
}

/// Fluent builder implementation template for [gtk.native.Native]
interface NativeGidBuilderImpl(T)
{
}
