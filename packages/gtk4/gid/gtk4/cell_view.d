/// Module for [CellView] class
module gid.gtk4.cell_view;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.texture;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_area;
import gid.gtk4.cell_area_context;
import gid.gtk4.cell_layout;
import gid.gtk4.cell_layout_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.tree_model;
import gid.gtk4.tree_path;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A widget displaying a single row of a GtkTreeModel
    
    A [gid.gtk4.cell_view.CellView] displays a single row of a [gid.gtk4.tree_model.TreeModel] using a [gid.gtk4.cell_area.CellArea]
    and [gid.gtk4.cell_area_context.CellAreaContext]. A [gid.gtk4.cell_area_context.CellAreaContext] can be provided to the
    [gid.gtk4.cell_view.CellView] at construction time in order to keep the cellview in context
    of a group of cell views, this ensures that the renderers displayed will
    be properly aligned with each other (like the aligned cells in the menus
    of [gid.gtk4.combo_box.ComboBox]).
    
    [gid.gtk4.cell_view.CellView] is [gid.gtk4.orientable.Orientable] in order to decide in which orientation
    the underlying [gid.gtk4.cell_area_context.CellAreaContext] should be allocated. Taking the [gid.gtk4.combo_box.ComboBox]
    menu as an example, cellviews should be oriented horizontally if the menus are
    listed top-to-bottom and thus all share the same width but may have separate
    individual heights (left-to-right menus should be allocated vertically since
    they all share the same height but may have variable widths).
    
    ## CSS nodes
    
    GtkCellView has a single CSS node with name cellview.

    Deprecated: List views use widgets to display their contents.
        You can use [gid.gtk4.box.Box] instead
