/// Module for [GestureMultiPress] class
module gtk.gesture_multi_press;

import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;
import gtk.widget;

/**
    #GtkGestureMultiPress is a #GtkGesture implementation able to recognize
    multiple clicks on a nearby zone, which can be listened for through the
    #GtkGestureMultiPress::pressed signal. Whenever time or distance between
    clicks exceed the GTK+ defaults, #GtkGestureMultiPress::stopped is emitted,
    and the click counter is reset.
    
    Callers may also restrict the area that is considered valid for a >1
    touch/button press through [gtk.gesture_multi_press.GestureMultiPress.setArea], so any
    click happening outside that area is considered to be a first click of
    its own.
*/
class GestureMultiPress : gtk.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_multi_press_get_type != &gidSymbolNotFound ? gtk_gesture_multi_press_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureMultiPress self()
  {
    return this;
  }

  /**
      Returns a newly created #GtkGesture that recognizes single and multiple
      presses.
  
      Params:
        widget = a #GtkWidget
      Returns: a newly created #GtkGestureMultiPress
  */
  this(gtk.widget.Widget widget)
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_multi_press_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      If an area was set through [gtk.gesture_multi_press.GestureMultiPress.setArea],
      this function will return true and fill in rect with the
      press area. See [gtk.gesture_multi_press.GestureMultiPress.setArea] for more
      details on what the press area represents.
  
      Params:
        rect = return location for the press area
      Returns: true if rect was filled with the press area
  */
  bool getArea(out gdk.rectangle.Rectangle rect)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_multi_press_get_area(cast(GtkGestureMultiPress*)this._cPtr, cast(GdkRectangle*)&rect);
    return _retval;
  }

  /**
      If rect is non-null, the press area will be checked to be
      confined within the rectangle, otherwise the button count
      will be reset so the press is seen as being the first one.
      If rect is null, the area will be reset to an unrestricted
      state.
      
      Note: The rectangle is only used to determine whether any
      non-first click falls within the expected area. This is not
      akin to an input shape.
  
      Params:
        rect = rectangle to receive coordinates on
  */
  void setArea(gdk.rectangle.Rectangle rect)
  {
    gtk_gesture_multi_press_set_area(cast(GtkGestureMultiPress*)this._cPtr, cast(const(GdkRectangle)*)&rect);
  }

  /**
      Connect to `Pressed` signal.
  
      This signal is emitted whenever a button or touch press happens.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int nPress, double x, double y, gtk.gesture_multi_press.GestureMultiPress gestureMultiPress))
  
          `nPress` how many touch/button presses happened with this one (optional)
  
          `x` The X coordinate, in widget allocation coordinates (optional)
  
          `y` The Y coordinate, in widget allocation coordinates (optional)
  
          `gestureMultiPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPressed(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == double)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.gesture_multi_press.GestureMultiPress)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("pressed", closure, after);
  }

  /**
      Connect to `Released` signal.
  
      This signal is emitted when a button or touch is released. n_press
        will report the number of press that is paired to this event, note
        that #GtkGestureMultiPress::stopped may have been emitted between the
        press and its release, n_press will only start over at the next press.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int nPress, double x, double y, gtk.gesture_multi_press.GestureMultiPress gestureMultiPress))
  
          `nPress` number of press that is paired with this release (optional)
  
          `x` The X coordinate, in widget allocation coordinates (optional)
  
          `y` The Y coordinate, in widget allocation coordinates (optional)
  
          `gestureMultiPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectReleased(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == double)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gtk.gesture_multi_press.GestureMultiPress)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("released", closure, after);
  }

  /**
      Connect to `Stopped` signal.
  
      This signal is emitted whenever any time/distance threshold has
        been exceeded.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.gesture_multi_press.GestureMultiPress gestureMultiPress))
  
          `gestureMultiPress` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStopped(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.gesture_multi_press.GestureMultiPress)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("stopped", closure, after);
  }
}
