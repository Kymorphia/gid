/// Module for [Scale] class
module gid.gtk3.scale;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.range;
import gid.gtk3.types;
import gid.pango1.layout;

/**
    A GtkScale is a slider control used to select a numeric value.
    To use it, you’ll probably want to investigate the methods on
    its base class, #GtkRange, in addition to the methods for GtkScale itself.
    To set the value of a scale, you would normally use [gid.gtk4.range.Range.setValue].
    To detect changes to the value, you would normally use the
    #GtkRange::value-changed signal.
    
    Note that using the same upper and lower bounds for the #GtkScale (through
    the #GtkRange methods) will hide the slider itself. This is useful for
    applications that want to show an undeterminate value on the scale, without
    changing the layout of the application (such as movie or music players).
    
    # GtkScale as GtkBuildable
    
    GtkScale supports a custom `<marks>` element, which can contain multiple
    `<mark>` elements. The “value” and “position” attributes have the same
    meaning as [gid.gtk4.scale.Scale.addMark] parameters of the same name. If the
    element is not empty, its content is taken as the markup to show at
    the mark. It can be translated with the usual ”translatable” and
    “context” attributes.
    
    # CSS nodes
    
    ```plain
    scale[.fine-tune][.marks-before][.marks-after]
    ├── marks.top
    │   ├── mark
    │   ┊    ├── [label]
    │   ┊    ╰── indicator
    ┊   ┊
    │   ╰── mark
    ├── [value]
    ├── contents
    │   ╰── trough
    │       ├── slider
    │       ├── [highlight]
    │       ╰── [fill]
    ╰── marks.bottom
        ├── mark
        ┊    ├── indicator
        ┊    ╰── [label]
        ╰── mark
    ```
    
    GtkScale has a main CSS node with name scale and a subnode for its contents,
    with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scale is in
    'fine-tuning' mode.
    
    If the scale has an origin (see [gid.gtk4.scale.Scale.setHasOrigin]), there is a
    subnode with name highlight below the trough node that is used for rendering
    the highlighted part of the trough.
    
    If the scale is showing a fill level (see [gid.gtk4.range.Range.setShowFillLevel]),
    there is a subnode with name fill below the trough node that is used for
    rendering the filled in part of the trough.
    
    If marks are present, there is a marks subnode before or after the contents
    node, below which each mark gets a node with name mark. The marks nodes get
    either the .top or .bottom style class.
    
    The mark node has a subnode named indicator. If the mark has text, it also
    has a subnode named label. When the mark is either above or left of the
    scale, the label subnode is the first when present. Otherwise, the indicator
    subnode is the first.
    
    The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
    added depending on what marks are present.
    
    If the scale is displaying the value (see #GtkScale:draw-value), there is
    subnode with name value.
*/
class Scale : gid.gtk3.range.Range
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_scale_get_type != &gidSymbolNotFound ? gtk_scale_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkScale";
  }

  /** Returns `this`, for use in `with` statements. */
  override Scale self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.scale.Scale]
      Returns: New builder object
  */
  static ScaleGidBuilder builder() nothrow
  {
    return new ScaleGidBuilder;
  }

  /** */
  @property int digits() nothrow
  {
    return getDigits();
  }

  /** */
  @property void digits(int propval) nothrow
  {
    setDigits(propval);
  }

  /** */
  @property bool drawValue() nothrow
  {
    return getDrawValue();
  }

  /** */
  @property void drawValue(bool propval) nothrow
  {
    setDrawValue(propval);
  }

  /** */
  @property bool hasOrigin() nothrow
  {
    return getHasOrigin();
  }

  /** */
  @property void hasOrigin(bool propval) nothrow
  {
    setHasOrigin(propval);
  }

  /** */
  @property gid.gtk3.types.PositionType valuePos() nothrow
  {
    return getValuePos();
  }

  /** */
  @property void valuePos(gid.gtk3.types.PositionType propval) nothrow
  {
    setValuePos(propval);
  }

  /**
      Creates a new #GtkScale.
  
      Params:
        orientation = the scale’s orientation.
        adjustment = the #GtkAdjustment which sets the range
                       of the scale, or null to create a new adjustment.
      Returns: a new #GtkScale
  */
  this(gid.gtk3.types.Orientation orientation, gid.gtk3.adjustment.Adjustment adjustment = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_scale_new(orientation, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new scale widget with the given orientation that lets the
      user input a number between min and max (including min and max)
      with the increment step.  step must be nonzero; it’s the distance
      the slider moves when using the arrow keys to adjust the scale
      value.
      
      Note that the way in which the precision is derived works best if step
      is a power of ten. If the resulting precision is not suitable for your
      needs, use [gid.gtk4.scale.Scale.setDigits] to correct it.
  
      Params:
        orientation = the scale’s orientation.
        min = minimum value
        max = maximum value
        step = step increment (tick size) used with keyboard shortcuts
      Returns: a new #GtkScale
  */
  static gid.gtk3.scale.Scale newWithRange(gid.gtk3.types.Orientation orientation, double min, double max, double step) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_new_with_range(orientation, min, max, step);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.scale.Scale)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncDrawValue()
  {
    auto _klass = cast(GtkScaleClass*)_vfuncClass;
    if (!_klass.drawValue)
      return;

    _klass.drawValue(cast(GtkScale*)this._cPtr);
  }

  /** */
  protected string vfuncFormatValue(double value)
  {
    auto _klass = cast(GtkScaleClass*)_vfuncClass;
    if (!_klass.formatValue)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.formatValue(cast(GtkScale*)this._cPtr, value);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Obtains the coordinates where the scale will draw the
      #PangoLayout representing the text in the scale. Remember
      when using the #PangoLayout function you need to convert to
      and from pixels using PANGO_PIXELS() or #PANGO_SCALE.
      
      If the #GtkScale:draw-value property is false, the return
      values are undefined.
  
      Params:
        x = location to store X offset of layout, or null
        y = location to store Y offset of layout, or null
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetLayoutOffsets` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncGetLayoutOffsets(out int x, out int y)
  {
    auto _klass = cast(GtkScaleClass*)_vfuncClass;
    if (!_klass.getLayoutOffsets)
      return;

    _klass.getLayoutOffsets(cast(GtkScale*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Adds a mark at value.
      
      A mark is indicated visually by drawing a tick mark next to the scale,
      and GTK+ makes it easy for the user to position the scale exactly at the
      marks value.
      
      If markup is not null, text is shown next to the tick mark.
      
      To remove marks from a scale, use [gid.gtk4.scale.Scale.clearMarks].
  
      Params:
        value = the value at which the mark is placed, must be between
            the lower and upper limits of the scales’ adjustment
        position = where to draw the mark. For a horizontal scale, #GTK_POS_TOP
            and [gid.gtk4.types.PositionType.Left] are drawn above the scale, anything else below.
            For a vertical scale, #GTK_POS_LEFT and [gid.gtk4.types.PositionType.Top] are drawn to
            the left of the scale, anything else to the right.
        markup = Text to be shown at the mark, using [Pango markup][PangoMarkupFormat], or null
  */
  void addMark(double value, gid.gtk3.types.PositionType position, string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_scale_add_mark(cast(GtkScale*)this._cPtr, value, position, _markup);
  }

  /**
      Removes any marks that have been added with [gid.gtk4.scale.Scale.addMark].
  */
  void clearMarks() nothrow
  {
    gtk_scale_clear_marks(cast(GtkScale*)this._cPtr);
  }

  /**
      Gets the number of decimal places that are displayed in the value.
      Returns: the number of decimal places that are displayed
  */
  int getDigits() nothrow
  {
    int _retval;
    _retval = gtk_scale_get_digits(cast(GtkScale*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the current value is displayed as a string
      next to the slider.
      Returns: whether the current value is displayed as a string
  */
  bool getDrawValue() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_get_draw_value(cast(GtkScale*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the scale has an origin.
      Returns: true if the scale has an origin.
  */
  bool getHasOrigin() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_get_has_origin(cast(GtkScale*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #PangoLayout used to display the scale. The returned
      object is owned by the scale so does not need to be freed by
      the caller.
      Returns: the #PangoLayout for this scale,
            or null if the #GtkScale:draw-value property is false.
  */
  gid.pango1.layout.Layout getLayout() nothrow
  {
    PangoLayout* _cretval;
    _cretval = gtk_scale_get_layout(cast(GtkScale*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(PangoLayout*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the coordinates where the scale will draw the
      #PangoLayout representing the text in the scale. Remember
      when using the #PangoLayout function you need to convert to
      and from pixels using PANGO_PIXELS() or #PANGO_SCALE.
      
      If the #GtkScale:draw-value property is false, the return
      values are undefined.
  
      Params:
        x = location to store X offset of layout, or null
        y = location to store Y offset of layout, or null
  */
  void getLayoutOffsets(out int x, out int y) nothrow
  {
    gtk_scale_get_layout_offsets(cast(GtkScale*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Gets the position in which the current value is displayed.
      Returns: the position in which the current value is displayed
  */
  gid.gtk3.types.PositionType getValuePos() nothrow
  {
    GtkPositionType _cretval;
    _cretval = gtk_scale_get_value_pos(cast(GtkScale*)this._cPtr);
    gid.gtk3.types.PositionType _retval = cast(gid.gtk3.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Sets the number of decimal places that are displayed in the value. Also
      causes the value of the adjustment to be rounded to this number of digits,
      so the retrieved value matches the displayed one, if #GtkScale:draw-value is
      true when the value changes. If you want to enforce rounding the value when
      #GtkScale:draw-value is false, you can set #GtkRange:round-digits instead.
      
      Note that rounding to a small number of digits can interfere with
      the smooth autoscrolling that is built into #GtkScale. As an alternative,
      you can use the #GtkScale::format-value signal to format the displayed
      value yourself.
  
      Params:
        digits = the number of decimal places to display,
              e.g. use 1 to display 1.0, 2 to display 1.00, etc
  */
  void setDigits(int digits) nothrow
  {
    gtk_scale_set_digits(cast(GtkScale*)this._cPtr, digits);
  }

  /**
      Specifies whether the current value is displayed as a string next
      to the slider.
  
      Params:
        drawValue = true to draw the value
  */
  void setDrawValue(bool drawValue) nothrow
  {
    gtk_scale_set_draw_value(cast(GtkScale*)this._cPtr, drawValue);
  }

  /**
      If #GtkScale:has-origin is set to true (the default), the scale will
      highlight the part of the trough between the origin (bottom or left side)
      and the current value.
  
      Params:
        hasOrigin = true if the scale has an origin
  */
  void setHasOrigin(bool hasOrigin) nothrow
  {
    gtk_scale_set_has_origin(cast(GtkScale*)this._cPtr, hasOrigin);
  }

  /**
      Sets the position in which the current value is displayed.
  
      Params:
        pos = the position in which the current value is displayed
  */
  void setValuePos(gid.gtk3.types.PositionType pos) nothrow
  {
    gtk_scale_set_value_pos(cast(GtkScale*)this._cPtr, pos);
  }

  /**
      Connect to `FormatValue` signal.
  
      Signal which allows you to change how the scale value is displayed.
        Connect a signal handler which returns an allocated string representing
        value. That string will then be used to display the scale's value.
        
        If no user-provided handlers are installed, the value will be displayed on
        its own, rounded according to the value of the #GtkScale:digits property.
        
        Here's an example signal handler which displays a value 1.0 as
        with "-->1.0<--".
        ```c
        static gchar*
        format_value_callback (GtkScale *scale,
                               gdouble   value)
        {
          return g_strdup_printf ("-->\%0.*g<--",
                                  gtk_scale_get_digits (scale), value);
         }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          `string callback(double value, gid.gtk3.scale.Scale scale)`
  
          `value` the value to format (optional)
  
          `scale` the instance the signal is connected to (optional)
  
          `Returns` allocated string representing value
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectFormatValue(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == string)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.scale.Scale)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      string _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.scale.Scale.formatValue");
      }

      setVal!(string)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("format-value", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Scale
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.scale.Scale), T.stringof ~ " is not derived from gid.gtk3.scale.Scale");

    gid.gtk3.range.Range._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDrawValue", true)[0]) == gid.gtk3.scale.Scale))
      _installVfunc(klass, "draw_value");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncFormatValue", true)[0]) == gid.gtk3.scale.Scale))
      _installVfunc(klass, "format_value");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetLayoutOffsets", true)[0]) == gid.gtk3.scale.Scale))
      _installVfunc(klass, "get_layout_offsets");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkScaleClass*)klass;

    switch (vfunc)
    {
      case "draw_value":
      {
        static extern(C) void _vfuncDrawValueTramp(GtkScale* scale) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.scale.Scale)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scale);
          if (!_obj)
          {
            auto _klass = cast(GtkScaleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)scale);
            if (_klass.drawValue)
              return (cast(typeof(&_vfuncDrawValueTramp))_klass.drawValue)(scale);
            return;
          }

          try
          {
            _obj.vfuncDrawValue();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.scale.Scale.vfuncDrawValue");
          }
        }

        _klass.drawValue = cast(typeof(_klass.drawValue))&_vfuncDrawValueTramp;
        break;
      }
      case "format_value":
      {
        static extern(C) char* _vfuncFormatValueTramp(GtkScale* scale, double value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.scale.Scale)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scale);
          if (!_obj)
          {
            auto _klass = cast(GtkScaleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)scale);
            if (_klass.formatValue)
              return (cast(typeof(&_vfuncFormatValueTramp))_klass.formatValue)(scale, value);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncFormatValue(value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.scale.Scale.vfuncFormatValue");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.formatValue = cast(typeof(_klass.formatValue))&_vfuncFormatValueTramp;
        break;
      }
      case "get_layout_offsets":
      {
        static extern(C) void _vfuncGetLayoutOffsetsTramp(GtkScale* scale, int* x, int* y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.scale.Scale)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scale);
          if (!_obj)
          {
            auto _klass = cast(GtkScaleClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)scale);
            if (_klass.getLayoutOffsets)
              return (cast(typeof(&_vfuncGetLayoutOffsetsTramp))_klass.getLayoutOffsets)(scale, x, y);
            return;
          }

          typeof(*x) _xNull;
          if (!x)
            x = &_xNull;

          typeof(*y) _yNull;
          if (!y)
            y = &_yNull;

          try
          {
            _obj.vfuncGetLayoutOffsets(*x, *y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.scale.Scale.vfuncGetLayoutOffsets");
          }
        }

        _klass.getLayoutOffsets = cast(typeof(_klass.getLayoutOffsets))&_vfuncGetLayoutOffsetsTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.scale.Scale]
class ScaleGidBuilderImpl(T) : gid.gtk3.range.RangeGidBuilderImpl!T
{


  /** */
  T digits(int propval) nothrow
  {
    return setProperty("digits", propval);
  }

  /** */
  T drawValue(bool propval) nothrow
  {
    return setProperty("draw-value", propval);
  }

  /** */
  T hasOrigin(bool propval) nothrow
  {
    return setProperty("has-origin", propval);
  }

  /** */
  T valuePos(gid.gtk3.types.PositionType propval) nothrow
  {
    return setProperty("value-pos", propval);
  }
}

/// Fluent builder for [gid.gtk3.scale.Scale]
final class ScaleGidBuilder : ScaleGidBuilderImpl!ScaleGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Scale build() nothrow
  {
    return new Scale(cast(void*)createGObject(Scale._getGType), Yes.Take);
  }
}
