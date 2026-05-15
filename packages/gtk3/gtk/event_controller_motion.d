/// Module for [EventControllerMotion] class
module gtk.event_controller_motion;

import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;
import gtk.widget;

/**
    #GtkEventControllerMotion is an event controller meant for situations
    where you need to track the position of the pointer.
    
    This object was added in 3.24.
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
      Get builder for [gtk.event_controller_motion.EventControllerMotion]
      Returns: New builder object
  */
  static EventControllerMotionGidBuilder builder()
  {
    return new EventControllerMotionGidBuilder;
  }

  /**
      Creates a new event controller that will handle motion events
      for the given widget.
  
      Params:
        widget = a #GtkWidget
      Returns: a new #GtkEventControllerMotion
  */
  this(gtk.widget.Widget widget)
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_motion_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Connect to `Enter` signal.
  
      Signals that the pointer has entered the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion)`
  
          `x` the x coordinate (optional)
  
          `y` the y coordinate (optional)
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEnter(T)(T callback, Flag!"After" after = No.After)
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
  
      Signals that pointer has left the widget.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gtk.event_controller_motion.EventControllerMotion eventControllerMotion)`
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLeave(T)(T callback, Flag!"After" after = No.After)
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
  
          `void callback(double x, double y, gtk.event_controller_motion.EventControllerMotion eventControllerMotion)`
  
          `x` the x coordinate (optional)
  
          `y` the y coordinate (optional)
  
          `eventControllerMotion` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMotion(T)(T callback, Flag!"After" after = No.After)
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

/// Fluent builder implementation template for [gtk.event_controller_motion.EventControllerMotion]
class EventControllerMotionGidBuilderImpl(T) : gtk.event_controller.EventControllerGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.event_controller_motion.EventControllerMotion]
final class EventControllerMotionGidBuilder : EventControllerMotionGidBuilderImpl!EventControllerMotionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventControllerMotion build()
  {
    return new EventControllerMotion(cast(void*)createGObject(EventControllerMotion._getGType), Yes.Take);
  }
}
