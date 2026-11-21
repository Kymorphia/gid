/// Module for [CompletionCell] class
module gid.gtksource5.completion_cell;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.paintable;
import gid.gio2.icon;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;
import gid.pango1.attr_list;

/**
    Widget for single cell of completion proposal.
    
    The [gid.gtksource5.completion_cell.CompletionCell] widget provides a container to display various
    types of information with the completion display.
    
    Each proposal may consist of multiple cells depending on the complexity of
    the proposal. For example, programming language proposals may contain a cell
    for the "left-hand-side" of an operation along with the "typed-text" for a
    function name and "parameters". They may also optionally set an icon to
    signify the kind of result.
    
    A [gid.gtksource5.completion_provider.CompletionProvider] should implement the
    `vfunc@CompletionProvider.display` virtual function to control
    how to convert data from their [gid.gtksource5.completion_proposal.CompletionProposal] to content for
    the [gid.gtksource5.completion_cell.CompletionCell].
*/
class CompletionCell : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_source_completion_cell_get_type != &gidSymbolNotFound ? gtk_source_completion_cell_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceCompletionCell";
  }

  /** Returns `this`, for use in `with` statements. */
  override CompletionCell self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.completion_cell.CompletionCell]
      Returns: New builder object
  */
  static CompletionCellGidBuilder builder() nothrow
  {
    return new CompletionCellGidBuilder;
  }

  /** */
  @property gid.gtksource5.types.CompletionColumn column() nothrow
  {
    return getColumn();
  }

  /** */
  @property string markup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("markup");
  }

  /** */
  @property void markup(string propval) nothrow
  {
    setMarkup(propval);
  }

  /** */
  @property gid.gdk4.paintable.Paintable paintable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk4.paintable.Paintable)("paintable");
  }

  /** */
  @property void paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    setPaintable(propval);
  }

  /** */
  @property string text() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("text");
  }

  /** */
  @property void text(string propval) nothrow
  {
    setText(propval);
  }

  /** */
  @property gid.gtk4.widget.Widget widget() nothrow
  {
    return getWidget();
  }

  /** */
  @property void widget(gid.gtk4.widget.Widget propval) nothrow
  {
    setWidget(propval);
  }

  /** */
  gid.gtksource5.types.CompletionColumn getColumn() nothrow
  {
    GtkSourceCompletionColumn _cretval;
    _cretval = gtk_source_completion_cell_get_column(cast(GtkSourceCompletionCell*)this._cPtr);
    gid.gtksource5.types.CompletionColumn _retval = cast(gid.gtksource5.types.CompletionColumn)_cretval;
    return _retval;
  }

  /**
      Gets the child #GtkWidget, if any.
      Returns: a #GtkWidget or null
  */
  gid.gtk4.widget.Widget getWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_source_completion_cell_get_widget(cast(GtkSourceCompletionCell*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  void setGicon(gid.gio2.icon.Icon gicon) nothrow
  {
    gtk_source_completion_cell_set_gicon(cast(GtkSourceCompletionCell*)this._cPtr, gicon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)gicon)._cPtr(No.Dup) : null);
  }

  /** */
  void setIconName(string iconName) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    gtk_source_completion_cell_set_icon_name(cast(GtkSourceCompletionCell*)this._cPtr, _iconName);
  }

  /** */
  void setMarkup(string markup) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, No.Nullable);
    gtk_source_completion_cell_set_markup(cast(GtkSourceCompletionCell*)this._cPtr, _markup);
  }

  /** */
  void setPaintable(gid.gdk4.paintable.Paintable paintable) nothrow
  {
    gtk_source_completion_cell_set_paintable(cast(GtkSourceCompletionCell*)this._cPtr, paintable ? cast(GdkPaintable*)(cast(gid.gobject2.object.ObjectWrap)paintable)._cPtr(No.Dup) : null);
  }

  /**
      Sets the text for the column cell. Use null to unset.
  
      Params:
        text = the text to set or null
  */
  void setText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_source_completion_cell_set_text(cast(GtkSourceCompletionCell*)this._cPtr, _text);
  }

  /** */
  void setTextWithAttributes(string text, gid.pango1.attr_list.AttrList attrs) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    gtk_source_completion_cell_set_text_with_attributes(cast(GtkSourceCompletionCell*)this._cPtr, _text, attrs ? cast(PangoAttrList*)attrs._cPtr(No.Dup) : null);
  }

  /** */
  void setWidget(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_source_completion_cell_set_widget(cast(GtkSourceCompletionCell*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.completion_cell.CompletionCell]
class CompletionCellGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /** */
  T column(gid.gtksource5.types.CompletionColumn propval) nothrow
  {
    return setProperty("column", propval);
  }

  /** */
  T markup(string propval) nothrow
  {
    return setProperty("markup", propval);
  }

  /** */
  T paintable(gid.gdk4.paintable.Paintable propval) nothrow
  {
    return setProperty("paintable", propval);
  }

  /** */
  T text(string propval) nothrow
  {
    return setProperty("text", propval);
  }

  /** */
  T widget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("widget", propval);
  }
}

/// Fluent builder for [gid.gtksource5.completion_cell.CompletionCell]
final class CompletionCellGidBuilder : CompletionCellGidBuilderImpl!CompletionCellGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CompletionCell build() nothrow
  {
    return new CompletionCell(cast(void*)createGObject(CompletionCell._getGType), Yes.Take);
  }
}
