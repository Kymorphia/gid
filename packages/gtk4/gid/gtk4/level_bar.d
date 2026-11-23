/// Module for [LevelBar] class
module gid.gtk4.level_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_range;
import gid.gtk4.accessible_range_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Shows a level indicator.
    
    Typical use cases are displaying the strength of a password, or
    showing the charge level of a battery.
    
    <picture>
      <source srcset="levelbar-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkLevelBar" src="levelbar.png">
    </picture>
    
    Use [gid.gtk4.level_bar.LevelBar.setValue] to set the current value, and
    [gid.gtk4.level_bar.LevelBar.addOffsetValue] to set the value offsets at which
    the bar will be considered in a different state. GTK will add a few
    offsets by default on the level bar: [gid.gtk4.types.LEVEL_BAR_OFFSET_LOW],
    [gid.gtk4.types.LEVEL_BAR_OFFSET_HIGH] and [gid.gtk4.types.LEVEL_BAR_OFFSET_FULL], with
    values 0.25, 0.75 and 1.0 respectively.
    
    Note that it is your responsibility to update preexisting offsets
    when changing the minimum or maximum value. GTK will simply clamp
    them to the new range.
    
    ## Adding a custom offset on the bar
    
    ```c
    static GtkWidget *
    create_level_bar (void)
    {
      GtkWidget *widget;
      GtkLevelBar *bar;
    
      widget = gtk_level_bar_new ();
      bar = GTK_LEVEL_BAR (widget);
    
      // This changes the value of the default low offset
    
      gtk_level_bar_add_offset_value (bar,
                                      GTK_LEVEL_BAR_OFFSET_LOW,
                                      0.10);
    
      // This adds a new offset to the bar; the application will
      // be able to change its color CSS like this:
      //
      // levelbar block.my-offset {
      //   background-color: magenta;
      //   border-style: solid;
      //   border-color: black;
      //   border-width: 1px;
      // }
    
      gtk_level_bar_add_offset_value (bar, "my-offset", 0.60);
    
      return widget;
    }
    ```
    
    The default interval of values is between zero and one, but it’s possible
    to modify the interval using [gid.gtk4.level_bar.LevelBar.setMinValue] and
    [gid.gtk4.level_bar.LevelBar.setMaxValue]. The value will be always drawn in
    proportion to the admissible interval, i.e. a value of 15 with a specified
    interval between 10 and 20 is equivalent to a value of 0.5 with an interval
    between 0 and 1. When [gid.gtk4.types.LevelBarMode.Discrete] is used, the bar level
    is rendered as a finite number of separated blocks instead of a single one.
    The number of blocks that will be rendered is equal to the number of units
    specified by the admissible interval.
    
    For instance, to build a bar rendered with five blocks, it’s sufficient to
    set the minimum value to 0 and the maximum value to 5 after changing the
    indicator mode to discrete.
    
    # GtkLevelBar as GtkBuildable
    
    The [gid.gtk4.level_bar.LevelBar] implementation of the [gid.gtk4.buildable.Buildable] interface supports a
    custom `<offsets>` element, which can contain any number of `<offset>` elements,
    each of which must have "name" and "value" attributes.
    
    # CSS nodes
    
    ```
    levelbar[.discrete]
    ╰── trough
        ├── block.filled.level-name
        ┊
        ├── block.empty
        ┊
    ```
    
    [gid.gtk4.level_bar.LevelBar] has a main CSS node with name levelbar and one of the style
    classes .discrete or .continuous and a subnode with name trough. Below the
    trough node are a number of nodes with name block and style class .filled
    or .empty. In continuous mode, there is exactly one node of each, in discrete
    mode, the number of filled and unfilled nodes corresponds to blocks that are
    drawn. The block.filled nodes also get a style class .level-name corresponding
    to the level for the current value.
    
    In horizontal orientation, the nodes are always arranged from left to right,
    regardless of text direction.
    
    # Accessibility
    
    [gid.gtk4.level_bar.LevelBar] uses the [gid.gtk4.types.AccessibleRole.Meter] role.
