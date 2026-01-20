/// Module for [TreeModelFilter] class
module gtk.tree_model_filter;

import gid.gid;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_drag_source;
import gtk.tree_drag_source_mixin;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_model_mixin;
import gtk.tree_path;
import gtk.types;

/**
    A [gtk.tree_model.TreeModel] which hides parts of an underlying tree model
    
    A [gtk.tree_model_filter.TreeModelFilter] is a tree model which wraps another tree model,
    and can do the following things:
    
    $(LIST
      * Filter specific rows, based on data from a “visible column”, a column
        storing booleans indicating whether the row should be filtered or not,
        or based on the return value of a “visible function”, which gets a
        model, iter and user_data and returns a boolean indicating whether the
        row should be filtered or not.
      
      * Modify the “appearance” of the model, using a modify function.
        This is extremely powerful and allows for just changing some
        values and also for creating a completely different model based
        on the given child model.
      
      * Set a different root node, also known as a “virtual root”. You can pass
        in a [gtk.tree_path.TreePath] indicating the root node for the filter at construction
        time.
    )
      
    The basic API is similar to [gtk.tree_model_sort.TreeModelSort]. For an example on its usage,
    see the section on [gtk.tree_model_sort.TreeModelSort].
    
    When using [gtk.tree_model_filter.TreeModelFilter], it is important to realize that
    [gtk.tree_model_filter.TreeModelFilter] maintains an internal cache of all nodes which are
    visible in its clients. The cache is likely to be a subtree of the tree
    exposed by the child model. [gtk.tree_model_filter.TreeModelFilter] will not cache the entire
    child model when unnecessary to not compromise the caching mechanism
    that is exposed by the reference counting scheme. If the child model
    implements reference counting, unnecessary signals may not be emitted
    because of reference counting rule 3, see the [gtk.tree_model.TreeModel]
    documentation. (Note that e.g. [gtk.tree_store.TreeStore] does not implement
    reference counting and will always emit all signals, even when
    the receiving node is not visible).
    
    Because of this, limitations for possible visible functions do apply.
    In general, visible functions should only use data or properties from
    the node for which the visibility state must be determined, its siblings
    or its parents. Usually, having a dependency on the state of any child
    node is not possible, unless references are taken on these explicitly.
    When no such reference exists, no signals may be received for these child
    nodes (see reference counting rule number 3 in the [gtk.tree_model.TreeModel] section).
    
    Determining the visibility state of a given node based on the state
    of its child nodes is a frequently occurring use case. Therefore,
    [gtk.tree_model_filter.TreeModelFilter] explicitly supports this. For example, when a node
    does not have any children, you might not want the node to be visible.
    As soon as the first row is added to the node’s child level (or the
    last row removed), the node’s visibility should be updated.
    
    This introduces a dependency from the node on its child nodes. In order
    to accommodate this, [gtk.tree_model_filter.TreeModelFilter] must make sure the necessary
    signals are received from the child model. This is achieved by building,
    for all nodes which are exposed as visible nodes to [gtk.tree_model_filter.TreeModelFilter]'s
    clients, the child level (if any) and take a reference on the first node
    in this level. Furthermore, for every row-inserted, row-changed or
    row-deleted signal (also these which were not handled because the node
    was not cached), [gtk.tree_model_filter.TreeModelFilter] will check if the visibility state
    of any parent node has changed.
    
    Beware, however, that this explicit support is limited to these two
    cases. For example, if you want a node to be visible only if two nodes
    in a child’s child level (2 levels deeper) are visible, you are on your
    own. In this case, either rely on [gtk.tree_store.TreeStore] to emit all signals
    because it does not implement reference counting, or for models that
    do implement reference counting, obtain references on these child levels
    yourself.

    Deprecated: Use [gtk.filter_list_model.FilterListModel] instead.
*/
class TreeModelFilter : gobject.object.ObjectWrap, gtk.tree_drag_source.TreeDragSource, gtk.tree_model.TreeModel
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
    return cast(void function())gtk_tree_model_filter_get_type != &gidSymbolNotFound ? gtk_tree_model_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeModelFilter self()
  {
    return this;
  }

  mixin TreeDragSourceT!();
  mixin TreeModelT!();

  /**
      This function should almost never be called. It clears the filter
      of any cached iterators that haven’t been reffed with
      [gtk.tree_model.TreeModel.refNode]. This might be useful if the child model
      being filtered is static (and doesn’t change often) and there has been
      a lot of unreffed access to nodes. As a side effect of this function,
      all unreffed iters will be invalid.
  */
  void clearCache()
  {
    gtk_tree_model_filter_clear_cache(cast(GtkTreeModelFilter*)this._cPtr);
  }

  /**
      Sets filter_iter to point to the row in filter that corresponds to the
      row pointed at by child_iter.  If filter_iter was not set, false is
      returned.
  
      Params:
        filterIter = An uninitialized [gtk.tree_iter.TreeIter]
        childIter = A valid [gtk.tree_iter.TreeIter] pointing to a row on the child model.
      Returns: true, if filter_iter was set, i.e. if child_iter is a
        valid iterator pointing to a visible row in child model.
  */
  bool convertChildIterToIter(out gtk.tree_iter.TreeIter filterIter, gtk.tree_iter.TreeIter childIter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_model_filter_convert_child_iter_to_iter(cast(GtkTreeModelFilter*)this._cPtr, cast(GtkTreeIter*)&filterIter, cast(GtkTreeIter*)&childIter);
    return _retval;
  }

  /**
      Converts child_path to a path relative to filter. That is, child_path
      points to a path in the child model. The rerturned path will point to the
      same row in the filtered model. If child_path isn’t a valid path on the
      child model or points to a row which is not visible in filter, then null
      is returned.
  
      Params:
        childPath = A [gtk.tree_path.TreePath] to convert.
      Returns: A newly allocated [gtk.tree_path.TreePath]
  */
  gtk.tree_path.TreePath convertChildPathToPath(gtk.tree_path.TreePath childPath)
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_filter_convert_child_path_to_path(cast(GtkTreeModelFilter*)this._cPtr, childPath ? cast(GtkTreePath*)childPath._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets child_iter to point to the row pointed to by filter_iter.
  
      Params:
        childIter = An uninitialized [gtk.tree_iter.TreeIter]
        filterIter = A valid [gtk.tree_iter.TreeIter] pointing to a row on filter.
  */
  void convertIterToChildIter(out gtk.tree_iter.TreeIter childIter, gtk.tree_iter.TreeIter filterIter)
  {
    gtk_tree_model_filter_convert_iter_to_child_iter(cast(GtkTreeModelFilter*)this._cPtr, cast(GtkTreeIter*)&childIter, cast(GtkTreeIter*)&filterIter);
  }

  /**
      Converts filter_path to a path on the child model of filter. That is,
      filter_path points to a location in filter. The returned path will
      point to the same location in the model not being filtered. If filter_path
      does not point to a location in the child model, null is returned.
  
      Params:
        filterPath = A [gtk.tree_path.TreePath] to convert.
      Returns: A newly allocated [gtk.tree_path.TreePath]
  */
  gtk.tree_path.TreePath convertPathToChildPath(gtk.tree_path.TreePath filterPath)
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_filter_convert_path_to_child_path(cast(GtkTreeModelFilter*)this._cPtr, filterPath ? cast(GtkTreePath*)filterPath._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gtk.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a pointer to the child model of filter.
      Returns: A pointer to a [gtk.tree_model.TreeModel]
  */
  gtk.tree_model.TreeModel getModel()
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_model_filter_get_model(cast(GtkTreeModelFilter*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits ::row_changed for each row in the child model, which causes
      the filter to re-evaluate whether a row is visible or not.
  */
  void refilter()
  {
    gtk_tree_model_filter_refilter(cast(GtkTreeModelFilter*)this._cPtr);
  }

  /**
      With the n_columns and types parameters, you give an array of column
      types for this model (which will be exposed to the parent model/view).
      The func, data and destroy parameters are for specifying the modify
      function. The modify function will get called for each
      data access, the goal of the modify function is to return the data which
      should be displayed at the location specified using the parameters of the
      modify function.
      
      Note that [gtk.tree_model_filter.TreeModelFilter.setModifyFunc]
      can only be called once for a given filter model.
  
      Params:
        types = The [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s of the columns.
        func = A [gtk.types.TreeModelFilterModifyFunc]
  */
  void setModifyFunc(gobject.types.GType[] types, gtk.types.TreeModelFilterModifyFunc func)
  {
    extern(C) void _funcCallback(GtkTreeModel* model, GtkTreeIter* iter, GValue* value, int column, void* data)
    {
      auto _dlg = cast(gtk.types.TreeModelFilterModifyFunc*)data;
      auto _value = new gobject.value.Value(value, No.Take);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), *cast(gtk.tree_iter.TreeIter*)iter, _value, column);
      *value = *cast(GValue*)_value._cPtr;

    }
    auto _funcCB = func ? &_funcCallback : null;
    int _nColumns;
    if (types)
      _nColumns = cast(int)types.length;

    auto _types = cast(GType*)types.ptr;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_model_filter_set_modify_func(cast(GtkTreeModelFilter*)this._cPtr, _nColumns, _types, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets column of the child_model to be the column where filter should
      look for visibility information. columns should be a column of type
      `G_TYPE_BOOLEAN`, where true means that a row is visible, and false
      if not.
      
      Note that [gtk.tree_model_filter.TreeModelFilter.setVisibleFunc] or
      [gtk.tree_model_filter.TreeModelFilter.setVisibleColumn] can only be called
      once for a given filter model.
  
      Params:
        column = A [harfbuzz.types.int] which is the column containing the visible information
  */
  void setVisibleColumn(int column)
  {
    gtk_tree_model_filter_set_visible_column(cast(GtkTreeModelFilter*)this._cPtr, column);
  }

  /**
      Sets the visible function used when filtering the filter to be func.
      The function should return true if the given row should be visible and
      false otherwise.
      
      If the condition calculated by the function changes over time (e.g.
      because it depends on some global parameters), you must call
      [gtk.tree_model_filter.TreeModelFilter.refilter] to keep the visibility information
      of the model up-to-date.
      
      Note that func is called whenever a row is inserted, when it may still
      be empty. The visible function should therefore take special care of empty
      rows, like in the example below.
      
      ```c
      static gboolean
      visible_func (GtkTreeModel *model,
                    GtkTreeIter  *iter,
                    gpointer      data)
      {
        // Visible if row is non-empty and first column is “HI”
        char *str;
        gboolean visible = FALSE;
      
        gtk_tree_model_get (model, iter, 0, &str, -1);
        if (str && strcmp (str, "HI") == 0)
          visible = TRUE;
        g_free (str);
      
        return visible;
      }
      ```
      
      Note that [gtk.tree_model_filter.TreeModelFilter.setVisibleFunc] or
      [gtk.tree_model_filter.TreeModelFilter.setVisibleColumn] can only be called
      once for a given filter model.
  
      Params:
        func = A [gtk.types.TreeModelFilterVisibleFunc], the visible function
  */
  void setVisibleFunc(gtk.types.TreeModelFilterVisibleFunc func)
  {
    extern(C) gboolean _funcCallback(GtkTreeModel* model, GtkTreeIter* iter, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TreeModelFilterVisibleFunc*)data;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), *cast(gtk.tree_iter.TreeIter*)iter);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_model_filter_set_visible_func(cast(GtkTreeModelFilter*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }
}
