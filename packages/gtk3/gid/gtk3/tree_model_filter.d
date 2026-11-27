/// Module for [TreeModelFilter] class
module gid.gtk3.tree_model_filter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.tree_drag_source;
import gid.gtk3.tree_drag_source_mixin;
import gid.gtk3.tree_iter;
import gid.gtk3.tree_model;
import gid.gtk3.tree_model_mixin;
import gid.gtk3.tree_path;
import gid.gtk3.types;

/**
    A #GtkTreeModelFilter is a tree model which wraps another tree model,
    and can do the following things:
    
    - Filter specific rows, based on data from a “visible column”, a column
      storing booleans indicating whether the row should be filtered or not,
      or based on the return value of a “visible function”, which gets a
      model, iter and user_data and returns a boolean indicating whether the
      row should be filtered or not.
    
    - Modify the “appearance” of the model, using a modify function.
      This is extremely powerful and allows for just changing some
      values and also for creating a completely different model based
      on the given child model.
    
    - Set a different root node, also known as a “virtual root”. You can pass
      in a #GtkTreePath indicating the root node for the filter at construction
      time.
    
    The basic API is similar to #GtkTreeModelSort. For an example on its usage,
    see the section on #GtkTreeModelSort.
    
    When using #GtkTreeModelFilter, it is important to realize that
    #GtkTreeModelFilter maintains an internal cache of all nodes which are
    visible in its clients. The cache is likely to be a subtree of the tree
    exposed by the child model. #GtkTreeModelFilter will not cache the entire
    child model when unnecessary to not compromise the caching mechanism
    that is exposed by the reference counting scheme. If the child model
    implements reference counting, unnecessary signals may not be emitted
    because of reference counting rule 3, see the #GtkTreeModel
    documentation. (Note that e.g. #GtkTreeStore does not implement
    reference counting and will always emit all signals, even when
    the receiving node is not visible).
    
    Because of this, limitations for possible visible functions do apply.
    In general, visible functions should only use data or properties from
    the node for which the visibility state must be determined, its siblings
    or its parents. Usually, having a dependency on the state of any child
    node is not possible, unless references are taken on these explicitly.
    When no such reference exists, no signals may be received for these child
    nodes (see reference couting rule number 3 in the #GtkTreeModel section).
    
    Determining the visibility state of a given node based on the state
    of its child nodes is a frequently occurring use case. Therefore,
    #GtkTreeModelFilter explicitly supports this. For example, when a node
    does not have any children, you might not want the node to be visible.
    As soon as the first row is added to the node’s child level (or the
    last row removed), the node’s visibility should be updated.
    
    This introduces a dependency from the node on its child nodes. In order
    to accommodate this, #GtkTreeModelFilter must make sure the necessary
    signals are received from the child model. This is achieved by building,
    for all nodes which are exposed as visible nodes to #GtkTreeModelFilter's
    clients, the child level (if any) and take a reference on the first node
    in this level. Furthermore, for every row-inserted, row-changed or
    row-deleted signal (also these which were not handled because the node
    was not cached), #GtkTreeModelFilter will check if the visibility state
    of any parent node has changed.
    
    Beware, however, that this explicit support is limited to these two
    cases. For example, if you want a node to be visible only if two nodes
    in a child’s child level (2 levels deeper) are visible, you are on your
    own. In this case, either rely on #GtkTreeStore to emit all signals
    because it does not implement reference counting, or for models that
    do implement reference counting, obtain references on these child levels
    yourself.
*/
@gidGir("TreeModelFilter", "TreeModelFilterClass")
class TreeModelFilter : gid.gobject2.object.ObjectWrap, gid.gtk3.tree_drag_source.TreeDragSource, gid.gtk3.tree_model.TreeModel
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_model_filter_get_type != &gidSymbolNotFound ? gtk_tree_model_filter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeModelFilter";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeModelFilter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.tree_model_filter.TreeModelFilter]
      Returns: New builder object
  */
  static TreeModelFilterGidBuilder builder() nothrow
  {
    return new TreeModelFilterGidBuilder;
  }

  /** */
  @property gid.gtk3.tree_model.TreeModel childModel() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.tree_model.TreeModel)("child-model");
  }

  /** */
  @property gid.gtk3.tree_path.TreePath virtualRoot() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.tree_path.TreePath)("virtual-root");
  }

  mixin TreeDragSourceT!();
  mixin TreeModelT!();

  /** */
  protected void vfuncModify(gid.gtk3.tree_model.TreeModel childModel, gid.gtk3.tree_iter.TreeIter iter, gid.gobject2.value.Value value, int column)
  {
    auto _klass = cast(GtkTreeModelFilterClass*)_vfuncClass;
    if (!_klass.modify)
      return;

    _klass.modify(cast(GtkTreeModelFilter*)this._cPtr, childModel ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)childModel)._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null, value ? cast(GValue*)value._cPtr(No.Dup) : null, column);
  }

  /** */
  protected bool vfuncVisible(gid.gtk3.tree_model.TreeModel childModel, gid.gtk3.tree_iter.TreeIter iter)
  {
    auto _klass = cast(GtkTreeModelFilterClass*)_vfuncClass;
    if (!_klass.visible)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.visible(cast(GtkTreeModelFilter*)this._cPtr, childModel ? cast(GtkTreeModel*)(cast(gid.gobject2.object.ObjectWrap)childModel)._cPtr(No.Dup) : null, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This function should almost never be called. It clears the filter
      of any cached iterators that haven’t been reffed with
      [gid.gtk4.tree_model.TreeModel.refNode]. This might be useful if the child model
      being filtered is static (and doesn’t change often) and there has been
      a lot of unreffed access to nodes. As a side effect of this function,
      all unreffed iters will be invalid.
  */
  void clearCache() nothrow
  {
    gtk_tree_model_filter_clear_cache(cast(GtkTreeModelFilter*)this._cPtr);
  }

  /**
      Sets filter_iter to point to the row in filter that corresponds to the
      row pointed at by child_iter.  If filter_iter was not set, false is
      returned.
  
      Params:
        filterIter = An uninitialized #GtkTreeIter.
        childIter = A valid #GtkTreeIter pointing to a row on the child model.
      Returns: true, if filter_iter was set, i.e. if child_iter is a
        valid iterator pointing to a visible row in child model.
  */
  bool convertChildIterToIter(out gid.gtk3.tree_iter.TreeIter filterIter, gid.gtk3.tree_iter.TreeIter childIter) nothrow
  {
    bool _retval;
    auto _filterIter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_tree_model_filter_convert_child_iter_to_iter(cast(GtkTreeModelFilter*)this._cPtr, _filterIter, childIter ? cast(GtkTreeIter*)childIter._cPtr(No.Dup) : null);
    filterIter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_filterIter, Yes.Take);
    return _retval;
  }

  /**
      Converts child_path to a path relative to filter. That is, child_path
      points to a path in the child model. The rerturned path will point to the
      same row in the filtered model. If child_path isn’t a valid path on the
      child model or points to a row which is not visible in filter, then null
      is returned.
  
      Params:
        childPath = A #GtkTreePath to convert.
      Returns: A newly allocated #GtkTreePath, or null.
  */
  gid.gtk3.tree_path.TreePath convertChildPathToPath(gid.gtk3.tree_path.TreePath childPath) nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_filter_convert_child_path_to_path(cast(GtkTreeModelFilter*)this._cPtr, childPath ? cast(GtkTreePath*)childPath._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk3.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sets child_iter to point to the row pointed to by filter_iter.
  
      Params:
        childIter = An uninitialized #GtkTreeIter.
        filterIter = A valid #GtkTreeIter pointing to a row on filter.
  */
  void convertIterToChildIter(out gid.gtk3.tree_iter.TreeIter childIter, gid.gtk3.tree_iter.TreeIter filterIter) nothrow
  {
    auto _childIter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    gtk_tree_model_filter_convert_iter_to_child_iter(cast(GtkTreeModelFilter*)this._cPtr, _childIter, filterIter ? cast(GtkTreeIter*)filterIter._cPtr(No.Dup) : null);
    childIter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_childIter, Yes.Take);
  }

  /**
      Converts filter_path to a path on the child model of filter. That is,
      filter_path points to a location in filter. The returned path will
      point to the same location in the model not being filtered. If filter_path
      does not point to a location in the child model, null is returned.
  
      Params:
        filterPath = A #GtkTreePath to convert.
      Returns: A newly allocated #GtkTreePath, or null.
  */
  gid.gtk3.tree_path.TreePath convertPathToChildPath(gid.gtk3.tree_path.TreePath filterPath) nothrow
  {
    GtkTreePath* _cretval;
    _cretval = gtk_tree_model_filter_convert_path_to_child_path(cast(GtkTreeModelFilter*)this._cPtr, filterPath ? cast(GtkTreePath*)filterPath._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.gtk3.tree_path.TreePath(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns a pointer to the child model of filter.
      Returns: A pointer to a #GtkTreeModel.
  */
  gid.gtk3.tree_model.TreeModel getModel() nothrow
  {
    GtkTreeModel* _cretval;
    _cretval = gtk_tree_model_filter_get_model(cast(GtkTreeModelFilter*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(GtkTreeModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits ::row_changed for each row in the child model, which causes
      the filter to re-evaluate whether a row is visible or not.
  */
  void refilter() nothrow
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
      
      Note that [gid.gtk4.tree_model_filter.TreeModelFilter.setModifyFunc]
      can only be called once for a given filter model.
  
      Params:
        types = The #GTypes of the columns.
        func = A #GtkTreeModelFilterModifyFunc
  */
  void setModifyFunc(gid.gobject2.types.GType[] types, gid.gtk3.types.TreeModelFilterModifyFunc func) nothrow
  {
    extern(C) void _funcCallback(GtkTreeModel* model, GtkTreeIter* iter, GValue* value, int column, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.TreeModelFilterModifyFunc*)data;
      auto _iter = iter ? new gid.gtk3.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;
      gid.gobject2.value.Value _value;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _iter, _value, column);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeModelFilterModifyFunc");
      }
      if (_iter)
        _iter._cUnborrow;
      if (_value)
      {
        auto p_ = _value._cPtr(Yes.Dup);
        *value = *cast(GValue*)p_;
        gFree(p_);
      }

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
      
      Note that [gid.gtk4.tree_model_filter.TreeModelFilter.setVisibleFunc] or
      [gid.gtk4.tree_model_filter.TreeModelFilter.setVisibleColumn] can only be called
      once for a given filter model.
  
      Params:
        column = A #gint which is the column containing the visible information
  */
  void setVisibleColumn(int column) nothrow
  {
    gtk_tree_model_filter_set_visible_column(cast(GtkTreeModelFilter*)this._cPtr, column);
  }

  /**
      Sets the visible function used when filtering the filter to be func.
      The function should return true if the given row should be visible and
      false otherwise.
      
      If the condition calculated by the function changes over time (e.g.
      because it depends on some global parameters), you must call
      [gid.gtk4.tree_model_filter.TreeModelFilter.refilter] to keep the visibility information
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
        gchar *str;
        gboolean visible = FALSE;
      
        gtk_tree_model_get (model, iter, 0, &str, -1);
        if (str && strcmp (str, "HI") == 0)
          visible = TRUE;
        g_free (str);
      
        return visible;
      }
      ```
      
      Note that [gid.gtk4.tree_model_filter.TreeModelFilter.setVisibleFunc] or
      [gid.gtk4.tree_model_filter.TreeModelFilter.setVisibleColumn] can only be called
      once for a given filter model.
  
      Params:
        func = A #GtkTreeModelFilterVisibleFunc, the visible function
  */
  void setVisibleFunc(gid.gtk3.types.TreeModelFilterVisibleFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(GtkTreeModel* model, GtkTreeIter* iter, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.TreeModelFilterVisibleFunc*)data;
      auto _iter = iter ? new gid.gtk3.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _iter);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeModelFilterVisibleFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_iter)
        _iter._cUnborrow;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_model_filter_set_visible_func(cast(GtkTreeModelFilter*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TreeModelFilter
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.tree_model_filter.TreeModelFilter), T.stringof ~ " is not derived from gid.gtk3.tree_model_filter.TreeModelFilter");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncModify", true)[0]) == gid.gtk3.tree_model_filter.TreeModelFilter))
      _installVfunc(klass, "modify");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncVisible", true)[0]) == gid.gtk3.tree_model_filter.TreeModelFilter))
      _installVfunc(klass, "visible");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkTreeModelFilterClass*)klass;

    switch (vfunc)
    {
      case "modify":
      {
        static extern(C) void _vfuncModifyTramp(GtkTreeModelFilter* self, GtkTreeModel* childModel, GtkTreeIter* iter, GValue* value, int column) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.tree_model_filter.TreeModelFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.modify)
              return (cast(typeof(&_vfuncModifyTramp))_klass.modify)(self, childModel, iter, value, column);
            return;
          }

          auto _iter = iter ? new gid.gtk3.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;
          auto _value = value ? new gid.gobject2.value.Value(cast(void*)value, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncModify(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)childModel, No.Take), _iter, _value, column);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_model_filter.TreeModelFilter.vfuncModify");
          }
          if (_iter)
            _iter._cUnborrow;
          if (_value)
            _value._cUnborrow;

        }

        _klass.modify = cast(typeof(_klass.modify))&_vfuncModifyTramp;
        break;
      }
      case "visible":
      {
        static extern(C) gboolean _vfuncVisibleTramp(GtkTreeModelFilter* self, GtkTreeModel* childModel, GtkTreeIter* iter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.tree_model_filter.TreeModelFilter)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeModelFilterClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self);
            if (_klass.visible)
              return (cast(typeof(&_vfuncVisibleTramp))_klass.visible)(self, childModel, iter);
            return typeof(return).init;
          }

          bool _dretval;
          auto _iter = iter ? new gid.gtk3.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

          try
          {
            _dretval = _obj.vfuncVisible(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)childModel, No.Take), _iter);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_model_filter.TreeModelFilter.vfuncVisible");
          }
          auto _retval = cast(gboolean)_dretval;
          if (_iter)
            _iter._cUnborrow;

          return _retval;
        }

        _klass.visible = cast(typeof(_klass.visible))&_vfuncVisibleTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.tree_model_filter.TreeModelFilter]
class TreeModelFilterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk3.tree_drag_source.TreeDragSourceGidBuilderImpl!T, gid.gtk3.tree_model.TreeModelGidBuilderImpl!T
{

  mixin TreeDragSourceGidBuilderT!();
  mixin TreeModelGidBuilderT!();

  /** */
  T childModel(gid.gtk3.tree_model.TreeModel propval) nothrow
  {
    return setProperty("child-model", propval);
  }

  /** */
  T virtualRoot(gid.gtk3.tree_path.TreePath propval) nothrow
  {
    return setProperty("virtual-root", propval);
  }
}

/// Fluent builder for [gid.gtk3.tree_model_filter.TreeModelFilter]
final class TreeModelFilterGidBuilder : TreeModelFilterGidBuilderImpl!TreeModelFilterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeModelFilter build() nothrow
  {
    return new TreeModelFilter(cast(void*)createGObject(TreeModelFilter._getGType), Yes.Take);
  }
}
