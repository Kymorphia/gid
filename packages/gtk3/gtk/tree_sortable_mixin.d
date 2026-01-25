/// Module for [TreeSortable] interface mixin
module gtk.tree_sortable_mixin;

public import gtk.tree_sortable_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.tree_iter;
public import gtk.tree_model;
public import gtk.types;

/**
    #GtkTreeSortable is an interface to be implemented by tree models which
    support sorting. The #GtkTreeView uses the methods provided by this interface
    to sort the model.
*/
template TreeSortableT()
{

  /**
      Fills in sort_column_id and order with the current sort column and the
      order. It returns true unless the sort_column_id is
      `GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID` or
      `GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID`.
  
      Params:
        sortColumnId = The sort column id to be filled in
        order = The #GtkSortType to be filled in
      Returns: true if the sort column is not one of the special sort
          column ids.
  */
  override bool getSortColumnId(out int sortColumnId, out gtk.types.SortType order)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_sortable_get_sort_column_id(cast(GtkTreeSortable*)this._cPtr, cast(int*)&sortColumnId, &order);
    return _retval;
  }

  /**
      Returns true if the model has a default sort function. This is used
      primarily by GtkTreeViewColumns in order to determine if a model can
      go back to the default state, or not.
      Returns: true, if the model has a default sort function
  */
  override bool hasDefaultSortFunc()
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_sortable_has_default_sort_func(cast(GtkTreeSortable*)this._cPtr);
    return _retval;
  }

  /**
      Sets the default comparison function used when sorting to be sort_func.
      If the current sort column id of sortable is
      `GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID`, then the model will sort using
      this function.
      
      If sort_func is null, then there will be no default comparison function.
      This means that once the model  has been sorted, it can’t go back to the
      default state. In this case, when the current sort column id of sortable
      is `GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID`, the model will be unsorted.
  
      Params:
        sortFunc = The comparison function
  */
  override void setDefaultSortFunc(gtk.types.TreeIterCompareFunc sortFunc)
  {
    extern(C) int _sortFuncCallback(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData)
    {
      auto _dlg = cast(gtk.types.TreeIterCompareFunc*)userData;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), a ? new gtk.tree_iter.TreeIter(cast(void*)a, No.Take) : null, b ? new gtk.tree_iter.TreeIter(cast(void*)b, No.Take) : null);
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_tree_sortable_set_default_sort_func(cast(GtkTreeSortable*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Sets the current sort column to be sort_column_id. The sortable will
      resort itself to reflect this change, after emitting a
      #GtkTreeSortable::sort-column-changed signal. sort_column_id may either be
      a regular column id, or one of the following special values:
      
      $(LIST
        * `GTK_TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID`: the default sort function
          will be used, if it is set
        
        * `GTK_TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID`: no sorting will occur
      )
  
      Params:
        sortColumnId = the sort column id to set
        order = The sort order of the column
  */
  override void setSortColumnId(int sortColumnId, gtk.types.SortType order)
  {
    gtk_tree_sortable_set_sort_column_id(cast(GtkTreeSortable*)this._cPtr, sortColumnId, order);
  }

  /**
      Sets the comparison function used when sorting to be sort_func. If the
      current sort column id of sortable is the same as sort_column_id, then
      the model will sort using this function.
  
      Params:
        sortColumnId = the sort column id to set the function for
        sortFunc = The comparison function
  */
  override void setSortFunc(int sortColumnId, gtk.types.TreeIterCompareFunc sortFunc)
  {
    extern(C) int _sortFuncCallback(GtkTreeModel* model, GtkTreeIter* a, GtkTreeIter* b, void* userData)
    {
      auto _dlg = cast(gtk.types.TreeIterCompareFunc*)userData;

      int _retval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), a ? new gtk.tree_iter.TreeIter(cast(void*)a, No.Take) : null, b ? new gtk.tree_iter.TreeIter(cast(void*)b, No.Take) : null);
      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_tree_sortable_set_sort_func(cast(GtkTreeSortable*)this._cPtr, sortColumnId, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Emits a #GtkTreeSortable::sort-column-changed signal on sortable.
  */
  override void sortColumnChanged()
  {
    gtk_tree_sortable_sort_column_changed(cast(GtkTreeSortable*)this._cPtr);
  }

  /**
      Connect to `SortColumnChanged` signal.
  
      The ::sort-column-changed signal is emitted when the sort column
        or sort order of sortable is changed. The signal is emitted before
        the contents of sortable are resorted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tree_sortable.TreeSortable treeSortable))
  
          `treeSortable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSortColumnChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_sortable.TreeSortable)))
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
    return connectSignalClosure("sort-column-changed", closure, after);
  }
}
