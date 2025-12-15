/// Module for [EventControllerMotion] class
module gtk.event_controller_motion;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;

/**
    [gtk.event_controller_motion.EventControllerMotion] is an event controller tracking the pointer
    position.
    
    The event controller offers [gtk.event_controller_motion.EventControllerMotion.enter]
    and [gtk.event_controller_motion.EventControllerMotion.leave] signals, as well as
    `property@Gtk.EventControllerMotion:is-pointer` and
    `property@Gtk.EventControllerMotion:contains-pointer` properties
    which are updated to reflect changes in the pointer position as it
    moves over the widget.
*/
class EventControllerMotion : gtk.event_controller.EventController
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
    return cast(void function())gtk_event_controller_motion_get_type != &gidSymbolNotFound ? gtk_event_controller_motion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerMotion self()
  {
    return this;
  }

  /**
      Creates a new event controller that will handle motion events.
      Returns: a new [gtk.event_controller_motion.EventControllerMotion]
  */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_motion_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns if a pointer is within self or one of its children.
      Returns: true if a pointer is within self or one of its children
  */
  bool containsPointer()
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_motion_contains_pointer(cast(GtkEventControllerMotion*)this._cPtr);
    return _retval;
  }

  /**
      Returns if a pointer is within self, but not one of its children.
      Returns: true if a pointer is within self but not one of its children
  */
  bool isPointer()
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_motion_is_pointer(cast(GtkEventControllerMotion*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `Enter` signal.
  
      Signals that the pointer has entered the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion))
  
          `x` coordinates of pointer location (optional)
  
          `y` coordinates of pointer location (optional)
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.event_controller_motion.EventControllerMotion)))
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
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Signals that the pointer has left the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.event_controller_motion.EventControllerMotion eventControllerMotion))
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.event_controller_motion.EventControllerMotion)))
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

  /**
      Connect to `Motion` signal.
  
      Emitted when the pointer moves inside the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion))
  
          `x` the x coordinate (optional)
  
          `y` the y coordinate (optional)
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMotion(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.event_controller_motion.EventControllerMotion)))
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
    return connectSignalClosure("motion", closure, after);
  }
}
