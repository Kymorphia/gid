/// Module for [CellRendererPixbuf] class
module gtk.cell_renderer_pixbuf;

import gdk.texture;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
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
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_cell_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_cell_renderer_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererPixbuf self()
  {
    return this;
  }

  /**
      Get `gicon` property.
      Returns: The GIcon representing the icon to display.
        If the icon theme is changed, the image will be updated
        automatically.
  */
  @property gio.icon.Icon gicon()
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
  @property void gicon(gio.icon.Icon propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.icon.Icon)("gicon", propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the themed icon to display.
        This property only has an effect if not overridden by the "pixbuf" property.
  */
  @property string iconName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon to display.
          This property only has an effect if not overridden by the "pixbuf" property.
  */
  @property void iconName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /**
      Get `iconSize` property.
      Returns: The [gtk.types.IconSize] value that specifies the size of the rendered icon.
  */
  @property gtk.types.IconSize iconSize()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.IconSize)("icon-size");
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The [gtk.types.IconSize] value that specifies the size of the rendered icon.
  */
  @property void iconSize(gtk.types.IconSize propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.IconSize)("icon-size", propval);
  }

  /** */
  @property void pixbuf(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf", propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf pixbufExpanderClosed()
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-closed");
  }

  /** */
  @property void pixbufExpanderClosed(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-closed", propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf pixbufExpanderOpen()
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-open");
  }

  /** */
  @property void pixbufExpanderOpen(gdkpixbuf.pixbuf.Pixbuf propval)
  {
    gobject.object.ObjectWrap.setProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf-expander-open", propval);
  }

  /** */
  @property gdk.texture.Texture texture()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.texture.Texture)("texture");
  }

  /** */
  @property void texture(gdk.texture.Texture propval)
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
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_pixbuf_new();
    this(_cretval, No.Take);
  }
}
