/// Module for [GesturePan] class
module gid.gtk3.gesture_pan;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.gesture_drag;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkGesturePan is a #GtkGesture implementation able to recognize
    pan gestures, those are drags that are locked to happen along one
    axis. The axis that a #GtkGesturePan handles is defined at
    construct time, and can be changed through
    [gid.gtk4.gesture_pan.GesturePan.setOrientation].
    
    When the gesture starts to be recognized, #GtkGesturePan will
    attempt to determine as early as possible whether the sequence
    is moving in the expected direction, and denying the sequence if
    this does not happen.
    
    Once a panning gesture along the expected axis is recognized,
    the #GtkGesturePan::pan signal will be emitted as input events
    are received, containing the offset in the given axis.
*/
class GesturePan : gid.gtk3.gesture_drag.GestureDrag
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
    return cast(void function())gtk_gesture_pan_get_type != &gidSymbolNotFound ? gtk_gesture_pan_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGesturePan";
  }

  /** Returns `this`, for use in `with` statements. */
  override GesturePan self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.gesture_pan.GesturePan]
      Returns: New builder object
  */
  static GesturePanGidBuilder builder() nothrow
  {
    return new GesturePanGidBuilder;
  }

  /**
      Get `orientation` property.
      Returns: The expected orientation of pan gestures.
  */
  @property gid.gtk3.types.Orientation orientation() nothrow
  {
    return getOrientation();
  }

  /**
      Set `orientation` property.
      Params:
        propval = The expected orientation of pan gestures.
  */
  @property void orientation(gid.gtk3.types.Orientation propval) nothrow
  {
    setOrientation(propval);
  }

  /**
      Returns a newly created #GtkGesture that recognizes pan gestures.
  
      Params:
        widget = a #GtkWidget
        orientation = expected orientation
      Returns: a newly created #GtkGesturePan
  */
  this(gid.gtk3.widget.Widget widget, gid.gtk3.types.Orientation orientation) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkGesture* _cretval;
      _cretval = gtk_gesture_pan_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null, orientation);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the orientation of the pan gestures that this gesture expects.
      Returns: the expected orientation for pan gestures
  */
  gid.gtk3.types.Orientation getOrientation() nothrow
  {
    GtkOrientation _cretval;
    _cretval = gtk_gesture_pan_get_orientation(cast(GtkGesturePan*)this._cPtr);
    gid.gtk3.types.Orientation _retval = cast(gid.gtk3.types.Orientation)_cretval;
    return _retval;
  }

  /**
      Sets the orientation to be expected on pan gestures.
  
      Params:
        orientation = expected orientation
  */
  void setOrientation(gid.gtk3.types.Orientation orientation) nothrow
  {
    gtk_gesture_pan_set_orientation(cast(GtkGesturePan*)this._cPtr, orientation);
  }

  /**
      Connect to `Pan` signal.
  
      This signal is emitted once a panning gesture along the
        expected axis is detected.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.PanDirection direction, double offset, gid.gtk3.gesture_pan.GesturePan gesturePan)`
  
          `direction` current direction of the pan gesture (optional)
  
          `offset` Offset along the gesture orientation (optional)
  
          `gesturePan` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPan(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.PanDirection)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.gesture_pan.GesturePan)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_pan.GesturePan.pan");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pan", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.gesture_pan.GesturePan]
class GesturePanGidBuilderImpl(T) : gid.gtk3.gesture_drag.GestureDragGidBuilderImpl!T
{

  /**
      Set `orientation` property.
      Params:
        propval = The expected orientation of pan gestures.
      Returns: Builder instance for fluent chaining
  */
  T orientation(gid.gtk3.types.Orientation propval) nothrow
  {
    return setProperty("orientation", propval);
  }
}

/// Fluent builder for [gid.gtk3.gesture_pan.GesturePan]
final class GesturePanGidBuilder : GesturePanGidBuilderImpl!GesturePanGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GesturePan build() nothrow
  {
    return new GesturePan(cast(void*)createGObject(GesturePan._getGType), Yes.Take);
  }
}
