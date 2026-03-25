/// Module for [GestureZoom] class
module gtk.gesture_zoom;

import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture;
import gtk.types;

/**
    [gtk.gesture_zoom.GestureZoom] is a [gtk.gesture.Gesture] for 2-finger pinch/zoom gestures.
    
    Whenever the distance between both tracked sequences changes, the
    `signal@Gtk.GestureZoom::scale-changed` signal is emitted to report
    the scale factor.
*/
class GestureZoom : gtk.gesture.Gesture
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
    return cast(void function())gtk_gesture_zoom_get_type != &gidSymbolNotFound ? gtk_gesture_zoom_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureZoom self()
  {
    return this;
  }

  /**
  Get builder for [gtk.gesture_zoom.GestureZoom]
  Returns: New builder object
  */
  static GestureZoomGidBuilder builder()
  {
    return new GestureZoomGidBuilder;
  }

  /**
      Returns a newly created [gtk.gesture.Gesture] that recognizes
      pinch/zoom gestures.
      Returns: a newly created [gtk.gesture_zoom.GestureZoom]
  */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_zoom_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the scale delta.
      
      If gesture is active, this function returns the zooming
      difference since the gesture was recognized (hence the
      starting point is considered 1:1). If gesture is not
      active, 1 is returned.
      Returns: the scale delta
  */
  double getScaleDelta()
  {
    double _retval;
    _retval = gtk_gesture_zoom_get_scale_delta(cast(GtkGestureZoom*)this._cPtr);
    return _retval;
  }

  /**
      Connect to `ScaleChanged` signal.
  
      Emitted whenever the distance between both tracked sequences changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double scale, gtk.gesture_zoom.GestureZoom gestureZoom))
  
          `scale` Scale delta, taking the initial state as 1:1 (optional)
  
          `gestureZoom` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectScaleChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.gesture_zoom.GestureZoom)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("scale-changed", closure, after);
  }
}

class GestureZoomGidBuilderImpl(T) : gtk.gesture.GestureGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.gesture_zoom.GestureZoom]
final class GestureZoomGidBuilder : GestureZoomGidBuilderImpl!GestureZoomGidBuilder
{
  GestureZoom build()
  {
    return new GestureZoom(cast(void*)createGObject(GestureZoom._getGType), Yes.Take);
  }
}
