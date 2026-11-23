/// Module for [EventControllerScroll] class
module gid.gtk4.event_controller_scroll;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.event_controller;
import gid.gtk4.types;

/**
    Handles scroll events.
    
    It is capable of handling both discrete and continuous scroll
    events from mice or touchpads, abstracting them both with the
    [gid.gtk4.event_controller_scroll.EventControllerScroll.scroll] signal. Deltas in
    the discrete case are multiples of 1.
    
    In the case of continuous scroll events, [gid.gtk4.event_controller_scroll.EventControllerScroll]
    encloses all [gid.gtk4.event_controller_scroll.EventControllerScroll.scroll] emissions
    between two [gid.gtk4.event_controller_scroll.EventControllerScroll.scrollBegin] and
    [gid.gtk4.event_controller_scroll.EventControllerScroll.scrollEnd] signals.
    
    The behavior of the event controller can be modified by the flags
    given at creation time, or modified at a later point through
    [gid.gtk4.event_controller_scroll.EventControllerScroll.setFlags] (e.g. because the scrolling
    conditions of the widget changed).
    
    The controller can be set up to emit motion for either/both vertical
    and horizontal scroll events through [gid.gtk4.types.EventControllerScrollFlags.Vertical],
    [gid.gtk4.types.EventControllerScrollFlags.Horizontal] and [gid.gtk4.types.EventControllerScrollFlags.BothAxes].
    If any axis is disabled, the respective [gid.gtk4.event_controller_scroll.EventControllerScroll.scroll]
    delta will be 0. Vertical scroll events will be translated to horizontal
    motion for the devices incapable of horizontal scrolling.
    
    The event controller can also be forced to emit discrete events on all
    devices through [gid.gtk4.types.EventControllerScrollFlags.Discrete]. This can be used
    to implement discrete actions triggered through scroll events (e.g.
    switching across combobox options).
    
    The [gid.gtk4.types.EventControllerScrollFlags.Kinetic] flag toggles the emission of the
    [gid.gtk4.event_controller_scroll.EventControllerScroll.decelerate] signal, emitted at the end
    of scrolling with two X/Y velocity arguments that are consistent with the
    motion that was received.
*/
class EventControllerScroll : gid.gtk4.event_controller.EventController
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_event_controller_scroll_get_type != &gidSymbolNotFound ? gtk_event_controller_scroll_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkEventControllerScroll";
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerScroll self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.event_controller_scroll.EventControllerScroll]
      Returns: New builder object
  */
  static EventControllerScrollGidBuilder builder() nothrow
  {
    return new EventControllerScrollGidBuilder;
  }

  /**
      Get `flags` property.
      Returns: The flags affecting event controller behavior.
  */
  @property gid.gtk4.types.EventControllerScrollFlags flags() nothrow
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = The flags affecting event controller behavior.
  */
  @property void flags(gid.gtk4.types.EventControllerScrollFlags propval) nothrow
  {
    setFlags(propval);
  }

  /**
      Creates a new event controller that will handle scroll events.
  
      Params:
        flags = flags affecting the controller behavior
      Returns: a new [gid.gtk4.event_controller_scroll.EventControllerScroll]
  */
  this(gid.gtk4.types.EventControllerScrollFlags flags) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkEventController* _cretval;
      _cretval = gtk_event_controller_scroll_new(flags);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Gets the flags conditioning the scroll controller behavior.
      Returns: the controller flags.
  */
  gid.gtk4.types.EventControllerScrollFlags getFlags() nothrow
  {
    GtkEventControllerScrollFlags _cretval;
    _cretval = gtk_event_controller_scroll_get_flags(cast(GtkEventControllerScroll*)this._cPtr);
    gid.gtk4.types.EventControllerScrollFlags _retval = cast(gid.gtk4.types.EventControllerScrollFlags)_cretval;
    return _retval;
  }

  /**
      Gets the scroll unit of the last
      [gid.gtk4.event_controller_scroll.EventControllerScroll.scroll] signal received.
      
      Always returns [gid.gdk4.types.ScrollUnit.Wheel] if the
      [gid.gtk4.types.EventControllerScrollFlags.Discrete] flag is set.
      Returns: the scroll unit.
  */
  gid.gdk4.types.ScrollUnit getUnit() nothrow
  {
    GdkScrollUnit _cretval;
    _cretval = gtk_event_controller_scroll_get_unit(cast(GtkEventControllerScroll*)this._cPtr);
    gid.gdk4.types.ScrollUnit _retval = cast(gid.gdk4.types.ScrollUnit)_cretval;
    return _retval;
  }

  /**
      Sets the flags conditioning scroll controller behavior.
  
      Params:
        flags = flags affecting the controller behavior
  */
  void setFlags(gid.gtk4.types.EventControllerScrollFlags flags) nothrow
  {
    gtk_event_controller_scroll_set_flags(cast(GtkEventControllerScroll*)this._cPtr, flags);
  }

  /**
      Connect to `Decelerate` signal.
  
      Emitted after scroll is finished if the
        [gid.gtk4.types.EventControllerScrollFlags.Kinetic] flag is set.
        
        vel_x and vel_y express the initial velocity that was
        imprinted by the scroll events. vel_x and vel_y are expressed in
        pixels/ms.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double velX, double velY, gid.gtk4.event_controller_scroll.EventControllerScroll eventControllerScroll)`
  
          `velX` X velocity (optional)
  
          `velY` Y velocity (optional)
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDecelerate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.event_controller_scroll.EventControllerScroll)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_scroll.EventControllerScroll.decelerate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("decelerate", closure, after);
  }

  /**
      Connect to `Scroll` signal.
  
      Signals that the widget should scroll by the
        amount specified by dx and dy.
        
        For the representation unit of the deltas, see
        [gid.gtk4.event_controller_scroll.EventControllerScroll.getUnit].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(double dx, double dy, gid.gtk4.event_controller_scroll.EventControllerScroll eventControllerScroll)`
  
          `dx` X delta (optional)
  
          `dy` Y delta (optional)
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
          `Returns` true if the scroll event was handled,
              false otherwise.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScroll(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.event_controller_scroll.EventControllerScroll)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_scroll.EventControllerScroll.scroll");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll", closure, after);
  }

  /**
      Connect to `ScrollBegin` signal.
  
      Signals that a new scrolling operation has begun.
        
        It will only be emitted on devices capable of it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.event_controller_scroll.EventControllerScroll eventControllerScroll)`
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScrollBegin(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.event_controller_scroll.EventControllerScroll)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_scroll.EventControllerScroll.scrollBegin");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-begin", closure, after);
  }

  /**
      Connect to `ScrollEnd` signal.
  
      Signals that a scrolling operation has finished.
        
        It will only be emitted on devices capable of it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.event_controller_scroll.EventControllerScroll eventControllerScroll)`
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScrollEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.event_controller_scroll.EventControllerScroll)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.event_controller_scroll.EventControllerScroll.scrollEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scroll-end", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.event_controller_scroll.EventControllerScroll]
class EventControllerScrollGidBuilderImpl(T) : gid.gtk4.event_controller.EventControllerGidBuilderImpl!T
{

  /**
      Set `flags` property.
      Params:
        propval = The flags affecting event controller behavior.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.gtk4.types.EventControllerScrollFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }
}

/// Fluent builder for [gid.gtk4.event_controller_scroll.EventControllerScroll]
final class EventControllerScrollGidBuilder : EventControllerScrollGidBuilderImpl!EventControllerScrollGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  EventControllerScroll build() nothrow
  {
    return new EventControllerScroll(cast(void*)createGObject(EventControllerScroll._getGType), Yes.Take);
  }
}
