/// Module for [InputMethodContext] class
module gid.webkit6.input_method_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.event;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.input_method_underline;
import gid.webkit6.types;

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
class InputMethodContext : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_input_method_context_get_type != &gidSymbolNotFound ? webkit_input_method_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitInputMethodContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override InputMethodContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.input_method_context.InputMethodContext]
      Returns: New builder object
  */
  static InputMethodContextGidBuilder builder() nothrow
  {
    return new InputMethodContextGidBuilder;
  }

  /**
      Get `inputHints` property.
      Returns: The #WebKitInputHints of the input associated with this context.
  */
  @property gid.webkit6.types.InputHints inputHints() nothrow
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = The #WebKitInputHints of the input associated with this context.
  */
  @property void inputHints(gid.webkit6.types.InputHints propval) nothrow
  {
    setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The #WebKitInputPurpose of the input associated with this context.
  */
  @property gid.webkit6.types.InputPurpose inputPurpose() nothrow
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The #WebKitInputPurpose of the input associated with this context.
  */
  @property void inputPurpose(gid.webkit6.types.InputPurpose propval) nothrow
  {
    setInputPurpose(propval);
  }

  /** */
  protected void vfuncCommitted(string text)
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.committed)
      return;

    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _klass.committed(cast(WebKitInputMethodContext*)this._cPtr, _text);
  }

  /** */
  protected void vfuncDeleteSurrounding(int offset, uint nChars)
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.deleteSurrounding)
      return;

    _klass.deleteSurrounding(cast(WebKitInputMethodContext*)this._cPtr, offset, nChars);
  }

  /**
      Allow key_event to be handled by the input method.
      
      If true is returned, then no further processing should be
      done for the key event.
  
      Params:
        keyEvent = the key event to filter
      Returns: true if the key event was handled, or false otherwise
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncFilterKeyEvent` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected bool vfuncFilterKeyEvent(gid.gdk4.event.Event keyEvent)
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.filterKeyEvent)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.filterKeyEvent(cast(WebKitInputMethodContext*)this._cPtr, keyEvent ? cast(GdkEvent*)keyEvent._cPtr(No.Dup) : null);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetPreedit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetPreedit(out string text, out gid.webkit6.input_method_underline.InputMethodUnderline[] underlines, out uint cursorOffset)
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.getPreedit)
      return;

    char* _text;
    GList* _underlines;
    _klass.getPreedit(cast(WebKitInputMethodContext*)this._cPtr, &_text, &_underlines, cast(uint*)&cursorOffset);
    text = _text.fromCString!(Yes.Free);
    underlines = gListToD!(gid.webkit6.input_method_underline.InputMethodUnderline, GidOwnership.Full)(_underlines);
  }

  /**
      Notify context that cursor area changed in input associated.
  
      Params:
        x = the x coordinate of cursor location
        y = the y coordinate of cursor location
        width = the width of cursor area
        height = the height of cursor area
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNotifyCursorArea` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncNotifyCursorArea(int x, int y, int width, int height)
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.notifyCursorArea)
      return;

    _klass.notifyCursorArea(cast(WebKitInputMethodContext*)this._cPtr, x, y, width, height);
  }

  /**
      Notify context that input associated has gained focus.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNotifyFocusIn` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncNotifyFocusIn()
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.notifyFocusIn)
      return;

    _klass.notifyFocusIn(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Notify context that input associated has lost focus.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNotifyFocusOut` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncNotifyFocusOut()
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.notifyFocusOut)
      return;

    _klass.notifyFocusOut(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Notify context that the context surrounding the cursor has changed.
      
      If there's no selection selection_index is the same as cursor_index.
  
      Params:
        text = text surrounding the insertion point
        length = the length of text, or -1 if text is nul-terminated
        cursorIndex = the byte index of the insertion cursor within text.
        selectionIndex = the byte index of the selection cursor within text.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncNotifySurrounding` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncNotifySurrounding(string text, uint length, uint cursorIndex, uint selectionIndex)
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.notifySurrounding)
      return;

    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _klass.notifySurrounding(cast(WebKitInputMethodContext*)this._cPtr, _text, length, cursorIndex, selectionIndex);
  }

  /** */
  protected void vfuncPreeditChanged()
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.preeditChanged)
      return;

    _klass.preeditChanged(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /** */
  protected void vfuncPreeditFinished()
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.preeditFinished)
      return;

    _klass.preeditFinished(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /** */
  protected void vfuncPreeditStarted()
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.preeditStarted)
      return;

    _klass.preeditStarted(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Reset the context.
      
      This will typically cause the input to clear the preedit state.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncReset` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncReset()
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.reset)
      return;

    _klass.reset(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Set whether context should enable preedit to display feedback.
  
      Params:
        enabled = whether to enable preedit
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetEnablePreedit` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncSetEnablePreedit(bool enabled)
  {
    auto _klass = cast(WebKitInputMethodContextClass*)_vfuncClass;
    if (!_klass.setEnablePreedit)
      return;

    _klass.setEnablePreedit(cast(WebKitInputMethodContext*)this._cPtr, enabled);
  }

  /**
      Allow key_event to be handled by the input method.
      
      If true is returned, then no further processing should be
      done for the key event.
  
      Params:
        keyEvent = the key event to filter
      Returns: true if the key event was handled, or false otherwise
  */
  bool filterKeyEvent(gid.gdk4.event.Event keyEvent) nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_input_method_context_filter_key_event(cast(WebKitInputMethodContext*)this._cPtr, keyEvent ? cast(GdkEvent*)keyEvent._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Get the value of the #WebKitInputMethodContext:input-hints property.
      Returns: the #WebKitInputHints of the input associated with context
  */
  gid.webkit6.types.InputHints getInputHints() nothrow
  {
    WebKitInputHints _cretval;
    _cretval = webkit_input_method_context_get_input_hints(cast(WebKitInputMethodContext*)this._cPtr);
    gid.webkit6.types.InputHints _retval = cast(gid.webkit6.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Get the value of the #WebKitInputMethodContext:input-purpose property.
      Returns: the #WebKitInputPurpose of the input associated with context
  */
  gid.webkit6.types.InputPurpose getInputPurpose() nothrow
  {
    WebKitInputPurpose _cretval;
    _cretval = webkit_input_method_context_get_input_purpose(cast(WebKitInputMethodContext*)this._cPtr);
    gid.webkit6.types.InputPurpose _retval = cast(gid.webkit6.types.InputPurpose)_cretval;
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
  void getPreedit(out string text, out gid.webkit6.input_method_underline.InputMethodUnderline[] underlines, out uint cursorOffset) nothrow
  {
    char* _text;
    GList* _underlines;
    webkit_input_method_context_get_preedit(cast(WebKitInputMethodContext*)this._cPtr, &_text, &_underlines, cast(uint*)&cursorOffset);
    text = _text.fromCString!(Yes.Free);
    underlines = gListToD!(gid.webkit6.input_method_underline.InputMethodUnderline, GidOwnership.Full)(_underlines);
  }

  /**
      Notify context that cursor area changed in input associated.
  
      Params:
        x = the x coordinate of cursor location
        y = the y coordinate of cursor location
        width = the width of cursor area
        height = the height of cursor area
  */
  void notifyCursorArea(int x, int y, int width, int height) nothrow
  {
    webkit_input_method_context_notify_cursor_area(cast(WebKitInputMethodContext*)this._cPtr, x, y, width, height);
  }

  /**
      Notify context that input associated has gained focus.
  */
  void notifyFocusIn() nothrow
  {
    webkit_input_method_context_notify_focus_in(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Notify context that input associated has lost focus.
  */
  void notifyFocusOut() nothrow
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
  void notifySurrounding(string text, uint cursorIndex, uint selectionIndex) nothrow
  {
    int _length;
    if (text)
      _length = cast(int)text.length;

    auto _text = cast(char*)text.ptr;
    webkit_input_method_context_notify_surrounding(cast(WebKitInputMethodContext*)this._cPtr, _text, _length, cursorIndex, selectionIndex);
  }

  /**
      Reset the context.
      
      This will typically cause the input to clear the preedit state.
  */
  void reset() nothrow
  {
    webkit_input_method_context_reset(cast(WebKitInputMethodContext*)this._cPtr);
  }

  /**
      Set whether context should enable preedit to display feedback.
  
      Params:
        enabled = whether to enable preedit
  */
  void setEnablePreedit(bool enabled) nothrow
  {
    webkit_input_method_context_set_enable_preedit(cast(WebKitInputMethodContext*)this._cPtr, enabled);
  }

  /**
      Set the value of the #WebKitInputMethodContext:input-hints property.
  
      Params:
        hints = a #WebKitInputHints
  */
  void setInputHints(gid.webkit6.types.InputHints hints) nothrow
  {
    webkit_input_method_context_set_input_hints(cast(WebKitInputMethodContext*)this._cPtr, hints);
  }

  /**
      Set the value of the #WebKitInputMethodContext:input-purpose property.
  
      Params:
        purpose = a #WebKitInputPurpose
  */
  void setInputPurpose(gid.webkit6.types.InputPurpose purpose) nothrow
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
  
          `void callback(string text, gid.webkit6.input_method_context.InputMethodContext inputMethodContext)`
  
          `text` the string result (optional)
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCommitted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.webkit6.input_method_context.InputMethodContext)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.committed");
      }
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
  
          `void callback(int offset, uint nChars, gid.webkit6.input_method_context.InputMethodContext inputMethodContext)`
  
          `offset` the character offset from the cursor position of the text to be deleted. (optional)
  
          `nChars` the number of characters to be deleted (optional)
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeleteSurrounding(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.webkit6.input_method_context.InputMethodContext)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.deleteSurrounding");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-surrounding", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      Emitted whenever the preedit sequence currently being entered has changed.
        It is also emitted at the end of a preedit sequence, in which case
        [gid.webkit6.input_method_context.InputMethodContext.getPreedit] returns the empty string.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkit6.input_method_context.InputMethodContext inputMethodContext)`
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.input_method_context.InputMethodContext)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.preeditChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-changed", closure, after);
  }

  /**
      Connect to `PreeditFinished` signal.
  
      Emitted when a preediting sequence has been completed or canceled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkit6.input_method_context.InputMethodContext inputMethodContext)`
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditFinished(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.input_method_context.InputMethodContext)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.preeditFinished");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-finished", closure, after);
  }

  /**
      Connect to `PreeditStarted` signal.
  
      Emitted when a new preediting sequence starts.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.webkit6.input_method_context.InputMethodContext inputMethodContext)`
  
          `inputMethodContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreeditStarted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.webkit6.input_method_context.InputMethodContext)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.preeditStarted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("preedit-started", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from InputMethodContext
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.webkit6.input_method_context.InputMethodContext), T.stringof ~ " is not derived from gid.webkit6.input_method_context.InputMethodContext");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCommitted", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "committed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeleteSurrounding", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "delete_surrounding");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFilterKeyEvent", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "filter_key_event");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetPreedit", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "get_preedit");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNotifyCursorArea", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "notify_cursor_area");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNotifyFocusIn", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "notify_focus_in");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNotifyFocusOut", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "notify_focus_out");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNotifySurrounding", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "notify_surrounding");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreeditChanged", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "preedit_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreeditFinished", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "preedit_finished");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreeditStarted", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "preedit_started");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncReset", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "reset");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetEnablePreedit", true)[0]) == gid.webkit6.input_method_context.InputMethodContext))
      _installVfunc(klass, "set_enable_preedit");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(WebKitInputMethodContextClass*)klass;

    switch (vfunc)
    {
      case "committed":
      {
        static extern(C) void _vfuncCommittedTramp(WebKitInputMethodContext* context, const(char)* text) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.committed)
              return (cast(typeof(&_vfuncCommittedTramp))_klass.committed)(context, text);
            return;
          }

          string _text = text.fromCString!(No.Free);

          try
          {
            _obj.vfuncCommitted(_text);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncCommitted");
          }
        }

        _klass.committed = cast(typeof(_klass.committed))&_vfuncCommittedTramp;
        break;
      }
      case "delete_surrounding":
      {
        static extern(C) void _vfuncDeleteSurroundingTramp(WebKitInputMethodContext* context, int offset, uint nChars) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.deleteSurrounding)
              return (cast(typeof(&_vfuncDeleteSurroundingTramp))_klass.deleteSurrounding)(context, offset, nChars);
            return;
          }

          try
          {
            _obj.vfuncDeleteSurrounding(offset, nChars);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncDeleteSurrounding");
          }
        }

        _klass.deleteSurrounding = cast(typeof(_klass.deleteSurrounding))&_vfuncDeleteSurroundingTramp;
        break;
      }
      case "filter_key_event":
      {
        static extern(C) gboolean _vfuncFilterKeyEventTramp(WebKitInputMethodContext* context, GdkEvent* keyEvent) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.filterKeyEvent)
              return (cast(typeof(&_vfuncFilterKeyEventTramp))_klass.filterKeyEvent)(context, keyEvent);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncFilterKeyEvent(keyEvent ? new gid.gdk4.event.Event(cast(void*)keyEvent, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncFilterKeyEvent");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.filterKeyEvent = cast(typeof(_klass.filterKeyEvent))&_vfuncFilterKeyEventTramp;
        break;
      }
      case "get_preedit":
      {
        static extern(C) void _vfuncGetPreeditTramp(WebKitInputMethodContext* context, char** text, GList** underlines, uint* cursorOffset) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.getPreedit)
              return (cast(typeof(&_vfuncGetPreeditTramp))_klass.getPreedit)(context, text, underlines, cursorOffset);
            return;
          }

          typeof(*text) _textNull;
          if (!text)
            text = &_textNull;

          typeof(*underlines) _underlinesNull;
          if (!underlines)
            underlines = &_underlinesNull;

          typeof(*cursorOffset) _cursorOffsetNull;
          if (!cursorOffset)
            cursorOffset = &_cursorOffsetNull;

          string _text;
          gid.webkit6.input_method_underline.InputMethodUnderline[] _underlines;

          try
          {
            _obj.vfuncGetPreedit(_text, _underlines, *cursorOffset);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncGetPreedit");
          }
          *text = _text.toCString!(Yes.Malloc, Yes.Nullable);
          *underlines = gListFromD!(gid.webkit6.input_method_underline.InputMethodUnderline)(_underlines);

        }

        _klass.getPreedit = cast(typeof(_klass.getPreedit))&_vfuncGetPreeditTramp;
        break;
      }
      case "notify_cursor_area":
      {
        static extern(C) void _vfuncNotifyCursorAreaTramp(WebKitInputMethodContext* context, int x, int y, int width, int height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.notifyCursorArea)
              return (cast(typeof(&_vfuncNotifyCursorAreaTramp))_klass.notifyCursorArea)(context, x, y, width, height);
            return;
          }

          try
          {
            _obj.vfuncNotifyCursorArea(x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncNotifyCursorArea");
          }
        }

        _klass.notifyCursorArea = cast(typeof(_klass.notifyCursorArea))&_vfuncNotifyCursorAreaTramp;
        break;
      }
      case "notify_focus_in":
      {
        static extern(C) void _vfuncNotifyFocusInTramp(WebKitInputMethodContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.notifyFocusIn)
              return (cast(typeof(&_vfuncNotifyFocusInTramp))_klass.notifyFocusIn)(context);
            return;
          }

          try
          {
            _obj.vfuncNotifyFocusIn();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncNotifyFocusIn");
          }
        }

        _klass.notifyFocusIn = cast(typeof(_klass.notifyFocusIn))&_vfuncNotifyFocusInTramp;
        break;
      }
      case "notify_focus_out":
      {
        static extern(C) void _vfuncNotifyFocusOutTramp(WebKitInputMethodContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.notifyFocusOut)
              return (cast(typeof(&_vfuncNotifyFocusOutTramp))_klass.notifyFocusOut)(context);
            return;
          }

          try
          {
            _obj.vfuncNotifyFocusOut();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncNotifyFocusOut");
          }
        }

        _klass.notifyFocusOut = cast(typeof(_klass.notifyFocusOut))&_vfuncNotifyFocusOutTramp;
        break;
      }
      case "notify_surrounding":
      {
        static extern(C) void _vfuncNotifySurroundingTramp(WebKitInputMethodContext* context, const(char)* text, uint length, uint cursorIndex, uint selectionIndex) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.notifySurrounding)
              return (cast(typeof(&_vfuncNotifySurroundingTramp))_klass.notifySurrounding)(context, text, length, cursorIndex, selectionIndex);
            return;
          }

          string _text = text.fromCString!(No.Free);

          try
          {
            _obj.vfuncNotifySurrounding(_text, length, cursorIndex, selectionIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncNotifySurrounding");
          }
        }

        _klass.notifySurrounding = cast(typeof(_klass.notifySurrounding))&_vfuncNotifySurroundingTramp;
        break;
      }
      case "preedit_changed":
      {
        static extern(C) void _vfuncPreeditChangedTramp(WebKitInputMethodContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.preeditChanged)
              return (cast(typeof(&_vfuncPreeditChangedTramp))_klass.preeditChanged)(context);
            return;
          }

          try
          {
            _obj.vfuncPreeditChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncPreeditChanged");
          }
        }

        _klass.preeditChanged = cast(typeof(_klass.preeditChanged))&_vfuncPreeditChangedTramp;
        break;
      }
      case "preedit_finished":
      {
        static extern(C) void _vfuncPreeditFinishedTramp(WebKitInputMethodContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.preeditFinished)
              return (cast(typeof(&_vfuncPreeditFinishedTramp))_klass.preeditFinished)(context);
            return;
          }

          try
          {
            _obj.vfuncPreeditFinished();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncPreeditFinished");
          }
        }

        _klass.preeditFinished = cast(typeof(_klass.preeditFinished))&_vfuncPreeditFinishedTramp;
        break;
      }
      case "preedit_started":
      {
        static extern(C) void _vfuncPreeditStartedTramp(WebKitInputMethodContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.preeditStarted)
              return (cast(typeof(&_vfuncPreeditStartedTramp))_klass.preeditStarted)(context);
            return;
          }

          try
          {
            _obj.vfuncPreeditStarted();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncPreeditStarted");
          }
        }

        _klass.preeditStarted = cast(typeof(_klass.preeditStarted))&_vfuncPreeditStartedTramp;
        break;
      }
      case "reset":
      {
        static extern(C) void _vfuncResetTramp(WebKitInputMethodContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.reset)
              return (cast(typeof(&_vfuncResetTramp))_klass.reset)(context);
            return;
          }

          try
          {
            _obj.vfuncReset();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncReset");
          }
        }

        _klass.reset = cast(typeof(_klass.reset))&_vfuncResetTramp;
        break;
      }
      case "set_enable_preedit":
      {
        static extern(C) void _vfuncSetEnablePreeditTramp(WebKitInputMethodContext* context, gboolean enabled) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.webkit6.input_method_context.InputMethodContext)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(WebKitInputMethodContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.setEnablePreedit)
              return (cast(typeof(&_vfuncSetEnablePreeditTramp))_klass.setEnablePreedit)(context, enabled);
            return;
          }

          try
          {
            _obj.vfuncSetEnablePreedit(cast(bool)enabled);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.webkit6.input_method_context.InputMethodContext.vfuncSetEnablePreedit");
          }
        }

        _klass.setEnablePreedit = cast(typeof(_klass.setEnablePreedit))&_vfuncSetEnablePreeditTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.webkit6.input_method_context.InputMethodContext]
class InputMethodContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `inputHints` property.
      Params:
        propval = The #WebKitInputHints of the input associated with this context.
      Returns: Builder instance for fluent chaining
  */
  T inputHints(gid.webkit6.types.InputHints propval) nothrow
  {
    return setProperty("input-hints", propval);
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The #WebKitInputPurpose of the input associated with this context.
      Returns: Builder instance for fluent chaining
  */
  T inputPurpose(gid.webkit6.types.InputPurpose propval) nothrow
  {
    return setProperty("input-purpose", propval);
  }
}

/// Fluent builder for [gid.webkit6.input_method_context.InputMethodContext]
final class InputMethodContextGidBuilder : InputMethodContextGidBuilderImpl!InputMethodContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  InputMethodContext build() nothrow
  {
    return new InputMethodContext(cast(void*)createGObject(InputMethodContext._getGType), Yes.Take);
  }
}
