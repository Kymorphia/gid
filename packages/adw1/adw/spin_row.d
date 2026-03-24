/// Module for [SpinRow] class
module adw.spin_row;

import adw.action_row;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.types;

/**
    An `class@ActionRow` with an embedded spin button.
    
    <picture>
      <source srcset="spin-row-dark.png" media="(prefers-color-scheme: dark)">
      <img src="spin-row.png" alt="spin-row">
    </picture>
    
    Example of an [adw.spin_row.SpinRow] UI definition:
    
    ```xml
    <object class="AdwSpinRow">
      <property name="title" translatable="yes">Spin Row</property>
      <property name="adjustment">
        <object class="GtkAdjustment">
          <property name="lower">0</property>
          <property name="upper">100</property>
          <property name="value">50</property>
          <property name="page-increment">10</property>
          <property name="step-increment">1</property>
        </object>
      </property>
    </object>
    ```
    
    See [gtk.spin_button.SpinButton] for details.
    
    ## CSS nodes
    
    [adw.spin_row.SpinRow] has the same structure as `class@ActionRow`, as well as the
    `.spin` style class on the main node.
    
    ## Accessibility
    
    [adw.spin_row.SpinRow] uses an internal [gtk.spin_button.SpinButton] with the
    [gtk.types.AccessibleRole.SpinButton] role.
*/
class SpinRow : adw.action_row.ActionRow, gtk.editable.Editable
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
    return cast(void function())adw_spin_row_get_type != &gidSymbolNotFound ? adw_spin_row_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinRow self()
  {
    return this;
  }

  /**
  Get builder for [adw.spin_row.SpinRow]
  Returns: New builder object
  */
  static SpinRowGidBuilder builder()
  {
    return new SpinRowGidBuilder;
  }

  /**
      Get `adjustment` property.
      Returns: The adjustment that holds the value of the spin row.
  */
  @property gtk.adjustment.Adjustment adjustment()
  {
    return getAdjustment();
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The adjustment that holds the value of the spin row.
  */
  @property void adjustment(gtk.adjustment.Adjustment propval)
  {
    setAdjustment(propval);
  }

  /**
      Get `climbRate` property.
      Returns: The acceleration rate when you hold down a button or key.
  */
  @property double climbRate()
  {
    return getClimbRate();
  }

  /**
      Set `climbRate` property.
      Params:
        propval = The acceleration rate when you hold down a button or key.
  */
  @property void climbRate(double propval)
  {
    setClimbRate(propval);
  }

  /**
      Get `digits` property.
      Returns: The number of decimal places to display.
  */
  @property uint digits()
  {
    return getDigits();
  }

  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places to display.
  */
  @property void digits(uint propval)
  {
    setDigits(propval);
  }

  /**
      Get `numeric` property.
      Returns: Whether non-numeric characters should be ignored.
  */
  @property bool numeric()
  {
    return getNumeric();
  }

  /**
      Set `numeric` property.
      Params:
        propval = Whether non-numeric characters should be ignored.
  */
  @property void numeric(bool propval)
  {
    setNumeric(propval);
  }

  /**
      Get `snapToTicks` property.
      Returns: Whether invalid values are snapped to the nearest step increment.
  */
  @property bool snapToTicks()
  {
    return getSnapToTicks();
  }

  /**
      Set `snapToTicks` property.
      Params:
        propval = Whether invalid values are snapped to the nearest step increment.
  */
  @property void snapToTicks(bool propval)
  {
    setSnapToTicks(propval);
  }

  /**
      Get `updatePolicy` property.
      Returns: The policy for updating the spin row.
        
        The options are always, or only when the value is invalid.
  */
  @property gtk.types.SpinButtonUpdatePolicy updatePolicy()
  {
    return getUpdatePolicy();
  }

  /**
      Set `updatePolicy` property.
      Params:
        propval = The policy for updating the spin row.
          
          The options are always, or only when the value is invalid.
  */
  @property void updatePolicy(gtk.types.SpinButtonUpdatePolicy propval)
  {
    setUpdatePolicy(propval);
  }

  /**
      Get `value` property.
      Returns: The current value.
  */
  @property double value()
  {
    return getValue();
  }

  /**
      Set `value` property.
      Params:
        propval = The current value.
  */
  @property void value(double propval)
  {
    setValue(propval);
  }

  /**
      Get `wrap` property.
      Returns: Whether the spin row should wrap upon reaching its limits.
  */
  @property bool wrap()
  {
    return getWrap();
  }

  /**
      Set `wrap` property.
      Params:
        propval = Whether the spin row should wrap upon reaching its limits.
  */
  @property void wrap(bool propval)
  {
    setWrap(propval);
  }

  mixin EditableT!();

  /**
      Creates a new [adw.spin_row.SpinRow].
  
      Params:
        adjustment = the adjustment that this spin row should use
        climbRate = the rate the value changes when holding a button or key
        digits = the number of decimal places to display
      Returns: the newly created [adw.spin_row.SpinRow]
  */
  this(gtk.adjustment.Adjustment adjustment, double climbRate, uint digits)
  {
    GtkWidget* _cretval;
    _cretval = adw_spin_row_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null, climbRate, digits);
    this(_cretval, No.Take);
  }

  /**
      Creates a new [adw.spin_row.SpinRow] with the given properties.
      
      This is a convenience constructor that allows creation of a numeric
      [adw.spin_row.SpinRow] without manually creating an adjustment. The value is initially
      set to the minimum value and a page increment of 10 * step is the default.
      The precision of the spin row is equivalent to the precisions of step.
      
      ::: note
          The way in which the precision is derived works best if step is a power
          of ten. If the resulting precision is not suitable for your needs, use
          [adw.spin_row.SpinRow.setDigits] to correct it.
  
      Params:
        min = minimum allowable value
        max = maximum allowable value
        step = increment added or subtracted by spinning the widget
      Returns: the new [adw.spin_row.SpinRow]
  */
  static adw.spin_row.SpinRow newWithRange(double min, double max, double step)
  {
    GtkWidget* _cretval;
    _cretval = adw_spin_row_new_with_range(min, max, step);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.spin_row.SpinRow)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Changes the properties of an existing spin row.
      
      The adjustment, climb rate, and number of decimal places are updated
      accordingly.
  
      Params:
        adjustment = the adjustment that this spin row should use
        climbRate = the new climb rate
        digits = the number of decimal places to display
  */
  void configure(gtk.adjustment.Adjustment adjustment, double climbRate, uint digits)
  {
    adw_spin_row_configure(cast(AdwSpinRow*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null, climbRate, digits);
  }

  /**
      Gets the adjustment that holds the value for the spin row.
      Returns: the adjustment that holds the spin row's value
  */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = adw_spin_row_get_adjustment(cast(AdwSpinRow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the acceleration rate when you hold down a button or key.
      Returns: the acceleration rate when you hold down a button or key
  */
  double getClimbRate()
  {
    double _retval;
    _retval = adw_spin_row_get_climb_rate(cast(AdwSpinRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of decimal places to display.
      Returns: the number of decimal places to display
  */
  uint getDigits()
  {
    uint _retval;
    _retval = adw_spin_row_get_digits(cast(AdwSpinRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether non-numeric characters should be ignored.
      Returns: whether non-numeric characters should be ignored.
  */
  bool getNumeric()
  {
    bool _retval;
    _retval = cast(bool)adw_spin_row_get_numeric(cast(AdwSpinRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether invalid values are snapped to nearest step increment.
      Returns: whether invalid values are snapped to the nearest step increment
  */
  bool getSnapToTicks()
  {
    bool _retval;
    _retval = cast(bool)adw_spin_row_get_snap_to_ticks(cast(AdwSpinRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the policy for updating the spin row.
      Returns: the policy for updating the spin row
  */
  gtk.types.SpinButtonUpdatePolicy getUpdatePolicy()
  {
    GtkSpinButtonUpdatePolicy _cretval;
    _cretval = adw_spin_row_get_update_policy(cast(AdwSpinRow*)this._cPtr);
    gtk.types.SpinButtonUpdatePolicy _retval = cast(gtk.types.SpinButtonUpdatePolicy)_cretval;
    return _retval;
  }

  /**
      Gets the current value.
      Returns: the current value
  */
  double getValue()
  {
    double _retval;
    _retval = adw_spin_row_get_value(cast(AdwSpinRow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the spin row should wrap upon reaching its limits.
      Returns: whether the spin row should wrap upon reaching its limits
  */
  bool getWrap()
  {
    bool _retval;
    _retval = cast(bool)adw_spin_row_get_wrap(cast(AdwSpinRow*)this._cPtr);
    return _retval;
  }

  /**
      Sets the adjustment that holds the value for the spin row.
  
      Params:
        adjustment = an adjustment
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment = null)
  {
    adw_spin_row_set_adjustment(cast(AdwSpinRow*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the acceleration rate when you hold down a button or key.
  
      Params:
        climbRate = the acceleration rate when you hold down a button or key
  */
  void setClimbRate(double climbRate)
  {
    adw_spin_row_set_climb_rate(cast(AdwSpinRow*)this._cPtr, climbRate);
  }

  /**
      Sets the number of decimal places to display.
  
      Params:
        digits = the number of decimal places to display
  */
  void setDigits(uint digits)
  {
    adw_spin_row_set_digits(cast(AdwSpinRow*)this._cPtr, digits);
  }

  /**
      Sets whether non-numeric characters should be ignored.
  
      Params:
        numeric = whether non-numeric characters should be ignored
  */
  void setNumeric(bool numeric)
  {
    adw_spin_row_set_numeric(cast(AdwSpinRow*)this._cPtr, numeric);
  }

  /**
      Sets the minimum and maximum allowable values for self.
      
      If the current value is outside this range, it will be adjusted
      to fit within the range, otherwise it will remain unchanged.
  
      Params:
        min = minimum allowable value
        max = maximum allowable value
  */
  void setRange(double min, double max)
  {
    adw_spin_row_set_range(cast(AdwSpinRow*)this._cPtr, min, max);
  }

  /**
      Sets whether invalid values are snapped to the nearest step increment.
  
      Params:
        snapToTicks = whether invalid values are snapped to the nearest step increment
  */
  void setSnapToTicks(bool snapToTicks)
  {
    adw_spin_row_set_snap_to_ticks(cast(AdwSpinRow*)this._cPtr, snapToTicks);
  }

  /**
      Sets the policy for updating the spin row.
      
      The options are always, or only when the value is invalid.
  
      Params:
        policy = the policy for updating the spin row
  */
  void setUpdatePolicy(gtk.types.SpinButtonUpdatePolicy policy)
  {
    adw_spin_row_set_update_policy(cast(AdwSpinRow*)this._cPtr, policy);
  }

  /**
      Sets the current value.
  
      Params:
        value = a new value
  */
  void setValue(double value)
  {
    adw_spin_row_set_value(cast(AdwSpinRow*)this._cPtr, value);
  }

  /**
      Sets whether the spin row should wrap upon reaching its limits.
  
      Params:
        wrap = whether the spin row should wrap upon reaching its limits
  */
  void setWrap(bool wrap)
  {
    adw_spin_row_set_wrap(cast(AdwSpinRow*)this._cPtr, wrap);
  }

  /**
      Manually force an update of the spin row.
  */
  void update()
  {
    adw_spin_row_update(cast(AdwSpinRow*)this._cPtr);
  }

  /**
      Connect to `Input` signal.
  
      Emitted to convert the user's input into a double value.
        
        The signal handler is expected to use [gtk.editable.Editable.getText] to
        retrieve the text of the spinbutton and set new_value to the new value.
        
        The default conversion uses `funcGLib.strtod`.
        
        See [gtk.spin_button.SpinButton.input].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D int callback(out double newValue, adw.spin_row.SpinRow spinRow))
  
          `newValue` return location for the new value (optional)
  
          `spinRow` the instance the signal is connected to (optional)
  
          `Returns` `TRUE` for a successful conversion, `FALSE` if the input was not
              handled, and [gtk.types.INPUT_ERROR] if the conversion failed.
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectInput(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == int)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.out_ && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.spin_row.SpinRow)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      Parameters!T[0] newValue;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = newValue;

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);

      setVal!(int)(_returnValue, _retval);

      static if (Parameters!T.length > 0)
        *getVal!(Parameters!T[0]*)(&_paramVals[1]) = newValue;
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("input", closure, after);
  }

  /**
      Connect to `Output` signal.
  
      Emitted to tweak the formatting of the value for display.
        
        See [gtk.spin_button.SpinButton.output].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(adw.spin_row.SpinRow spinRow))
  
          `spinRow` the instance the signal is connected to (optional)
  
          `Returns` `TRUE` if the value has been displayed
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectOutput(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.spin_row.SpinRow)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("output", closure, after);
  }

  /**
      Connect to `Wrapped` signal.
  
      Emitted right after the spinbutton wraps.
        
        See [gtk.spin_button.SpinButton.wrapped].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.spin_row.SpinRow spinRow))
  
          `spinRow` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWrapped(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.spin_row.SpinRow)))
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
    return connectSignalClosure("wrapped", closure, after);
  }
}

class SpinRowGidBuilderImpl(T) : adw.action_row.ActionRowGidBuilderImpl!T, gtk.editable.EditableGidBuilderImpl!T
{

  mixin EditableGidBuilderT!();

  /**
      Set `adjustment` property.
      Params:
        propval = The adjustment that holds the value of the spin row.
      Returns: Builder instance for fluent chaining
  */
  T adjustment(gtk.adjustment.Adjustment propval)
  {
    return setProperty("adjustment", propval);
  }

  /**
      Set `climbRate` property.
      Params:
        propval = The acceleration rate when you hold down a button or key.
      Returns: Builder instance for fluent chaining
  */
  T climbRate(double propval)
  {
    return setProperty("climb-rate", propval);
  }

  /**
      Set `digits` property.
      Params:
        propval = The number of decimal places to display.
      Returns: Builder instance for fluent chaining
  */
  T digits(uint propval)
  {
    return setProperty("digits", propval);
  }

  /**
      Set `numeric` property.
      Params:
        propval = Whether non-numeric characters should be ignored.
      Returns: Builder instance for fluent chaining
  */
  T numeric(bool propval)
  {
    return setProperty("numeric", propval);
  }

  /**
      Set `snapToTicks` property.
      Params:
        propval = Whether invalid values are snapped to the nearest step increment.
      Returns: Builder instance for fluent chaining
  */
  T snapToTicks(bool propval)
  {
    return setProperty("snap-to-ticks", propval);
  }

  /**
      Set `updatePolicy` property.
      Params:
        propval = The policy for updating the spin row.
          
          The options are always, or only when the value is invalid.
      Returns: Builder instance for fluent chaining
  */
  T updatePolicy(gtk.types.SpinButtonUpdatePolicy propval)
  {
    return setProperty("update-policy", propval);
  }

  /**
      Set `value` property.
      Params:
        propval = The current value.
      Returns: Builder instance for fluent chaining
  */
  T value(double propval)
  {
    return setProperty("value", propval);
  }

  /**
      Set `wrap` property.
      Params:
        propval = Whether the spin row should wrap upon reaching its limits.
      Returns: Builder instance for fluent chaining
  */
  T wrap(bool propval)
  {
    return setProperty("wrap", propval);
  }
}

/// Fluent builder for [adw.spin_row.SpinRow]
final class SpinRowGidBuilder : SpinRowGidBuilderImpl!SpinRowGidBuilder
{
  SpinRow build()
  {
    return new SpinRow(cast(void*)createGObject(SpinRow._getGType), No.Take);
  }
}
