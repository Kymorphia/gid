/// Module for [IconView] class
module gid.gtk3.icon_view;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.cairo1.surface;
import gid.core.utils;
import gid.gdk3.rectangle;
import gid.gdk3.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_area;
import gid.gtk3.cell_layout;
import gid.gtk3.cell_layout_mixin;
import gid.gtk3.cell_renderer;
import gid.gtk3.container;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;
import gid.gtk3.target_entry;
import gid.gtk3.tooltip;
import gid.gtk3.tree_iter;
import gid.gtk3.tree_model;
import gid.gtk3.tree_path;
import gid.gtk3.types;

/**
    #GtkIconView provides an alternative view on a #GtkTreeModel.
    It displays the model as a grid of icons with labels. Like
    #GtkTreeView, it allows to select one or multiple items
    (depending on the selection mode, see [gid.gtk4.icon_view.IconView.setSelectionMode]).
    In addition to selection with the arrow keys, #GtkIconView supports
    rubberband selection, which is controlled by dragging the pointer.
    
    Note that if the tree model is backed by an actual tree store (as
    opposed to a flat list where the mapping to icons is obvious),
    #GtkIconView will only display the first level of the tree and
    ignore the tree’s branches.
    
    # CSS nodes
    
    ```plain
    iconview.view
    ╰── [rubberband]
    ```
    
    GtkIconView has a single CSS node with name iconview and style class .view.
    For rubberband selection, a subnode with name rubberband is used.
*/
@gidGir("IconView", "IconViewClass")
class IconView : gid.gtk3.container.Container, gid.gtk3.cell_layout.CellLayout, gid.gtk3.scrollable.Scrollable
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
    return cast(void function())gtk_icon_view_get_type != &gidSymbolNotFound ? gtk_icon_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkIconView";
  }

  /** Returns `this`, for use in `with` statements. */
  override IconView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.icon_view.IconView]
      Returns: New builder object
  */
  static IconViewGidBuilder builder() nothrow
  {
    return new IconViewGidBuilder;
  }

  /**
      Get `activateOnSingleClick` property.
      Returns: The activate-on-single-click property specifies whether the "item-activated" signal
        will be emitted after a single click.
  */
  @property bool activateOnSingleClick() nothrow
  {
    return getActivateOnSingleClick();
  }

  /**
      Set `activateOnSingleClick` property.
      Params:
        propval = The activate-on-single-click property specifies whether the "item-activated" signal
          will be emitted after a single click.
  */
  @property void activateOnSingleClick(bool propval) nothrow
  {
    setActivateOnSingleClick(propval);
  }

  /**
      Get `cellArea` property.
      Returns: The #GtkCellArea used to layout cell renderers for this view.
        
        If no area is specified when creating the icon view with [gid.gtk4.icon_view.IconView.newWithArea]
        a #GtkCellAreaBox will be used.
  */
  @property gid.gtk3.cell_area.CellArea cellArea() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.cell_area.CellArea)("cell-area");
  }

  /**
      Get `columnSpacing` property.
      Returns: The column-spacing property specifies the space which is inserted between
        the columns of the icon view.
  */
  @property int columnSpacing() nothrow
  {
    return getColumnSpacing();
  }

  /**
      Set `columnSpacing` property.
      Params:
        propval = The column-spacing property specifies the space which is inserted between
          the columns of the icon view.
  */
  @property void columnSpacing(int propval) nothrow
  {
    setColumnSpacing(propval);
  }

  /**
      Get `columns` property.
      Returns: The columns property contains the number of the columns in which the
        items should be displayed. If it is -1, the number of columns will
        be chosen automatically to fill the available area.
  */
  @property int columns() nothrow
  {
    return getColumns();
  }

  /**
      Set `columns` property.
      Params:
        propval = The columns property contains the number of the columns in which the
          items should be displayed. If it is -1, the number of columns will
          be chosen automatically to fill the available area.
  */
  @property void columns(int propval) nothrow
  {
    setColumns(propval);
  }

  /**
      Get `itemOrientation` property.
      Returns: The item-orientation property specifies how the cells (i.e. the icon and
        the text) of the item are positioned relative to each other.
  */
  @property gid.gtk3.types.Orientation itemOrientation() nothrow
  {
    return getItemOrientation();
  }

  /**
      Set `itemOrientation` property.
      Params:
        propval = The item-orientation property specifies how the cells (i.e. the icon and
          the text) of the item are positioned relative to each other.
  */
  @property void itemOrientation(gid.gtk3.types.Orientation propval) nothrow
  {
    setItemOrientation(propval);
  }

  /**
      Get `itemPadding` property.
      Returns: The item-padding property specifies the padding around each
        of the icon view's item.
  */
  @property int itemPadding() nothrow
  {
    return getItemPadding();
  }

  /**
      Set `itemPadding` property.
      Params:
        propval = The item-padding property specifies the padding around each
          of the icon view's item.
  */
  @property void itemPadding(int propval) nothrow
  {
    setItemPadding(propval);
  }

  /**
      Get `itemWidth` property.
      Returns: The item-width property specifies the width to use for each item.
        If it is set to -1, the icon view will automatically determine a
        suitable item size.
  */
  @property int itemWidth() nothrow
  {
    return getItemWidth();
  }

  /**
      Set `itemWidth` property.
      Params:
        propval = The item-width property specifies the width to use for each item.
          If it is set to -1, the icon view will automatically determine a
          suitable item size.
  */
  @property void itemWidth(int propval) nothrow
  {
    setItemWidth(propval);
  }

  /**
      Get `margin` property.
      Returns: The margin property specifies the space which is inserted
        at the edges of the icon view.
  */
  override @property int margin() nothrow
  {
    return getMargin();
  }

  /**
      Set `margin` property.
      Params:
        propval = The margin property specifies the space which is inserted
          at the edges of the icon view.
  */
  override @property void margin(int propval) nothrow
  {
    setMargin(propval);
  }

  /**
      Get `markupColumn` property.
      Returns: The ::markup-column property contains the number of the model column
        containing markup information to be displayed. The markup column must be
        of type #G_TYPE_STRING. If this property and the :text-column property
        are both set to column numbers, it overrides the text column.
        If both are set to -1, no texts are displayed.
  */
  @property int markupColumn() nothrow
  {
    return getMarkupColumn();
  }

  /**
      Set `markupColumn` property.
      Params:
        propval = The ::markup-column property contains the number of the model column
          containing markup information to be displayed. The markup column must be
          of type #G_TYPE_STRING. If this property and the :text-column property
          are both set to column numbers, it overrides the text column.
          If both are set to -1, no texts are displayed.
  */
  @property void markupColumn(int propval) nothrow
  {
    setMarkupColumn(propval);
  }

  /** */
  @property gid.gtk3.tree_model.TreeModel model() nothrow
  {
    return getModel();
  }

  /** */
  @property void model(gid.gtk3.tree_model.TreeModel propval) nothrow
  {
    setModel(propval);
  }

  /**
      Get `pixbufColumn` property.
      Returns: The ::pixbuf-column property contains the number of the model column
        containing the pixbufs which are displayed. The pixbuf column must be
        of type #GDK_TYPE_PIXBUF. Setting this property to -1 turns off the
        display of pixbufs.
  */
  @property int pixbufColumn() nothrow
  {
    return getPixbufColumn();
  }

  /**
      Set `pixbufColumn` property.
      Params:
        propval = The ::pixbuf-column property contains the number of the model column
          containing the pixbufs which are displayed. The pixbuf column must be
          of type #GDK_TYPE_PIXBUF. Setting this property to -1 turns off the
          display of pixbufs.
  */
  @property void pixbufColumn(int propval) nothrow
  {
    setPixbufColumn(propval);
  }

  /**
      Get `reorderable` property.
      Returns: The reorderable property specifies if the items can be reordered
        by DND.
  */
  @property bool reorderable() nothrow
  {
    return getReorderable();
  }

  /**
      Set `reorderable` property.
      Params:
        propval = The reorderable property specifies if the items can be reordered
          by DND.
  */
  @property void reorderable(bool propval) nothrow
  {
    setReorderable(propval);
  }

  /**
      Get `rowSpacing` property.
      Returns: The row-spacing property specifies the space which is inserted between
        the rows of the icon view.
  */
  @property int rowSpacing() nothrow
  {
    return getRowSpacing();
  }

  /**
      Set `rowSpacing` property.
      Params:
        propval = The row-spacing property specifies the space which is inserted between
          the rows of the icon view.
  */
  @property void rowSpacing(int propval) nothrow
  {
    setRowSpacing(propval);
  }

  /**
      Get `selectionMode` property.
      Returns: The ::selection-mode property specifies the selection mode of
        icon view. If the mode is #GTK_SELECTION_MULTIPLE, rubberband selection
        is enabled, for the other modes, only keyboard selection is possible.
  */
  @property gid.gtk3.types.SelectionMode selectionMode() nothrow
  {
    return getSelectionMode();
  }

  /**
      Set `selectionMode` property.
      Params:
        propval = The ::selection-mode property specifies the selection mode of
          icon view. If the mode is #GTK_SELECTION_MULTIPLE, rubberband selection
          is enabled, for the other modes, only keyboard selection is possible.
  */
  @property void selectionMode(gid.gtk3.types.SelectionMode propval) nothrow
  {
    setSelectionMode(propval);
  }

  /**
      Get `spacing` property.
      Returns: The spacing property specifies the space which is inserted between
        the cells (i.e. the icon and the text) of an item.
  */
  @property int spacing() nothrow
  {
    return getSpacing();
  }

  /**
      Set `spacing` property.
      Params:
        propval = The spacing property specifies the space which is inserted between
          the cells (i.e. the icon and the text) of an item.
  */
  @property void spacing(int propval) nothrow
  {
    setSpacing(propval);
  }

  /**
      Get `textColumn` property.
      Returns: The ::text-column property contains the number of the model column
        containing the texts which are displayed. The text column must be
        of type #G_TYPE_STRING. If this property and the :markup-column
        property are both set to -1, no texts are displayed.
  */
  @property int textColumn() nothrow
  {
    return getTextColumn();
  }

  /**
      Set `textColumn` property.
      Params:
        propval = The ::text-column property contains the number of the model column
          containing the texts which are displayed. The text column must be
          of type #G_TYPE_STRING. If this property and the :markup-column
          property are both set to -1, no texts are displayed.
  */
  @property void textColumn(int propval) nothrow
  {
    setTextColumn(propval);
  }

  /** */
  @property int tooltipColumn() nothrow
  {
    return getTooltipColumn();
  }

  /** */
  @property void tooltipColumn(int propval) nothrow
  {
    setTooltipColumn(propval);
  }

  mixin CellLayoutT!();
  mixin ScrollableT!();

  /**
      Creates a new #GtkIconView widget
      Returns: A newly created #GtkIconView widget
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
      _cretval = gtk_icon_view_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkIconView widget using the
      specified area to layout cells inside the icons.
  
      Params:
        area = the #GtkCellArea to use to layout cells
      Returns: A newly created #GtkIconView widget
  */
  static gid.gtk3.icon_view.IconView newWithArea(gid.gtk3.cell_area.CellArea area) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new_with_area(area ? cast(GtkCellArea*)area._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.icon_view.IconView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkIconView widget with the model model.
  
      Params:
        model = The model.
      Returns: A newly created #GtkIconView widget.
  */
  static gid.gtk3.icon_view.IconView newWithModel(gid.gtk3.tree_model.TreeModel model) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new_with_model(model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.icon_view.IconView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected bool vfuncActivateCursorItem()
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.activateCursorItem)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.activateCursorItem(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Activates the item determined by path.
  
      Params:
        path = The #GtkTreePath to be activated (modified in place, changes are seen by the caller)
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncItemActivated` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncItemActivated(gid.gtk3.tree_path.TreePath path)
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.itemActivated)
      return;

    _klass.itemActivated(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /** */
  protected bool vfuncMoveCursor(gid.gtk3.types.MovementStep step, int count)
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.moveCursor)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.moveCursor(cast(GtkIconView*)this._cPtr, step, count);
    return _retval;
  }

  /**
      Selects all the icons. icon_view must has its selection mode set
      to #GTK_SELECTION_MULTIPLE.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSelectAll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSelectAll()
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.selectAll)
      return;

    _klass.selectAll(cast(GtkIconView*)this._cPtr);
  }

  /** */
  protected void vfuncSelectCursorItem()
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.selectCursorItem)
      return;

    _klass.selectCursorItem(cast(GtkIconView*)this._cPtr);
  }

  /** */
  protected void vfuncSelectionChanged()
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.selectionChanged)
      return;

    _klass.selectionChanged(cast(GtkIconView*)this._cPtr);
  }

  /** */
  protected void vfuncToggleCursorItem()
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.toggleCursorItem)
      return;

    _klass.toggleCursorItem(cast(GtkIconView*)this._cPtr);
  }

  /**
      Unselects all the icons.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnselectAll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUnselectAll()
  {
    auto _klass = cast(GtkIconViewClass*)_vfuncClass;
    if (!_klass.unselectAll)
      return;

    _klass.unselectAll(cast(GtkIconView*)this._cPtr);
  }

  /**
      Converts widget coordinates to coordinates for the bin_window,
      as expected by e.g. [gid.gtk4.icon_view.IconView.getPathAtPos].
  
      Params:
        wx = X coordinate relative to the widget
        wy = Y coordinate relative to the widget
        bx = return location for bin_window X coordinate
        by = return location for bin_window Y coordinate
  */
  void convertWidgetToBinWindowCoords(int wx, int wy, out int bx, out int by) nothrow
  {
    gtk_icon_view_convert_widget_to_bin_window_coords(cast(GtkIconView*)this._cPtr, wx, wy, cast(int*)&bx, cast(int*)&by);
  }

  /**
      Creates a #cairo_surface_t representation of the item at path.
      This image is used for a drag icon.
  
      Params:
        path = a #GtkTreePath in icon_view
      Returns: a newly-allocated surface of the drag icon.
  */
  gid.cairo1.surface.Surface createDragIcon(gid.gtk3.tree_path.TreePath path) nothrow
  {
    cairo_surface_t* _cretval;
    _cretval = gtk_icon_view_create_drag_icon(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.cairo1.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Turns icon_view into a drop destination for automatic DND. Calling this
      method sets #GtkIconView:reorderable to false.
  
      Params:
        targets = the table of targets that the drag will
                    support
        actions = the bitmask of possible actions for a drag to this
             widget
  */
  void enableModelDragDest(gid.gtk3.target_entry.TargetEntry[] targets, gid.gdk3.types.DragAction actions) nothrow
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    auto _targets_arr = new GtkTargetEntry[](targets.length);
    auto _targets = _targets_arr.ptr;
    foreach (i, obj; targets) _targets[i] = obj ? *cast(GtkTargetEntry*)obj._cPtr(No.Dup) : GtkTargetEntry.init;
    gtk_icon_view_enable_model_drag_dest(cast(GtkIconView*)this._cPtr, _targets, _nTargets, actions);
  }

  /**
      Turns icon_view into a drag source for automatic DND. Calling this
      method sets #GtkIconView:reorderable to false.
  
      Params:
        startButtonMask = Mask of allowed buttons to start drag
        targets = the table of targets that the drag will
                    support
        actions = the bitmask of possible actions for a drag from this
             widget
  */
  void enableModelDragSource(gid.gdk3.types.ModifierType startButtonMask, gid.gtk3.target_entry.TargetEntry[] targets, gid.gdk3.types.DragAction actions) nothrow
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    auto _targets_arr = new GtkTargetEntry[](targets.length);
    auto _targets = _targets_arr.ptr;
    foreach (i, obj; targets) _targets[i] = obj ? *cast(GtkTargetEntry*)obj._cPtr(No.Dup) : GtkTargetEntry.init;
    gtk_icon_view_enable_model_drag_source(cast(GtkIconView*)this._cPtr, startButtonMask, _targets, _nTargets, actions);
  }

  /**
      Gets the setting set by [gid.gtk4.icon_view.IconView.setActivateOnSingleClick].
      Returns: true if item-activated will be emitted on a single click
  */
  bool getActivateOnSingleClick() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_view_get_activate_on_single_click(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Fills the bounding rectangle in widget coordinates for the cell specified by
      path and cell. If cell is null the main cell area is used.
      
      This function is only valid if icon_view is realized.
  
      Params:
        path = a #GtkTreePath
        cell = a #GtkCellRenderer or null
        rect = rectangle to fill with cell rect
      Returns: false if there is no such item, true otherwise
  */
  bool getCellRect(gid.gtk3.tree_path.TreePath path, gid.gtk3.cell_renderer.CellRenderer cell, out gid.gdk3.rectangle.Rectangle rect) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_view_get_cell_rect(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, cast(GdkRectangle*)&rect);
    return _retval;
  }

  /**
      Returns the value of the ::column-spacing property.
      Returns: the space between columns
  */
  int getColumnSpacing() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_column_spacing(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the value of the ::columns property.
      Returns: the number of columns, or -1
  */
  int getColumns() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_columns(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Fills in path and cell with the current cursor path and cell.
      If the cursor isn’t currently set, then *path will be null.
      If no cell currently has focus, then *cell will be null.
      
      The returned #GtkTreePath must be freed with [gid.gtk4.tree_path.TreePath.free].
  
      Params:
        path = Return location for the current
                 cursor path, or null
        cell = Return location the current
                 focus cell, or null
      Returns: true if the cursor is set.
  */
  bool getCursor(out gid.gtk3.tree_path.TreePath path, out gid.gtk3.cell_renderer.CellRenderer cell) nothrow
  {
    bool _retval;
    GtkTreePath* _path;
    GtkCellRenderer* _cell;
    _retval = cast(bool)gtk_icon_view_get_cursor(cast(GtkIconView*)this._cPtr, &_path, &_cell);
    if (_path)
      path = new gid.gtk3.tree_path.TreePath(cast(void*)_path, Yes.Take);
    cell = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(_cell, No.Take);
    return _retval;
  }

  /**
      Determines the destination item for a given position.
  
      Params:
        dragX = the position to determine the destination item for
        dragY = the position to determine the destination item for
        path = Return location for the path of the item,
             or null.
        pos = Return location for the drop position, or null
      Returns: whether there is an item at the given position.
  */
  bool getDestItemAtPos(int dragX, int dragY, out gid.gtk3.tree_path.TreePath path, out gid.gtk3.types.IconViewDropPosition pos) nothrow
  {
    bool _retval;
    GtkTreePath* _path;
    _retval = cast(bool)gtk_icon_view_get_dest_item_at_pos(cast(GtkIconView*)this._cPtr, dragX, dragY, &_path, &pos);
    if (_path)
      path = new gid.gtk3.tree_path.TreePath(cast(void*)_path, Yes.Take);
    return _retval;
  }

  /**
      Gets information about the item that is highlighted for feedback.
  
      Params:
        path = Return location for the path of
                 the highlighted item, or null.
        pos = Return location for the drop position, or null
  */
  void getDragDestItem(out gid.gtk3.tree_path.TreePath path, out gid.gtk3.types.IconViewDropPosition pos) nothrow
  {
    GtkTreePath* _path;
    gtk_icon_view_get_drag_dest_item(cast(GtkIconView*)this._cPtr, &_path, &pos);
    if (_path)
      path = new gid.gtk3.tree_path.TreePath(cast(void*)_path, Yes.Take);
  }

  /**
      Finds the path at the point (`x`, `y`), relative to bin_window coordinates.
      In contrast to [gid.gtk4.icon_view.IconView.getPathAtPos], this function also
      obtains the cell at the specified position. The returned path should
      be freed with [gid.gtk4.tree_path.TreePath.free].
      See [gid.gtk3.icon_view.IconView.convertWidgetToBinWindowCoords] for converting
      widget coordinates to bin_window coordinates.
  
      Params:
        x = The x position to be identified
        y = The y position to be identified
        path = Return location for the path, or null
        cell = Return location for the renderer
            responsible for the cell at (`x`, `y`), or null
      Returns: true if an item exists at the specified position
  */
  bool getItemAtPos(int x, int y, out gid.gtk3.tree_path.TreePath path, out gid.gtk3.cell_renderer.CellRenderer cell) nothrow
  {
    bool _retval;
    GtkTreePath* _path;
    GtkCellRenderer* _cell;
    _retval = cast(bool)gtk_icon_view_get_item_at_pos(cast(GtkIconView*)this._cPtr, x, y, &_path, &_cell);
    if (_path)
      path = new gid.gtk3.tree_path.TreePath(cast(void*)_path, Yes.Take);
    cell = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.cell_renderer.CellRenderer)(_cell, No.Take);
    return _retval;
  }

  /**
      Gets the column in which the item path is currently
      displayed. Column numbers start at 0.
  
      Params:
        path = the #GtkTreePath of the item
      Returns: The column in which the item is displayed
  */
  int getItemColumn(gid.gtk3.tree_path.TreePath path) nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_item_column(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the value of the ::item-orientation property which determines
      whether the labels are drawn beside the icons instead of below.
      Returns: the relative position of texts and icons
  */
  gid.gtk3.types.Orientation getItemOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_icon_view_get_item_orientation(cast(GtkIconView*)this._cPtr);
    gid.gtk3.types.Orientation _retval = cast(gid.gtk3.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Returns the value of the ::item-padding property.
      Returns: the padding around items
  */
  int getItemPadding() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_item_padding(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the row in which the item path is currently
      displayed. Row numbers start at 0.
  
      Params:
        path = the #GtkTreePath of the item
      Returns: The row in which the item is displayed
  */
  int getItemRow(gid.gtk3.tree_path.TreePath path) nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_item_row(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the value of the ::item-width property.
      Returns: the width of a single item, or -1
  */
  int getItemWidth() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_item_width(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the value of the ::margin property.
      Returns: the space at the borders
  */
  int getMargin() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_margin(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the column with markup text for icon_view.
      Returns: the markup column, or -1 if it’s unset.
  */
  int getMarkupColumn() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_markup_column(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the model the #GtkIconView is based on.  Returns null if the
      model is unset.
      Returns: A #GtkTreeModel, or null if none is
            currently being used.
  */
  gid.gtk3.tree_model.TreeModel getModel() nothrow
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_icon_view_get_model(cast(GtkIconView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the path at the point (`x`, `y`), relative to bin_window coordinates.
      See [gid.gtk4.icon_view.IconView.getItemAtPos], if you are also interested in
      the cell at the specified position.
      See [gid.gtk3.icon_view.IconView.convertWidgetToBinWindowCoords] for converting
      widget coordinates to bin_window coordinates.
  
      Params:
        x = The x position to be identified
        y = The y position to be identified
      Returns: The #GtkTreePath corresponding
        to the icon or null if no icon exists at that position.
  */
  gid.gtk3.tree_path.TreePath getPathAtPos(int x, int y) nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_icon_view_get_path_at_pos(cast(GtkIconView*)this._cPtr, x, y);
    auto _retval = _cretval ? new gid.gtk3.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the column with pixbufs for icon_view.
      Returns: the pixbuf column, or -1 if it’s unset.
  */
  int getPixbufColumn() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_pixbuf_column(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the user can reorder the list via drag-and-drop.
      See [gid.gtk4.icon_view.IconView.setReorderable].
      Returns: true if the list can be reordered.
  */
  bool getReorderable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_view_get_reorderable(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the value of the ::row-spacing property.
      Returns: the space between rows
  */
  int getRowSpacing() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_row_spacing(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Creates a list of paths of all selected items. Additionally, if you are
      planning on modifying the model after calling this function, you may
      want to convert the returned list into a list of #GtkTreeRowReferences.
      To do this, you can use [gid.gtk4.tree_row_reference.TreeRowReference.new_].
      
      To free the return value, use:
      ```c
      g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
      ```
      Returns: A #GList containing a #GtkTreePath for each selected row.
  */
  gid.gtk3.tree_path.TreePath[] getSelectedItems() nothrow
  {
    GList* _cretval;
    _cretval = gtk_icon_view_get_selected_items(cast(GtkIconView*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.tree_path.TreePath, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of the icon_view.
      Returns: the current selection mode
  */
  gid.gtk3.types.SelectionMode getSelectionMode() nothrow
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_icon_view_get_selection_mode(cast(GtkIconView*)this._cPtr);
    gid.gtk3.types.SelectionMode _retval = cast(gid.gtk3.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Returns the value of the ::spacing property.
      Returns: the space between cells
  */
  int getSpacing() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_spacing(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the column with text for icon_view.
      Returns: the text column, or -1 if it’s unset.
  */
  int getTextColumn() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_text_column(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the column of icon_view’s model which is being used for
      displaying tooltips on icon_view’s rows.
      Returns: the index of the tooltip column that is currently being
        used, or -1 if this is disabled.
  */
  int getTooltipColumn() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_tooltip_column(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      This function is supposed to be used in a #GtkWidget::query-tooltip
      signal handler for #GtkIconView.  The `x`, `y` and keyboard_tip values
      which are received in the signal handler, should be passed to this
      function without modification.
      
      The return value indicates whether there is an icon view item at the given
      coordinates (true) or not (false) for mouse tooltips. For keyboard
      tooltips the item returned will be the cursor item. When true, then any of
      model, path and iter which have been provided will be set to point to
      that row and the corresponding model. `x` and `y` will always be converted
      to be relative to icon_view’s bin_window if keyboard_tooltip is false.
  
      Params:
        x = the x coordinate (relative to widget coordinates)
        y = the y coordinate (relative to widget coordinates)
        keyboardTip = whether this is a keyboard tooltip or not
        model = a pointer to receive a
                  #GtkTreeModel or null
        path = a pointer to receive a #GtkTreePath or null
        iter = a pointer to receive a #GtkTreeIter or null
      Returns: whether or not the given tooltip context points to a item
  */
  bool getTooltipContext(ref int x, ref int y, bool keyboardTip, out gid.gtk3.tree_model.TreeModel model, out gid.gtk3.tree_path.TreePath path, out gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    bool _retval;
    GtkTreeModel* _model;
    GtkTreePath* _path;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_icon_view_get_tooltip_context(cast(GtkIconView*)this._cPtr, cast(int*)&x, cast(int*)&y, keyboardTip, &_model, &_path, _iter);
    model = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(_model, No.Take);
    if (_path)
      path = new gid.gtk3.tree_path.TreePath(cast(void*)_path, Yes.Take);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Sets start_path and end_path to be the first and last visible path.
      Note that there may be invisible paths in between.
      
      Both paths should be freed with [gid.gtk4.tree_path.TreePath.free] after use.
  
      Params:
        startPath = Return location for start of region,
                       or null
        endPath = Return location for end of region, or null
      Returns: true, if valid paths were placed in start_path and end_path
  */
  bool getVisibleRange(out gid.gtk3.tree_path.TreePath startPath, out gid.gtk3.tree_path.TreePath endPath) nothrow
  {
    bool _retval;
    GtkTreePath* _startPath;
    GtkTreePath* _endPath;
    _retval = cast(bool)gtk_icon_view_get_visible_range(cast(GtkIconView*)this._cPtr, &_startPath, &_endPath);
    if (_startPath)
      startPath = new gid.gtk3.tree_path.TreePath(cast(void*)_startPath, Yes.Take);
    if (_endPath)
      endPath = new gid.gtk3.tree_path.TreePath(cast(void*)_endPath, Yes.Take);
    return _retval;
  }

  /**
      Activates the item determined by path.
  
      Params:
        path = The #GtkTreePath to be activated
  */
  void itemActivated(gid.gtk3.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_item_activated(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Returns true if the icon pointed to by path is currently
      selected. If path does not point to a valid location, false is returned.
  
      Params:
        path = A #GtkTreePath to check selection on.
      Returns: true if path is selected.
  */
  bool pathIsSelected(gid.gtk3.tree_path.TreePath path) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_view_path_is_selected(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves the alignments of icon_view to the position specified by path.
      row_align determines where the row is placed, and col_align determines
      where column is placed.  Both are expected to be between 0.0 and 1.0.
      0.0 means left/top alignment, 1.0 means right/bottom alignment, 0.5 means
      center.
      
      If use_align is false, then the alignment arguments are ignored, and the
      tree does the minimum amount of work to scroll the item onto the screen.
      This means that the item will be scrolled to the edge closest to its current
      position.  If the item is currently visible on the screen, nothing is done.
      
      This function only works if the model is set, and path is a valid row on
      the model. If the model changes before the icon_view is realized, the
      centered path will be modified to reflect this change.
  
      Params:
        path = The path of the item to move to.
        useAlign = whether to use alignment arguments, or false.
        rowAlign = The vertical alignment of the item specified by path.
        colAlign = The horizontal alignment of the item specified by path.
  */
  void scrollToPath(gid.gtk3.tree_path.TreePath path, bool useAlign, float rowAlign, float colAlign) nothrow
  {
    gtk_icon_view_scroll_to_path(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, useAlign, rowAlign, colAlign);
  }

  /**
      Selects all the icons. icon_view must has its selection mode set
      to #GTK_SELECTION_MULTIPLE.
  */
  void selectAll() nothrow
  {
    gtk_icon_view_select_all(cast(GtkIconView*)this._cPtr);
  }

  /**
      Selects the row at path.
  
      Params:
        path = The #GtkTreePath to be selected.
  */
  void selectPath(gid.gtk3.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_select_path(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected icon. Note that the model or
      selection cannot be modified from within this function.
  
      Params:
        func = The function to call for each selected icon.
  */
  void selectedForeach(gid.gtk3.types.IconViewForeachFunc func) nothrow
  {
    extern(C) void _funcCallback(GtkIconView* iconView, GtkTreePath* path, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.IconViewForeachFunc*)data;
      auto _path = path ? new gid.gtk3.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView, No.Take), _path);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.IconViewForeachFunc");
      }
      if (_path)
        _path._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_icon_view_selected_foreach(cast(GtkIconView*)this._cPtr, _funcCB, _func);
  }

  /**
      Causes the #GtkIconView::item-activated signal to be emitted on
      a single click instead of a double click.
  
      Params:
        single = true to emit item-activated on a single click
  */
  void setActivateOnSingleClick(bool single) nothrow
  {
    gtk_icon_view_set_activate_on_single_click(cast(GtkIconView*)this._cPtr, single);
  }

  /**
      Sets the ::column-spacing property which specifies the space
      which is inserted between the columns of the icon view.
  
      Params:
        columnSpacing = the column spacing
  */
  void setColumnSpacing(int columnSpacing) nothrow
  {
    gtk_icon_view_set_column_spacing(cast(GtkIconView*)this._cPtr, columnSpacing);
  }

  /**
      Sets the ::columns property which determines in how
      many columns the icons are arranged. If columns is
      -1, the number of columns will be chosen automatically
      to fill the available area.
  
      Params:
        columns = the number of columns
  */
  void setColumns(int columns) nothrow
  {
    gtk_icon_view_set_columns(cast(GtkIconView*)this._cPtr, columns);
  }

  /**
      Sets the current keyboard focus to be at path, and selects it.  This is
      useful when you want to focus the user’s attention on a particular item.
      If cell is not null, then focus is given to the cell specified by
      it. Additionally, if start_editing is true, then editing should be
      started in the specified cell.
      
      This function is often followed by `gtk_widget_grab_focus
      (icon_view)` in order to give keyboard focus to the widget.
      Please note that editing can only happen when the widget is realized.
  
      Params:
        path = A #GtkTreePath
        cell = One of the cell renderers of icon_view, or null
        startEditing = true if the specified cell should start being edited.
  */
  void setCursor(gid.gtk3.tree_path.TreePath path, gid.gtk3.cell_renderer.CellRenderer cell, bool startEditing) nothrow
  {
    gtk_icon_view_set_cursor(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, startEditing);
  }

  /**
      Sets the item that is highlighted for feedback.
  
      Params:
        path = The path of the item to highlight, or null.
        pos = Specifies where to drop, relative to the item
  */
  void setDragDestItem(gid.gtk3.tree_path.TreePath path, gid.gtk3.types.IconViewDropPosition pos) nothrow
  {
    gtk_icon_view_set_drag_dest_item(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, pos);
  }

  /**
      Sets the ::item-orientation property which determines whether the labels
      are drawn beside the icons instead of below.
  
      Params:
        orientation = the relative position of texts and icons
  */
  void setItemOrientation(gid.gtk3.types.Orientation orientation) nothrow
  {
    gtk_icon_view_set_item_orientation(cast(GtkIconView*)this._cPtr, orientation);
  }

  /**
      Sets the #GtkIconView:item-padding property which specifies the padding
      around each of the icon view’s items.
  
      Params:
        itemPadding = the item padding
  */
  void setItemPadding(int itemPadding) nothrow
  {
    gtk_icon_view_set_item_padding(cast(GtkIconView*)this._cPtr, itemPadding);
  }

  /**
      Sets the ::item-width property which specifies the width
      to use for each item. If it is set to -1, the icon view will
      automatically determine a suitable item size.
  
      Params:
        itemWidth = the width for each item
  */
  void setItemWidth(int itemWidth) nothrow
  {
    gtk_icon_view_set_item_width(cast(GtkIconView*)this._cPtr, itemWidth);
  }

  /**
      Sets the ::margin property which specifies the space
      which is inserted at the top, bottom, left and right
      of the icon view.
  
      Params:
        margin = the margin
  */
  void setMargin(int margin) nothrow
  {
    gtk_icon_view_set_margin(cast(GtkIconView*)this._cPtr, margin);
  }

  /**
      Sets the column with markup information for icon_view to be
      column. The markup column must be of type #G_TYPE_STRING.
      If the markup column is set to something, it overrides
      the text column set by [gid.gtk4.icon_view.IconView.setTextColumn].
  
      Params:
        column = A column in the currently used model, or -1 to display no text
  */
  void setMarkupColumn(int column) nothrow
  {
    gtk_icon_view_set_markup_column(cast(GtkIconView*)this._cPtr, column);
  }

  /**
      Sets the model for a #GtkIconView.
      If the icon_view already has a model set, it will remove
      it before setting the new model.  If model is null, then
      it will unset the old model.
  
      Params:
        model = The model.
  */
  void setModel(gid.gtk3.tree_model.TreeModel model = null) nothrow
  {
    gtk_icon_view_set_model(cast(GtkIconView*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets the column with pixbufs for icon_view to be column. The pixbuf
      column must be of type #GDK_TYPE_PIXBUF
  
      Params:
        column = A column in the currently used model, or -1 to disable
  */
  void setPixbufColumn(int column) nothrow
  {
    gtk_icon_view_set_pixbuf_column(cast(GtkIconView*)this._cPtr, column);
  }

  /**
      This function is a convenience function to allow you to reorder models that
      support the #GtkTreeDragSourceIface and the #GtkTreeDragDestIface.  Both
      #GtkTreeStore and #GtkListStore support these.  If reorderable is true, then
      the user can reorder the model by dragging and dropping rows.  The
      developer can listen to these changes by connecting to the model's
      row_inserted and row_deleted signals. The reordering is implemented by setting up
      the icon view as a drag source and destination. Therefore, drag and
      drop can not be used in a reorderable view for any other purpose.
      
      This function does not give you any degree of control over the order -- any
      reordering is allowed.  If more control is needed, you should probably
      handle drag and drop manually.
  
      Params:
        reorderable = true, if the list of items can be reordered.
  */
  void setReorderable(bool reorderable) nothrow
  {
    gtk_icon_view_set_reorderable(cast(GtkIconView*)this._cPtr, reorderable);
  }

  /**
      Sets the ::row-spacing property which specifies the space
      which is inserted between the rows of the icon view.
  
      Params:
        rowSpacing = the row spacing
  */
  void setRowSpacing(int rowSpacing) nothrow
  {
    gtk_icon_view_set_row_spacing(cast(GtkIconView*)this._cPtr, rowSpacing);
  }

  /**
      Sets the selection mode of the icon_view.
  
      Params:
        mode = The selection mode
  */
  void setSelectionMode(gid.gtk3.types.SelectionMode mode) nothrow
  {
    gtk_icon_view_set_selection_mode(cast(GtkIconView*)this._cPtr, mode);
  }

  /**
      Sets the ::spacing property which specifies the space
      which is inserted between the cells (i.e. the icon and
      the text) of an item.
  
      Params:
        spacing = the spacing
  */
  void setSpacing(int spacing) nothrow
  {
    gtk_icon_view_set_spacing(cast(GtkIconView*)this._cPtr, spacing);
  }

  /**
      Sets the column with text for icon_view to be column. The text
      column must be of type #G_TYPE_STRING.
  
      Params:
        column = A column in the currently used model, or -1 to display no text
  */
  void setTextColumn(int column) nothrow
  {
    gtk_icon_view_set_text_column(cast(GtkIconView*)this._cPtr, column);
  }

  /**
      Sets the tip area of tooltip to the area which cell occupies in
      the item pointed to by path. See also [gid.gtk4.tooltip.Tooltip.setTipArea].
      
      See also [gid.gtk4.icon_view.IconView.setTooltipColumn] for a simpler alternative.
  
      Params:
        tooltip = a #GtkTooltip
        path = a #GtkTreePath
        cell = a #GtkCellRenderer or null
  */
  void setTooltipCell(gid.gtk3.tooltip.Tooltip tooltip, gid.gtk3.tree_path.TreePath path, gid.gtk3.cell_renderer.CellRenderer cell = null) nothrow
  {
    gtk_icon_view_set_tooltip_cell(cast(GtkIconView*)this._cPtr, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null);
  }

  /**
      If you only plan to have simple (text-only) tooltips on full items, you
      can use this function to have #GtkIconView handle these automatically
      for you. column should be set to the column in icon_view’s model
      containing the tooltip texts, or -1 to disable this feature.
      
      When enabled, #GtkWidget:has-tooltip will be set to true and
      icon_view will connect a #GtkWidget::query-tooltip signal handler.
      
      Note that the signal handler sets the text with [gid.gtk4.tooltip.Tooltip.setMarkup],
      so &, <, etc have to be escaped in the text.
  
      Params:
        column = an integer, which is a valid column number for icon_view’s model
  */
  void setTooltipColumn(int column) nothrow
  {
    gtk_icon_view_set_tooltip_column(cast(GtkIconView*)this._cPtr, column);
  }

  /**
      Sets the tip area of tooltip to be the area covered by the item at path.
      See also [gid.gtk4.icon_view.IconView.setTooltipColumn] for a simpler alternative.
      See also [gid.gtk4.tooltip.Tooltip.setTipArea].
  
      Params:
        tooltip = a #GtkTooltip
        path = a #GtkTreePath
  */
  void setTooltipItem(gid.gtk3.tooltip.Tooltip tooltip, gid.gtk3.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_set_tooltip_item(cast(GtkIconView*)this._cPtr, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Unselects all the icons.
  */
  void unselectAll() nothrow
  {
    gtk_icon_view_unselect_all(cast(GtkIconView*)this._cPtr);
  }

  /**
      Unselects the row at path.
  
      Params:
        path = The #GtkTreePath to be unselected.
  */
  void unselectPath(gid.gtk3.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_unselect_path(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Undoes the effect of [gid.gtk4.icon_view.IconView.enableModelDragDest]. Calling this
      method sets #GtkIconView:reorderable to false.
  */
  void unsetModelDragDest() nothrow
  {
    gtk_icon_view_unset_model_drag_dest(cast(GtkIconView*)this._cPtr);
  }

  /**
      Undoes the effect of [gid.gtk4.icon_view.IconView.enableModelDragSource]. Calling this
      method sets #GtkIconView:reorderable to false.
  */
  void unsetModelDragSource() nothrow
  {
    gtk_icon_view_unset_model_drag_source(cast(GtkIconView*)this._cPtr);
  }

  /**
      Connect to `ActivateCursorItem` signal.
  
      A [keybinding signal][GtkBindingSignal]
        which gets emitted when the user activates the currently
        focused item.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control activation
        programmatically.
        
        The default bindings for this signal are Space, Return and Enter.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateCursorItem(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.activateCursorItem");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-cursor-item", closure, after);
  }

  /**
      Connect to `ItemActivated` signal.
  
      The ::item-activated signal is emitted when the method
        [gid.gtk4.icon_view.IconView.itemActivated] is called, when the user double
        clicks an item with the "activate-on-single-click" property set
        to false, or when the user single clicks an item when the
        "activate-on-single-click" property set to true. It is also
        emitted when a non-editable item is selected and one of the keys:
        Space, Return or Enter is pressed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.tree_path.TreePath path, gid.gtk3.icon_view.IconView iconView)`
  
          `path` the #GtkTreePath for the activated item (optional)
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectItemActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.itemActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("item-activated", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      The ::move-cursor signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a cursor movement.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        The default bindings for this signal include
        - Arrow keys which move by individual steps
        - Home/End keys which move to the first/last item
        - PageUp/PageDown which move by "pages"
        All of these will extend the selection when combined with
        the Shift modifier.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.MovementStep step, int count, gid.gtk3.icon_view.IconView iconView)`
  
          `step` the granularity of the move, as a #GtkMovementStep (optional)
  
          `count` the number of step units to move (optional)
  
          `iconView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.moveCursor");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      A [keybinding signal][GtkBindingSignal]
        which gets emitted when the user selects all items.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        The default binding for this signal is Ctrl-a.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.selectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SelectCursorItem` signal.
  
      A [keybinding signal][GtkBindingSignal]
        which gets emitted when the user selects the item that is currently
        focused.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        There is no default binding for this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectCursorItem(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.selectCursorItem");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-cursor-item", closure, after);
  }

  /**
      Connect to `SelectionChanged` signal.
  
      The ::selection-changed signal is emitted when the selection
        (i.e. the set of selected items) changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.selectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /**
      Connect to `ToggleCursorItem` signal.
  
      A [keybinding signal][GtkBindingSignal]
        which gets emitted when the user toggles whether the currently
        focused item is selected or not. The exact effect of this
        depend on the selection mode.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        There is no default binding for this signal is Ctrl-Space.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleCursorItem(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.toggleCursorItem");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-item", closure, after);
  }

  /**
      Connect to `UnselectAll` signal.
  
      A [keybinding signal][GtkBindingSignal]
        which gets emitted when the user unselects all items.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        The default binding for this signal is Ctrl-Shift-a.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.unselectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from IconView
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.icon_view.IconView), T.stringof ~ " is not derived from gid.gtk3.icon_view.IconView");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateCursorItem", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "activate_cursor_item");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncItemActivated", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "item_activated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCursor", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "move_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectAll", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "select_all");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectCursorItem", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "select_cursor_item");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionChanged", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "selection_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleCursorItem", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "toggle_cursor_item");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnselectAll", true)[0]) == gid.gtk3.icon_view.IconView))
      _installVfunc(klass, "unselect_all");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkIconViewClass*)klass;

    switch (vfunc)
    {
      case "activate_cursor_item":
      {
        static extern(C) gboolean _vfuncActivateCursorItemTramp(GtkIconView* iconView) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.activateCursorItem)
              return (cast(typeof(&_vfuncActivateCursorItemTramp))_klass.activateCursorItem)(iconView);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncActivateCursorItem();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncActivateCursorItem");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.activateCursorItem = cast(typeof(_klass.activateCursorItem))&_vfuncActivateCursorItemTramp;
        break;
      }
      case "item_activated":
      {
        static extern(C) void _vfuncItemActivatedTramp(GtkIconView* iconView, GtkTreePath* path) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.itemActivated)
              return (cast(typeof(&_vfuncItemActivatedTramp))_klass.itemActivated)(iconView, path);
            return;
          }

          auto _path = path ? new gid.gtk3.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncItemActivated(_path);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncItemActivated");
          }
          if (_path)
            _path._cUnborrow;

        }

        _klass.itemActivated = cast(typeof(_klass.itemActivated))&_vfuncItemActivatedTramp;
        break;
      }
      case "move_cursor":
      {
        static extern(C) gboolean _vfuncMoveCursorTramp(GtkIconView* iconView, GtkMovementStep step, int count) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.moveCursor)
              return (cast(typeof(&_vfuncMoveCursorTramp))_klass.moveCursor)(iconView, step, count);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncMoveCursor(step, count);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncMoveCursor");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.moveCursor = cast(typeof(_klass.moveCursor))&_vfuncMoveCursorTramp;
        break;
      }
      case "select_all":
      {
        static extern(C) void _vfuncSelectAllTramp(GtkIconView* iconView) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.selectAll)
              return (cast(typeof(&_vfuncSelectAllTramp))_klass.selectAll)(iconView);
            return;
          }

          try
          {
            _obj.vfuncSelectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncSelectAll");
          }
        }

        _klass.selectAll = cast(typeof(_klass.selectAll))&_vfuncSelectAllTramp;
        break;
      }
      case "select_cursor_item":
      {
        static extern(C) void _vfuncSelectCursorItemTramp(GtkIconView* iconView) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.selectCursorItem)
              return (cast(typeof(&_vfuncSelectCursorItemTramp))_klass.selectCursorItem)(iconView);
            return;
          }

          try
          {
            _obj.vfuncSelectCursorItem();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncSelectCursorItem");
          }
        }

        _klass.selectCursorItem = cast(typeof(_klass.selectCursorItem))&_vfuncSelectCursorItemTramp;
        break;
      }
      case "selection_changed":
      {
        static extern(C) void _vfuncSelectionChangedTramp(GtkIconView* iconView) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.selectionChanged)
              return (cast(typeof(&_vfuncSelectionChangedTramp))_klass.selectionChanged)(iconView);
            return;
          }

          try
          {
            _obj.vfuncSelectionChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncSelectionChanged");
          }
        }

        _klass.selectionChanged = cast(typeof(_klass.selectionChanged))&_vfuncSelectionChangedTramp;
        break;
      }
      case "toggle_cursor_item":
      {
        static extern(C) void _vfuncToggleCursorItemTramp(GtkIconView* iconView) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.toggleCursorItem)
              return (cast(typeof(&_vfuncToggleCursorItemTramp))_klass.toggleCursorItem)(iconView);
            return;
          }

          try
          {
            _obj.vfuncToggleCursorItem();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncToggleCursorItem");
          }
        }

        _klass.toggleCursorItem = cast(typeof(_klass.toggleCursorItem))&_vfuncToggleCursorItemTramp;
        break;
      }
      case "unselect_all":
      {
        static extern(C) void _vfuncUnselectAllTramp(GtkIconView* iconView) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.icon_view.IconView)(cast(void*)iconView);
          if (!_obj)
          {
            auto _klass = cast(GtkIconViewClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)iconView);
            if (_klass.unselectAll)
              return (cast(typeof(&_vfuncUnselectAllTramp))_klass.unselectAll)(iconView);
            return;
          }

          try
          {
            _obj.vfuncUnselectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.icon_view.IconView.vfuncUnselectAll");
          }
        }

        _klass.unselectAll = cast(typeof(_klass.unselectAll))&_vfuncUnselectAllTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.icon_view.IconView]
class IconViewGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T, gid.gtk3.cell_layout.CellLayoutGidBuilderImpl!T, gid.gtk3.scrollable.ScrollableGidBuilderImpl!T
{

  mixin CellLayoutGidBuilderT!();
  mixin ScrollableGidBuilderT!();

  /**
      Set `activateOnSingleClick` property.
      Params:
        propval = The activate-on-single-click property specifies whether the "item-activated" signal
          will be emitted after a single click.
      Returns: Builder instance for fluent chaining
  */
  T activateOnSingleClick(bool propval) nothrow
  {
    return setProperty("activate-on-single-click", propval);
  }

  /**
      Set `cellArea` property.
      Params:
        propval = The #GtkCellArea used to layout cell renderers for this view.
          
          If no area is specified when creating the icon view with [gid.gtk4.icon_view.IconView.newWithArea]
          a #GtkCellAreaBox will be used.
      Returns: Builder instance for fluent chaining
  */
  T cellArea(gid.gtk3.cell_area.CellArea propval) nothrow
  {
    return setProperty("cell-area", propval);
  }

  /**
      Set `columnSpacing` property.
      Params:
        propval = The column-spacing property specifies the space which is inserted between
          the columns of the icon view.
      Returns: Builder instance for fluent chaining
  */
  T columnSpacing(int propval) nothrow
  {
    return setProperty("column-spacing", propval);
  }

  /**
      Set `columns` property.
      Params:
        propval = The columns property contains the number of the columns in which the
          items should be displayed. If it is -1, the number of columns will
          be chosen automatically to fill the available area.
      Returns: Builder instance for fluent chaining
  */
  T columns(int propval) nothrow
  {
    return setProperty("columns", propval);
  }

  /**
      Set `itemOrientation` property.
      Params:
        propval = The item-orientation property specifies how the cells (i.e. the icon and
          the text) of the item are positioned relative to each other.
      Returns: Builder instance for fluent chaining
  */
  T itemOrientation(gid.gtk3.types.Orientation propval) nothrow
  {
    return setProperty("item-orientation", propval);
  }

  /**
      Set `itemPadding` property.
      Params:
        propval = The item-padding property specifies the padding around each
          of the icon view's item.
      Returns: Builder instance for fluent chaining
  */
  T itemPadding(int propval) nothrow
  {
    return setProperty("item-padding", propval);
  }

  /**
      Set `itemWidth` property.
      Params:
        propval = The item-width property specifies the width to use for each item.
          If it is set to -1, the icon view will automatically determine a
          suitable item size.
      Returns: Builder instance for fluent chaining
  */
  T itemWidth(int propval) nothrow
  {
    return setProperty("item-width", propval);
  }

  /**
      Set `margin` property.
      Params:
        propval = The margin property specifies the space which is inserted
          at the edges of the icon view.
      Returns: Builder instance for fluent chaining
  */
  override T margin(int propval) nothrow
  {
    return setProperty("margin", propval);
  }

  /**
      Set `markupColumn` property.
      Params:
        propval = The ::markup-column property contains the number of the model column
          containing markup information to be displayed. The markup column must be
          of type #G_TYPE_STRING. If this property and the :text-column property
          are both set to column numbers, it overrides the text column.
          If both are set to -1, no texts are displayed.
      Returns: Builder instance for fluent chaining
  */
  T markupColumn(int propval) nothrow
  {
    return setProperty("markup-column", propval);
  }

  /** */
  T model(gid.gtk3.tree_model.TreeModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `pixbufColumn` property.
      Params:
        propval = The ::pixbuf-column property contains the number of the model column
          containing the pixbufs which are displayed. The pixbuf column must be
          of type #GDK_TYPE_PIXBUF. Setting this property to -1 turns off the
          display of pixbufs.
      Returns: Builder instance for fluent chaining
  */
  T pixbufColumn(int propval) nothrow
  {
    return setProperty("pixbuf-column", propval);
  }

  /**
      Set `reorderable` property.
      Params:
        propval = The reorderable property specifies if the items can be reordered
          by DND.
      Returns: Builder instance for fluent chaining
  */
  T reorderable(bool propval) nothrow
  {
    return setProperty("reorderable", propval);
  }

  /**
      Set `rowSpacing` property.
      Params:
        propval = The row-spacing property specifies the space which is inserted between
          the rows of the icon view.
      Returns: Builder instance for fluent chaining
  */
  T rowSpacing(int propval) nothrow
  {
    return setProperty("row-spacing", propval);
  }

  /**
      Set `selectionMode` property.
      Params:
        propval = The ::selection-mode property specifies the selection mode of
          icon view. If the mode is #GTK_SELECTION_MULTIPLE, rubberband selection
          is enabled, for the other modes, only keyboard selection is possible.
      Returns: Builder instance for fluent chaining
  */
  T selectionMode(gid.gtk3.types.SelectionMode propval) nothrow
  {
    return setProperty("selection-mode", propval);
  }

  /**
      Set `spacing` property.
      Params:
        propval = The spacing property specifies the space which is inserted between
          the cells (i.e. the icon and the text) of an item.
      Returns: Builder instance for fluent chaining
  */
  T spacing(int propval) nothrow
  {
    return setProperty("spacing", propval);
  }

  /**
      Set `textColumn` property.
      Params:
        propval = The ::text-column property contains the number of the model column
          containing the texts which are displayed. The text column must be
          of type #G_TYPE_STRING. If this property and the :markup-column
          property are both set to -1, no texts are displayed.
      Returns: Builder instance for fluent chaining
  */
  T textColumn(int propval) nothrow
  {
    return setProperty("text-column", propval);
  }

  /** */
  T tooltipColumn(int propval) nothrow
  {
    return setProperty("tooltip-column", propval);
  }
}

/// Fluent builder for [gid.gtk3.icon_view.IconView]
final class IconViewGidBuilder : IconViewGidBuilderImpl!IconViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  IconView build() nothrow
  {
    return new IconView(cast(void*)createGObject(IconView._getGType), Yes.Take);
  }
}
