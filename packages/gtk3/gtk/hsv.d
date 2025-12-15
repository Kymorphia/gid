/// Module for [HSV] class
module gtk.hsv;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    #GtkHSV is the “color wheel” part of a complete color selector widget.
    It allows to select a color by determining its HSV components in an
    intuitive way. Moving the selection around the outer ring changes the hue,
    and moving the selection point inside the inner triangle changes value and
    saturation.
    
    #GtkHSV has been deprecated together with #GtkColorSelection, where
    it was used.
*/
class HSV : gtk.widget.Widget
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
    return cast(void function())gtk_hsv_get_type != &gidSymbolNotFound ? gtk_hsv_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HSV self()
  {
    return this;
  }

  /**
      Creates a new HSV color selector.
      Returns: A newly-created HSV color selector.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_hsv_new();
    this(_cretval, No.Take);
  }

  /**
      Converts a color from HSV space to RGB.
      
      Input values must be in the [0.0, 1.0] range;
      output values will be in the same range.
  
      Params:
        h = Hue
        s = Saturation
        v = Value
        r = Return value for the red component
        g = Return value for the green component
        b = Return value for the blue component
  */
  static void toRgb(double h, double s, double v, out double r, out double g, out double b)
  {
    gtk_hsv_to_rgb(h, s, v, cast(double*)&r, cast(double*)&g, cast(double*)&b);
  }

  /**
      Queries the current color in an HSV color selector.
      Returned values will be in the [0.0, 1.0] range.
  
      Params:
        h = Return value for the hue
        s = Return value for the saturation
        v = Return value for the value
  */
  void getColor(out double h, out double s, out double v)
  {
    gtk_hsv_get_color(cast(GtkHSV*)this._cPtr, cast(double*)&h, cast(double*)&s, cast(double*)&v);
  }

  /**
      Queries the size and ring width of an HSV color selector.
  
      Params:
        size = Return value for the diameter of the hue ring
        ringWidth = Return value for the width of the hue ring
  */
  void getMetrics(out int size, out int ringWidth)
  {
    gtk_hsv_get_metrics(cast(GtkHSV*)this._cPtr, cast(int*)&size, cast(int*)&ringWidth);
  }

  /**
      An HSV color selector can be said to be adjusting if multiple rapid
      changes are being made to its value, for example, when the user is
      adjusting the value with the mouse. This function queries whether
      the HSV color selector is being adjusted or not.
      Returns: true if clients can ignore changes to the color value,
            since they may be transitory, or false if they should consider
            the color value status to be final.
  */
  bool isAdjusting()
  {
    bool _retval;
    _retval = cast(bool)gtk_hsv_is_adjusting(cast(GtkHSV*)this._cPtr);
    return _retval;
  }

  /**
      Sets the current color in an HSV color selector.
      Color component values must be in the [0.0, 1.0] range.
  
      Params:
        h = Hue
        s = Saturation
        v = Value
  */
  void setColor(double h, double s, double v)
  {
    gtk_hsv_set_color(cast(GtkHSV*)this._cPtr, h, s, v);
  }

  /**
      Sets the size and ring width of an HSV color selector.
  
      Params:
        size = Diameter for the hue ring
        ringWidth = Width of the hue ring
  */
  void setMetrics(int size, int ringWidth)
  {
    gtk_hsv_set_metrics(cast(GtkHSV*)this._cPtr, size, ringWidth);
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.hsv.HSV hSV))
  
          `hSV` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.hsv.HSV)))
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
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `Move` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.DirectionType object, gtk.hsv.HSV hSV))
  
          `object`  (optional)
  
          `hSV` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMove(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.hsv.HSV)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move", closure, after);
  }
}
