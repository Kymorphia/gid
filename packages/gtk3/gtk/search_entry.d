module gtk.search_entry;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gdk.event;
import gid.gid;
import gobject.dclosure;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.entry;
import gtk.types;

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
  you can use [gtk.search_entry.SearchEntry.handleEvent] to pass events.
*/
class SearchEntry : gtk.entry.Entry
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_search_entry_get_type != &gidSymbolNotFound ? gtk_search_entry_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override SearchEntry self()
  {
    return this;
  }

  /**
      Creates a #GtkSearchEntry, with a find icon when the search field is
    empty, and a clear icon when it isn't.
    Returns:     a new #GtkSearchEntry
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_search_entry_new();
    this(_cretval, No.Take);
  }

  /**
      This function should be called when the top-level window
    which contains the search entry received a key event. If
    the entry is part of a #GtkSearchBar, it is preferable
    to call [gtk.search_bar.SearchBar.handleEvent] instead, which will
    reveal the entry in addition to passing the event to this
    function.
    
    If the key event is handled by the search entry and starts
    or continues a search, `GDK_EVENT_STOP` will be returned.
    The caller should ensure that the entry is shown in this
    case, and not propagate the event further.
    Params:
      event =       a key event
    Returns:     `GDK_EVENT_STOP` if the key press event resulted
          in a search beginning or continuing, `GDK_EVENT_PROPAGATE`
          otherwise.
  */
  bool handleEvent(gdk.event.Event event)
  {
    bool _retval;
    _retval = gtk_search_entry_handle_event(cast(GtkSearchEntry*)cPtr, event ? cast(GdkEvent*)event.cPtr : null);
    return _retval;
  }

  /**
      The ::next-match signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user initiates a move to the next match
    for the current search string.
    
    Applications should connect to it, to implement moving between
    matches.
    
    The default bindings for this signal is Ctrl-g.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias NextMatchCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias NextMatchCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to NextMatch signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectNextMatch(T)(T callback, Flag!"After" after = No.After)
  if (is(T : NextMatchCallbackDlg) || is(T : NextMatchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("next-match", closure, after);
  }

  /**
      The ::previous-match signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user initiates a move to the previous match
    for the current search string.
    
    Applications should connect to it, to implement moving between
    matches.
    
    The default bindings for this signal is Ctrl-Shift-g.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias PreviousMatchCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias PreviousMatchCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to PreviousMatch signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPreviousMatch(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PreviousMatchCallbackDlg) || is(T : PreviousMatchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("previous-match", closure, after);
  }

  /**
      The #GtkSearchEntry::search-changed signal is emitted with a short
    delay of 150 milliseconds after the last change to the entry text.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias SearchChangedCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias SearchChangedCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to SearchChanged signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSearchChanged(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SearchChangedCallbackDlg) || is(T : SearchChangedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("search-changed", closure, after);
  }

  /**
      The ::stop-search signal is a [keybinding signal][GtkBindingSignal]
    which gets emitted when the user stops a search via keyboard input.
    
    Applications should connect to it, to implement hiding the search
    entry in this case.
    
    The default bindings for this signal is Escape.
  
    ## Parameters
    $(LIST
      * $(B searchEntry) the instance the signal is connected to
    )
  */
  alias StopSearchCallbackDlg = void delegate(gtk.search_entry.SearchEntry searchEntry);

  /** ditto */
  alias StopSearchCallbackFunc = void function(gtk.search_entry.SearchEntry searchEntry);

  /**
    Connect to StopSearch signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectStopSearch(T)(T callback, Flag!"After" after = No.After)
  if (is(T : StopSearchCallbackDlg) || is(T : StopSearchCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto searchEntry = getVal!(gtk.search_entry.SearchEntry)(_paramVals);
      _dClosure.dlg(searchEntry);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stop-search", closure, after);
  }
}
