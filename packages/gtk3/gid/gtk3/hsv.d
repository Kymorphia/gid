/// Module for [HSV] class
module gid.gtk3.hsv;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkHSV is the “color wheel” part of a complete color selector widget.
    It allows to select a color by determining its HSV components in an
    intuitive way. Moving the selection around the outer ring changes the hue,
    and moving the selection point inside the inner triangle changes value and
    saturation.
    
    #GtkHSV has been deprecated together with #GtkColorSelection, where
    it was used.
*/
class HSV : gid.gtk3.widget.Widget
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
    return cast(void function())gtk_hsv_get_type != &gidSymbolNotFound ? gtk_hsv_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHSV";
  }

  /** Returns `this`, for use in `with` statements. */
  override HSV self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.hsv.HSV]
      Returns: New builder object
  */
  static HSVGidBuilder builder() nothrow
  {
    return new HSVGidBuilder;
  }

  /**
      Creates a new HSV color selector.
      Returns: A newly-created HSV color selector.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_hsv_new();
      this(_cretval, No.Take);
    }
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
  static void toRgb(double h, double s, double v, out double r, out double g, out double b) nothrow
  {
    gtk_hsv_to_rgb(h, s, v, cast(double*)&r, cast(double*)&g, cast(double*)&b);
  }

  /** */
  protected void vfuncChanged()
  {
    auto _klass = cast(GtkHSVClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GtkHSV*)this._cPtr);
  }

  /** */
  protected void vfuncMove(gid.gtk3.types.DirectionType type)
  {
    auto _klass = cast(GtkHSVClass*)_vfuncClass;
    if (!_klass.move)
      return;

    _klass.move(cast(GtkHSV*)this._cPtr, type);
  }

  /**
      Queries the current color in an HSV color selector.
      Returned values will be in the [0.0, 1.0] range.
  
      Params:
        h = Return value for the hue
        s = Return value for the saturation
        v = Return value for the value
  */
  void getColor(out double h, out double s, out double v) nothrow
  {
    gtk_hsv_get_color(cast(GtkHSV*)this._cPtr, cast(double*)&h, cast(double*)&s, cast(double*)&v);
  }

  /**
      Queries the size and ring width of an HSV color selector.
  
      Params:
        size = Return value for the diameter of the hue ring
        ringWidth = Return value for the width of the hue ring
  */
  void getMetrics(out int size, out int ringWidth) nothrow
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
  bool isAdjusting() nothrow
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
  void setColor(double h, double s, double v) nothrow
  {
    gtk_hsv_set_color(cast(GtkHSV*)this._cPtr, h, s, v);
  }

  /**
      Sets the size and ring width of an HSV color selector.
  
      Params:
        size = Diameter for the hue ring
        ringWidth = Width of the hue ring
  */
  void setMetrics(int size, int ringWidth) nothrow
  {
    gtk_hsv_set_metrics(cast(GtkHSV*)this._cPtr, size, ringWidth);
  }

  /**
      Connect to `Changed` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.hsv.HSV hSV)`
  
          `hSV` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.hsv.HSV)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.hsv.HSV.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `Move` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.DirectionType object, gid.gtk3.hsv.HSV hSV)`
  
          `object`  (optional)
  
          `hSV` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMove(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.DirectionType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.hsv.HSV)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.hsv.HSV.move");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from HSV
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.hsv.HSV), T.stringof ~ " is not derived from gid.gtk3.hsv.HSV");

    gid.gtk3.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gtk3.hsv.HSV))
      _installVfunc(klass, "changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMove", true)[0]) == gid.gtk3.hsv.HSV))
      _installVfunc(klass, "move");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkHSVClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkHSV* hsv) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.hsv.HSV)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)hsv);
          if (!_obj)
          {
            auto _klass = cast(GtkHSVClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hsv);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(hsv);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.hsv.HSV.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "move":
      {
        static extern(C) void _vfuncMoveTramp(GtkHSV* hsv, GtkDirectionType type) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.hsv.HSV)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)hsv);
          if (!_obj)
          {
            auto _klass = cast(GtkHSVClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)hsv);
            if (_klass.move)
              return (cast(typeof(&_vfuncMoveTramp))_klass.move)(hsv, type);
            return;
          }

          try
          {
            _obj.vfuncMove(type);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.hsv.HSV.vfuncMove");
          }
        }

        _klass.move = cast(typeof(_klass.move))&_vfuncMoveTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.hsv.HSV]
class HSVGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.hsv.HSV]
final class HSVGidBuilder : HSVGidBuilderImpl!HSVGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HSV build() nothrow
  {
    return new HSV(cast(void*)createGObject(HSV._getGType), Yes.Take);
  }
}
