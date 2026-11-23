/// Module for [GestureRotate] class
module gid.gtk3.gesture_rotate;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.gesture;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkGestureRotate is a #GtkGesture implementation able to recognize
    2-finger rotations, whenever the angle between both handled sequences
    changes, the #GtkGestureRotate::angle-changed signal is emitted.
*/
class GestureRotate : gid.gtk3.gesture.Gesture
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
    return cast(void function())gtk_gesture_rotate_get_type != &gidSymbolNotFound ? gtk_gesture_rotate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGestureRotate";
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureRotate self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.gesture_rotate.GestureRotate]
      Returns: New builder object
  */
  static GestureRotateGidBuilder builder() nothrow
  {
    return new GestureRotateGidBuilder;
  }

  /**
      Returns a newly created #GtkGesture that recognizes 2-touch
      rotation gestures.
  
      Params:
        widget = a #GtkWidget
      Returns: a newly created #GtkGestureRotate
  */
  this(gid.gtk3.widget.Widget widget) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkGesture* _cretval;
      _cretval = gtk_gesture_rotate_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      If gesture is active, this function returns the angle difference
      in radians since the gesture was first recognized. If gesture is
      not active, 0 is returned.
      Returns: the angle delta in radians
  */
  double getAngleDelta() nothrow
  {
    double _retval;
    _retval = gtk_gesture_rotate_get_angle_delta(cast(GtkGestureRotate*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `AngleChanged` signal.
  
      This signal is emitted when the angle between both tracked points
        changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double angle, double angleDelta, gid.gtk3.gesture_rotate.GestureRotate gestureRotate)`
  
          `angle` Current angle in radians (optional)
  
          `angleDelta` Difference with the starting angle, in radians (optional)
  
          `gestureRotate` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAngleChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.gesture_rotate.GestureRotate)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_rotate.GestureRotate.angleChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("angle-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.gesture_rotate.GestureRotate]
class GestureRotateGidBuilderImpl(T) : gid.gtk3.gesture.GestureGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.gesture_rotate.GestureRotate]
final class GestureRotateGidBuilder : GestureRotateGidBuilderImpl!GestureRotateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GestureRotate build() nothrow
  {
    return new GestureRotate(cast(void*)createGObject(GestureRotate._getGType), Yes.Take);
  }
}