*/
class LevelBar : gid.gtk4.widget.Widget, gid.gtk4.accessible_range.AccessibleRange, gid.gtk4.orientable.Orientable
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
    return cast(void function())gtk_level_bar_get_type != &gidSymbolNotFound ? gtk_level_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkLevelBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override LevelBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.level_bar.LevelBar]
      Returns: New builder object
  */
  static LevelBarGidBuilder builder() nothrow
  {
    return new LevelBarGidBuilder;
  }

  /**
      Get `inverted` property.
      Returns: Whether the `GtkLeveBar` is inverted.
        
        Level bars normally grow from top to bottom or left to right.
        Inverted level bars grow in the opposite direction.
  */
  @property bool inverted() nothrow
  {
    return getInverted();
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether the `GtkLeveBar` is inverted.
          
          Level bars normally grow from top to bottom or left to right.
          Inverted level bars grow in the opposite direction.
  */
  @property void inverted(bool propval) nothrow
  {
    setInverted(propval);
  }

  /**
      Get `maxValue` property.
      Returns: Determines the maximum value of the interval that can be displayed by the bar.
  */
  @property double maxValue() nothrow
  {
    return getMaxValue();
  }

  /**
      Set `maxValue` property.
      Params:
        propval = Determines the maximum value of the interval that can be displayed by the bar.
  */
  @property void maxValue(double propval) nothrow
  {
    setMaxValue(propval);
  }

  /**
      Get `minValue` property.
      Returns: Determines the minimum value of the interval that can be displayed by the bar.
  */
  @property double minValue() nothrow
  {
    return getMinValue();
  }

  /**
      Set `minValue` property.
      Params:
        propval = Determines the minimum value of the interval that can be displayed by the bar.
  */
  @property void minValue(double propval) nothrow
  {
    setMinValue(propval);
  }

  /**
      Get `mode` property.
      Returns: Determines the way [gid.gtk4.level_bar.LevelBar] interprets the value properties to draw the
        level fill area.
        
        Specifically, when the value is [gid.gtk4.types.LevelBarMode.Continuous],
        [gid.gtk4.level_bar.LevelBar] will draw a single block representing the current value in
        that area; when the value is [gid.gtk4.types.LevelBarMode.Discrete],
        the widget will draw a succession of separate blocks filling the
        draw area, with the number of blocks being equal to the units separating
        the integral roundings of [gid.gtk4.level_bar.LevelBar.minValue] and
        [gid.gtk4.level_bar.LevelBar.maxValue].
  */
  @property gid.gtk4.types.LevelBarMode mode() nothrow
  {
    return getMode();
  }

  /**
      Set `mode` property.
      Params:
        propval = Determines the way [gid.gtk4.level_bar.LevelBar] interprets the value properties to draw the
          level fill area.
          
          Specifically, when the value is [gid.gtk4.types.LevelBarMode.Continuous],
          [gid.gtk4.level_bar.LevelBar] will draw a single block representing the current value in
          that area; when the value is [gid.gtk4.types.LevelBarMode.Discrete],
          the widget will draw a succession of separate blocks filling the
          draw area, with the number of blocks being equal to the units separating
          the integral roundings of [gid.gtk4.level_bar.LevelBar.minValue] and
          [gid.gtk4.level_bar.LevelBar.maxValue].
  */
  @property void mode(gid.gtk4.types.LevelBarMode propval) nothrow
  {
    setMode(propval);
  }

  /**
      Get `value` property.
      Returns: Determines the currently filled value of the level bar.
  */
  @property double value() nothrow
  {
    return getValue();
  }

  /**
      Set `value` property.
      Params:
        propval = Determines the currently filled value of the level bar.
  */
  @property void value(double propval) nothrow
  {
    setValue(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a new [gid.gtk4.level_bar.LevelBar].
      Returns: a [gid.gtk4.level_bar.LevelBar].
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_level_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new [gid.gtk4.level_bar.LevelBar] for the specified interval.
  
      Params:
        minValue = a positive value
        maxValue = a positive value
      Returns: a [gid.gtk4.level_bar.LevelBar]
  */
  static gid.gtk4.level_bar.LevelBar newForInterval(double minValue, double maxValue) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_level_bar_new_for_interval(minValue, maxValue);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.level_bar.LevelBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a new offset marker on self at the position specified by value.
      
      When the bar value is in the interval topped by value (or between value
      and [gid.gtk4.level_bar.LevelBar.maxValue] in case the offset is the last one
      on the bar) a style class named `level-`name will be applied
      when rendering the level bar fill.
      
      If another offset marker named name exists, its value will be
      replaced by value.
  
      Params:
        name = the name of the new offset
        value = the value for the new offset
  */
  void addOffsetValue(string name, double value) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    gtk_level_bar_add_offset_value(cast(GtkLevelBar*)this._cPtr, _name, value);
  }

  /**
      Returns whether the levelbar is inverted.
      Returns: true if the level bar is inverted
  */
  bool getInverted() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_level_bar_get_inverted(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns the `max-value` of the [gid.gtk4.level_bar.LevelBar].
      Returns: a positive value
  */
  double getMaxValue() nothrow
  {
    double _retval;
    _retval = gtk_level_bar_get_max_value(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns the `min-value` of the [gid.gtk4.level_bar.LevelBar].
      Returns: a positive value
  */
  double getMinValue() nothrow
  {
    double _retval;
    _retval = gtk_level_bar_get_min_value(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Returns the `mode` of the [gid.gtk4.level_bar.LevelBar].
      Returns: a [gid.gtk4.types.LevelBarMode]
  */
  gid.gtk4.types.LevelBarMode getMode() nothrow
  {
    GtkLevelBarMode _cretval;
    _cretval = gtk_level_bar_get_mode(cast(GtkLevelBar*)this._cPtr);
    gid.gtk4.types.LevelBarMode _retval = cast(gid.gtk4.types.LevelBarMode)_cretval;
    return _retval;
  }

  /**
      Fetches the value specified for the offset marker name in self.
  
      Params:
        name = the name of an offset in the bar
        value = location where to store the value
      Returns: true if the specified offset is found
  */
  bool getOffsetValue(string name, out double value) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    _retval = cast(bool)gtk_level_bar_get_offset_value(cast(GtkLevelBar*)this._cPtr, _name, cast(double*)&value);
    return _retval;
  }

  /**
      Returns the `value` of the [gid.gtk4.level_bar.LevelBar].
      Returns: a value in the interval between
          [gid.gtk4.level_bar.LevelBar.minValue] and [gid.gtk4.level_bar.LevelBar.maxValue]
  */
  double getValue() nothrow
  {
    double _retval;
    _retval = gtk_level_bar_get_value(cast(GtkLevelBar*)this._cPtr);
    return _retval;
  }

  /**
      Removes an offset marker from a [gid.gtk4.level_bar.LevelBar].
      
      The marker must have been previously added with
      [gid.gtk4.level_bar.LevelBar.addOffsetValue].
  
      Params:
        name = the name of an offset in the bar
  */
  void removeOffsetValue(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    gtk_level_bar_remove_offset_value(cast(GtkLevelBar*)this._cPtr, _name);
  }

  /**
      Sets whether the [gid.gtk4.level_bar.LevelBar] is inverted.
  
      Params:
        inverted = true to invert the level bar
  */
  void setInverted(bool inverted) nothrow
  {
    gtk_level_bar_set_inverted(cast(GtkLevelBar*)this._cPtr, inverted);
  }

  /**
      Sets the `max-value` of the [gid.gtk4.level_bar.LevelBar].
      
      You probably want to update preexisting level offsets after calling
      this function.
  
      Params:
        value = a positive value
  */
  void setMaxValue(double value) nothrow
  {
    gtk_level_bar_set_max_value(cast(GtkLevelBar*)this._cPtr, value);
  }

  /**
      Sets the `min-value` of the [gid.gtk4.level_bar.LevelBar].
      
      You probably want to update preexisting level offsets after calling
      this function.
  
      Params:
        value = a positive value
  */
  void setMinValue(double value) nothrow
  {
    gtk_level_bar_set_min_value(cast(GtkLevelBar*)this._cPtr, value);
  }

  /**
      Sets the `mode` of the [gid.gtk4.level_bar.LevelBar].
  
      Params:
        mode = a [gid.gtk4.types.LevelBarMode]
  */
  void setMode(gid.gtk4.types.LevelBarMode mode) nothrow
  {
    gtk_level_bar_set_mode(cast(GtkLevelBar*)this._cPtr, mode);
  }

  /**
      Sets the value of the [gid.gtk4.level_bar.LevelBar].
  
      Params:
        value = a value in the interval between
            [gid.gtk4.level_bar.LevelBar.minValue] and [gid.gtk4.level_bar.LevelBar.maxValue]
  */
  void setValue(double value) nothrow
  {
    gtk_level_bar_set_value(cast(GtkLevelBar*)this._cPtr, value);
  }

  /**
      Connect to `OffsetChanged` signal.
  
      Emitted when an offset specified on the bar changes value.
        
        This typically is the result of a [gid.gtk4.level_bar.LevelBar.addOffsetValue]
        call.
        
        The signal supports detailed connections; you can connect to the
        detailed signal "changed::x" in order to only receive callbacks when
        the value of offset "x" changes.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string name, gid.gtk4.level_bar.LevelBar levelBar)`
  
          `name` the name of the offset that changed value (optional)
  
          `levelBar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectOffsetChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.level_bar.LevelBar)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.level_bar.LevelBar.offsetChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("offset-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.level_bar.LevelBar]
class LevelBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.accessible_range.AccessibleRangeGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin AccessibleRangeGidBuilderT!();
  mixin OrientableGidBuilderT!();

  /**
      Set `inverted` property.
      Params:
        propval = Whether the `GtkLeveBar` is inverted.
          
          Level bars normally grow from top to bottom or left to right.
          Inverted level bars grow in the opposite direction.
      Returns: Builder instance for fluent chaining
  */
  T inverted(bool propval) nothrow
  {
    return setProperty("inverted", propval);
  }

  /**
      Set `maxValue` property.
      Params:
        propval = Determines the maximum value of the interval that can be displayed by the bar.
      Returns: Builder instance for fluent chaining
  */
  T maxValue(double propval) nothrow
  {
    return setProperty("max-value", propval);
  }

  /**
      Set `minValue` property.
      Params:
        propval = Determines the minimum value of the interval that can be displayed by the bar.
      Returns: Builder instance for fluent chaining
  */
  T minValue(double propval) nothrow
  {
    return setProperty("min-value", propval);
  }

  /**
      Set `mode` property.
      Params:
        propval = Determines the way [gid.gtk4.level_bar.LevelBar] interprets the value properties to draw the
          level fill area.
          
          Specifically, when the value is [gid.gtk4.types.LevelBarMode.Continuous],
          [gid.gtk4.level_bar.LevelBar] will draw a single block representing the current value in
          that area; when the value is [gid.gtk4.types.LevelBarMode.Discrete],
          the widget will draw a succession of separate blocks filling the
          draw area, with the number of blocks being equal to the units separating
          the integral roundings of [gid.gtk4.level_bar.LevelBar.minValue] and
          [gid.gtk4.level_bar.LevelBar.maxValue].
      Returns: Builder instance for fluent chaining
  */
  T mode(gid.gtk4.types.LevelBarMode propval) nothrow
  {
    return setProperty("mode", propval);
  }

  /**
      Set `value` property.
      Params:
        propval = Determines the currently filled value of the level bar.
      Returns: Builder instance for fluent chaining
  */
  T value(double propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [gid.gtk4.level_bar.LevelBar]
final class LevelBarGidBuilder : LevelBarGidBuilderImpl!LevelBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  LevelBar build() nothrow
  {
    return new LevelBar(cast(void*)createGObject(LevelBar._getGType), Yes.Take);
  }
}
