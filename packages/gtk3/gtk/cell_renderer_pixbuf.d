/// Module for [CellRendererPixbuf] class
module gtk.cell_renderer_pixbuf;

import cairo.surface;
import gdkpixbuf.pixbuf;
import gid.gid;
import gio.icon;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.types;

/**
    A #GtkCellRendererPixbuf can be used to render an image in a cell. It allows
    to render either a given #GdkPixbuf (set via the
    #GtkCellRendererPixbuf:pixbuf property) or a named icon (set via the
    #GtkCellRendererPixbuf:icon-name property).
    
    To support the tree view, #GtkCellRendererPixbuf also supports rendering two
    alternative pixbufs, when the #GtkCellRenderer:is-expander property is true.
    If the #GtkCellRenderer:is-expanded property is true and the
    #GtkCellRendererPixbuf:pixbuf-expander-open property is set to a pixbuf, it
    renders that pixbuf, if the #GtkCellRenderer:is-expanded property is false
    and the #GtkCellRendererPixbuf:pixbuf-expander-closed property is set to a
    pixbuf, it renders that one.
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
      Get `followState` property.
      Returns: Specifies whether the rendered pixbuf should be colorized
        according to the #GtkCellRendererState.
  
      Deprecated: Cell renderers always follow state.
  */
  @property bool followState()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("follow-state");
  }

  /**
      Set `followState` property.
      Params:
        propval = Specifies whether the rendered pixbuf should be colorized
          according to the #GtkCellRendererState.
  
      Deprecated: Cell renderers always follow state.
  */
  @property void followState(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("follow-state", propval);
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
        This property only has an effect if not overridden by "stock_id"
        or "pixbuf" properties.
  */
  @property string iconName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon to display.
          This property only has an effect if not overridden by "stock_id"
          or "pixbuf" properties.
  */
  @property void iconName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /** */
  @property gdkpixbuf.pixbuf.Pixbuf pixbuf()
  {
    return gobject.object.ObjectWrap.getProperty!(gdkpixbuf.pixbuf.Pixbuf)("pixbuf");
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
  @property string stockDetail()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("stock-detail");
  }

  /** */
  @property void stockDetail(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("stock-detail", propval);
  }

  /** */
  @property string stockId()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("stock-id");
  }

  /** */
  @property void stockId(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("stock-id", propval);
  }

  /**
      Get `stockSize` property.
      Returns: The #GtkIconSize value that specifies the size of the rendered icon.
  */
  @property uint stockSize()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("stock-size");
  }

  /**
      Set `stockSize` property.
      Params:
        propval = The #GtkIconSize value that specifies the size of the rendered icon.
  */
  @property void stockSize(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("stock-size", propval);
  }

  /** */
  @property cairo.surface.Surface surface()
  {
    return gobject.object.ObjectWrap.getProperty!(cairo.surface.Surface)("surface");
  }

  /** */
  @property void surface(cairo.surface.Surface propval)
  {
    gobject.object.ObjectWrap.setProperty!(cairo.surface.Surface)("surface", propval);
  }

  /**
      Creates a new #GtkCellRendererPixbuf. Adjust rendering
      parameters using object properties. Object properties can be set
      globally (with [gobject.object.ObjectWrap.set]). Also, with #GtkTreeViewColumn, you
      can bind a property to a value in a #GtkTreeModel. For example, you
      can bind the “pixbuf” property on the cell renderer to a pixbuf value
      in the model, thus rendering a different image in each row of the
      #GtkTreeView.
      Returns: the new cell renderer
  */
  this()
  {
    GtkCellRenderer* _cretval;
    _cretval = gtk_cell_renderer_pixbuf_new();
    this(_cretval, No.Take);
  }
}
