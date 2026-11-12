/// Module for [UndoManager] interface
module gtksource.undo_manager;

public import gid.basictypes;
public import gtksource.undo_manager_iface_proxy;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
interface UndoManager : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_source_undo_manager_get_type != &gidSymbolNotFound ? gtk_source_undo_manager_get_type() : cast(GType)0;
  }

  /**
      Begin a not undoable action on the buffer. All changes between this call
      and the call to [gtksource.undo_manager.UndoManager.endNotUndoableAction] cannot
      be undone. This function should be re-entrant.
  */
  void beginNotUndoableAction();

  /**
      Get whether there are redo operations available.
      Returns: true if there are redo operations available, false otherwise
  */
  bool canRedo();

  /**
      Emits the #GtkSourceUndoManager::can-redo-changed signal.
  */
  void canRedoChanged();

  /**
      Get whether there are undo operations available.
      Returns: true if there are undo operations available, false otherwise
  */
  bool canUndo();

  /**
      Emits the #GtkSourceUndoManager::can-undo-changed signal.
  */
  void canUndoChanged();

  /**
      Ends a not undoable action on the buffer.
  */
  void endNotUndoableAction();

  /**
      Perform a single redo. Calling this function when there are no redo operations
      available is an error. Use [gtksource.undo_manager.UndoManager.canRedo] to find out
      if there are redo operations available.
  */
  void redo();

  /**
      Perform a single undo. Calling this function when there are no undo operations
      available is an error. Use [gtksource.undo_manager.UndoManager.canUndo] to find out
      if there are undo operations available.
  */
  void undo();

  /**
      Connect to `CanRedoChanged` signal.
  
      Emitted when the ability to redo has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtksource.undo_manager.UndoManager undoManager)`
  
          `undoManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCanRedoChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.undo_manager.UndoManager)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtksource.undo_manager.UndoManager.canRedoChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("can-redo-changed", closure, after);
  }

  /**
      Connect to `CanUndoChanged` signal.
  
      Emitted when the ability to undo has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtksource.undo_manager.UndoManager undoManager)`
  
          `undoManager` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCanUndoChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.undo_manager.UndoManager)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gtksource.undo_manager.UndoManager.canUndoChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return (cast(gobject.object.ObjectWrap)this).connectSignalClosure("can-undo-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gtksource.undo_manager.UndoManager]
interface UndoManagerGidBuilderImpl(T)
{
}
