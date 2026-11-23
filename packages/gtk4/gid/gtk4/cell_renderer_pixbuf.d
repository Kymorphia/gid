/// Module for [CellRendererPixbuf] class
module gid.gtk4.cell_renderer_pixbuf;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.texture;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_renderer;
import gid.gtk4.types;

/**
    Renders a pixbuf in a cell
    
    A [gid.gtk4.cell_renderer_pixbuf.CellRendererPixbuf] can be used to render an image in a cell. It allows
    to render either a given [gid.gdkpixbuf2.pixbuf.Pixbuf] (set via the
    `GtkCellRendererPixbuf:pixbuf` property) or a named icon (set via the
    `GtkCellRendererPixbuf:icon-name` property).
    
    To support the tree view, [gid.gtk4.cell_renderer_pixbuf.CellRendererPixbuf] also supports rendering two
    alternative pixbufs, when the `GtkCellRenderer:is-expander` property is true.
    If the `GtkCellRenderer:is-expanded property` is true and the
    `GtkCellRendererPixbuf:pixbuf-expander-open` property is set to a pixbuf, it
    renders that pixbuf, if the `GtkCellRenderer:is-expanded` property is false
    and the `GtkCellRendererPixbuf:pixbuf-expander-closed` property is set to a
    pixbuf, it renders that one.

    Deprecated: List views use widgets to display their contents. You
        should use [gid.gtk4.image.Image] for icons, and [gid.gtk4.picture.Picture] for images
*/
class CellRendererPixbuf : gid.gtk4.cell_renderer.CellRenderer
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
      Get builder for [gid.gtk4.cell_renderer_pixbuf.CellRendererPixbuf]
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
        This property only has an effect if not overridden by the "pixbuf" property.
  */
  @property string iconName() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("icon-name");
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon to display.
          This property only has an effect if not overridden by the "pixbuf" property.
  */
  @property void iconName(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("icon-name", propval);
  }

  /**
      Get `iconSize` property.
      Returns: The [gid.gtk4.types.IconSize] value that specifies the size of the rendered icon.
  */
  @property gid.gtk4.types.IconSize iconSize() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.types.IconSize)("icon-size");
  }

  /**
      Set `iconSize` property.
      Params:
        propval = The [gid.gtk4.types.IconSize] value that specifies the size of the rendered icon.
  */
  @property void iconSize(gid.gtk4.types.IconSize propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.types.IconSize)("icon-size", propval);
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
  @property gid.gdk4.texture.Texture texture() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.texture.Texture)("texture");
  }

  /** */
  @property void texture(gid.gdk4.texture.Texture propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk4.texture.Texture)("texture", propval);
  }

  /**
      Creates a new [gid.gtk4.cell_renderer_pixbuf.CellRendererPixbuf]. Adjust rendering
      parameters using object properties. Object properties can be set
      globally (with [gid.gobject2.object.ObjectWrap.set]). Also, with [gid.gtk4.tree_view_column.TreeViewColumn], you
      can bind a property to a value in a [gid.gtk4.tree_model.TreeModel]. For example, you
      can bind the “pixbuf” property on the cell renderer to a pixbuf value
      in the model, thus rendering a different image in each row of the
      [gid.gtk4.tree_view.TreeView].
      Returns: the new cell renderer
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
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

/// Fluent builder implementation template for [gid.gtk4.cell_renderer_pixbuf.CellRendererPixbuf]
class CellRendererPixbufGidBuilderImpl(T) : gid.gtk4.cell_renderer.CellRendererGidBuilderImpl!T
{

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
        propval = The [gid.gtk4.types.IconSize] value that specifies the size of the rendered icon.
      Returns: Builder instance for fluent chaining
  */
  T iconSize(gid.gtk4.types.IconSize propval) nothrow
  {
    return setProperty("icon-size", propval);
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
  T texture(gid.gdk4.texture.Texture propval) nothrow
  {
    return setProperty("texture", propval);
  }
}

/// Fluent builder for [gid.gtk4.cell_renderer_pixbuf.CellRendererPixbuf]
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
