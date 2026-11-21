/// Module for [TreeListRowSorter] class
module gid.gtk4.tree_list_row_sorter;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.sorter;
import gid.gtk4.types;

/**
    Applies a gives sorter to the levels in a tree.
    
    Here is an example for setting up a column view with a tree model and
    a `GtkTreeListSorter`:
    
    ```c
    column_sorter = gtk_column_view_get_sorter (view);
    sorter = gtk_tree_list_row_sorter_new (g_object_ref (column_sorter));
    sort_model = gtk_sort_list_model_new (tree_model, sorter);
    selection = gtk_single_selection_new (sort_model);
    gtk_column_view_set_model (view, G_LIST_MODEL (selection));
    ```
*/
class TreeListRowSorter : gid.gtk4.sorter.Sorter
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
    return cast(void function())gtk_tree_list_row_sorter_get_type != &gidSymbolNotFound ? gtk_tree_list_row_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeListRowSorter";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeListRowSorter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.tree_list_row_sorter.TreeListRowSorter]
      Returns: New builder object
  */
  static TreeListRowSorterGidBuilder builder() nothrow
  {
    return new TreeListRowSorterGidBuilder;
  }

  /**
      Get `sorter` property.
      Returns: The underlying sorter
  */
  @property gid.gtk4.sorter.Sorter sorter() nothrow
  {
    return getSorter();
  }

  /**
      Set `sorter` property.
      Params:
        propval = The underlying sorter
  */
  @property void sorter(gid.gtk4.sorter.Sorter propval) nothrow
  {
    setSorter(propval);
  }

  /**
      Create a special-purpose sorter that applies the sorting
      of sorter to the levels of a [gid.gtk4.tree_list_model.TreeListModel].
      
      Note that this sorter relies on [gid.gtk4.tree_list_model.TreeListModel.passthrough]
      being false as it can only sort [gid.gtk4.tree_list_row.TreeListRow]s.
  
      Params:
        sorter = a [gid.gtk4.sorter.Sorter]
      Returns: a new [gid.gtk4.tree_list_row_sorter.TreeListRowSorter]
  */
  this(gid.gtk4.sorter.Sorter sorter = null) nothrow
  {
    GtkTreeListRowSorter* _cretval;
    _cretval = gtk_tree_list_row_sorter_new(sorter ? cast(GtkSorter*)sorter._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the sorter used by self.
      Returns: the sorter used
  */
  gid.gtk4.sorter.Sorter getSorter() nothrow
  {
    GtkSorter* _cretval;
    _cretval = gtk_tree_list_row_sorter_get_sorter(cast(GtkTreeListRowSorter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the sorter to use for items with the same parent.
      
      This sorter will be passed the [gid.gtk4.tree_list_row.TreeListRow.item] of
      the tree list rows passed to self.
  
      Params:
        sorter = The sorter to use
  */
  void setSorter(gid.gtk4.sorter.Sorter sorter = null) nothrow
  {
    gtk_tree_list_row_sorter_set_sorter(cast(GtkTreeListRowSorter*)this._cPtr, sorter ? cast(GtkSorter*)sorter._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.tree_list_row_sorter.TreeListRowSorter]
class TreeListRowSorterGidBuilderImpl(T) : gid.gtk4.sorter.SorterGidBuilderImpl!T
{

  /**
      Set `sorter` property.
      Params:
        propval = The underlying sorter
      Returns: Builder instance for fluent chaining
  */
  T sorter(gid.gtk4.sorter.Sorter propval) nothrow
  {
    return setProperty("sorter", propval);
  }
}

/// Fluent builder for [gid.gtk4.tree_list_row_sorter.TreeListRowSorter]
final class TreeListRowSorterGidBuilder : TreeListRowSorterGidBuilderImpl!TreeListRowSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeListRowSorter build() nothrow
  {
    return new TreeListRowSorter(cast(void*)createGObject(TreeListRowSorter._getGType), Yes.Take);
  }
}
