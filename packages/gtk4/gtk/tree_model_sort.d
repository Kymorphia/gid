/// Module for [TreeModelSort] class
module gtk.tree_model_sort;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_drag_source;
import gtk.tree_drag_source_mixin;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_model_mixin;
import gtk.tree_path;
import gtk.tree_sortable;
import gtk.tree_sortable_mixin;
import gtk.types;

/**
    A GtkTreeModel which makes an underlying tree model sortable
    
    The [gtk.tree_model_sort.TreeModelSort] is a model which implements the [gtk.tree_sortable.TreeSortable]
    interface.  It does not hold any data itself, but rather is created with
    a child model and proxies its data.  It has identical column types to
    this child model, and the changes in the child are propagated.  The
    primary purpose of this model is to provide a way to sort a different
    model without modifying it. Note that the sort function used by
    [gtk.tree_model_sort.TreeModelSort] is not guaranteed to be stable.
    
    The use of this is best demonstrated through an example.  In the
    following sample code we create two [gtk.tree_view.TreeView] widgets each with a
    view of the same data.  As the model is wrapped here by a
    [gtk.tree_model_sort.TreeModelSort], the two [gtk.tree_view.TreeView]s can each sort their
    view of the data without affecting the other.  By contrast, if we
    simply put the same model in each widget, then sorting the first would
    sort the second.
    
    ## Using a [gtk.tree_model_sort.TreeModelSort]
    
    ```c
    {
      GtkTreeView *tree_view1;
      GtkTreeView *tree_view2;
      GtkTreeModel *sort_model1;
      GtkTreeModel *sort_model2;
      GtkTreeModel *child_model;
    
      // get the child model
      child_model = get_my_model ();
    
      // Create the first tree
      sort_model1 = gtk_tree_model_sort_new_with_model (child_model);
      tree_view1 = gtk_tree_view_new_with_model (sort_model1);
    
      // Create the second tree
      sort_model2 = gtk_tree_model_sort_new_with_model (child_model);
      tree_view2 = gtk_tree_view_new_with_model (sort_model2);
    
      // Now we can sort the two models independently
      gtk_tree_sortable_set_sort_column_id (GTK_TREE_SORTABLE (sort_model1),
                                            COLUMN_1, GTK_SORT_ASCENDING);
      gtk_tree_sortable_set_sort_column_id (GTK_TREE_SORTABLE (sort_model2),
                                            COLUMN_1, GTK_SORT_DESCENDING);
    }
    ```
    
    To demonstrate how to access the underlying child model from the sort
    model, the next example will be a callback for the [gtk.tree_selection.TreeSelection]
    `GtkTreeSelection::changed` signal.  In this callback, we get a string
    from COLUMN_1 of the model.  We then modify the string, find the same
    selected row on the child model, and change the row there.
    
    ## Accessing the child model of in a selection changed callback
    
    ```c
    void
    selection_changed (GtkTreeSelection *selection, gpointer data)
    {
      GtkTreeModel *sort_model = NULL;
      GtkTreeModel *child_model;
      GtkTreeIter sort_iter;
      GtkTreeIter child_iter;
      char *some_data = NULL;
      char *modified_data;
    
      // Get the current selected row and the model.
      if (! gtk_tree_selection_get_selected (selection,
                                             &sort_model,
                                             &sort_iter))
        return;
    
      // Look up the current value on the selected row and get
      // a new value to change it to.
      gtk_tree_model_get (GTK_TREE_MODEL (sort_model), &sort_iter,
                          COLUMN_1, &some_data,
                          -1);
    
      modified_data = change_the_data (some_data);
      g_free (some_data);
    
      // Get an iterator on the child model, instead of the sort model.
      gtk_tree_model_sort_convert_iter_to_child_iter (GTK_TREE_MODEL_SORT (sort_model),
                                                      &child_iter,
                                                      &sort_iter);
    
      // Get the child model and change the value of the row. In this
      // example, the child model is a GtkListStore. It could be any other
      // type of model, though.
      child_model = gtk_tree_model_sort_get_model (GTK_TREE_MODEL_SORT (sort_model));
      gtk_list_store_set (GTK_LIST_STORE (child_model), &child_iter,
                          COLUMN_1, &modified_data,
                          -1);
      g_free (modified_data);
    }
    ```

    Deprecated: Use [gtk.sort_list_model.SortListModel] instead
*/
class TreeModelSort : gobject.object.ObjectWrap, gtk.tree_drag_source.TreeDragSource, gtk.tree_model.TreeModel, gtk.tree_sortable.TreeSortable
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
    return cast(void function())gtk_tree_model_sort_get_type != &gidSymbolNotFound ? gtk_tree_model_sort_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeModelSort self()
  {
    return this;
  }

  mixin TreeDragSourceT!();
  mixin TreeModelT!();
  mixin TreeSortableT!();

  /**
      Creates a new [gtk.tree_model_sort.TreeModelSort], with child_model as the child model.
  
      Params:
        childModel = A [gtk.tree_model.TreeModel]
      Returns: A new [gtk.tree_model_sort.TreeModelSort].
  */
  static gtk.tree_model_sort.TreeModelSort newWithModel(gtk.tree_model.TreeModel childModel)
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_model_sort_new_with_model(childModel ? cast(GtkTreeModel*)(cast(gobject.object.ObjectWrap)childModel)._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model_sort.TreeModelSort)(cast(GtkTreeModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This function should almost never be called.  It clears the tree_model_sort
      of any cached iterators that haven’t been reffed with
      [gtk.tree_model.TreeModel.refNode].  This might be useful if the child model being
      sorted is static (and doesn’t change often) and there has been a lot of
      unreffed access to nodes.  As a side effect of this function, all unreffed
      iters will be invalid.
  */
  void clearCache()
  {
    gtk_tree_model_sort_clear_cache(cast(GtkTreeModelSort*)this._cPtr);
  }

  /**
      Sets sort_iter to point to the row in tree_model_sort that corresponds to
      the row pointed at by child_iter.  If sort_iter was not set, false
      is returned.  Note: a boolean is only returned since 2.14.
  
      Params:
        sortIter = An uninitialized [gtk.tree_iter.TreeIter]
        childIter = A valid [gtk.tree_iter.TreeIter] pointing to a row on the child model
      Returns: true, if sort_iter was set, i.e. if sort_iter is a
        valid iterator pointer to a visible row in the child model.
  */
  bool convertChildIterToIter(out gtk.tree_iter.TreeIter sortIter, gtk.tree_iter.TreeIter childIter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_model_sort_convert_child_iter_to_iter(cast(GtkTreeModelSort*)this._cPtr, cast(GtkTreeIter*)&sortIter, cast(GtkTreeIter*)&childIter);
    return _retval;
  }

  /**
      Converts child_path to a path relative to tree_model_sort.  That is,
      child_path points to a path in the child model.  The returned path will
      point to the same row in the sorted model.  If child_path isn’t a valid
      path on the child model, then null is returned.
  
      Params:
        childPath = A [gtk.tree_path.TreePath] to convert
      Returns: A newly allocated [gtk.tree_path.TreePath]
  */
  gtk.tree_path.TreePath convertChildPathToPath(gtk.tree_path.TreePath childPath)
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_sort_convert_child_path_to_path(cast(GtkTreeModelSort*)this._cPtr, childPath ? cast(GtkTreePath*)childPath._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets child_iter to point to the row pointed to by sorted_iter.
  
      Params:
        childIter = An uninitialized [gtk.tree_iter.TreeIter]
        sortedIter = A valid [gtk.tree_iter.TreeIter] pointing to a row on tree_model_sort.
  */
  void convertIterToChildIter(out gtk.tree_iter.TreeIter childIter, gtk.tree_iter.TreeIter sortedIter)
  {
    gtk_tree_model_sort_convert_iter_to_child_iter(cast(GtkTreeModelSort*)this._cPtr, cast(GtkTreeIter*)&childIter, cast(GtkTreeIter*)&sortedIter);
  }

  /**
      Converts sorted_path to a path on the child model of tree_model_sort.
      That is, sorted_path points to a location in tree_model_sort.  The
      returned path will point to the same location in the model not being
      sorted.  If sorted_path does not point to a location in the child model,
      null is returned.
  
      Params:
        sortedPath = A [gtk.tree_path.TreePath] to convert
      Returns: A newly allocated [gtk.tree_path.TreePath]
  */
  gtk.tree_path.TreePath convertPathToChildPath(gtk.tree_path.TreePath sortedPath)
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_sort_convert_path_to_child_path(cast(GtkTreeModelSort*)this._cPtr, sortedPath ? cast(GtkTreePath*)sortedPath._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the model the [gtk.tree_model_sort.TreeModelSort] is sorting.
      Returns: the "child model" being sorted
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_model_sort_get_model(cast(GtkTreeModelSort*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      > This function is slow. Only use it for debugging and/or testing
      > purposes.
      
      Checks if the given iter is a valid iter for this [gtk.tree_model_sort.TreeModelSort].
  
      Params:
        iter = A [gtk.tree_iter.TreeIter]
      Returns: true if the iter is valid, false if the iter is invalid.
  */
  bool iterIsValid(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_model_sort_iter_is_valid(cast(GtkTreeModelSort*)this._cPtr, cast(GtkTreeIter*)&iter);
    return _retval;
  }

  /**
      This resets the default sort function to be in the “unsorted” state.  That
      is, it is in the same order as the child model. It will re-sort the model
      to be in the same order as the child model only if the [gtk.tree_model_sort.TreeModelSort]
      is in “unsorted” state.
  */
  void resetDefaultSortFunc()
  {
    gtk_tree_model_sort_reset_default_sort_func(cast(GtkTreeModelSort*)this._cPtr);
  }
}
