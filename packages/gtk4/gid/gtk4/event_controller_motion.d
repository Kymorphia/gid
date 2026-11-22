/// Module for [EventControllerMotion] class
module gid.gtk4.event_controller_motion;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.event_controller;
import gid.gtk4.types;

/**
    Tracks the pointer position.
    
    The event controller offers [gid.gtk4.event_controller_motion.EventControllerMotion.enter]
    and [gid.gtk4.event_controller_motion.EventControllerMotion.leave] signals, as well as
    [gid.gtk4.event_controller_motion.EventControllerMotion.isPointer] and
    [gid.gtk4.event_controller_motion.EventControllerMotion.containsPointer] properties
    which are updated to reflect changes in the pointer position as it
    moves over the widget.
*/
class EventControllerMotion : gid.gtk4.event_controller.EventController
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
    return cast(void function())gtk_event_controller_motion_get_type != &gidSymbolNotFound ? gtk_event_controller_motion_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEventControllerMotion";
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerMotion self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.event_controller_motion.EventControllerMotion]
      Returns: New builder object
  */
  static EventControllerMotionGidBuilder builder() nothrow
  {
    return new EventControllerMotionGidBuilder;
  }

  /**
      Creates a new event controller that will handle motion events.
      Returns: a new [gid.gtk4.event_controller_motion.EventControllerMotion]
  */
  this() nothrow
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_motion_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns if a pointer is within self or one of its children.
      Returns: true if a pointer is within self or one of its children
  */
  bool containsPointer() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_event_controller_motion_contains_pointer(cast(GtkEventControllerMotion*)this._cPtr);
    return _retval;
  }

  /**
      Returns if a pointer is within self, but not one of its children.
      Returns: true if a pointer is within self but not one of its children
  */
  bool isPointer() nothrow
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
  
          `void callback(double x, double y, gid.gtk4.event_controller_motion.EventControllerMotion eventControllerMotion)`
  
          `x` coordinates of pointer location (optional)
  
          `y` coordinates of pointer location (optional)
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEnter(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.event_controller_motion.EventControllerMotion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_motion.EventControllerMotion.enter");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
      Connect to `Leave` signal.
  
      Signals that the pointer has left the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.event_controller_motion.EventControllerMotion eventControllerMotion)`
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLeave(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.event_controller_motion.EventControllerMotion)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_motion.EventControllerMotion.leave");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }

  /**
      Connect to `Motion` signal.
  
      Emitted when the pointer moves inside the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double x, double y, gid.gtk4.event_controller_motion.EventControllerMotion eventControllerMotion)`
  
          `x` the x coordinate (optional)
  
          `y` the y coordinate (optional)
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMotion(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.event_controller_motion.EventControllerMotion)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_motion.EventControllerMotion.motion");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.event_controller_motion.EventControllerMotion]
class EventControllerMotionGidBuilderImpl(T) : gid.gtk4.event_controller.EventControllerGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.event_controller_motion.EventControllerMotion]
final class EventControllerMotionGidBuilder : EventControllerMotionGidBuilderImpl!EventControllerMotionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventControllerMotion build() nothrow
  {
    return new EventControllerMotion(cast(void*)createGObject(EventControllerMotion._getGType), Yes.Take);
  }
}
