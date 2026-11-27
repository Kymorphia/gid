/// Module for [ListBox] class
module gid.gtk4.list_box;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.adjustment;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.list_box_row;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Shows a vertical list.
    
    <picture>
      <source srcset="list-box-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkListBox" src="list-box.png">
    </picture>
    
    A [gid.gtk4.list_box.ListBox] only contains [gid.gtk4.list_box_row.ListBoxRow] children. These rows can
    by dynamically sorted and filtered, and headers can be added dynamically
    depending on the row content. It also allows keyboard and mouse navigation
    and selection like a typical list.
    
    Using [gid.gtk4.list_box.ListBox] is often an alternative to [gid.gtk4.tree_view.TreeView], especially
    when the list contents has a more complicated layout than what is allowed
    by a [gid.gtk4.cell_renderer.CellRenderer], or when the contents is interactive (i.e. has a
    button in it).
    
    Although a [gid.gtk4.list_box.ListBox] must have only [gid.gtk4.list_box_row.ListBoxRow] children, you can
    add any kind of widget to it via [gid.gtk4.list_box.ListBox.prepend],
    [gid.gtk4.list_box.ListBox.append] and [gid.gtk4.list_box.ListBox.insert] and a
    [gid.gtk4.list_box_row.ListBoxRow] widget will automatically be inserted between the list
    and the widget.
    
    `GtkListBoxRows` can be marked as activatable or selectable. If a row is
    activatable, [gid.gtk4.list_box.ListBox.rowActivated] will be emitted for it when
    the user tries to activate it. If it is selectable, the row will be marked
    as selected when the user tries to select it.
    
    # GtkListBox as GtkBuildable
    
    The [gid.gtk4.list_box.ListBox] implementation of the [gid.gtk4.buildable.Buildable] interface supports
    setting a child as the placeholder by specifying “placeholder” as the “type”
    attribute of a `<child>` element. See [gid.gtk4.list_box.ListBox.setPlaceholder]
    for info.
    
    # Shortcuts and Gestures
    
    The following signals have default keybindings:
    
    - [gid.gtk4.list_box.ListBox.moveCursor]
    - [gid.gtk4.list_box.ListBox.selectAll]
    - [gid.gtk4.list_box.ListBox.toggleCursorRow]
    - [gid.gtk4.list_box.ListBox.unselectAll]
    
    # CSS nodes
    
    ```
    list[.separators][.rich-list][.navigation-sidebar][.boxed-list]
    ╰── row[.activatable]
    ```
    
    [gid.gtk4.list_box.ListBox] uses a single CSS node named list. It may carry the .separators
    style class, when the [gid.gtk4.list_box.ListBox.showSeparators] property is set.
    Each [gid.gtk4.list_box_row.ListBoxRow] uses a single CSS node named row. The row nodes get the
    .activatable style class added when appropriate.
    
    It may also carry the .boxed-list style class. In this case, the list will be
    automatically surrounded by a frame and have separators.
    
    The main list node may also carry style classes to select
    the style of [list presentation](section-list-widget.html#list-styles):
    .rich-list, .navigation-sidebar or .data-table.
    
    # Accessibility
    
    [gid.gtk4.list_box.ListBox] uses the [gid.gtk4.types.AccessibleRole.List] role and [gid.gtk4.list_box_row.ListBoxRow] uses
    the [gid.gtk4.types.AccessibleRole.ListItem] role.
*/
@gidGir("ListBox")
class ListBox : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_list_box_get_type != &gidSymbolNotFound ? gtk_list_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkListBox";
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBox self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.list_box.ListBox]
      Returns: New builder object
  */
  static ListBoxGidBuilder builder() nothrow
  {
    return new ListBoxGidBuilder;
  }

  /**
      Get `acceptUnpairedRelease` property.
      Returns: Whether to accept unpaired release events.
  */
  @property bool acceptUnpairedRelease() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("accept-unpaired-release");
  }

  /**
      Set `acceptUnpairedRelease` property.
      Params:
        propval = Whether to accept unpaired release events.
  */
  @property void acceptUnpairedRelease(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("accept-unpaired-release", propval);
  }

  /**
      Get `activateOnSingleClick` property.
      Returns: Determines whether children can be activated with a single
        click, or require a double-click.
  */
  @property bool activateOnSingleClick() nothrow
  {
    return getActivateOnSingleClick();
  }

  /**
      Set `activateOnSingleClick` property.
      Params:
        propval = Determines whether children can be activated with a single
          click, or require a double-click.
  */
  @property void activateOnSingleClick(bool propval) nothrow
  {
    setActivateOnSingleClick(propval);
  }

  /**
      Get `selectionMode` property.
      Returns: The selection mode used by the list box.
  */
  @property gid.gtk4.types.SelectionMode selectionMode() nothrow
  {
    return getSelectionMode();
  }

  /**
      Set `selectionMode` property.
      Params:
        propval = The selection mode used by the list box.
  */
  @property void selectionMode(gid.gtk4.types.SelectionMode propval) nothrow
  {
    setSelectionMode(propval);
  }

  /**
      Get `showSeparators` property.
      Returns: Whether to show separators between rows.
  */
  @property bool showSeparators() nothrow
  {
    return getShowSeparators();
  }

  /**
      Set `showSeparators` property.
      Params:
        propval = Whether to show separators between rows.
  */
  @property void showSeparators(bool propval) nothrow
  {
    setShowSeparators(propval);
  }

  /**
      Get `tabBehavior` property.
      Returns: Behavior of the <kbd>Tab</kbd> key
  */
  @property gid.gtk4.types.ListTabBehavior tabBehavior() nothrow
  {
    return getTabBehavior();
  }

  /**
      Set `tabBehavior` property.
      Params:
        propval = Behavior of the <kbd>Tab</kbd> key
  */
  @property void tabBehavior(gid.gtk4.types.ListTabBehavior propval) nothrow
  {
    setTabBehavior(propval);
  }

  /**
      Creates a new [gid.gtk4.list_box.ListBox] container.
      Returns: a new [gid.gtk4.list_box.ListBox]
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
      _cretval = gtk_list_box_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Append a widget to the list.
      
      If a sort function is set, the widget will
      actually be inserted at the calculated position.
  
      Params:
        child = the [gid.gtk4.widget.Widget] to add
  */
  void append(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_list_box_append(cast(GtkListBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Binds model to box.
      
      If box was already bound to a model, that previous binding is
      destroyed.
      
      The contents of box are cleared and then filled with widgets that
      represent items from model. box is updated whenever model changes.
      If model is null, box is left empty.
      
      It is undefined to add or remove widgets directly (for example, with
      [gid.gtk4.list_box.ListBox.insert]) while box is bound to a model.
      
      Note that using a model is incompatible with the filtering and sorting
      functionality in [gid.gtk4.list_box.ListBox]. When using a model, filtering and sorting
      should be implemented by the model.
  
      Params:
        model = the [gid.gio2.list_model.ListModel] to be bound to box
        createWidgetFunc = a function
            that creates widgets for items or null in case you also passed null as model
  */
  void bindModel(gid.gio2.list_model.ListModel model = null, gid.gtk4.types.ListBoxCreateWidgetFunc createWidgetFunc = null) nothrow
  {
    extern(C) GtkWidget* _createWidgetFuncCallback(GObject* item, void* userData) nothrow
    {
      gidAttachThread();
      gid.gtk4.widget.Widget _dretval;
      auto _dlg = cast(gid.gtk4.types.ListBoxCreateWidgetFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ListBoxCreateWidgetFunc");
      }
      auto _retval = _dretval ? cast(GtkWidget*)_dretval._cPtr(Yes.Dup) : null;

      return _retval;
    }
    auto _createWidgetFuncCB = createWidgetFunc ? &_createWidgetFuncCallback : null;
    auto _createWidgetFunc = createWidgetFunc ? freezeDelegate(cast(void*)&createWidgetFunc) : null;
    GDestroyNotify _createWidgetFuncDestroyCB = createWidgetFunc ? &thawDelegate : null;
    gtk_list_box_bind_model(cast(GtkListBox*)this._cPtr, model ? cast(GListModel*)(cast(gid.gobject2.object.ObjectWrap)model)._cPtr(No.Dup) : null, _createWidgetFuncCB, _createWidgetFunc, _createWidgetFuncDestroyCB);
  }

  /**
      Add a drag highlight to a row.
      
      This is a helper function for implementing DnD onto a [gid.gtk4.list_box.ListBox].
      The passed in row will be highlighted by setting the
      [gid.gtk4.types.StateFlags.DropActive] state and any previously highlighted
      row will be unhighlighted.
      
      The row will also be unhighlighted when the widget gets
      a drag leave event.
  
      Params:
        row = a [gid.gtk4.list_box_row.ListBoxRow]
  */
  void dragHighlightRow(gid.gtk4.list_box_row.ListBoxRow row) nothrow
  {
    gtk_list_box_drag_highlight_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      If a row has previously been highlighted via [gid.gtk4.list_box.ListBox.dragHighlightRow],
      it will have the highlight removed.
  */
  void dragUnhighlightRow() nothrow
  {
    gtk_list_box_drag_unhighlight_row(cast(GtkListBox*)this._cPtr);
  }

  /**
      Returns whether rows activate on single clicks.
      Returns: true if rows are activated on single click, false otherwise
  */
  bool getActivateOnSingleClick() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_box_get_activate_on_single_click(cast(GtkListBox*)this._cPtr);
    return _retval;
  }

  /**
      Gets the adjustment (if any) that the widget uses to
      for vertical scrolling.
      Returns: the adjustment
  */
  gid.gtk4.adjustment.Adjustment getAdjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_list_box_get_adjustment(cast(GtkListBox*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the n-th child in the list (not counting headers).
      
      If index_ is negative or larger than the number of items in the
      list, null is returned.
  
      Params:
        index = the index of the row
      Returns: the child [gid.gtk4.widget.Widget]
  */
  gid.gtk4.list_box_row.ListBoxRow getRowAtIndex(int index) nothrow
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_index(cast(GtkListBox*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the row at the `y` position.
  
      Params:
        y = position
      Returns: the row
  */
  gid.gtk4.list_box_row.ListBoxRow getRowAtY(int y) nothrow
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_y(cast(GtkListBox*)this._cPtr, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the selected row, or null if no rows are selected.
      
      Note that the box may allow multiple selection, in which
      case you should use [gid.gtk4.list_box.ListBox.selectedForeach] to
      find all selected rows.
      Returns: the selected row
  */
  gid.gtk4.list_box_row.ListBoxRow getSelectedRow() nothrow
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_selected_row(cast(GtkListBox*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a list of all selected children.
      Returns: A [gid.glib2.list.List] containing the [gid.gtk4.widget.Widget] for each selected child.
          Free with [gid.glib2.list.List.free] when done.
  */
  gid.gtk4.list_box_row.ListBoxRow[] getSelectedRows() nothrow
  {
    GList* _cretval;
    _cretval = gtk_list_box_get_selected_rows(cast(GtkListBox*)this._cPtr);
    auto _retval = gListToD!(gid.gtk4.list_box_row.ListBoxRow, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of the listbox.
      Returns: a [gid.gtk4.types.SelectionMode]
  */
  gid.gtk4.types.SelectionMode getSelectionMode() nothrow
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_list_box_get_selection_mode(cast(GtkListBox*)this._cPtr);
    gid.gtk4.types.SelectionMode _retval = cast(gid.gtk4.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Returns whether the list box should show separators
      between rows.
      Returns: true if the list box shows separators
  */
  bool getShowSeparators() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_box_get_show_separators(cast(GtkListBox*)this._cPtr);
    return _retval;
  }

  /**
      Returns the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys.
      Returns: the tab behavior
  */
  gid.gtk4.types.ListTabBehavior getTabBehavior() nothrow
  {
    GtkListTabBehavior _cretval;
    _cretval = gtk_list_box_get_tab_behavior(cast(GtkListBox*)this._cPtr);
    gid.gtk4.types.ListTabBehavior _retval = cast(gid.gtk4.types.ListTabBehavior)_cretval;
    return _retval;
  }

  /**
      Insert the child into the box at position.
      
      If a sort function is
      set, the widget will actually be inserted at the calculated position.
      
      If position is -1, or larger than the total number of items in the
      box, then the child will be appended to the end.
  
      Params:
        child = the [gid.gtk4.widget.Widget] to add
        position = the position to insert child in
  */
  void insert(gid.gtk4.widget.Widget child, int position) nothrow
  {
    gtk_list_box_insert(cast(GtkListBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Update the filtering for all rows.
      
      Call this when result
      of the filter function on the box is changed due
      to an external factor. For instance, this would be used
      if the filter function just looked for a specific search
      string and the entry with the search string has changed.
  */
  void invalidateFilter() nothrow
  {
    gtk_list_box_invalidate_filter(cast(GtkListBox*)this._cPtr);
  }

  /**
      Update the separators for all rows.
      
      Call this when result
      of the header function on the box is changed due
      to an external factor.
  */
  void invalidateHeaders() nothrow
  {
    gtk_list_box_invalidate_headers(cast(GtkListBox*)this._cPtr);
  }

  /**
      Update the sorting for all rows.
      
      Call this when result
      of the sort function on the box is changed due
      to an external factor.
  */
  void invalidateSort() nothrow
  {
    gtk_list_box_invalidate_sort(cast(GtkListBox*)this._cPtr);
  }

  /**
      Prepend a widget to the list.
      
      If a sort function is set, the widget will
      actually be inserted at the calculated position.
  
      Params:
        child = the [gid.gtk4.widget.Widget] to add
  */
  void prepend(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_list_box_prepend(cast(GtkListBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child from box.
  
      Params:
        child = the child to remove
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_list_box_remove(cast(GtkListBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes all rows from box.
      
      This function does nothing if box is backed by a model.
  */
  void removeAll() nothrow
  {
    gtk_list_box_remove_all(cast(GtkListBox*)this._cPtr);
  }

  /**
      Select all children of box, if the selection mode allows it.
  */
  void selectAll() nothrow
  {
    gtk_list_box_select_all(cast(GtkListBox*)this._cPtr);
  }

  /**
      Make row the currently selected row.
  
      Params:
        row = The row to select
  */
  void selectRow(gid.gtk4.list_box_row.ListBoxRow row = null) nothrow
  {
    gtk_list_box_select_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected child.
      
      Note that the selection cannot be modified from within this function.
  
      Params:
        func = the function to call for each selected child
  */
  void selectedForeach(gid.gtk4.types.ListBoxForeachFunc func) nothrow
  {
    extern(C) void _funcCallback(GtkListBox* box, GtkListBoxRow* row, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk4.types.ListBoxForeachFunc*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box.ListBox)(cast(void*)box, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ListBoxForeachFunc");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_list_box_selected_foreach(cast(GtkListBox*)this._cPtr, _funcCB, _func);
  }

  /**
      If single is true, rows will be activated when you click on them,
      otherwise you need to double-click.
  
      Params:
        single = a boolean
  */
  void setActivateOnSingleClick(bool single) nothrow
  {
    gtk_list_box_set_activate_on_single_click(cast(GtkListBox*)this._cPtr, single);
  }

  /**
      Sets the adjustment (if any) that the widget uses to
      for vertical scrolling.
      
      For instance, this is used to get the page size for
      PageUp/Down key handling.
      
      In the normal case when the box is packed inside
      a [gid.gtk4.scrolled_window.ScrolledWindow] the adjustment from that will
      be picked up automatically, so there is no need
      to manually do that.
  
      Params:
        adjustment = the adjustment
  */
  void setAdjustment(gid.gtk4.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_list_box_set_adjustment(cast(GtkListBox*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      By setting a filter function on the box one can decide dynamically which
      of the rows to show.
      
      For instance, to implement a search function on a list that
      filters the original list to only show the matching rows.
      
      The filter_func will be called for each row after the call, and
      it will continue to be called each time a row changes (via
      [gid.gtk4.list_box_row.ListBoxRow.changed]) or when [gid.gtk4.list_box.ListBox.invalidateFilter]
      is called.
      
      Note that using a filter function is incompatible with using a model
      (see [gid.gtk4.list_box.ListBox.bindModel]).
  
      Params:
        filterFunc = callback
            that lets you filter which rows to show
  */
  void setFilterFunc(gid.gtk4.types.ListBoxFilterFunc filterFunc = null) nothrow
  {
    extern(C) gboolean _filterFuncCallback(GtkListBoxRow* row, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk4.types.ListBoxFilterFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ListBoxFilterFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _filterFuncCB = filterFunc ? &_filterFuncCallback : null;
    auto _filterFunc = filterFunc ? freezeDelegate(cast(void*)&filterFunc) : null;
    GDestroyNotify _filterFuncDestroyCB = filterFunc ? &thawDelegate : null;
    gtk_list_box_set_filter_func(cast(GtkListBox*)this._cPtr, _filterFuncCB, _filterFunc, _filterFuncDestroyCB);
  }

  /**
      Sets a header function.
      
      By setting a header function on the box one can dynamically add headers
      in front of rows, depending on the contents of the row and its position
      in the list.
      
      For instance, one could use it to add headers in front of the first item
      of a new kind, in a list sorted by the kind.
      
      The update_header can look at the current header widget using
      [gid.gtk4.list_box_row.ListBoxRow.getHeader] and either update the state of the widget
      as needed, or set a new one using [gid.gtk4.list_box_row.ListBoxRow.setHeader]. If no
      header is needed, set the header to null.
      
      Note that you may get many calls update_header to this for a particular
      row when e.g. changing things that don’t affect the header. In this case
      it is important for performance to not blindly replace an existing header
      with an identical one.
      
      The update_header function will be called for each row after the call,
      and it will continue to be called each time a row changes (via
      [gid.gtk4.list_box_row.ListBoxRow.changed]) and when the row before changes (either
      by [gid.gtk4.list_box_row.ListBoxRow.changed] on the previous row, or when the previous
      row becomes a different row). It is also called for all rows when
      [gid.gtk4.list_box.ListBox.invalidateHeaders] is called.
  
      Params:
        updateHeader = callback
            that lets you add row headers
  */
  void setHeaderFunc(gid.gtk4.types.ListBoxUpdateHeaderFunc updateHeader = null) nothrow
  {
    extern(C) void _updateHeaderCallback(GtkListBoxRow* row, GtkListBoxRow* before, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk4.types.ListBoxUpdateHeaderFunc*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(void*)row, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(void*)before, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ListBoxUpdateHeaderFunc");
      }
    }
    auto _updateHeaderCB = updateHeader ? &_updateHeaderCallback : null;
    auto _updateHeader = updateHeader ? freezeDelegate(cast(void*)&updateHeader) : null;
    GDestroyNotify _updateHeaderDestroyCB = updateHeader ? &thawDelegate : null;
    gtk_list_box_set_header_func(cast(GtkListBox*)this._cPtr, _updateHeaderCB, _updateHeader, _updateHeaderDestroyCB);
  }

  /**
      Sets the placeholder widget that is shown in the list when
      it doesn't display any visible children.
  
      Params:
        placeholder = a [gid.gtk4.widget.Widget]
  */
  void setPlaceholder(gid.gtk4.widget.Widget placeholder = null) nothrow
  {
    gtk_list_box_set_placeholder(cast(GtkListBox*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Sets how selection works in the listbox.
  
      Params:
        mode = The [gid.gtk4.types.SelectionMode]
  */
  void setSelectionMode(gid.gtk4.types.SelectionMode mode) nothrow
  {
    gtk_list_box_set_selection_mode(cast(GtkListBox*)this._cPtr, mode);
  }

  /**
      Sets whether the list box should show separators
      between rows.
  
      Params:
        showSeparators = true to show separators
  */
  void setShowSeparators(bool showSeparators) nothrow
  {
    gtk_list_box_set_show_separators(cast(GtkListBox*)this._cPtr, showSeparators);
  }

  /**
      Sets a sort function.
      
      By setting a sort function on the box one can dynamically reorder
      the rows of the list, based on the contents of the rows.
      
      The sort_func will be called for each row after the call, and will
      continue to be called each time a row changes (via
      [gid.gtk4.list_box_row.ListBoxRow.changed]) and when [gid.gtk4.list_box.ListBox.invalidateSort]
      is called.
      
      Note that using a sort function is incompatible with using a model
      (see [gid.gtk4.list_box.ListBox.bindModel]).
  
      Params:
        sortFunc = the sort function
  */
  void setSortFunc(gid.gtk4.types.ListBoxSortFunc sortFunc = null) nothrow
  {
    extern(C) int _sortFuncCallback(GtkListBoxRow* row1, GtkListBoxRow* row2, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk4.types.ListBoxSortFunc*)userData;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(void*)row1, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.list_box_row.ListBoxRow)(cast(void*)row2, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ListBoxSortFunc");
      }
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_list_box_set_sort_func(cast(GtkListBox*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Sets the behavior of the <kbd>Tab</kbd> and <kbd>Shift</kbd>+<kbd>Tab</kbd> keys.
  
      Params:
        behavior = the tab behavior
  */
  void setTabBehavior(gid.gtk4.types.ListTabBehavior behavior) nothrow
  {
    gtk_list_box_set_tab_behavior(cast(GtkListBox*)this._cPtr, behavior);
  }

  /**
      Unselect all children of box, if the selection mode allows it.
  */
  void unselectAll() nothrow
  {
    gtk_list_box_unselect_all(cast(GtkListBox*)this._cPtr);
  }

  /**
      Unselects a single row of box, if the selection mode allows it.
  
      Params:
        row = the row to unselect
  */
  void unselectRow(gid.gtk4.list_box_row.ListBoxRow row) nothrow
  {
    gtk_list_box_unselect_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ActivateCursorRow` signal.
  
      Emitted when the cursor row is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateCursorRow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.activateCursorRow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-cursor-row", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      Emitted when the user initiates a cursor movement.
        
        The default bindings for this signal come in two variants, the variant with
        the Shift modifier extends the selection, the variant without the Shift
        modifier does not. There are too many key combinations to list them all
        here.
        
        - <kbd>←</kbd>, <kbd>→</kbd>, <kbd>↑</kbd>, <kbd>↓</kbd>
          move by individual children
        - <kbd>Home</kbd>, <kbd>End</kbd> move to the ends of the box
        - <kbd>PgUp</kbd>, <kbd>PgDn</kbd> move vertically by pages
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.types.MovementStep step, int count, bool extend, bool modify, gid.gtk4.list_box.ListBox listBox)`
  
          `step` the granularity of the move, as a [gid.gtk4.types.MovementStep] (optional)
  
          `count` the number of step units to move (optional)
  
          `extend` whether to extend the selection (optional)
  
          `modify` whether to modify the selection (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk4.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == bool)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] == bool)))
  && (Parameters!T.length < 5 || (ParameterStorageClassTuple!T[4] == ParameterStorageClass.none && is(Parameters!T[4] : gid.gtk4.list_box.ListBox)))
  && Parameters!T.length < 6)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 5, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

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
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.moveCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `RowActivated` signal.
  
      Emitted when a row has been activated by the user.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.list_box_row.ListBoxRow row, gid.gtk4.list_box.ListBox listBox)`
  
          `row` the activated row (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.list_box_row.ListBoxRow)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.rowActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-activated", closure, after);
  }

  /**
      Connect to `RowSelected` signal.
  
      Emitted when a new row is selected, or (with a null row)
        when the selection is cleared.
        
        When the box is using [gid.gtk4.types.SelectionMode.Multiple], this signal will not
        give you the full picture of selection changes, and you should use
        the [gid.gtk4.list_box.ListBox.selectedRowsChanged] signal instead.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.list_box_row.ListBoxRow row, gid.gtk4.list_box.ListBox listBox)`
  
          `row` the selected row (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowSelected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.list_box_row.ListBoxRow)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.rowSelected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-selected", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      Emitted to select all children of the box, if the selection
        mode permits it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Ctrl</kbd>-<kbd>a</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.selectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SelectedRowsChanged` signal.
  
      Emitted when the set of selected rows changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectedRowsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.selectedRowsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selected-rows-changed", closure, after);
  }

  /**
      Connect to `ToggleCursorRow` signal.
  
      Emitted when the cursor row is toggled.
        
        The default bindings for this signal is <kbd>Ctrl</kbd>+<kbd>␣</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleCursorRow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.toggleCursorRow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-row", closure, after);
  }

  /**
      Connect to `UnselectAll` signal.
  
      Emitted to unselect all children of the box, if the selection
        mode permits it.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is
        <kbd>Ctrl</kbd>-<kbd>Shift</kbd>-<kbd>a</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.list_box.ListBox.unselectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("unselect-all", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.list_box.ListBox]
class ListBoxGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `acceptUnpairedRelease` property.
      Params:
        propval = Whether to accept unpaired release events.
      Returns: Builder instance for fluent chaining
  */
  T acceptUnpairedRelease(bool propval) nothrow
  {
    return setProperty("accept-unpaired-release", propval);
  }

  /**
      Set `activateOnSingleClick` property.
      Params:
        propval = Determines whether children can be activated with a single
          click, or require a double-click.
      Returns: Builder instance for fluent chaining
  */
  T activateOnSingleClick(bool propval) nothrow
  {
    return setProperty("activate-on-single-click", propval);
  }

  /**
      Set `selectionMode` property.
      Params:
        propval = The selection mode used by the list box.
      Returns: Builder instance for fluent chaining
  */
  T selectionMode(gid.gtk4.types.SelectionMode propval) nothrow
  {
    return setProperty("selection-mode", propval);
  }

  /**
      Set `showSeparators` property.
      Params:
        propval = Whether to show separators between rows.
      Returns: Builder instance for fluent chaining
  */
  T showSeparators(bool propval) nothrow
  {
    return setProperty("show-separators", propval);
  }

  /**
      Set `tabBehavior` property.
      Params:
        propval = Behavior of the <kbd>Tab</kbd> key
      Returns: Builder instance for fluent chaining
  */
  T tabBehavior(gid.gtk4.types.ListTabBehavior propval) nothrow
  {
    return setProperty("tab-behavior", propval);
  }
}

/// Fluent builder for [gid.gtk4.list_box.ListBox]
final class ListBoxGidBuilder : ListBoxGidBuilderImpl!ListBoxGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListBox build() nothrow
  {
    return new ListBox(cast(void*)createGObject(ListBox._getGType), Yes.Take);
  }
}
