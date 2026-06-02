/// Module for [CellRendererPixbuf] class
module gtk.cell_renderer_pixbuf;

public import gid.basictypes;
import gdk.texture;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
    Renders a pixbuf in a cell
    
    A [gtk.cell_renderer_pixbuf.CellRendererPixbuf] can be used to render an image in a cell. It allows
    to render either a given [gdkpixbuf.pixbuf.Pixbuf] (set via the
    `GtkCellRendererPixbuf:pixbuf` property) or a named icon (set via the
    `GtkCellRendererPixbuf:icon-name` property).
    
    To support the tree view, [gtk.cell_renderer_pixbuf.CellRendererPixbuf] also supports rendering two
    alternative pixbufs, when the `GtkCellRenderer:is-expander` property is true.
    If the `GtkCellRenderer:is-expanded property` is true and the
    `GtkCellRendererPixbuf:pixbuf-expander-open` property is set to a pixbuf, it
    renders that pixbuf, if the `GtkCellRenderer:is-expanded` property is false
    and the `GtkCellRendererPixbuf:pixbuf-expander-closed` property is set to a
    pixbuf, it renders that one.

    Deprecated: List views use widgets to display their contents. You
        should use [gtk.image.Image] for icons, and [gtk.picture.Picture] for images
*/
class CellRendererPixbuf : gtk.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_cell_renderer_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererPixbuf self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.cell_renderer_pixbuf.CellRendererPixbuf]
      Returns: New builder object
  */
  static CellRendererPixbufGidBuilder builder() nothrow
  {
    return new CellRendererPixbufGidBuilder;
  }

  /**
      Get `gicon` property.
      Returns: The GIcon representing the icon to display.
        If the icon theme is changed, the image will be updated
        automatically.
  */
  @property gio.icon.Icon gicon() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gio.icon.Icon)("gicon");
  }

  /**
      Set `gicon` property.
      Params:
        propval = The GIcon representing the icon to display.
          If the icon theme is changed, the image will be updated
          automatically.
  */
  @property void gicon(gio.icon.Icon propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("gicon", propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the themed icon to display.
        This property only has an effect if not overridden by the "pixbuf" property.
  */
  @property string iconName() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon to display.
          This property only has an effect if not overridden by the "pixbuf" property.
  */
  @property void iconName(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /**
      Get `iconSize` property.
      Returns: The [gtk.types.IconSize] value that specifies the size of the rendered icon.
  */
  @property gtk.types.IconSize iconSize() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.IconSize)("icon-size");
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The [gtk.types.IconSize] value that specifies the size of the rendered icon.
  */
  @property void iconSize(gtk.types.IconSize propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.IconSize)("icon-size", propval);
  }

  /** */
  @property void pixbuf(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf", propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf pixbufExpanderClosed() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-closed");
  }

  /** */
  @property void pixbufExpanderClosed(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-closed", propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf pixbufExpanderOpen() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-open");
  }

  /** */
  @property void pixbufExpanderOpen(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-open", propval);
  }

  /** */
  @property gdk.texture.Texture texture() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.texture.Texture)("texture");
  }

  /** */
  @property void texture(gdk.texture.Texture propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gdk.texture.Texture)("texture", propval);
  }

  /**
      Creates a new [gtk.cell_renderer_pixbuf.CellRendererPixbuf]. Adjust rendering
      parameters using object properties. Object properties can be set
      globally (with [gobject.object.ObjectWrap.set]). Also, with [gtk.tree_view_column.TreeViewColumn], you
      can bind a property to a value in a [gtk.tree_model.TreeModel]. For example, you
      can bind the “pixbuf” property on the cell renderer to a pixbuf value
      in the model, thus rendering a different image in each row of the
      [gtk.tree_view.TreeView].
      Returns: the new cell renderer
  */
  this() nothrow
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_pixbuf_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.cell_renderer_pixbuf.CellRendererPixbuf]
class CellRendererPixbufGidBuilderImpl(T) : gtk.cell_renderer.CellRendererGidBuilderImpl!T
{

  /**
      Set `gicon` property.
      Params:
        propval = The GIcon representing the icon to display.
          If the icon theme is changed, the image will be updated
          automatically.
      Returns: Builder instance for fluent chaining
  */
  T gicon(gio.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon to display.
          This property only has an effect if not overridden by the "pixbuf" property.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The [gtk.types.IconSize] value that specifies the size of the rendered icon.
      Returns: Builder instance for fluent chaining
  */
  T iconSize(gtk.types.IconSize propval) nothrow
  {
    return setProperty("icon-size", propval);
  }

  /** */
  T pixbuf(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf", propval);
  }

  /** */
  T pixbufExpanderClosed(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf-expander-closed", propval);
  }

  /** */
  T pixbufExpanderOpen(gdkpixbuf.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf-expander-open", propval);
  }

  /** */
  T texture(gdk.texture.Texture propval) nothrow
  {
    return setProperty("texture", propval);
  }
}

/// Fluent builder for [gtk.cell_renderer_pixbuf.CellRendererPixbuf]
final class CellRendererPixbufGidBuilder : CellRendererPixbufGidBuilderImpl!CellRendererPixbufGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererPixbuf build() nothrow
  {
    return new CellRendererPixbuf(cast(void*)createGObject(CellRendererPixbuf._getGType), No.Take);
  }
}
