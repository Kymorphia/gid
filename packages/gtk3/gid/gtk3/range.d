/// Module for [Range] class
module gid.gtk3.range;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gdk3.rectangle;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.adjustment;
import gid.gtk3.border;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkRange is the common base class for widgets which visualize an
    adjustment, e.g #GtkScale or #GtkScrollbar.
    
    Apart from signals for monitoring the parameters of the adjustment,
    #GtkRange provides properties and methods for influencing the sensitivity
    of the “steppers”. It also provides properties and methods for setting a
    “fill level” on range widgets. See [gid.gtk4.range.Range.setFillLevel].
*/
@gidGir("Range", "RangeClass")
class Range : gid.gtk3.widget.Widget, gid.gtk3.orientable.Orientable
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
    return cast(void function())gtk_range_get_type != &gidSymbolNotFound ? gtk_range_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRange";
  }

  /** Returns `this`, for use in `with` statements. */
  override Range self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.range.Range]
      Returns: New builder object
  */
  static RangeGidBuilder builder() nothrow
  {
    return new RangeGidBuilder;
  }

  /** */
  @property gid.gtk3.adjustment.Adjustment adjustment() nothrow
  {
    return getAdjustment();
  }

  /** */
  @property void adjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    setAdjustment(propval);
  }

  /**
      Get `fillLevel` property.
      Returns: The fill level (e.g. prebuffering of a network stream).
        See [gid.gtk4.range.Range.setFillLevel].
  */
  @property double fillLevel() nothrow
  {
    return getFillLevel();
  }

  /**
      Set `fillLevel` property.
      Params:
        propval = The fill level (e.g. prebuffering of a network stream).
          See [gid.gtk4.range.Range.setFillLevel].
  */
  @property void fillLevel(double propval) nothrow
  {
    setFillLevel(propval);
  }

  /** */
  @property bool inverted() nothrow
  {
    return getInverted();
  }

  /** */
  @property void inverted(bool propval) nothrow
  {
    setInverted(propval);
  }

  /** */
  @property gid.gtk3.types.SensitivityType lowerStepperSensitivity() nothrow
  {
    return getLowerStepperSensitivity();
  }

  /** */
  @property void lowerStepperSensitivity(gid.gtk3.types.SensitivityType propval) nothrow
  {
    setLowerStepperSensitivity(propval);
  }

  /**
      Get `restrictToFillLevel` property.
      Returns: The restrict-to-fill-level property controls whether slider
        movement is restricted to an upper boundary set by the
        fill level. See [gid.gtk4.range.Range.setRestrictToFillLevel].
  */
  @property bool restrictToFillLevel() nothrow
  {
    return getRestrictToFillLevel();
  }

  /**
      Set `restrictToFillLevel` property.
      Params:
        propval = The restrict-to-fill-level property controls whether slider
          movement is restricted to an upper boundary set by the
          fill level. See [gid.gtk4.range.Range.setRestrictToFillLevel].
  */
  @property void restrictToFillLevel(bool propval) nothrow
  {
    setRestrictToFillLevel(propval);
  }

  /**
      Get `roundDigits` property.
      Returns: The number of digits to round the value to when
        it changes, or -1. See #GtkRange::change-value.
  */
  @property int roundDigits() nothrow
  {
    return getRoundDigits();
  }

  /**
      Set `roundDigits` property.
      Params:
        propval = The number of digits to round the value to when
          it changes, or -1. See #GtkRange::change-value.
  */
  @property void roundDigits(int propval) nothrow
  {
    setRoundDigits(propval);
  }

  /**
      Get `showFillLevel` property.
      Returns: The show-fill-level property controls whether fill level indicator
        graphics are displayed on the trough. See
        [gid.gtk4.range.Range.setShowFillLevel].
  */
  @property bool showFillLevel() nothrow
  {
    return getShowFillLevel();
  }

  /**
      Set `showFillLevel` property.
      Params:
        propval = The show-fill-level property controls whether fill level indicator
          graphics are displayed on the trough. See
          [gid.gtk4.range.Range.setShowFillLevel].
  */
  @property void showFillLevel(bool propval) nothrow
  {
    setShowFillLevel(propval);
  }

  /** */
  @property gid.gtk3.types.SensitivityType upperStepperSensitivity() nothrow
  {
    return getUpperStepperSensitivity();
  }

  /** */
  @property void upperStepperSensitivity(gid.gtk3.types.SensitivityType propval) nothrow
  {
    setUpperStepperSensitivity(propval);
  }

  mixin OrientableT!();

  /** */
  protected void vfuncAdjustBounds(double newValue)
  {
    auto _klass = cast(GtkRangeClass*)_vfuncClass;
    if (!_klass.adjustBounds)
      return;

    _klass.adjustBounds(cast(GtkRange*)this._cPtr, newValue);
  }

  /** */
  protected bool vfuncChangeValue(gid.gtk3.types.ScrollType scroll, double newValue)
  {
    auto _klass = cast(GtkRangeClass*)_vfuncClass;
    if (!_klass.changeValue)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.changeValue(cast(GtkRange*)this._cPtr, scroll, newValue);
    return _retval;
  }

  /** */
  protected void vfuncGetRangeBorder(gid.gtk3.border.Border border)
  {
    auto _klass = cast(GtkRangeClass*)_vfuncClass;
    if (!_klass.getRangeBorder)
      return;

    _klass.getRangeBorder(cast(GtkRange*)this._cPtr, cast(GtkBorder*)&border);
  }

  /** */
  protected void vfuncMoveSlider(gid.gtk3.types.ScrollType scroll)
  {
    auto _klass = cast(GtkRangeClass*)_vfuncClass;
    if (!_klass.moveSlider)
      return;

    _klass.moveSlider(cast(GtkRange*)this._cPtr, scroll);
  }

  /** */
  protected void vfuncValueChanged()
  {
    auto _klass = cast(GtkRangeClass*)_vfuncClass;
    if (!_klass.valueChanged)
      return;

    _klass.valueChanged(cast(GtkRange*)this._cPtr);
  }

  /**
      Get the #GtkAdjustment which is the “model” object for #GtkRange.
      See [gid.gtk4.range.Range.setAdjustment] for details.
      The return value does not have a reference added, so should not
      be unreferenced.
      Returns: a #GtkAdjustment
  */
  gid.gtk3.adjustment.Adjustment getAdjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_range_get_adjustment(cast(GtkRange*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current position of the fill level indicator.
      Returns: The current fill level
  */
  double getFillLevel() nothrow
  {
    double _retval;
    _retval = gtk_range_get_fill_level(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.range.Range.setFlippable].
      Returns: true if the range is flippable
  */
  bool getFlippable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_flippable(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk4.range.Range.setInverted].
      Returns: true if the range is inverted
  */
  bool getInverted() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_inverted(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets the sensitivity policy for the stepper that points to the
      'lower' end of the GtkRange’s adjustment.
      Returns: The lower stepper’s sensitivity policy.
  */
  gid.gtk3.types.SensitivityType getLowerStepperSensitivity() nothrow
  {
    GtkSensitivityType _cretval;
    _cretval = gtk_range_get_lower_stepper_sensitivity(cast(GtkRange*)this._cPtr);
    gid.gtk3.types.SensitivityType _retval = cast(gid.gtk3.types.SensitivityType)_cretval;
    return _retval;
  }

  /**
      This function is useful mainly for #GtkRange subclasses.
      
      See [gid.gtk3.range.Range.setMinSliderSize].
      Returns: The minimum size of the range’s slider.
  
      Deprecated: Use the min-height/min-width CSS properties on the slider
          node.
  */
  int getMinSliderSize() nothrow
  {
    int _retval;
    _retval = gtk_range_get_min_slider_size(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      This function returns the area that contains the range’s trough
      and its steppers, in widget->window coordinates.
      
      This function is useful mainly for #GtkRange subclasses.
  
      Params:
        rangeRect = return location for the range rectangle
  */
  void getRangeRect(out gid.gdk3.rectangle.Rectangle rangeRect) nothrow
  {
    gtk_range_get_range_rect(cast(GtkRange*)this._cPtr, cast(GdkRectangle*)&rangeRect);
  }

  /**
      Gets whether the range is restricted to the fill level.
      Returns: true if range is restricted to the fill level.
  */
  bool getRestrictToFillLevel() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_restrict_to_fill_level(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of digits to round the value to when
      it changes. See #GtkRange::change-value.
      Returns: the number of digits to round to
  */
  int getRoundDigits() nothrow
  {
    int _retval;
    _retval = gtk_range_get_round_digits(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the range displays the fill level graphically.
      Returns: true if range shows the fill level.
  */
  bool getShowFillLevel() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_show_fill_level(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      This function returns sliders range along the long dimension,
      in widget->window coordinates.
      
      This function is useful mainly for #GtkRange subclasses.
  
      Params:
        sliderStart = return location for the slider's
              start, or null
        sliderEnd = return location for the slider's
              end, or null
  */
  void getSliderRange(out int sliderStart, out int sliderEnd) nothrow
  {
    gtk_range_get_slider_range(cast(GtkRange*)this._cPtr, cast(int*)&sliderStart, cast(int*)&sliderEnd);
  }

  /**
      This function is useful mainly for #GtkRange subclasses.
      
      See [gid.gtk4.range.Range.setSliderSizeFixed].
      Returns: whether the range’s slider has a fixed size.
  */
  bool getSliderSizeFixed() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_slider_size_fixed(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets the sensitivity policy for the stepper that points to the
      'upper' end of the GtkRange’s adjustment.
      Returns: The upper stepper’s sensitivity policy.
  */
  gid.gtk3.types.SensitivityType getUpperStepperSensitivity() nothrow
  {
    GtkSensitivityType _cretval;
    _cretval = gtk_range_get_upper_stepper_sensitivity(cast(GtkRange*)this._cPtr);
    gid.gtk3.types.SensitivityType _retval = cast(gid.gtk3.types.SensitivityType)_cretval;
    return _retval;
  }

  /**
      Gets the current value of the range.
      Returns: current value of the range.
  */
  double getValue() nothrow
  {
    double _retval;
    _retval = gtk_range_get_value(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Sets the adjustment to be used as the “model” object for this range
      widget. The adjustment indicates the current range value, the
      minimum and maximum range values, the step/page increments used
      for keybindings and scrolling, and the page size. The page size
      is normally 0 for #GtkScale and nonzero for #GtkScrollbar, and
      indicates the size of the visible area of the widget being scrolled.
      The page size affects the size of the scrollbar slider.
  
      Params:
        adjustment = a #GtkAdjustment
  */
  void setAdjustment(gid.gtk3.adjustment.Adjustment adjustment) nothrow
  {
    gtk_range_set_adjustment(cast(GtkRange*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Set the new position of the fill level indicator.
      
      The “fill level” is probably best described by its most prominent
      use case, which is an indicator for the amount of pre-buffering in
      a streaming media player. In that use case, the value of the range
      would indicate the current play position, and the fill level would
      be the position up to which the file/stream has been downloaded.
      
      This amount of prebuffering can be displayed on the range’s trough
      and is themeable separately from the trough. To enable fill level
      display, use [gid.gtk4.range.Range.setShowFillLevel]. The range defaults
      to not showing the fill level.
      
      Additionally, it’s possible to restrict the range’s slider position
      to values which are smaller than the fill level. This is controller
      by [gid.gtk4.range.Range.setRestrictToFillLevel] and is by default
      enabled.
  
      Params:
        fillLevel = the new position of the fill level indicator
  */
  void setFillLevel(double fillLevel) nothrow
  {
    gtk_range_set_fill_level(cast(GtkRange*)this._cPtr, fillLevel);
  }

  /**
      If a range is flippable, it will switch its direction if it is
      horizontal and its direction is [gid.gtk4.types.TextDirection.Rtl].
      
      See [gid.gtk4.widget.Widget.getDirection].
  
      Params:
        flippable = true to make the range flippable
  */
  void setFlippable(bool flippable) nothrow
  {
    gtk_range_set_flippable(cast(GtkRange*)this._cPtr, flippable);
  }

  /**
      Sets the step and page sizes for the range.
      The step size is used when the user clicks the #GtkScrollbar
      arrows or moves #GtkScale via arrow keys. The page size
      is used for example when moving via Page Up or Page Down keys.
  
      Params:
        step = step size
        page = page size
  */
  void setIncrements(double step, double page) nothrow
  {
    gtk_range_set_increments(cast(GtkRange*)this._cPtr, step, page);
  }

  /**
      Ranges normally move from lower to higher values as the
      slider moves from top to bottom or left to right. Inverted
      ranges have higher values at the top or on the right rather than
      on the bottom or left.
  
      Params:
        setting = true to invert the range
  */
  void setInverted(bool setting) nothrow
  {
    gtk_range_set_inverted(cast(GtkRange*)this._cPtr, setting);
  }

  /**
      Sets the sensitivity policy for the stepper that points to the
      'lower' end of the GtkRange’s adjustment.
  
      Params:
        sensitivity = the lower stepper’s sensitivity policy.
  */
  void setLowerStepperSensitivity(gid.gtk3.types.SensitivityType sensitivity) nothrow
  {
    gtk_range_set_lower_stepper_sensitivity(cast(GtkRange*)this._cPtr, sensitivity);
  }

  /**
      Sets the minimum size of the range’s slider.
      
      This function is useful mainly for #GtkRange subclasses.
  
      Params:
        minSize = The slider’s minimum size
  
      Deprecated: Use the min-height/min-width CSS properties on the slider
          node.
  */
  void setMinSliderSize(int minSize) nothrow
  {
    gtk_range_set_min_slider_size(cast(GtkRange*)this._cPtr, minSize);
  }

  /**
      Sets the allowable values in the #GtkRange, and clamps the range
      value to be between min and max. (If the range has a non-zero
      page size, it is clamped between min and max - page-size.)
  
      Params:
        min = minimum range value
        max = maximum range value
  */
  void setRange(double min, double max) nothrow
  {
    gtk_range_set_range(cast(GtkRange*)this._cPtr, min, max);
  }

  /**
      Sets whether the slider is restricted to the fill level. See
      [gid.gtk4.range.Range.setFillLevel] for a general description of the fill
      level concept.
  
      Params:
        restrictToFillLevel = Whether the fill level restricts slider movement.
  */
  void setRestrictToFillLevel(bool restrictToFillLevel) nothrow
  {
    gtk_range_set_restrict_to_fill_level(cast(GtkRange*)this._cPtr, restrictToFillLevel);
  }

  /**
      Sets the number of digits to round the value to when
      it changes. See #GtkRange::change-value.
  
      Params:
        roundDigits = the precision in digits, or -1
  */
  void setRoundDigits(int roundDigits) nothrow
  {
    gtk_range_set_round_digits(cast(GtkRange*)this._cPtr, roundDigits);
  }

  /**
      Sets whether a graphical fill level is show on the trough. See
      [gid.gtk4.range.Range.setFillLevel] for a general description of the fill
      level concept.
  
      Params:
        showFillLevel = Whether a fill level indicator graphics is shown.
  */
  void setShowFillLevel(bool showFillLevel) nothrow
  {
    gtk_range_set_show_fill_level(cast(GtkRange*)this._cPtr, showFillLevel);
  }

  /**
      Sets whether the range’s slider has a fixed size, or a size that
      depends on its adjustment’s page size.
      
      This function is useful mainly for #GtkRange subclasses.
  
      Params:
        sizeFixed = true to make the slider size constant
  */
  void setSliderSizeFixed(bool sizeFixed) nothrow
  {
    gtk_range_set_slider_size_fixed(cast(GtkRange*)this._cPtr, sizeFixed);
  }

  /**
      Sets the sensitivity policy for the stepper that points to the
      'upper' end of the GtkRange’s adjustment.
  
      Params:
        sensitivity = the upper stepper’s sensitivity policy.
  */
  void setUpperStepperSensitivity(gid.gtk3.types.SensitivityType sensitivity) nothrow
  {
    gtk_range_set_upper_stepper_sensitivity(cast(GtkRange*)this._cPtr, sensitivity);
  }

  /**
      Sets the current value of the range; if the value is outside the
      minimum or maximum range values, it will be clamped to fit inside
      them. The range emits the #GtkRange::value-changed signal if the
      value changes.
  
      Params:
        value = new value of the range
  */
  void setValue(double value) nothrow
  {
    gtk_range_set_value(cast(GtkRange*)this._cPtr, value);
  }

  /**
      Connect to `AdjustBounds` signal.
  
      Emitted before clamping a value, to give the application a
        chance to adjust the bounds.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double value, gid.gtk3.range.Range range)`
  
          `value` the value before we clamp (optional)
  
          `range` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectAdjustBounds(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.range.Range)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.adjustBounds");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("adjust-bounds", closure, after);
  }

  /**
      Connect to `ChangeValue` signal.
  
      The #GtkRange::change-value signal is emitted when a scroll action is
        performed on a range.  It allows an application to determine the
        type of scroll event that occurred and the resultant new value.
        The application can handle the event itself and return true to
        prevent further processing.  Or, by returning false, it can pass
        the event to other handlers until the default GTK+ handler is
        reached.
        
        The value parameter is unrounded.  An application that overrides
        the GtkRange::change-value signal is responsible for clamping the
        value to the desired number of decimal digits; the default GTK+
        handler clamps the value based on #GtkRange:round-digits.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.gtk3.types.ScrollType scroll, double value, gid.gtk3.range.Range range)`
  
          `scroll` the type of scroll action that was performed (optional)
  
          `value` the new value resulting from the scroll action (optional)
  
          `range` the instance the signal is connected to (optional)
  
          `Returns` true to prevent other handlers from being invoked for
                the signal, false to propagate the signal further
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChangeValue(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gtk3.range.Range)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.changeValue");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-value", closure, after);
  }

  /**
      Connect to `MoveSlider` signal.
  
      Virtual function that moves the slider. Used for keybindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.types.ScrollType step, gid.gtk3.range.Range range)`
  
          `step` how to move the slider (optional)
  
          `range` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveSlider(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.gtk3.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.range.Range)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.moveSlider");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-slider", closure, after);
  }

  /**
      Connect to `ValueChanged` signal.
  
      Emitted when the range value changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.range.Range range)`
  
          `range` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.range.Range)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.valueChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Range
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.range.Range), T.stringof ~ " is not derived from gid.gtk3.range.Range");

    gid.gtk3.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncAdjustBounds", true)[0]) == gid.gtk3.range.Range))
      _installVfunc(klass, "adjust_bounds");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChangeValue", true)[0]) == gid.gtk3.range.Range))
      _installVfunc(klass, "change_value");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetRangeBorder", true)[0]) == gid.gtk3.range.Range))
      _installVfunc(klass, "get_range_border");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveSlider", true)[0]) == gid.gtk3.range.Range))
      _installVfunc(klass, "move_slider");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncValueChanged", true)[0]) == gid.gtk3.range.Range))
      _installVfunc(klass, "value_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkRangeClass*)klass;

    switch (vfunc)
    {
      case "adjust_bounds":
      {
        static extern(C) void _vfuncAdjustBoundsTramp(GtkRange* range, double newValue) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.range.Range)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)range);
          if (!_obj)
          {
            auto _klass = cast(GtkRangeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)range);
            if (_klass.adjustBounds)
              return (cast(typeof(&_vfuncAdjustBoundsTramp))_klass.adjustBounds)(range, newValue);
            return;
          }

          try
          {
            _obj.vfuncAdjustBounds(newValue);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.vfuncAdjustBounds");
          }
        }

        _klass.adjustBounds = cast(typeof(_klass.adjustBounds))&_vfuncAdjustBoundsTramp;
        break;
      }
      case "change_value":
      {
        static extern(C) gboolean _vfuncChangeValueTramp(GtkRange* range, GtkScrollType scroll, double newValue) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.range.Range)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)range);
          if (!_obj)
          {
            auto _klass = cast(GtkRangeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)range);
            if (_klass.changeValue)
              return (cast(typeof(&_vfuncChangeValueTramp))_klass.changeValue)(range, scroll, newValue);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncChangeValue(scroll, newValue);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.vfuncChangeValue");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.changeValue = cast(typeof(_klass.changeValue))&_vfuncChangeValueTramp;
        break;
      }
      case "get_range_border":
      {
        static extern(C) void _vfuncGetRangeBorderTramp(GtkRange* range, GtkBorder* border) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.range.Range)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)range);
          if (!_obj)
          {
            auto _klass = cast(GtkRangeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)range);
            if (_klass.getRangeBorder)
              return (cast(typeof(&_vfuncGetRangeBorderTramp))_klass.getRangeBorder)(range, border);
            return;
          }

          try
          {
            _obj.vfuncGetRangeBorder(*cast(gid.gtk3.border.Border*)border);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.vfuncGetRangeBorder");
          }
        }

        _klass.getRangeBorder = cast(typeof(_klass.getRangeBorder))&_vfuncGetRangeBorderTramp;
        break;
      }
      case "move_slider":
      {
        static extern(C) void _vfuncMoveSliderTramp(GtkRange* range, GtkScrollType scroll) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.range.Range)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)range);
          if (!_obj)
          {
            auto _klass = cast(GtkRangeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)range);
            if (_klass.moveSlider)
              return (cast(typeof(&_vfuncMoveSliderTramp))_klass.moveSlider)(range, scroll);
            return;
          }

          try
          {
            _obj.vfuncMoveSlider(scroll);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.vfuncMoveSlider");
          }
        }

        _klass.moveSlider = cast(typeof(_klass.moveSlider))&_vfuncMoveSliderTramp;
        break;
      }
      case "value_changed":
      {
        static extern(C) void _vfuncValueChangedTramp(GtkRange* range) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.range.Range)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)range);
          if (!_obj)
          {
            auto _klass = cast(GtkRangeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)range);
            if (_klass.valueChanged)
              return (cast(typeof(&_vfuncValueChangedTramp))_klass.valueChanged)(range);
            return;
          }

          try
          {
            _obj.vfuncValueChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.range.Range.vfuncValueChanged");
          }
        }

        _klass.valueChanged = cast(typeof(_klass.valueChanged))&_vfuncValueChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.range.Range]
class RangeGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /** */
  T adjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    return setProperty("adjustment", propval);
  }

  /**
      Set `fillLevel` property.
      Params:
        propval = The fill level (e.g. prebuffering of a network stream).
          See [gid.gtk4.range.Range.setFillLevel].
      Returns: Builder instance for fluent chaining
  */
  T fillLevel(double propval) nothrow
  {
    return setProperty("fill-level", propval);
  }

  /** */
  T inverted(bool propval) nothrow
  {
    return setProperty("inverted", propval);
  }

  /** */
  T lowerStepperSensitivity(gid.gtk3.types.SensitivityType propval) nothrow
  {
    return setProperty("lower-stepper-sensitivity", propval);
  }

  /**
      Set `restrictToFillLevel` property.
      Params:
        propval = The restrict-to-fill-level property controls whether slider
          movement is restricted to an upper boundary set by the
          fill level. See [gid.gtk4.range.Range.setRestrictToFillLevel].
      Returns: Builder instance for fluent chaining
  */
  T restrictToFillLevel(bool propval) nothrow
  {
    return setProperty("restrict-to-fill-level", propval);
  }

  /**
      Set `roundDigits` property.
      Params:
        propval = The number of digits to round the value to when
          it changes, or -1. See #GtkRange::change-value.
      Returns: Builder instance for fluent chaining
  */
  T roundDigits(int propval) nothrow
  {
    return setProperty("round-digits", propval);
  }

  /**
      Set `showFillLevel` property.
      Params:
        propval = The show-fill-level property controls whether fill level indicator
          graphics are displayed on the trough. See
          [gid.gtk4.range.Range.setShowFillLevel].
      Returns: Builder instance for fluent chaining
  */
  T showFillLevel(bool propval) nothrow
  {
    return setProperty("show-fill-level", propval);
  }

  /** */
  T upperStepperSensitivity(gid.gtk3.types.SensitivityType propval) nothrow
  {
    return setProperty("upper-stepper-sensitivity", propval);
  }
}

/// Fluent builder for [gid.gtk3.range.Range]
final class RangeGidBuilder : RangeGidBuilderImpl!RangeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Range build() nothrow
  {
    return new Range(cast(void*)createGObject(Range._getGType), Yes.Take);
  }
}
