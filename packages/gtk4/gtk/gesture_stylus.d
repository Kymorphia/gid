/// Module for [GestureStylus] class
module gtk.gesture_stylus;

import gdk.device_tool;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;

/**
    [gtk.gesture_stylus.GestureStylus] is a [gtk.gesture.Gesture] specific to stylus input.
    
    The provided signals just relay the basic information of the
    stylus events.
*/
class GestureStylus : gtk.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_stylus_get_type != &gidSymbolNotFound ? gtk_gesture_stylus_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureStylus self()
  {
    return this;
  }

  /**
      Get `stylusOnly` property.
      Returns: If this gesture should exclusively react to stylus input devices.
  */
  @property bool stylusOnly()
  {
    return getStylusOnly();
  }

  /**
      Set `stylusOnly` property.
      Params:
        propval = If this gesture should exclusively react to stylus input devices.
  */
  @property void stylusOnly(bool propval)
  {
    return setStylusOnly(propval);
  }

  /**
      Creates a new [gtk.gesture_stylus.GestureStylus].
      Returns: a newly created stylus gesture
  */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_stylus_new();
    this(_cretval, Yes.Take);
  }

  /**
      Returns the current values for the requested axes.
      
      This function must be called from the handler of one of the
      [gtk.gesture_stylus.GestureStylus.down], [gtk.gesture_stylus.GestureStylus.motion],
      [gtk.gesture_stylus.GestureStylus.up] or [gtk.gesture_stylus.GestureStylus.proximity]
      signals.
  
      Params:
        axes = array of requested axes, terminated with [gdk.types.AxisUse.Ignore]
        values = return location for the axis values
      Returns: true if there is a current value for the axes
  */
  bool getAxes(gdk.types.AxisUse[] axes, out double[] values)
  {
    bool _retval;
    auto _axes = cast(GdkAxisUse*)(axes ~ GdkAxisUse.init).ptr;
    double* _values;
    _retval = cast(bool)gtk_gesture_stylus_get_axes(cast(GtkGestureStylus*)this._cPtr, _axes, &_values);
    values.length = axes.length;
    values[0 .. $] = (cast(double*)_values)[0 .. axes.length];
    gFree(cast(void*)_values);
    return _retval;
  }

  /**
      Returns the current value for the requested axis.
      
      This function must be called from the handler of one of the
      [gtk.gesture_stylus.GestureStylus.down], [gtk.gesture_stylus.GestureStylus.motion],
      [gtk.gesture_stylus.GestureStylus.up] or [gtk.gesture_stylus.GestureStylus.proximity]
      signals.
  
      Params:
        axis = requested device axis
        value = return location for the axis value
      Returns: true if there is a current value for the axis
  */
  bool getAxis(gdk.types.AxisUse axis, out double value)
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_stylus_get_axis(cast(GtkGestureStylus*)this._cPtr, axis, cast(double*)&value);
    return _retval;
  }

  /**
      Returns the accumulated backlog of tracking information.
      
      By default, GTK will limit rate of input events. On stylus input
      where accuracy of strokes is paramount, this function returns the
      accumulated coordinate/timing state before the emission of the
      current [Gtk.GestureStylus::motion] signal.
      
      This function may only be called within a [gtk.gesture_stylus.GestureStylus.motion]
      signal handler, the state given in this signal and obtainable through
      [gtk.gesture_stylus.GestureStylus.getAxis] express the latest (most up-to-date)
      state in motion history.
      
      The backlog is provided in chronological order.
  
      Params:
        backlog = coordinates and times for the backlog events
      Returns: true if there is a backlog to unfold in the current state.
  */
  bool getBacklog(out gdk.types.TimeCoord[] backlog)
  {
    bool _retval;
    uint _nElems;
    GdkTimeCoord* _backlog;
    _retval = cast(bool)gtk_gesture_stylus_get_backlog(cast(GtkGestureStylus*)this._cPtr, &_backlog, &_nElems);
    backlog.length = _nElems;
    backlog[0 .. $] = (cast(gdk.types.TimeCoord*)_backlog)[0 .. _nElems];
    gFree(cast(void*)_backlog);
    return _retval;
  }

  /**
      Returns the [gdk.device_tool.DeviceTool] currently driving input through this gesture.
      
      This function must be called from the handler of one of the
      [gtk.gesture_stylus.GestureStylus.down], [gtk.gesture_stylus.GestureStylus.motion],
      [gtk.gesture_stylus.GestureStylus.up] or [gtk.gesture_stylus.GestureStylus.proximity]
      signals.
      Returns: The current stylus tool
  */
  gdk.device_tool.DeviceTool getDeviceTool()
  {
    GdkDeviceTool* _cretval;
    _cretval = gtk_gesture_stylus_get_device_tool(cast(GtkGestureStylus*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether the gesture is for styluses only.
      
      Stylus-only gestures will signal events exclusively from stylus
      input devices.
      Returns: true if the gesture is only for stylus events
  */
  bool getStylusOnly()
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_stylus_get_stylus_only(cast(GtkGestureStylus*)this._cPtr);
    return _retval;
  }

  /**
      Sets the state of stylus-only
      
      If true, the gesture will exclusively handle events from stylus input devices,
      otherwise it'll handle events from any pointing device.
  
      Params:
        stylusOnly = whether the gesture is used exclusively for stylus events
  */
  void setStylusOnly(bool stylusOnly)
  {
    gtk_gesture_stylus_set_stylus_only(cast(GtkGestureStylus*)this._cPtr, stylusOnly);
  }

  /**
      Connect to `Down` signal.
  
      Emitted when the stylus touches the device.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.gesture_stylus.GestureStylus gestureStylus))
  
          `x` the X coordinate of the stylus event (optional)
  
          `y` the Y coordinate of the stylus event (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDown(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
    return connectSignalClosure("down", closure, after);
  }

  /**
      Connect to `Motion` signal.
  
      Emitted when the stylus moves while touching the device.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.gesture_stylus.GestureStylus gestureStylus))
  
          `x` the X coordinate of the stylus event (optional)
  
          `y` the Y coordinate of the stylus event (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMotion(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
    return connectSignalClosure("motion", closure, after);
  }

  /**
      Connect to `Proximity` signal.
  
      Emitted when the stylus is in proximity of the device.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.gesture_stylus.GestureStylus gestureStylus))
  
          `x` the X coordinate of the stylus event (optional)
  
          `y` the Y coordinate of the stylus event (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectProximity(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
    return connectSignalClosure("proximity", closure, after);
  }

  /**
      Connect to `Up` signal.
  
      Emitted when the stylus no longer touches the device.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double x, double y, gtk.gesture_stylus.GestureStylus gestureStylus))
  
          `x` the X coordinate of the stylus event (optional)
  
          `y` the Y coordinate of the stylus event (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectUp(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
    return connectSignalClosure("up", closure, after);
  }
}
