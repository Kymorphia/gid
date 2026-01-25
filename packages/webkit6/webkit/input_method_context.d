/// Module for [InputMethodContext] class
module webkit.input_method_context;

import gdk.event;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.input_method_underline;
import webkit.types;

/**
    Base class for input method contexts.
    
    WebKitInputMethodContext defines the interface to implement WebKit input methods.
    The input methods are used by WebKit, when editable content is focused, to map from
    key events to Unicode character strings.
    
    An input method may consume multiple key events in sequence and finally
    output the composed result. This is called preediting, and an input method
    may provide feedback about this process by displaying the intermediate
    composition states as preedit text.
*/
class InputMethodContext : gobject.object.ObjectWrap
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
    return cast(void function())webkit_input_method_context_get_type != &gidSymbolNotFound ? webkit_input_method_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override InputMethodContext self()
  {
    return this;
  }

  /**
      Get `inputHints` property.
      Returns: The #WebKitInputHints of the input associated with this context.
  */
  @property webkit.types.InputHints inputHints()
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = The #WebKitInputHints of the input associated with this context.
  */
  @property void inputHints(webkit.types.InputHints propval)
  {
    return setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The #WebKitInputPurpose of the input associated with this context.
  */
  @property webkit.types.InputPurpose inputPurpose()
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The #WebKitInputPurpose of the input associated with this context.
  */
  @property void inputPurpose(webkit.types.InputPurpose propval)
  {
    return setInputPurpose(propval);
  }

  /**
      Allow key_event to be handled by the input method.
      
      If true is returned, then no further processing should be
      done for the key event.
  
      Params:
        keyEvent = the key event to filter
      Returns: true if the key event was handled, or false otherwise
  */
  bool filterKeyEvent(gdk.event.Event keyEvent)
  {
    bool _retval;
    _retval = cast(bool)webkit_input_method_context_filter_key_event(cast(WebKitInputMethodContext*)this._cPtr, keyEvent ? cast(GdkEvent*)keyEvent._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the value of the #WebKitInputMethodContext:input-hints property.
      Returns: the #WebKitInputHints of the input associated with context
  */
  webkit.types.InputHints getInputHints()
  {
    WebKitInputHints _cretval;
    _cretval = webkit_input_method_context_get_input_hints(cast(WebKitInputMethodContext*)this._cPtr);
    webkit.types.InputHints _retval = cast(webkit.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Get the value of the #WebKitInputMethodContext:input-purpose property.
      Returns: the #WebKitInputPurpose of the input associated with context
  */
  webkit.types.InputPurpose getInputPurpose()
  {
    WebKitInputPurpose _cretval;
    _cretval = webkit_input_method_context_get_input_purpose(cast(WebKitInputMethodContext*)this._cPtr);
    webkit.types.InputPurpose _retval = cast(webkit.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Get the pre-edit string and a list of WebKitInputMethodUnderline.
      
      Get the current pre-edit string for the context, and a list of WebKitInputMethodUnderline to apply to the string.
      The string will be displayed inserted at cursor_offset.
  
      Params:
        text = location to store the preedit string
        underlines = location to store the underlines as a #GList of #WebKitInputMethodUnderline
        cursorOffset = location to store the position of cursor in preedit string
  */
  void getPreedit(out string text, out webkit.input_method_underline.InputMethodUnderline[] underlines, out uint cursorOffset)
  {
    char* _text;
    GList* _underlines;
    webkit_input_method_context_get_preedit(cast(WebKitInputMethodContext*)this._cPtr, &_text, &_underlines, cast(uint*)&cursorOffset);
    text = _text.fromCString(Yes.Free);
    underlines = gListToD!(webkit.input_method_underline.InputMethodUnderline, GidOwnership.Full)(_underlines);
  }

  /**
      Notify context that cursor area changed in input associated.
  
      Params:
        x = the x coordinate of cursor location
        y = the y coordinate of cursor location
        width = the width of cursor area
        height = the height of cursor area
  */
  void notifyCursorArea(int x, int y, int width, int height)
  {
    webkit_input_method_context_notify_cursor_area(cast(WebKitInputMethodContext*)this._cPtr, x, y, width, height);
  }

  /**
      Notify context that input associated has gained focus.
  */
  void notifyFocusIn()
  {
    webkit_input_method_context_notify_focus_in(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Notify context that input associated has lost focus.
  */
  void notifyFocusOut()
  {
    webkit_input_method_context_notify_focus_out(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Notify context that the context surrounding the cursor has changed.
      
      If there's no selection selection_index is the same as cursor_index.
  
      Params:
        text = text surrounding the insertion point
        cursorIndex = the byte index of the insertion cursor within text.
        selectionIndex = the byte index of the selection cursor within text.
  */
  void notifySurrounding(string text, uint cursorIndex, uint selectionIndex)
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    webkit_input_method_context_notify_surrounding(cast(WebKitInputMethodContext*)this._cPtr, _text, _length, cursorIndex, selectionIndex);
  }

  /**
      Reset the context.
      
      This will typically cause the input to clear the preedit state.
  */
  void reset()
  {
    webkit_input_method_context_reset(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Set whether context should enable preedit to display feedback.
  
      Params:
        enabled = whether to enable preedit
  */
  void setEnablePreedit(bool enabled)
  {
    webkit_input_method_context_set_enable_preedit(cast(WebKitInputMethodContext*)this._cPtr, enabled);
  }

  /**
      Set the value of the #WebKitInputMethodContext:input-hints property.
  
      Params:
        hints = a #WebKitInputHints
  */
  void setInputHints(webkit.types.InputHints hints)
  {
    webkit_input_method_context_set_input_hints(cast(WebKitInputMethodContext*)this._cPtr, hints);
  }

  /**
      Set the value of the #WebKitInputMethodContext:input-purpose property.
  
      Params:
        purpose = a #WebKitInputPurpose
  */
  void setInputPurpose(webkit.types.InputPurpose purpose)
  {
    webkit_input_method_context_set_input_purpose(cast(WebKitInputMethodContext*)this._cPtr, purpose);
  }

  /**
      Connect to `Committed` signal.
  
      Emitted when a complete input sequence has been entered by the user.
        This can be a single character immediately after a key press or the
        final result of preediting.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string text, webkit.input_method_context.InputMethodContext inputMethodContext))
  
          `text` the string result (optional)
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCommitted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : webkit.input_method_context.InputMethodContext)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("committed", closure, after);
  }

  /**
      Connect to `DeleteSurrounding` signal.
  
      Emitted when the input method wants to delete the context surrounding the cursor.
        If offset is a negative value, it means a position before the cursor.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int offset, uint nChars, webkit.input_method_context.InputMethodContext inputMethodContext))
  
          `offset` the character offset from the cursor position of the text to be deleted. (optional)
  
          `nChars` the number of characters to be deleted (optional)
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteSurrounding(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : webkit.input_method_context.InputMethodContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-surrounding", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      Emitted whenever the preedit sequence currently being entered has changed.
        It is also emitted at the end of a preedit sequence, in which case
        [webkit.input_method_context.InputMethodContext.getPreedit] returns the empty string.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.input_method_context.InputMethodContext inputMethodContext))
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.input_method_context.InputMethodContext)))
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
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `PreeditFinished` signal.
  
      Emitted when a preediting sequence has been completed or canceled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.input_method_context.InputMethodContext inputMethodContext))
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditFinished(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.input_method_context.InputMethodContext)))
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
    return connectSignalClosure("preedit-finished", closure, after);
  }

  /**
      Connect to `PreeditStarted` signal.
  
      Emitted when a new preediting sequence starts.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.input_method_context.InputMethodContext inputMethodContext))
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditStarted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.input_method_context.InputMethodContext)))
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
    return connectSignalClosure("preedit-started", closure, after);
  }
}
