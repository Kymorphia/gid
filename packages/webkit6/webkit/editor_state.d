/// Module for [EditorState] class
module webkit.editor_state;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Web editor state.
    
    WebKitEditorState represents the state of a #WebKitWebView editor.
    Use [webkit.web_view.WebView.getEditorState] to get the WebKitEditorState
    of a #WebKitWebView.
*/
class EditorState : gobject.object.ObjectWrap
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
    return cast(void function())webkit_editor_state_get_type != &gidSymbolNotFound ? webkit_editor_state_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EditorState self()
  {
    return this;
  }

  /**
      Get `typingAttributes` property.
      Returns: Bitmask of #WebKitEditorTypingAttributes flags.
        See [webkit.editor_state.EditorState.getTypingAttributes] for more information.
  */
  @property uint typingAttributes()
  {
    return getTypingAttributes();
  }

  /**
      Gets the typing attributes at the current cursor position.
      
      If there is a selection, this returns the typing attributes
      of the selected text. Note that in case of a selection,
      typing attributes are considered active only when they are
      present throughout the selection.
      Returns: a bitmask of #WebKitEditorTypingAttributes flags
  */
  uint getTypingAttributes()
  {
    uint _retval;
    _retval = webkit_editor_state_get_typing_attributes(cast(WebKitEditorState*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether a copy command can be issued.
      Returns: true if copy is currently available
  */
  bool isCopyAvailable()
  {
    bool _retval;
    _retval = cast(bool)webkit_editor_state_is_copy_available(cast(WebKitEditorState*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether a cut command can be issued.
      Returns: true if cut is currently available
  */
  bool isCutAvailable()
  {
    bool _retval;
    _retval = cast(bool)webkit_editor_state_is_cut_available(cast(WebKitEditorState*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether a paste command can be issued.
      Returns: true if paste is currently available
  */
  bool isPasteAvailable()
  {
    bool _retval;
    _retval = cast(bool)webkit_editor_state_is_paste_available(cast(WebKitEditorState*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether a redo command can be issued.
      Returns: true if redo is currently available
  */
  bool isRedoAvailable()
  {
    bool _retval;
    _retval = cast(bool)webkit_editor_state_is_redo_available(cast(WebKitEditorState*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether an undo command can be issued.
      Returns: true if undo is currently available
  */
  bool isUndoAvailable()
  {
    bool _retval;
    _retval = cast(bool)webkit_editor_state_is_undo_available(cast(WebKitEditorState*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when the #WebKitEdtorState is changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.editor_state.EditorState editorState))
  
          `editorState` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.editor_state.EditorState)))
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
