/// Module for [GutterRendererPixbuf] class
module gid.gtksource5.gutter_renderer_pixbuf;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.paintable;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.gutter_renderer;
import gid.gtksource5.types;

/**
    Renders a pixbuf in the gutter.
    
    A [gid.gtksource5.gutter_renderer_pixbuf.GutterRendererPixbuf] can be used to render an image in a cell of
    [gid.gtksource5.gutter.Gutter].
*/
class GutterRendererPixbuf : gid.gtksource5.gutter_renderer.GutterRenderer
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceGutterRendererPixbuf";
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterRendererPixbuf self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.gutter_renderer_pixbuf.GutterRendererPixbuf]
      Returns: New builder object
  */
  static GutterRendererPixbufGidBuilder builder() nothrow
  {
    return new GutterRendererPixbufGidBuilder;
  }

  /** */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return getGicon();
  }

  /** */
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    setGicon(propval);
  }

  /** */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /** */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /** */
  @property gid.gdk4.paintable.Paintable paintable() nothrow
  {
    return getPaintable();
  }

  /** */
  @property void paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    setPaintable(propval);
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf() nothrow
  {
    return getPixbuf();
  }

  /** */
  @property void pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    setPixbuf(propval);
  }

  /**
      Create a new #GtkSourceGutterRendererPixbuf.
      Returns: A #GtkSourceGutterRenderer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkSourceGutterRenderer* _cretval;
      _cretval = gtk_source_gutter_renderer_pixbuf_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Get the gicon of the renderer
      Returns: a #GIcon
  */
  gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_gicon(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /** */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_icon_name(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a [gid.gdk4.paintable.Paintable] that was set with
      [gid.gtksource5.gutter_renderer_pixbuf.GutterRendererPixbuf.setPaintable]
      Returns: a #GdkPaintable or null
  */
  gid.gdk4.paintable.Paintable getPaintable() nothrow
  {
    GdkPaintable* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_paintable(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the pixbuf of the renderer.
      Returns: a #GdkPixbuf
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf getPixbuf() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_pixbuf(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /**
      Allows overlaying a paintable on top of any other image that
      has been set for the pixbuf. This will be applied when the
      widget is next snapshot.
  
      Params:
        paintable = a #GdkPaintable
  */
  void overlayPaintable(gid.gdk4.paintable.Paintable paintable) nothrow
  {
    gtk_source_gutter_renderer_pixbuf_overlay_paintable(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /** */
  void setGicon(gid.gio2.icon.Icon icon = null) nothrow
  {
    gtk_source_gutter_renderer_pixbuf_set_gicon(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_gutter_renderer_pixbuf_set_icon_name(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, _iconName);
  }

  /** */
  void setPaintable(gid.gdk4.paintable.Paintable paintable = null) nothrow
  {
    gtk_source_gutter_renderer_pixbuf_set_paintable(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /** */
  void setPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    gtk_source_gutter_renderer_pixbuf_set_pixbuf(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.gutter_renderer_pixbuf.GutterRendererPixbuf]
class GutterRendererPixbufGidBuilderImpl(T) : gid.gtksource5.gutter_renderer.GutterRendererGidBuilderImpl!T
{


  /** */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /** */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /** */
  T paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    return setProperty("paintable", propval);
  }

  /** */
  T pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf", propval);
  }
}

/// Fluent builder for [gid.gtksource5.gutter_renderer_pixbuf.GutterRendererPixbuf]
final class GutterRendererPixbufGidBuilder : GutterRendererPixbufGidBuilderImpl!GutterRendererPixbufGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GutterRendererPixbuf build() nothrow
  {
    return new GutterRendererPixbuf(cast(void*)createGObject(GutterRendererPixbuf._getGType), Yes.Take);
  }
}
