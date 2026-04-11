/// Module for [CompletionCell] class
module gtksource.completion_cell;

import gdk.paintable;
import gid.gid;
import gio.icon;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;
import pango.attr_list;

/**
    Widget for single cell of completion proposal.
    
    The [gtksource.completion_cell.CompletionCell] widget provides a container to display various
    types of information with the completion display.
    
    Each proposal may consist of multiple cells depending on the complexity of
    the proposal. For example, programming language proposals may contain a cell
    for the "left-hand-side" of an operation along with the "typed-text" for a
    function name and "parameters". They may also optionally set an icon to
    signify the kind of result.
    
    A `iface@CompletionProvider` should implement the
    `vfunc@CompletionProvider.display` virtual function to control
    how to convert data from their `iface@CompletionProposal` to content for
    the [gtksource.completion_cell.CompletionCell].
*/
class CompletionCell : gtk.widget.Widget
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
    return cast(void function())gtk_source_completion_cell_get_type != &gidSymbolNotFound ? gtk_source_completion_cell_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionCell self()
  {
    return this;
  }

  /**
      Get builder for [gtksource.completion_cell.CompletionCell]
      Returns: New builder object
  */
  static CompletionCellGidBuilder builder()
  {
    return new CompletionCellGidBuilder;
  }

  /** */
  @property gtksource.types.CompletionColumn column()
  {
    return getColumn();
  }

  /** */
  @property string markup()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("markup");
  }

  /** */
  @property void markup(string propval)
  {
    setMarkup(propval);
  }

  /** */
  @property gdk.paintable.Paintable paintable()
  {
    return gobject.object.ObjectWrap.getProperty!(gdk.paintable.Paintable)("paintable");
  }

  /** */
  @property void paintable(gdk.paintable.Paintable propval)
  {
    setPaintable(propval);
  }

  /** */
  @property string text()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("text");
  }

  /** */
  @property void text(string propval)
  {
    setText(propval);
  }

  /** */
  @property gtk.widget.Widget widget()
  {
    return getWidget();
  }

  /** */
  @property void widget(gtk.widget.Widget propval)
  {
    setWidget(propval);
  }

  /** */
  gtksource.types.CompletionColumn getColumn()
  {
    GtkSourceCompletionColumn _cretval;
    _cretval = gtk_source_completion_cell_get_column(cast(GtkSourceCompletionCell*)this._cPtr);
    gtksource.types.CompletionColumn _retval = cast(gtksource.types.CompletionColumn)_cretval;
    return _retval;
  }

  /**
      Gets the child #GtkWidget, if any.
      Returns: a #GtkWidget or null
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_completion_cell_get_widget(cast(GtkSourceCompletionCell*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void setGicon(gio.icon.Icon gicon)
  {
    gtk_source_completion_cell_set_gicon(cast(GtkSourceCompletionCell*)this._cPtr, gicon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_source_completion_cell_set_icon_name(cast(GtkSourceCompletionCell*)this._cPtr, _iconName);
  }

  /** */
  void setMarkup(string markup)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_source_completion_cell_set_markup(cast(GtkSourceCompletionCell*)this._cPtr, _markup);
  }

  /** */
  void setPaintable(gdk.paintable.Paintable paintable)
  {
    gtk_source_completion_cell_set_paintable(cast(GtkSourceCompletionCell*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gobject.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets the text for the column cell. Use null to unset.
  
      Params:
        text = the text to set or null
  */
  void setText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_completion_cell_set_text(cast(GtkSourceCompletionCell*)this._cPtr, _text);
  }

  /** */
  void setTextWithAttributes(string text, pango.attr_list.AttrList attrs)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_source_completion_cell_set_text_with_attributes(cast(GtkSourceCompletionCell*)this._cPtr, _text, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /** */
  void setWidget(gtk.widget.Widget child)
  {
    gtk_source_completion_cell_set_widget(cast(GtkSourceCompletionCell*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtksource.completion_cell.CompletionCell]
class CompletionCellGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /** */
  T column(gtksource.types.CompletionColumn propval)
  {
    return setProperty("column", propval);
  }

  /** */
  T markup(string propval)
  {
    return setProperty("markup", propval);
  }

  /** */
  T paintable(gdk.paintable.Paintable propval)
  {
    return setProperty("paintable", propval);
  }

  /** */
  T text(string propval)
  {
    return setProperty("text", propval);
  }

  /** */
  T widget(gtk.widget.Widget propval)
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [gtksource.completion_cell.CompletionCell]
final class CompletionCellGidBuilder : CompletionCellGidBuilderImpl!CompletionCellGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompletionCell build()
  {
    return new CompletionCell(cast(void*)createGObject(CompletionCell._getGType), No.Take);
  }
}
