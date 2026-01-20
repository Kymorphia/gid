/// Module for [TreeViewColumn] class
module gtk.tree_view_column;

import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gobject.initially_unowned;
import gobject.object;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_area;
import gtk.cell_layout;
import gtk.cell_layout_mixin;
import gtk.cell_renderer;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.types;
import gtk.widget;

/**
    The GtkTreeViewColumn object represents a visible column in a #GtkTreeView widget.
    It allows to set properties of the column header, and functions as a holding pen for
    the cell renderers which determine how the data in the column is displayed.
    
    Please refer to the [tree widget conceptual overview](TreeWidget.html)
    for an overview of all the objects and data types related to the tree widget and how
    they work together.
*/
class TreeViewColumn : gobject.initially_unowned.InitiallyUnowned, gtk.buildable.Buildable, gtk.cell_layout.CellLayout
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
    return cast(void function())gtk_tree_view_column_get_type != &gidSymbolNotFound ? gtk_tree_view_column_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeViewColumn self()
  {
    return this;
  }

  /** */
  @property float alignment()
  {
    return getAlignment();
  }

  /** */
  @property void alignment(float propval)
  {
    return setAlignment(propval);
  }

  /** */
  @property bool clickable()
  {
    return getClickable();
  }

  /** */
  @property void clickable(bool propval)
  {
    return setClickable(propval);
  }

  /** */
  @property bool expand()
  {
    return getExpand();
  }

  /** */
  @property void expand(bool propval)
  {
    return setExpand(propval);
  }

  /** */
  @property int fixedWidth()
  {
    return getFixedWidth();
  }

  /** */
  @property void fixedWidth(int propval)
  {
    return setFixedWidth(propval);
  }

  /** */
  @property int maxWidth()
  {
    return getMaxWidth();
  }

  /** */
  @property void maxWidth(int propval)
  {
    return setMaxWidth(propval);
  }

  /** */
  @property int minWidth()
  {
    return getMinWidth();
  }

  /** */
  @property void minWidth(int propval)
  {
    return setMinWidth(propval);
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
  @property bool resizable()
  {
    return getResizable();
  }

  /** */
  @property void resizable(bool propval)
  {
    return setResizable(propval);
  }

  /** */
  @property gtk.types.TreeViewColumnSizing sizing()
  {
    return getSizing();
  }

  /** */
  @property void sizing(gtk.types.TreeViewColumnSizing propval)
  {
    return setSizing(propval);
  }

  /**
      Get `sortColumnId` property.
      Returns: Logical sort column ID this column sorts on when selected for sorting. Setting the sort column ID makes the column header
        clickable. Set to -1 to make the column unsortable.
  */
  @property int sortColumnId()
  {
    return getSortColumnId();
  }

  /**
      Set `sortColumnId` property.
      Params:
        propval = Logical sort column ID this column sorts on when selected for sorting. Setting the sort column ID makes the column header
          clickable. Set to -1 to make the column unsortable.
  */
  @property void sortColumnId(int propval)
  {
    return setSortColumnId(propval);
  }

  /** */
  @property bool sortIndicator()
  {
    return getSortIndicator();
  }

  /** */
  @property void sortIndicator(bool propval)
  {
    return setSortIndicator(propval);
  }

  /** */
  @property gtk.types.SortType sortOrder()
  {
    return getSortOrder();
  }

  /** */
  @property void sortOrder(gtk.types.SortType propval)
  {
    return setSortOrder(propval);
  }

  /** */
  @property int spacing()
  {
    return getSpacing();
  }

  /** */
  @property void spacing(int propval)
  {
    return setSpacing(propval);
  }

  /** */
  @property string title()
  {
    return getTitle();
  }

  /** */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /** */
  @property bool visible()
  {
    return getVisible();
  }

  /** */
  @property void visible(bool propval)
  {
    return setVisible(propval);
  }

  /** */
  @property gtk.widget.Widget widget()
  {
    return getWidget();
  }

  /** */
  @property void widget(gtk.widget.Widget propval)
  {
    return setWidget(propval);
  }

  /** */
  @property int width()
  {
    return getWidth();
  }

  /** */
  @property int xOffset()
  {
    return getXOffset();
  }

  mixin BuildableT!();
  mixin CellLayoutT!();

  /**
      Creates a new #GtkTreeViewColumn.
      Returns: A newly created #GtkTreeViewColumn.
  */
  this()
  {
    GtkTreeViewColumn* _cretval;
    _cretval = gtk_tree_view_column_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkTreeViewColumn using area to render its cells.
  
      Params:
        area = the #GtkCellArea that the newly created column should use to layout cells.
      Returns: A newly created #GtkTreeViewColumn.
  */
  static gtk.tree_view_column.TreeViewColumn newWithArea(gtk.cell_area.CellArea area)
  {
    GtkTreeViewColumn* _cretval;
    _cretval = gtk_tree_view_column_new_with_area(area ? cast(GtkCellArea*)area._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(GtkTreeViewColumn*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds an attribute mapping to the list in tree_column.  The column is the
      column of the model to get a value from, and the attribute is the
      parameter on cell_renderer to be set from the value. So for example
      if column 2 of the model contains strings, you could have the
      “text” attribute of a #GtkCellRendererText get its values from
      column 2.
  
      Params:
        cellRenderer = the #GtkCellRenderer to set attributes on
        attribute = An attribute on the renderer
        column = The column position on the model to get the attribute from.
  */
  void addAttribute(gtk.cell_renderer.CellRenderer cellRenderer, string attribute, int column)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    gtk_tree_view_column_add_attribute(cast(GtkTreeViewColumn*)this._cPtr, cellRenderer ? cast(GtkCellRenderer*)cellRenderer._cPtr(No.Dup) : null, _attribute, column);
  }

  /**
      Obtains the horizontal position and size of a cell in a column. If the
      cell is not found in the column, start_pos and width are not changed and
      false is returned.
  
      Params:
        cellRenderer = a #GtkCellRenderer
        xOffset = return location for the horizontal
                     position of cell within tree_column, may be null
        width = return location for the width of cell,
                  may be null
      Returns: true if cell belongs to tree_column.
  */
  bool cellGetPosition(gtk.cell_renderer.CellRenderer cellRenderer, out int xOffset, out int width)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_cell_get_position(cast(GtkTreeViewColumn*)this._cPtr, cellRenderer ? cast(GtkCellRenderer*)cellRenderer._cPtr(No.Dup) : null, cast(int*)&xOffset, cast(int*)&width);
    return _retval;
  }

  /**
      Obtains the width and height needed to render the column.  This is used
      primarily by the #GtkTreeView.
  
      Params:
        cellArea = The area a cell in the column will be allocated, or null
        xOffset = location to return x offset of a cell relative to cell_area, or null
        yOffset = location to return y offset of a cell relative to cell_area, or null
        width = location to return width needed to render a cell, or null
        height = location to return height needed to render a cell, or null
  */
  void cellGetSize(gdk.rectangle.Rectangle cellArea, out int xOffset, out int yOffset, out int width, out int height)
  {
    gtk_tree_view_column_cell_get_size(cast(GtkTreeViewColumn*)this._cPtr, cast(const(GdkRectangle)*)&cellArea, cast(int*)&xOffset, cast(int*)&yOffset, cast(int*)&width, cast(int*)&height);
  }

  /**
      Returns true if any of the cells packed into the tree_column are visible.
      For this to be meaningful, you must first initialize the cells with
      [gtk.tree_view_column.TreeViewColumn.cellSetCellData]
      Returns: true, if any of the cells packed into the tree_column are currently visible
  */
  bool cellIsVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_cell_is_visible(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Sets the cell renderer based on the tree_model and iter.  That is, for
      every attribute mapping in tree_column, it will get a value from the set
      column on the iter, and use that value to set the attribute on the cell
      renderer.  This is used primarily by the #GtkTreeView.
  
      Params:
        treeModel = The #GtkTreeModel to to get the cell renderers attributes from.
        iter = The #GtkTreeIter to to get the cell renderer’s attributes from.
        isExpander = true, if the row has children
        isExpanded = true, if the row has visible children
  */
  void cellSetCellData(gtk.tree_model.TreeModel treeModel, gtk.tree_iter.TreeIter iter, bool isExpander, bool isExpanded)
  {
    gtk_tree_view_column_cell_set_cell_data(cast(GtkTreeViewColumn*)this._cPtr, treeModel ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)treeModel)._cPtr(No.Dup) : null, cast(GtkTreeIter*)&iter, isExpander, isExpanded);
  }

  /**
      Unsets all the mappings on all renderers on the tree_column.
  */
  void clear()
  {
    gtk_tree_view_column_clear(cast(GtkTreeViewColumn*)this._cPtr);
  }

  /**
      Clears all existing attributes previously set with
      [gtk.tree_view_column.TreeViewColumn.setAttributes].
  
      Params:
        cellRenderer = a #GtkCellRenderer to clear the attribute mapping on.
  */
  void clearAttributes(gtk.cell_renderer.CellRenderer cellRenderer)
  {
    gtk_tree_view_column_clear_attributes(cast(GtkTreeViewColumn*)this._cPtr, cellRenderer ? cast(GtkCellRenderer*)cellRenderer._cPtr(No.Dup) : null);
  }

  /**
      Emits the “clicked” signal on the column.  This function will only work if
      tree_column is clickable.
  */
  void clicked()
  {
    gtk_tree_view_column_clicked(cast(GtkTreeViewColumn*)this._cPtr);
  }

  /**
      Sets the current keyboard focus to be at cell, if the column contains
      2 or more editable and activatable cells.
  
      Params:
        cell = A #GtkCellRenderer
  */
  void focusCell(gtk.cell_renderer.CellRenderer cell)
  {
    gtk_tree_view_column_focus_cell(cast(GtkTreeViewColumn*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null);
  }

  /**
      Returns the current x alignment of tree_column.  This value can range
      between 0.0 and 1.0.
      Returns: The current alignent of tree_column.
  */
  float getAlignment()
  {
    float _retval;
    _retval = gtk_tree_view_column_get_alignment(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns the button used in the treeview column header
      Returns: The button for the column header.
  */
  gtk.widget.Widget getButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_view_column_get_button(cast(GtkTreeViewColumn*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if the user can click on the header for the column.
      Returns: true if user can click the column header.
  */
  bool getClickable()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_get_clickable(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if the column expands to fill available space.
      Returns: true if the column expands to fill available space.
  */
  bool getExpand()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_get_expand(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Gets the fixed width of the column.  This may not be the actual displayed
      width of the column; for that, use [gtk.tree_view_column.TreeViewColumn.getWidth].
      Returns: The fixed width of the column.
  */
  int getFixedWidth()
  {
    int _retval;
    _retval = gtk_tree_view_column_get_fixed_width(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns the maximum width in pixels of the tree_column, or -1 if no maximum
      width is set.
      Returns: The maximum width of the tree_column.
  */
  int getMaxWidth()
  {
    int _retval;
    _retval = gtk_tree_view_column_get_max_width(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns the minimum width in pixels of the tree_column, or -1 if no minimum
      width is set.
      Returns: The minimum width of the tree_column.
  */
  int getMinWidth()
  {
    int _retval;
    _retval = gtk_tree_view_column_get_min_width(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if the tree_column can be reordered by the user.
      Returns: true if the tree_column can be reordered by the user.
  */
  bool getReorderable()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_get_reorderable(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if the tree_column can be resized by the end user.
      Returns: true, if the tree_column can be resized.
  */
  bool getResizable()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_get_resizable(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current type of tree_column.
      Returns: The type of tree_column.
  */
  gtk.types.TreeViewColumnSizing getSizing()
  {
    GtkTreeViewColumnSizing _cretval;
    _cretval = gtk_tree_view_column_get_sizing(cast(GtkTreeViewColumn*)this._cPtr);
    gtk.types.TreeViewColumnSizing _retval = cast(gtk.types.TreeViewColumnSizing)_cretval;
    return _retval;
  }

  /**
      Gets the logical sort_column_id that the model sorts on when this
      column is selected for sorting.
      See [gtk.tree_view_column.TreeViewColumn.setSortColumnId].
      Returns: the current sort_column_id for this column, or -1 if
                      this column can’t be used for sorting.
  */
  int getSortColumnId()
  {
    int _retval;
    _retval = gtk_tree_view_column_get_sort_column_id(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.tree_view_column.TreeViewColumn.setSortIndicator].
      Returns: whether the sort indicator arrow is displayed
  */
  bool getSortIndicator()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_get_sort_indicator(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gtk.tree_view_column.TreeViewColumn.setSortOrder].
      Returns: the sort order the sort indicator is indicating
  */
  gtk.types.SortType getSortOrder()
  {
    GtkSortType _cretval;
    _cretval = gtk_tree_view_column_get_sort_order(cast(GtkTreeViewColumn*)this._cPtr);
    gtk.types.SortType _retval = cast(gtk.types.SortType)_cretval;
    return _retval;
  }

  /**
      Returns the spacing of tree_column.
      Returns: the spacing of tree_column.
  */
  int getSpacing()
  {
    int _retval;
    _retval = gtk_tree_view_column_get_spacing(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns the title of the widget.
      Returns: the title of the column. This string should not be
        modified or freed.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_tree_view_column_get_title(cast(GtkTreeViewColumn*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the #GtkTreeView wherein tree_column has been inserted.
      If column is currently not inserted in any tree view, null is
      returned.
      Returns: The tree view wherein column has
            been inserted if any, null otherwise.
  */
  gtk.widget.Widget getTreeView()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_view_column_get_tree_view(cast(GtkTreeViewColumn*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if tree_column is visible.
      Returns: whether the column is visible or not.  If it is visible, then
        the tree will show the column.
  */
  bool getVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_view_column_get_visible(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GtkWidget in the button on the column header.
      If a custom widget has not been set then null is returned.
      Returns: The #GtkWidget in the column
            header, or null
  */
  gtk.widget.Widget getWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tree_view_column_get_widget(cast(GtkTreeViewColumn*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the current size of tree_column in pixels.
      Returns: The current width of tree_column.
  */
  int getWidth()
  {
    int _retval;
    _retval = gtk_tree_view_column_get_width(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Returns the current X offset of tree_column in pixels.
      Returns: The current X offset of tree_column.
  */
  int getXOffset()
  {
    int _retval;
    _retval = gtk_tree_view_column_get_x_offset(cast(GtkTreeViewColumn*)this._cPtr);
    return _retval;
  }

  /**
      Adds the cell to end of the column. If expand is false, then the cell
      is allocated no more space than it needs. Any unused space is divided
      evenly between cells for which expand is true.
  
      Params:
        cell = The #GtkCellRenderer.
        expand = true if cell is to be given extra space allocated to tree_column.
  */
  void packEnd(gtk.cell_renderer.CellRenderer cell, bool expand)
  {
    gtk_tree_view_column_pack_end(cast(GtkTreeViewColumn*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, expand);
  }

  /**
      Packs the cell into the beginning of the column. If expand is false, then
      the cell is allocated no more space than it needs. Any unused space is divided
      evenly between cells for which expand is true.
  
      Params:
        cell = The #GtkCellRenderer.
        expand = true if cell is to be given extra space allocated to tree_column.
  */
  void packStart(gtk.cell_renderer.CellRenderer cell, bool expand)
  {
    gtk_tree_view_column_pack_start(cast(GtkTreeViewColumn*)this._cPtr, cell ? cast(GtkCellRenderer*)cell._cPtr(No.Dup) : null, expand);
  }

  /**
      Flags the column, and the cell renderers added to this column, to have
      their sizes renegotiated.
  */
  void queueResize()
  {
    gtk_tree_view_column_queue_resize(cast(GtkTreeViewColumn*)this._cPtr);
  }

  /**
      Sets the alignment of the title or custom widget inside the column header.
      The alignment determines its location inside the button -- 0.0 for left, 0.5
      for center, 1.0 for right.
  
      Params:
        xalign = The alignment, which is between [0.0 and 1.0] inclusive.
  */
  void setAlignment(float xalign)
  {
    gtk_tree_view_column_set_alignment(cast(GtkTreeViewColumn*)this._cPtr, xalign);
  }

  /**
      Sets the #GtkTreeCellDataFunc to use for the column.  This
      function is used instead of the standard attributes mapping for
      setting the column value, and should set the value of tree_column's
      cell renderer as appropriate.  func may be null to remove an
      older one.
  
      Params:
        cellRenderer = A #GtkCellRenderer
        func = The #GtkTreeCellDataFunc to use.
  */
  void setCellDataFunc(gtk.cell_renderer.CellRenderer cellRenderer, gtk.types.TreeCellDataFunc func = null)
  {
    extern(C) void _funcCallback(GtkTreeViewColumn* treeColumn, GtkCellRenderer* cell, GtkTreeModel* treeModel, GtkTreeIter* iter, void* data)
    {
      auto _dlg = cast(gtk.types.TreeCellDataFunc*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_view_column.TreeViewColumn)(cast(void*)treeColumn, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.cell_renderer.CellRenderer)(cast(void*)cell, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)treeModel, No.Take), *cast(gtk.tree_iter.TreeIter*)iter);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_view_column_set_cell_data_func(cast(GtkTreeViewColumn*)this._cPtr, cellRenderer ? cast(GtkCellRenderer*)cellRenderer._cPtr(No.Dup) : null, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets the header to be active if clickable is true.  When the header is
      active, then it can take keyboard focus, and can be clicked.
  
      Params:
        clickable = true if the header is active.
  */
  void setClickable(bool clickable)
  {
    gtk_tree_view_column_set_clickable(cast(GtkTreeViewColumn*)this._cPtr, clickable);
  }

  /**
      Sets the column to take available extra space.  This space is shared equally
      amongst all columns that have the expand set to true.  If no column has this
      option set, then the last column gets all extra space.  By default, every
      column is created with this false.
      
      Along with “fixed-width”, the “expand” property changes when the column is
      resized by the user.
  
      Params:
        expand = true if the column should expand to fill available space.
  */
  void setExpand(bool expand)
  {
    gtk_tree_view_column_set_expand(cast(GtkTreeViewColumn*)this._cPtr, expand);
  }

  /**
      If fixed_width is not -1, sets the fixed width of tree_column; otherwise
      unsets it.  The effective value of fixed_width is clamped between the
      minimum and maximum width of the column; however, the value stored in the
      “fixed-width” property is not clamped.  If the column sizing is
      #GTK_TREE_VIEW_COLUMN_GROW_ONLY or #GTK_TREE_VIEW_COLUMN_AUTOSIZE, setting
      a fixed width overrides the automatically calculated width.  Note that
      fixed_width is only a hint to GTK+; the width actually allocated to the
      column may be greater or less than requested.
      
      Along with “expand”, the “fixed-width” property changes when the column is
      resized by the user.
  
      Params:
        fixedWidth = The new fixed width, in pixels, or -1.
  */
  void setFixedWidth(int fixedWidth)
  {
    gtk_tree_view_column_set_fixed_width(cast(GtkTreeViewColumn*)this._cPtr, fixedWidth);
  }

  /**
      Sets the maximum width of the tree_column.  If max_width is -1, then the
      maximum width is unset.  Note, the column can actually be wider than max
      width if it’s the last column in a view.  In this case, the column expands to
      fill any extra space.
  
      Params:
        maxWidth = The maximum width of the column in pixels, or -1.
  */
  void setMaxWidth(int maxWidth)
  {
    gtk_tree_view_column_set_max_width(cast(GtkTreeViewColumn*)this._cPtr, maxWidth);
  }

  /**
      Sets the minimum width of the tree_column.  If min_width is -1, then the
      minimum width is unset.
  
      Params:
        minWidth = The minimum width of the column in pixels, or -1.
  */
  void setMinWidth(int minWidth)
  {
    gtk_tree_view_column_set_min_width(cast(GtkTreeViewColumn*)this._cPtr, minWidth);
  }

  /**
      If reorderable is true, then the column can be reordered by the end user
      dragging the header.
  
      Params:
        reorderable = true, if the column can be reordered.
  */
  void setReorderable(bool reorderable)
  {
    gtk_tree_view_column_set_reorderable(cast(GtkTreeViewColumn*)this._cPtr, reorderable);
  }

  /**
      If resizable is true, then the user can explicitly resize the column by
      grabbing the outer edge of the column button.  If resizable is true and
      sizing mode of the column is #GTK_TREE_VIEW_COLUMN_AUTOSIZE, then the sizing
      mode is changed to #GTK_TREE_VIEW_COLUMN_GROW_ONLY.
  
      Params:
        resizable = true, if the column can be resized
  */
  void setResizable(bool resizable)
  {
    gtk_tree_view_column_set_resizable(cast(GtkTreeViewColumn*)this._cPtr, resizable);
  }

  /**
      Sets the growth behavior of tree_column to type.
  
      Params:
        type = The #GtkTreeViewColumnSizing.
  */
  void setSizing(gtk.types.TreeViewColumnSizing type)
  {
    gtk_tree_view_column_set_sizing(cast(GtkTreeViewColumn*)this._cPtr, type);
  }

  /**
      Sets the logical sort_column_id that this column sorts on when this column
      is selected for sorting.  Doing so makes the column header clickable.
  
      Params:
        sortColumnId = The sort_column_id of the model to sort on.
  */
  void setSortColumnId(int sortColumnId)
  {
    gtk_tree_view_column_set_sort_column_id(cast(GtkTreeViewColumn*)this._cPtr, sortColumnId);
  }

  /**
      Call this function with a setting of true to display an arrow in
      the header button indicating the column is sorted. Call
      [gtk.tree_view_column.TreeViewColumn.setSortOrder] to change the direction of
      the arrow.
  
      Params:
        setting = true to display an indicator that the column is sorted
  */
  void setSortIndicator(bool setting)
  {
    gtk_tree_view_column_set_sort_indicator(cast(GtkTreeViewColumn*)this._cPtr, setting);
  }

  /**
      Changes the appearance of the sort indicator.
      
      This does not actually sort the model.  Use
      [gtk.tree_view_column.TreeViewColumn.setSortColumnId] if you want automatic sorting
      support.  This function is primarily for custom sorting behavior, and should
      be used in conjunction with [gtk.tree_sortable.TreeSortable.setSortColumnId] to do
      that. For custom models, the mechanism will vary.
      
      The sort indicator changes direction to indicate normal sort or reverse sort.
      Note that you must have the sort indicator enabled to see anything when
      calling this function; see [gtk.tree_view_column.TreeViewColumn.setSortIndicator].
  
      Params:
        order = sort order that the sort indicator should indicate
  */
  void setSortOrder(gtk.types.SortType order)
  {
    gtk_tree_view_column_set_sort_order(cast(GtkTreeViewColumn*)this._cPtr, order);
  }

  /**
      Sets the spacing field of tree_column, which is the number of pixels to
      place between cell renderers packed into it.
  
      Params:
        spacing = distance between cell renderers in pixels.
  */
  void setSpacing(int spacing)
  {
    gtk_tree_view_column_set_spacing(cast(GtkTreeViewColumn*)this._cPtr, spacing);
  }

  /**
      Sets the title of the tree_column.  If a custom widget has been set, then
      this value is ignored.
  
      Params:
        title = The title of the tree_column.
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    gtk_tree_view_column_set_title(cast(GtkTreeViewColumn*)this._cPtr, _title);
  }

  /**
      Sets the visibility of tree_column.
  
      Params:
        visible = true if the tree_column is visible.
  */
  void setVisible(bool visible)
  {
    gtk_tree_view_column_set_visible(cast(GtkTreeViewColumn*)this._cPtr, visible);
  }

  /**
      Sets the widget in the header to be widget.  If widget is null, then the
      header button is set with a #GtkLabel set to the title of tree_column.
  
      Params:
        widget = A child #GtkWidget, or null.
  */
  void setWidget(gtk.widget.Widget widget = null)
  {
    gtk_tree_view_column_set_widget(cast(GtkTreeViewColumn*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Clicked` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_view_column.TreeViewColumn treeViewColumn))
  
          `treeViewColumn` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClicked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_view_column.TreeViewColumn)))
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
    return connectSignalClosure("clicked", closure, after);
  }
}
