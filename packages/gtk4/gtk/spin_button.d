/// Module for [SpinButton] class
module gtk.spin_button;

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
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    A [gtk.spin_button.SpinButton] is an ideal way to allow the user to set the
    value of some attribute.
    
    ![An example GtkSpinButton](spinbutton.png)
    
    Rather than having to directly type a number into a [gtk.entry.Entry],
    [gtk.spin_button.SpinButton] allows the user to click on one of two arrows
    to increment or decrement the displayed value. A value can still be
    typed in, with the bonus that it can be checked to ensure it is in a
    given range.
    
    The main properties of a [gtk.spin_button.SpinButton] are through an adjustment.
    See the [gtk.adjustment.Adjustment] documentation for more details about
    an adjustment's properties.
    
    Note that [gtk.spin_button.SpinButton] will by default make its entry large enough
    to accommodate the lower and upper bounds of the adjustment. If this
    is not desired, the automatic sizing can be turned off by explicitly
    setting `property@Gtk.Editable:width-chars` to a value != -1.
    
    ## Using a GtkSpinButton to get an integer
    
    ```c
    // Provides a function to retrieve an integer value from a GtkSpinButton
    // and creates a spin button to model percentage values.
    
    int
    grab_int_value (GtkSpinButton *button,
                    gpointer       user_data)
    {
      return gtk_spin_button_get_value_as_int (button);
    }
    
    void
    create_integer_spin_button (void)
    {
    
      GtkWidget *window, *button;
      GtkAdjustment *adjustment;
    
      adjustment = gtk_adjustment_new (50.0, 0.0, 100.0, 1.0, 5.0, 0.0);
    
      window = gtk_window_new ();
    
      // creates the spinbutton, with no decimal places
      button = gtk_spin_button_new (adjustment, 1.0, 0);
      gtk_window_set_child (GTK_WINDOW (window), button);
    
      gtk_window_present (GTK_WINDOW (window));
    }
    ```
    
    ## Using a GtkSpinButton to get a floating point value
    
    ```c
    // Provides a function to retrieve a floating point value from a
    // GtkSpinButton, and creates a high precision spin button.
    
    float
    grab_float_value (GtkSpinButton *button,
                      gpointer       user_data)
    {
      return gtk_spin_button_get_value (button);
    }
    
    void
    create_floating_spin_button (void)
    {
      GtkWidget *window, *button;
      GtkAdjustment *adjustment;
    
      adjustment = gtk_adjustment_new (2.500, 0.0, 5.0, 0.001, 0.1, 0.0);
    
      window = gtk_window_new ();
    
      // creates the spinbutton, with three decimal places
      button = gtk_spin_button_new (adjustment, 0.001, 3);
      gtk_window_set_child (GTK_WINDOW (window), button);
    
      gtk_window_present (GTK_WINDOW (window));
    }
    ```
    
    # CSS nodes
    
    ```
    spinbutton.horizontal
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ├── button.down
    ╰── button.up
    ```
    
    ```
    spinbutton.vertical
    ├── button.up
    ├── text
    │    ├── undershoot.left
    │    ╰── undershoot.right
    ╰── button.down
    ```
    
    [gtk.spin_button.SpinButton]s main CSS node has the name spinbutton. It creates subnodes
    for the entry and the two buttons, with these names. The button nodes have
    the style classes .up and .down. The [gtk.text.Text] subnodes (if present) are put
    below the text node. The orientation of the spin button is reflected in
    the .vertical or .horizontal style class on the main node.
    
    # Accessibility
    
    [gtk.spin_button.SpinButton] uses the [gtk.types.AccessibleRole.SpinButton] role.
