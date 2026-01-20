/// Module for [IMContext] class
module gtk.imcontext;

import gdk.device;
import gdk.event;
import gdk.rectangle;
import gdk.surface;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;
import pango.attr_list;

/**
    [gtk.imcontext.IMContext] defines the interface for GTK input methods.
    
    [gtk.imcontext.IMContext] is used by GTK text input widgets like [gtk.text.Text]
    to map from key events to Unicode character strings.
    
    An input method may consume multiple key events in sequence before finally
    outputting the composed result. This is called *preediting*, and an input
    method may provide feedback about this process by displaying the intermediate
    composition states as preedit text. To do so, the [gtk.imcontext.IMContext] will emit
    `signal@Gtk.IMContext::preedit-start`, `signal@Gtk.IMContext::preedit-changed`
    and `signal@Gtk.IMContext::preedit-end` signals.
    
    For instance, the built-in GTK input method [gtk.imcontext_simple.IMContextSimple]
    implements the input of arbitrary Unicode code points by holding down the
    <kbd>Control</kbd> and <kbd>Shift</kbd> keys and then typing <kbd>u</kbd>
    followed by the hexadecimal digits of the code point. When releasing the
    <kbd>Control</kbd> and <kbd>Shift</kbd> keys, preediting ends and the
    character is inserted as text. For example,
    
        Ctrl+Shift+u 2 0 A C
    
    results in the € sign.
    
    Additional input methods can be made available for use by GTK widgets as
    loadable modules. An input method module is a small shared library which
    provides a [gio.ioextension.IOExtension] for the extension point named "gtk-im-module".
    
    To connect a widget to the users preferred input method, you should use
    [gtk.immulticontext.IMMulticontext].
*/
class IMContext : gobject.object.ObjectWrap
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
    return cast(void function())gtk_im_context_get_type != &gidSymbolNotFound ? gtk_im_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override IMContext self()
  {
    return this;
  }

  /**
      Get `inputHints` property.
      Returns: Additional hints that allow input methods to fine-tune
        their behaviour.
  */
  @property gtk.types.InputHints inputHints()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.InputHints)("input-hints");
  }

  /**
      Set `inputHints` property.
      Params:
        propval = Additional hints that allow input methods to fine-tune
          their behaviour.
  */
  @property void inputHints(gtk.types.InputHints propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.InputHints)("input-hints", propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose of the text field that the `GtkIMContext is connected to.
        
        This property can be used by on-screen keyboards and other input
        methods to adjust their behaviour.
  */
  @property gtk.types.InputPurpose inputPurpose()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.InputPurpose)("input-purpose");
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose of the text field that the `GtkIMContext is connected to.
          
          This property can be used by on-screen keyboards and other input
          methods to adjust their behaviour.
  */
  @property void inputPurpose(gtk.types.InputPurpose propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.InputPurpose)("input-purpose", propval);
  }

  /**
      Requests the platform to show an on-screen keyboard for user input.
      
      This method will return true if this request was actually performed
      to the platform, other environmental factors may result in an on-screen
      keyboard effectively not showing up.
  
      Params:
        event = a [gdk.event.Event]
      Returns: true if an on-screen keyboard could be requested to the platform.
  */
  bool activateOsk(gdk.event.Event event = null)
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_activate_osk(cast(GtkIMContext*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Asks the widget that the input context is attached to delete
      characters around the cursor position by emitting the
      `::delete_surrounding` signal.
      
      Note that offset and n_chars are in characters not in bytes
      which differs from the usage other places in [gtk.imcontext.IMContext].
      
      In order to use this function, you should first call
      [gtk.imcontext.IMContext.getSurrounding] to get the current context,
      and call this function immediately afterwards to make sure that you
      know what you are deleting. You should also account for the fact
      that even if the signal was handled, the input context might not
      have deleted all the characters that were requested to be deleted.
      
      This function is used by an input method that wants to make
      substitutions in the existing text in response to new input.
      It is not useful for applications.
  
      Params:
        offset = offset from cursor position in chars;
             a negative value means start before the cursor.
        nChars = number of characters to delete.
      Returns: true if the signal was handled.
  */
  bool deleteSurrounding(int offset, int nChars)
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_delete_surrounding(cast(GtkIMContext*)this._cPtr, offset, nChars);
    return _retval;
  }

  /**
      Allow an input method to forward key press and release events
      to another input method without necessarily having a [gdk.event.Event]
      available.
  
      Params:
        press = whether to forward a key press or release event
        surface = the surface the event is for
        device = the device that the event is for
        time = the timestamp for the event
        keycode = the keycode for the event
        state = modifier state for the event
        group = the active keyboard group for the event
      Returns: true if the input method handled the key event.
  */
  bool filterKey(bool press, gdk.surface.Surface surface, gdk.device.Device device, uint time, uint keycode, gdk.types.ModifierType state, int group)
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_filter_key(cast(GtkIMContext*)this._cPtr, press, surface ? cast(GdkSurface*)surface._cPtr(No.Dup) : null, device ? cast(GdkDevice*)device._cPtr(No.Dup) : null, time, keycode, state, group);
    return _retval;
  }

  /**
      Allow an input method to internally handle key press and release
      events.
      
      If this function returns true, then no further processing
      should be done for this key event.
  
      Params:
        event = the key event
      Returns: true if the input method handled the key event.
  */
  bool filterKeypress(gdk.event.Event event)
  {
    bool _retval;
    _retval = cast(bool)gtk_im_context_filter_keypress(cast(GtkIMContext*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Notify the input method that the widget to which this
      input context corresponds has gained focus.
      
      The input method may, for example, change the displayed
      feedback to reflect this change.
  */
  void focusIn()
  {
    gtk_im_context_focus_in(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Notify the input method that the widget to which this
      input context corresponds has lost focus.
      
      The input method may, for example, change the displayed
      feedback or reset the contexts state to reflect this change.
  */
  void focusOut()
  {
    gtk_im_context_focus_out(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Retrieve the current preedit string for the input context,
      and a list of attributes to apply to the string.
      
      This string should be displayed inserted at the insertion point.
  
      Params:
        str = location to store the retrieved
            string. The string retrieved must be freed with [glib.global.gfree].
        attrs = location to store the retrieved
            attribute list. When you are done with this list, you
            must unreference it with [pango.attr_list.AttrList.unref].
        cursorPos = location to store position of cursor
            (in characters) within the preedit string.
  */
  void getPreeditString(out string str, out pango.attr_list.AttrList attrs, out int cursorPos)
  {
    char* _str;
    PangoAttrList* _attrs;
    gtk_im_context_get_preedit_string(cast(GtkIMContext*)this._cPtr, &_str, &_attrs, cast(int*)&cursorPos);
    str = _str.fromCString(Yes.Free);
    attrs = new pango.attr_list.AttrList(cast(void*)_attrs, Yes.Take);
  }

  /**
      Retrieves context around the insertion point.
      
      Input methods typically want context in order to constrain input text
      based on existing text; this is important for languages such as Thai
      where only some sequences of characters are allowed.
      
      This function is implemented by emitting the
      `signalGtk.IMContext::retrieve-surrounding` signal on the input method;
      in response to this signal, a widget should provide as much context as
      is available, up to an entire paragraph, by calling
      [gtk.imcontext.IMContext.setSurrounding].
      
      Note that there is no obligation for a widget to respond to the
      `::retrieve-surrounding` signal, so input methods must be prepared to
      function without context.
  
      Params:
        text = location to store a UTF-8 encoded
            string of text holding context around the insertion point.
            If the function returns true, then you must free the result
            stored in this location with [glib.global.gfree].
        cursorIndex = location to store byte index of the insertion
            cursor within text.
      Returns: `TRUE` if surrounding text was provided; in this case
           you must free the result stored in `text`.
  
      Deprecated: Use [gtk.imcontext.IMContext.getSurroundingWithSelection] instead.
  */
  bool getSurrounding(out string text, out int cursorIndex)
  {
    bool _retval;
    char* _text;
    _retval = cast(bool)gtk_im_context_get_surrounding(cast(GtkIMContext*)this._cPtr, &_text, cast(int*)&cursorIndex);
    text = _text.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Retrieves context around the insertion point.
      
      Input methods typically want context in order to constrain input
      text based on existing text; this is important for languages such
      as Thai where only some sequences of characters are allowed.
      
      This function is implemented by emitting the
      `signalGtk.IMContext::retrieve-surrounding` signal on the input method;
      in response to this signal, a widget should provide as much context as
      is available, up to an entire paragraph, by calling
      [gtk.imcontext.IMContext.setSurroundingWithSelection].
      
      Note that there is no obligation for a widget to respond to the
      `::retrieve-surrounding` signal, so input methods must be prepared to
      function without context.
  
      Params:
        text = location to store a UTF-8 encoded
            string of text holding context around the insertion point.
            If the function returns true, then you must free the result
            stored in this location with [glib.global.gfree].
        cursorIndex = location to store byte index of the insertion
            cursor within text.
        anchorIndex = location to store byte index of the selection
            bound within text
      Returns: `TRUE` if surrounding text was provided; in this case
          you must free the result stored in `text`.
  */
  bool getSurroundingWithSelection(out string text, out int cursorIndex, out int anchorIndex)
  {
    bool _retval;
    char* _text;
    _retval = cast(bool)gtk_im_context_get_surrounding_with_selection(cast(GtkIMContext*)this._cPtr, &_text, cast(int*)&cursorIndex, cast(int*)&anchorIndex);
    text = _text.fromCString(Yes.Free);
    return _retval;
  }

  /**
      Notify the input method that a change such as a change in cursor
      position has been made.
      
      This will typically cause the input method to clear the preedit state.
  */
  void reset()
  {
    gtk_im_context_reset(cast(GtkIMContext*)this._cPtr);
  }

  /**
      Set the client widget for the input context.
      
      This is the [gtk.widget.Widget] holding the input focus. This widget is
      used in order to correctly position status windows, and may
      also be used for purposes internal to the input method.
  
      Params:
        widget = the client widget. This may be null to indicate
            that the previous client widget no longer exists.
  */
  void setClientWidget(gtk.widget.Widget widget = null)
  {
    gtk_im_context_set_client_widget(cast(GtkIMContext*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Notify the input method that a change in cursor
      position has been made.
      
      The location is relative to the client widget.
  
      Params:
        area = new location
  */
  void setCursorLocation(gdk.rectangle.Rectangle area)
  {
    gtk_im_context_set_cursor_location(cast(GtkIMContext*)this._cPtr, cast(const(GdkRectangle)*)&area);
  }

  /**
      Sets surrounding context around the insertion point and preedit
      string.
      
      This function is expected to be called in response to the
      `signalGtk.IMContext::retrieve-surrounding` signal, and will
      likely have no effect if called at other times.
  
      Params:
        text = text surrounding the insertion point, as UTF-8.
            the preedit string should not be included within text
        cursorIndex = the byte index of the insertion cursor within text.
  
      Deprecated: Use [gtk.imcontext.IMContext.setSurroundingWithSelection] instead
  */
  void setSurrounding(string text, int cursorIndex)
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    gtk_im_context_set_surrounding(cast(GtkIMContext*)this._cPtr, _text, _len, cursorIndex);
  }

  /**
      Sets surrounding context around the insertion point and preedit
      string. This function is expected to be called in response to the
      `signalGtk.IMContext::retrieve_surrounding` signal, and will likely
      have no effect if called at other times.
  
      Params:
        text = text surrounding the insertion point, as UTF-8.
            the preedit string should not be included within text
        cursorIndex = the byte index of the insertion cursor within text
        anchorIndex = the byte index of the selection bound within text
  */
  void setSurroundingWithSelection(string text, int cursorIndex, int anchorIndex)
  {
    int _len;
    if (text)
      _len = cast(int)text.length;

    auto _text = cast(const(char)*)text.ptr;
    gtk_im_context_set_surrounding_with_selection(cast(GtkIMContext*)this._cPtr, _text, _len, cursorIndex, anchorIndex);
  }

  /**
      Sets whether the IM context should use the preedit string
      to display feedback.
      
      If use_preedit is false (default is true), then the IM context
      may use some other method to display feedback, such as displaying
      it in a child of the root window.
  
      Params:
        usePreedit = whether the IM context should use the preedit string.
  */
  void setUsePreedit(bool usePreedit)
  {
    gtk_im_context_set_use_preedit(cast(GtkIMContext*)this._cPtr, usePreedit);
  }

  /**
      Connect to `Commit` signal.
  
      The ::commit signal is emitted when a complete input sequence
        has been entered by the user.
        
        If the commit comes after a preediting sequence, the
        ::commit signal is emitted after ::preedit-end.
        
        This can be a single character immediately after a key press or
        the final result of preediting.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(string str, gtk.imcontext.IMContext iMContext))
  
          `str` the completed character(s) entered by the user (optional)
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCommit(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.imcontext.IMContext)))
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
    return connectSignalClosure("commit", closure, after);
  }

  /**
      Connect to `DeleteSurrounding` signal.
  
      The ::delete-surrounding signal is emitted when the input method
        needs to delete all or part of the context surrounding the cursor.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(int offset, int nChars, gtk.imcontext.IMContext iMContext))
  
          `offset` the character offset from the cursor position of the text
              to be deleted. A negative value indicates a position before
              the cursor. (optional)
  
          `nChars` the number of characters to be deleted (optional)
  
          `iMContext` the instance the signal is connected to (optional)
  
          `Returns` true if the signal was handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeleteSurrounding(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.imcontext.IMContext)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("delete-surrounding", closure, after);
  }

  /**
      Connect to `PreeditChanged` signal.
  
      The ::preedit-changed signal is emitted whenever the preedit sequence
        currently being entered has changed.
        
        It is also emitted at the end of a preedit sequence, in which case
        [gtk.imcontext.IMContext.getPreeditString] returns the empty string.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.imcontext.IMContext iMContext))
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.imcontext.IMContext)))
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
      Connect to `PreeditEnd` signal.
  
      The ::preedit-end signal is emitted when a preediting sequence
        has been completed or canceled.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.imcontext.IMContext iMContext))
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.imcontext.IMContext)))
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
    return connectSignalClosure("preedit-end", closure, after);
  }

  /**
      Connect to `PreeditStart` signal.
  
      The ::preedit-start signal is emitted when a new preediting sequence
        starts.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.imcontext.IMContext iMContext))
  
          `iMContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreeditStart(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.imcontext.IMContext)))
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
    return connectSignalClosure("preedit-start", closure, after);
  }

  /**
      Connect to `RetrieveSurrounding` signal.
  
      The ::retrieve-surrounding signal is emitted when the input method
        requires the context surrounding the cursor.
        
        The callback should set the input method surrounding context by
        calling the [gtk.imcontext.IMContext.setSurrounding] method.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.imcontext.IMContext iMContext))
  
          `iMContext` the instance the signal is connected to (optional)
  
          `Returns` true if the signal was handled.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectRetrieveSurrounding(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.imcontext.IMContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("retrieve-surrounding", closure, after);
  }
}
