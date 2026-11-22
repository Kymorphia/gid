/// Module for [CellView] class
module gid.gtk3.cell_view;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.color;
import gid.gdk3.rgba;
import gid.gdkpixbuf2.pixbuf;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_area;
import gid.gtk3.cell_area_context;
import gid.gtk3.cell_layout;
import gid.gtk3.cell_layout_mixin;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.requisition;
import gid.gtk3.tree_model;
import gid.gtk3.tree_path;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A #GtkCellView displays a single row of a #GtkTreeModel using a #GtkCellArea
    and #GtkCellAreaContext. A #GtkCellAreaContext can be provided to the
    #GtkCellView at construction time in order to keep the cellview in context
    of a group of cell views, this ensures that the renderers displayed will
    be properly aligned with eachother (like the aligned cells in the menus
    of #GtkComboBox).
    
    #GtkCellView is #GtkOrientable in order to decide in which orientation
    the underlying #GtkCellAreaContext should be allocated. Taking the #GtkComboBox
    menu as an example, cellviews should be oriented horizontally if the menus are
    listed top-to-bottom and thus all share the same width but may have separate
    individual heights (left-to-right menus should be allocated vertically since
    they all share the same height but may have variable widths).
    
    # CSS nodes
    
    GtkCellView has a single CSS node with name cellview.
*/
class CellView : gid.gtk3.widget.Widget, gid.gtk3.cell_layout.CellLayout, gid.gtk3.orientable.Orientable
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
    return cast(void function())gtk_cell_view_get_type != &gidSymbolNotFound ? gtk_cell_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkCellView";
  }

  /** Returns `this`, for use in `with` statements. */
  override CellView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.cell_view.CellView]
      Returns: New builder object
  */
  static CellViewGidBuilder builder() nothrow
  {
    return new CellViewGidBuilder;
  }

  /** */
  @property void background(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("background", propval);
  }

  /**
      Get `backgroundGdk` property.
      Returns: The background color as a #GdkColor
  
      Deprecated: Use #GtkCellView:background-rgba instead.
  */
  @property gid.gdk3.color.Color backgroundGdk() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.color.Color)("background-gdk");
  }

  /**
      Set `backgroundGdk` property.
      Params:
        propval = The background color as a #GdkColor
  
      Deprecated: Use #GtkCellView:background-rgba instead.
  */
  @property void backgroundGdk(gid.gdk3.color.Color propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.color.Color)("background-gdk", propval);
  }

  /**
      Get `backgroundRgba` property.
      Returns: The background color as a #GdkRGBA
  */
  @property gid.gdk3.rgba.RGBA backgroundRgba() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.rgba.RGBA)("background-rgba");
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = The background color as a #GdkRGBA
  */
  @property void backgroundRgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    setBackgroundRgba(propval);
  }

  /** */
  @property bool backgroundSet() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("background-set");
  }

  /** */
  @property void backgroundSet(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("background-set", propval);
  }

  /**
      Get `cellArea` property.
      Returns: The #GtkCellArea rendering cells
        
        If no area is specified when creating the cell view with [gid.gtk4.cell_view.CellView.newWithContext]
        a horizontally oriented #GtkCellAreaBox will be used.
        
        since 3.0
  */
  @property gid.gtk3.cell_area.CellArea cellArea() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.cell_area.CellArea)("cell-area");
  }

  /**
      Get `cellAreaContext` property.
      Returns: The #GtkCellAreaContext used to compute the geometry of the cell view.
        
        A group of cell views can be assigned the same context in order to
        ensure the sizes and cell alignments match across all the views with
        the same context.
        
        #GtkComboBox menus uses this to assign the same context to all cell views
        in the menu items for a single menu (each submenu creates its own
        context since the size of each submenu does not depend on parent
        or sibling menus).
        
        since 3.0
  */
  @property gid.gtk3.cell_area_context.CellAreaContext cellAreaContext() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.cell_area_context.CellAreaContext)("cell-area-context");
  }

  /**
      Get `drawSensitive` property.
      Returns: Whether all cells should be draw as sensitive for this view regardless
        of the actual cell properties (used to make menus with submenus appear
        sensitive when the items in submenus might be insensitive).
        
        since 3.0
  */
  @property bool drawSensitive() nothrow
  {
    return getDrawSensitive();
  }

  /**
      Set `drawSensitive` property.
      Params:
        propval = Whether all cells should be draw as sensitive for this view regardless
          of the actual cell properties (used to make menus with submenus appear
          sensitive when the items in submenus might be insensitive).
          
          since 3.0
  */
  @property void drawSensitive(bool propval) nothrow
  {
    setDrawSensitive(propval);
  }

  /**
      Get `fitModel` property.
      Returns: Whether the view should request enough space to always fit
        the size of every row in the model (used by the combo box to
        ensure the combo box size doesnt change when different items
        are selected).
        
        since 3.0
  */
  @property bool fitModel() nothrow
  {
    return getFitModel();
  }

  /**
      Set `fitModel` property.
      Params:
        propval = Whether the view should request enough space to always fit
          the size of every row in the model (used by the combo box to
          ensure the combo box size doesnt change when different items
          are selected).
          
          since 3.0
  */
  @property void fitModel(bool propval) nothrow
  {
    setFitModel(propval);
  }

  /**
      Get `model` property.
      Returns: The model for cell view
        
        since 2.10
  */
  @property gid.gtk3.tree_model.TreeModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model for cell view
          
          since 2.10
  */
  @property void model(gid.gtk3.tree_model.TreeModel propval) nothrow
  {
    setModel(propval);
  }

  mixin CellLayoutT!();
  mixin OrientableT!();

  /**
      Creates a new #GtkCellView widget.
      Returns: A newly created #GtkCellView widget.
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkCellView widget with a specific #GtkCellArea
      to layout cells and a specific #GtkCellAreaContext.
      
      Specifying the same context for a handfull of cells lets
      the underlying area synchronize the geometry for those cells,
      in this way alignments with cellviews for other rows are
      possible.
  
      Params:
        area = the #GtkCellArea to layout cells
        context = the #GtkCellAreaContext in which to calculate cell geometry
      Returns: A newly created #GtkCellView widget.
  */
  static gid.gtk3.cell_view.CellView newWithContext(gid.gtk3.cell_area.CellArea area, gid.gtk3.cell_area_context.CellAreaContext context) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_context(area ? cast(GtkCellArea*)area._cPtr(No.Dup) : null, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCellView widget, adds a #GtkCellRendererText
      to it, and makes it show markup. The text can be
      marked up with the [Pango text markup language][PangoMarkupFormat].
  
      Params:
        markup = the text to display in the cell view
      Returns: A newly created #GtkCellView widget.
  */
  static gid.gtk3.cell_view.CellView newWithMarkup(string markup) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _markup = markup.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_cell_view_new_with_markup(_markup);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCellView widget, adds a #GtkCellRendererPixbuf
      to it, and makes it show pixbuf.
  
      Params:
        pixbuf = the image to display in the cell view
      Returns: A newly created #GtkCellView widget.
  */
  static gid.gtk3.cell_view.CellView newWithPixbuf(gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_pixbuf(pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkCellView widget, adds a #GtkCellRendererText
      to it, and makes it show text.
  
      Params:
        text = the text to display in the cell view
      Returns: A newly created #GtkCellView widget.
  */
  static gid.gtk3.cell_view.CellView newWithText(string text) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_cell_view_new_with_text(_text);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a #GtkTreePath referring to the currently
      displayed row. If no row is currently displayed,
      null is returned.
      Returns: the currently displayed row or null
  */
  gid.gtk3.tree_path.TreePath getDisplayedRow() nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_cell_view_get_displayed_row(cast(GtkCellView*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets whether cell_view is configured to draw all of its
      cells in a sensitive state.
      Returns: whether cell_view draws all of its
        cells in a sensitive state
  */
  bool getDrawSensitive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_view_get_draw_sensitive(cast(GtkCellView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether cell_view is configured to request space
      to fit the entire #GtkTreeModel.
      Returns: whether cell_view requests space to fit
        the entire #GtkTreeModel.
  */
  bool getFitModel() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_view_get_fit_model(cast(GtkCellView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the model for cell_view. If no model is used null is
      returned.
      Returns: a #GtkTreeModel used or null
  */
  gid.gtk3.tree_model.TreeModel getModel() nothrow
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_cell_view_get_model(cast(GtkCellView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets requisition to the size needed by cell_view to display
      the model row pointed to by path.
  
      Params:
        path = a #GtkTreePath
        requisition = return location for the size
      Returns: true
  
      Deprecated: Combo box formerly used this to calculate the
        sizes for cellviews, now you can achieve this by either using
        the #GtkCellView:fit-model property or by setting the currently
        displayed row of the #GtkCellView and using [gid.gtk4.widget.Widget.getPreferredSize].
  */
  bool getSizeOfRow(gid.gtk3.tree_path.TreePath path, out gid.gtk3.requisition.Requisition requisition) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_view_get_size_of_row(cast(GtkCellView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, cast(GtkRequisition*)&requisition);
    return _retval;
  }

  /**
      Sets the background color of view.
  
      Params:
        color = the new background color
  
      Deprecated: Use [gid.gtk3.cell_view.CellView.setBackgroundRgba] instead.
  */
  void setBackgroundColor(gid.gdk3.color.Color color) nothrow
  {
    gtk_cell_view_set_background_color(cast(GtkCellView*)this._cPtr, cast(const(GdkColor)*)&color);
  }

  /**
      Sets the background color of cell_view.
  
      Params:
        rgba = the new background color
  */
  void setBackgroundRgba(gid.gdk3.rgba.RGBA rgba) nothrow
  {
    gtk_cell_view_set_background_rgba(cast(GtkCellView*)this._cPtr, cast(const(GdkRGBA)*)&rgba);
  }

  /**
      Sets the row of the model that is currently displayed
      by the #GtkCellView. If the path is unset, then the
      contents of the cellview “stick” at their last value;
      this is not normally a desired result, but may be
      a needed intermediate state if say, the model for
      the #GtkCellView becomes temporarily empty.
  
      Params:
        path = a #GtkTreePath or null to unset.
  */
  void setDisplayedRow(gid.gtk3.tree_path.TreePath path = null) nothrow
  {
    gtk_cell_view_set_displayed_row(cast(GtkCellView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Sets whether cell_view should draw all of its
      cells in a sensitive state, this is used by #GtkComboBox menus
      to ensure that rows with insensitive cells that contain
      children appear sensitive in the parent menu item.
  
      Params:
        drawSensitive = whether to draw all cells in a sensitive state.
  */
  void setDrawSensitive(bool drawSensitive) nothrow
  {
    gtk_cell_view_set_draw_sensitive(cast(GtkCellView*)this._cPtr, drawSensitive);
  }

  /**
      Sets whether cell_view should request space to fit the entire #GtkTreeModel.
      
      This is used by #GtkComboBox to ensure that the cell view displayed on
      the combo box’s button always gets enough space and does not resize
      when selection changes.
  
      Params:
        fitModel = whether cell_view should request space for the whole model.
  */
  void setFitModel(bool fitModel) nothrow
  {
    gtk_cell_view_set_fit_model(cast(GtkCellView*)this._cPtr, fitModel);
  }

  /**
      Sets the model for cell_view.  If cell_view already has a model
      set, it will remove it before setting the new model.  If model is
      null, then it will unset the old model.
  
      Params:
        model = a #GtkTreeModel
  */
  void setModel(gid.gtk3.tree_model.TreeModel model = null) nothrow
  {
    gtk_cell_view_set_model(cast(GtkCellView*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk3.cell_view.CellView]
class CellViewGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T, gid.gtk3.cell_layout.CellLayoutGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T
{

  mixin CellLayoutGidBuilderT!();
  mixin OrientableGidBuilderT!();

  /** */
  T background(string propval) nothrow
  {
    return setProperty("background", propval);
  }

  /**
      Set `backgroundGdk` property.
      Params:
        propval = The background color as a #GdkColor
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GtkCellView:background-rgba instead.
  */
  T backgroundGdk(gid.gdk3.color.Color propval) nothrow
  {
    return setProperty("background-gdk", propval);
  }

  /**
      Set `backgroundRgba` property.
      Params:
        propval = The background color as a #GdkRGBA
      Returns: Builder instance for fluent chaining
  */
  T backgroundRgba(gid.gdk3.rgba.RGBA propval) nothrow
  {
    return setProperty("background-rgba", propval);
  }

  /** */
  T backgroundSet(bool propval) nothrow
  {
    return setProperty("background-set", propval);
  }

  /**
      Set `cellArea` property.
      Params:
        propval = The #GtkCellArea rendering cells
          
          If no area is specified when creating the cell view with [gid.gtk4.cell_view.CellView.newWithContext]
          a horizontally oriented #GtkCellAreaBox will be used.
          
          since 3.0
      Returns: Builder instance for fluent chaining
  */
  T cellArea(gid.gtk3.cell_area.CellArea propval) nothrow
  {
    return setProperty("cell-area", propval);
  }

  /**
      Set `cellAreaContext` property.
      Params:
        propval = The #GtkCellAreaContext used to compute the geometry of the cell view.
          
          A group of cell views can be assigned the same context in order to
          ensure the sizes and cell alignments match across all the views with
          the same context.
          
          #GtkComboBox menus uses this to assign the same context to all cell views
          in the menu items for a single menu (each submenu creates its own
          context since the size of each submenu does not depend on parent
          or sibling menus).
          
          since 3.0
      Returns: Builder instance for fluent chaining
  */
  T cellAreaContext(gid.gtk3.cell_area_context.CellAreaContext propval) nothrow
  {
    return setProperty("cell-area-context", propval);
  }

  /**
      Set `drawSensitive` property.
      Params:
        propval = Whether all cells should be draw as sensitive for this view regardless
          of the actual cell properties (used to make menus with submenus appear
          sensitive when the items in submenus might be insensitive).
          
          since 3.0
      Returns: Builder instance for fluent chaining
  */
  T drawSensitive(bool propval) nothrow
  {
    return setProperty("draw-sensitive", propval);
  }

  /**
      Set `fitModel` property.
      Params:
        propval = Whether the view should request enough space to always fit
          the size of every row in the model (used by the combo box to
          ensure the combo box size doesnt change when different items
          are selected).
          
          since 3.0
      Returns: Builder instance for fluent chaining
  */
  T fitModel(bool propval) nothrow
  {
    return setProperty("fit-model", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = The model for cell view
          
          since 2.10
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gtk3.tree_model.TreeModel propval) nothrow
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gid.gtk3.cell_view.CellView]
final class CellViewGidBuilder : CellViewGidBuilderImpl!CellViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CellView build() nothrow
  {
    return new CellView(cast(void*)createGObject(CellView._getGType), Yes.Take);
  }
}
