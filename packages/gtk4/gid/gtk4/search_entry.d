/// Module for [SearchEntry] class
module gid.gtk4.search_entry;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.editable;
import gid.gtk4.editable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A single-line text entry widget for use as a search entry.
    
    The main API for interacting with a [gid.gtk4.search_entry.SearchEntry] as entry
    is the [gid.gtk4.editable.Editable] interface.
    
    <picture>
      <source srcset="search-entry-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkSearchEntry" src="search-entry.png">
    </picture>
    
    It will show an inactive symbolic “find” icon when the search
    entry is empty, and a symbolic “clear” icon when there is text.
    Clicking on the “clear” icon will empty the search entry.
    
    To make filtering appear more reactive, it is a good idea to
    not react to every change in the entry text immediately, but
    only after a short delay. To support this, [gid.gtk4.search_entry.SearchEntry]
    emits the [gid.gtk4.search_entry.SearchEntry.searchChanged] signal which
    can be used instead of the [gid.gtk4.editable.Editable.changed] signal.
    
    The [gid.gtk4.search_entry.SearchEntry.previousMatch],
    [gid.gtk4.search_entry.SearchEntry.nextMatch] and
    [gid.gtk4.search_entry.SearchEntry.stopSearch] signals can be used to
    implement moving between search results and ending the search.
    
    Often, [gid.gtk4.search_entry.SearchEntry] will be fed events by means of being
    placed inside a [gid.gtk4.search_bar.SearchBar]. If that is not the case,
    you can use [gid.gtk4.search_entry.SearchEntry.setKeyCaptureWidget] to
    let it capture key input from another widget.
    
    [gid.gtk4.search_entry.SearchEntry] provides only minimal API and should be used with
    the [gid.gtk4.editable.Editable] API.
    
    ## Shortcuts and Gestures
    
    The following signals have default keybindings:
    
    - [gid.gtk4.search_entry.SearchEntry.activate]
    - [gid.gtk4.search_entry.SearchEntry.nextMatch]
    - [gid.gtk4.search_entry.SearchEntry.previousMatch]
    - [gid.gtk4.search_entry.SearchEntry.stopSearch]
    
    ## CSS Nodes
    
    ```
    entry.search
    ╰── text
    ```
    
    [gid.gtk4.search_entry.SearchEntry] has a single CSS node with name entry that carries
    a `.search` style class, and the text node is a child of that.
    
    ## Accessibility
    
    [gid.gtk4.search_entry.SearchEntry] uses the [gid.gtk4.types.AccessibleRole.SearchBox] role.
