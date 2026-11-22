/// Module for [Native] interface
module gid.gtk4.native;

public import gid.core.basictypes;
public import gid.gtk4.native_iface_proxy;
import gid.core.utils;
import gid.gdk4.surface;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gsk4.renderer;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

/**
    An interface for widgets that have their own [gid.gdk4.surface.Surface].
    
    The obvious example of a [gid.gtk4.native.Native] is [gid.gtk4.window.Window].
    
    Every widget that is not itself a [gid.gtk4.native.Native] is contained in one,
    and you can get it with [gid.gtk4.widget.Widget.getNative].
    
    To get the surface of a [gid.gtk4.native.Native], use [gid.gtk4.native.Native.getSurface].
    It is also possible to find the [gid.gtk4.native.Native] to which a surface
    belongs, with [gid.gtk4.native.Native.getForSurface].
    
    In addition to a [gid.gdk4.surface.Surface], a [gid.gtk4.native.Native] also provides
    a [gid.gsk4.renderer.Renderer] for rendering on that surface. To get the
    renderer, use [gid.gtk4.native.Native.getRenderer].
*/
interface Native : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_native_get_type != &gidSymbolNotFound ? gtk_native_get_type() : cast(GType)0;
  }

  /**
      Finds the [gid.gtk4.native.Native] associated with the surface.
  
      Params:
        surface = a [gid.gdk4.surface.Surface]
      Returns: the [gid.gtk4.native.Native] that is associated with surface
  */
  static gid.gtk4.native.Native getForSurface(gid.gdk4.surface.Surface surface) nothrow
  {
    GtkNative* _cretval;
    _cretval = gtk_native_get_for_surface(surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.native.Native)(cast(GtkNative*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the renderer that is used for this [gid.gtk4.native.Native].
      Returns: the renderer for self
  */
  gid.gsk4.renderer.Renderer getRenderer();

  /**
      Returns the surface of this [gid.gtk4.native.Native].
      Returns: the surface of self
  */
  gid.gdk4.surface.Surface getSurface();

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
      Realizes a [gid.gtk4.native.Native].
      
      This should only be used by subclasses.
  */
  void realize();

  /**
      Unrealizes a [gid.gtk4.native.Native].
      
      This should only be used by subclasses.
  */
  void unrealize();
}

/// Fluent builder implementation template for [gid.gtk4.native.Native]
interface NativeGidBuilderImpl(T)
{
}
