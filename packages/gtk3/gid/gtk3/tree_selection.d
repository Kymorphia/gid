/// Module for [TreeSelection] class
module gid.gtk3.tree_selection;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.tree_iter;
import gid.gtk3.tree_model;
import gid.gtk3.tree_path;
import gid.gtk3.tree_view;
import gid.gtk3.types;

/**
    The #GtkTreeSelection object is a helper object to manage the selection
    for a #GtkTreeView widget.  The #GtkTreeSelection object is
    automatically created when a new #GtkTreeView widget is created, and
    cannot exist independently of this widget.  The primary reason the
    #GtkTreeSelection objects exists is for cleanliness of code and API.
    That is, there is no conceptual reason all these functions could not be
    methods on the #GtkTreeView widget instead of a separate function.
    
    The #GtkTreeSelection object is gotten from a #GtkTreeView by calling
    [gid.gtk4.tree_view.TreeView.getSelection].  It can be manipulated to check the
    selection status of the tree, as well as select and deselect individual
    rows.  Selection is done completely view side.  As a result, multiple
    views of the same model can have completely different selections.
    Additionally, you cannot change the selection of a row on the model that
    is not currently displayed by the view without expanding its parents
    first.
    
    One of the important things to remember when monitoring the selection of
    a view is that the #GtkTreeSelection::changed signal is mostly a hint.
    That is, it may only emit one signal when a range of rows is selected.
    Additionally, it may on occasion emit a #GtkTreeSelection::changed signal
    when nothing has happened (mostly as a result of programmers calling
    select_row on an already selected row).
*/
class TreeSelection : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_tree_selection_get_type != &gidSymbolNotFound ? gtk_tree_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTreeSelection";
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeSelection self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.tree_selection.TreeSelection]
      Returns: New builder object
  */
  static TreeSelectionGidBuilder builder() nothrow
  {
    return new TreeSelectionGidBuilder;
  }

  /**
      Get `mode` property.
      Returns: Selection mode.
        See [gid.gtk4.tree_selection.TreeSelection.setMode] for more information on this property.
  */
  @property gid.gtk3.types.SelectionMode mode() nothrow
  {
    return getMode();
  }

  /**
      Set `mode` property.
      Params:
        propval = Selection mode.
          See [gid.gtk4.tree_selection.TreeSelection.setMode] for more information on this property.
  */
  @property void mode(gid.gtk3.types.SelectionMode propval) nothrow
  {
    setMode(propval);
  }

  /**
      Signal emitted whenever the selection has (possibly) changed.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncChanged()
  {
    auto _klass = cast(GtkTreeSelectionClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GtkTreeSelection*)this._cPtr);
  }

  /**
      Returns the number of rows that have been selected in tree.
      Returns: The number of rows selected.
  */
  int countSelectedRows() nothrow
  {
    int _retval;
    _retval = gtk_tree_selection_count_selected_rows(cast(GtkTreeSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the selection mode for selection. See
      [gid.gtk4.tree_selection.TreeSelection.setMode].
      Returns: the current selection mode
  */
  gid.gtk3.types.SelectionMode getMode() nothrow
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_tree_selection_get_mode(cast(GtkTreeSelection*)this._cPtr);
    gid.gtk3.types.SelectionMode _retval = cast(gid.gtk3.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Sets iter to the currently selected node, if selection is set to
      [gid.gtk4.types.SelectionMode.Single] or [gid.gtk4.types.SelectionMode.Browse].
      
      The iter argument may be null if you just want to test if selection
      has any selected nodes.
      
      The model argument is filled with the current model as a convenience.
      
      This function will not work with [gid.gtk4.types.SelectionMode.Multiple]. See
      [gid.gtk4.tree_selection.TreeSelection.getSelectedRows] instead.
  
      Params:
        model = the model
        iter = the iterator for the selected row
      Returns: true, if there is a selected node.
  */
  bool getSelected(out gid.gtk3.tree_model.TreeModel model, out gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    bool _retval;
    GtkTreeModel* _model;
    auto _iter = boxedNew!GtkTreeIter(gid.gtk3.tree_iter.TreeIter._getGType);
    _retval = cast(bool)gtk_tree_selection_get_selected(cast(GtkTreeSelection*)this._cPtr, &_model, _iter);
    model = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(_model, No.Take);
    iter = new gid.gtk3.tree_iter.TreeIter(cast(void*)_iter, Yes.Take);
    return _retval;
  }

  /**
      Creates a list of path of all selected rows.
      
      Additionally, if you are planning on modifying the model after calling
      this function, you may want to convert the returned list into a list
      of #GtkTreeRowReferences.
      
      To do this, you can use [gid.gtk4.tree_row_reference.TreeRowReference.new_].
      
      To free the return value, use:
      
      ```c
      g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
      ```
  
      Params:
        model = A pointer to set to the #GtkTreeModel, or null.
      Returns: the selected paths
  */
  gid.gtk3.tree_path.TreePath[] getSelectedRows(out gid.gtk3.tree_model.TreeModel model) nothrow
  {
    GList* _cretval;
    GtkTreeModel* _model;
    _cretval = gtk_tree_selection_get_selected_rows(cast(GtkTreeSelection*)this._cPtr, &_model);
    auto _retval = gListToD!(gid.gtk3.tree_path.TreePath, GidOwnership.Full)(cast(GList*)_cretval);
    model = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(_model, No.Take);
    return _retval;
  }

  /**
      Returns the tree view associated with selection.
      Returns: A #GtkTreeView
  */
  gid.gtk3.tree_view.TreeView getTreeView() nothrow
  {
    GtkTreeView* _cretval;
    _cretval = gtk_tree_selection_get_tree_view(cast(GtkTreeSelection*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_view.TreeView)(cast(GtkTreeView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if the row at iter is currently selected.
  
      Params:
        iter = A valid #GtkTreeIter
      Returns: true, if iter is selected
  */
  bool iterIsSelected(gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_selection_iter_is_selected(cast(GtkTreeSelection*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns true if the row pointed to by path is currently selected.  If path
      does not point to a valid location, false is returned
  
      Params:
        path = A #GtkTreePath to check selection on.
      Returns: true if path is selected.
  */
  bool pathIsSelected(gid.gtk3.tree_path.TreePath path) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_selection_path_is_selected(cast(GtkTreeSelection*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Selects all the nodes. selection must be set to #GTK_SELECTION_MULTIPLE
      mode.
  */
  void selectAll() nothrow
  {
    gtk_tree_selection_select_all(cast(GtkTreeSelection*)this._cPtr);
  }

  /**
      Selects the specified iterator.
  
      Params:
        iter = The #GtkTreeIter to be selected.
  */
  void selectIter(gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    gtk_tree_selection_select_iter(cast(GtkTreeSelection*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Select the row at path.
  
      Params:
        path = The #GtkTreePath to be selected.
  */
  void selectPath(gid.gtk3.tree_path.TreePath path) nothrow
  {
    gtk_tree_selection_select_path(cast(GtkTreeSelection*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Selects a range of nodes, determined by start_path and end_path inclusive.
      selection must be set to #GTK_SELECTION_MULTIPLE mode.
  
      Params:
        startPath = The initial node of the range.
        endPath = The final node of the range.
  */
  void selectRange(gid.gtk3.tree_path.TreePath startPath, gid.gtk3.tree_path.TreePath endPath) nothrow
  {
    gtk_tree_selection_select_range(cast(GtkTreeSelection*)this._cPtr, startPath ? cast(GtkTreePath*)startPath._cPtr(No.Dup) : null, endPath ? cast(GtkTreePath*)endPath._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected node. Note that you cannot modify
      the tree or selection from within this function. As a result,
      [gid.gtk4.tree_selection.TreeSelection.getSelectedRows] might be more useful.
  
      Params:
        func = The function to call for each selected node.
  */
  void selectedForeach(gid.gtk3.types.TreeSelectionForeachFunc func) nothrow
  {
    extern(C) void _funcCallback(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk3.types.TreeSelectionForeachFunc*)data;
      auto _path = path ? new gid.gtk3.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;
      auto _iter = iter ? new gid.gtk3.tree_iter.TreeIter(cast(void*)iter, Yes.Take)._cBorrow : null;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _path, _iter);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeSelectionForeachFunc");
      }
      if (_path)
        _path._cUnborrow;
      if (_iter)
        _iter._cUnborrow;

    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_tree_selection_selected_foreach(cast(GtkTreeSelection*)this._cPtr, _funcCB, _func);
  }

  /**
      Sets the selection mode of the selection.  If the previous type was
      #GTK_SELECTION_MULTIPLE, then the anchor is kept selected, if it was
      previously selected.
  
      Params:
        type = The selection mode
  */
  void setMode(gid.gtk3.types.SelectionMode type) nothrow
  {
    gtk_tree_selection_set_mode(cast(GtkTreeSelection*)this._cPtr, type);
  }

  /**
      Sets the selection function.
      
      If set, this function is called before any node is selected or unselected,
      giving some control over which nodes are selected. The select function
      should return true if the state of the node may be toggled, and false
      if the state of the node should be left unchanged.
  
      Params:
        func = The selection function. May be null
  */
  void setSelectFunction(gid.gtk3.types.TreeSelectionFunc func = null) nothrow
  {
    extern(C) gboolean _funcCallback(GtkTreeSelection* selection, GtkTreeModel* model, GtkTreePath* path, gboolean pathCurrentlySelected, void* data) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.gtk3.types.TreeSelectionFunc*)data;
      auto _path = path ? new gid.gtk3.tree_path.TreePath(cast(void*)path, Yes.Take)._cBorrow : null;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_selection.TreeSelection)(cast(void*)selection, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.tree_model.TreeModel)(cast(void*)model, No.Take), _path, cast(bool)pathCurrentlySelected);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.TreeSelectionFunc");
      }
      auto _retval = cast(gboolean)_dretval;
      if (_path)
        _path._cUnborrow;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_selection_set_select_function(cast(GtkTreeSelection*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Unselects all the nodes.
  */
  void unselectAll() nothrow
  {
    gtk_tree_selection_unselect_all(cast(GtkTreeSelection*)this._cPtr);
  }

  /**
      Unselects the specified iterator.
  
      Params:
        iter = The #GtkTreeIter to be unselected.
  */
  void unselectIter(gid.gtk3.tree_iter.TreeIter iter) nothrow
  {
    gtk_tree_selection_unselect_iter(cast(GtkTreeSelection*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Unselects the row at path.
  
      Params:
        path = The #GtkTreePath to be unselected.
  */
  void unselectPath(gid.gtk3.tree_path.TreePath path) nothrow
  {
    gtk_tree_selection_unselect_path(cast(GtkTreeSelection*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Unselects a range of nodes, determined by start_path and end_path
      inclusive.
  
      Params:
        startPath = The initial node of the range.
        endPath = The initial node of the range.
  */
  void unselectRange(gid.gtk3.tree_path.TreePath startPath, gid.gtk3.tree_path.TreePath endPath) nothrow
  {
    gtk_tree_selection_unselect_range(cast(GtkTreeSelection*)this._cPtr, startPath ? cast(GtkTreePath*)startPath._cPtr(No.Dup) : null, endPath ? cast(GtkTreePath*)endPath._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted whenever the selection has (possibly) changed. Please note that
        this signal is mostly a hint.  It may only be emitted once when a range
        of rows are selected, and it may occasionally be emitted when nothing
        has happened.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.tree_selection.TreeSelection treeSelection)`
  
          `treeSelection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.tree_selection.TreeSelection)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_selection.TreeSelection.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from TreeSelection
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.tree_selection.TreeSelection), T.stringof ~ " is not derived from gid.gtk3.tree_selection.TreeSelection");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gtk3.tree_selection.TreeSelection))
      _installVfunc(klass, "changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkTreeSelectionClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkTreeSelection* selection) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.tree_selection.TreeSelection)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)selection);
          if (!_obj)
          {
            auto _klass = cast(GtkTreeSelectionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)selection);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(selection);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.tree_selection.TreeSelection.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.tree_selection.TreeSelection]
class TreeSelectionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `mode` property.
      Params:
        propval = Selection mode.
          See [gid.gtk4.tree_selection.TreeSelection.setMode] for more information on this property.
      Returns: Builder instance for fluent chaining
  */
  T mode(gid.gtk3.types.SelectionMode propval) nothrow
  {
    return setProperty("mode", propval);
  }
}

/// Fluent builder for [gid.gtk3.tree_selection.TreeSelection]
final class TreeSelectionGidBuilder : TreeSelectionGidBuilderImpl!TreeSelectionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TreeSelection build() nothrow
  {
    return new TreeSelection(cast(void*)createGObject(TreeSelection._getGType), Yes.Take);
  }
}
