/// Module for [Native] interface mixin
module gtk.native_mixin;

public import gtk.native_iface_proxy;
public import gdk.surface;
public import gid.gid;
public import gobject.gid_builder;
public import gobject.object;
public import gsk.renderer;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

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
template NativeT()
{


  /**
      Returns the renderer that is used for this [gtk.native.Native].
      Returns: the renderer for self
  */
  override gsk.renderer.Renderer getRenderer()
  {
    GskRenderer* _cretval;
    _cretval = gtk_native_get_renderer(cast(GtkNative*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gsk.renderer.Renderer)(cast(GskRenderer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the surface of this [gtk.native.Native].
      Returns: the surface of self
  */
  override gdk.surface.Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gtk_native_get_surface(cast(GtkNative*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.surface.Surface)(cast(GdkSurface*)_cretval, No.Take);
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
  override void getSurfaceTransform(out double x, out double y)
  {
    gtk_native_get_surface_transform(cast(GtkNative*)this._cPtr, cast(double*)&x, cast(double*)&y);
  }

  /**
      Realizes a [gtk.native.Native].
      
      This should only be used by subclasses.
  */
  override void realize()
  {
    gtk_native_realize(cast(GtkNative*)this._cPtr);
  }

  /**
      Unrealizes a [gtk.native.Native].
      
      This should only be used by subclasses.
  */
  override void unrealize()
  {
    gtk_native_unrealize(cast(GtkNative*)this._cPtr);
  }
}

template NativeGidBuilderT()
{
}
