/// Module for [GestureLongPress] class
module gtk.gesture_long_press;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;

/**
    [gtk.gesture_long_press.GestureLongPress] is a [gtk.gesture.Gesture] for long presses.
    
    This gesture is also known as “Press and Hold”.
    
    When the timeout is exceeded, the gesture is triggering the
    [gtk.gesture_long_press.GestureLongPress.pressed] signal.
    
    If the touchpoint is lifted before the timeout passes, or if
    it drifts too far of the initial press point, the
    [gtk.gesture_long_press.GestureLongPress.cancelled] signal will be emitted.
    
    How long the timeout is before the ::pressed signal gets emitted is
    determined by the `property@Gtk.Settings:gtk-long-press-time` setting.
    It can be modified by the `property@Gtk.GestureLongPress:delay-factor`
    property.
*/
class GestureLongPress : gtk.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_long_press_get_type != &gidSymbolNotFound ? gtk_gesture_long_press_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureLongPress self()
  {
    return this;
  }

  /**
      Get `delayFactor` property.
      Returns: Factor by which to modify the default timeout.
  */
  @property double delayFactor()
  {
    return getDelayFactor();
  }

  /**
      Set `delayFactor` property.
      Params:
        propval = Factor by which to modify the default timeout.
  */
  @property void delayFactor(double propval)
  {
    return setDelayFactor(propval);
  }

  /**
      Returns a newly created [gtk.gesture.Gesture] that recognizes long presses.
      Returns: a newly created [gtk.gesture_long_press.GestureLongPress].
  */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_long_press_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the delay factor.
      Returns: the delay factor
  */
  double getDelayFactor()
  {
    double _retval;
    _retval = gtk_gesture_long_press_get_delay_factor(cast(GtkGestureLongPress*)this._cPtr);
    return _retval;
  }

  /**
      Applies the given delay factor.
      
      The default long press time will be multiplied by this value.
      Valid values are in the range [0.5..2.0].
  
      Params:
        delayFactor = The delay factor to apply
  */
  void setDelayFactor(double delayFactor)
  {
    gtk_gesture_long_press_set_delay_factor(cast(GtkGestureLongPress*)this._cPtr, delayFactor);
  }

  /**
      Connect to `Cancelled` signal.
  
      Emitted whenever a press moved too far, or was released
        before [gtk.gesture_long_press.GestureLongPress.pressed] happened.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.gesture_long_press.GestureLongPress gestureLongPress))
  
          `gestureLongPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancelled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.gesture_long_press.GestureLongPress)))
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
    return connectSignalClosure("cancelled", closure, after);
  }

  /**
      Connect to `Pressed` signal.
  
      Emitted whenever a press goes unmoved/unreleased longer than
        what the GTK defaults tell.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.gesture_long_press.GestureLongPress gestureLongPress))
  
          `x` the X coordinate where the press happened, relative to the widget allocation (optional)
  
          `y` the Y coordinate where the press happened, relative to the widget allocation (optional)
  
          `gestureLongPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPressed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_long_press.GestureLongPress)))
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
    return connectSignalClosure("pressed", closure, after);
  }
}