*/
class SpinButton : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.cell_editable.CellEditable, gtk.editable.Editable, gtk.orientable.Orientable
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
    return cast(void function())gtk_spin_button_get_type != &gidSymbolNotFound ? gtk_spin_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SpinButton self()
  {
    return this;
  }

  /**
      Get `activatesDefault` property.
      Returns: Whether to activate the default widget when the spin button is activated.
        
        See [gtk.spin_button.SpinButton.activate] for what counts as activation.
  */
  @property bool activatesDefault()
  {
    return getActivatesDefault();
  }

  /**
      Set `activatesDefault` property.
      Params:
        propval = Whether to activate the default widget when the spin button is activated.
          
          See [gtk.spin_button.SpinButton.activate] for what counts as activation.
  */
  @property void activatesDefault(bool propval)
  {
    return setActivatesDefault(propval);
  }

  /**
      Get `adjustment` property.
      Returns: The adjustment that holds the value of the spin button.
  */
  @property gtk.adjustment.Adjustment adjustment()
  {
    return getAdjustment();
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The adjustment that holds the value of the spin button.
  */
  @property void adjustment(gtk.adjustment.Adjustment propval)
  {
    return setAdjustment(propval);
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
    return setClimbRate(propval);
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
    return setDigits(propval);
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
    return setNumeric(propval);
  }

  /**
      Get `snapToTicks` property.
      Returns: Whether erroneous values are automatically changed to the spin buttons
        nearest step increment.
  */
  @property bool snapToTicks()
  {
    return getSnapToTicks();
  }

  /**
      Set `snapToTicks` property.
      Params:
        propval = Whether erroneous values are automatically changed to the spin buttons
          nearest step increment.
  */
  @property void snapToTicks(bool propval)
  {
    return setSnapToTicks(propval);
  }

  /**
      Get `updatePolicy` property.
      Returns: Whether the spin button should update always, or only when the value
        is acceptable.
  */
  @property gtk.types.SpinButtonUpdatePolicy updatePolicy()
  {
    return getUpdatePolicy();
  }

  /**
      Set `updatePolicy` property.
      Params:
        propval = Whether the spin button should update always, or only when the value
          is acceptable.
  */
  @property void updatePolicy(gtk.types.SpinButtonUpdatePolicy propval)
  {
    return setUpdatePolicy(propval);
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
    return setValue(propval);
  }

  /**
      Get `wrap` property.
      Returns: Whether a spin button should wrap upon reaching its limits.
  */
  @property bool wrap()
  {
    return getWrap();
  }

  /**
      Set `wrap` property.
      Params:
        propval = Whether a spin button should wrap upon reaching its limits.
  */
  @property void wrap(bool propval)
  {
    return setWrap(propval);
  }

  mixin AccessibleRangeT!();
  mixin CellEditableT!();
  mixin EditableT!();
  mixin OrientableT!();

  /**
      Creates a new [gtk.spin_button.SpinButton].
  
      Params:
        adjustment = the [gtk.adjustment.Adjustment] that this spin button should use
        climbRate = specifies by how much the rate of change in the value will
            accelerate if you continue to hold down an up/down button or arrow key
        digits = the number of decimal places to display
      Returns: The new [gtk.spin_button.SpinButton]
  */
  this(gtk.adjustment.Adjustment adjustment, double climbRate, uint digits)
  {
    GtkWidget* _cretval;
    _cretval = gtk_spin_button_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null, climbRate, digits);
    this(_cretval, No.Take);
  }

  /**
      Creates a new [gtk.spin_button.SpinButton] with the given properties.
      
      This is a convenience constructor that allows creation
      of a numeric [gtk.spin_button.SpinButton] without manually creating
      an adjustment. The value is initially set to the minimum
      value and a page increment of 10 * step is the default.
      The precision of the spin button is equivalent to the
      precision of step.
      
      Note that the way in which the precision is derived works
      best if step is a power of ten. If the resulting precision
      is not suitable for your needs, use
      [gtk.spin_button.SpinButton.setDigits] to correct it.
  
      Params:
        min = Minimum allowable value
        max = Maximum allowable value
        step = Increment added or subtracted by spinning the widget
      Returns: The new [gtk.spin_button.SpinButton]
  */
  static gtk.spin_button.SpinButton newWithRange(double min, double max, double step)
  {
    GtkWidget* _cretval;
    _cretval = gtk_spin_button_new_with_range(min, max, step);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.spin_button.SpinButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Changes the properties of an existing spin button.
      
      The adjustment, climb rate, and number of decimal places
      are updated accordingly.
  
      Params:
        adjustment = a [gtk.adjustment.Adjustment] to replace the spin button’s
            existing adjustment, or null to leave its current adjustment unchanged
        climbRate = the new climb rate
        digits = the number of decimal places to display in the spin button
  */
  void configure(gtk.adjustment.Adjustment adjustment, double climbRate, uint digits)
  {
    gtk_spin_button_configure(cast(GtkSpinButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null, climbRate, digits);
  }

  /**
      Retrieves the value set by [gtk.spin_button.SpinButton.setActivatesDefault].
      Returns: true if the spin button will activate the default widget
  */
  bool getActivatesDefault()
  {
    bool _retval;
    _retval = cast(bool)gtk_spin_button_get_activates_default(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Get the adjustment associated with a [gtk.spin_button.SpinButton].
      Returns: the [gtk.adjustment.Adjustment] of spin_button
  */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_spin_button_get_adjustment(cast(GtkSpinButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the acceleration rate for repeated changes.
      Returns: the acceleration rate
  */
  double getClimbRate()
  {
    double _retval;
    _retval = gtk_spin_button_get_climb_rate(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Fetches the precision of spin_button.
      Returns: the current precision
  */
  uint getDigits()
  {
    uint _retval;
    _retval = gtk_spin_button_get_digits(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current step and page the increments
      used by spin_button.
      
      See [gtk.spin_button.SpinButton.setIncrements].
  
      Params:
        step = location to store step increment
        page = location to store page increment
  */
  void getIncrements(out double step, out double page)
  {
    gtk_spin_button_get_increments(cast(GtkSpinButton*)this._cPtr, cast(double*)&step, cast(double*)&page);
  }

  /**
      Returns whether non-numeric text can be typed into the spin button.
      Returns: true if only numeric text can be entered
  */
  bool getNumeric()
  {
    bool _retval;
    _retval = cast(bool)gtk_spin_button_get_numeric(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the range allowed for spin_button.
      
      See [gtk.spin_button.SpinButton.setRange].
  
      Params:
        min = location to store minimum allowed value
        max = location to store maximum allowed value
  */
  void getRange(out double min, out double max)
  {
    gtk_spin_button_get_range(cast(GtkSpinButton*)this._cPtr, cast(double*)&min, cast(double*)&max);
  }

  /**
      Returns whether the values are corrected to the nearest step.
      Returns: true if values are snapped to the nearest step
  */
  bool getSnapToTicks()
  {
    bool _retval;
    _retval = cast(bool)gtk_spin_button_get_snap_to_ticks(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the update behavior of a spin button.
      
      See [gtk.spin_button.SpinButton.setUpdatePolicy].
      Returns: the current update policy
  */
  gtk.types.SpinButtonUpdatePolicy getUpdatePolicy()
  {
    GtkSpinButtonUpdatePolicy _cretval;
    _cretval = gtk_spin_button_get_update_policy(cast(GtkSpinButton*)this._cPtr);
    gtk.types.SpinButtonUpdatePolicy _retval = cast(gtk.types.SpinButtonUpdatePolicy)_cretval;
    return _retval;
  }

  /**
      Get the value in the spin_button.
      Returns: the value of spin_button
  */
  double getValue()
  {
    double _retval;
    _retval = gtk_spin_button_get_value(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Get the value spin_button represented as an integer.
      Returns: the value of spin_button
  */
  int getValueAsInt()
  {
    int _retval;
    _retval = gtk_spin_button_get_value_as_int(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the spin button’s value wraps around to the
      opposite limit when the upper or lower limit of the range is
      exceeded.
      Returns: true if the spin button wraps around
  */
  bool getWrap()
  {
    bool _retval;
    _retval = cast(bool)gtk_spin_button_get_wrap(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether activating the spin button will activate the default
      widget for the window containing the spin button.
      
      See [gtk.spin_button.SpinButton.activate] for what counts as activation.
  
      Params:
        activatesDefault = true to activate window’s default widget on activation
  */
  void setActivatesDefault(bool activatesDefault)
  {
    gtk_spin_button_set_activates_default(cast(GtkSpinButton*)this._cPtr, activatesDefault);
  }

  /**
      Replaces the [gtk.adjustment.Adjustment] associated with spin_button.
  
      Params:
        adjustment = a [gtk.adjustment.Adjustment] to replace the existing adjustment
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_spin_button_set_adjustment(cast(GtkSpinButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the acceleration rate for repeated changes when you
      hold down a button or key.
  
      Params:
        climbRate = the rate of acceleration, must be >= 0
  */
  void setClimbRate(double climbRate)
  {
    gtk_spin_button_set_climb_rate(cast(GtkSpinButton*)this._cPtr, climbRate);
  }

  /**
      Set the precision to be displayed by spin_button.
      
      Up to 20 digit precision is allowed.
  
      Params:
        digits = the number of digits after the decimal point to be
            displayed for the spin button’s value
  */
  void setDigits(uint digits)
  {
    gtk_spin_button_set_digits(cast(GtkSpinButton*)this._cPtr, digits);
  }

  /**
      Sets the step and page increments for spin_button.
      
      This affects how quickly the value changes when
      the spin button’s arrows are activated.
  
      Params:
        step = increment applied for a button 1 press.
        page = increment applied for a button 2 press.
  */
  void setIncrements(double step, double page)
  {
    gtk_spin_button_set_increments(cast(GtkSpinButton*)this._cPtr, step, page);
  }

  /**
      Sets the flag that determines if non-numeric text can be typed
      into the spin button.
  
      Params:
        numeric = flag indicating if only numeric entry is allowed
  */
  void setNumeric(bool numeric)
  {
    gtk_spin_button_set_numeric(cast(GtkSpinButton*)this._cPtr, numeric);
  }

  /**
      Sets the minimum and maximum allowable values for spin_button.
      
      If the current value is outside this range, it will be adjusted
      to fit within the range, otherwise it will remain unchanged.
  
      Params:
        min = minimum allowable value
        max = maximum allowable value
  */
  void setRange(double min, double max)
  {
    gtk_spin_button_set_range(cast(GtkSpinButton*)this._cPtr, min, max);
  }

  /**
      Sets the policy as to whether values are corrected to the
      nearest step increment when a spin button is activated after
      providing an invalid value.
  
      Params:
        snapToTicks = a flag indicating if invalid values should be corrected
  */
  void setSnapToTicks(bool snapToTicks)
  {
    gtk_spin_button_set_snap_to_ticks(cast(GtkSpinButton*)this._cPtr, snapToTicks);
  }

  /**
      Sets the update behavior of a spin button.
      
      This determines whether the spin button is always
      updated or only when a valid value is set.
  
      Params:
        policy = a [gtk.types.SpinButtonUpdatePolicy] value
  */
  void setUpdatePolicy(gtk.types.SpinButtonUpdatePolicy policy)
  {
    gtk_spin_button_set_update_policy(cast(GtkSpinButton*)this._cPtr, policy);
  }

  /**
      Sets the value of spin_button.
  
      Params:
        value = the new value
  */
  void setValue(double value)
  {
    gtk_spin_button_set_value(cast(GtkSpinButton*)this._cPtr, value);
  }

  /**
      Sets the flag that determines if a spin button value wraps
      around to the opposite limit when the upper or lower limit
      of the range is exceeded.
  
      Params:
        wrap = a flag indicating if wrapping behavior is performed
  */
  void setWrap(bool wrap)
  {
    gtk_spin_button_set_wrap(cast(GtkSpinButton*)this._cPtr, wrap);
  }

  /**
      Increment or decrement a spin button’s value in a specified
      direction by a specified amount.
  
      Params:
        direction = a [gtk.types.SpinType] indicating the direction to spin
        increment = step increment to apply in the specified direction
  */
  void spin(gtk.types.SpinType direction, double increment)
  {
    gtk_spin_button_spin(cast(GtkSpinButton*)this._cPtr, direction, increment);
  }

  /**
      Manually force an update of the spin button.
  */
  void update()
  {
    gtk_spin_button_update(cast(GtkSpinButton*)this._cPtr);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the spin button is activated.
        
        The keybindings for this signal are all forms of the <kbd>Enter</kbd> key.
        
        If the <kbd>Enter</kbd> key results in the value being committed to the
        spin button, then activation does not occur until <kbd>Enter</kbd> is
        pressed again.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.spin_button.SpinButton spinButton))
  
          `spinButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.spin_button.SpinButton)))
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
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `ChangeValue` signal.
  
      Emitted when the user initiates a value change.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        Applications should not connect to it, but may emit it with
        [gobject.global.signalEmitByName] if they need to control the cursor
        programmatically.
        
        The default bindings for this signal are Up/Down and PageUp/PageDown.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.ScrollType scroll, gtk.spin_button.SpinButton spinButton))
  
          `scroll` a [gtk.types.ScrollType] to specify the speed and amount of change (optional)
  
          `spinButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChangeValue(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gtk.types.ScrollType)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.spin_button.SpinButton)))
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
    return connectSignalClosure("change-value", closure, after);
  }

  /**
      Connect to `Output` signal.
  
      Emitted to tweak the formatting of the value for display.
        
        ```c
        // show leading zeros
        static gboolean
        on_output (GtkSpinButton *spin,
                   gpointer       data)
        {
           char *text;
           int value;
        
           value = gtk_spin_button_get_value_as_int (spin);
           text = g_strdup_printf ("%02d", value);
           gtk_editable_set_text (GTK_EDITABLE (spin), text):
           g_free (text);
        
           return TRUE;
        }
        ```
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(gtk.spin_button.SpinButton spinButton))
  
          `spinButton` the instance the signal is connected to (optional)
  
          `Returns` true if the value has been displayed
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectOutput(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.spin_button.SpinButton)))
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
      Connect to `ValueChanged` signal.
  
      Emitted when the value is changed.
        
        Also see the [gtk.spin_button.SpinButton.output] signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.spin_button.SpinButton spinButton))
  
          `spinButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.spin_button.SpinButton)))
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

  /**
      Connect to `Wrapped` signal.
  
      Emitted right after the spinbutton wraps from its maximum
        to its minimum value or vice-versa.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.spin_button.SpinButton spinButton))
  
          `spinButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectWrapped(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.spin_button.SpinButton)))
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
