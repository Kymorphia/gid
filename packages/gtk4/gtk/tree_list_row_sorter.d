/// Module for [TreeListRowSorter] class
module gtk.tree_list_row_sorter;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.sorter;
import gtk.types;

/**
    [gtk.tree_list_row_sorter.TreeListRowSorter] is a special-purpose sorter that will apply a given
    sorter to the levels in a tree.
    
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
class TreeListRowSorter : gtk.sorter.Sorter
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
    return cast(void function())gtk_tree_list_row_sorter_get_type != &gidSymbolNotFound ? gtk_tree_list_row_sorter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeListRowSorter self()
  {
    return this;
  }

  /**
      Get builder for [gtk.tree_list_row_sorter.TreeListRowSorter]
      Returns: New builder object
  */
  static TreeListRowSorterGidBuilder builder()
  {
    return new TreeListRowSorterGidBuilder;
  }

  /**
      Get `sorter` property.
      Returns: The underlying sorter
  */
  @property gtk.sorter.Sorter sorter()
  {
    return getSorter();
  }

  /**
      Set `sorter` property.
      Params:
        propval = The underlying sorter
  */
  @property void sorter(gtk.sorter.Sorter propval)
  {
    setSorter(propval);
  }

  /**
      Create a special-purpose sorter that applies the sorting
      of sorter to the levels of a [gtk.tree_list_model.TreeListModel].
      
      Note that this sorter relies on [gtk.tree_list_model.TreeListModel.passthrough]
      being false as it can only sort [gtk.tree_list_row.TreeListRow]s.
  
      Params:
        sorter = a [gtk.sorter.Sorter]
      Returns: a new [gtk.tree_list_row_sorter.TreeListRowSorter]
  */
  this(gtk.sorter.Sorter sorter = null)
  {
    GtkTreeListRowSorter* _cretval;
    _cretval = gtk_tree_list_row_sorter_new(sorter ? cast(GtkSorter*)sorter._cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the sorter used by self.
      Returns: the sorter used
  */
  gtk.sorter.Sorter getSorter()
  {
    GtkSorter* _cretval;
    _cretval = gtk_tree_list_row_sorter_get_sorter(cast(GtkTreeListRowSorter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.sorter.Sorter)(cast(GtkSorter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the sorter to use for items with the same parent.
      
      This sorter will be passed the [gtk.tree_list_row.TreeListRow.item] of
      the tree list rows passed to self.
  
      Params:
        sorter = The sorter to use
  */
  void setSorter(gtk.sorter.Sorter sorter = null)
  {
    gtk_tree_list_row_sorter_set_sorter(cast(GtkTreeListRowSorter*)this._cPtr, sorter ? cast(GtkSorter*)sorter._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gtk.tree_list_row_sorter.TreeListRowSorter]
class TreeListRowSorterGidBuilderImpl(T) : gtk.sorter.SorterGidBuilderImpl!T
{

  /**
      Set `sorter` property.
      Params:
        propval = The underlying sorter
      Returns: Builder instance for fluent chaining
  */
  T sorter(gtk.sorter.Sorter propval)
  {
    return setProperty("sorter", propval);
  }
}

/// Fluent builder for [gtk.tree_list_row_sorter.TreeListRowSorter]
final class TreeListRowSorterGidBuilder : TreeListRowSorterGidBuilderImpl!TreeListRowSorterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeListRowSorter build()
  {
    return new TreeListRowSorter(cast(void*)createGObject(TreeListRowSorter._getGType), Yes.Take);
  }
}
