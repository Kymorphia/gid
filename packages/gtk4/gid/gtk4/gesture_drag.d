/// Module for [GestureDrag] class
module gid.gtk4.gesture_drag;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.gesture_single;
import gid.gtk4.types;

/**
    Recognizes drag gestures.
    
    The drag operation itself can be tracked throughout the
    [gid.gtk4.gesture_drag.GestureDrag.dragBegin],
    [gid.gtk4.gesture_drag.GestureDrag.dragUpdate] and
    [gid.gtk4.gesture_drag.GestureDrag.dragEnd] signals, and the relevant
    coordinates can be extracted through
    [gid.gtk4.gesture_drag.GestureDrag.getOffset] and
    [gid.gtk4.gesture_drag.GestureDrag.getStartPoint].
*/
class GestureDrag : gid.gtk4.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_drag_get_type != &gidSymbolNotFound ? gtk_gesture_drag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGestureDrag";
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureDrag self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.gesture_drag.GestureDrag]
      Returns: New builder object
  */
  static GestureDragGidBuilder builder() nothrow
  {
    return new GestureDragGidBuilder;
  }

  /**
      Returns a newly created [gid.gtk4.gesture.Gesture] that recognizes drags.
      Returns: a newly created [gid.gtk4.gesture_drag.GestureDrag]
  */
  this() nothrow
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_drag_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the offset from the start point.
      
      If the gesture is active, this function returns true and
      fills in `x` and `y` with the coordinates of the current point,
      as an offset to the starting drag point.
  
      Params:
        x = X offset for the current point
        y = Y offset for the current point
      Returns: true if the gesture is active
  */
  bool getOffset(out double x, out double y) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_drag_get_offset(cast(GtkGestureDrag*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Gets the point where the drag started.
      
      If the gesture is active, this function returns true
      and fills in `x` and `y` with the drag start coordinates,
      in widget-relative coordinates.
  
      Params:
        x = X coordinate for the drag start point
        y = Y coordinate for the drag start point
      Returns: true if the gesture is active
  */
  bool getStartPoint(out double x, out double y) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_drag_get_start_point(cast(GtkGestureDrag*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Connect to `DragBegin` signal.
  
      Emitted whenever dragging starts.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double startX, double startY, gid.gtk4.gesture_drag.GestureDrag gestureDrag)`
  
          `startX` X coordinate, relative to the widget allocation (optional)
  
          `startY` Y coordinate, relative to the widget allocation (optional)
  
          `gestureDrag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragBegin(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.gesture_drag.GestureDrag)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.gesture_drag.GestureDrag.dragBegin");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
      Connect to `DragEnd` signal.
  
      Emitted whenever the dragging is finished.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double offsetX, double offsetY, gid.gtk4.gesture_drag.GestureDrag gestureDrag)`
  
          `offsetX` X offset, relative to the start point (optional)
  
          `offsetY` Y offset, relative to the start point (optional)
  
          `gestureDrag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragEnd(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.gesture_drag.GestureDrag)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.gesture_drag.GestureDrag.dragEnd");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
      Connect to `DragUpdate` signal.
  
      Emitted whenever the dragging point moves.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double offsetX, double offsetY, gid.gtk4.gesture_drag.GestureDrag gestureDrag)`
  
          `offsetX` X offset, relative to the start point (optional)
  
          `offsetY` Y offset, relative to the start point (optional)
  
          `gestureDrag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDragUpdate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk4.gesture_drag.GestureDrag)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.gesture_drag.GestureDrag.dragUpdate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-update", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.gesture_drag.GestureDrag]
class GestureDragGidBuilderImpl(T) : gid.gtk4.gesture_single.GestureSingleGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk4.gesture_drag.GestureDrag]
final class GestureDragGidBuilder : GestureDragGidBuilderImpl!GestureDragGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GestureDrag build() nothrow
  {
    return new GestureDrag(cast(void*)createGObject(GestureDrag._getGType), Yes.Take);
  }
}
