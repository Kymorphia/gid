/// Module for [SearchEntry] class
module gid.gtk3.search_entry;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.event;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.cell_editable;
import gid.gtk3.cell_editable_mixin;
import gid.gtk3.editable;
import gid.gtk3.editable_mixin;
import gid.gtk3.entry;
import gid.gtk3.types;

/**
    #GtkSearchEntry is a subclass of #GtkEntry that has been
    tailored for use as a search entry.
    
    It will show an inactive symbolic “find” icon when the search
    entry is empty, and a symbolic “clear” icon when there is text.
    Clicking on the “clear” icon will empty the search entry.
    
    Note that the search/clear icon is shown using a secondary
    icon, and thus does not work if you are using the secondary
    icon position for some other purpose.
    
    To make filtering appear more reactive, it is a good idea to
    not react to every change in the entry text immediately, but
    only after a short delay. To support this, #GtkSearchEntry
    emits the #GtkSearchEntry::search-changed signal which can
    be used instead of the #GtkEditable::changed signal.
    
    The #GtkSearchEntry::previous-match, #GtkSearchEntry::next-match
    and #GtkSearchEntry::stop-search signals can be used to implement
    moving between search results and ending the search.
    
    Often, GtkSearchEntry will be fed events by means of being
    placed inside a #GtkSearchBar. If that is not the case,
    you can use [gid.gtk3.search_entry.SearchEntry.handleEvent] to pass events.
*/
class SearchEntry : gid.gtk3.entry.Entry
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
      Get builder for [gid.gtk3.search_entry.SearchEntry]
      Returns: New builder object
  */
  static SearchEntryGidBuilder builder() nothrow
  {
    return new SearchEntryGidBuilder;
  }

  /**
      Creates a #GtkSearchEntry, with a find icon when the search field is
      empty, and a clear icon when it isn't.
      Returns: a new #GtkSearchEntry
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
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

  /** */
  protected void vfuncNextMatch()
  {
    auto _klass = cast(GtkSearchEntryClass*)_vfuncClass;
    if (!_klass.nextMatch)
      return;

    _klass.nextMatch(cast(GtkSearchEntry*)this._cPtr);
  }

  /** */
  protected void vfuncPreviousMatch()
  {
    auto _klass = cast(GtkSearchEntryClass*)_vfuncClass;
    if (!_klass.previousMatch)
      return;

    _klass.previousMatch(cast(GtkSearchEntry*)this._cPtr);
  }

  /** */
  protected void vfuncSearchChanged()
  {
    auto _klass = cast(GtkSearchEntryClass*)_vfuncClass;
    if (!_klass.searchChanged)
      return;

    _klass.searchChanged(cast(GtkSearchEntry*)this._cPtr);
  }

  /** */
  protected void vfuncStopSearch()
  {
    auto _klass = cast(GtkSearchEntryClass*)_vfuncClass;
    if (!_klass.stopSearch)
      return;

    _klass.stopSearch(cast(GtkSearchEntry*)this._cPtr);
  }

  /**
      This function should be called when the top-level window
      which contains the search entry received a key event. If
      the entry is part of a #GtkSearchBar, it is preferable
      to call [gid.gtk3.search_bar.SearchBar.handleEvent] instead, which will
      reveal the entry in addition to passing the event to this
      function.
      
      If the key event is handled by the search entry and starts
      or continues a search, [gid.gdk4.types.EVENT_STOP] will be returned.
      The caller should ensure that the entry is shown in this
      case, and not propagate the event further.
  
      Params:
        event = a key event
      Returns: [gid.gdk4.types.EVENT_STOP] if the key press event resulted
            in a search beginning or continuing, [gid.gdk4.types.EVENT_PROPAGATE]
            otherwise.
  */
  bool handleEvent(gid.gdk3.event.Event event) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_search_entry_handle_event(cast(GtkSearchEntry*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Connect to `NextMatch` signal.
  
      The ::next-match signal is a [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a move to the next match
        for the current search string.
        
        Applications should connect to it, to implement moving between
        matches.
        
        The default bindings for this signal is Ctrl-g.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectNextMatch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.nextMatch");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-match", closure, after);
  }

  /**
      Connect to `PreviousMatch` signal.
  
      The ::previous-match signal is a [keybinding signal][GtkBindingSignal]
        which gets emitted when the user initiates a move to the previous match
        for the current search string.
        
        Applications should connect to it, to implement moving between
        matches.
        
        The default bindings for this signal is Ctrl-Shift-g.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPreviousMatch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.previousMatch");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("previous-match", closure, after);
  }

  /**
      Connect to `SearchChanged` signal.
  
      The #GtkSearchEntry::search-changed signal is emitted with a short
        delay of 150 milliseconds after the last change to the entry text.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSearchChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.searchChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-changed", closure, after);
  }

  /**
      Connect to `StopSearch` signal.
  
      The ::stop-search signal is a [keybinding signal][GtkBindingSignal]
        which gets emitted when the user stops a search via keyboard input.
        
        Applications should connect to it, to implement hiding the search
        entry in this case.
        
        The default bindings for this signal is Escape.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.search_entry.SearchEntry searchEntry)`
  
          `searchEntry` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStopSearch(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.search_entry.SearchEntry)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.stopSearch");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop-search", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from SearchEntry
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.search_entry.SearchEntry), T.stringof ~ " is not derived from gid.gtk3.search_entry.SearchEntry");

    gid.gtk3.entry.Entry._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncNextMatch", true)[0]) == gid.gtk3.search_entry.SearchEntry))
      _installVfunc(klass, "next_match");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPreviousMatch", true)[0]) == gid.gtk3.search_entry.SearchEntry))
      _installVfunc(klass, "previous_match");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSearchChanged", true)[0]) == gid.gtk3.search_entry.SearchEntry))
      _installVfunc(klass, "search_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStopSearch", true)[0]) == gid.gtk3.search_entry.SearchEntry))
      _installVfunc(klass, "stop_search");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSearchEntryClass*)klass;

    switch (vfunc)
    {
      case "next_match":
      {
        static extern(C) void _vfuncNextMatchTramp(GtkSearchEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.search_entry.SearchEntry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkSearchEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.nextMatch)
              return (cast(typeof(&_vfuncNextMatchTramp))_klass.nextMatch)(entry);
            return;
          }

          try
          {
            _obj.vfuncNextMatch();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.vfuncNextMatch");
          }
        }

        _klass.nextMatch = cast(typeof(_klass.nextMatch))&_vfuncNextMatchTramp;
        break;
      }
      case "previous_match":
      {
        static extern(C) void _vfuncPreviousMatchTramp(GtkSearchEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.search_entry.SearchEntry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkSearchEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.previousMatch)
              return (cast(typeof(&_vfuncPreviousMatchTramp))_klass.previousMatch)(entry);
            return;
          }

          try
          {
            _obj.vfuncPreviousMatch();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.vfuncPreviousMatch");
          }
        }

        _klass.previousMatch = cast(typeof(_klass.previousMatch))&_vfuncPreviousMatchTramp;
        break;
      }
      case "search_changed":
      {
        static extern(C) void _vfuncSearchChangedTramp(GtkSearchEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.search_entry.SearchEntry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkSearchEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.searchChanged)
              return (cast(typeof(&_vfuncSearchChangedTramp))_klass.searchChanged)(entry);
            return;
          }

          try
          {
            _obj.vfuncSearchChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.vfuncSearchChanged");
          }
        }

        _klass.searchChanged = cast(typeof(_klass.searchChanged))&_vfuncSearchChangedTramp;
        break;
      }
      case "stop_search":
      {
        static extern(C) void _vfuncStopSearchTramp(GtkSearchEntry* entry) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.search_entry.SearchEntry)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)entry);
          if (!_obj)
          {
            auto _klass = cast(GtkSearchEntryClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)entry);
            if (_klass.stopSearch)
              return (cast(typeof(&_vfuncStopSearchTramp))_klass.stopSearch)(entry);
            return;
          }

          try
          {
            _obj.vfuncStopSearch();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.search_entry.SearchEntry.vfuncStopSearch");
          }
        }

        _klass.stopSearch = cast(typeof(_klass.stopSearch))&_vfuncStopSearchTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.search_entry.SearchEntry]
class SearchEntryGidBuilderImpl(T) : gid.gtk3.entry.EntryGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.search_entry.SearchEntry]
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
