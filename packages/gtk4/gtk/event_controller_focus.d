/// Module for [EventControllerFocus] class
module gtk.event_controller_focus;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.event_controller_focus.EventControllerFocus] is an event controller to keep track of
    keyboard focus.
    
    The event controller offers [gtk.event_controller_focus.EventControllerFocus.enter]
    and [gtk.event_controller_focus.EventControllerFocus.leave] signals, as well as
    `property@Gtk.EventControllerFocus:is-focus` and
    `property@Gtk.EventControllerFocus:contains-focus` properties
    which are updated to reflect focus changes inside the widget hierarchy
    that is rooted at the controllers widget.
*/
class EventControllerFocus : gtk.event_controller.EventController
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
    return cast(void function())gtk_event_controller_focus_get_type != &gidSymbolNotFound ? gtk_event_controller_focus_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerFocus self()
  {
    return this;
  }

  /**
      Creates a new event controller that will handle focus events.
      Returns: a new [gtk.event_controller_focus.EventControllerFocus]
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_focus_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns true if focus is within self or one of its children.
      Returns: true if focus is within self or one of its children
  */
  bool containsFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_focus_contains_focus(cast(GtkEventControllerFocus*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if focus is within self, but not one of its children.
      Returns: true if focus is within self, but not one of its children
  */
  bool isFocus()
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_focus_is_focus(cast(GtkEventControllerFocus*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Enter` signal.
  
      Emitted whenever the focus enters into the widget or one
        of its descendents.
        
        Note that this means you may not get an ::enter signal
        even though the widget becomes the focus location, in
        certain cases (such as when the focus moves from a descendent
        of the widget to the widget itself). If you are interested
        in these cases, you can monitor the
        `propertyGtk.EventControllerFocus:is-focus`
        property for changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.event_controller_focus.EventControllerFocus eventControllerFocus))
  
          `eventControllerFocus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.event_controller_focus.EventControllerFocus)))
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
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Emitted whenever the focus leaves the widget hierarchy
        that is rooted at the widget that the controller is attached to.
        
        Note that this means you may not get a ::leave signal
        even though the focus moves away from the widget, in
        certain cases (such as when the focus moves from the widget
        to a descendent). If you are interested in these cases, you
        can monitor the `propertyGtk.EventControllerFocus:is-focus`
        property for changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.event_controller_focus.EventControllerFocus eventControllerFocus))
  
          `eventControllerFocus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.event_controller_focus.EventControllerFocus)))
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
    return connectSignalClosure("leave", closure, after);
  }
}
