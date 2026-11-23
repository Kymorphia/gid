/// Module for [Scale] class
module gid.gtk4.scale;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_range;
import gid.gtk4.accessible_range_mixin;
import gid.gtk4.adjustment;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.range;
import gid.gtk4.types;
import gid.pango1.layout;

/**
    Allows to select a numeric value with a slider control.
    
    <picture>
      <source srcset="scales-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkScale" src="scales.png">
    </picture>
    
    To use it, you’ll probably want to investigate the methods on its base
    class, [gid.gtk4.range.Range], in addition to the methods for [gid.gtk4.scale.Scale] itself.
    To set the value of a scale, you would normally use [gid.gtk4.range.Range.setValue].
    To detect changes to the value, you would normally use the
    [gid.gtk4.range.Range.valueChanged] signal.
    
    Note that using the same upper and lower bounds for the [gid.gtk4.scale.Scale] (through
    the [gid.gtk4.range.Range] methods) will hide the slider itself. This is useful for
    applications that want to show an undeterminate value on the scale, without
    changing the layout of the application (such as movie or music players).
    
    # GtkScale as GtkBuildable
    
    [gid.gtk4.scale.Scale] supports a custom `<marks>` element, which can contain multiple
    `<mark\>` elements. The “value” and “position” attributes have the same
    meaning as [gid.gtk4.scale.Scale.addMark] parameters of the same name. If
    the element is not empty, its content is taken as the markup to show at
    the mark. It can be translated with the usual ”translatable” and
    “context” attributes.
    
    # Shortcuts and Gestures
    
    [gid.gtk4.popover_menu.PopoverMenu] supports the following keyboard shortcuts:
    
    - Arrow keys, <kbd>+</kbd> and <kbd>-</kbd> will increment or decrement
      by step, or by page when combined with <kbd>Ctrl</kbd>.
    - <kbd>PgUp</kbd> and <kbd>PgDn</kbd> will increment or decrement by page.
    - <kbd>Home</kbd> and <kbd>End</kbd> will set the minimum or maximum value.
    
    # CSS nodes
    
    ```
    scale[.fine-tune][.marks-before][.marks-after]
    ├── [value][.top][.right][.bottom][.left]
    ├── marks.top
    │   ├── mark
    │   ┊    ├── [label]
    │   ┊    ╰── indicator
    ┊   ┊
    │   ╰── mark
    ├── marks.bottom
    │   ├── mark
    │   ┊    ├── indicator
    │   ┊    ╰── [label]
    ┊   ┊
    │   ╰── mark
    ╰── trough
        ├── [fill]
        ├── [highlight]
        ╰── slider
    ```
    
    [gid.gtk4.scale.Scale] has a main CSS node with name scale and a subnode for its contents,
    with subnodes named trough and slider.
    
    The main node gets the style class .fine-tune added when the scale is in
    'fine-tuning' mode.
    
    If the scale has an origin (see [gid.gtk4.scale.Scale.setHasOrigin]), there is
    a subnode with name highlight below the trough node that is used for rendering
    the highlighted part of the trough.
    
    If the scale is showing a fill level (see [gid.gtk4.range.Range.setShowFillLevel]),
    there is a subnode with name fill below the trough node that is used for
    rendering the filled in part of the trough.
    
    If marks are present, there is a marks subnode before or after the trough
    node, below which each mark gets a node with name mark. The marks nodes get
    either the .top or .bottom style class.
    
    The mark node has a subnode named indicator. If the mark has text, it also
    has a subnode named label. When the mark is either above or left of the
    scale, the label subnode is the first when present. Otherwise, the indicator
    subnode is the first.
    
    The main CSS node gets the 'marks-before' and/or 'marks-after' style classes
    added depending on what marks are present.
    
    If the scale is displaying the value (see [gid.gtk4.scale.Scale.drawValue]),
    there is subnode with name value. This node will get the .top or .bottom style
    classes similar to the marks node.
    
    # Accessibility
    
    [gid.gtk4.scale.Scale] uses the [gid.gtk4.types.AccessibleRole.Slider] role.
*/
class Scale : gid.gtk4.range.Range
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
      Get builder for [gid.gtk4.scale.Scale]
      Returns: New builder object
  */
  static ScaleGidBuilder builder() nothrow
  {
    return new ScaleGidBuilder;
  }

  /**
      Get `digits` property.
      Returns: The number of decimal places that are displayed in the value.
  */
  @property int digits() nothrow
  {
    return getDigits();
  }

  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places that are displayed in the value.
  */
  @property void digits(int propval) nothrow
  {
    setDigits(propval);
  }

  /**
      Get `drawValue` property.
      Returns: Whether the current value is displayed as a string next to the slider.
  */
  @property bool drawValue() nothrow
  {
    return getDrawValue();
  }

  /**
      Set `drawValue` property.
      Params:
        propval = Whether the current value is displayed as a string next to the slider.
  */
  @property void drawValue(bool propval) nothrow
  {
    setDrawValue(propval);
  }

  /**
      Get `hasOrigin` property.
      Returns: Whether the scale has an origin.
  */
  @property bool hasOrigin() nothrow
  {
    return getHasOrigin();
  }

  /**
      Set `hasOrigin` property.
      Params:
        propval = Whether the scale has an origin.
  */
  @property void hasOrigin(bool propval) nothrow
  {
    setHasOrigin(propval);
  }

  /**
      Get `valuePos` property.
      Returns: The position in which the current value is displayed.
  */
  @property gid.gtk4.types.PositionType valuePos() nothrow
  {
    return getValuePos();
  }

  /**
      Set `valuePos` property.
      Params:
        propval = The position in which the current value is displayed.
  */
  @property void valuePos(gid.gtk4.types.PositionType propval) nothrow
  {
    setValuePos(propval);
  }

  /**
      Creates a new [gid.gtk4.scale.Scale].
  
      Params:
        orientation = the scale’s orientation.
        adjustment = the [gid.gtk4.adjustment.Adjustment] which sets
            the range of the scale, or null to create a new adjustment.
      Returns: a new [gid.gtk4.scale.Scale]
  */
  this(gid.gtk4.types.Orientation orientation, gid.gtk4.adjustment.Adjustment adjustment = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
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
      Creates a new scale widget with a range from min to max.
      
      The returns scale will have the given orientation and will let the
      user input a number between min and max (including min and max)
      with the increment step. step must be nonzero; it’s the distance
      the slider moves when using the arrow keys to adjust the scale
      value.
      
      Note that the way in which the precision is derived works best if
      step is a power of ten. If the resulting precision is not suitable
      for your needs, use [gid.gtk4.scale.Scale.setDigits] to correct it.
  
      Params:
        orientation = the scale’s orientation.
        min = minimum value
        max = maximum value
        step = step increment (tick size) used with keyboard shortcuts
      Returns: a new [gid.gtk4.scale.Scale]
  */
  static gid.gtk4.scale.Scale newWithRange(gid.gtk4.types.Orientation orientation, double min, double max, double step) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_new_with_range(orientation, min, max, step);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.scale.Scale)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Obtains the coordinates where the scale will draw the
      [gid.pango1.layout.Layout] representing the text in the scale.
      
      Remember when using the [gid.pango1.layout.Layout] function you need to
      convert to and from pixels using `PANGO_PIXELS()` or [gid.pango1.types.SCALE].
      
      If the [gid.gtk4.scale.Scale.drawValue] property is false, the return
      values are undefined.
  
      Params:
        x = location to store X offset of layout
        y = location to store Y offset of layout
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetLayoutOffsets` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
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
      and GTK makes it easy for the user to position the scale exactly at the
      marks value.
      
      If markup is not null, text is shown next to the tick mark.
      
      To remove marks from a scale, use [gid.gtk4.scale.Scale.clearMarks].
  
      Params:
        value = the value at which the mark is placed, must be between
            the lower and upper limits of the scales’ adjustment
        position = where to draw the mark. For a horizontal scale, [gid.gtk4.types.PositionType.Top]
            and [gid.gtk4.types.PositionType.Left] are drawn above the scale, anything else below.
            For a vertical scale, [gid.gtk4.types.PositionType.Left] and [gid.gtk4.types.PositionType.Top] are drawn to
            the left of the scale, anything else to the right.
        markup = Text to be shown at the mark, using Pango markup
  */
  void addMark(double value, gid.gtk4.types.PositionType position, string markup = null) nothrow
  {
    const(char)* _markup = markup.toCString!(No.Malloc, Yes.Nullable);
    gtk_scale_add_mark(cast(GtkScale*)this._cPtr, value, position, _markup);
  }

  /**
      Removes any marks that have been added.
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
      Gets the [gid.pango1.layout.Layout] used to display the scale.
      
      The returned object is owned by the scale so does not need
      to be freed by the caller.
      Returns: the [gid.pango1.layout.Layout]
          for this scale, or null if the [gid.gtk4.scale.Scale.drawValue]
          property is false.
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
      [gid.pango1.layout.Layout] representing the text in the scale.
      
      Remember when using the [gid.pango1.layout.Layout] function you need to
      convert to and from pixels using `PANGO_PIXELS()` or [gid.pango1.types.SCALE].
      
      If the [gid.gtk4.scale.Scale.drawValue] property is false, the return
      values are undefined.
  
      Params:
        x = location to store X offset of layout
        y = location to store Y offset of layout
  */
  void getLayoutOffsets(out int x, out int y) nothrow
  {
    gtk_scale_get_layout_offsets(cast(GtkScale*)this._cPtr, cast(int*)&x, cast(int*)&y);
  }

  /**
      Gets the position in which the current value is displayed.
      Returns: the position in which the current value is displayed
  */
  gid.gtk4.types.PositionType getValuePos() nothrow
  {
    GtkPositionType _cretval;
    _cretval = gtk_scale_get_value_pos(cast(GtkScale*)this._cPtr);
    gid.gtk4.types.PositionType _retval = cast(gid.gtk4.types.PositionType)_cretval;
    return _retval;
  }

  /**
      Sets the number of decimal places that are displayed in the value.
      
      Also causes the value of the adjustment to be rounded to this number
      of digits, so the retrieved value matches the displayed one, if
      [gid.gtk4.scale.Scale.drawValue] is true when the value changes. If
      you want to enforce rounding the value when [gid.gtk4.scale.Scale.drawValue]
      is false, you can set [gid.gtk4.range.Range.roundDigits] instead.
      
      Note that rounding to a small number of digits can interfere with
      the smooth autoscrolling that is built into [gid.gtk4.scale.Scale]. As an alternative,
      you can use [gid.gtk4.scale.Scale.setFormatValueFunc] to format the displayed
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
      func allows you to change how the scale value is displayed.
      
      The given function will return an allocated string representing
      value. That string will then be used to display the scale's value.
      
      If #NULL is passed as func, the value will be displayed on
      its own, rounded according to the value of the
      [gid.gtk4.scale.Scale.digits] property.
  
      Params:
        func = function
            that formats the value
  */
  void setFormatValueFunc(gid.gtk4.types.ScaleFormatValueFunc func = null) nothrow
  {
    extern(C) char* _funcCallback(GtkScale* scale, double value, void* userData) nothrow
    {
      gidAttachThread();
      string _dretval;
      auto _dlg = cast(gid.gtk4.types.ScaleFormatValueFunc*)userData;

      try
      {
        _dretval = (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.scale.Scale)(cast(void*)scale, No.Take), value);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.ScaleFormatValueFunc");
      }
      auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_scale_set_format_value_func(cast(GtkScale*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets whether the scale has an origin.
      
      If [gid.gtk4.scale.Scale.hasOrigin] is set to true (the default),
      the scale will highlight the part of the trough between the origin
      (bottom or left side) and the current value.
  
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
  void setValuePos(gid.gtk4.types.PositionType pos) nothrow
  {
    gtk_scale_set_value_pos(cast(GtkScale*)this._cPtr, pos);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Scale
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.scale.Scale), T.stringof ~ " is not derived from gid.gtk4.scale.Scale");

    gid.gtk4.range.Range._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetLayoutOffsets", true)[0]) == gid.gtk4.scale.Scale))
      _installVfunc(klass, "get_layout_offsets");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkScaleClass*)klass;

    switch (vfunc)
    {
      case "get_layout_offsets":
      {
        static extern(C) void _vfuncGetLayoutOffsetsTramp(GtkScale* scale, int* x, int* y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk4.scale.Scale)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)scale);
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
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.scale.Scale.vfuncGetLayoutOffsets");
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

/// Fluent builder implementation template for [gid.gtk4.scale.Scale]
class ScaleGidBuilderImpl(T) : gid.gtk4.range.RangeGidBuilderImpl!T
{


  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places that are displayed in the value.
      Returns: Builder instance for fluent chaining
  */
  T digits(int propval) nothrow
  {
    return setProperty("digits", propval);
  }

  /**
      Set `drawValue` property.
      Params:
        propval = Whether the current value is displayed as a string next to the slider.
      Returns: Builder instance for fluent chaining
  */
  T drawValue(bool propval) nothrow
  {
    return setProperty("draw-value", propval);
  }

  /**
      Set `hasOrigin` property.
      Params:
        propval = Whether the scale has an origin.
      Returns: Builder instance for fluent chaining
  */
  T hasOrigin(bool propval) nothrow
  {
    return setProperty("has-origin", propval);
  }

  /**
      Set `valuePos` property.
      Params:
        propval = The position in which the current value is displayed.
      Returns: Builder instance for fluent chaining
  */
  T valuePos(gid.gtk4.types.PositionType propval) nothrow
  {
    return setProperty("value-pos", propval);
  }
}

/// Fluent builder for [gid.gtk4.scale.Scale]
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