*/
class SearchEntry : gid.gtk4.widget.Widget, gid.gtk4.editable.Editable
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_search_entry_get_type != &gidSymbolNotFound ? gtk_search_entry_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSearchEntry";
  }

  /** Returns `this`, for use in `with` statements. */
  override SearchEntry self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.search_entry.SearchEntry]
      Returns: New builder object
  */
  static SearchEntryGidBuilder builder() nothrow
  {
    return new SearchEntryGidBuilder;
  }

  /**
      Get `activatesDefault` property.
      Returns: Whether to activate the default widget when Enter is pressed.
  */
  @property bool activatesDefault() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("activates-default");
  }

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when Enter is pressed.
  */
  @property void activatesDefault(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("activates-default", propval);
  }

  /**
      Get `inputHints` property.
      Returns: The hints about input for the [gid.gtk4.search_entry.SearchEntry] used to alter the
        behaviour of input methods.
  */
  @property gid.gtk4.types.InputHints inputHints() nothrow
  {
    return getInputHints();
  }

  /**
      Set `inputHints` property.
      Params:
        propval = The hints about input for the [gid.gtk4.search_entry.SearchEntry] used to alter the
          behaviour of input methods.
  */
  @property void inputHints(gid.gtk4.types.InputHints propval) nothrow
  {
    setInputHints(propval);
  }

  /**
      Get `inputPurpose` property.
      Returns: The purpose for the [gid.gtk4.search_entry.SearchEntry] input used to alter the
        behaviour of input methods.
  */
  @property gid.gtk4.types.InputPurpose inputPurpose() nothrow
  {
    return getInputPurpose();
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose for the [gid.gtk4.search_entry.SearchEntry] input used to alter the
          behaviour of input methods.
  */
  @property void inputPurpose(gid.gtk4.types.InputPurpose propval) nothrow
  {
    setInputPurpose(propval);
  }

  /**
      Get `keyCaptureWidget` property.
      Returns: The widget that the entry will use to capture key events.
        
        Key events are consumed by the search entry to start or continue a search.
  */
  @property gid.gtk4.widget.Widget keyCaptureWidget() nothrow
  {
    return getKeyCaptureWidget();
  }

  /**
      Set `keyCaptureWidget` property.
      Params:
        propval = The widget that the entry will use to capture key events.
          
          Key events are consumed by the search entry to start or continue a search.
  */
  @property void keyCaptureWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setKeyCaptureWidget(propval);
  }

  /**
      Get `placeholderText` property.
      Returns: The text that will be displayed in the [gid.gtk4.search_entry.SearchEntry]
        when it is empty and unfocused.
  */
  @property string placeholderText() nothrow
  {
    return getPlaceholderText();
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gid.gtk4.search_entry.SearchEntry]
          when it is empty and unfocused.
  */
  @property void placeholderText(string propval) nothrow
  {
    setPlaceholderText(propval);
  }

  /**
      Get `searchDelay` property.
      Returns: The delay in milliseconds from last keypress to the search
        changed signal.
  */
  @property uint searchDelay() nothrow
  {
    return getSearchDelay();
  }

  /**
      Set `searchDelay` property.
      Params:
        propval = The delay in milliseconds from last keypress to the search
          changed signal.
  */
  @property void searchDelay(uint propval) nothrow
  {
    setSearchDelay(propval);
  }

  mixin EditableT!();

  /**
      Creates a [gid.gtk4.search_entry.SearchEntry].
      Returns: a new [gid.gtk4.search_entry.SearchEntry]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_search_entry_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the input purpose for entry.
      Returns: The input hints
  */
  gid.gtk4.types.InputHints getInputHints() nothrow
  {
    GtkInputHints _cretval;
    _cretval = gtk_search_entry_get_input_hints(cast(GtkSearchEntry*)this._cPtr);
    gid.gtk4.types.InputHints _retval = cast(gid.gtk4.types.InputHints)_cretval;
    return _retval;
  }

  /**
      Gets the input purpose of entry.
      Returns: The input hints
  */
  gid.gtk4.types.InputPurpose getInputPurpose() nothrow
  {
    GtkInputPurpose _cretval;
    _cretval = gtk_search_entry_get_input_purpose(cast(GtkSearchEntry*)this._cPtr);
    gid.gtk4.types.InputPurpose _retval = cast(gid.gtk4.types.InputPurpose)_cretval;
    return _retval;
  }

  /**
      Gets the widget that entry is capturing key events from.
      Returns: The key capture widget.
  */
  gid.gtk4.widget.Widget getKeyCaptureWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_get_key_capture_widget(cast(GtkSearchEntry*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the placeholder text associated with entry.
      Returns: The placeholder text.
  */
  string getPlaceholderText() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_search_entry_get_placeholder_text(cast(GtkSearchEntry*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the delay to be used between the last keypress and the
      [gid.gtk4.search_entry.SearchEntry.searchChanged] signal being emitted.
      Returns: a delay in milliseconds.
  */
  uint getSearchDelay() nothrow
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
  void setInputHints(gid.gtk4.types.InputHints hints) nothrow
  {
    gtk_search_entry_set_input_hints(cast(GtkSearchEntry*)this._cPtr, hints);
  }

  /**
      Sets the input purpose of entry.
  
      Params:
        purpose = the new input purpose
  */
  void setInputPurpose(gid.gtk4.types.InputPurpose purpose) nothrow
  {
    gtk_search_entry_set_input_purpose(cast(GtkSearchEntry*)this._cPtr, purpose);
  }

  /**
      Sets widget as the widget that entry will capture key
      events from.
      
      Key events are consumed by the search entry to start or
      continue a search.
      
      If the entry is part of a [gid.gtk4.search_bar.SearchBar], it is preferable
      to call [gid.gtk4.search_bar.SearchBar.setKeyCaptureWidget] instead,
      which will reveal the entry in addition to triggering the
      search entry.
      
      Note that despite the name of this function, the events
      are only 'captured' in the bubble phase, which means that
      editable child widgets of widget will receive text input
      before it gets captured. If that is not desired, you can
      capture and forward the events yourself with
      [gid.gtk4.event_controller_key.EventControllerKey.forward].
  
      Params:
        widget = a [gid.gtk4.widget.Widget]
  */
  void setKeyCaptureWidget(gid.gtk4.widget.Widget widget = null) nothrow
  {
    gtk_search_entry_set_key_capture_widget(cast(GtkSearchEntry*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets the placeholder text associated with entry.
  
      Params:
        text = the text to set as a placeholder
  */
  void setPlaceholderText(string text = null) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, Yes.Nullable);
    gtk_search_entry_set_placeholder_text(cast(GtkSearchEntry*)this._cPtr, _text);
  }

  /**
      Set the delay to be used between the last keypress and the
      [gid.gtk4.search_entry.SearchEntry.searchChanged] signal being emitted.
  
      Params:
        delay = a delay in milliseconds
  */
  void setSearchDelay(uint delay) nothrow
  {
    gtk_search_entry_set_search_delay(cast(GtkSearchEntry*)this._cPtr, delay);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the entry is activated.
        
        The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.search_entry.SearchEntry.activate");
      }
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
        
        The default bindings for this signal is <kbd>Ctrl</kbd>+<kbd>g</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNextMatch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.search_entry.SearchEntry.nextMatch");
      }
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
        
        The default bindings for this signal is
        <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>g</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreviousMatch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.search_entry.SearchEntry.previousMatch");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("previous-match", closure, after);
  }

  /**
      Connect to `SearchChanged` signal.
  
      Emitted with a delay. The length of the delay can be
        changed with the [gid.gtk4.search_entry.SearchEntry.searchDelay]
        property.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSearchChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.search_entry.SearchEntry.searchChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-changed", closure, after);
  }

  /**
      Connect to `SearchStarted` signal.
  
      Emitted when the user initiated a search on the entry.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSearchStarted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.search_entry.SearchEntry.searchStarted");
      }
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
        
        The default bindings for this signal is <kbd>Escape</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStopSearch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.search_entry.SearchEntry.stopSearch");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop-search", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.search_entry.SearchEntry]
class SearchEntryGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.editable.EditableGidBuilderImpl!T
{

  mixin EditableGidBuilderT!();

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when Enter is pressed.
      Returns: Builder instance for fluent chaining
  */
  T activatesDefault(bool propval) nothrow
  {
    return setProperty("activates-default", propval);
  }

  /**
      Set `inputHints` property.
      Params:
        propval = The hints about input for the [gid.gtk4.search_entry.SearchEntry] used to alter the
          behaviour of input methods.
      Returns: Builder instance for fluent chaining
  */
  T inputHints(gid.gtk4.types.InputHints propval) nothrow
  {
    return setProperty("input-hints", propval);
  }

  /**
      Set `inputPurpose` property.
      Params:
        propval = The purpose for the [gid.gtk4.search_entry.SearchEntry] input used to alter the
          behaviour of input methods.
      Returns: Builder instance for fluent chaining
  */
  T inputPurpose(gid.gtk4.types.InputPurpose propval) nothrow
  {
    return setProperty("input-purpose", propval);
  }

  /**
      Set `keyCaptureWidget` property.
      Params:
        propval = The widget that the entry will use to capture key events.
          
          Key events are consumed by the search entry to start or continue a search.
      Returns: Builder instance for fluent chaining
  */
  T keyCaptureWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("key-capture-widget", propval);
  }

  /**
      Set `placeholderText` property.
      Params:
        propval = The text that will be displayed in the [gid.gtk4.search_entry.SearchEntry]
          when it is empty and unfocused.
      Returns: Builder instance for fluent chaining
  */
  T placeholderText(string propval) nothrow
  {
    return setProperty("placeholder-text", propval);
  }

  /**
      Set `searchDelay` property.
      Params:
        propval = The delay in milliseconds from last keypress to the search
          changed signal.
      Returns: Builder instance for fluent chaining
  */
  T searchDelay(uint propval) nothrow
  {
    return setProperty("search-delay", propval);
  }
}

/// Fluent builder for [gid.gtk4.search_entry.SearchEntry]
final class SearchEntryGidBuilder : SearchEntryGidBuilderImpl!SearchEntryGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SearchEntry build() nothrow
  {
    return new SearchEntry(cast(void*)createGObject(SearchEntry._getGType), Yes.Take);
  }
}
