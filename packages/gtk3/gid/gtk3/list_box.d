/// Module for [ListBox] class
module gid.gtk3.list_box;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.list_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.list_box_row;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    A GtkListBox is a vertical container that contains GtkListBoxRow
    children. These rows can be dynamically sorted and filtered, and
    headers can be added dynamically depending on the row content.
    It also allows keyboard and mouse navigation and selection like
    a typical list.
    
    Using GtkListBox is often an alternative to #GtkTreeView, especially
    when the list contents has a more complicated layout than what is allowed
    by a #GtkCellRenderer, or when the contents is interactive (i.e. has a
    button in it).
    
    Although a #GtkListBox must have only #GtkListBoxRow children you can
    add any kind of widget to it via [gid.gtk3.container.Container.add], and a #GtkListBoxRow
    widget will automatically be inserted between the list and the widget.
    
    #GtkListBoxRows can be marked as activatable or selectable. If a row
    is activatable, #GtkListBox::row-activated will be emitted for it when
    the user tries to activate it. If it is selectable, the row will be marked
    as selected when the user tries to select it.
    
    The GtkListBox widget was added in GTK+ 3.10.
    
    # GtkListBox as GtkBuildable
    
    The GtkListBox implementation of the #GtkBuildable interface supports
    setting a child as the placeholder by specifying “placeholder” as the “type”
    attribute of a `<child>` element. See [gid.gtk4.list_box.ListBox.setPlaceholder] for info.
    
    # CSS nodes
    
    ```plain
    list
    ╰── row[.activatable]
    ```
    
    GtkListBox uses a single CSS node named list. Each GtkListBoxRow uses
    a single CSS node named row. The row nodes get the .activatable
    style class added when appropriate.
