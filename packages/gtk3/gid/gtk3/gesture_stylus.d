/// Module for [GestureStylus] class
module gid.gtk3.gesture_stylus;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.device_tool;
import gid.gdk3.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.gesture_single;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkGestureStylus is a #GtkGesture implementation specific to stylus
    input. The provided signals just provide the basic information
*/
class GestureStylus : gid.gtk3.gesture_single.GestureSingle
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
    return cast(void function())gtk_gesture_stylus_get_type != &gidSymbolNotFound ? gtk_gesture_stylus_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkGestureStylus";
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureStylus self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.gesture_stylus.GestureStylus]
      Returns: New builder object
  */
  static GestureStylusGidBuilder builder() nothrow
  {
    return new GestureStylusGidBuilder;
  }

  /**
      Creates a new #GtkGestureStylus.
  
      Params:
        widget = a #GtkWidget
      Returns: a newly created stylus gesture
  */
  this(gid.gtk3.widget.Widget widget) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkGesture* _cretval;
      _cretval = gtk_gesture_stylus_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Returns the current values for the requested axes. This function
      must be called from either the #GtkGestureStylus:down,
      #GtkGestureStylus:motion, #GtkGestureStylus:up or #GtkGestureStylus:proximity
      signals.
  
      Params:
        axes = array of requested axes, terminated with #GDK_AXIS_IGNORE
        values = return location for the axis values
      Returns: #TRUE if there is a current value for the axes
  */
  bool getAxes(gid.gdk3.types.AxisUse[] axes, out double[] values) nothrow
  {
    bool _retval;
    auto _axes_arr = axes ~ GdkAxisUse.init;
    auto _axes = _axes_arr.ptr;
    double* _values;
    _retval = cast(bool)gtk_gesture_stylus_get_axes(cast(GtkGestureStylus*)this._cPtr, _axes, &_values);
    values.length = axes.length;
    values[0 .. $] = (cast(double*)_values)[0 .. axes.length];
    gFree(cast(void*)_values);
    return _retval;
  }

  /**
      Returns the current value for the requested axis. This function
      must be called from either the #GtkGestureStylus:down,
      #GtkGestureStylus:motion, #GtkGestureStylus:up or #GtkGestureStylus:proximity
      signals.
  
      Params:
        axis = requested device axis
        value = return location for the axis value
      Returns: #TRUE if there is a current value for the axis
  */
  bool getAxis(gid.gdk3.types.AxisUse axis, out double value) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_gesture_stylus_get_axis(cast(GtkGestureStylus*)this._cPtr, axis, cast(double*)&value);
    return _retval;
  }

  /**
      Returns the #GdkDeviceTool currently driving input through this gesture.
      This function must be called from either the #GtkGestureStylus::down,
      #GtkGestureStylus::motion, #GtkGestureStylus::up or #GtkGestureStylus::proximity
      signal handlers.
      Returns: The current stylus tool
  */
  gid.gdk3.device_tool.DeviceTool getDeviceTool() nothrow
  {
    GdkDeviceTool* _cretval;
    _cretval = gtk_gesture_stylus_get_device_tool(cast(GtkGestureStylus*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `Down` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gid.gtk3.gesture_stylus.GestureStylus gestureStylus)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDown(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_stylus.GestureStylus.down");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("down", closure, after);
  }

  /**
      Connect to `Motion` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gid.gtk3.gesture_stylus.GestureStylus gestureStylus)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMotion(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_stylus.GestureStylus.motion");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }

  /**
      Connect to `Proximity` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gid.gtk3.gesture_stylus.GestureStylus gestureStylus)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectProximity(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_stylus.GestureStylus.proximity");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("proximity", closure, after);
  }

  /**
      Connect to `Up` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gid.gtk3.gesture_stylus.GestureStylus gestureStylus)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `gestureStylus` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectUp(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.gesture_stylus.GestureStylus.up");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("up", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.gesture_stylus.GestureStylus]
class GestureStylusGidBuilderImpl(T) : gid.gtk3.gesture_single.GestureSingleGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtk3.gesture_stylus.GestureStylus]
final class GestureStylusGidBuilder : GestureStylusGidBuilderImpl!GestureStylusGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  GestureStylus build() nothrow
  {
    return new GestureStylus(cast(void*)createGObject(GestureStylus._getGType), Yes.Take);
  }
}
