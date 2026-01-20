/// Module for [Selection] interface mixin
module atk.selection_mixin;

public import atk.selection_iface_proxy;
public import atk.c.functions;
public import atk.c.types;
public import atk.object;
public import atk.types;
public import gid.gid;
public import gobject.dclosure;
public import gobject.object;

/**
    The ATK interface implemented by container objects whose #AtkObject children can be selected.
    
    #AtkSelection should be implemented by UI components with children
    which are exposed by #atk_object_ref_child and
    #atk_object_get_n_children, if the use of the parent UI component
    ordinarily involves selection of one or more of the objects
    corresponding to those #AtkObject children - for example,
    selectable lists.
    
    Note that other types of "selection" (for instance text selection)
    are accomplished a other ATK interfaces - #AtkSelection is limited
    to the selection/deselection of children.
*/
template SelectionT()
{

  /**
      Adds the specified accessible child of the object to the
      object's selection.
  
      Params:
        i = a #gint specifying the child index.
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool addSelection(int i)
  {
    bool _retval;
    _retval = cast(bool)atk_selection_add_selection(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Clears the selection in the object so that no children in the object
      are selected.
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool clearSelection()
  {
    bool _retval;
    _retval = cast(bool)atk_selection_clear_selection(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of accessible children currently selected.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
      Returns: a gint representing the number of items selected, or 0
        if selection does not implement this interface.
  */
  override int getSelectionCount()
  {
    int _retval;
    _retval = atk_selection_get_selection_count(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Determines if the current child of this object is selected
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the child index.
      Returns: a gboolean representing the specified child is selected, or 0
        if selection does not implement this interface.
  */
  override bool isChildSelected(int i)
  {
    bool _retval;
    _retval = cast(bool)atk_selection_is_child_selected(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Gets a reference to the accessible object representing the specified
      selected child of the object.
      Note: callers should not rely on null or on a zero value for
      indication of whether AtkSelectionIface is implemented, they should
      use type checking/interface checking macros or the
      atk_get_accessible_value() convenience method.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: an #AtkObject representing the
        selected accessible, or null if selection does not implement this
        interface.
  */
  override atk.object.ObjectWrap refSelection(int i)
  {
    AtkObject* _cretval;
    _cretval = atk_selection_ref_selection(cast(AtkSelection*)this._cPtr, i);
    auto _retval = gobject.object.ObjectWrap._getDObject!(atk.object.ObjectWrap)(cast(AtkObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Removes the specified child of the object from the object's selection.
  
      Params:
        i = a #gint specifying the index in the selection set.  (e.g. the
          ith selection as opposed to the ith child).
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool removeSelection(int i)
  {
    bool _retval;
    _retval = cast(bool)atk_selection_remove_selection(cast(AtkSelection*)this._cPtr, i);
    return _retval;
  }

  /**
      Causes every child of the object to be selected if the object
      supports multiple selections.
      Returns: TRUE if success, FALSE otherwise.
  */
  override bool selectAllSelection()
  {
    bool _retval;
    _retval = cast(bool)atk_selection_select_all_selection(cast(AtkSelection*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `SelectionChanged` signal.
  
      The "selection-changed" signal is emitted by an object which
        implements AtkSelection interface when the selection changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(atk.selection.Selection selection))
  
          `selection` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : atk.selection.Selection)))
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
    return connectSignalClosure("selection-changed", closure, after);
  }
}
