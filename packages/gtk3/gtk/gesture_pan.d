/// Module for [GesturePan] class
module gtk.gesture_pan;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_drag;
import gtk.types;
import gtk.widget;

/**
    #GtkGesturePan is a #GtkGesture implementation able to recognize
    pan gestures, those are drags that are locked to happen along one
    axis. The axis that a #GtkGesturePan handles is defined at
    construct time, and can be changed through
    [gtk.gesture_pan.GesturePan.setOrientation].
    
    When the gesture starts to be recognized, #GtkGesturePan will
    attempt to determine as early as possible whether the sequence
    is moving in the expected direction, and denying the sequence if
    this does not happen.
    
    Once a panning gesture along the expected axis is recognized,
    the #GtkGesturePan::pan signal will be emitted as input events
    are received, containing the offset in the given axis.
*/
class GesturePan : gtk.gesture_drag.GestureDrag
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
    return cast(void function())gtk_gesture_pan_get_type != &gidSymbolNotFound ? gtk_gesture_pan_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GesturePan self()
  {
    return this;
  }

  /**
      Get `orientation` property.
      Returns: The expected orientation of pan gestures.
  */
  @property gtk.types.Orientation orientation()
  {
    return getOrientation();
  }

  /**
      Set `orientation` property.
      Params:
        propval = The expected orientation of pan gestures.
  */
  @property void orientation(gtk.types.Orientation propval)
  {
    return setOrientation(propval);
  }

  /**
      Returns a newly created #GtkGesture that recognizes pan gestures.
  
      Params:
        widget = a #GtkWidget
        orientation = expected orientation
      Returns: a newly created #GtkGesturePan
  */
  this(gtk.widget.Widget widget, gtk.types.Orientation orientation)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_pan_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, orientation);
    this(_cretval, Yes.Take);
  }

  /**
      Returns the orientation of the pan gestures that this gesture expects.
      Returns: the expected orientation for pan gestures
  */
  gtk.types.Orientation getOrientation()
  {
    GtkOrientation _cretval;
    _cretval = gtk_gesture_pan_get_orientation(cast(GtkGesturePan*)this._cPtr);
    gtk.types.Orientation _retval = cast(gtk.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Sets the orientation to be expected on pan gestures.
  
      Params:
        orientation = expected orientation
  */
  void setOrientation(gtk.types.Orientation orientation)
  {
    gtk_gesture_pan_set_orientation(cast(GtkGesturePan*)this._cPtr, orientation);
  }

  /**
      Connect to `Pan` signal.
  
      This signal is emitted once a panning gesture along the
        expected axis is detected.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.PanDirection direction, double offset, gtk.gesture_pan.GesturePan gesturePan))
  
          `direction` current direction of the pan gesture (optional)
  
          `offset` Offset along the gesture orientation (optional)
  
          `gesturePan` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPan(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.PanDirection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_pan.GesturePan)))
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
    return connectSignalClosure("pan", closure, after);
  }
}
