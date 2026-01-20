/// Module for [SearchEntry] class
module gtk.search_entry;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.search_entry.SearchEntry] is an entry widget that has been tailored for use
    as a search entry.
    
    The main API for interacting with a [gtk.search_entry.SearchEntry] as entry
    is the [gtk.editable.Editable] interface.
    
    ![An example GtkSearchEntry](search-entry.png)
    
    It will show an inactive symbolic “find” icon when the search
    entry is empty, and a symbolic “clear” icon when there is text.
    Clicking on the “clear” icon will empty the search entry.
    
    To make filtering appear more reactive, it is a good idea to
    not react to every change in the entry text immediately, but
    only after a short delay. To support this, [gtk.search_entry.SearchEntry]
    emits the `signal@Gtk.SearchEntry::search-changed` signal which
    can be used instead of the [gtk.editable.Editable.changed] signal.
    
    The `signal@Gtk.SearchEntry::previous-match`,
    `signal@Gtk.SearchEntry::next-match` and
    `signal@Gtk.SearchEntry::stop-search` signals can be used to
    implement moving between search results and ending the search.
    
    Often, [gtk.search_entry.SearchEntry] will be fed events by means of being
    placed inside a [gtk.search_bar.SearchBar]. If that is not the case,
    you can use [gtk.search_entry.SearchEntry.setKeyCaptureWidget] to
    let it capture key input from another widget.
    
    [gtk.search_entry.SearchEntry] provides only minimal API and should be used with
    the [gtk.editable.Editable] API.
    
    ## CSS Nodes
    
    ```
    entry.search
    ╰── text
    ```
    
    [gtk.search_entry.SearchEntry] has a single CSS node with name entry that carries
    a `.search` style class, and the text node is a child of that.
    
    ## Accessibility
    
    [gtk.search_entry.SearchEntry] uses the [gtk.types.AccessibleRole.SearchBox] role.
