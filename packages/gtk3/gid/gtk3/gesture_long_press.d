/// Module for [GestureLongPress] class
module gid.gtk3.gesture_long_press;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.gesture_single;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkGestureLongPress is a #GtkGesture implementation able to recognize
    long presses, triggering the #GtkGestureLongPress::pressed after the
    timeout is exceeded.
    
    If the touchpoint is lifted before the timeout passes, or if it drifts
    too far of the initial press point, the #GtkGestureLongPress::cancelled
    signal will be emitted.
*/
class GestureLongPress : gid.gtk3.gesture_single.GestureSingle
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
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
      Get builder for [gid.gtk3.gesture_long_press.GestureLongPress]
      Returns: New builder object
  */
  static GestureLongPressGidBuilder builder() nothrow
  {
    return new GestureLongPressGidBuilder;
  }

  /** */
  @property double delayFactor() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(double)("delay-factor");
  }

  /** */
  @property void delayFactor(double propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(double)("delay-factor", propval);
  }

  /**
      Returns a newly created #GtkGesture that recognizes long presses.
  
      Params:
        widget = a #GtkWidget
      Returns: a newly created #GtkGestureLongPress
  */
  this(gid.gtk3.widget.Widget widget) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkGesture* _cretval;
      _cretval = gtk_gesture_long_press_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Connect to `Cancelled` signal.
  
      This signal is emitted whenever a press moved too far, or was released
        before #GtkGestureLongPress::pressed happened.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.gesture_long_press.GestureLongPress gestureLongPress)`
  
          `gestureLongPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCancelled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.gesture_long_press.GestureLongPress)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_long_press.GestureLongPress.cancelled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancelled", closure, after);
  }

  /**
      Connect to `Pressed` signal.
  
      This signal is emitted whenever a press goes unmoved/unreleased longer than
        what the GTK+ defaults tell.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double x, double y, gid.gtk3.gesture_long_press.GestureLongPress gestureLongPress)`
  
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
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.gesture_long_press.GestureLongPress)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_long_press.GestureLongPress.pressed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pressed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.gesture_long_press.GestureLongPress]
class GestureLongPressGidBuilderImpl(T) : gid.gtk3.gesture_single.GestureSingleGidBuilderImpl!T
{

  /** */
  T delayFactor(double propval) nothrow
  {
    return setProperty("delay-factor", propval);
  }
}

/// Fluent builder for [gid.gtk3.gesture_long_press.GestureLongPress]
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
