/// Module for [UndoManager] interface mixin
module gtksource.undo_manager_mixin;

public import gtksource.undo_manager_iface_proxy;
public import gid.gid;
public import gobject.dclosure;
public import gtksource.c.functions;
public import gtksource.c.types;
public import gtksource.types;

/** */
template UndoManagerT()
{

  /**
      Begin a not undoable action on the buffer. All changes between this call
      and the call to [gtksource.undo_manager.UndoManager.endNotUndoableAction] cannot
      be undone. This function should be re-entrant.
  */
  override void beginNotUndoableAction()
  {
    gtk_source_undo_manager_begin_not_undoable_action(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Get whether there are redo operations available.
      Returns: true if there are redo operations available, false otherwise
  */
  override bool canRedo()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_undo_manager_can_redo(cast(GtkSourceUndoManager*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkSourceUndoManager::can-redo-changed signal.
  */
  override void canRedoChanged()
  {
    gtk_source_undo_manager_can_redo_changed(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Get whether there are undo operations available.
      Returns: true if there are undo operations available, false otherwise
  */
  override bool canUndo()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_undo_manager_can_undo(cast(GtkSourceUndoManager*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkSourceUndoManager::can-undo-changed signal.
  */
  override void canUndoChanged()
  {
    gtk_source_undo_manager_can_undo_changed(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Ends a not undoable action on the buffer.
  */
  override void endNotUndoableAction()
  {
    gtk_source_undo_manager_end_not_undoable_action(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Perform a single redo. Calling this function when there are no redo operations
      available is an error. Use [gtksource.undo_manager.UndoManager.canRedo] to find out
      if there are redo operations available.
  */
  override void redo()
  {
    gtk_source_undo_manager_redo(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Perform a single undo. Calling this function when there are no undo operations
      available is an error. Use [gtksource.undo_manager.UndoManager.canUndo] to find out
      if there are undo operations available.
  */
  override void undo()
  {
    gtk_source_undo_manager_undo(cast(GtkSourceUndoManager*)this._cPtr);
  }

  /**
      Connect to `CanRedoChanged` signal.
  
      Emitted when the ability to redo has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.undo_manager.UndoManager undoManager))
  
          `undoManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCanRedoChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.undo_manager.UndoManager)))
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
    return connectSignalClosure("can-redo-changed", closure, after);
  }

  /**
      Connect to `CanUndoChanged` signal.
  
      Emitted when the ability to undo has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.undo_manager.UndoManager undoManager))
  
          `undoManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCanUndoChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.undo_manager.UndoManager)))
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
    return connectSignalClosure("can-undo-changed", closure, after);
  }
}
