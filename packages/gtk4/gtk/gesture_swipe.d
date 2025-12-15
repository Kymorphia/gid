/// Module for [GestureSwipe] class
module gtk.gesture_swipe;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;

/**
    [gtk.gesture_swipe.GestureSwipe] is a [gtk.gesture.Gesture] for swipe gestures.
    
    After a press/move/.../move/release sequence happens, the
    [gtk.gesture_swipe.GestureSwipe.swipe] signal will be emitted,
    providing the velocity and directionality of the sequence
    at the time it was lifted.
    
    If the velocity is desired in intermediate points,
    [gtk.gesture_swipe.GestureSwipe.getVelocity] can be called in a
    [gtk.gesture.Gesture.update] handler.
    
    All velocities are reported in pixels/sec units.
*/
class GestureSwipe : gtk.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_swipe_get_type != &gidSymbolNotFound ? gtk_gesture_swipe_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureSwipe self()
  {
    return this;
  }

  /**
      Returns a newly created [gtk.gesture.Gesture] that recognizes swipes.
      Returns: a newly created [gtk.gesture_swipe.GestureSwipe]
  */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_swipe_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the current velocity.
      
      If the gesture is recognized, this function returns true and fills
      in velocity_x and velocity_y with the recorded velocity, as per the
      last events processed.
  
      Params:
        velocityX = return value for the velocity in the X axis, in pixels/sec
        velocityY = return value for the velocity in the Y axis, in pixels/sec
      Returns: whether velocity could be calculated
  */
  bool getVelocity(out double velocityX, out double velocityY)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_swipe_get_velocity(cast(GtkGestureSwipe*)this._cPtr, cast(double*)&velocityX, cast(double*)&velocityY);
    return _retval;
  }

  /**
      Connect to `Swipe` signal.
  
      Emitted when the recognized gesture is finished.
      
      Velocity and direction are a product of previously recorded events.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double velocityX, double velocityY, gtk.gesture_swipe.GestureSwipe gestureSwipe))
  
          `velocityX` velocity in the X axis, in pixels/sec (optional)
  
          `velocityY` velocity in the Y axis, in pixels/sec (optional)
  
          `gestureSwipe` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSwipe(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_swipe.GestureSwipe)))
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
    return connectSignalClosure("swipe", closure, after);
  }
}
