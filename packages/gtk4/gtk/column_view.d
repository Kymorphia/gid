/// Module for [ColumnView] class
module gtk.column_view;

import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.column_view_column;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.list_item_factory;
import gtk.scroll_info;
import gtk.scrollable;
import gtk.scrollable_mixin;
import gtk.selection_model;
import gtk.sorter;
import gtk.types;
import gtk.widget;

/**
    [gtk.column_view.ColumnView] presents a large dynamic list of items using multiple columns
    with headers.
    
    [gtk.column_view.ColumnView] uses the factories of its columns to generate a cell widget for
    each column, for each visible item and displays them together as the row for
    this item.
    
    The `property@Gtk.ColumnView:show-row-separators` and
    `property@Gtk.ColumnView:show-column-separators` properties offer a simple way
    to display separators between the rows or columns.
    
    [gtk.column_view.ColumnView] allows the user to select items according to the selection
    characteristics of the model. For models that allow multiple selected items,
    it is possible to turn on *rubberband selection*, using
    `property@Gtk.ColumnView:enable-rubberband`.
    
    The column view supports sorting that can be customized by the user by
    clicking on column headers. To set this up, the [gtk.sorter.Sorter] returned by
    [gtk.column_view.ColumnView.getSorter] must be attached to a sort model for the
    data that the view is showing, and the columns must have sorters attached to
    them by calling [gtk.column_view_column.ColumnViewColumn.setSorter]. The initial sort
    order can be set with [gtk.column_view.ColumnView.sortByColumn].
    
    The column view also supports interactive resizing and reordering of
    columns, via Drag-and-Drop of the column headers. This can be enabled or
    disabled with the [gtk.column_view.ColumnView.reorderable] and
    [gtk.column_view_column.ColumnViewColumn.resizable] properties.
    
    To learn more about the list widget framework, see the
    [overview](section-list-widget.html).
    
    # CSS nodes
    
    ```
    columnview[.column-separators][.rich-list][.navigation-sidebar][.data-table]
    ├── header
    │   ├── <column header>
    ┊   ┊
    │   ╰── <column header>
    │
    ├── listview
    │
    ┊
    ╰── [rubberband]
    ```
    
    [gtk.column_view.ColumnView] uses a single CSS node named columnview. It may carry the
    .column-separators style class, when `property@Gtk.ColumnView:show-column-separators`
    property is set. Header widgets appear below a node with name header.
    The rows are contained in a [gtk.list_view.ListView] widget, so there is a listview
    node with the same structure as for a standalone [gtk.list_view.ListView] widget.
    If `property@Gtk.ColumnView:show-row-separators` is set, it will be passed
    on to the list view, causing its CSS node to carry the .separators style class.
    For rubberband selection, a node with name rubberband is used.
    
    The main columnview node may also carry style classes to select
    the style of [list presentation](section-list-widget.html#list-styles):
    .rich-list, .navigation-sidebar or .data-table.
    
    # Accessibility
    
    [gtk.column_view.ColumnView] uses the [gtk.types.AccessibleRole.TreeGrid] role, header title
    widgets are using the [gtk.types.AccessibleRole.ColumnHeader] role. The row widgets
    are using the [gtk.types.AccessibleRole.Row] role, and individual cells are using
    the [gtk.types.AccessibleRole.GridCell] role
*/
class ColumnView : gtk.widget.Widget, gtk.scrollable.Scrollable
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
    return cast(void function())gtk_column_view_get_type != &gidSymbolNotFound ? gtk_column_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ColumnView self()
  {
    return this;
  }

  /**
      Get `columns` property.
      Returns: The list of columns.
  */
  @property gio.list_model.ListModel columns()
  {
    return getColumns();
  }

  /**
      Get `enableRubberband` property.
      Returns: Allow rubberband selection.
  */
  @property bool enableRubberband()
  {
    return getEnableRubberband();
  }

  /**
      Set `enableRubberband` property.
      Params:
        propval = Allow rubberband selection.
  */
  @property void enableRubberband(bool propval)
  {
    return setEnableRubberband(propval);
  }

  /**
      Get `headerFactory` property.
      Returns: Factory for creating header widgets.
  */
  @property gtk.list_item_factory.ListItemFactory headerFactory()
  {
    return getHeaderFactory();
  }

  /**
      Set `headerFactory` property.
      Params:
        propval = Factory for creating header widgets.
  */
  @property void headerFactory(gtk.list_item_factory.ListItemFactory propval)
  {
    return setHeaderFactory(propval);
  }

  /**
      Get `model` property.
      Returns: Model for the items displayed.
  */
  @property gtk.selection_model.SelectionModel model()
  {
    return getModel();
  }

  /**
      Set `model` property.
      Params:
        propval = Model for the items displayed.
  */
  @property void model(gtk.selection_model.SelectionModel propval)
  {
    return setModel(propval);
  }

  /**
      Get `reorderable` property.
      Returns: Whether columns are reorderable.
  */
  @property bool reorderable()
  {
    return getReorderable();
  }

  /**
      Set `reorderable` property.
      Params:
        propval = Whether columns are reorderable.
  */
  @property void reorderable(bool propval)
  {
    return setReorderable(propval);
  }

  /**
      Get `rowFactory` property.
      Returns: The factory used for configuring rows.
  */
  @property gtk.list_item_factory.ListItemFactory rowFactory()
  {
    return getRowFactory();
  }

  /**
      Set `rowFactory` property.
      Params:
        propval = The factory used for configuring rows.
  */
  @property void rowFactory(gtk.list_item_factory.ListItemFactory propval)
  {
    return setRowFactory(propval);
  }

  /**
      Get `showColumnSeparators` property.
      Returns: Show separators between columns.
  */
  @property bool showColumnSeparators()
  {
    return getShowColumnSeparators();
  }

  /**
      Set `showColumnSeparators` property.
      Params:
        propval = Show separators between columns.
  */
  @property void showColumnSeparators(bool propval)
  {
    return setShowColumnSeparators(propval);
  }

  /**
      Get `showRowSeparators` property.
      Returns: Show separators between rows.
  */
  @property bool showRowSeparators()
  {
    return getShowRowSeparators();
  }

  /**
      Set `showRowSeparators` property.
      Params:
        propval = Show separators between rows.
  */
  @property void showRowSeparators(bool propval)
  {
    return setShowRowSeparators(propval);
  }

  /**
      Get `singleClickActivate` property.
      Returns: Activate rows on single click and select them on hover.
  */
  @property bool singleClickActivate()
  {
    return getSingleClickActivate();
  }

  /**
      Set `singleClickActivate` property.
      Params:
        propval = Activate rows on single click and select them on hover.
  */
  @property void singleClickActivate(bool propval)
  {
    return setSingleClickActivate(propval);
  }

  /**
      Get `sorter` property.
      Returns: Sorter with the sorting choices of the user.
  */
  @property gtk.sorter.Sorter sorter()
  {
    return getSorter();
  }

  /**
      Get `tabBehavior` property.
      Returns: Behavior of the <kbd>Tab</kbd> key
  */
  @property gtk.types.ListTabBehavior tabBehavior()
  {
    return getTabBehavior();
  }

  /**
      Set `tabBehavior` property.
      Params:
        propval = Behavior of the <kbd>Tab</kbd> key
  */
  @property void tabBehavior(gtk.types.ListTabBehavior propval)
  {
    return setTabBehavior(propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new [gtk.column_view.ColumnView].
      
      You most likely want to call [gtk.column_view.ColumnView.appendColumn]
      to add columns next.
  
      Params:
        model = the list model to use
      Returns: a new [gtk.column_view.ColumnView]
  */
  this(gtk.selection_model.SelectionModel model = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_column_view_new(model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(Yes.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
      Appends the column to the end of the columns in self.
  
      Params:
        column = a [gtk.column_view_column.ColumnViewColumn] that hasn't been added to a
            [gtk.column_view.ColumnView] yet
  */
  void appendColumn(gtk.column_view_column.ColumnViewColumn column)
  {
    gtk_column_view_append_column(cast(GtkColumnView*)this._cPtr, column ? cast(GtkColumnViewColumn*)column._cPtr(No.Dup) : null);
  }

  /**
      Gets the list of columns in this column view.
      
      This list is constant over the lifetime of self and can be used to
      monitor changes to the columns of self by connecting to the
      ::items-changed signal.
      Returns: The list managing the columns
  */
  gio.list_model.ListModel getColumns()
  {
    GListModel* _cretval;
    _cretval = gtk_column_view_get_columns(cast(GtkColumnView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether rows can be selected by dragging with the mouse.
      Returns: true if rubberband selection is enabled
  */
  bool getEnableRubberband()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_get_enable_rubberband(cast(GtkColumnView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the factory that's currently used to populate section headers.
      Returns: The factory in use
  */
  gtk.list_item_factory.ListItemFactory getHeaderFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_column_view_get_header_factory(cast(GtkColumnView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the model that's currently used to read the items displayed.
      Returns: The model in use
  */
  gtk.selection_model.SelectionModel getModel()
  {
    GtkSelectionModel* _cretval;
    _cretval = gtk_column_view_get_model(cast(GtkColumnView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether columns are reorderable.
      Returns: true if columns are reorderable
  */
  bool getReorderable()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_get_reorderable(cast(GtkColumnView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the factory set via [gtk.column_view.ColumnView.setRowFactory].
      Returns: The factory
  */
  gtk.list_item_factory.ListItemFactory getRowFactory()
  {
    GtkListItemFactory* _cretval;
    _cretval = gtk_column_view_get_row_factory(cast(GtkColumnView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_item_factory.ListItemFactory)(cast(GtkListItemFactory*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the list should show separators
      between columns.
      Returns: true if the list shows column separators
  */
  bool getShowColumnSeparators()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_get_show_column_separators(cast(GtkColumnView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the list should show separators
      between rows.
      Returns: true if the list shows separators
  */
  bool getShowRowSeparators()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_get_show_row_separators(cast(GtkColumnView*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether rows will be activated on single click and
      selected on hover.
      Returns: true if rows are activated on single click
  */
  bool getSingleClickActivate()
  {
    bool _retval;
    _retval = cast(bool)gtk_column_view_get_single_click_activate(cast(GtkColumnView*)this._cPtr);
    return _retval;
  }

  /**
      Returns a special sorter that reflects the users sorting
      choices in the column view.
      
      To allow users to customizable sorting by clicking on column
      headers, this sorter needs to be set on the sort model underneath
      the model that is displayed by the view.
      
      See [gtk.column_view_column.ColumnViewColumn.setSorter] for setting up
      per-column sorting.
      
      Here is an example:
      ```c
      gtk_column_view_column_set_sorter (column, sorter);
      gtk_column_view_append_column (view, column);
      sorter = g_object_ref (gtk_column_view_get_sorter (view)));
      model = gtk_sort_list_model_new (store, sorter);
      selection = gtk_no_selection_new (model);
      gtk_column_view_set_model (view, selection);
      ```
      Returns: the [gtk.sorter.Sorter] of self
  */
  gtk.sorter.Sorter getSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_column_view_get_sorter(cast(GtkColumnView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the behavior set for the <kbd>Tab</kbd> key.
      Returns: The behavior of the <kbd>Tab</kbd> key
  */
  gtk.types.ListTabBehavior getTabBehavior()
  {
    GtkListTabBehavior _cretval;
    _cretval = gtk_column_view_get_tab_behavior(cast(GtkColumnView*)this._cPtr);
    gtk.types.ListTabBehavior _retval = cast(gtk.types.ListTabBehavior)_cretval;
    return _retval;
  }

  /**
      Inserts a column at the given position in the columns of self.
      
      If column is already a column of self, it will be repositioned.
  
      Params:
        position = the position to insert column at
        column = the [gtk.column_view_column.ColumnViewColumn] to insert
  */
  void insertColumn(uint position, gtk.column_view_column.ColumnViewColumn column)
  {
    gtk_column_view_insert_column(cast(GtkColumnView*)this._cPtr, position, column ? cast(GtkColumnViewColumn*)column._cPtr(No.Dup) : null);
  }

  /**
      Removes the column from the list of columns of self.
  
      Params:
        column = a [gtk.column_view_column.ColumnViewColumn] that's part of self
  */
  void removeColumn(gtk.column_view_column.ColumnViewColumn column)
  {
    gtk_column_view_remove_column(cast(GtkColumnView*)this._cPtr, column ? cast(GtkColumnViewColumn*)column._cPtr(No.Dup) : null);
  }

  /**
      Scroll to the row at the given position - or cell if a column is
      given - and performs the actions specified in flags.
      
      This function works no matter if the listview is shown or focused.
      If it isn't, then the changes will take effect once that happens.
  
      Params:
        pos = position of the item
        column = The column to scroll to
            or null to not scroll columns.
        flags = actions to perform
        scroll = details of how to perform
            the scroll operation or null to scroll into view
  */
  void scrollTo(uint pos, gtk.column_view_column.ColumnViewColumn column, gtk.types.ListScrollFlags flags, gtk.scroll_info.ScrollInfo scroll = null)
  {
    gtk_column_view_scroll_to(cast(GtkColumnView*)this._cPtr, pos, column ? cast(GtkColumnViewColumn*)column._cPtr(No.Dup) : null, flags, scroll ? cast(GtkScrollInfo*)scroll._cPtr(Yes.Dup) : null);
  }

  /**
      Sets whether selections can be changed by dragging with the mouse.
  
      Params:
        enableRubberband = true to enable rubberband selection
  */
  void setEnableRubberband(bool enableRubberband)
  {
    gtk_column_view_set_enable_rubberband(cast(GtkColumnView*)this._cPtr, enableRubberband);
  }

  /**
      Sets the [gtk.list_item_factory.ListItemFactory] to use for populating the
      [gtk.list_header.ListHeader] objects used in section headers.
      
      If this factory is set to null, the list will not show
      section headers.
  
      Params:
        factory = the factory to use
  */
  void setHeaderFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_column_view_set_header_factory(cast(GtkColumnView*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets the model to use.
      
      This must be a [gtk.selection_model.SelectionModel].
  
      Params:
        model = the model to use
  */
  void setModel(gtk.selection_model.SelectionModel model = null)
  {
    gtk_column_view_set_model(cast(GtkColumnView*)this._cPtr, model ? cast(GtkSelectionModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null);
  }

  /**
      Sets whether columns should be reorderable by dragging.
  
      Params:
        reorderable = whether columns should be reorderable
  */
  void setReorderable(bool reorderable)
  {
    gtk_column_view_set_reorderable(cast(GtkColumnView*)this._cPtr, reorderable);
  }

  /**
      Sets the factory used for configuring rows. The factory must be for configuring
      [gtk.column_view_row.ColumnViewRow] objects.
      
      If this factory is not set - which is the default - then the defaults will be used.
      
      This factory is not used to set the widgets displayed in the individual cells. For
      that see `methodGtkColumnViewColumn.set_factory` and `classGtkColumnViewCell`.
  
      Params:
        factory = The row factory
  */
  void setRowFactory(gtk.list_item_factory.ListItemFactory factory = null)
  {
    gtk_column_view_set_row_factory(cast(GtkColumnView*)this._cPtr, factory ? cast(GtkListItemFactory*)factory._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the list should show separators
      between columns.
  
      Params:
        showColumnSeparators = true to show column separators
  */
  void setShowColumnSeparators(bool showColumnSeparators)
  {
    gtk_column_view_set_show_column_separators(cast(GtkColumnView*)this._cPtr, showColumnSeparators);
  }

  /**
      Sets whether the list should show separators
      between rows.
  
      Params:
        showRowSeparators = true to show row separators
  */
  void setShowRowSeparators(bool showRowSeparators)
  {
    gtk_column_view_set_show_row_separators(cast(GtkColumnView*)this._cPtr, showRowSeparators);
  }

  /**
      Sets whether rows should be activated on single click and
      selected on hover.
  
      Params:
        singleClickActivate = true to activate items on single click
  */
  void setSingleClickActivate(bool singleClickActivate)
  {
    gtk_column_view_set_single_click_activate(cast(GtkColumnView*)this._cPtr, singleClickActivate);
  }

  /**
      Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys.
  
      Params:
        tabBehavior = The desired tab behavior
  */
  void setTabBehavior(gtk.types.ListTabBehavior tabBehavior)
  {
    gtk_column_view_set_tab_behavior(cast(GtkColumnView*)this._cPtr, tabBehavior);
  }

  /**
      Sets the sorting of the view.
      
      This function should be used to set up the initial sorting.
      At runtime, users can change the sorting of a column view
      by clicking on the list headers.
      
      This call only has an effect if the sorter returned by
      [gtk.column_view.ColumnView.getSorter] is set on a sort model,
      and [gtk.column_view_column.ColumnViewColumn.setSorter] has been called
      on column to associate a sorter with the column.
      
      If column is null, the view will be unsorted.
  
      Params:
        column = the [gtk.column_view_column.ColumnViewColumn] to sort by
        direction = the direction to sort in
  */
  void sortByColumn(gtk.column_view_column.ColumnViewColumn column, gtk.types.SortType direction)
  {
    gtk_column_view_sort_by_column(cast(GtkColumnView*)this._cPtr, column ? cast(GtkColumnViewColumn*)column._cPtr(No.Dup) : null, direction);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when a row has been activated by the user, usually via activating
        the GtkListBase|list.activate-item action.
        
        This allows for a convenient way to handle activation in a columnview.
        See [gtk.list_item.ListItem.setActivatable] for details on how to use this
        signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(uint position, gtk.column_view.ColumnView columnView))
  
          `position` position of item to activate (optional)
  
          `columnView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.column_view.ColumnView)))
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

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
