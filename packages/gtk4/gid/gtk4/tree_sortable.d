/// Module for [TreeSortable] interface
module gid.gtk4.tree_sortable;

public import gid.core.basictypes;
public import gid.gtk4.tree_sortable_iface_proxy;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.tree_iter;
import gid.gtk4.tree_model;
import gid.gtk4.types;

/**
    The interface for sortable models used by GtkTreeView
    
    [gid.gtk4.tree_sortable.TreeSortable] is an interface to be implemented by tree models which
    support sorting. The [gid.gtk4.tree_view.TreeView] uses the methods provided by this interface
    to sort the model.

    Deprecated: There is no replacement for this interface. You should
        use [gid.gtk4.sort_list_model.SortListModel] to wrap your list model instead
*/
interface TreeSortable : gid.gtk4.tree_model.TreeModel
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_sortable_get_type != &gidSymbolNotFound ? gtk_tree_sortable_get_type() : cast(GType)0;
  }







  /**
      Fills in sort_column_id and order with the current sort column and the
      order. It returns true unless the sort_column_id is
      [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID] or
      [gid.gtk4.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID].
  
      Params:
        sortColumnId = The sort column id to be filled in
        order = The [gid.gtk4.types.SortType] to be filled in
      Returns: true if the sort column is not one of the special sort
          column ids.
  */
  bool getSortColumnId(out int sortColumnId, out gid.gtk4.types.SortType order);

  /**
      Returns true if the model has a default sort function. This is used
      primarily by GtkTreeViewColumns in order to determine if a model can
      go back to the default state, or not.
      Returns: true, if the model has a default sort function
  */
  bool hasDefaultSortFunc();

  /**
      Sets the default comparison function used when sorting to be sort_func.
      If the current sort column id of sortable is
      [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], then the model will sort using
      this function.
      
      If sort_func is null, then there will be no default comparison function.
      This means that once the model  has been sorted, it can’t go back to the
      default state. In this case, when the current sort column id of sortable
      is [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], the model will be unsorted.
  
      Params:
        sortFunc = The comparison function
  */
  void setDefaultSortFunc(gid.gtk4.types.TreeIterCompareFunc sortFunc);

  /**
      Sets the current sort column to be sort_column_id. The sortable will
      resort itself to reflect this change, after emitting a
      `GtkTreeSortable::sort-column-changed` signal. sort_column_id may either be
      a regular column id, or one of the following special values:
      
      - [gid.gtk4.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID]: the default sort function
        will be used, if it is set
      
      - [gid.gtk4.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID]: no sorting will occur
  
      Params:
        sortColumnId = the sort column id to set
        order = The sort order of the column
  */
  void setSortColumnId(int sortColumnId, gid.gtk4.types.SortType order);

  /**
      Sets the comparison function used when sorting to be sort_func. If the
      current sort column id of sortable is the same as sort_column_id, then
      the model will sort using this function.
  
      Params:
        sortColumnId = the sort column id to set the function for
        sortFunc = The comparison function
  */
  void setSortFunc(int sortColumnId, gid.gtk4.types.TreeIterCompareFunc sortFunc);

  /**
      Emits a `GtkTreeSortable::sort-column-changed` signal on sortable.
  */
  void sortColumnChanged();

  /**
      Connect to `SortColumnChanged` signal.
  
      The ::sort-column-changed signal is emitted when the sort column
        or sort order of sortable is changed. The signal is emitted before
        the contents of sortable are resorted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.tree_sortable.TreeSortable treeSortable)`
  
          `treeSortable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSortColumnChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.tree_sortable.TreeSortable)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.tree_sortable.TreeSortable.sortColumnChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gid.gobject2.object.ObjectWrap)this).connectSignalClosure("sort-column-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_sortable.TreeSortable]
interface TreeSortableGidBuilderImpl(T) : gid.gtk4.tree_model.TreeModelGidBuilderImpl!T
{
}
