/// Module for [TreeSelection] class
module gtk.tree_selection;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.tree_iter;
import gtk.tree_model;
import gtk.tree_path;
import gtk.tree_view;
import gtk.types;

/**
    The selection object for GtkTreeView
    
    The [gtk.tree_selection.TreeSelection] object is a helper object to manage the selection
    for a [gtk.tree_view.TreeView] widget.  The [gtk.tree_selection.TreeSelection] object is
    automatically created when a new [gtk.tree_view.TreeView] widget is created, and
    cannot exist independently of this widget.  The primary reason the
    [gtk.tree_selection.TreeSelection] objects exists is for cleanliness of code and API.
    That is, there is no conceptual reason all these functions could not be
    methods on the [gtk.tree_view.TreeView] widget instead of a separate function.
    
    The [gtk.tree_selection.TreeSelection] object is gotten from a [gtk.tree_view.TreeView] by calling
    [gtk.tree_view.TreeView.getSelection].  It can be manipulated to check the
    selection status of the tree, as well as select and deselect individual
    rows.  Selection is done completely view side.  As a result, multiple
    views of the same model can have completely different selections.
    Additionally, you cannot change the selection of a row on the model that
    is not currently displayed by the view without expanding its parents
    first.
    
    One of the important things to remember when monitoring the selection of
    a view is that the [gtk.tree_selection.TreeSelection]::changed signal is mostly a hint.
    That is, it may only emit one signal when a range of rows is selected.
    Additionally, it may on occasion emit a [gtk.tree_selection.TreeSelection]::changed signal
    when nothing has happened (mostly as a result of programmers calling
    select_row on an already selected row).

    Deprecated: Use [gtk.selection_model.SelectionModel] instead
*/
class TreeSelection : gobject.object.ObjectWrap
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
    return cast(void function())gtk_tree_selection_get_type != &gidSymbolNotFound ? gtk_tree_selection_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TreeSelection self()
  {
    return this;
  }

  /**
      Get `mode` property.
      Returns: Selection mode.
        See [gtk.tree_selection.TreeSelection.setMode] for more information on this property.
  */
  @property gtk.types.SelectionMode mode()
  {
    return getMode();
  }

  /**
      Set `mode` property.
      Params:
        propval = Selection mode.
          See [gtk.tree_selection.TreeSelection.setMode] for more information on this property.
  */
  @property void mode(gtk.types.SelectionMode propval)
  {
    return setMode(propval);
  }

  /**
      Returns the number of rows that have been selected in tree.
      Returns: The number of rows selected.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  int countSelectedRows()
  {
    int _retval;
    _retval = gtk_tree_selection_count_selected_rows(cast(GtkTreeSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the selection mode for selection. See
      [gtk.tree_selection.TreeSelection.setMode].
      Returns: the current selection mode
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  gtk.types.SelectionMode getMode()
  {
    GtkSelectionMode _cretval;
    _cretval = gtk_tree_selection_get_mode(cast(GtkTreeSelection*)this._cPtr);
    gtk.types.SelectionMode _retval = cast(gtk.types.SelectionMode)_cretval;
    return _retval;
  }

  /**
      Sets iter to the currently selected node if selection is set to
      [gtk.types.SelectionMode.Single] or [gtk.types.SelectionMode.Browse].  iter may be NULL if you
      just want to test if selection has any selected nodes.  model is filled
      with the current model as a convenience.  This function will not work if you
      use selection is [gtk.types.SelectionMode.Multiple].
  
      Params:
        model = A pointer to set to the [gtk.tree_model.TreeModel]
        iter = The [gtk.tree_iter.TreeIter]
      Returns: TRUE, if there is a selected node.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  bool getSelected(out gtk.tree_model.TreeModel model, out gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    GtkTreeModel* _model;
    GtkTreeIter _iter;
    _retval = cast(bool)gtk_tree_selection_get_selected(cast(GtkTreeSelection*)this._cPtr, &_model, &_iter);
    model = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(_model, No.Take);
    iter = new gtk.tree_iter.TreeIter(cast(void*)&_iter, No.Take);
    return _retval;
  }

  /**
      Creates a list of path of all selected rows. Additionally, if you are
      planning on modifying the model after calling this function, you may
      want to convert the returned list into a list of [gtk.tree_row_reference.TreeRowReference]s.
      To do this, you can use [gtk.tree_row_reference.TreeRowReference.new_].
      
      To free the return value, use:
      ```c
      g_list_free_full (list, (GDestroyNotify) gtk_tree_path_free);
      ```
  
      Params:
        model = A pointer to set to the [gtk.tree_model.TreeModel]
      Returns: A [glib.list.List] containing a [gtk.tree_path.TreePath] for each selected row.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  gtk.tree_path.TreePath[] getSelectedRows(out gtk.tree_model.TreeModel model)
  {
    GList* _cretval;
    GtkTreeModel* _model;
    _cretval = gtk_tree_selection_get_selected_rows(cast(GtkTreeSelection*)this._cPtr, &_model);
    auto _retval = gListToD!(gtk.tree_path.TreePath, GidOwnership.Full)(cast(GList*)_cretval);
    model = gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(_model, No.Take);
    return _retval;
  }

  /**
      Returns the tree view associated with selection.
      Returns: A [gtk.tree_view.TreeView]
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  gtk.tree_view.TreeView getTreeView()
  {
    GtkTreeView* _cretval;
    _cretval = gtk_tree_selection_get_tree_view(cast(GtkTreeSelection*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tree_view.TreeView)(cast(GtkTreeView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns true if the row at iter is currently selected.
  
      Params:
        iter = A valid [gtk.tree_iter.TreeIter]
      Returns: true, if iter is selected
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  bool iterIsSelected(gtk.tree_iter.TreeIter iter)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_selection_iter_is_selected(cast(GtkTreeSelection*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns true if the row pointed to by path is currently selected.  If path
      does not point to a valid location, false is returned
  
      Params:
        path = A [gtk.tree_path.TreePath] to check selection on.
      Returns: true if path is selected.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  bool pathIsSelected(gtk.tree_path.TreePath path)
  {
    bool _retval;
    _retval = cast(bool)gtk_tree_selection_path_is_selected(cast(GtkTreeSelection*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Selects all the nodes. selection must be set to [gtk.types.SelectionMode.Multiple]
      mode.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void selectAll()
  {
    gtk_tree_selection_select_all(cast(GtkTreeSelection*)this._cPtr);
  }

  /**
      Selects the specified iterator.
  
      Params:
        iter = The [gtk.tree_iter.TreeIter] to be selected.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void selectIter(gtk.tree_iter.TreeIter iter)
  {
    gtk_tree_selection_select_iter(cast(GtkTreeSelection*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Select the row at path.
  
      Params:
        path = The [gtk.tree_path.TreePath] to be selected.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void selectPath(gtk.tree_path.TreePath path)
  {
    gtk_tree_selection_select_path(cast(GtkTreeSelection*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Selects a range of nodes, determined by start_path and end_path inclusive.
      selection must be set to [gtk.types.SelectionMode.Multiple] mode.
  
      Params:
        startPath = The initial node of the range.
        endPath = The final node of the range.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void selectRange(gtk.tree_path.TreePath startPath, gtk.tree_path.TreePath endPath)
  {
    gtk_tree_selection_select_range(cast(GtkTreeSelection*)this._cPtr, startPath ? cast(GtkTreePath*)startPath._cPtr(No.Dup) : null, endPath ? cast(GtkTreePath*)endPath._cPtr(No.Dup) : null);
  }

  /**
      Calls a function for each selected node. Note that you cannot modify
      the tree or selection from within this function. As a result,
      [gtk.tree_selection.TreeSelection.getSelectedRows] might be more useful.
  
      Params:
        func = The function to call for each selected node.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void selectedForeach(gtk.types.TreeSelectionForeachFunc func)
  {
    extern(C) void _funcCallback(GtkTreeModel* model, GtkTreePath* path, GtkTreeIter* iter, void* data)
    {
      auto _dlg = cast(gtk.types.TreeSelectionForeachFunc*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), path ? new gtk.tree_path.TreePath(cast(void*)path, No.Take) : null, iter ? new gtk.tree_iter.TreeIter(cast(void*)iter, No.Take) : null);
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    gtk_tree_selection_selected_foreach(cast(GtkTreeSelection*)this._cPtr, _funcCB, _func);
  }

  /**
      Sets the selection mode of the selection.  If the previous type was
      [gtk.types.SelectionMode.Multiple], then the anchor is kept selected, if it was
      previously selected.
  
      Params:
        type = The selection mode
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void setMode(gtk.types.SelectionMode type)
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
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void setSelectFunction(gtk.types.TreeSelectionFunc func = null)
  {
    extern(C) gboolean _funcCallback(GtkTreeSelection* selection, GtkTreeModel* model, GtkTreePath* path, gboolean pathCurrentlySelected, void* data)
    {
      bool _dretval;
      auto _dlg = cast(gtk.types.TreeSelectionFunc*)data;

      _dretval = (*_dlg)(gobject.object.ObjectWrap._getDObject!(gtk.tree_selection.TreeSelection)(cast(void*)selection, No.Take), gobject.object.ObjectWrap._getDObject!(gtk.tree_model.TreeModel)(cast(void*)model, No.Take), path ? new gtk.tree_path.TreePath(cast(void*)path, No.Take) : null, cast(bool)pathCurrentlySelected);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_tree_selection_set_select_function(cast(GtkTreeSelection*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Unselects all the nodes.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void unselectAll()
  {
    gtk_tree_selection_unselect_all(cast(GtkTreeSelection*)this._cPtr);
  }

  /**
      Unselects the specified iterator.
  
      Params:
        iter = The [gtk.tree_iter.TreeIter] to be unselected.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void unselectIter(gtk.tree_iter.TreeIter iter)
  {
    gtk_tree_selection_unselect_iter(cast(GtkTreeSelection*)this._cPtr, iter ? cast(GtkTreeIter*)iter._cPtr(No.Dup) : null);
  }

  /**
      Unselects the row at path.
  
      Params:
        path = The [gtk.tree_path.TreePath] to be unselected.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void unselectPath(gtk.tree_path.TreePath path)
  {
    gtk_tree_selection_unselect_path(cast(GtkTreeSelection*)this._cPtr, path ? cast(GtkTreePath*)path._cPtr(No.Dup) : null);
  }

  /**
      Unselects a range of nodes, determined by start_path and end_path
      inclusive.
  
      Params:
        startPath = The initial node of the range.
        endPath = The initial node of the range.
  
      Deprecated: Use GtkListView or GtkColumnView
  */
  void unselectRange(gtk.tree_path.TreePath startPath, gtk.tree_path.TreePath endPath)
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
  
          $(D void callback(gtk.tree_selection.TreeSelection treeSelection))
  
          `treeSelection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tree_selection.TreeSelection)))
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
    return connectSignalClosure("changed", closure, after);
  }
}
