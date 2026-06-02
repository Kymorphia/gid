/// Module for [GestureStylus] class
module gtk.gesture_stylus;

public import gid.basictypes;
import gdk.device_tool;
import gdk.types;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.gesture_single;
import gtk.types;
import gtk.widget;

/**
    #GtkGestureStylus is a #GtkGesture implementation specific to stylus
    input. The provided signals just provide the basic information
*/
class GestureStylus : gtk.gesture_single.GestureSingle
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_stylus_get_type != &gidSymbolNotFound ? gtk_gesture_stylus_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GestureStylus self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.gesture_stylus.GestureStylus]
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
  this(gtk.widget.Widget widget) nothrow
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_stylus_new(widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
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
  bool getAxes(gdk.types.AxisUse[] axes, out double[] values) nothrow
  {
    bool _retval;
    auto _axes = axes.ptr ? cast(GdkAxisUse*)(axes ~ GdkAxisUse.init).ptr : [GdkAxisUse.init].ptr;
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
  bool getAxis(gdk.types.AxisUse axis, out double value) nothrow
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
  gdk.device_tool.DeviceTool getDeviceTool() nothrow
  {
    GdkDeviceTool* _cretval;
    _cretval = gtk_gesture_stylus_get_device_tool(cast(GtkGestureStylus*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.device_tool.DeviceTool)(cast(GdkDeviceTool*)_cretval, No.Take);
    return _retval;
  }

  /**
      Connect to `Down` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus)`
  
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
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gtk.gesture_stylus.GestureStylus.down");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("down", closure, after);
  }

  /**
      Connect to `Motion` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus)`
  
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
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gtk.gesture_stylus.GestureStylus.motion");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }

  /**
      Connect to `Proximity` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus)`
  
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
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gtk.gesture_stylus.GestureStylus.proximity");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("proximity", closure, after);
  }

  /**
      Connect to `Up` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double object, double p0, gtk.gesture_stylus.GestureStylus gestureStylus)`
  
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
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.gesture_stylus.GestureStylus)))
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
        gidInvokeCallbackExceptionHandler(e, "gtk.gesture_stylus.GestureStylus.up");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("up", closure, after);
  }
}

/// Fluent builder implementation template for [gtk.gesture_stylus.GestureStylus]
class GestureStylusGidBuilderImpl(T) : gtk.gesture_single.GestureSingleGidBuilderImpl!T
{
}

/// Fluent builder for [gtk.gesture_stylus.GestureStylus]
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
