/// Module for [GestureLongPress] class
module gid.gtk4.gesture_long_press;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.gesture_single;
import gid.gtk4.types;

/**
    Recognizes long press gestures.
    
    This gesture is also known as “Press and Hold”.
    
    When the timeout is exceeded, the gesture is triggering the
    [gid.gtk4.gesture_long_press.GestureLongPress.pressed] signal.
    
    If the touchpoint is lifted before the timeout passes, or if
    it drifts too far of the initial press point, the
    [gid.gtk4.gesture_long_press.GestureLongPress.cancelled] signal will be emitted.
    
    How long the timeout is before the ::pressed signal gets emitted is
    determined by the [gid.gtk4.settings.Settings.gtkLongPressTime] setting.
    It can be modified by the [gid.gtk4.gesture_long_press.GestureLongPress.delayFactor]
    property.
*/
class GestureLongPress : gid.gtk4.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_long_press_get_type != &gidSymbolNotFound ? gtk_gesture_long_press_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGestureLongPress";
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureLongPress self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.gesture_long_press.GestureLongPress]
      Returns: New builder object
  */
  static GestureLongPressGidBuilder builder() nothrow
  {
    return new GestureLongPressGidBuilder;
  }

  /**
      Get `delayFactor` property.
      Returns: Factor by which to modify the default timeout.
  */
  @property double delayFactor() nothrow
  {
    return getDelayFactor();
  }

  /**
      Set `delayFactor` property.
      Params:
        propval = Factor by which to modify the default timeout.
  */
  @property void delayFactor(double propval) nothrow
  {
    setDelayFactor(propval);
  }

  /**
      Returns a newly created [gid.gtk4.gesture.Gesture] that recognizes long presses.
      Returns: a newly created [gid.gtk4.gesture_long_press.GestureLongPress].
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkGesture* _cretval;
      _cretval = gtk_gesture_long_press_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the delay factor.
      Returns: the delay factor
  */
  double getDelayFactor() nothrow
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
  void setDelayFactor(double delayFactor) nothrow
  {
    gtk_gesture_long_press_set_delay_factor(cast(GtkGestureLongPress*)this._cPtr, delayFactor);
  }

  /**
      Connect to `Cancelled` signal.
  
      Emitted whenever a press moved too far, or was released
        before [gid.gtk4.gesture_long_press.GestureLongPress.pressed] happened.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.gesture_long_press.GestureLongPress gestureLongPress)`
  
          `gestureLongPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCancelled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.gesture_long_press.GestureLongPress)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.gesture_long_press.GestureLongPress.cancelled");
      }
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
  
          `void callback(double x, double y, gid.gtk4.gesture_long_press.GestureLongPress gestureLongPress)`
  
          `x` the X coordinate where the press happened, relative to the widget allocation (optional)
  
          `y` the Y coordinate where the press happened, relative to the widget allocation (optional)
  
          `gestureLongPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPressed(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.gesture_long_press.GestureLongPress)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.gesture_long_press.GestureLongPress.pressed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pressed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.gesture_long_press.GestureLongPress]
class GestureLongPressGidBuilderImpl(T) : gid.gtk4.gesture_single.GestureSingleGidBuilderImpl!T
{

  /**
      Set `delayFactor` property.
      Params:
        propval = Factor by which to modify the default timeout.
      Returns: Builder instance for fluent chaining
  */
  T delayFactor(double propval) nothrow
  {
    return setProperty("delay-factor", propval);
  }
}

/// Fluent builder for [gid.gtk4.gesture_long_press.GestureLongPress]
final class GestureLongPressGidBuilder : GestureLongPressGidBuilderImpl!GestureLongPressGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GestureLongPress build() nothrow
  {
    return new GestureLongPress(cast(void*)createGObject(GestureLongPress._getGType), Yes.Take);
  }
}
