module gtk.gesture_drag;

import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;

/**
    [gtk.gesture_drag.GestureDrag] is a [gtk.gesture.Gesture] implementation for drags.
  
  The drag operation itself can be tracked throughout the
  `signal@Gtk.GestureDrag::drag-begin`,
  `signal@Gtk.GestureDrag::drag-update` and
  `signal@Gtk.GestureDrag::drag-end` signals, and the relevant
  coordinates can be extracted through
  [gtk.gesture_drag.GestureDrag.getOffset] and
  [gtk.gesture_drag.GestureDrag.getStartPoint].
*/
class GestureDrag : gtk.gesture_single.GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_drag_get_type != &gidSymbolNotFound ? gtk_gesture_drag_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  override GestureDrag self()
  {
    return this;
  }

  /**
      Returns a newly created [gtk.gesture.Gesture] that recognizes drags.
    Returns:     a newly created [gtk.gesture_drag.GestureDrag]
  */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_drag_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the offset from the start point.
    
    If the gesture is active, this function returns true and
    fills in x and y with the coordinates of the current point,
    as an offset to the starting drag point.
    Params:
      x =       X offset for the current point
      y =       Y offset for the current point
    Returns:     true if the gesture is active
  */
  bool getOffset(out double x, out double y)
  {
    bool _retval;
    _retval = gtk_gesture_drag_get_offset(cast(GtkGestureDrag*)cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Gets the point where the drag started.
    
    If the gesture is active, this function returns true
    and fills in x and y with the drag start coordinates,
    in widget-relative coordinates.
    Params:
      x =       X coordinate for the drag start point
      y =       Y coordinate for the drag start point
    Returns:     true if the gesture is active
  */
  bool getStartPoint(out double x, out double y)
  {
    bool _retval;
    _retval = gtk_gesture_drag_get_start_point(cast(GtkGestureDrag*)cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
      Emitted whenever dragging starts.
  
    ## Parameters
    $(LIST
      * $(B startX)       X coordinate, relative to the widget allocation
      * $(B startY)       Y coordinate, relative to the widget allocation
      * $(B gestureDrag) the instance the signal is connected to
    )
  */
  alias DragBeginCallbackDlg = void delegate(double startX, double startY, gtk.gesture_drag.GestureDrag gestureDrag);

  /** ditto */
  alias DragBeginCallbackFunc = void function(double startX, double startY, gtk.gesture_drag.GestureDrag gestureDrag);

  /**
    Connect to DragBegin signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDragBegin(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragBeginCallbackDlg) || is(T : DragBeginCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureDrag = getVal!(gtk.gesture_drag.GestureDrag)(_paramVals);
      auto startX = getVal!(double)(&_paramVals[1]);
      auto startY = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(startX, startY, gestureDrag);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
      Emitted whenever the dragging is finished.
  
    ## Parameters
    $(LIST
      * $(B offsetX)       X offset, relative to the start point
      * $(B offsetY)       Y offset, relative to the start point
      * $(B gestureDrag) the instance the signal is connected to
    )
  */
  alias DragEndCallbackDlg = void delegate(double offsetX, double offsetY, gtk.gesture_drag.GestureDrag gestureDrag);

  /** ditto */
  alias DragEndCallbackFunc = void function(double offsetX, double offsetY, gtk.gesture_drag.GestureDrag gestureDrag);

  /**
    Connect to DragEnd signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDragEnd(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragEndCallbackDlg) || is(T : DragEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureDrag = getVal!(gtk.gesture_drag.GestureDrag)(_paramVals);
      auto offsetX = getVal!(double)(&_paramVals[1]);
      auto offsetY = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(offsetX, offsetY, gestureDrag);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
      Emitted whenever the dragging point moves.
  
    ## Parameters
    $(LIST
      * $(B offsetX)       X offset, relative to the start point
      * $(B offsetY)       Y offset, relative to the start point
      * $(B gestureDrag) the instance the signal is connected to
    )
  */
  alias DragUpdateCallbackDlg = void delegate(double offsetX, double offsetY, gtk.gesture_drag.GestureDrag gestureDrag);

  /** ditto */
  alias DragUpdateCallbackFunc = void function(double offsetX, double offsetY, gtk.gesture_drag.GestureDrag gestureDrag);

  /**
    Connect to DragUpdate signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectDragUpdate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragUpdateCallbackDlg) || is(T : DragUpdateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureDrag = getVal!(gtk.gesture_drag.GestureDrag)(_paramVals);
      auto offsetX = getVal!(double)(&_paramVals[1]);
      auto offsetY = getVal!(double)(&_paramVals[2]);
      _dClosure.dlg(offsetX, offsetY, gestureDrag);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-update", closure, after);
  }
}
