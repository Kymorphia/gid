/// Module for [EventControllerScroll] class
module gtk.event_controller_scroll;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.event_controller;
import gtk.types;
import gtk.widget;

/**
    #GtkEventControllerScroll is an event controller meant to handle
    scroll events from mice and touchpads. It is capable of handling
    both discrete and continuous scroll events, abstracting them both
    on the #GtkEventControllerScroll::scroll signal (deltas in the
    discrete case are multiples of 1).
    
    In the case of continuous scroll events, #GtkEventControllerScroll
    encloses all #GtkEventControllerScroll::scroll events between two
    #GtkEventControllerScroll::scroll-begin and #GtkEventControllerScroll::scroll-end
    signals.
    
    The behavior of the event controller can be modified by the
    flags given at creation time, or modified at a later point through
    [gtk.event_controller_scroll.EventControllerScroll.setFlags] (e.g. because the scrolling
    conditions of the widget changed).
    
    The controller can be set up to emit motion for either/both vertical
    and horizontal scroll events through #GTK_EVENT_CONTROLLER_SCROLL_VERTICAL,
    #GTK_EVENT_CONTROLLER_SCROLL_HORIZONTAL and #GTK_EVENT_CONTROLLER_SCROLL_BOTH.
    If any axis is disabled, the respective #GtkEventControllerScroll::scroll
    delta will be 0. Vertical scroll events will be translated to horizontal
    motion for the devices incapable of horizontal scrolling.
    
    The event controller can also be forced to emit discrete events on all devices
    through #GTK_EVENT_CONTROLLER_SCROLL_DISCRETE. This can be used to implement
    discrete actions triggered through scroll events (e.g. switching across
    combobox options).
    
    The #GTK_EVENT_CONTROLLER_SCROLL_KINETIC flag toggles the emission of the
    #GtkEventControllerScroll::decelerate signal, emitted at the end of scrolling
    with two X/Y velocity arguments that are consistent with the motion that
    was received.
    
    This object was added in 3.24.
*/
class EventControllerScroll : gtk.event_controller.EventController
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
    return cast(void function())gtk_event_controller_scroll_get_type != &gidSymbolNotFound ? gtk_event_controller_scroll_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override EventControllerScroll self()
  {
    return this;
  }

  /**
      Get `flags` property.
      Returns: The flags affecting event controller behavior
  */
  @property gtk.types.EventControllerScrollFlags flags()
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = The flags affecting event controller behavior
  */
  @property void flags(gtk.types.EventControllerScrollFlags propval)
  {
    return setFlags(propval);
  }

  /**
      Creates a new event controller that will handle scroll events
      for the given widget.
  
      Params:
        widget = a #GtkWidget
        flags = behavior flags
      Returns: a new #GtkEventControllerScroll
  */
  this(gtk.widget.Widget widget, gtk.types.EventControllerScrollFlags flags)
  {
    GtkEventController* _cretval;
    _cretval = gtk_event_controller_scroll_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, flags);
    this(_cretval, Yes.Take);
  }

  /**
      Gets the flags conditioning the scroll controller behavior.
      Returns: the controller flags.
  */
  gtk.types.EventControllerScrollFlags getFlags()
  {
    GtkEventControllerScrollFlags _cretval;
    _cretval = gtk_event_controller_scroll_get_flags(cast(GtkEventControllerScroll*)this._cPtr);
    gtk.types.EventControllerScrollFlags _retval = cast(gtk.types.EventControllerScrollFlags)_cretval;
    return _retval;
  }

  /**
      Sets the flags conditioning scroll controller behavior.
  
      Params:
        flags = behavior flags
  */
  void setFlags(gtk.types.EventControllerScrollFlags flags)
  {
    gtk_event_controller_scroll_set_flags(cast(GtkEventControllerScroll*)this._cPtr, flags);
  }

  /**
      Connect to `Decelerate` signal.
  
      Emitted after scroll is finished if the #GTK_EVENT_CONTROLLER_SCROLL_KINETIC
        flag is set. vel_x and vel_y express the initial velocity that was
        imprinted by the scroll events. vel_x and vel_y are expressed in
        pixels/ms.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double velX, double velY, gtk.event_controller_scroll.EventControllerScroll eventControllerScroll))
  
          `velX` X velocity (optional)
  
          `velY` Y velocity (optional)
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDecelerate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.event_controller_scroll.EventControllerScroll)))
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
    return connectSignalClosure("decelerate", closure, after);
  }

  /**
      Connect to `Scroll` signal.
  
      Signals that the widget should scroll by the
        amount specified by dx and dy.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double dx, double dy, gtk.event_controller_scroll.EventControllerScroll eventControllerScroll))
  
          `dx` X delta (optional)
  
          `dy` Y delta (optional)
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScroll(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.event_controller_scroll.EventControllerScroll)))
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
    return connectSignalClosure("scroll", closure, after);
  }

  /**
      Connect to `ScrollBegin` signal.
  
      Signals that a new scrolling operation has begun. It will
        only be emitted on devices capable of it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.event_controller_scroll.EventControllerScroll eventControllerScroll))
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScrollBegin(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.event_controller_scroll.EventControllerScroll)))
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
    return connectSignalClosure("scroll-begin", closure, after);
  }

  /**
      Connect to `ScrollEnd` signal.
  
      Signals that a new scrolling operation has finished. It will
        only be emitted on devices capable of it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.event_controller_scroll.EventControllerScroll eventControllerScroll))
  
          `eventControllerScroll` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectScrollEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.event_controller_scroll.EventControllerScroll)))
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
    return connectSignalClosure("scroll-end", closure, after);
  }
}
