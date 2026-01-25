/// Module for [TreeSortable] interface
module gtk.tree_sortable;

public import gtk.tree_sortable_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.types;

/**
    The interface for sortable models used by GtkTreeView
    
    [gtk.tree_sortable.TreeSortable] is an interface to be implemented by tree models which
    support sorting. The [gtk.tree_view.TreeView] uses the methods provided by this interface
    to sort the model.

    Deprecated: There is no replacement for this interface. You should
        use [gtk.sort_list_model.SortListModel] to wrap your list model instead
*/
interface TreeSortable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_sortable_get_type != &gidSymbolNotFound ? gtk_tree_sortable_get_type() : cast(GType)0;
  }

  /**
      Fills in sort_column_id and order with the current sort column and the
      order. It returns true unless the sort_column_id is
      [gtk.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID] or
      [gtk.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID].
  
      Params:
        sortColumnId = The sort column id to be filled in
        order = The [gtk.types.SortType] to be filled in
      Returns: true if the sort column is not one of the special sort
          column ids.
  */
  bool getSortColumnId(out int sortColumnId, out gtk.types.SortType order);

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
      [gtk.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], then the model will sort using
      this function.
      
      If sort_func is null, then there will be no default comparison function.
      This means that once the model  has been sorted, it can’t go back to the
      default state. In this case, when the current sort column id of sortable
      is [gtk.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID], the model will be unsorted.
  
      Params:
        sortFunc = The comparison function
  */
  void setDefaultSortFunc(gtk.types.TreeIterCompareFunc sortFunc);

  /**
      Sets the current sort column to be sort_column_id. The sortable will
      resort itself to reflect this change, after emitting a
      `GtkTreeSortable::sort-column-changed` signal. sort_column_id may either be
      a regular column id, or one of the following special values:
      
      $(LIST
        * [gtk.types.TREE_SORTABLE_DEFAULT_SORT_COLUMN_ID]: the default sort function
          will be used, if it is set
        
        * [gtk.types.TREE_SORTABLE_UNSORTED_SORT_COLUMN_ID]: no sorting will occur
      )
  
      Params:
        sortColumnId = the sort column id to set
        order = The sort order of the column
  */
  void setSortColumnId(int sortColumnId, gtk.types.SortType order);

  /**
      Sets the comparison function used when sorting to be sort_func. If the
      current sort column id of sortable is the same as sort_column_id, then
      the model will sort using this function.
  
      Params:
        sortColumnId = the sort column id to set the function for
        sortFunc = The comparison function
  */
  void setSortFunc(int sortColumnId, gtk.types.TreeIterCompareFunc sortFunc);

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
  
          $(D void callback(gtk.tree_sortable.TreeSortable treeSortable))
  
          `treeSortable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSortColumnChanged(T)(T callback, Flag!"After" after = No.After);
}
