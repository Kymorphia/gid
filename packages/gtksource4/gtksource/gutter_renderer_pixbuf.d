/// Module for [GutterRendererPixbuf] class
module gtksource.gutter_renderer_pixbuf;

public import gid.basictypes;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.gutter_renderer;
import gtksource.types;

/** */
class GutterRendererPixbuf : gtksource.gutter_renderer.GutterRenderer
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_gutter_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_source_gutter_renderer_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GutterRendererPixbuf self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtksource.gutter_renderer_pixbuf.GutterRendererPixbuf]
      Returns: New builder object
  */
  static GutterRendererPixbufGidBuilder builder() nothrow
  {
    return new GutterRendererPixbufGidBuilder;
  }

  /** */
  @property gio.icon.Icon gicon() nothrow
  {
    return getGicon();
  }

  /** */
  @property void gicon(gio.icon.Icon propval) nothrow
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
  @property gdkpixbuf.pixbuf.Pixbuf pixbuf() nothrow
  {
    return getPixbuf();
  }

  /** */
  @property void pixbuf(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    setPixbuf(propval);
  }

  /**
      Create a new #GtkSourceGutterRendererPixbuf.
      Returns: A #GtkSourceGutterRenderer
  */
  this() nothrow
  {
    GtkSourceGutterRenderer* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the gicon of the renderer
      Returns: a #GIcon
  */
  gio.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_gicon(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /** */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_icon_name(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the pixbuf of the renderer.
      Returns: a #GdkPixbuf
  */
  gdkpixbuf.pixbuf.Pixbuf getPixbuf() nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = gtk_source_gutter_renderer_pixbuf_get_pixbuf(cast(GtkSourceGutterRendererPixbuf*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdkpixbuf.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void setGicon(gio.icon.Icon icon = null) nothrow
  {
    gtk_source_gutter_renderer_pixbuf_set_gicon(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_gutter_renderer_pixbuf_set_icon_name(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, _iconName);
  }

  /** */
  void setPixbuf(gdkpixbuf.pixbuf.Pixbuf pixbuf = null) nothrow
  {
    gtk_source_gutter_renderer_pixbuf_set_pixbuf(cast(GtkSourceGutterRendererPixbuf*)this._cPtr, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtksource.gutter_renderer_pixbuf.GutterRendererPixbuf]
class GutterRendererPixbufGidBuilderImpl(T) : gtksource.gutter_renderer.GutterRendererGidBuilderImpl!T
{

  /** */
  T gicon(gio.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /** */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /** */
  T pixbuf(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf", propval);
  }
}

/// Fluent builder for [gtksource.gutter_renderer_pixbuf.GutterRendererPixbuf]
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
