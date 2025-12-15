/// Module for [GestureDrag] class
module gtk.gesture_drag;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;
import gtk.widget;

/**
    #GtkGestureDrag is a #GtkGesture implementation that recognizes drag
    operations. The drag operation itself can be tracked throught the
    #GtkGestureDrag::drag-begin, #GtkGestureDrag::drag-update and
    #GtkGestureDrag::drag-end signals, or the relevant coordinates be
    extracted through [gtk.gesture_drag.GestureDrag.getOffset] and
    [gtk.gesture_drag.GestureDrag.getStartPoint].
*/
class GestureDrag : gtk.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_drag_get_type != &gidSymbolNotFound ? gtk_gesture_drag_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureDrag self()
  {
    return this;
  }

  /**
      Returns a newly created #GtkGesture that recognizes drags.
  
      Params:
        widget = a #GtkWidget
      Returns: a newly created #GtkGestureDrag
  */
  this(gtk.widget.Widget widget)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_drag_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      If the gesture is active, this function returns true and
      fills in `x` and `y` with the coordinates of the current point,
      as an offset to the starting drag point.
  
      Params:
        x = X offset for the current point
        y = Y offset for the current point
      Returns: true if the gesture is active
  */
  bool getOffset(out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_drag_get_offset(cast(GtkGestureDrag*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      If the gesture is active, this function returns true
      and fills in `x` and `y` with the drag start coordinates,
      in window-relative coordinates.
  
      Params:
        x = X coordinate for the drag start point
        y = Y coordinate for the drag start point
      Returns: true if the gesture is active
  */
  bool getStartPoint(out double x, out double y)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_drag_get_start_point(cast(GtkGestureDrag*)this._cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Connect to `DragBegin` signal.
  
      This signal is emitted whenever dragging starts.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double startX, double startY, gtk.gesture_drag.GestureDrag gestureDrag))
  
          `startX` X coordinate, relative to the widget allocation (optional)
  
          `startY` Y coordinate, relative to the widget allocation (optional)
  
          `gestureDrag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragBegin(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_drag.GestureDrag)))
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
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
      Connect to `DragEnd` signal.
  
      This signal is emitted whenever the dragging is finished.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double offsetX, double offsetY, gtk.gesture_drag.GestureDrag gestureDrag))
  
          `offsetX` X offset, relative to the start point (optional)
  
          `offsetY` Y offset, relative to the start point (optional)
  
          `gestureDrag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragEnd(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_drag.GestureDrag)))
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
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
      Connect to `DragUpdate` signal.
  
      This signal is emitted whenever the dragging point moves.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double offsetX, double offsetY, gtk.gesture_drag.GestureDrag gestureDrag))
  
          `offsetX` X offset, relative to the start point (optional)
  
          `offsetY` Y offset, relative to the start point (optional)
  
          `gestureDrag` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDragUpdate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_drag.GestureDrag)))
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
    return connectSignalClosure("drag-update", closure, after);
  }
}
