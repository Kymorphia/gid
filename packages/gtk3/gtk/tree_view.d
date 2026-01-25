/// Module for [TreeView] class
module gtk.tree_view;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import cairo.surface;
import gdk.rectangle;
import gdk.types;
import gdk.window;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_renderer;
import gtk.container;
import gtk.entry;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.target_entry;
import gtk.tooltip;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_path;
import gtk.tree_selection;
import gtk.tree_view_column;
import gtk.types;
import gtk.widget;

/**
    Widget that displays any object that implements the #GtkTreeModel interface.
    
    Please refer to the
    [tree widget conceptual overview](TreeWidget.html)
    for an overview of all the objects and data types related
    to the tree widget and how they work together.
    
    Several different coordinate systems are exposed in the GtkTreeView API.
    These are:
    
    ![](tree-view-coordinates.png)
    
    Coordinate systems in GtkTreeView API:
    
    $(LIST
      * Widget coordinates: Coordinates relative to the widget (usually `widget->window`).
      
      * Bin window coordinates: Coordinates relative to the window that GtkTreeView renders to.
      
      * Tree coordinates: Coordinates relative to the entire scrollable area of GtkTreeView. These
        coordinates start at (0, 0) for row 0 of the tree.
    )
      
    Several functions are available for converting between the different
    coordinate systems.  The most common translations are between widget and bin
    window coordinates and between bin window and tree coordinates. For the
    former you can use [gtk.tree_view.TreeView.convertWidgetToBinWindowCoords]
    (and vice versa), for the latter [gtk.tree_view.TreeView.convertBinWindowToTreeCoords]
    (and vice versa).
    
    # GtkTreeView as GtkBuildable
    
    The GtkTreeView implementation of the GtkBuildable interface accepts
    #GtkTreeViewColumn objects as `<child>` elements and exposes the internal
    #GtkTreeSelection in UI definitions.
    
    An example of a UI definition fragment with GtkTreeView:
    
    ```xml
    <object class="GtkTreeView" id="treeview">
      <property name="model">liststore1</property>
      <child>
        <object class="GtkTreeViewColumn" id="test-column">
          <property name="title">Test</property>
          <child>
            <object class="GtkCellRendererText" id="test-renderer"/>
            <attributes>
              <attribute name="text">1</attribute>
            </attributes>
          </child>
        </object>
      </child>
      <child internal-child="selection">
        <object class="GtkTreeSelection" id="selection">
          <signal name="changed" handler="on_treeview_selection_changed"/>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    treeview.view
    ├── header
    │   ├── <column header>
    ┊   ┊
    │   ╰── <column header>
    │
    ╰── [rubberband]
    ```
    
    GtkTreeView has a main CSS node with name treeview and style class .view.
    It has a subnode with name header, which is the parent for all the column
    header widgets' CSS nodes.
    For rubberband selection, a subnode with name rubberband is used.
*/
class TreeView : gtk.container.Container, gtk.scrollable.Scrollable
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
    return cast(void function())gtk_tree_view_get_type != &gidSymbolNotFound ? gtk_tree_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeView self()
  {
    return this;
  }

  /**
      Get `activateOnSingleClick` property.
      Returns: The activate-on-single-click property specifies whether the "row-activated" signal
        will be emitted after a single click.
  */
  @property bool activateOnSingleClick()
  {
    return getActivateOnSingleClick();
  }

  /**
      Set `activateOnSingleClick` property.
      Params:
        propval = The activate-on-single-click property specifies whether the "row-activated" signal
          will be emitted after a single click.
  */
  @property void activateOnSingleClick(bool propval)
  {
    return setActivateOnSingleClick(propval);
  }

  /** */
  @property gtk.types.TreeViewGridLines enableGridLines()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.TreeViewGridLines)("enable-grid-lines");
  }

  /** */
  @property void enableGridLines(gtk.types.TreeViewGridLines propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.TreeViewGridLines)("enable-grid-lines", propval);
  }

  /** */
  @property bool enableSearch()
  {
    return getEnableSearch();
  }

  /** */
  @property void enableSearch(bool propval)
  {
    return setEnableSearch(propval);
  }

  /** */
  @property bool enableTreeLines()
  {
    return getEnableTreeLines();
  }

  /** */
  @property void enableTreeLines(bool propval)
  {
    return setEnableTreeLines(propval);
  }

  /** */
  @property gtk.tree_view_column.TreeViewColumn expanderColumn()
  {
    return getExpanderColumn();
  }

  /** */
  @property void expanderColumn(gtk.tree_view_column.TreeViewColumn propval)
  {
    return setExpanderColumn(propval);
  }

  /**
      Get `fixedHeightMode` property.
      Returns: Setting the ::fixed-height-mode property to true speeds up
        #GtkTreeView by assuming that all rows have the same height.
        Only enable this option if all rows are the same height.
        Please see [gtk.tree_view.TreeView.setFixedHeightMode] for more
        information on this option.
  */
  @property bool fixedHeightMode()
  {
    return getFixedHeightMode();
  }

  /**
      Set `fixedHeightMode` property.
      Params:
        propval = Setting the ::fixed-height-mode property to true speeds up
          #GtkTreeView by assuming that all rows have the same height.
          Only enable this option if all rows are the same height.
          Please see [gtk.tree_view.TreeView.setFixedHeightMode] for more
          information on this option.
  */
  @property void fixedHeightMode(bool propval)
  {
    return setFixedHeightMode(propval);
  }

  /** */
  @property bool headersClickable()
  {
    return getHeadersClickable();
  }

  /** */
  @property void headersClickable(bool propval)
  {
    return setHeadersClickable(propval);
  }

  /** */
  @property bool headersVisible()
  {
    return getHeadersVisible();
  }

  /** */
  @property void headersVisible(bool propval)
  {
    return setHeadersVisible(propval);
  }

  /**
      Get `hoverExpand` property.
      Returns: Enables or disables the hover expansion mode of @tree_view.
        Hover expansion makes rows expand or collapse if the pointer moves
        over them.
        
        This mode is primarily intended for treeviews in popups, e.g.
        in #GtkComboBox or #GtkEntryCompletion.
  */
  @property bool hoverExpand()
  {
    return getHoverExpand();
  }

  /**
      Set `hoverExpand` property.
      Params:
        propval = Enables or disables the hover expansion mode of @tree_view.
          Hover expansion makes rows expand or collapse if the pointer moves
          over them.
          
          This mode is primarily intended for treeviews in popups, e.g.
          in #GtkComboBox or #GtkEntryCompletion.
  */
  @property void hoverExpand(bool propval)
  {
    return setHoverExpand(propval);
  }

  /**
      Get `hoverSelection` property.
      Returns: Enables or disables the hover selection mode of @tree_view.
        Hover selection makes the selected row follow the pointer.
        Currently, this works only for the selection modes
        [gtk.types.SelectionMode.Single] and [gtk.types.SelectionMode.Browse].
        
        This mode is primarily intended for treeviews in popups, e.g.
        in #GtkComboBox or #GtkEntryCompletion.
  */
  @property bool hoverSelection()
  {
    return getHoverSelection();
  }

  /**
      Set `hoverSelection` property.
      Params:
        propval = Enables or disables the hover selection mode of @tree_view.
          Hover selection makes the selected row follow the pointer.
          Currently, this works only for the selection modes
          [gtk.types.SelectionMode.Single] and [gtk.types.SelectionMode.Browse].
          
          This mode is primarily intended for treeviews in popups, e.g.
          in #GtkComboBox or #GtkEntryCompletion.
  */
  @property void hoverSelection(bool propval)
  {
    return setHoverSelection(propval);
  }

  /**
      Get `levelIndentation` property.
      Returns: Extra indentation for each level.
  */
  @property int levelIndentation()
  {
    return getLevelIndentation();
  }

  /**
      Set `levelIndentation` property.
      Params:
        propval = Extra indentation for each level.
  */
  @property void levelIndentation(int propval)
  {
    return setLevelIndentation(propval);
  }

  /** */
  @property gtk.tree_model.TreeModel model()
  {
    return getModel();
  }

  /** */
  @property void model(gtk.tree_model.TreeModel propval)
  {
    return setModel(propval);
  }

  /** */
  @property bool reorderable()
  {
    return getReorderable();
  }

  /** */
  @property void reorderable(bool propval)
  {
    return setReorderable(propval);
  }

  /** */
  @property bool rubberBanding()
  {
    return getRubberBanding();
  }

  /** */
  @property void rubberBanding(bool propval)
  {
    return setRubberBanding(propval);
  }

  /**
      Get `rulesHint` property.
      Returns: Sets a hint to the theme to draw rows in alternating colors.
  
      Deprecated: The theme is responsible for drawing rows
          using zebra striping
  */
  @property bool rulesHint()
  {
    return getRulesHint();
  }

  /**
      Set `rulesHint` property.
      Params:
        propval = Sets a hint to the theme to draw rows in alternating colors.
  
      Deprecated: The theme is responsible for drawing rows
          using zebra striping
  */
  @property void rulesHint(bool propval)
  {
    return setRulesHint(propval);
  }

  /** */
  @property int searchColumn()
  {
    return getSearchColumn();
  }

  /** */
  @property void searchColumn(int propval)
  {
    return setSearchColumn(propval);
  }

  /**
      Get `showExpanders` property.
      Returns: true if the view has expanders.
  */
  @property bool showExpanders()
  {
    return getShowExpanders();
  }

  /**
      Set `showExpanders` property.
      Params:
        propval = true if the view has expanders.
  */
  @property void showExpanders(bool propval)
  {
    return setShowExpanders(propval);
  }

  /** */
  @property int tooltipColumn()
  {
    return getTooltipColumn();
  }

  /** */
  @property void tooltipColumn(int propval)
  {
    return setTooltipColumn(propval);
  }

  /** */
  @property void ubuntuAlmostFixedHeightMode(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("ubuntu-almost-fixed-height-mode", propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new #GtkTreeView widget.
      Returns: A newly created #GtkTreeView widget.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkTreeView widget with the model initialized to model.
  
      Params:
        model = the model.
      Returns: A newly created #GtkTreeView widget.
  */
  static gtk.tree_view.TreeView newWithModel(gtk.tree_model.TreeModel model)
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_view_new_with_model(model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_view.TreeView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Appends column to the list of columns. If tree_view has “fixed_height”
      mode enabled, then column must have its “sizing” property set to be
      GTK_TREE_VIEW_COLUMN_FIXED.
  
      Params:
        column = The #GtkTreeViewColumn to add.
      Returns: The number of columns in tree_view after appending.
  */
  int appendColumn(gtk.tree_view_column.TreeViewColumn column)
  {
    int _retval;
    _retval = gtk_tree_view_append_column(cast(GtkTreeView*)this._cPtr, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Recursively collapses all visible, expanded nodes in tree_view.
  */
  void collapseAll()
  {
    gtk_tree_view_collapse_all(cast(GtkTreeView*)this._cPtr);
  }

  /**
      Collapses a row (hides its child rows, if they exist).
  
      Params:
        path = path to a row in the tree_view
      Returns: true if the row was collapsed.
  */
  bool collapseRow(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_collapse_row(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Resizes all columns to their optimal width. Only works after the
      treeview has been realized.
  */
  void columnsAutosize()
  {
    gtk_tree_view_columns_autosize(cast(GtkTreeView*)this._cPtr);
  }

  /**
      Converts bin_window coordinates to coordinates for the
      tree (the full scrollable area of the tree).
  
      Params:
        bx = X coordinate relative to bin_window
        by = Y coordinate relative to bin_window
        tx = return location for tree X coordinate
        ty = return location for tree Y coordinate
  */
  void convertBinWindowToTreeCoords(int bx, int by, out int tx, out int ty)
  {
    gtk_tree_view_convert_bin_window_to_tree_coords(cast(GtkTreeView*)this._cPtr, bx, by, cast(int*)&tx, cast(int*)&ty);
  }

  /**
      Converts bin_window coordinates (see [gtk.tree_view.TreeView.getBinWindow])
      to widget relative coordinates.
  
      Params:
        bx = bin_window X coordinate
        by = bin_window Y coordinate
        wx = return location for widget X coordinate
        wy = return location for widget Y coordinate
  */
  void convertBinWindowToWidgetCoords(int bx, int by, out int wx, out int wy)
  {
    gtk_tree_view_convert_bin_window_to_widget_coords(cast(GtkTreeView*)this._cPtr, bx, by, cast(int*)&wx, cast(int*)&wy);
  }

  /**
      Converts tree coordinates (coordinates in full scrollable area of the tree)
      to bin_window coordinates.
  
      Params:
        tx = tree X coordinate
        ty = tree Y coordinate
        bx = return location for X coordinate relative to bin_window
        by = return location for Y coordinate relative to bin_window
  */
  void convertTreeToBinWindowCoords(int tx, int ty, out int bx, out int by)
  {
    gtk_tree_view_convert_tree_to_bin_window_coords(cast(GtkTreeView*)this._cPtr, tx, ty, cast(int*)&bx, cast(int*)&by);
  }

  /**
      Converts tree coordinates (coordinates in full scrollable area of the tree)
      to widget coordinates.
  
      Params:
        tx = X coordinate relative to the tree
        ty = Y coordinate relative to the tree
        wx = return location for widget X coordinate
        wy = return location for widget Y coordinate
  */
  void convertTreeToWidgetCoords(int tx, int ty, out int wx, out int wy)
  {
    gtk_tree_view_convert_tree_to_widget_coords(cast(GtkTreeView*)this._cPtr, tx, ty, cast(int*)&wx, cast(int*)&wy);
  }

  /**
      Converts widget coordinates to coordinates for the bin_window
      (see [gtk.tree_view.TreeView.getBinWindow]).
  
      Params:
        wx = X coordinate relative to the widget
        wy = Y coordinate relative to the widget
        bx = return location for bin_window X coordinate
        by = return location for bin_window Y coordinate
  */
  void convertWidgetToBinWindowCoords(int wx, int wy, out int bx, out int by)
  {
    gtk_tree_view_convert_widget_to_bin_window_coords(cast(GtkTreeView*)this._cPtr, wx, wy, cast(int*)&bx, cast(int*)&by);
  }

  /**
      Converts widget coordinates to coordinates for the
      tree (the full scrollable area of the tree).
  
      Params:
        wx = X coordinate relative to the widget
        wy = Y coordinate relative to the widget
        tx = return location for tree X coordinate
        ty = return location for tree Y coordinate
  */
  void convertWidgetToTreeCoords(int wx, int wy, out int tx, out int ty)
  {
    gtk_tree_view_convert_widget_to_tree_coords(cast(GtkTreeView*)this._cPtr, wx, wy, cast(int*)&tx, cast(int*)&ty);
  }

  /**
      Creates a #cairo_surface_t representation of the row at path.
      This image is used for a drag icon.
  
      Params:
        path = a #GtkTreePath in tree_view
      Returns: a newly-allocated surface of the drag icon.
  */
  cairo.surface.Surface createRowDragIcon(gtk.tree_path.TreePath path)
  {
    cairo_surface_t* _cretval;
    _cretval = gtk_tree_view_create_row_drag_icon(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new cairo.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Turns tree_view into a drop destination for automatic DND. Calling
      this method sets #GtkTreeView:reorderable to false.
  
      Params:
        targets = the table of targets that
                    the drag will support
        actions = the bitmask of possible actions for a drag from this
             widget
  */
  void enableModelDragDest(gtk.target_entry.TargetEntry[] targets, gdk.types.DragAction actions)
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    GtkTargetEntry[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
    const(GtkTargetEntry)* _targets = _tmptargets.ptr;

    gtk_tree_view_enable_model_drag_dest(cast(GtkTreeView*)this._cPtr, _targets, _nTargets, actions);
  }

  /**
      Turns tree_view into a drag source for automatic DND. Calling this
      method sets #GtkTreeView:reorderable to false.
  
      Params:
        startButtonMask = Mask of allowed buttons to start drag
        targets = the table of targets that the drag will support
        actions = the bitmask of possible actions for a drag from this
             widget
  */
  void enableModelDragSource(gdk.types.ModifierType startButtonMask, gtk.target_entry.TargetEntry[] targets, gdk.types.DragAction actions)
  {
    int _nTargets;
    if (targets)
      _nTargets = cast(int)targets.length;

    GtkTargetEntry[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
    const(GtkTargetEntry)* _targets = _tmptargets.ptr;

    gtk_tree_view_enable_model_drag_source(cast(GtkTreeView*)this._cPtr, startButtonMask, _targets, _nTargets, actions);
  }

  /**
      Recursively expands all nodes in the tree_view.
  */
  void expandAll()
  {
    gtk_tree_view_expand_all(cast(GtkTreeView*)this._cPtr);
  }

  /**
      Opens the row so its children are visible.
  
      Params:
        path = path to a row
        openAll = whether to recursively expand, or just expand immediate children
      Returns: true if the row existed and had children
  */
  bool expandRow(gtk.tree_path.TreePath path, bool openAll)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_expand_row(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, openAll);
    return _retval;
  }

  /**
      Expands the row at path. This will also expand all parent rows of
      path as necessary.
  
      Params:
        path = path to a row.
  */
  void expandToPath(gtk.tree_path.TreePath path)
  {
    gtk_tree_view_expand_to_path(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Gets the setting set by [gtk.tree_view.TreeView.setActivateOnSingleClick].
      Returns: true if row-activated will be emitted on a single click
  */
  bool getActivateOnSingleClick()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_activate_on_single_click(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Fills the bounding rectangle in bin_window coordinates for the cell at the
      row specified by path and the column specified by column.  If path is
      null, or points to a node not found in the tree, the y and height fields of
      the rectangle will be filled with 0. If column is null, the x and width
      fields will be filled with 0.  The returned rectangle is equivalent to the
      background_area passed to [gtk.cell_renderer.CellRenderer.render].  These background
      areas tile to cover the entire bin window.  Contrast with the cell_area,
      returned by [gtk.tree_view.TreeView.getCellArea], which returns only the cell
      itself, excluding surrounding borders and the tree expander area.
  
      Params:
        path = a #GtkTreePath for the row, or null to get only horizontal coordinates
        column = a #GtkTreeViewColumn for the column, or null to get only vertical coordiantes
        rect = rectangle to fill with cell background rect
  */
  void getBackgroundArea(gtk.tree_path.TreePath path, gtk.tree_view_column.TreeViewColumn column, out gdk.rectangle.Rectangle rect)
  {
    gtk_tree_view_get_background_area(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null, cast(GdkRectangle*)&rect);
  }

  /**
      Returns the window that tree_view renders to.
      This is used primarily to compare to `event->window`
      to confirm that the event on tree_view is on the right window.
      Returns: A #GdkWindow, or null when tree_view
        hasn’t been realized yet.
  */
  gdk.window.Window getBinWindow()
  {
    GdkWindow* _cretval;
    _cretval = gtk_tree_view_get_bin_window(cast(GtkTreeView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.window.Window)(cast(GdkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fills the bounding rectangle in bin_window coordinates for the cell at the
      row specified by path and the column specified by column.  If path is
      null, or points to a path not currently displayed, the y and height fields
      of the rectangle will be filled with 0. If column is null, the x and width
      fields will be filled with 0.  The sum of all cell rects does not cover the
      entire tree; there are extra pixels in between rows, for example. The
      returned rectangle is equivalent to the cell_area passed to
      [gtk.cell_renderer.CellRenderer.render].  This function is only valid if tree_view is
      realized.
  
      Params:
        path = a #GtkTreePath for the row, or null to get only horizontal coordinates
        column = a #GtkTreeViewColumn for the column, or null to get only vertical coordinates
        rect = rectangle to fill with cell rect
  */
  void getCellArea(gtk.tree_path.TreePath path, gtk.tree_view_column.TreeViewColumn column, out gdk.rectangle.Rectangle rect)
  {
    gtk_tree_view_get_cell_area(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null, cast(GdkRectangle*)&rect);
  }

  /**
      Gets the #GtkTreeViewColumn at the given position in the #tree_view.
  
      Params:
        n = The position of the column, counting from 0.
      Returns: The #GtkTreeViewColumn, or null if the
        position is outside the range of columns.
  */
  gtk.tree_view_column.TreeViewColumn getColumn(int n)
  {
    GtkTreeViewColumn* _cretval;
    _cretval = gtk_tree_view_get_column(cast(GtkTreeView*)this._cPtr, n);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(GtkTreeViewColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns a #GList of all the #GtkTreeViewColumn s currently in tree_view.
      The returned list must be freed with g_list_free ().
      Returns: A list of #GtkTreeViewColumn s
  */
  gtk.tree_view_column.TreeViewColumn[] getColumns()
  {
    GList* _cretval;
    _cretval = gtk_tree_view_get_columns(cast(GtkTreeView*)this._cPtr);
    auto _retval = gListToD!(gtk.tree_view_column.TreeViewColumn, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Fills in path and focus_column with the current path and focus column.  If
      the cursor isn’t currently set, then *path will be null.  If no column
      currently has focus, then *focus_column will be null.
      
      The returned #GtkTreePath must be freed with [gtk.tree_path.TreePath.free] when
      you are done with it.
  
      Params:
        path = A pointer to be
            filled with the current cursor path, or null
        focusColumn = A
            pointer to be filled with the current focus column, or null
  */
  void getCursor(out gtk.tree_path.TreePath path, out gtk.tree_view_column.TreeViewColumn focusColumn)
  {
    GtkTreePath* _path;
    GtkTreeViewColumn* _focusColumn;
    gtk_tree_view_get_cursor(cast(GtkTreeView*)this._cPtr, &_path, &_focusColumn);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    focusColumn = new gtk.tree_view_column.TreeViewColumn(cast(void*)_focusColumn, No.Take);
  }

  /**
      Determines the destination row for a given position.  drag_x and
      drag_y are expected to be in widget coordinates.  This function is only
      meaningful if tree_view is realized.  Therefore this function will always
      return false if tree_view is not realized or does not have a model.
  
      Params:
        dragX = the position to determine the destination row for
        dragY = the position to determine the destination row for
        path = Return location for the path of
            the highlighted row, or null.
        pos = Return location for the drop position, or
            null
      Returns: whether there is a row at the given position, true if this
        is indeed the case.
  */
  bool getDestRowAtPos(int dragX, int dragY, out gtk.tree_path.TreePath path, out gtk.types.TreeViewDropPosition pos)
  {
    bool _retval;
    GtkTreePath* _path;
    _retval = cast(bool)gtk_tree_view_get_dest_row_at_pos(cast(GtkTreeView*)this._cPtr, dragX, dragY, &_path, &pos);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    return _retval;
  }

  /**
      Gets information about the row that is highlighted for feedback.
  
      Params:
        path = Return location for the path of the highlighted row, or null.
        pos = Return location for the drop position, or null
  */
  void getDragDestRow(out gtk.tree_path.TreePath path, out gtk.types.TreeViewDropPosition pos)
  {
    GtkTreePath* _path;
    gtk_tree_view_get_drag_dest_row(cast(GtkTreeView*)this._cPtr, &_path, &pos);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
  }

  /**
      Returns whether or not the tree allows to start interactive searching
      by typing in text.
      Returns: whether or not to let the user search interactively
  */
  bool getEnableSearch()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_enable_search(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether or not tree lines are drawn in tree_view.
      Returns: true if tree lines are drawn in tree_view, false
        otherwise.
  */
  bool getEnableTreeLines()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_enable_tree_lines(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the column that is the current expander column.
      This column has the expander arrow drawn next to it.
      Returns: The expander column.
  */
  gtk.tree_view_column.TreeViewColumn getExpanderColumn()
  {
    GtkTreeViewColumn* _cretval;
    _cretval = gtk_tree_view_get_expander_column(cast(GtkTreeView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(GtkTreeViewColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether fixed height mode is turned on for tree_view.
      Returns: true if tree_view is in fixed height mode
  */
  bool getFixedHeightMode()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_fixed_height_mode(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns which grid lines are enabled in tree_view.
      Returns: a #GtkTreeViewGridLines value indicating which grid lines
        are enabled.
  */
  gtk.types.TreeViewGridLines getGridLines()
  {
    GtkTreeViewGridLines _cretval;
    _cretval = gtk_tree_view_get_grid_lines(cast(GtkTreeView*)this._cPtr);
    gtk.types.TreeViewGridLines _retval = cast(gtk.types.TreeViewGridLines)_cretval;
    return _retval;
  }

  /**
      Gets the #GtkAdjustment currently being used for the horizontal aspect.
      Returns: A #GtkAdjustment object, or null
            if none is currently being used.
  
      Deprecated: Use [gtk.scrollable.Scrollable.getHadjustment]
  */
  gtk.adjustment.Adjustment getHadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_tree_view_get_hadjustment(cast(GtkTreeView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether all header columns are clickable.
      Returns: true if all header columns are clickable, otherwise false
  */
  bool getHeadersClickable()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_headers_clickable(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if the headers on the tree_view are visible.
      Returns: Whether the headers are visible or not.
  */
  bool getHeadersVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_headers_visible(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether hover expansion mode is turned on for tree_view.
      Returns: true if tree_view is in hover expansion mode
  */
  bool getHoverExpand()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_hover_expand(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether hover selection mode is turned on for tree_view.
      Returns: true if tree_view is in hover selection mode
  */
  bool getHoverSelection()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_hover_selection(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the amount, in pixels, of extra indentation for child levels
      in tree_view.
      Returns: the amount of extra indentation for child levels in
        tree_view.  A return value of 0 means that this feature is disabled.
  */
  int getLevelIndentation()
  {
    int _retval;
    _retval = gtk_tree_view_get_level_indentation(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the model the #GtkTreeView is based on.  Returns null if the
      model is unset.
      Returns: A #GtkTreeModel, or null if
        none is currently being used.
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_view_get_model(cast(GtkTreeView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries the number of columns in the given tree_view.
      Returns: The number of columns in the tree_view
  */
  uint getNColumns()
  {
    uint _retval;
    _retval = gtk_tree_view_get_n_columns(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Finds the path at the point (`x`, `y`), relative to bin_window coordinates
      (please see [gtk.tree_view.TreeView.getBinWindow]).
      That is, `x` and `y` are relative to an events coordinates. `x` and `y` must
      come from an event on the tree_view only where `event->window ==
      gtk_tree_view_get_bin_window ()`. It is primarily for
      things like popup menus. If path is non-null, then it will be filled
      with the #GtkTreePath at that point.  This path should be freed with
      [gtk.tree_path.TreePath.free].  If column is non-null, then it will be filled
      with the column at that point.  cell_x and cell_y return the coordinates
      relative to the cell background (i.e. the background_area passed to
      [gtk.cell_renderer.CellRenderer.render]).  This function is only meaningful if
      tree_view is realized.  Therefore this function will always return false
      if tree_view is not realized or does not have a model.
      
      For converting widget coordinates (eg. the ones you get from
      GtkWidget::query-tooltip), please see
      [gtk.tree_view.TreeView.convertWidgetToBinWindowCoords].
  
      Params:
        x = The x position to be identified (relative to bin_window).
        y = The y position to be identified (relative to bin_window).
        path = A pointer to a #GtkTreePath
            pointer to be filled in, or null
        column = A pointer to
            a #GtkTreeViewColumn pointer to be filled in, or null
        cellX = A pointer where the X coordinate
            relative to the cell can be placed, or null
        cellY = A pointer where the Y coordinate
            relative to the cell can be placed, or null
      Returns: true if a row exists at that coordinate.
  */
  bool getPathAtPos(int x, int y, out gtk.tree_path.TreePath path, out gtk.tree_view_column.TreeViewColumn column, out int cellX, out int cellY)
  {
    bool _retval;
    GtkTreePath* _path;
    GtkTreeViewColumn* _column;
    _retval = cast(bool)gtk_tree_view_get_path_at_pos(cast(GtkTreeView*)this._cPtr, x, y, &_path, &_column, cast(int*)&cellX, cast(int*)&cellY);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    column = new gtk.tree_view_column.TreeViewColumn(cast(void*)_column, No.Take);
    return _retval;
  }

  /**
      Retrieves whether the user can reorder the tree via drag-and-drop. See
      [gtk.tree_view.TreeView.setReorderable].
      Returns: true if the tree can be reordered.
  */
  bool getReorderable()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_reorderable(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether rubber banding is turned on for tree_view.  If the
      selection mode is #GTK_SELECTION_MULTIPLE, rubber banding will allow the
      user to select multiple rows by dragging the mouse.
      Returns: true if rubber banding in tree_view is enabled.
  */
  bool getRubberBanding()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_rubber_banding(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the setting set by [gtk.tree_view.TreeView.setRulesHint].
      Returns: true if the hint is set
  */
  bool getRulesHint()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_rules_hint(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the column searched on by the interactive search code.
      Returns: the column the interactive search code searches in.
  */
  int getSearchColumn()
  {
    int _retval;
    _retval = gtk_tree_view_get_search_column(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GtkEntry which is currently in use as interactive search
      entry for tree_view.  In case the built-in entry is being used, null
      will be returned.
      Returns: the entry currently in use as search entry.
  */
  gtk.entry.Entry getSearchEntry()
  {
    GtkEntry* _cretval;
    _cretval = gtk_tree_view_get_search_entry(cast(GtkTreeView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.entry.Entry)(cast(GtkEntry*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkTreeSelection associated with tree_view.
      Returns: A #GtkTreeSelection object.
  */
  gtk.tree_selection.TreeSelection getSelection()
  {
    GtkTreeSelection* _cretval;
    _cretval = gtk_tree_view_get_selection(cast(GtkTreeView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_selection.TreeSelection)(cast(GtkTreeSelection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether or not expanders are drawn in tree_view.
      Returns: true if expanders are drawn in tree_view, false
        otherwise.
  */
  bool getShowExpanders()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_get_show_expanders(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the column of tree_view’s model which is being used for
      displaying tooltips on tree_view’s rows.
      Returns: the index of the tooltip column that is currently being
        used, or -1 if this is disabled.
  */
  int getTooltipColumn()
  {
    int _retval;
    _retval = gtk_tree_view_get_tooltip_column(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      This function is supposed to be used in a #GtkWidget::query-tooltip
      signal handler for #GtkTreeView.  The `x`, `y` and keyboard_tip values
      which are received in the signal handler, should be passed to this
      function without modification.
      
      The return value indicates whether there is a tree view row at the given
      coordinates (true) or not (false) for mouse tooltips.  For keyboard
      tooltips the row returned will be the cursor row.  When true, then any of
      model, path and iter which have been provided will be set to point to
      that row and the corresponding model.  `x` and `y` will always be converted
      to be relative to tree_view’s bin_window if keyboard_tooltip is false.
  
      Params:
        x = the x coordinate (relative to widget coordinates)
        y = the y coordinate (relative to widget coordinates)
        keyboardTip = whether this is a keyboard tooltip or not
        model = a pointer to
                  receive a #GtkTreeModel or null
        path = a pointer to receive a #GtkTreePath or null
        iter = a pointer to receive a #GtkTreeIter or null
      Returns: whether or not the given tooltip context points to a row.
  */
  bool getTooltipContext(ref int x, ref int y, bool keyboardTip, out gtk.tree_model.TreeModel model, out gtk.tree_path.TreePath path, out gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    GtkTreeModel* _model;
    GtkTreePath* _path;
    GtkTreeIter _iter;
    _retval = cast(bool)gtk_tree_view_get_tooltip_context(cast(GtkTreeView*)this._cPtr, cast(int*)&x, cast(int*)&y, keyboardTip, &_model, &_path, &_iter);
    model = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(_model, No.Take);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkAdjustment currently being used for the vertical aspect.
      Returns: A #GtkAdjustment object, or null
            if none is currently being used.
  
      Deprecated: Use [gtk.scrollable.Scrollable.getVadjustment]
  */
  gtk.adjustment.Adjustment getVadjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_tree_view_get_vadjustment(cast(GtkTreeView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets start_path and end_path to be the first and last visible path.
      Note that there may be invisible paths in between.
      
      The paths should be freed with [gtk.tree_path.TreePath.free] after use.
  
      Params:
        startPath = Return location for start of region,
                       or null.
        endPath = Return location for end of region, or null.
      Returns: true, if valid paths were placed in start_path and end_path.
  */
  bool getVisibleRange(out gtk.tree_path.TreePath startPath, out gtk.tree_path.TreePath endPath)
  {
    bool _retval;
    GtkTreePath* _startPath;
    GtkTreePath* _endPath;
    _retval = cast(bool)gtk_tree_view_get_visible_range(cast(GtkTreeView*)this._cPtr, &_startPath, &_endPath);
    startPath = new gtk.tree_path.TreePath(cast(void*)_startPath, Yes.Take);
    endPath = new gtk.tree_path.TreePath(cast(void*)_endPath, Yes.Take);
    return _retval;
  }

  /**
      Fills visible_rect with the currently-visible region of the
      buffer, in tree coordinates. Convert to bin_window coordinates with
      [gtk.tree_view.TreeView.convertTreeToBinWindowCoords].
      Tree coordinates start at 0,0 for row 0 of the tree, and cover the entire
      scrollable area of the tree.
  
      Params:
        visibleRect = rectangle to fill
  */
  void getVisibleRect(out gdk.rectangle.Rectangle visibleRect)
  {
    gtk_tree_view_get_visible_rect(cast(GtkTreeView*)this._cPtr, cast(GdkRectangle*)&visibleRect);
  }

  /**
      This inserts the column into the tree_view at position.  If position is
      -1, then the column is inserted at the end. If tree_view has
      “fixed_height” mode enabled, then column must have its “sizing” property
      set to be GTK_TREE_VIEW_COLUMN_FIXED.
  
      Params:
        column = The #GtkTreeViewColumn to be inserted.
        position = The position to insert column in.
      Returns: The number of columns in tree_view after insertion.
  */
  int insertColumn(gtk.tree_view_column.TreeViewColumn column, int position)
  {
    int _retval;
    _retval = gtk_tree_view_insert_column(cast(GtkTreeView*)this._cPtr, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Convenience function that inserts a new column into the #GtkTreeView
      with the given cell renderer and a #GtkTreeCellDataFunc to set cell renderer
      attributes (normally using data from the model). See also
      [gtk.tree_view_column.TreeViewColumn.setCellDataFunc], [gtk.tree_view_column.TreeViewColumn.packStart].
      If tree_view has “fixed_height” mode enabled, then the new column will have its
      “sizing” property set to be GTK_TREE_VIEW_COLUMN_FIXED.
  
      Params:
        position = Position to insert, -1 for append
        title = column title
        cell = cell renderer for column
        func = function to set attributes of cell renderer
      Returns: number of columns in the tree view post-insert
  */
  int insertColumnWithDataFunc(int position, string title, gtk.cell_renderer.CellRenderer cell, gtk.types.TreeCellDataFunc func)
  {
    extern(C) void _funcCallback(GtkTreeViewColumn* treeColumn, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data)
    {
      auto _dlg = cast(gtk.types.TreeCellDataFunc*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(void*)treeColumn, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)treeModel, No.Take), iter ? new gtk.tree_iter.TreeIter(cast(void*)iter, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;
    int _retval;
    const(char)* _title = title.toCString(No.Alloc);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _retval = gtk_tree_view_insert_column_with_data_func(cast(GtkTreeView*)this._cPtr, position, _title, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
    return _retval;
  }

  /**
      Determine whether the point (`x`, `y`) in tree_view is blank, that is no
      cell content nor an expander arrow is drawn at the location. If so, the
      location can be considered as the background. You might wish to take
      special action on clicks on the background, such as clearing a current
      selection, having a custom context menu or starting rubber banding.
      
      The `x` and `y` coordinate that are provided must be relative to bin_window
      coordinates.  That is, `x` and `y` must come from an event on tree_view
      where `event->window == gtk_tree_view_get_bin_window ()`.
      
      For converting widget coordinates (eg. the ones you get from
      GtkWidget::query-tooltip), please see
      [gtk.tree_view.TreeView.convertWidgetToBinWindowCoords].
      
      The path, column, cell_x and cell_y arguments will be filled in
      likewise as for [gtk.tree_view.TreeView.getPathAtPos].  Please see
      [gtk.tree_view.TreeView.getPathAtPos] for more information.
  
      Params:
        x = The x position to be identified (relative to bin_window)
        y = The y position to be identified (relative to bin_window)
        path = A pointer to a #GtkTreePath pointer to
            be filled in, or null
        column = A pointer to a
            #GtkTreeViewColumn pointer to be filled in, or null
        cellX = A pointer where the X coordinate relative to the
            cell can be placed, or null
        cellY = A pointer where the Y coordinate relative to the
            cell can be placed, or null
      Returns: true if the area at the given coordinates is blank,
        false otherwise.
  */
  bool isBlankAtPos(int x, int y, out gtk.tree_path.TreePath path, out gtk.tree_view_column.TreeViewColumn column, out int cellX, out int cellY)
  {
    bool _retval;
    GtkTreePath* _path;
    GtkTreeViewColumn* _column;
    _retval = cast(bool)gtk_tree_view_is_blank_at_pos(cast(GtkTreeView*)this._cPtr, x, y, &_path, &_column, cast(int*)&cellX, cast(int*)&cellY);
    path = new gtk.tree_path.TreePath(cast(void*)_path, Yes.Take);
    column = new gtk.tree_view_column.TreeViewColumn(cast(void*)_column, No.Take);
    return _retval;
  }

  /**
      Returns whether a rubber banding operation is currently being done
      in tree_view.
      Returns: true if a rubber banding operation is currently being
        done in tree_view.
  */
  bool isRubberBandingActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_is_rubber_banding_active(cast(GtkTreeView*)this._cPtr);
    return _retval;
  }

  /**
      Calls func on all expanded rows.
  
      Params:
        func = A function to be called
  */
  void mapExpandedRows(gtk.types.TreeViewMappingFunc func)
  {
    extern(C) void _funcCallback(GtkTreeView* treeView, GtkTreePath* path, void* userData)
    {
      auto _dlg = cast(gtk.types.TreeViewMappingFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_view.TreeView)(cast(void*)treeView, No.Take), path ? new gtk.tree_path.TreePath(cast(void*)path, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_tree_view_map_expanded_rows(cast(GtkTreeView*)this._cPtr, _funcCB, _func);
  }

  /**
      Moves column to be after to base_column.  If base_column is null, then
      column is placed in the first position.
  
      Params:
        column = The #GtkTreeViewColumn to be moved.
        baseColumn = The #GtkTreeViewColumn to be moved relative to, or null.
  */
  void moveColumnAfter(gtk.tree_view_column.TreeViewColumn column, gtk.tree_view_column.TreeViewColumn baseColumn = null)
  {
    gtk_tree_view_move_column_after(cast(GtkTreeView*)this._cPtr, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null, baseColumn ? cast(GtkTreeViewColumn*)baseColumn._cPtr(No.Dup) : null);
  }

  /**
      Removes column from tree_view.
  
      Params:
        column = The #GtkTreeViewColumn to remove.
      Returns: The number of columns in tree_view after removing.
  */
  int removeColumn(gtk.tree_view_column.TreeViewColumn column)
  {
    int _retval;
    _retval = gtk_tree_view_remove_column(cast(GtkTreeView*)this._cPtr, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Activates the cell determined by path and column.
  
      Params:
        path = The #GtkTreePath to be activated.
        column = The #GtkTreeViewColumn to be activated.
  */
  void rowActivated(gtk.tree_path.TreePath path, gtk.tree_view_column.TreeViewColumn column)
  {
    gtk_tree_view_row_activated(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null);
  }

  /**
      Returns true if the node pointed to by path is expanded in tree_view.
  
      Params:
        path = A #GtkTreePath to test expansion state.
      Returns: true if #path is expanded.
  */
  bool rowExpanded(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_row_expanded(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Moves the alignments of tree_view to the position specified by column and
      path.  If column is null, then no horizontal scrolling occurs.  Likewise,
      if path is null no vertical scrolling occurs.  At a minimum, one of column
      or path need to be non-null.  row_align determines where the row is
      placed, and col_align determines where column is placed.  Both are expected
      to be between 0.0 and 1.0. 0.0 means left/top alignment, 1.0 means
      right/bottom alignment, 0.5 means center.
      
      If use_align is false, then the alignment arguments are ignored, and the
      tree does the minimum amount of work to scroll the cell onto the screen.
      This means that the cell will be scrolled to the edge closest to its current
      position.  If the cell is currently visible on the screen, nothing is done.
      
      This function only works if the model is set, and path is a valid row on the
      model.  If the model changes before the tree_view is realized, the centered
      path will be modified to reflect this change.
  
      Params:
        path = The path of the row to move to, or null.
        column = The #GtkTreeViewColumn to move horizontally to, or null.
        useAlign = whether to use alignment arguments, or false.
        rowAlign = The vertical alignment of the row specified by path.
        colAlign = The horizontal alignment of the column specified by column.
  */
  void scrollToCell(gtk.tree_path.TreePath path, gtk.tree_view_column.TreeViewColumn column, bool useAlign, float rowAlign, float colAlign)
  {
    gtk_tree_view_scroll_to_cell(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null, useAlign, rowAlign, colAlign);
  }

  /**
      Scrolls the tree view such that the top-left corner of the visible
      area is tree_x, tree_y, where tree_x and tree_y are specified
      in tree coordinates.  The tree_view must be realized before
      this function is called.  If it isn't, you probably want to be
      using [gtk.tree_view.TreeView.scrollToCell].
      
      If either tree_x or tree_y are -1, then that direction isn’t scrolled.
  
      Params:
        treeX = X coordinate of new top-left pixel of visible area, or -1
        treeY = Y coordinate of new top-left pixel of visible area, or -1
  */
  void scrollToPoint(int treeX, int treeY)
  {
    gtk_tree_view_scroll_to_point(cast(GtkTreeView*)this._cPtr, treeX, treeY);
  }

  /**
      Cause the #GtkTreeView::row-activated signal to be emitted
      on a single click instead of a double click.
  
      Params:
        single = true to emit row-activated on a single click
  */
  void setActivateOnSingleClick(bool single)
  {
    gtk_tree_view_set_activate_on_single_click(cast(GtkTreeView*)this._cPtr, single);
  }

  /**
      Sets a user function for determining where a column may be dropped when
      dragged.  This function is called on every column pair in turn at the
      beginning of a column drag to determine where a drop can take place.  The
      arguments passed to func are: the tree_view, the #GtkTreeViewColumn being
      dragged, the two #GtkTreeViewColumn s determining the drop spot, and
      user_data.  If either of the #GtkTreeViewColumn arguments for the drop spot
      are null, then they indicate an edge.  If func is set to be null, then
      tree_view reverts to the default behavior of allowing all columns to be
      dropped everywhere.
  
      Params:
        func = A function to determine which columns are reorderable, or null.
  */
  void setColumnDragFunction(gtk.types.TreeViewColumnDropFunc func = null)
  {
    extern(C) gboolean _funcCallback(GtkTreeView* treeView, GtkTreeViewColumn* column, GtkTreeViewColumn* prevColumn, GtkTreeViewColumn* nextColumn, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TreeViewColumnDropFunc*)data;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_view.TreeView)(cast(void*)treeView, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(void*)column, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(void*)prevColumn, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(void*)nextColumn, No.Take));
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_view_set_column_drag_function(cast(GtkTreeView*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets the current keyboard focus to be at path, and selects it.  This is
      useful when you want to focus the user’s attention on a particular row.  If
      focus_column is not null, then focus is given to the column specified by
      it. Additionally, if focus_column is specified, and start_editing is
      true, then editing should be started in the specified cell.
      This function is often followed by gtk_widget_grab_focus (tree_view)
      in order to give keyboard focus to the widget.  Please note that editing
      can only happen when the widget is realized.
      
      If path is invalid for model, the current cursor (if any) will be unset
      and the function will return without failing.
  
      Params:
        path = A #GtkTreePath
        focusColumn = A #GtkTreeViewColumn, or null
        startEditing = true if the specified cell should start being edited.
  */
  void setCursor(gtk.tree_path.TreePath path, gtk.tree_view_column.TreeViewColumn focusColumn, bool startEditing)
  {
    gtk_tree_view_set_cursor(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, focusColumn ? cast(GtkTreeViewColumn*)focusColumn._cPtr(No.Dup) : null, startEditing);
  }

  /**
      Sets the current keyboard focus to be at path, and selects it.  This is
      useful when you want to focus the user’s attention on a particular row.  If
      focus_column is not null, then focus is given to the column specified by
      it. If focus_column and focus_cell are not null, and focus_column
      contains 2 or more editable or activatable cells, then focus is given to
      the cell specified by focus_cell. Additionally, if focus_column is
      specified, and start_editing is true, then editing should be started in
      the specified cell.  This function is often followed by
      gtk_widget_grab_focus (tree_view) in order to give keyboard focus to the
      widget.  Please note that editing can only happen when the widget is
      realized.
      
      If path is invalid for model, the current cursor (if any) will be unset
      and the function will return without failing.
  
      Params:
        path = A #GtkTreePath
        focusColumn = A #GtkTreeViewColumn, or null
        focusCell = A #GtkCellRenderer, or null
        startEditing = true if the specified cell should start being edited.
  */
  void setCursorOnCell(gtk.tree_path.TreePath path, gtk.tree_view_column.TreeViewColumn focusColumn, gtk.cell_renderer.CellRenderer focusCell, bool startEditing)
  {
    gtk_tree_view_set_cursor_on_cell(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, focusColumn ? cast(GtkTreeViewColumn*)focusColumn._cPtr(No.Dup) : null, focusCell ? cast(GtkCellRenderer*)focusCell._cPtr(No.Dup) : null, startEditing);
  }

  /**
      This function should almost never be used.  It is meant for private use by
      ATK for determining the number of visible children that are removed when the
      user collapses a row, or a row is deleted.
  
      Params:
        func = Function to be called when a view row is destroyed, or null
  
      Deprecated: Accessibility does not need the function anymore.
  */
  void setDestroyCountFunc(gtk.types.TreeDestroyCountFunc func = null)
  {
    extern(C) void _funcCallback(GtkTreeView* treeView, GtkTreePath* path, int children, void* userData)
    {
      auto _dlg = cast(gtk.types.TreeDestroyCountFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_view.TreeView)(cast(void*)treeView, No.Take), path ? new gtk.tree_path.TreePath(cast(void*)path, No.Take) : null, children);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_view_set_destroy_count_func(cast(GtkTreeView*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets the row that is highlighted for feedback.
      If path is null, an existing highlight is removed.
  
      Params:
        path = The path of the row to highlight, or null
        pos = Specifies whether to drop before, after or into the row
  */
  void setDragDestRow(gtk.tree_path.TreePath path, gtk.types.TreeViewDropPosition pos)
  {
    gtk_tree_view_set_drag_dest_row(cast(GtkTreeView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, pos);
  }

  /**
      If enable_search is set, then the user can type in text to search through
      the tree interactively (this is sometimes called "typeahead find").
      
      Note that even if this is false, the user can still initiate a search
      using the “start-interactive-search” key binding.
  
      Params:
        enableSearch = true, if the user can search interactively
  */
  void setEnableSearch(bool enableSearch)
  {
    gtk_tree_view_set_enable_search(cast(GtkTreeView*)this._cPtr, enableSearch);
  }

  /**
      Sets whether to draw lines interconnecting the expanders in tree_view.
      This does not have any visible effects for lists.
  
      Params:
        enabled = true to enable tree line drawing, false otherwise.
  */
  void setEnableTreeLines(bool enabled)
  {
    gtk_tree_view_set_enable_tree_lines(cast(GtkTreeView*)this._cPtr, enabled);
  }

  /**
      Sets the column to draw the expander arrow at. It must be in tree_view.
      If column is null, then the expander arrow is always at the first
      visible column.
      
      If you do not want expander arrow to appear in your tree, set the
      expander column to a hidden column.
  
      Params:
        column = null, or the column to draw the expander arrow at.
  */
  void setExpanderColumn(gtk.tree_view_column.TreeViewColumn column = null)
  {
    gtk_tree_view_set_expander_column(cast(GtkTreeView*)this._cPtr, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null);
  }

  /**
      Enables or disables the fixed height mode of tree_view.
      Fixed height mode speeds up #GtkTreeView by assuming that all
      rows have the same height.
      Only enable this option if all rows are the same height and all
      columns are of type [gtk.types.TreeViewColumnSizing.Fixed].
  
      Params:
        enable = true to enable fixed height mode
  */
  void setFixedHeightMode(bool enable)
  {
    gtk_tree_view_set_fixed_height_mode(cast(GtkTreeView*)this._cPtr, enable);
  }

  /**
      Sets which grid lines to draw in tree_view.
  
      Params:
        gridLines = a #GtkTreeViewGridLines value indicating which grid lines to
          enable.
  */
  void setGridLines(gtk.types.TreeViewGridLines gridLines)
  {
    gtk_tree_view_set_grid_lines(cast(GtkTreeView*)this._cPtr, gridLines);
  }

  /**
      Sets the #GtkAdjustment for the current horizontal aspect.
  
      Params:
        adjustment = The #GtkAdjustment to set, or null
  
      Deprecated: Use [gtk.scrollable.Scrollable.setHadjustment]
  */
  void setHadjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_tree_view_set_hadjustment(cast(GtkTreeView*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Allow the column title buttons to be clicked.
  
      Params:
        setting = true if the columns are clickable.
  */
  void setHeadersClickable(bool setting)
  {
    gtk_tree_view_set_headers_clickable(cast(GtkTreeView*)this._cPtr, setting);
  }

  /**
      Sets the visibility state of the headers.
  
      Params:
        headersVisible = true if the headers are visible
  */
  void setHeadersVisible(bool headersVisible)
  {
    gtk_tree_view_set_headers_visible(cast(GtkTreeView*)this._cPtr, headersVisible);
  }

  /**
      Enables or disables the hover expansion mode of tree_view.
      Hover expansion makes rows expand or collapse if the pointer
      moves over them.
  
      Params:
        expand = true to enable hover selection mode
  */
  void setHoverExpand(bool expand)
  {
    gtk_tree_view_set_hover_expand(cast(GtkTreeView*)this._cPtr, expand);
  }

  /**
      Enables or disables the hover selection mode of tree_view.
      Hover selection makes the selected row follow the pointer.
      Currently, this works only for the selection modes
      [gtk.types.SelectionMode.Single] and [gtk.types.SelectionMode.Browse].
  
      Params:
        hover = true to enable hover selection mode
  */
  void setHoverSelection(bool hover)
  {
    gtk_tree_view_set_hover_selection(cast(GtkTreeView*)this._cPtr, hover);
  }

  /**
      Sets the amount of extra indentation for child levels to use in tree_view
      in addition to the default indentation.  The value should be specified in
      pixels, a value of 0 disables this feature and in this case only the default
      indentation will be used.
      This does not have any visible effects for lists.
  
      Params:
        indentation = the amount, in pixels, of extra indentation in tree_view.
  */
  void setLevelIndentation(int indentation)
  {
    gtk_tree_view_set_level_indentation(cast(GtkTreeView*)this._cPtr, indentation);
  }

  /**
      Sets the model for a #GtkTreeView.  If the tree_view already has a model
      set, it will remove it before setting the new model.  If model is null,
      then it will unset the old model.
  
      Params:
        model = The model.
  */
  void setModel(gtk.tree_model.TreeModel model = null)
  {
    gtk_tree_view_set_model(cast(GtkTreeView*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      This function is a convenience function to allow you to reorder
      models that support the #GtkTreeDragSourceIface and the
      #GtkTreeDragDestIface.  Both #GtkTreeStore and #GtkListStore support
      these.  If reorderable is true, then the user can reorder the
      model by dragging and dropping rows. The developer can listen to
      these changes by connecting to the model’s #GtkTreeModel::row-inserted
      and #GtkTreeModel::row-deleted signals. The reordering is implemented
      by setting up the tree view as a drag source and destination.
      Therefore, drag and drop can not be used in a reorderable view for any
      other purpose.
      
      This function does not give you any degree of control over the order -- any
      reordering is allowed.  If more control is needed, you should probably
      handle drag and drop manually.
  
      Params:
        reorderable = true, if the tree can be reordered.
  */
  void setReorderable(bool reorderable)
  {
    gtk_tree_view_set_reorderable(cast(GtkTreeView*)this._cPtr, reorderable);
  }

  /**
      Sets the row separator function, which is used to determine
      whether a row should be drawn as a separator. If the row separator
      function is null, no separators are drawn. This is the default value.
  
      Params:
        func = a #GtkTreeViewRowSeparatorFunc
  */
  void setRowSeparatorFunc(gtk.types.TreeViewRowSeparatorFunc func = null)
  {
    extern(C) gboolean _funcCallback(GtkTreeModel* model, GtkTreeIter* iter, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TreeViewRowSeparatorFunc*)data;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), iter ? new gtk.tree_iter.TreeIter(cast(void*)iter, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_view_set_row_separator_func(cast(GtkTreeView*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Enables or disables rubber banding in tree_view.  If the selection mode
      is #GTK_SELECTION_MULTIPLE, rubber banding will allow the user to select
      multiple rows by dragging the mouse.
  
      Params:
        enable = true to enable rubber banding
  */
  void setRubberBanding(bool enable)
  {
    gtk_tree_view_set_rubber_banding(cast(GtkTreeView*)this._cPtr, enable);
  }

  /**
      Sets a hint for the theme to draw even/odd rows in the tree_view
      with different colors, also known as "zebra striping".
      
      This function tells the GTK+ theme that the user interface for your
      application requires users to read across tree rows and associate
      cells with one another.
      
      Do not use it just because you prefer the appearance of the ruled
      tree; that’s a question for the theme. Some themes will draw tree
      rows in alternating colors even when rules are turned off, and
      users who prefer that appearance all the time can choose those
      themes. You should call this function only as a semantic hint to
      the theme engine that your tree makes alternating colors useful
      from a functional standpoint (since it has lots of columns,
      generally).
  
      Params:
        setting = true if the tree requires reading across rows
  */
  void setRulesHint(bool setting)
  {
    gtk_tree_view_set_rules_hint(cast(GtkTreeView*)this._cPtr, setting);
  }

  /**
      Sets column as the column where the interactive search code should
      search in for the current model.
      
      If the search column is set, users can use the “start-interactive-search”
      key binding to bring up search popup. The enable-search property controls
      whether simply typing text will also start an interactive search.
      
      Note that column refers to a column of the current model. The search
      column is reset to -1 when the model is changed.
  
      Params:
        column = the column of the model to search in, or -1 to disable searching
  */
  void setSearchColumn(int column)
  {
    gtk_tree_view_set_search_column(cast(GtkTreeView*)this._cPtr, column);
  }

  /**
      Sets the entry which the interactive search code will use for this
      tree_view.  This is useful when you want to provide a search entry
      in our interface at all time at a fixed position.  Passing null for
      entry will make the interactive search code use the built-in popup
      entry again.
  
      Params:
        entry = the entry the interactive search code of tree_view should use or null
  */
  void setSearchEntry(gtk.entry.Entry entry = null)
  {
    gtk_tree_view_set_search_entry(cast(GtkTreeView*)this._cPtr, entry ? cast(GtkEntry*)entry._cPtr(No.Dup) : null);
  }

  /**
      Sets the compare function for the interactive search capabilities; note
      that somewhat like strcmp() returning 0 for equality
      #GtkTreeViewSearchEqualFunc returns false on matches.
  
      Params:
        searchEqualFunc = the compare function to use during the search
  */
  void setSearchEqualFunc(gtk.types.TreeViewSearchEqualFunc searchEqualFunc)
  {
    extern(C) gboolean _searchEqualFuncCallback(GtkTreeModel* model, int column, const(char)* key, GtkTreeIter* iter, void* searchData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TreeViewSearchEqualFunc*)searchData;
      string _key = key.fromCString(No.Free);

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), column, _key, iter ? new gtk.tree_iter.TreeIter(cast(void*)iter, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _searchEqualFuncCB = searchEqualFunc ? &_searchEqualFuncCallback : null;
    auto _searchEqualFunc = searchEqualFunc ? freezeDelegate(cast(void*)&searchEqualFunc) : null;
    GDestroyNotify _searchEqualFuncDestroyCB = searchEqualFunc ? &thawDelegate : null;
    gtk_tree_view_set_search_equal_func(cast(GtkTreeView*)this._cPtr, _searchEqualFuncCB, _searchEqualFunc, _searchEqualFuncDestroyCB);
  }

  /**
      Sets the function to use when positioning the search dialog.
  
      Params:
        func = the function to use to position the search dialog, or null
             to use the default search position function
  */
  void setSearchPositionFunc(gtk.types.TreeViewSearchPositionFunc func = null)
  {
    extern(C) void _funcCallback(GtkTreeView* treeView, GtkWidget* searchDialog, void* userData)
    {
      auto _dlg = cast(gtk.types.TreeViewSearchPositionFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_view.TreeView)(cast(void*)treeView, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(void*)searchDialog, No.Take));
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_view_set_search_position_func(cast(GtkTreeView*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets whether to draw and enable expanders and indent child rows in
      tree_view.  When disabled there will be no expanders visible in trees
      and there will be no way to expand and collapse rows by default.  Also
      note that hiding the expanders will disable the default indentation.  You
      can set a custom indentation in this case using
      [gtk.tree_view.TreeView.setLevelIndentation].
      This does not have any visible effects for lists.
  
      Params:
        enabled = true to enable expander drawing, false otherwise.
  */
  void setShowExpanders(bool enabled)
  {
    gtk_tree_view_set_show_expanders(cast(GtkTreeView*)this._cPtr, enabled);
  }

  /**
      Sets the tip area of tooltip to the area path, column and cell have
      in common.  For example if path is null and column is set, the tip
      area will be set to the full area covered by column.  See also
      [gtk.tooltip.Tooltip.setTipArea].
      
      Note that if path is not specified and cell is set and part of a column
      containing the expander, the tooltip might not show and hide at the correct
      position.  In such cases path must be set to the current node under the
      mouse cursor for this function to operate correctly.
      
      See also [gtk.tree_view.TreeView.setTooltipColumn] for a simpler alternative.
  
      Params:
        tooltip = a #GtkTooltip
        path = a #GtkTreePath or null
        column = a #GtkTreeViewColumn or null
        cell = a #GtkCellRenderer or null
  */
  void setTooltipCell(gtk.tooltip.Tooltip tooltip, gtk.tree_path.TreePath path = null, gtk.tree_view_column.TreeViewColumn column = null, gtk.cell_renderer.CellRenderer cell = null)
  {
    gtk_tree_view_set_tooltip_cell(cast(GtkTreeView*)this._cPtr, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, column ? cast(GtkTreeViewColumn*)column._cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null);
  }

  /**
      If you only plan to have simple (text-only) tooltips on full rows, you
      can use this function to have #GtkTreeView handle these automatically
      for you. column should be set to the column in tree_view’s model
      containing the tooltip texts, or -1 to disable this feature.
      
      When enabled, #GtkWidget:has-tooltip will be set to true and
      tree_view will connect a #GtkWidget::query-tooltip signal handler.
      
      Note that the signal handler sets the text with [gtk.tooltip.Tooltip.setMarkup],
      so &, <, etc have to be escaped in the text.
  
      Params:
        column = an integer, which is a valid column number for tree_view’s model
  */
  void setTooltipColumn(int column)
  {
    gtk_tree_view_set_tooltip_column(cast(GtkTreeView*)this._cPtr, column);
  }

  /**
      Sets the tip area of tooltip to be the area covered by the row at path.
      See also [gtk.tree_view.TreeView.setTooltipColumn] for a simpler alternative.
      See also [gtk.tooltip.Tooltip.setTipArea].
  
      Params:
        tooltip = a #GtkTooltip
        path = a #GtkTreePath
  */
  void setTooltipRow(gtk.tooltip.Tooltip tooltip, gtk.tree_path.TreePath path)
  {
    gtk_tree_view_set_tooltip_row(cast(GtkTreeView*)this._cPtr, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkAdjustment for the current vertical aspect.
  
      Params:
        adjustment = The #GtkAdjustment to set, or null
  
      Deprecated: Use [gtk.scrollable.Scrollable.setVadjustment]
  */
  void setVadjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_tree_view_set_vadjustment(cast(GtkTreeView*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Undoes the effect of
      [gtk.tree_view.TreeView.enableModelDragDest]. Calling this method sets
      #GtkTreeView:reorderable to false.
  */
  void unsetRowsDragDest()
  {
    gtk_tree_view_unset_rows_drag_dest(cast(GtkTreeView*)this._cPtr);
  }

  /**
      Undoes the effect of
      [gtk.tree_view.TreeView.enableModelDragSource]. Calling this method sets
      #GtkTreeView:reorderable to false.
  */
  void unsetRowsDragSource()
  {
    gtk_tree_view_unset_rows_drag_source(cast(GtkTreeView*)this._cPtr);
  }

  /**
      Connect to `ColumnsChanged` signal.
  
      The number of columns of the treeview has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_view.TreeView treeView))
  
          `treeView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectColumnsChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("columns-changed", closure, after);
  }

  /**
      Connect to `CursorChanged` signal.
  
      The position of the cursor (focused cell) has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_view.TreeView treeView))
  
          `treeView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCursorChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cursor-changed", closure, after);
  }

  /**
      Connect to `ExpandCollapseCursorRow` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool object, bool p0, bool p1, gtk.tree_view.TreeView treeView))
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `p1`  (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectExpandCollapseCursorRow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("expand-collapse-cursor-row", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      The #GtkTreeView::move-cursor signal is a [keybinding
        signal][GtkBindingSignal] which gets emitted when the user
        presses one of the cursor keys.
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the cursor
        programmatically. In contrast to [gtk.tree_view.TreeView.setCursor] and
        [gtk.tree_view.TreeView.setCursorOnCell] when moving horizontally
        #GtkTreeView::move-cursor does not reset the current selection.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.MovementStep step, int direction, gtk.tree_view.TreeView treeView))
  
          `step` the granularity of the move, as a
            #GtkMovementStep. [gtk.types.MovementStep.LogicalPositions],
            [gtk.types.MovementStep.VisualPositions], [gtk.types.MovementStep.DisplayLines],
            [gtk.types.MovementStep.Pages] and [gtk.types.MovementStep.BufferEnds] are
            supported. [gtk.types.MovementStep.LogicalPositions] and
            [gtk.types.MovementStep.VisualPositions] are treated identically. (optional)
  
          `direction` the direction to move: +1 to move forwards;
            -1 to move backwards. The resulting movement is
            undefined for all other values. (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` true if step is supported, false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `RowActivated` signal.
  
      The "row-activated" signal is emitted when the method
        [gtk.tree_view.TreeView.rowActivated] is called, when the user double
        clicks a treeview row with the "activate-on-single-click"
        property set to false, or when the user single clicks a row when
        the "activate-on-single-click" property set to true. It is also
        emitted when a non-editable row is selected and one of the keys:
        Space, Shift+Space, Return or Enter is pressed.
        
        For selection handling refer to the
        [tree widget conceptual overview](TreeWidget.html)
        as well as #GtkTreeSelection.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_path.TreePath path, gtk.tree_view_column.TreeViewColumn column, gtk.tree_view.TreeView treeView))
  
          `path` the #GtkTreePath for the activated row (optional)
  
          `column` the #GtkTreeViewColumn in which the activation occurred (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.tree_view_column.TreeViewColumn)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-activated", closure, after);
  }

  /**
      Connect to `RowCollapsed` signal.
  
      The given row has been collapsed (child nodes are hidden).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_iter.TreeIter iter, gtk.tree_path.TreePath path, gtk.tree_view.TreeView treeView))
  
          `iter` the tree iter of the collapsed row (optional)
  
          `path` a tree path that points to the row (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowCollapsed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-collapsed", closure, after);
  }

  /**
      Connect to `RowExpanded` signal.
  
      The given row has been expanded (child nodes are shown).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_iter.TreeIter iter, gtk.tree_path.TreePath path, gtk.tree_view.TreeView treeView))
  
          `iter` the tree iter of the expanded row (optional)
  
          `path` a tree path that points to the row (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowExpanded(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-expanded", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_view.TreeView treeView))
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectAll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SelectCursorParent` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_view.TreeView treeView))
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectCursorParent(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-cursor-parent", closure, after);
  }

  /**
      Connect to `SelectCursorRow` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool object, gtk.tree_view.TreeView treeView))
  
          `object`  (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectCursorRow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-cursor-row", closure, after);
  }

  /**
      Connect to `StartInteractiveSearch` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_view.TreeView treeView))
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStartInteractiveSearch(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("start-interactive-search", closure, after);
  }

  /**
      Connect to `TestCollapseRow` signal.
  
      The given row is about to be collapsed (hide its children nodes). Use this
        signal if you need to control the collapsibility of individual rows.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_iter.TreeIter iter, gtk.tree_path.TreePath path, gtk.tree_view.TreeView treeView))
  
          `iter` the tree iter of the row to collapse (optional)
  
          `path` a tree path that points to the row (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` false to allow collapsing, true to reject
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTestCollapseRow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("test-collapse-row", closure, after);
  }

  /**
      Connect to `TestExpandRow` signal.
  
      The given row is about to be expanded (show its children nodes). Use this
        signal if you need to control the expandability of individual rows.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_iter.TreeIter iter, gtk.tree_path.TreePath path, gtk.tree_view.TreeView treeView))
  
          `iter` the tree iter of the row to expand (optional)
  
          `path` a tree path that points to the row (optional)
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` false to allow expansion, true to reject
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectTestExpandRow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.tree_iter.TreeIter)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gtk.tree_path.TreePath)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("test-expand-row", closure, after);
  }

  /**
      Connect to `ToggleCursorRow` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_view.TreeView treeView))
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleCursorRow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-row", closure, after);
  }

  /**
      Connect to `UnselectAll` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.tree_view.TreeView treeView))
  
          `treeView` the instance the signal is connected to (optional)
  
          `Returns` 
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view.TreeView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }
}
