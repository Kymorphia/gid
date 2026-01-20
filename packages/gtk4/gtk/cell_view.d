/// Module for [CellView] class
module gtk.cell_view;

import gdk.texture;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.cell_area_context;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.tree_model;
import gtk.tree_path;
import gtk.types;
import gtk.widget;

/**
    A widget displaying a single row of a GtkTreeModel
    
    A [gtk.cell_view.CellView] displays a single row of a [gtk.tree_model.TreeModel] using a [gtk.cell_area.CellArea]
    and [gtk.cell_area_context.CellAreaContext]. A [gtk.cell_area_context.CellAreaContext] can be provided to the
    [gtk.cell_view.CellView] at construction time in order to keep the cellview in context
    of a group of cell views, this ensures that the renderers displayed will
    be properly aligned with each other (like the aligned cells in the menus
    of [gtk.combo_box.ComboBox]).
    
    [gtk.cell_view.CellView] is [gtk.orientable.Orientable] in order to decide in which orientation
    the underlying [gtk.cell_area_context.CellAreaContext] should be allocated. Taking the [gtk.combo_box.ComboBox]
    menu as an example, cellviews should be oriented horizontally if the menus are
    listed top-to-bottom and thus all share the same width but may have separate
    individual heights (left-to-right menus should be allocated vertically since
    they all share the same height but may have variable widths).
    
    ## CSS nodes
    
    GtkCellView has a single CSS node with name cellview.

    Deprecated: List views use widgets to display their contents.
        You can use [gtk.box.Box] instead
*/
class CellView : gtk.widget.Widget, gtk.cell_layout.CellLayout, gtk.orientable.Orientable
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
    return cast(void function())gtk_cell_view_get_type != &gidSymbolNotFound ? gtk_cell_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CellView self()
  {
    return this;
  }

  /**
      Get `drawSensitive` property.
      Returns: Whether all cells should be draw as sensitive for this view regardless
        of the actual cell properties (used to make menus with submenus appear
        sensitive when the items in submenus might be insensitive).
        
        since 3.0
  */
  @property bool drawSensitive()
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
  @property void drawSensitive(bool propval)
  {
    return setDrawSensitive(propval);
  }

  /**
      Get `fitModel` property.
      Returns: Whether the view should request enough space to always fit
        the size of every row in the model (used by the combo box to
        ensure the combo box size doesn't change when different items
        are selected).
        
        since 3.0
  */
  @property bool fitModel()
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
  @property void fitModel(bool propval)
  {
    return setFitModel(propval);
  }

  /**
      Get `model` property.
      Returns: The model for cell view
        
        since 2.10
  */
  @property gtk.tree_model.TreeModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model for cell view
          
          since 2.10
  */
  @property void model(gtk.tree_model.TreeModel propval)
  {
    return setModel(propval);
  }

  mixin CellLayoutT!();
  mixin OrientableT!();

  /**
      Creates a new [gtk.cell_view.CellView] widget.
      Returns: A newly created [gtk.cell_view.CellView] widget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.cell_view.CellView] widget with a specific [gtk.cell_area.CellArea]
      to layout cells and a specific [gtk.cell_area_context.CellAreaContext].
      
      Specifying the same context for a handful of cells lets
      the underlying area synchronize the geometry for those cells,
      in this way alignments with cellviews for other rows are
      possible.
  
      Params:
        area = the [gtk.cell_area.CellArea] to layout cells
        context = the [gtk.cell_area_context.CellAreaContext] in which to calculate cell geometry
      Returns: A newly created [gtk.cell_view.CellView] widget.
  */
  static gtk.cell_view.CellView newWithContext(gtk.cell_area.CellArea area, gtk.cell_area_context.CellAreaContext context)
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_context(area ? cast(GtkCellArea*)area._cPtr(No.Dup) : null, context ? cast(GtkCellAreaContext*)context._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.cell_view.CellView] widget, adds a [gtk.cell_renderer_text.CellRendererText]
      to it, and makes it show markup. The text can be marked up with
      the [Pango text markup language](https://docs.gtk.org/Pango/pango_markup.html).
  
      Params:
        markup = the text to display in the cell view
      Returns: A newly created [gtk.cell_view.CellView] widget.
  */
  static gtk.cell_view.CellView newWithMarkup(string markup)
  {
    GtkWidget* _cretval;
    const(char)* _markup = markup.toCString(No.Alloc);
    _cretval = gtk_cell_view_new_with_markup(_markup);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.cell_view.CellView] widget, adds a [gtk.cell_renderer_text.CellRendererText]
      to it, and makes it show text.
  
      Params:
        text = the text to display in the cell view
      Returns: A newly created [gtk.cell_view.CellView] widget.
  */
  static gtk.cell_view.CellView newWithText(string text)
  {
    GtkWidget* _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    _cretval = gtk_cell_view_new_with_text(_text);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gtk.cell_view.CellView] widget, adds a [gtk.cell_renderer_pixbuf.CellRendererPixbuf]
      to it, and makes it show texture.
  
      Params:
        texture = the image to display in the cell view
      Returns: A newly created [gtk.cell_view.CellView] widget.
  */
  static gtk.cell_view.CellView newWithTexture(gdk.texture.Texture texture)
  {
    GtkWidget* _cretval;
    _cretval = gtk_cell_view_new_with_texture(texture ? cast(GdkTexture*)texture._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.cell_view.CellView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a [gtk.tree_path.TreePath] referring to the currently
      displayed row. If no row is currently displayed,
      null is returned.
      Returns: the currently displayed row
  */
  gtk.tree_path.TreePath getDisplayedRow()
  {
    GtkTreePath* _cretval;
    _cretval = gtk_cell_view_get_displayed_row(cast(GtkCellView*)this._cPtr);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets whether cell_view is configured to draw all of its
      cells in a sensitive state.
      Returns: whether cell_view draws all of its
        cells in a sensitive state
  */
  bool getDrawSensitive()
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_view_get_draw_sensitive(cast(GtkCellView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether cell_view is configured to request space
      to fit the entire [gtk.tree_model.TreeModel].
      Returns: whether cell_view requests space to fit
        the entire [gtk.tree_model.TreeModel].
  */
  bool getFitModel()
  {
    bool _retval;
    _retval = cast(bool)gtk_cell_view_get_fit_model(cast(GtkCellView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the model for cell_view. If no model is used null is
      returned.
      Returns: a [gtk.tree_model.TreeModel] used
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_cell_view_get_model(cast(GtkCellView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the row of the model that is currently displayed
      by the [gtk.cell_view.CellView]. If the path is unset, then the
      contents of the cellview “stick” at their last value;
      this is not normally a desired result, but may be
      a needed intermediate state if say, the model for
      the [gtk.cell_view.CellView] becomes temporarily empty.
  
      Params:
        path = a [gtk.tree_path.TreePath] or null to unset.
  */
  void setDisplayedRow(gtk.tree_path.TreePath path = null)
  {
    gtk_cell_view_set_displayed_row(cast(GtkCellView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Sets whether cell_view should draw all of its
      cells in a sensitive state, this is used by [gtk.combo_box.ComboBox] menus
      to ensure that rows with insensitive cells that contain
      children appear sensitive in the parent menu item.
  
      Params:
        drawSensitive = whether to draw all cells in a sensitive state.
  */
  void setDrawSensitive(bool drawSensitive)
  {
    gtk_cell_view_set_draw_sensitive(cast(GtkCellView*)this._cPtr, drawSensitive);
  }

  /**
      Sets whether cell_view should request space to fit the entire [gtk.tree_model.TreeModel].
      
      This is used by [gtk.combo_box.ComboBox] to ensure that the cell view displayed on
      the combo box’s button always gets enough space and does not resize
      when selection changes.
  
      Params:
        fitModel = whether cell_view should request space for the whole model.
  */
  void setFitModel(bool fitModel)
  {
    gtk_cell_view_set_fit_model(cast(GtkCellView*)this._cPtr, fitModel);
  }

  /**
      Sets the model for cell_view.  If cell_view already has a model
      set, it will remove it before setting the new model.  If model is
      null, then it will unset the old model.
  
      Params:
        model = a [gtk.tree_model.TreeModel]
  */
  void setModel(gtk.tree_model.TreeModel model = null)
  {
    gtk_cell_view_set_model(cast(GtkCellView*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }
}
