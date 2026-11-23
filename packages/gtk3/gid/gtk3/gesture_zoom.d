/// Module for [GestureZoom] class
module gid.gtk3.gesture_zoom;

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
    #GtkGestureZoom is a #GtkGesture implementation able to recognize
    pinch/zoom gestures, whenever the distance between both tracked
    sequences changes, the #GtkGestureZoom::scale-changed signal is
    emitted to report the scale factor.
*/
class GestureZoom : gid.gtk3.gesture.Gesture
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
    return cast(void function())gtk_gesture_zoom_get_type != &gidSymbolNotFound ? gtk_gesture_zoom_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGestureZoom";
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureZoom self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.gesture_zoom.GestureZoom]
      Returns: New builder object
  */
  static GestureZoomGidBuilder builder() nothrow
  {
    return new GestureZoomGidBuilder;
  }

  /**
      Returns a newly created #GtkGesture that recognizes zoom
      in/out gestures (usually known as pinch/zoom).
  
      Params:
        widget = a #GtkWidget
      Returns: a newly created #GtkGestureZoom
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
      _cretval = gtk_gesture_zoom_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      If gesture is active, this function returns the zooming difference
      since the gesture was recognized (hence the starting point is
      considered 1:1). If gesture is not active, 1 is returned.
      Returns: the scale delta
  */
  double getScaleDelta() nothrow
  {
    double _retval;
    _retval = gtk_gesture_zoom_get_scale_delta(cast(GtkGestureZoom*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `ScaleChanged` signal.
  
      This signal is emitted whenever the distance between both tracked
        sequences changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double scale, gid.gtk3.gesture_zoom.GestureZoom gestureZoom)`
  
          `scale` Scale delta, taking the initial state as 1:1 (optional)
  
          `gestureZoom` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScaleChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.gesture_zoom.GestureZoom)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_zoom.GestureZoom.scaleChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scale-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.gesture_zoom.GestureZoom]
class GestureZoomGidBuilderImpl(T) : gid.gtk3.gesture.GestureGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.gesture_zoom.GestureZoom]
final class GestureZoomGidBuilder : GestureZoomGidBuilderImpl!GestureZoomGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GestureZoom build() nothrow
  {
    return new GestureZoom(cast(void*)createGObject(GestureZoom._getGType), Yes.Take);
  }
}
