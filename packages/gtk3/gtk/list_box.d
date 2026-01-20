/// Module for [ListBox] class
module gtk.list_box;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.list_model;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.container;
import gtk.list_box_row;
import gtk.types;
import gtk.widget;

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
    add any kind of widget to it via [gtk.container.Container.add], and a #GtkListBoxRow
    widget will automatically be inserted between the list and the widget.
    
    #GtkListBoxRows can be marked as activatable or selectable. If a row
    is activatable, #GtkListBox::row-activated will be emitted for it when
    the user tries to activate it. If it is selectable, the row will be marked
    as selected when the user tries to select it.
    
    The GtkListBox widget was added in GTK+ 3.10.
    
    # GtkListBox as GtkBuildable
    
    The GtkListBox implementation of the #GtkBuildable interface supports
    setting a child as the placeholder by specifying “placeholder” as the “type”
    attribute of a `<child>` element. See [gtk.list_box.ListBox.setPlaceholder] for info.
    
    # CSS nodes
    
    ```plain
    list
    ╰── row[.activatable]
    ```
    
    GtkListBox uses a single CSS node named list. Each GtkListBoxRow uses
    a single CSS node named row. The row nodes get the .activatable
    style class added when appropriate.
*/
class ListBox : gtk.container.Container
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
    return cast(void function())gtk_list_box_get_type != &gidSymbolNotFound ? gtk_list_box_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListBox self()
  {
    return this;
  }

  /** */
  @property bool activateOnSingleClick()
  {
    return getActivateOnSingleClick();
  }

  /** */
  @property void activateOnSingleClick(bool propval)
  {
    return setActivateOnSingleClick(propval);
  }

  /** */
  @property gtk.types.SelectionMode selectionMode()
  {
    return getSelectionMode();
  }

  /** */
  @property void selectionMode(gtk.types.SelectionMode propval)
  {
    return setSelectionMode(propval);
  }

  /**
      Creates a new #GtkListBox container.
      Returns: a new #GtkListBox
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_box_new();
    this(_cretval, No.Take);
  }

  /**
      Binds model to box.
      
      If box was already bound to a model, that previous binding is
      destroyed.
      
      The contents of box are cleared and then filled with widgets that
      represent items from model. box is updated whenever model changes.
      If model is null, box is left empty.
      
      It is undefined to add or remove widgets directly (for example, with
      [gtk.list_box.ListBox.insert] or [gtk.container.Container.add]) while box is bound to a
      model.
      
      Note that using a model is incompatible with the filtering and sorting
      functionality in GtkListBox. When using a model, filtering and sorting
      should be implemented by the model.
  
      Params:
        model = the #GListModel to be bound to box
        createWidgetFunc = a function that creates widgets for items
            or null in case you also passed null as model
  */
  void bindModel(gio.list_model.ListModel model = null, gtk.types.ListBoxCreateWidgetFunc createWidgetFunc = null)
  {
    extern(C) GtkWidget* _createWidgetFuncCallback(GObject* item, void* userData)
    {
      gtk.widget.Widget _dretval;
      auto _dlg = cast(gtk.types.ListBoxCreateWidgetFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)item, No.Take));
      auto _retval = cast(GtkWidget*)_dretval._cPtr(Yes.Dup);

      return _retval;
    }
    auto _createWidgetFuncCB = createWidgetFunc ? &_createWidgetFuncCallback : null;
    auto _createWidgetFunc = createWidgetFunc ? freezeDelegate(cast(void*)&createWidgetFunc) : null;
    GDestroyNotify _createWidgetFuncDestroyCB = createWidgetFunc ? &thawDelegate : null;
    gtk_list_box_bind_model(cast(GtkListBox*)this._cPtr, model ? cast(GListModel*)(cast(gobject.object.ObjectWrap)model)._cPtr(No.Dup) : null, _createWidgetFuncCB, _createWidgetFunc, _createWidgetFuncDestroyCB);
  }

  /**
      This is a helper function for implementing DnD onto a #GtkListBox.
      The passed in row will be highlighted via [gtk.widget.Widget.dragHighlight],
      and any previously highlighted row will be unhighlighted.
      
      The row will also be unhighlighted when the widget gets
      a drag leave event.
  
      Params:
        row = a #GtkListBoxRow
  */
  void dragHighlightRow(gtk.list_box_row.ListBoxRow row)
  {
    gtk_list_box_drag_highlight_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      If a row has previously been highlighted via [gtk.list_box.ListBox.dragHighlightRow]
      it will have the highlight removed.
  */
  void dragUnhighlightRow()
  {
    gtk_list_box_drag_unhighlight_row(cast(GtkListBox*)this._cPtr);
  }

  /**
      Returns whether rows activate on single clicks.
      Returns: true if rows are activated on single click, false otherwise
  */
  bool getActivateOnSingleClick()
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
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_list_box_get_adjustment(cast(GtkListBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
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
  gtk.list_box_row.ListBoxRow getRowAtIndex(int index)
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_index(cast(GtkListBox*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the row at the `y` position.
  
      Params:
        y = position
      Returns: the row or null
          in case no row exists for the given y coordinate.
  */
  gtk.list_box_row.ListBoxRow getRowAtY(int y)
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_row_at_y(cast(GtkListBox*)this._cPtr, y);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the selected row.
      
      Note that the box may allow multiple selection, in which
      case you should use [gtk.list_box.ListBox.selectedForeach] to
      find all selected rows.
      Returns: the selected row
  */
  gtk.list_box_row.ListBoxRow getSelectedRow()
  {
    GtkListBoxRow* _cretval;
    _cretval = gtk_list_box_get_selected_row(cast(GtkListBox*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(GtkListBoxRow*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a list of all selected children.
      Returns: A #GList containing the #GtkWidget for each selected child.
            Free with [glib.list.List.free] when done.
  */
  gtk.list_box_row.ListBoxRow[] getSelectedRows()
  {
    GList* _cretval;
    _cretval = gtk_list_box_get_selected_rows(cast(GtkListBox*)this._cPtr);
    auto _retval = gListToD!(gtk.list_box_row.ListBoxRow, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the selection mode of the listbox.
      Returns: a #GtkSelectionMode
  */
  gtk.types.SelectionMode getSelectionMode()
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_list_box_get_selection_mode(cast(GtkListBox*)this._cPtr);
    gtk.types.SelectionMode _retval = cast(gtk.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Insert the child into the box at position. If a sort function is
      set, the widget will actually be inserted at the calculated position and
      this function has the same effect of [gtk.container.Container.add].
      
      If position is -1, or larger than the total number of items in the
      box, then the child will be appended to the end.
  
      Params:
        child = the #GtkWidget to add
        position = the position to insert child in
  */
  void insert(gtk.widget.Widget child, int position)
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
  void invalidateFilter()
  {
    gtk_list_box_invalidate_filter(cast(GtkListBox*)this._cPtr);
  }

  /**
      Update the separators for all rows. Call this when result
      of the header function on the box is changed due
      to an external factor.
  */
  void invalidateHeaders()
  {
    gtk_list_box_invalidate_headers(cast(GtkListBox*)this._cPtr);
  }

  /**
      Update the sorting for all rows. Call this when result
      of the sort function on the box is changed due
      to an external factor.
  */
  void invalidateSort()
  {
    gtk_list_box_invalidate_sort(cast(GtkListBox*)this._cPtr);
  }

  /**
      Prepend a widget to the list. If a sort function is set, the widget will
      actually be inserted at the calculated position and this function has the
      same effect of [gtk.container.Container.add].
  
      Params:
        child = the #GtkWidget to add
  */
  void prepend(gtk.widget.Widget child)
  {
    gtk_list_box_prepend(cast(GtkListBox*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Select all children of box, if the selection mode allows it.
  */
  void selectAll()
  {
    gtk_list_box_select_all(cast(GtkListBox*)this._cPtr);
  }

  /**
      Make row the currently selected row.
  
      Params:
        row = The row to select or null
  */
  void selectRow(gtk.list_box_row.ListBoxRow row = null)
  {
    gtk_list_box_select_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected child.
      
      Note that the selection cannot be modified from within this function.
  
      Params:
        func = the function to call for each selected child
  */
  void selectedForeach(gtk.types.ListBoxForeachFunc func)
  {
    extern(C) void _funcCallback(GtkListBox* box, GtkListBoxRow* row, void* userData)
    {
      auto _dlg = cast(gtk.types.ListBoxForeachFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.list_box.ListBox)(cast(void*)box, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
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
  void setActivateOnSingleClick(bool single)
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
  void setAdjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    gtk_list_box_set_adjustment(cast(GtkListBox*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      By setting a filter function on the box one can decide dynamically which
      of the rows to show. For instance, to implement a search function on a list that
      filters the original list to only show the matching rows.
      
      The filter_func will be called for each row after the call, and it will
      continue to be called each time a row changes (via [gtk.list_box_row.ListBoxRow.changed]) or
      when [gtk.list_box.ListBox.invalidateFilter] is called.
      
      Note that using a filter function is incompatible with using a model
      (see [gtk.list_box.ListBox.bindModel]).
  
      Params:
        filterFunc = callback that lets you filter which rows to show
  */
  void setFilterFunc(gtk.types.ListBoxFilterFunc filterFunc = null)
  {
    extern(C) gboolean _filterFuncCallback(GtkListBoxRow* row, void* userData)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.ListBoxFilterFunc*)userData;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(void*)row, No.Take));
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
      
      The update_header can look at the current header widget using [gtk.list_box_row.ListBoxRow.getHeader]
      and either update the state of the widget as needed, or set a new one using
      [gtk.list_box_row.ListBoxRow.setHeader]. If no header is needed, set the header to null.
      
      Note that you may get many calls update_header to this for a particular row when e.g.
      changing things that don’t affect the header. In this case it is important for performance
      to not blindly replace an existing header with an identical one.
      
      The update_header function will be called for each row after the call, and it will
      continue to be called each time a row changes (via [gtk.list_box_row.ListBoxRow.changed]) and when
      the row before changes (either by [gtk.list_box_row.ListBoxRow.changed] on the previous row, or when
      the previous row becomes a different row). It is also called for all rows when
      [gtk.list_box.ListBox.invalidateHeaders] is called.
  
      Params:
        updateHeader = callback that lets you add row headers
  */
  void setHeaderFunc(gtk.types.ListBoxUpdateHeaderFunc updateHeader = null)
  {
    extern(C) void _updateHeaderCallback(GtkListBoxRow* row, GtkListBoxRow* before, void* userData)
    {
      auto _dlg = cast(gtk.types.ListBoxUpdateHeaderFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(void*)row, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(void*)before, No.Take));
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
  void setPlaceholder(gtk.widget.Widget placeholder = null)
  {
    gtk_list_box_set_placeholder(cast(GtkListBox*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Sets how selection works in the listbox.
      See #GtkSelectionMode for details.
  
      Params:
        mode = The #GtkSelectionMode
  */
  void setSelectionMode(gtk.types.SelectionMode mode)
  {
    gtk_list_box_set_selection_mode(cast(GtkListBox*)this._cPtr, mode);
  }

  /**
      By setting a sort function on the box one can dynamically reorder the rows
      of the list, based on the contents of the rows.
      
      The sort_func will be called for each row after the call, and will continue to
      be called each time a row changes (via [gtk.list_box_row.ListBoxRow.changed]) and when
      [gtk.list_box.ListBox.invalidateSort] is called.
      
      Note that using a sort function is incompatible with using a model
      (see [gtk.list_box.ListBox.bindModel]).
  
      Params:
        sortFunc = the sort function
  */
  void setSortFunc(gtk.types.ListBoxSortFunc sortFunc = null)
  {
    extern(C) int _sortFuncCallback(GtkListBoxRow* row1, GtkListBoxRow* row2, void* userData)
    {
      auto _dlg = cast(gtk.types.ListBoxSortFunc*)userData;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(void*)row1, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.list_box_row.ListBoxRow)(cast(void*)row2, No.Take));
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
  void unselectAll()
  {
    gtk_list_box_unselect_all(cast(GtkListBox*)this._cPtr);
  }

  /**
      Unselects a single row of box, if the selection mode allows it.
  
      Params:
        row = the row to unselected
  */
  void unselectRow(gtk.list_box_row.ListBoxRow row)
  {
    gtk_list_box_unselect_row(cast(GtkListBox*)this._cPtr, row ? cast(GtkListBoxRow*)row._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ActivateCursorRow` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.list_box.ListBox listBox))
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateCursorRow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box.ListBox)))
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
    return connectSignalClosure("activate-cursor-row", closure, after);
  }

  /**
      Connect to `MoveCursor` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.MovementStep object, int p0, gtk.list_box.ListBox listBox))
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveCursor(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.MovementStep)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.list_box.ListBox)))
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
    return connectSignalClosure("move-cursor", closure, after);
  }

  /**
      Connect to `RowActivated` signal.
  
      The ::row-activated signal is emitted when a row has been activated by the user.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.list_box_row.ListBoxRow row, gtk.list_box.ListBox listBox))
  
          `row` the activated row (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowActivated(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box_row.ListBoxRow)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.list_box.ListBox)))
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
  
          $(D void callback(gtk.list_box_row.ListBoxRow row, gtk.list_box.ListBox listBox))
  
          `row` the selected row (optional)
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRowSelected(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box_row.ListBoxRow)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.list_box.ListBox)))
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
  
          $(D void callback(gtk.list_box.ListBox listBox))
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectAll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box.ListBox)))
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
    return connectSignalClosure("select-all", closure, after);
  }

  /**
      Connect to `SelectedRowsChanged` signal.
  
      The ::selected-rows-changed signal is emitted when the
        set of selected rows changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.list_box.ListBox listBox))
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectedRowsChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box.ListBox)))
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
    return connectSignalClosure("selected-rows-changed", closure, after);
  }

  /**
      Connect to `ToggleCursorRow` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.list_box.ListBox listBox))
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleCursorRow(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box.ListBox)))
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
  
          $(D void callback(gtk.list_box.ListBox listBox))
  
          `listBox` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUnselectAll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.list_box.ListBox)))
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
    return connectSignalClosure("unselect-all", closure, after);
  }
}
