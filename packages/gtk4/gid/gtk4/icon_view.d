/// Module for [IconView] class
module gid.gtk4.icon_view;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.content_formats;
import gid.gdk4.paintable;
import gid.gdk4.rectangle;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.cell_area;
import gid.gtk4.cell_layout;
import gid.gtk4.cell_layout_mixin;
import gid.gtk4.cell_renderer;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.scrollable;
import gid.gtk4.scrollable_mixin;
import gid.gtk4.tooltip;
import gid.gtk4.tree_iter;
import gid.gtk4.tree_model;
import gid.gtk4.tree_path;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    [gid.gtk4.icon_view.IconView] is a widget which displays data in a grid of icons.
    
    <picture>
      <source srcset="icon-view-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkIconView" src="icon-view.png">
    </picture>
    
    [gid.gtk4.icon_view.IconView] provides an alternative view on a [gid.gtk4.tree_model.TreeModel].
    It displays the model as a grid of icons with labels. Like
    [gid.gtk4.tree_view.TreeView], it allows to select one or multiple items
    (depending on the selection mode, see [gid.gtk4.icon_view.IconView.setSelectionMode]).
    In addition to selection with the arrow keys, [gid.gtk4.icon_view.IconView] supports
    rubberband selection, which is controlled by dragging the pointer.
    
    Note that if the tree model is backed by an actual tree store (as
    opposed to a flat list where the mapping to icons is obvious),
    [gid.gtk4.icon_view.IconView] will only display the first level of the tree and
    ignore the tree’s branches.
    
    ## CSS nodes
    
    ```
    iconview.view
    ╰── [rubberband]
    ```
    
    [gid.gtk4.icon_view.IconView] has a single CSS node with name iconview and style class .view.
    For rubberband selection, a subnode with name rubberband is used.

    Deprecated: Use [gid.gtk4.grid_view.GridView] instead
