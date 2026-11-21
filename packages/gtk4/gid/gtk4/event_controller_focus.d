/// Module for [EventControllerFocus] class
module gid.gtk4.event_controller_focus;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.event_controller;
import gid.gtk4.types;

/**
    Tracks keyboard focus.
    
    The event controller offers [gid.gtk4.event_controller_focus.EventControllerFocus.enter]
    and [gid.gtk4.event_controller_focus.EventControllerFocus.leave] signals, as well as
    [gid.gtk4.event_controller_focus.EventControllerFocus.isFocus] and
    [gid.gtk4.event_controller_focus.EventControllerFocus.containsFocus] properties
    which are updated to reflect focus changes inside the widget hierarchy
    that is rooted at the controllers widget.
*/
class EventControllerFocus : gid.gtk4.event_controller.EventController
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
    return cast(void function())gtk_event_controller_focus_get_type != &gidSymbolNotFound ? gtk_event_controller_focus_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEventControllerFocus";
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerFocus self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.event_controller_focus.EventControllerFocus]
      Returns: New builder object
  */
  static EventControllerFocusGidBuilder builder() nothrow
  {
    return new EventControllerFocusGidBuilder;
  }

  /**
      Creates a new event controller that will handle focus events.
      Returns: a new [gid.gtk4.event_controller_focus.EventControllerFocus]
  */
  this() nothrow
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_focus_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns true if focus is within self or one of its children.
      Returns: true if focus is within self or one of its children
  */
  bool containsFocus() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_focus_contains_focus(cast(GtkEventControllerFocus*)this._cPtr);
    return _retval;
  }

  /**
      Returns true if focus is within self, but not one of its children.
      Returns: true if focus is within self, but not one of its children
  */
  bool isFocus() nothrow
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
        [gid.gtk4.event_controller_focus.EventControllerFocus.isFocus]
        property for changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.event_controller_focus.EventControllerFocus eventControllerFocus)`
  
          `eventControllerFocus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEnter(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.event_controller_focus.EventControllerFocus)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_focus.EventControllerFocus.enter");
      }
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
        can monitor the [gid.gtk4.event_controller_focus.EventControllerFocus.isFocus]
        property for changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.event_controller_focus.EventControllerFocus eventControllerFocus)`
  
          `eventControllerFocus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLeave(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.event_controller_focus.EventControllerFocus)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_focus.EventControllerFocus.leave");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.event_controller_focus.EventControllerFocus]
class EventControllerFocusGidBuilderImpl(T) : gid.gtk4.event_controller.EventControllerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.event_controller_focus.EventControllerFocus]
final class EventControllerFocusGidBuilder : EventControllerFocusGidBuilderImpl!EventControllerFocusGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventControllerFocus build() nothrow
  {
    return new EventControllerFocus(cast(void*)createGObject(EventControllerFocus._getGType), Yes.Take);
  }
}