*/
class CellView : gid.gtk4.widget.Widget, gid.gtk4.cell_layout.CellLayout, gid.gtk4.orientable.Orientable
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
      Get builder for [gid.gtk4.cell_view.CellView]
      Returns: New builder object
  */
  static CellViewGidBuilder builder() nothrow
  {
    return new CellViewGidBuilder;
  }

  /**
      Get `cellArea` property.
      Returns: The [gid.gtk4.cell_area.CellArea] rendering cells
        
        If no area is specified when creating the cell view with [gid.gtk4.cell_view.CellView.newWithContext]
        a horizontally oriented [gid.gtk4.cell_area.CellArea]Box will be used.
        
        since 3.0
  */
  @property gid.gtk4.cell_area.CellArea cellArea() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.cell_area.CellArea)("cell-area");
  }

  /**
      Get `cellAreaContext` property.
      Returns: The [gid.gtk4.cell_area_context.CellAreaContext] used to compute the geometry of the cell view.
        
        A group of cell views can be assigned the same context in order to
        ensure the sizes and cell alignments match across all the views with
        the same context.
        
        [gid.gtk4.combo_box.ComboBox] menus uses this to assign the same context to all cell views
        in the menu items for a single menu (each submenu creates its own
        context since the size of each submenu does not depend on parent
        or sibling menus).
        
        since 3.0
  */
  @property gid.gtk4.cell_area_context.CellAreaContext cellAreaContext() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.cell_area_context.CellAreaContext)("cell-area-context");
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
        ensure the combo box size doesn't change when different items
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
          ensure the combo box size doesn't change when different items
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
  @property gid.gtk4.tree_model.TreeModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model for cell view
          
          since 2.10
  */
  @property void model(gid.gtk4.tree_model.TreeModel propval) nothrow
  {
    setModel(propval);
  }

  mixin CellLayoutT!();
  mixin OrientableT!();

  /**
      Creates a new [gid.gtk4.cell_view.CellView] widget.
      Returns: A newly created [gid.gtk4.cell_view.CellView] widget.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_cell_view_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new [gid.gtk4.cell_view.CellView] widget with a specific [gid.gtk4.cell_area.CellArea]
      to layout cells and a specific [gid.gtk4.cell_area_context.CellAreaContext].
      
      Specifying the same context for a handful of cells lets
      the underlying area synchronize the geometry for those cells,
      in this way alignments with cellviews for other rows are
      possible.
  
      Params:
        area = the [gid.gtk4.cell_area.CellArea] to layout cells
        context = the [gid.gtk4.cell_area_context.CellAreaContext] in which to calculate cell geometry
      Returns: A newly created [gid.gtk4.cell_view.CellView] widget.
  */
  static gid.gtk4.cell_view.CellView newWithContext(gid.gtk4.cell_area.CellArea area, gid.gtk4.cell_area_context.CellAreaContext context) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_context(area ? cast(GtkCellArea*)area._cPtr(No.Dup) : null, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.cell_view.CellView] widget, adds a [gid.gtk4.cell_renderer_text.CellRendererText]
      to it, and makes it show markup. The text can be marked up with
      the [Pango text markup language](https://docs.gtk.org/Pango/pango_markup.html).
  
      Params:
        markup = the text to display in the cell view
      Returns: A newly created [gid.gtk4.cell_view.CellView] widget.
  */
  static gid.gtk4.cell_view.CellView newWithMarkup(string markup) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _markup = markup.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_cell_view_new_with_markup(_markup);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.cell_view.CellView] widget, adds a [gid.gtk4.cell_renderer_text.CellRendererText]
      to it, and makes it show text.
  
      Params:
        text = the text to display in the cell view
      Returns: A newly created [gid.gtk4.cell_view.CellView] widget.
  */
  static gid.gtk4.cell_view.CellView newWithText(string text) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_cell_view_new_with_text(_text);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.cell_view.CellView] widget, adds a [gid.gtk4.cell_renderer_pixbuf.CellRendererPixbuf]
      to it, and makes it show texture.
  
      Params:
        texture = the image to display in the cell view
      Returns: A newly created [gid.gtk4.cell_view.CellView] widget.
  */
  static gid.gtk4.cell_view.CellView newWithTexture(gid.gdk4.texture.Texture texture) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_texture(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gid.gtk4.tree_path.TreePath] referring to the currently
      displayed row. If no row is currently displayed,
      null is returned.
      Returns: the currently displayed row
  */
  gid.gtk4.tree_path.TreePath getDisplayedRow() nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_cell_view_get_displayed_row(cast(GtkCellView*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk4.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
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
      to fit the entire [gid.gtk4.tree_model.TreeModel].
      Returns: whether cell_view requests space to fit
        the entire [gid.gtk4.tree_model.TreeModel].
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
      Returns: a [gid.gtk4.tree_model.TreeModel] used
  */
  gid.gtk4.tree_model.TreeModel getModel() nothrow
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_cell_view_get_model(cast(GtkCellView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the row of the model that is currently displayed
      by the [gid.gtk4.cell_view.CellView]. If the path is unset, then the
      contents of the cellview “stick” at their last value;
      this is not normally a desired result, but may be
      a needed intermediate state if say, the model for
      the [gid.gtk4.cell_view.CellView] becomes temporarily empty.
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] or null to unset.
  */
  void setDisplayedRow(gid.gtk4.tree_path.TreePath path = null) nothrow
  {
    gtk_cell_view_set_displayed_row(cast(GtkCellView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Sets whether cell_view should draw all of its
      cells in a sensitive state, this is used by [gid.gtk4.combo_box.ComboBox] menus
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
      Sets whether cell_view should request space to fit the entire [gid.gtk4.tree_model.TreeModel].
      
      This is used by [gid.gtk4.combo_box.ComboBox] to ensure that the cell view displayed on
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
        model = a [gid.gtk4.tree_model.TreeModel]
  */
  void setModel(gid.gtk4.tree_model.TreeModel model = null) nothrow
  {
    gtk_cell_view_set_model(cast(GtkCellView*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.cell_view.CellView]
class CellViewGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.cell_layout.CellLayoutGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin CellLayoutGidBuilderT!();
  mixin OrientableGidBuilderT!();

  /**
      Set `cellArea` property.
      Params:
        propval = The [gid.gtk4.cell_area.CellArea] rendering cells
          
          If no area is specified when creating the cell view with [gid.gtk4.cell_view.CellView.newWithContext]
          a horizontally oriented [gid.gtk4.cell_area.CellArea]Box will be used.
          
          since 3.0
      Returns: Builder instance for fluent chaining
  */
  T cellArea(gid.gtk4.cell_area.CellArea propval) nothrow
  {
    return setProperty("cell-area", propval);
  }

  /**
      Set `cellAreaContext` property.
      Params:
        propval = The [gid.gtk4.cell_area_context.CellAreaContext] used to compute the geometry of the cell view.
          
          A group of cell views can be assigned the same context in order to
          ensure the sizes and cell alignments match across all the views with
          the same context.
          
          [gid.gtk4.combo_box.ComboBox] menus uses this to assign the same context to all cell views
          in the menu items for a single menu (each submenu creates its own
          context since the size of each submenu does not depend on parent
          or sibling menus).
          
          since 3.0
      Returns: Builder instance for fluent chaining
  */
  T cellAreaContext(gid.gtk4.cell_area_context.CellAreaContext propval) nothrow
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
          ensure the combo box size doesn't change when different items
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
  T model(gid.gtk4.tree_model.TreeModel propval) nothrow
  {
    return setProperty("model", propval);
  }
}

/// Fluent builder for [gid.gtk4.cell_view.CellView]
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
