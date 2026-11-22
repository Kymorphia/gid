/// Module for [Native] interface mixin
module gid.gtk4.native_mixin;

public import gid.core.basictypes;
public import gid.gtk4.native_iface_proxy;
public import gid.core.utils;
public import gid.gdk4.surface;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gsk4.renderer;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.types;

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
template NativeT()
{


  /**
      Returns the renderer that is used for this [gid.gtk4.native.Native].
      Returns: the renderer for self
  */
  override gid.gsk4.renderer.Renderer getRenderer() nothrow
  {
    GskRenderer* _cretval;
    _cretval = gtk_native_get_renderer(cast(GtkNative*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gsk4.renderer.Renderer)(cast(GskRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the surface of this [gid.gtk4.native.Native].
      Returns: the surface of self
  */
  override gid.gdk4.surface.Surface getSurface() nothrow
  {
    GdkSurface* _cretval;
    _cretval = gtk_native_get_surface(cast(GtkNative*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the surface transform of self.
      
      This is the translation from self's surface coordinates into
      self's widget coordinates.
  
      Params:
        x = return location for the x coordinate
        y = return location for the y coordinate
  */
  override void getSurfaceTransform(out double x, out double y) nothrow
  {
    gtk_native_get_surface_transform(cast(GtkNative*)this._cPtr, cast(double*)&x, cast(double*)&y);
  }

  /**
      Realizes a [gid.gtk4.native.Native].
      
      This should only be used by subclasses.
  */
  override void realize() nothrow
  {
    gtk_native_realize(cast(GtkNative*)this._cPtr);
  }

  /**
      Unrealizes a [gid.gtk4.native.Native].
      
      This should only be used by subclasses.
  */
  override void unrealize() nothrow
  {
    gtk_native_unrealize(cast(GtkNative*)this._cPtr);
  }
}

/// Fluent builder implementation template for [gid.gtk4.native.Native]
template NativeGidBuilderT()
{
}
