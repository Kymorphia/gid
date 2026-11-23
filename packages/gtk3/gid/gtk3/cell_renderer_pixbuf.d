/// Module for [CellRendererPixbuf] class
module gid.gtk3.cell_renderer_pixbuf;

public import gid.core.basictypes;
import gid.cairo1.surface;
import gid.core.utils;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_renderer;
import gid.gtk3.types;

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
class CellRendererPixbuf : gid.gtk3.cell_renderer.CellRenderer
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
    return cast(void function())gtk_cell_renderer_pixbuf_get_type != &gidSymbolNotFound ? gtk_cell_renderer_pixbuf_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellRendererPixbuf";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellRendererPixbuf self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_renderer_pixbuf.CellRendererPixbuf]
      Returns: New builder object
  */
  static CellRendererPixbufGidBuilder builder() nothrow
  {
    return new CellRendererPixbufGidBuilder;
  }

  /**
      Get `followState` property.
      Returns: Specifies whether the rendered pixbuf should be colorized
        according to the #GtkCellRendererState.
  
      Deprecated: Cell renderers always follow state.
  */
  @property bool followState() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("follow-state");
  }

  /**
      Set `followState` property.
      Params:
        propval = Specifies whether the rendered pixbuf should be colorized
          according to the #GtkCellRendererState.
  
      Deprecated: Cell renderers always follow state.
  */
  @property void followState(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("follow-state", propval);
  }

  /**
      Get `gicon` property.
      Returns: The GIcon representing the icon to display.
        If the icon theme is changed, the image will be updated
        automatically.
  */
  @property gid.gio2.icon.Icon gicon() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.icon.Icon)("gicon");
  }

  /**
      Set `gicon` property.
      Params:
        propval = The GIcon representing the icon to display.
          If the icon theme is changed, the image will be updated
          automatically.
  */
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.icon.Icon)("gicon", propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the themed icon to display.
        This property only has an effect if not overridden by "stock_id"
        or "pixbuf" properties.
  */
  @property string iconName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon to display.
          This property only has an effect if not overridden by "stock_id"
          or "pixbuf" properties.
  */
  @property void iconName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf");
  }

  /** */
  @property void pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf", propval);
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf pixbufExpanderClosed() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf-expander-closed");
  }

  /** */
  @property void pixbufExpanderClosed(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf-expander-closed", propval);
  }

  /** */
  @property gid.gdkpixbuf2.pixbuf.Pixbuf pixbufExpanderOpen() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf-expander-open");
  }

  /** */
  @property void pixbufExpanderOpen(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdkpixbuf2.pixbuf.Pixbuf)("pixbuf-expander-open", propval);
  }

  /** */
  @property string stockDetail() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("stock-detail");
  }

  /** */
  @property void stockDetail(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("stock-detail", propval);
  }

  /** */
  @property string stockId() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("stock-id");
  }

  /** */
  @property void stockId(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("stock-id", propval);
  }

  /**
      Get `stockSize` property.
      Returns: The #GtkIconSize value that specifies the size of the rendered icon.
  */
  @property uint stockSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("stock-size");
  }

  /**
      Set `stockSize` property.
      Params:
        propval = The #GtkIconSize value that specifies the size of the rendered icon.
  */
  @property void stockSize(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("stock-size", propval);
  }

  /** */
  @property gid.cairo1.surface.Surface surface() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.cairo1.surface.Surface)("surface");
  }

  /** */
  @property void surface(gid.cairo1.surface.Surface propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.cairo1.surface.Surface)("surface", propval);
  }

  /**
      Creates a new #GtkCellRendererPixbuf. Adjust rendering
      parameters using object properties. Object properties can be set
      globally (with [gid.gobject2.object.ObjectWrap.set]). Also, with #GtkTreeViewColumn, you
      can bind a property to a value in a #GtkTreeModel. For example, you
      can bind the “pixbuf” property on the cell renderer to a pixbuf value
      in the model, thus rendering a different image in each row of the
      #GtkTreeView.
      Returns: the new cell renderer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkCellRenderer* _cretval;
      _cretval = gtk_cell_renderer_pixbuf_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_renderer_pixbuf.CellRendererPixbuf]
class CellRendererPixbufGidBuilderImpl(T) : gid.gtk3.cell_renderer.CellRendererGidBuilderImpl!T
{

  /**
      Set `followState` property.
      Params:
        propval = Specifies whether the rendered pixbuf should be colorized
          according to the #GtkCellRendererState.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Cell renderers always follow state.
  */
  T followState(bool propval) nothrow
  {
    return setProperty("follow-state", propval);
  }

  /**
      Set `gicon` property.
      Params:
        propval = The GIcon representing the icon to display.
          If the icon theme is changed, the image will be updated
          automatically.
      Returns: Builder instance for fluent chaining
  */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon to display.
          This property only has an effect if not overridden by "stock_id"
          or "pixbuf" properties.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /** */
  T pixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf", propval);
  }

  /** */
  T pixbufExpanderClosed(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf-expander-closed", propval);
  }

  /** */
  T pixbufExpanderOpen(gid.gdkpixbuf2.pixbuf.Pixbuf propval) nothrow
  {
    return setProperty("pixbuf-expander-open", propval);
  }

  /** */
  T stockDetail(string propval) nothrow
  {
    return setProperty("stock-detail", propval);
  }

  /** */
  T stockId(string propval) nothrow
  {
    return setProperty("stock-id", propval);
  }

  /**
      Set `stockSize` property.
      Params:
        propval = The #GtkIconSize value that specifies the size of the rendered icon.
      Returns: Builder instance for fluent chaining
  */
  T stockSize(uint propval) nothrow
  {
    return setProperty("stock-size", propval);
  }

  /** */
  T surface(gid.cairo1.surface.Surface propval) nothrow
  {
    return setProperty("surface", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_renderer_pixbuf.CellRendererPixbuf]
final class CellRendererPixbufGidBuilder : CellRendererPixbufGidBuilderImpl!CellRendererPixbufGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellRendererPixbuf build() nothrow
  {
    return new CellRendererPixbuf(cast(void*)createGObject(CellRendererPixbuf._getGType), Yes.Take);
  }
}