*/
class IconView : gid.gtk4.widget.Widget, gid.gtk4.cell_layout.CellLayout, gid.gtk4.scrollable.Scrollable
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
      Get builder for [gid.gtk4.icon_view.IconView]
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
      Returns: The [gid.gtk4.cell_area.CellArea] used to layout cell renderers for this view.
        
        If no area is specified when creating the icon view with [gid.gtk4.icon_view.IconView.newWithArea]
        a [gid.gtk4.cell_area_box.CellAreaBox] will be used.
  */
  @property gid.gtk4.cell_area.CellArea cellArea() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.cell_area.CellArea)("cell-area");
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
  @property gid.gtk4.types.Orientation itemOrientation() nothrow
  {
    return getItemOrientation();
  }

  /**
      Set `itemOrientation` property.
      Params:
        propval = The item-orientation property specifies how the cells (i.e. the icon and
          the text) of the item are positioned relative to each other.
  */
  @property void itemOrientation(gid.gtk4.types.Orientation propval) nothrow
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
      Get `markupColumn` property.
      Returns: The ::markup-column property contains the number of the model column
        containing markup information to be displayed. The markup column must be
        of type `G_TYPE_STRING`. If this property and the :text-column property
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
          of type `G_TYPE_STRING`. If this property and the :text-column property
          are both set to column numbers, it overrides the text column.
          If both are set to -1, no texts are displayed.
  */
  @property void markupColumn(int propval) nothrow
  {
    setMarkupColumn(propval);
  }

  /**
      Get `model` property.
      Returns: The model of the icon view.
  */
  @property gid.gtk4.tree_model.TreeModel model() nothrow
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = The model of the icon view.
  */
  @property void model(gid.gtk4.tree_model.TreeModel propval) nothrow
  {
    setModel(propval);
  }

  /**
      Get `pixbufColumn` property.
      Returns: The ::pixbuf-column property contains the number of the model column
        containing the pixbufs which are displayed. The pixbuf column must be
        of type `GDK_TYPE_PIXBUF`. Setting this property to -1 turns off the
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
          of type `GDK_TYPE_PIXBUF`. Setting this property to -1 turns off the
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
        icon view. If the mode is [gid.gtk4.types.SelectionMode.Multiple], rubberband selection
        is enabled, for the other modes, only keyboard selection is possible.
  */
  @property gid.gtk4.types.SelectionMode selectionMode() nothrow
  {
    return getSelectionMode();
  }

  /**
      Set `selectionMode` property.
      Params:
        propval = The ::selection-mode property specifies the selection mode of
          icon view. If the mode is [gid.gtk4.types.SelectionMode.Multiple], rubberband selection
          is enabled, for the other modes, only keyboard selection is possible.
  */
  @property void selectionMode(gid.gtk4.types.SelectionMode propval) nothrow
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
        of type `G_TYPE_STRING`. If this property and the :markup-column
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
          of type `G_TYPE_STRING`. If this property and the :markup-column
          property are both set to -1, no texts are displayed.
  */
  @property void textColumn(int propval) nothrow
  {
    setTextColumn(propval);
  }

  /**
      Get `tooltipColumn` property.
      Returns: The column of the icon view model which is being used for displaying
        tooltips on it's rows.
  */
  @property int tooltipColumn() nothrow
  {
    return getTooltipColumn();
  }

  /**
      Set `tooltipColumn` property.
      Params:
        propval = The column of the icon view model which is being used for displaying
          tooltips on it's rows.
  */
  @property void tooltipColumn(int propval) nothrow
  {
    setTooltipColumn(propval);
  }

  mixin CellLayoutT!();
  mixin ScrollableT!();

  /**
      Creates a new [gid.gtk4.icon_view.IconView] widget
      Returns: A newly created [gid.gtk4.icon_view.IconView] widget
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gid.gtk4.icon_view.IconView] widget using the
      specified area to layout cells inside the icons.
  
      Params:
        area = the [gid.gtk4.cell_area.CellArea] to use to layout cells
      Returns: A newly created [gid.gtk4.icon_view.IconView] widget
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  static gid.gtk4.icon_view.IconView newWithArea(gid.gtk4.cell_area.CellArea area) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new_with_area(area ? cast(GtkCellArea*)area._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.icon_view.IconView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new [gid.gtk4.icon_view.IconView] widget with the model model.
  
      Params:
        model = The model.
      Returns: A newly created [gid.gtk4.icon_view.IconView] widget.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  static gid.gtk4.icon_view.IconView newWithModel(gid.gtk4.tree_model.TreeModel model) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_icon_view_new_with_model(model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.icon_view.IconView)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gdk4.paintable.Paintable] representation of the item at path.
      This image is used for a drag icon.
  
      Params:
        path = a [gid.gtk4.tree_path.TreePath] in icon_view
      Returns: a newly-allocated [gid.gdk4.paintable.Paintable] of the drag icon.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  gid.gdk4.paintable.Paintable createDragIcon(gid.gtk4.tree_path.TreePath path) nothrow
  {
    GdkPaintable* _cretval;
    _cretval = gtk_icon_view_create_drag_icon(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.paintable.Paintable)(cast(GdkPaintable*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Turns icon_view into a drop destination for automatic DND. Calling this
      method sets [gid.gtk4.icon_view.IconView]:reorderable to false.
  
      Params:
        formats = the formats that the drag will support
        actions = the bitmask of possible actions for a drag to this
             widget
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void enableModelDragDest(gid.gdk4.content_formats.ContentFormats formats, gid.gdk4.types.DragAction actions) nothrow
  {
    gtk_icon_view_enable_model_drag_dest(cast(GtkIconView*)this._cPtr, formats ? cast(GdkContentFormats*)formats._cPtr(No.Dup) : null, actions);
  }

  /**
      Turns icon_view into a drag source for automatic DND. Calling this
      method sets [gid.gtk4.icon_view.IconView]:reorderable to false.
  
      Params:
        startButtonMask = Mask of allowed buttons to start drag
        formats = the formats that the drag will support
        actions = the bitmask of possible actions for a drag from this
             widget
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void enableModelDragSource(gid.gdk4.types.ModifierType startButtonMask, gid.gdk4.content_formats.ContentFormats formats, gid.gdk4.types.DragAction actions) nothrow
  {
    gtk_icon_view_enable_model_drag_source(cast(GtkIconView*)this._cPtr, startButtonMask, formats ? cast(GdkContentFormats*)formats._cPtr(No.Dup) : null, actions);
  }

  /**
      Gets the setting set by [gid.gtk4.icon_view.IconView.setActivateOnSingleClick].
      Returns: true if item-activated will be emitted on a single click
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
        path = a [gid.gtk4.tree_path.TreePath]
        cell = a [gid.gtk4.cell_renderer.CellRenderer]
        rect = rectangle to fill with cell rect
      Returns: false if there is no such item, true otherwise
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  bool getCellRect(gid.gtk4.tree_path.TreePath path, gid.gtk4.cell_renderer.CellRenderer cell, out gid.gdk4.rectangle.Rectangle rect) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_icon_view_get_cell_rect(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, cast(GdkRectangle*)&rect);
    return _retval;
  }

  /**
      Returns the value of the ::column-spacing property.
      Returns: the space between columns
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  int getColumns() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_columns(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  alias getCursor = gid.gtk4.widget.Widget.getCursor;

  /**
      Fills in path and cell with the current cursor path and cell.
      If the cursor isn’t currently set, then *path will be null.
      If no cell currently has focus, then *cell will be null.
      
      The returned [gid.gtk4.tree_path.TreePath] must be freed with [gid.gtk4.tree_path.TreePath.free].
  
      Params:
        path = Return location for the current
            cursor path
        cell = Return location the current
            focus cell
      Returns: true if the cursor is set.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  bool getCursor(out gid.gtk4.tree_path.TreePath path, out gid.gtk4.cell_renderer.CellRenderer cell) nothrow
  {
    bool _retval;
    GtkTreePath* _path;
    GtkCellRenderer* _cell;
    _retval = cast(bool)gtk_icon_view_get_cursor(cast(GtkIconView*)this._cPtr, &_path, &_cell);
    if (_path)
      path = new gid.gtk4.tree_path.TreePath(cast(void*)_path, Yes.Take);
    cell = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(_cell, No.Take);
    return _retval;
  }

  /**
      Determines the destination item for a given position.
  
      Params:
        dragX = the position to determine the destination item for
        dragY = the position to determine the destination item for
        path = Return location for the path of the item
        pos = Return location for the drop position
      Returns: whether there is an item at the given position.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  bool getDestItemAtPos(int dragX, int dragY, out gid.gtk4.tree_path.TreePath path, out gid.gtk4.types.IconViewDropPosition pos) nothrow
  {
    bool _retval;
    GtkTreePath* _path;
    _retval = cast(bool)gtk_icon_view_get_dest_item_at_pos(cast(GtkIconView*)this._cPtr, dragX, dragY, &_path, &pos);
    if (_path)
      path = new gid.gtk4.tree_path.TreePath(cast(void*)_path, Yes.Take);
    return _retval;
  }

  /**
      Gets information about the item that is highlighted for feedback.
  
      Params:
        path = Return location for the path of
            the highlighted item
        pos = Return location for the drop position
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void getDragDestItem(out gid.gtk4.tree_path.TreePath path, out gid.gtk4.types.IconViewDropPosition pos) nothrow
  {
    GtkTreePath* _path;
    gtk_icon_view_get_drag_dest_item(cast(GtkIconView*)this._cPtr, &_path, &pos);
    if (_path)
      path = new gid.gtk4.tree_path.TreePath(cast(void*)_path, Yes.Take);
  }

  /**
      Gets the path and cell for the icon at the given position.
  
      Params:
        x = The x position to be identified
        y = The y position to be identified
        path = Return location for the path
        cell = Return location for the renderer
            responsible for the cell at (`x`, `y`)
      Returns: true if an item exists at the specified position
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  bool getItemAtPos(int x, int y, out gid.gtk4.tree_path.TreePath path, out gid.gtk4.cell_renderer.CellRenderer cell) nothrow
  {
    bool _retval;
    GtkTreePath* _path;
    GtkCellRenderer* _cell;
    _retval = cast(bool)gtk_icon_view_get_item_at_pos(cast(GtkIconView*)this._cPtr, x, y, &_path, &_cell);
    if (_path)
      path = new gid.gtk4.tree_path.TreePath(cast(void*)_path, Yes.Take);
    cell = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.cell_renderer.CellRenderer)(_cell, No.Take);
    return _retval;
  }

  /**
      Gets the column in which the item path is currently
      displayed. Column numbers start at 0.
  
      Params:
        path = the [gid.gtk4.tree_path.TreePath] of the item
      Returns: The column in which the item is displayed
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  int getItemColumn(gid.gtk4.tree_path.TreePath path) nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_item_column(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the value of the ::item-orientation property which determines
      whether the labels are drawn beside the icons instead of below.
      Returns: the relative position of texts and icons
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  gid.gtk4.types.Orientation getItemOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_icon_view_get_item_orientation(cast(GtkIconView*)this._cPtr);
    gid.gtk4.types.Orientation _retval = cast(gid.gtk4.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Returns the value of the ::item-padding property.
      Returns: the padding around items
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
        path = the [gid.gtk4.tree_path.TreePath] of the item
      Returns: The row in which the item is displayed
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  int getItemRow(gid.gtk4.tree_path.TreePath path) nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_item_row(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns the value of the ::item-width property.
      Returns: the width of a single item, or -1
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  int getMarkupColumn() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_markup_column(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      Returns the model the [gid.gtk4.icon_view.IconView] is based on.  Returns null if the
      model is unset.
      Returns: The currently used [gid.gtk4.tree_model.TreeModel]
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  gid.gtk4.tree_model.TreeModel getModel() nothrow
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_icon_view_get_model(cast(GtkIconView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the path for the icon at the given position.
  
      Params:
        x = The x position to be identified
        y = The y position to be identified
      Returns: The [gid.gtk4.tree_path.TreePath] corresponding
        to the icon or null if no icon exists at that position.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  gid.gtk4.tree_path.TreePath getPathAtPos(int x, int y) nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_icon_view_get_path_at_pos(cast(GtkIconView*)this._cPtr, x, y);
    auto _retval = _cretval ? new gid.gtk4.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the column with pixbufs for icon_view.
      Returns: the pixbuf column, or -1 if it’s unset.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
      want to convert the returned list into a list of `GtkTreeRowReferences`.
      To do this, you can use [gid.gtk4.tree_row_reference.TreeRowReference.new_].
      
      To free the return value, use [gid.glib2.list.List.freeFull]:
      
      ```c
      GtkWidget *icon_view = gtk_icon_view_new ();
      // Use icon_view
      
      GList *list = gtk_icon_view_get_selected_items (GTK_ICON_VIEW (icon_view));
      
      // use list
      
      g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
      ```
      Returns: A [gid.glib2.list.List] containing a [gid.gtk4.tree_path.TreePath] for each selected row.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  gid.gtk4.tree_path.TreePath[] getSelectedItems() nothrow
  {
    GList* _cretval;
    _cretval = gtk_icon_view_get_selected_items(cast(GtkIconView*)this._cPtr);
    auto _retval = gListToD!(gid.gtk4.tree_path.TreePath, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of the icon_view.
      Returns: the current selection mode
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  gid.gtk4.types.SelectionMode getSelectionMode() nothrow
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_icon_view_get_selection_mode(cast(GtkIconView*)this._cPtr);
    gid.gtk4.types.SelectionMode _retval = cast(gid.gtk4.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Returns the value of the ::spacing property.
      Returns: the space between cells
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  int getTooltipColumn() nothrow
  {
    int _retval;
    _retval = gtk_icon_view_get_tooltip_column(cast(GtkIconView*)this._cPtr);
    return _retval;
  }

  /**
      This function is supposed to be used in a `GtkWidget::query-tooltip`
      signal handler for [gid.gtk4.icon_view.IconView]. The `x`, `y` and keyboard_tip values
      which are received in the signal handler, should be passed to this
      function without modification.
      
      The return value indicates whether there is an icon view item at the given
      coordinates (true) or not (false) for mouse tooltips. For keyboard
      tooltips the item returned will be the cursor item. When true, then any of
      model, path and iter which have been provided will be set to point to
      that row and the corresponding model.
  
      Params:
        x = the x coordinate (relative to widget coordinates)
        y = the y coordinate (relative to widget coordinates)
        keyboardTip = whether this is a keyboard tooltip or not
        model = a pointer to receive a [gid.gtk4.tree_model.TreeModel]
        path = a pointer to receive a [gid.gtk4.tree_path.TreePath]
        iter = a pointer to receive a [gid.gtk4.tree_iter.TreeIter]
      Returns: whether or not the given tooltip context points to an item
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  bool getTooltipContext(int x, int y, bool keyboardTip, out gid.gtk4.tree_model.TreeModel model, out gid.gtk4.tree_path.TreePath path, out gid.gtk4.tree_iter.TreeIter iter) nothrow
  {
    bool _retval;
    GtkTreeModel* _model;
    GtkTreePath* _path;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk4.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_icon_view_get_tooltip_context(cast(GtkIconView*)this._cPtr, x, y, keyboardTip, &_model, &_path, _iter);
    model = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.tree_model.TreeModel)(_model, No.Take);
    if (_path)
      path = new gid.gtk4.tree_path.TreePath(cast(void*)_path, Yes.Take);
    iter = new gid.gtk4.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Sets start_path and end_path to be the first and last visible path.
      Note that there may be invisible paths in between.
      
      Both paths should be freed with [gid.gtk4.tree_path.TreePath.free] after use.
  
      Params:
        startPath = Return location for start of region
        endPath = Return location for end of region
      Returns: true, if valid paths were placed in start_path and end_path
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  bool getVisibleRange(out gid.gtk4.tree_path.TreePath startPath, out gid.gtk4.tree_path.TreePath endPath) nothrow
  {
    bool _retval;
    GtkTreePath* _startPath;
    GtkTreePath* _endPath;
    _retval = cast(bool)gtk_icon_view_get_visible_range(cast(GtkIconView*)this._cPtr, &_startPath, &_endPath);
    if (_startPath)
      startPath = new gid.gtk4.tree_path.TreePath(cast(void*)_startPath, Yes.Take);
    if (_endPath)
      endPath = new gid.gtk4.tree_path.TreePath(cast(void*)_endPath, Yes.Take);
    return _retval;
  }

  /**
      Activates the item determined by path.
  
      Params:
        path = The [gid.gtk4.tree_path.TreePath] to be activated
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void itemActivated(gid.gtk4.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_item_activated(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Returns true if the icon pointed to by path is currently
      selected. If path does not point to a valid location, false is returned.
  
      Params:
        path = A [gid.gtk4.tree_path.TreePath] to check selection on.
      Returns: true if path is selected.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  bool pathIsSelected(gid.gtk4.tree_path.TreePath path) nothrow
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void scrollToPath(gid.gtk4.tree_path.TreePath path, bool useAlign, float rowAlign, float colAlign) nothrow
  {
    gtk_icon_view_scroll_to_path(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, useAlign, rowAlign, colAlign);
  }

  /**
      Selects all the icons. icon_view must has its selection mode set
      to [gid.gtk4.types.SelectionMode.Multiple].
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void selectAll() nothrow
  {
    gtk_icon_view_select_all(cast(GtkIconView*)this._cPtr);
  }

  /**
      Selects the row at path.
  
      Params:
        path = The [gid.gtk4.tree_path.TreePath] to be selected.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void selectPath(gid.gtk4.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_select_path(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected icon. Note that the model or
      selection cannot be modified from within this function.
  
      Params:
        func = The function to call for each selected icon.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void selectedForeach(gid.gtk4.types.IconViewForeachFunc func) nothrow
  {
    extern(C) void _funcCallback(GtkIconView* iconView, GtkTreePath* path, void* data) nothrow
    {
      auto _dlg = cast(gid.gtk4.types.IconViewForeachFunc*)data;
      auto _path = path ? new gid.gtk4.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.icon_view.IconView)(cast(void*)iconView, No.Take), _path);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.IconViewForeachFunc");
      }
      if (_path)
        _path._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_icon_view_selected_foreach(cast(GtkIconView*)this._cPtr, _funcCB, _func);
  }

  /**
      Causes the [gid.gtk4.icon_view.IconView]::item-activated signal to be emitted on
      a single click instead of a double click.
  
      Params:
        single = true to emit item-activated on a single click
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setColumns(int columns) nothrow
  {
    gtk_icon_view_set_columns(cast(GtkIconView*)this._cPtr, columns);
  }

  alias setCursor = gid.gtk4.widget.Widget.setCursor;

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
        path = A [gid.gtk4.tree_path.TreePath]
        cell = One of the cell renderers of icon_view
        startEditing = true if the specified cell should start being edited.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setCursor(gid.gtk4.tree_path.TreePath path, gid.gtk4.cell_renderer.CellRenderer cell, bool startEditing) nothrow
  {
    gtk_icon_view_set_cursor(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, startEditing);
  }

  /**
      Sets the item that is highlighted for feedback.
  
      Params:
        path = The path of the item to highlight
        pos = Specifies where to drop, relative to the item
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setDragDestItem(gid.gtk4.tree_path.TreePath path, gid.gtk4.types.IconViewDropPosition pos) nothrow
  {
    gtk_icon_view_set_drag_dest_item(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, pos);
  }

  /**
      Sets the ::item-orientation property which determines whether the labels
      are drawn beside the icons instead of below.
  
      Params:
        orientation = the relative position of texts and icons
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setItemOrientation(gid.gtk4.types.Orientation orientation) nothrow
  {
    gtk_icon_view_set_item_orientation(cast(GtkIconView*)this._cPtr, orientation);
  }

  /**
      Sets the [gid.gtk4.icon_view.IconView]:item-padding property which specifies the padding
      around each of the icon view’s items.
  
      Params:
        itemPadding = the item padding
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setMargin(int margin) nothrow
  {
    gtk_icon_view_set_margin(cast(GtkIconView*)this._cPtr, margin);
  }

  /**
      Sets the column with markup information for icon_view to be
      column. The markup column must be of type `G_TYPE_STRING`.
      If the markup column is set to something, it overrides
      the text column set by [gid.gtk4.icon_view.IconView.setTextColumn].
  
      Params:
        column = A column in the currently used model, or -1 to display no text
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setMarkupColumn(int column) nothrow
  {
    gtk_icon_view_set_markup_column(cast(GtkIconView*)this._cPtr, column);
  }

  /**
      Sets the model for a [gid.gtk4.icon_view.IconView].
      If the icon_view already has a model set, it will remove
      it before setting the new model.  If model is null, then
      it will unset the old model.
  
      Params:
        model = The model.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setModel(gid.gtk4.tree_model.TreeModel model = null) nothrow
  {
    gtk_icon_view_set_model(cast(GtkIconView*)this._cPtr, model ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets the column with pixbufs for icon_view to be column. The pixbuf
      column must be of type `GDK_TYPE_PIXBUF`
  
      Params:
        column = A column in the currently used model, or -1 to disable
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setPixbufColumn(int column) nothrow
  {
    gtk_icon_view_set_pixbuf_column(cast(GtkIconView*)this._cPtr, column);
  }

  /**
      This function is a convenience function to allow you to reorder models that
      support the [gid.gtk4.tree_drag_source_iface.TreeDragSourceIface] and the [gid.gtk4.tree_drag_dest_iface.TreeDragDestIface]. Both
      [gid.gtk4.tree_store.TreeStore] and [gid.gtk4.list_store.ListStore] support these. If reorderable is true, then
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setRowSpacing(int rowSpacing) nothrow
  {
    gtk_icon_view_set_row_spacing(cast(GtkIconView*)this._cPtr, rowSpacing);
  }

  /**
      Sets the selection mode of the icon_view.
  
      Params:
        mode = The selection mode
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setSelectionMode(gid.gtk4.types.SelectionMode mode) nothrow
  {
    gtk_icon_view_set_selection_mode(cast(GtkIconView*)this._cPtr, mode);
  }

  /**
      Sets the ::spacing property which specifies the space
      which is inserted between the cells (i.e. the icon and
      the text) of an item.
  
      Params:
        spacing = the spacing
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setSpacing(int spacing) nothrow
  {
    gtk_icon_view_set_spacing(cast(GtkIconView*)this._cPtr, spacing);
  }

  /**
      Sets the column with text for icon_view to be column. The text
      column must be of type `G_TYPE_STRING`.
  
      Params:
        column = A column in the currently used model, or -1 to display no text
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
        tooltip = a [gid.gtk4.tooltip.Tooltip]
        path = a [gid.gtk4.tree_path.TreePath]
        cell = a [gid.gtk4.cell_renderer.CellRenderer]
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setTooltipCell(gid.gtk4.tooltip.Tooltip tooltip, gid.gtk4.tree_path.TreePath path, gid.gtk4.cell_renderer.CellRenderer cell = null) nothrow
  {
    gtk_icon_view_set_tooltip_cell(cast(GtkIconView*)this._cPtr, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null);
  }

  /**
      If you only plan to have simple (text-only) tooltips on full items, you
      can use this function to have [gid.gtk4.icon_view.IconView] handle these automatically
      for you. column should be set to the column in icon_view’s model
      containing the tooltip texts, or -1 to disable this feature.
      
      When enabled, `GtkWidget:has-tooltip` will be set to true and
      icon_view will connect a `GtkWidget::query-tooltip` signal handler.
      
      Note that the signal handler sets the text with [gid.gtk4.tooltip.Tooltip.setMarkup],
      so &, <, etc have to be escaped in the text.
  
      Params:
        column = an integer, which is a valid column number for icon_view’s model
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
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
        tooltip = a [gid.gtk4.tooltip.Tooltip]
        path = a [gid.gtk4.tree_path.TreePath]
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void setTooltipItem(gid.gtk4.tooltip.Tooltip tooltip, gid.gtk4.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_set_tooltip_item(cast(GtkIconView*)this._cPtr, tooltip ? cast(GtkTooltip*)tooltip._cPtr(No.Dup) : null, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Unselects all the icons.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void unselectAll() nothrow
  {
    gtk_icon_view_unselect_all(cast(GtkIconView*)this._cPtr);
  }

  /**
      Unselects the row at path.
  
      Params:
        path = The [gid.gtk4.tree_path.TreePath] to be unselected.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void unselectPath(gid.gtk4.tree_path.TreePath path) nothrow
  {
    gtk_icon_view_unselect_path(cast(GtkIconView*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Undoes the effect of [gid.gtk4.icon_view.IconView.enableModelDragDest]. Calling this
      method sets [gid.gtk4.icon_view.IconView]:reorderable to false.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void unsetModelDragDest() nothrow
  {
    gtk_icon_view_unset_model_drag_dest(cast(GtkIconView*)this._cPtr);
  }

  /**
      Undoes the effect of [gid.gtk4.icon_view.IconView.enableModelDragSource]. Calling this
      method sets [gid.gtk4.icon_view.IconView]:reorderable to false.
  
      Deprecated: Use [gid.gtk4.grid_view.GridView] instead
  */
  void unsetModelDragSource() nothrow
  {
    gtk_icon_view_unset_model_drag_source(cast(GtkIconView*)this._cPtr);
  }

  /**
      Connect to `ActivateCursorItem` signal.
  
      A [keybinding signal][gid.gtk4.signal_action.SignalAction]
        which gets emitted when the user activates the currently
        focused item.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control activation
        programmatically.
        
        The default bindings for this signal are Space, Return and Enter.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk4.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
          `Returns` whether the item was activated
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateCursorItem(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.activateCursorItem");
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
  
          `void callback(gid.gtk4.tree_path.TreePath path, gid.gtk4.icon_view.IconView iconView)`
  
          `path` the [gid.gtk4.tree_path.TreePath] for the activated item (optional)
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectItemActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.tree_path.TreePath)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.itemActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("item-activated", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      The ::move-cursor signal is a
        [keybinding signal][gid.gtk4.signal_action.SignalAction]
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
  
          `bool callback(gid.gtk4.types.MovementStep step, int count, bool extend, bool modify, gid.gtk4.icon_view.IconView iconView)`
  
          `step` the granularity of the move, as a [gid.gtk4.types.MovementStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `extend` whether to extend the selection (optional)
  
          `modify` whether to modify the selection (optional)
  
          `iconView` the instance the signal is connected to (optional)
  
          `Returns` whether the cursor was moved
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == bool)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[4]);

      static if (Parameters!T.length > 4)
        _paramTuple[4] = getVal!(Parameters!T[4])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.moveCursor");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      A [keybinding signal][gid.gtk4.signal_action.SignalAction]
        which gets emitted when the user selects all items.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        The default binding for this signal is Ctrl-a.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.selectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SelectCursorItem` signal.
  
      A [keybinding signal][gid.gtk4.signal_action.SignalAction]
        which gets emitted when the user selects the item that is currently
        focused.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        There is no default binding for this signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectCursorItem(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.selectCursorItem");
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
  
          `void callback(gid.gtk4.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.selectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /**
      Connect to `ToggleCursorItem` signal.
  
      A [keybinding signal][gid.gtk4.signal_action.SignalAction]
        which gets emitted when the user toggles whether the currently
        focused item is selected or not. The exact effect of this
        depend on the selection mode.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        There is no default binding for this signal is Ctrl-Space.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleCursorItem(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.toggleCursorItem");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-item", closure, after);
  }

  /**
      Connect to `UnselectAll` signal.
  
      A [keybinding signal][gid.gtk4.signal_action.SignalAction]
        which gets emitted when the user unselects all items.
        
        Applications should not connect to it, but may emit it with
        [gid.gobject2.global.signalEmitByName] if they need to control selection
        programmatically.
        
        The default binding for this signal is Ctrl-Shift-a.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.icon_view.IconView iconView)`
  
          `iconView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.icon_view.IconView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.icon_view.IconView.unselectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.icon_view.IconView]
class IconViewGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.cell_layout.CellLayoutGidBuilderImpl!T, gid.gtk4.scrollable.ScrollableGidBuilderImpl!T
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
        propval = The [gid.gtk4.cell_area.CellArea] used to layout cell renderers for this view.
          
          If no area is specified when creating the icon view with [gid.gtk4.icon_view.IconView.newWithArea]
          a [gid.gtk4.cell_area_box.CellAreaBox] will be used.
      Returns: Builder instance for fluent chaining
  */
  T cellArea(gid.gtk4.cell_area.CellArea propval) nothrow
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
  T itemOrientation(gid.gtk4.types.Orientation propval) nothrow
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
      Set `markupColumn` property.
      Params:
        propval = The ::markup-column property contains the number of the model column
          containing markup information to be displayed. The markup column must be
          of type `G_TYPE_STRING`. If this property and the :text-column property
          are both set to column numbers, it overrides the text column.
          If both are set to -1, no texts are displayed.
      Returns: Builder instance for fluent chaining
  */
  T markupColumn(int propval) nothrow
  {
    return setProperty("markup-column", propval);
  }

  /**
      Set `model` property.
      Params:
        propval = The model of the icon view.
      Returns: Builder instance for fluent chaining
  */
  T model(gid.gtk4.tree_model.TreeModel propval) nothrow
  {
    return setProperty("model", propval);
  }

  /**
      Set `pixbufColumn` property.
      Params:
        propval = The ::pixbuf-column property contains the number of the model column
          containing the pixbufs which are displayed. The pixbuf column must be
          of type `GDK_TYPE_PIXBUF`. Setting this property to -1 turns off the
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
          icon view. If the mode is [gid.gtk4.types.SelectionMode.Multiple], rubberband selection
          is enabled, for the other modes, only keyboard selection is possible.
      Returns: Builder instance for fluent chaining
  */
  T selectionMode(gid.gtk4.types.SelectionMode propval) nothrow
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
          of type `G_TYPE_STRING`. If this property and the :markup-column
          property are both set to -1, no texts are displayed.
      Returns: Builder instance for fluent chaining
  */
  T textColumn(int propval) nothrow
  {
    return setProperty("text-column", propval);
  }

  /**
      Set `tooltipColumn` property.
      Params:
        propval = The column of the icon view model which is being used for displaying
          tooltips on it's rows.
      Returns: Builder instance for fluent chaining
  */
  T tooltipColumn(int propval) nothrow
  {
    return setProperty("tooltip-column", propval);
  }
}

/// Fluent builder for [gid.gtk4.icon_view.IconView]
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