*/
class ListBox : gid.gtk3.container.Container
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
      Get builder for [gid.gtk3.list_box.ListBox]
      Returns: New builder object
  */
  static ListBoxGidBuilder builder() nothrow
  {
    return new ListBoxGidBuilder;
  }

  /** */
  @property bool activateOnSingleClick() nothrow
  {
    return getActivateOnSingleClick();
  }

  /** */
  @property void activateOnSingleClick(bool propval) nothrow
  {
    setActivateOnSingleClick(propval);
  }

  /** */
  @property gid.gtk3.types.SelectionMode selectionMode() nothrow
  {
    return getSelectionMode();
  }

  /** */
  @property void selectionMode(gid.gtk3.types.SelectionMode propval) nothrow
  {
    setSelectionMode(propval);
  }

  /**
      Creates a new #GtkListBox container.
      Returns: a new #GtkListBox
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
      Class handler for the #GtkListBox::activate-cursor-row signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivateCursorRow` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncActivateCursorRow()
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.activateCursorRow)
      return;

    _klass.activateCursorRow(cast(GtkListBox*)this._cPtr);
  }

  /**
      Class handler for the #GtkListBox::move-cursor signal
  
      Params:
        step = 
        count = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncMoveCursor` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncMoveCursor(gid.gtk3.types.MovementStep step, int count)
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.moveCursor)
      return;

    _klass.moveCursor(cast(GtkListBox*)this._cPtr, step, count);
  }

  /**
      Class handler for the #GtkListBox::row-activated signal
  
      Params:
        row = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRowActivated` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRowActivated(gid.gtk3.list_box_row.ListBoxRow row)
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.rowActivated)
      return;

    _klass.rowActivated(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Class handler for the #GtkListBox::row-selected signal
  
      Params:
        row = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRowSelected` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRowSelected(gid.gtk3.list_box_row.ListBoxRow row)
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.rowSelected)
      return;

    _klass.rowSelected(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Select all children of box, if the selection mode allows it.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSelectAll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSelectAll()
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.selectAll)
      return;

    _klass.selectAll(cast(GtkListBox*)this._cPtr);
  }

  /**
      Class handler for the #GtkListBox::selected-rows-changed signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSelectedRowsChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncSelectedRowsChanged()
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.selectedRowsChanged)
      return;

    _klass.selectedRowsChanged(cast(GtkListBox*)this._cPtr);
  }

  /**
      Class handler for the #GtkListBox::toggle-cursor-row signal
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggleCursorRow` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncToggleCursorRow()
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.toggleCursorRow)
      return;

    _klass.toggleCursorRow(cast(GtkListBox*)this._cPtr);
  }

  /**
      Unselect all children of box, if the selection mode allows it.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncUnselectAll` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncUnselectAll()
  {
    auto _klass = cast(GtkListBoxClass*)_vfuncClass;
    if (!_klass.unselectAll)
      return;

    _klass.unselectAll(cast(GtkListBox*)this._cPtr);
  }

  /**
      Binds model to box.
      
      If box was already bound to a model, that previous binding is
      destroyed.
      
      The contents of box are cleared and then filled with widgets that
      represent items from model. box is updated whenever model changes.
      If model is null, box is left empty.
      
      It is undefined to add or remove widgets directly (for example, with
      [gid.gtk4.list_box.ListBox.insert] or [gid.gtk3.container.Container.add]) while box is bound to a
      model.
      
      Note that using a model is incompatible with the filtering and sorting
      functionality in GtkListBox. When using a model, filtering and sorting
      should be implemented by the model.
  
      Params:
        model = the #GListModel to be bound to box
        createWidgetFunc = a function that creates widgets for items
            or null in case you also passed null as model
  */
  void bindModel(gid.gio2.list_model.ListModel model = null, gid.gtk3.types.ListBoxCreateWidgetFunc createWidgetFunc = null) nothrow
  {
    extern(C) GtkWidget* _createWidgetFuncCallback(GObject* item, void* userData) nothrow
    {
      gidAttachThread();
      gid.gtk3.widget.Widget _dretval;
      auto _dlg = cast(gid.gtk3.types.ListBoxCreateWidgetFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)item, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.ListBoxCreateWidgetFunc");
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
      This is a helper function for implementing DnD onto a #GtkListBox.
      The passed in row will be highlighted via [gid.gtk3.widget.Widget.dragHighlight],
      and any previously highlighted row will be unhighlighted.
      
      The row will also be unhighlighted when the widget gets
      a drag leave event.
  
      Params:
        row = a #GtkListBoxRow
  */
  void dragHighlightRow(gid.gtk3.list_box_row.ListBoxRow row) nothrow
  {
    gtk_list_box_drag_highlight_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      If a row has previously been highlighted via [gid.gtk4.list_box.ListBox.dragHighlightRow]
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
  gid.gtk3.adjustment.Adjustment getAdjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_list_box_get_adjustment(cast(GtkListBox*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the n-th child in the list (not counting headers).
      If _index is negative or larger than the number of items in the
      list, null is returned.
  
      Params:
        index = the index of the row
      Returns: the child #GtkWidget or null
  */
  gid.gtk3.list_box_row.ListBoxRow getRowAtIndex(int index) nothrow
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_index(cast(GtkListBox*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the row at the `y` position.
  
      Params:
        y = position
      Returns: the row or null
          in case no row exists for the given y coordinate.
  */
  gid.gtk3.list_box_row.ListBoxRow getRowAtY(int y) nothrow
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_y(cast(GtkListBox*)this._cPtr, y);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the selected row.
      
      Note that the box may allow multiple selection, in which
      case you should use [gid.gtk4.list_box.ListBox.selectedForeach] to
      find all selected rows.
      Returns: the selected row
  */
  gid.gtk3.list_box_row.ListBoxRow getSelectedRow() nothrow
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_selected_row(cast(GtkListBox*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a list of all selected children.
      Returns: A #GList containing the #GtkWidget for each selected child.
            Free with [gid.glib2.list.List.free] when done.
  */
  gid.gtk3.list_box_row.ListBoxRow[] getSelectedRows() nothrow
  {
    GList* _cretval;
    _cretval = gtk_list_box_get_selected_rows(cast(GtkListBox*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.list_box_row.ListBoxRow, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of the listbox.
      Returns: a #GtkSelectionMode
  */
  gid.gtk3.types.SelectionMode getSelectionMode() nothrow
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_list_box_get_selection_mode(cast(GtkListBox*)this._cPtr);
    gid.gtk3.types.SelectionMode _retval = cast(gid.gtk3.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Insert the child into the box at position. If a sort function is
      set, the widget will actually be inserted at the calculated position and
      this function has the same effect of [gid.gtk3.container.Container.add].
      
      If position is -1, or larger than the total number of items in the
      box, then the child will be appended to the end.
  
      Params:
        child = the #GtkWidget to add
        position = the position to insert child in
  */
  void insert(gid.gtk3.widget.Widget child, int position) nothrow
  {
    gtk_list_box_insert(cast(GtkListBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
  }

  /**
      Update the filtering for all rows. Call this when result
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
      Update the separators for all rows. Call this when result
      of the header function on the box is changed due
      to an external factor.
  */
  void invalidateHeaders() nothrow
  {
    gtk_list_box_invalidate_headers(cast(GtkListBox*)this._cPtr);
  }

  /**
      Update the sorting for all rows. Call this when result
      of the sort function on the box is changed due
      to an external factor.
  */
  void invalidateSort() nothrow
  {
    gtk_list_box_invalidate_sort(cast(GtkListBox*)this._cPtr);
  }

  /**
      Prepend a widget to the list. If a sort function is set, the widget will
      actually be inserted at the calculated position and this function has the
      same effect of [gid.gtk3.container.Container.add].
  
      Params:
        child = the #GtkWidget to add
  */
  void prepend(gid.gtk3.widget.Widget child) nothrow
  {
    gtk_list_box_prepend(cast(GtkListBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
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
        row = The row to select or null
  */
  void selectRow(gid.gtk3.list_box_row.ListBoxRow row = null) nothrow
  {
    gtk_list_box_select_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected child.
      
      Note that the selection cannot be modified from within this function.
  
      Params:
        func = the function to call for each selected child
  */
  void selectedForeach(gid.gtk3.types.ListBoxForeachFunc func) nothrow
  {
    extern(C) void _funcCallback(GtkListBox* box, GtkListBoxRow* row, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.ListBoxForeachFunc*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box.ListBox)(cast(void*)box, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.ListBoxForeachFunc");
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
      for vertical scrolling. For instance, this is used
      to get the page size for PageUp/Down key handling.
      
      In the normal case when the box is packed inside
      a #GtkScrolledWindow the adjustment from that will
      be picked up automatically, so there is no need
      to manually do that.
  
      Params:
        adjustment = the adjustment, or null
  */
  void setAdjustment(gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    gtk_list_box_set_adjustment(cast(GtkListBox*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      By setting a filter function on the box one can decide dynamically which
      of the rows to show. For instance, to implement a search function on a list that
      filters the original list to only show the matching rows.
      
      The filter_func will be called for each row after the call, and it will
      continue to be called each time a row changes (via [gid.gtk4.list_box_row.ListBoxRow.changed]) or
      when [gid.gtk4.list_box.ListBox.invalidateFilter] is called.
      
      Note that using a filter function is incompatible with using a model
      (see [gid.gtk4.list_box.ListBox.bindModel]).
  
      Params:
        filterFunc = callback that lets you filter which rows to show
  */
  void setFilterFunc(gid.gtk3.types.ListBoxFilterFunc filterFunc = null) nothrow
  {
    extern(C) gboolean _filterFuncCallback(GtkListBoxRow* row, void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.ListBoxFilterFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.ListBoxFilterFunc");
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
      By setting a header function on the box one can dynamically add headers
      in front of rows, depending on the contents of the row and its position in the list.
      For instance, one could use it to add headers in front of the first item of a
      new kind, in a list sorted by the kind.
      
      The update_header can look at the current header widget using [gid.gtk4.list_box_row.ListBoxRow.getHeader]
      and either update the state of the widget as needed, or set a new one using
      [gid.gtk4.list_box_row.ListBoxRow.setHeader]. If no header is needed, set the header to null.
      
      Note that you may get many calls update_header to this for a particular row when e.g.
      changing things that don’t affect the header. In this case it is important for performance
      to not blindly replace an existing header with an identical one.
      
      The update_header function will be called for each row after the call, and it will
      continue to be called each time a row changes (via [gid.gtk4.list_box_row.ListBoxRow.changed]) and when
      the row before changes (either by [gid.gtk4.list_box_row.ListBoxRow.changed] on the previous row, or when
      the previous row becomes a different row). It is also called for all rows when
      [gid.gtk4.list_box.ListBox.invalidateHeaders] is called.
  
      Params:
        updateHeader = callback that lets you add row headers
  */
  void setHeaderFunc(gid.gtk3.types.ListBoxUpdateHeaderFunc updateHeader = null) nothrow
  {
    extern(C) void _updateHeaderCallback(GtkListBoxRow* row, GtkListBoxRow* before, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.ListBoxUpdateHeaderFunc*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)row, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)before, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.ListBoxUpdateHeaderFunc");
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
        placeholder = a #GtkWidget or null
  */
  void setPlaceholder(gid.gtk3.widget.Widget placeholder = null) nothrow
  {
    gtk_list_box_set_placeholder(cast(GtkListBox*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Sets how selection works in the listbox.
      See #GtkSelectionMode for details.
  
      Params:
        mode = The #GtkSelectionMode
  */
  void setSelectionMode(gid.gtk3.types.SelectionMode mode) nothrow
  {
    gtk_list_box_set_selection_mode(cast(GtkListBox*)this._cPtr, mode);
  }

  /**
      By setting a sort function on the box one can dynamically reorder the rows
      of the list, based on the contents of the rows.
      
      The sort_func will be called for each row after the call, and will continue to
      be called each time a row changes (via [gid.gtk4.list_box_row.ListBoxRow.changed]) and when
      [gid.gtk4.list_box.ListBox.invalidateSort] is called.
      
      Note that using a sort function is incompatible with using a model
      (see [gid.gtk4.list_box.ListBox.bindModel]).
  
      Params:
        sortFunc = the sort function
  */
  void setSortFunc(gid.gtk3.types.ListBoxSortFunc sortFunc = null) nothrow
  {
    extern(C) int _sortFuncCallback(GtkListBoxRow* row1, GtkListBoxRow* row2, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk3.types.ListBoxSortFunc*)userData;

      try
      {
        _retval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)row1, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)row2, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.ListBoxSortFunc");
      }
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_list_box_set_sort_func(cast(GtkListBox*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
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
        row = the row to unselected
  */
  void unselectRow(gid.gtk3.list_box_row.ListBoxRow row) nothrow
  {
    gtk_list_box_unselect_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ActivateCursorRow` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateCursorRow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.activateCursorRow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-cursor-row", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.MovementStep object, int p0, gid.gtk3.list_box.ListBox listBox)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.list_box.ListBox)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.moveCursor");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `RowActivated` signal.
  
      The ::row-activated signal is emitted when a row has been activated by the user.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.list_box_row.ListBoxRow row, gid.gtk3.list_box.ListBox listBox)`
  
          `row` the activated row (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.list_box_row.ListBoxRow)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.rowActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-activated", closure, after);
  }

  /**
      Connect to `RowSelected` signal.
  
      The ::row-selected signal is emitted when a new row is selected, or
        (with a null row) when the selection is cleared.
        
        When the box is using #GTK_SELECTION_MULTIPLE, this signal will not
        give you the full picture of selection changes, and you should use
        the #GtkListBox::selected-rows-changed signal instead.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.list_box_row.ListBoxRow row, gid.gtk3.list_box.ListBox listBox)`
  
          `row` the selected row (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRowSelected(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.list_box_row.ListBoxRow)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.rowSelected");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("row-selected", closure, after);
  }

  /**
      Connect to `SelectAll` signal.
  
      The ::select-all signal is a [keybinding signal][GtkBindingSignal]
        which gets emitted to select all children of the box, if the selection
        mode permits it.
        
        The default bindings for this signal is Ctrl-a.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.selectAll");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SelectedRowsChanged` signal.
  
      The ::selected-rows-changed signal is emitted when the
        set of selected rows changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectedRowsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.selectedRowsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selected-rows-changed", closure, after);
  }

  /**
      Connect to `ToggleCursorRow` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleCursorRow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.toggleCursorRow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-cursor-row", closure, after);
  }

  /**
      Connect to `UnselectAll` signal.
  
      The ::unselect-all signal is a [keybinding signal][GtkBindingSignal]
        which gets emitted to unselect all children of the box, if the selection
        mode permits it.
        
        The default bindings for this signal is Ctrl-Shift-a.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.list_box.ListBox listBox)`
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.list_box.ListBox)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.unselectAll");
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
        T = D class derived from ListBox
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.list_box.ListBox), T.stringof ~ " is not derived from gid.gtk3.list_box.ListBox");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateCursorRow", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "activate_cursor_row");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveCursor", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "move_cursor");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRowActivated", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "row_activated");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRowSelected", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "row_selected");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectAll", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "select_all");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectedRowsChanged", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "selected_rows_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleCursorRow", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "toggle_cursor_row");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncUnselectAll", true)[0]) == gid.gtk3.list_box.ListBox))
      _installVfunc(klass, "unselect_all");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkListBoxClass*)klass;

    switch (vfunc)
    {
      case "activate_cursor_row":
      {
        static extern(C) void _vfuncActivateCursorRowTramp(GtkListBox* box) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.activateCursorRow)
              return (cast(typeof(&_vfuncActivateCursorRowTramp))_klass.activateCursorRow)(box);
            return;
          }

          try
          {
            _obj.vfuncActivateCursorRow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncActivateCursorRow");
          }
        }

        _klass.activateCursorRow = cast(typeof(_klass.activateCursorRow))&_vfuncActivateCursorRowTramp;
        break;
      }
      case "move_cursor":
      {
        static extern(C) void _vfuncMoveCursorTramp(GtkListBox* box, GtkMovementStep step, int count) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.moveCursor)
              return (cast(typeof(&_vfuncMoveCursorTramp))_klass.moveCursor)(box, step, count);
            return;
          }

          try
          {
            _obj.vfuncMoveCursor(step, count);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncMoveCursor");
          }
        }

        _klass.moveCursor = cast(typeof(_klass.moveCursor))&_vfuncMoveCursorTramp;
        break;
      }
      case "row_activated":
      {
        static extern(C) void _vfuncRowActivatedTramp(GtkListBox* box, GtkListBoxRow* row) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.rowActivated)
              return (cast(typeof(&_vfuncRowActivatedTramp))_klass.rowActivated)(box, row);
            return;
          }

          try
          {
            _obj.vfuncRowActivated(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncRowActivated");
          }
        }

        _klass.rowActivated = cast(typeof(_klass.rowActivated))&_vfuncRowActivatedTramp;
        break;
      }
      case "row_selected":
      {
        static extern(C) void _vfuncRowSelectedTramp(GtkListBox* box, GtkListBoxRow* row) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.rowSelected)
              return (cast(typeof(&_vfuncRowSelectedTramp))_klass.rowSelected)(box, row);
            return;
          }

          try
          {
            _obj.vfuncRowSelected(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncRowSelected");
          }
        }

        _klass.rowSelected = cast(typeof(_klass.rowSelected))&_vfuncRowSelectedTramp;
        break;
      }
      case "select_all":
      {
        static extern(C) void _vfuncSelectAllTramp(GtkListBox* box) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.selectAll)
              return (cast(typeof(&_vfuncSelectAllTramp))_klass.selectAll)(box);
            return;
          }

          try
          {
            _obj.vfuncSelectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncSelectAll");
          }
        }

        _klass.selectAll = cast(typeof(_klass.selectAll))&_vfuncSelectAllTramp;
        break;
      }
      case "selected_rows_changed":
      {
        static extern(C) void _vfuncSelectedRowsChangedTramp(GtkListBox* box) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.selectedRowsChanged)
              return (cast(typeof(&_vfuncSelectedRowsChangedTramp))_klass.selectedRowsChanged)(box);
            return;
          }

          try
          {
            _obj.vfuncSelectedRowsChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncSelectedRowsChanged");
          }
        }

        _klass.selectedRowsChanged = cast(typeof(_klass.selectedRowsChanged))&_vfuncSelectedRowsChangedTramp;
        break;
      }
      case "toggle_cursor_row":
      {
        static extern(C) void _vfuncToggleCursorRowTramp(GtkListBox* box) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.toggleCursorRow)
              return (cast(typeof(&_vfuncToggleCursorRowTramp))_klass.toggleCursorRow)(box);
            return;
          }

          try
          {
            _obj.vfuncToggleCursorRow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncToggleCursorRow");
          }
        }

        _klass.toggleCursorRow = cast(typeof(_klass.toggleCursorRow))&_vfuncToggleCursorRowTramp;
        break;
      }
      case "unselect_all":
      {
        static extern(C) void _vfuncUnselectAllTramp(GtkListBox* box) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.list_box.ListBox)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)box);
          if (!_obj)
          {
            auto _klass = cast(GtkListBoxClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)box);
            if (_klass.unselectAll)
              return (cast(typeof(&_vfuncUnselectAllTramp))_klass.unselectAll)(box);
            return;
          }

          try
          {
            _obj.vfuncUnselectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.list_box.ListBox.vfuncUnselectAll");
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

/// Fluent builder implementation template for [gid.gtk3.list_box.ListBox]
class ListBoxGidBuilderImpl(T) : gid.gtk3.container.ContainerGidBuilderImpl!T
{


  /** */
  T activateOnSingleClick(bool propval) nothrow
  {
    return setProperty("activate-on-single-click", propval);
  }

  /** */
  T selectionMode(gid.gtk3.types.SelectionMode propval) nothrow
  {
    return setProperty("selection-mode", propval);
  }
}

/// Fluent builder for [gid.gtk3.list_box.ListBox]
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
