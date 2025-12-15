/// Module for [Range] class
module gtk.range;

import gdk.rectangle;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.accessible_range;
import gtk.accessible_range_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.range.Range] is the common base class for widgets which visualize an
    adjustment.
    
    Widgets that are derived from [gtk.range.Range] include
    [gtk.scale.Scale] and [gtk.scrollbar.Scrollbar].
    
    Apart from signals for monitoring the parameters of the adjustment,
    [gtk.range.Range] provides properties and methods for setting a
    “fill level” on range widgets. See [gtk.range.Range.setFillLevel].
*/
class Range : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.orientable.Orientable
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
    return cast(void function())gtk_range_get_type != &gidSymbolNotFound ? gtk_range_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Range self()
  {
    return this;
  }

  /**
      Get `adjustment` property.
      Returns: The adjustment that is controlled by the range.
  */
  @property gtk.adjustment.Adjustment adjustment()
  {
    return getAdjustment();
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The adjustment that is controlled by the range.
  */
  @property void adjustment(gtk.adjustment.Adjustment propval)
  {
    return setAdjustment(propval);
  }

  /**
      Get `fillLevel` property.
      Returns: The fill level (e.g. prebuffering of a network stream).
  */
  @property double fillLevel()
  {
    return getFillLevel();
  }

  /**
      Set `fillLevel` property.
      Params:
        propval = The fill level (e.g. prebuffering of a network stream).
  */
  @property void fillLevel(double propval)
  {
    return setFillLevel(propval);
  }

  /**
      Get `inverted` property.
      Returns: If true, the direction in which the slider moves is inverted.
  */
  @property bool inverted()
  {
    return getInverted();
  }

  /**
      Set `inverted` property.
      Params:
        propval = If true, the direction in which the slider moves is inverted.
  */
  @property void inverted(bool propval)
  {
    return setInverted(propval);
  }

  /**
      Get `restrictToFillLevel` property.
      Returns: Controls whether slider movement is restricted to an
      upper boundary set by the fill level.
  */
  @property bool restrictToFillLevel()
  {
    return getRestrictToFillLevel();
  }

  /**
      Set `restrictToFillLevel` property.
      Params:
        propval = Controls whether slider movement is restricted to an
        upper boundary set by the fill level.
  */
  @property void restrictToFillLevel(bool propval)
  {
    return setRestrictToFillLevel(propval);
  }

  /**
      Get `roundDigits` property.
      Returns: The number of digits to round the value to when
      it changes.
      
      See `signal@Gtk.Range::change-value`.
  */
  @property int roundDigits()
  {
    return getRoundDigits();
  }

  /**
      Set `roundDigits` property.
      Params:
        propval = The number of digits to round the value to when
        it changes.
        
        See `signal@Gtk.Range::change-value`.
  */
  @property void roundDigits(int propval)
  {
    return setRoundDigits(propval);
  }

  /**
      Get `showFillLevel` property.
      Returns: Controls whether fill level indicator graphics are displayed
      on the trough.
  */
  @property bool showFillLevel()
  {
    return getShowFillLevel();
  }

  /**
      Set `showFillLevel` property.
      Params:
        propval = Controls whether fill level indicator graphics are displayed
        on the trough.
  */
  @property void showFillLevel(bool propval)
  {
    return setShowFillLevel(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Get the adjustment which is the “model” object for [gtk.range.Range].
      Returns: a [gtk.adjustment.Adjustment]
  */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_range_get_adjustment(cast(GtkRange*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current position of the fill level indicator.
      Returns: The current fill level
  */
  double getFillLevel()
  {
    double _retval;
    _retval = gtk_range_get_fill_level(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the [gtk.range.Range] respects text direction.
      
      See [gtk.range.Range.setFlippable].
      Returns: true if the range is flippable
  */
  bool getFlippable()
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_flippable(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the range is inverted.
      
      See [gtk.range.Range.setInverted].
      Returns: true if the range is inverted
  */
  bool getInverted()
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_inverted(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      This function returns the area that contains the range’s trough,
      in coordinates relative to range's origin.
      
      This function is useful mainly for [gtk.range.Range] subclasses.
  
      Params:
        rangeRect = return location for the range rectangle
  */
  void getRangeRect(out gdk.rectangle.Rectangle rangeRect)
  {
    GdkRectangle _rangeRect;
    gtk_range_get_range_rect(cast(GtkRange*)this._cPtr, &_rangeRect);
    rangeRect = new gdk.rectangle.Rectangle(cast(void*)&_rangeRect, No.Take);
  }

  /**
      Gets whether the range is restricted to the fill level.
      Returns: true if range is restricted to the fill level.
  */
  bool getRestrictToFillLevel()
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_restrict_to_fill_level(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of digits to round the value to when
      it changes.
      
      See `signalGtk.Range::change-value`.
      Returns: the number of digits to round to
  */
  int getRoundDigits()
  {
    int _retval;
    _retval = gtk_range_get_round_digits(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the range displays the fill level graphically.
      Returns: true if range shows the fill level.
  */
  bool getShowFillLevel()
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_show_fill_level(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      This function returns sliders range along the long dimension,
      in widget->window coordinates.
      
      This function is useful mainly for [gtk.range.Range] subclasses.
  
      Params:
        sliderStart = return location for the slider's start
        sliderEnd = return location for the slider's end
  */
  void getSliderRange(out int sliderStart, out int sliderEnd)
  {
    gtk_range_get_slider_range(cast(GtkRange*)this._cPtr, cast(int*)&sliderStart, cast(int*)&sliderEnd);
  }

  /**
      This function is useful mainly for [gtk.range.Range] subclasses.
      
      See [gtk.range.Range.setSliderSizeFixed].
      Returns: whether the range’s slider has a fixed size.
  */
  bool getSliderSizeFixed()
  {
    bool _retval;
    _retval = cast(bool)gtk_range_get_slider_size_fixed(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current value of the range.
      Returns: current value of the range.
  */
  double getValue()
  {
    double _retval;
    _retval = gtk_range_get_value(cast(GtkRange*)this._cPtr);
    return _retval;
  }

  /**
      Sets the adjustment to be used as the “model” object for the [gtk.range.Range]
      
      The adjustment indicates the current range value, the minimum and
      maximum range values, the step/page increments used for keybindings
      and scrolling, and the page size.
      
      The page size is normally 0 for [gtk.scale.Scale] and nonzero for [gtk.scrollbar.Scrollbar],
      and indicates the size of the visible area of the widget being scrolled.
      The page size affects the size of the scrollbar slider.
  
      Params:
        adjustment = a [gtk.adjustment.Adjustment]
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment)
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
      display, use [gtk.range.Range.setShowFillLevel]. The range defaults
      to not showing the fill level.
      
      Additionally, it’s possible to restrict the range’s slider position
      to values which are smaller than the fill level. This is controlled
      by [gtk.range.Range.setRestrictToFillLevel] and is by default
      enabled.
  
      Params:
        fillLevel = the new position of the fill level indicator
  */
  void setFillLevel(double fillLevel)
  {
    gtk_range_set_fill_level(cast(GtkRange*)this._cPtr, fillLevel);
  }

  /**
      Sets whether the [gtk.range.Range] respects text direction.
      
      If a range is flippable, it will switch its direction
      if it is horizontal and its direction is [gtk.types.TextDirection.Rtl].
      
      See [gtk.widget.Widget.getDirection].
  
      Params:
        flippable = true to make the range flippable
  */
  void setFlippable(bool flippable)
  {
    gtk_range_set_flippable(cast(GtkRange*)this._cPtr, flippable);
  }

  /**
      Sets the step and page sizes for the range.
      
      The step size is used when the user clicks the [gtk.scrollbar.Scrollbar]
      arrows or moves a [gtk.scale.Scale] via arrow keys. The page size
      is used for example when moving via Page Up or Page Down keys.
  
      Params:
        step = step size
        page = page size
  */
  void setIncrements(double step, double page)
  {
    gtk_range_set_increments(cast(GtkRange*)this._cPtr, step, page);
  }

  /**
      Sets whether to invert the range.
      
      Ranges normally move from lower to higher values as the
      slider moves from top to bottom or left to right. Inverted
      ranges have higher values at the top or on the right rather
      than on the bottom or left.
  
      Params:
        setting = true to invert the range
  */
  void setInverted(bool setting)
  {
    gtk_range_set_inverted(cast(GtkRange*)this._cPtr, setting);
  }

  /**
      Sets the allowable values in the [gtk.range.Range].
      
      The range value is clamped to be between min and max.
      (If the range has a non-zero page size, it is clamped
      between min and max - page-size.)
  
      Params:
        min = minimum range value
        max = maximum range value
  */
  void setRange(double min, double max)
  {
    gtk_range_set_range(cast(GtkRange*)this._cPtr, min, max);
  }

  /**
      Sets whether the slider is restricted to the fill level.
      
      See [gtk.range.Range.setFillLevel] for a general description
      of the fill level concept.
  
      Params:
        restrictToFillLevel = Whether the fill level restricts slider movement.
  */
  void setRestrictToFillLevel(bool restrictToFillLevel)
  {
    gtk_range_set_restrict_to_fill_level(cast(GtkRange*)this._cPtr, restrictToFillLevel);
  }

  /**
      Sets the number of digits to round the value to when
      it changes.
      
      See `signalGtk.Range::change-value`.
  
      Params:
        roundDigits = the precision in digits, or -1
  */
  void setRoundDigits(int roundDigits)
  {
    gtk_range_set_round_digits(cast(GtkRange*)this._cPtr, roundDigits);
  }

  /**
      Sets whether a graphical fill level is show on the trough.
      
      See [gtk.range.Range.setFillLevel] for a general description
      of the fill level concept.
  
      Params:
        showFillLevel = Whether a fill level indicator graphics is shown.
  */
  void setShowFillLevel(bool showFillLevel)
  {
    gtk_range_set_show_fill_level(cast(GtkRange*)this._cPtr, showFillLevel);
  }

  /**
      Sets whether the range’s slider has a fixed size, or a size that
      depends on its adjustment’s page size.
      
      This function is useful mainly for [gtk.range.Range] subclasses.
  
      Params:
        sizeFixed = true to make the slider size constant
  */
  void setSliderSizeFixed(bool sizeFixed)
  {
    gtk_range_set_slider_size_fixed(cast(GtkRange*)this._cPtr, sizeFixed);
  }

  /**
      Sets the current value of the range.
      
      If the value is outside the minimum or maximum range values,
      it will be clamped to fit inside them. The range emits the
      `signalGtk.Range::value-changed` signal if the value changes.
  
      Params:
        value = new value of the range
  */
  void setValue(double value)
  {
    gtk_range_set_value(cast(GtkRange*)this._cPtr, value);
  }

  /**
      Connect to `AdjustBounds` signal.
  
      Emitted before clamping a value, to give the application a
      chance to adjust the bounds.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double value, gtk.range.Range range))
  
          `value` the value before we clamp (optional)
  
          `range` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectAdjustBounds(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.range.Range)))
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
    return connectSignalClosure("adjust-bounds", closure, after);
  }

  /**
      Connect to `ChangeValue` signal.
  
      Emitted when a scroll action is performed on a range.
      
      It allows an application to determine the type of scroll event
      that occurred and the resultant new value. The application can
      handle the event itself and return true to prevent further
      processing. Or, by returning false, it can pass the event to
      other handlers until the default GTK handler is reached.
      
      The value parameter is unrounded. An application that overrides
      the ::change-value signal is responsible for clamping the value
      to the desired number of decimal digits; the default GTK
      handler clamps the value based on `propertyGtk.Range:round-digits`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.types.ScrollType scroll, double value, gtk.range.Range range))
  
          `scroll` the type of scroll action that was performed (optional)
  
          `value` the new value resulting from the scroll action (optional)
  
          `range` the instance the signal is connected to (optional)
  
          `Returns` true to prevent other handlers from being invoked for
              the signal, false to propagate the signal further
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChangeValue(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == double)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gtk.range.Range)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("change-value", closure, after);
  }

  /**
      Connect to `MoveSlider` signal.
  
      Virtual function that moves the slider.
      
      Used for keybindings.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.ScrollType step, gtk.range.Range range))
  
          `step` how to move the slider (optional)
  
          `range` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectMoveSlider(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.range.Range)))
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
    return connectSignalClosure("move-slider", closure, after);
  }

  /**
      Connect to `ValueChanged` signal.
  
      Emitted when the range value changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.range.Range range))
  
          `range` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.range.Range)))
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
    return connectSignalClosure("value-changed", closure, after);
  }
}