*/
class SearchEntry : gtk.widget.Widget, gtk.editable.Editable
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
    return cast(void function())gtk_search_entry_get_type != &gidSymbolNotFound ? gtk_search_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SearchEntry self()
  {
    return this;
  }

  /**
      Get `activatesDefault` property.
      Returns: Whether to activate the default widget when Enter is pressed.
  */
  @property bool activatesDefault()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("activates-default");
  }

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when Enter is pressed.
  */
  @property void activatesDefault(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("activates-default", propval);
  }

  /**
      Get `inputHints` property.
      Returns: The hints about input for the [gtk.search_entry.SearchEntry] used to alter the
        behaviour of input methods.
  */
  @property gtk.types.InputHints inputHints()
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = The hints about input for the [gtk.search_entry.SearchEntry] used to alter the
          behaviour of input methods.
  */
  @property void inputHints(gtk.types.InputHints propval)
  {
    return setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose for the [gtk.search_entry.SearchEntry] input used to alter the
        behaviour of input methods.
  */
  @property gtk.types.InputPurpose inputPurpose()
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose for the [gtk.search_entry.SearchEntry] input used to alter the
          behaviour of input methods.
  */
  @property void inputPurpose(gtk.types.InputPurpose propval)
  {
    return setInputPurpose(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gtk.search_entry.SearchEntry]
        when it is empty and unfocused.
  */
  @property string placeholderText()
  {
    return getPlaceholderText();
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gtk.search_entry.SearchEntry]
          when it is empty and unfocused.
  */
  @property void placeholderText(string propval)
  {
    return setPlaceholderText(propval);
  }

  /**
      Get `searchDelay` property.
      Returns: The delay in milliseconds from last keypress to the search
        changed signal.
  */
  @property uint searchDelay()
  {
    return getSearchDelay();
  }

  /**
      Set `searchDelay` property.
      Params:
        propval = The delay in milliseconds from last keypress to the search
          changed signal.
  */
  @property void searchDelay(uint propval)
  {
    return setSearchDelay(propval);
  }

  mixin EditableT!();

  /**
      Creates a [gtk.search_entry.SearchEntry].
      Returns: a new [gtk.search_entry.SearchEntry]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the input purpose for entry.
      Returns: The input hints
  */
  gtk.types.InputHints getInputHints()
  {
    GtkInputHints _cretval;
    _cretval = gtk_search_entry_get_input_hints(cast(GtkSearchEntry*)this._cPtr);
    gtk.types.InputHints _retval = cast(gtk.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the input purpose of entry.
      Returns: The input hints
  */
  gtk.types.InputPurpose getInputPurpose()
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_search_entry_get_input_purpose(cast(GtkSearchEntry*)this._cPtr);
    gtk.types.InputPurpose _retval = cast(gtk.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Gets the widget that entry is capturing key events from.
      Returns: The key capture widget.
  */
  gtk.widget.Widget getKeyCaptureWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_get_key_capture_widget(cast(GtkSearchEntry*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the placeholder text associated with entry.
      Returns: The placeholder text.
  */
  string getPlaceholderText()
  {
    const(char)* _cretval;
    _cretval = gtk_search_entry_get_placeholder_text(cast(GtkSearchEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the delay to be used between the last keypress and the
      `signalGtk.SearchEntry::search-changed` signal being emitted.
      Returns: a delay in milliseconds.
  */
  uint getSearchDelay()
  {
    uint _retval;
    _retval = gtk_search_entry_get_search_delay(cast(GtkSearchEntry*)this._cPtr);
    return _retval;
  }

  /**
      Sets the input hints for entry.
  
      Params:
        hints = the new input hints
  */
  void setInputHints(gtk.types.InputHints hints)
  {
    gtk_search_entry_set_input_hints(cast(GtkSearchEntry*)this._cPtr, hints);
  }

  /**
      Sets the input purpose of entry.
  
      Params:
        purpose = the new input purpose
  */
  void setInputPurpose(gtk.types.InputPurpose purpose)
  {
    gtk_search_entry_set_input_purpose(cast(GtkSearchEntry*)this._cPtr, purpose);
  }

  /**
      Sets widget as the widget that entry will capture key
      events from.
      
      Key events are consumed by the search entry to start or
      continue a search.
      
      If the entry is part of a [gtk.search_bar.SearchBar], it is preferable
      to call [gtk.search_bar.SearchBar.setKeyCaptureWidget] instead,
      which will reveal the entry in addition to triggering the
      search entry.
      
      Note that despite the name of this function, the events
      are only 'captured' in the bubble phase, which means that
      editable child widgets of widget will receive text input
      before it gets captured. If that is not desired, you can
      capture and forward the events yourself with
      [gtk.event_controller_key.EventControllerKey.forward].
  
      Params:
        widget = a [gtk.widget.Widget]
  */
  void setKeyCaptureWidget(gtk.widget.Widget widget = null)
  {
    gtk_search_entry_set_key_capture_widget(cast(GtkSearchEntry*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the placeholder text associated with entry.
  
      Params:
        text = the text to set as a placeholder
  */
  void setPlaceholderText(string text = null)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_search_entry_set_placeholder_text(cast(GtkSearchEntry*)this._cPtr, _text);
  }

  /**
      Set the delay to be used between the last keypress and the
      `signalGtk.SearchEntry::search-changed` signal being emitted.
  
      Params:
        delay = a delay in milliseconds
  */
  void setSearchDelay(uint delay)
  {
    gtk_search_entry_set_search_delay(cast(GtkSearchEntry*)this._cPtr, delay);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the entry is activated.
        
        The keybindings for this signal are all forms of the Enter key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.search_entry.SearchEntry searchEntry))
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.search_entry.SearchEntry)))
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
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `NextMatch` signal.
  
      Emitted when the user initiates a move to the next match
        for the current search string.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        Applications should connect to it, to implement moving
        between matches.
        
        The default bindings for this signal is Ctrl-g.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.search_entry.SearchEntry searchEntry))
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectNextMatch(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.search_entry.SearchEntry)))
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
    return connectSignalClosure("next-match", closure, after);
  }

  /**
      Connect to `PreviousMatch` signal.
  
      Emitted when the user initiates a move to the previous match
        for the current search string.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        Applications should connect to it, to implement moving
        between matches.
        
        The default bindings for this signal is Ctrl-Shift-g.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.search_entry.SearchEntry searchEntry))
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPreviousMatch(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.search_entry.SearchEntry)))
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
    return connectSignalClosure("previous-match", closure, after);
  }

  /**
      Connect to `SearchChanged` signal.
  
      Emitted with a delay. The length of the delay can be
        changed with the `propertyGtk.SearchEntry:search-delay`
        property.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.search_entry.SearchEntry searchEntry))
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSearchChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.search_entry.SearchEntry)))
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
    return connectSignalClosure("search-changed", closure, after);
  }

  /**
      Connect to `SearchStarted` signal.
  
      Emitted when the user initiated a search on the entry.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.search_entry.SearchEntry searchEntry))
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSearchStarted(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.search_entry.SearchEntry)))
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
    return connectSignalClosure("search-started", closure, after);
  }

  /**
      Connect to `StopSearch` signal.
  
      Emitted when the user stops a search via keyboard input.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        Applications should connect to it, to implement hiding
        the search entry in this case.
        
        The default bindings for this signal is Escape.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.search_entry.SearchEntry searchEntry))
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStopSearch(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.search_entry.SearchEntry)))
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
    return connectSignalClosure("stop-search", closure, after);
  }
}
