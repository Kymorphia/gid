/// Module for [SpinButton] class
module gtk.spin_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.cell_editable;
import gtk.cell_editable_mixin;
import gtk.editable;
import gtk.editable_mixin;
import gtk.entry;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;

/**
    A #GtkSpinButton is an ideal way to allow the user to set the value of
    some attribute. Rather than having to directly type a number into a
    #GtkEntry, GtkSpinButton allows the user to click on one of two arrows
    to increment or decrement the displayed value. A value can still be
    typed in, with the bonus that it can be checked to ensure it is in a
    given range.
    
    The main properties of a GtkSpinButton are through an adjustment.
    See the #GtkAdjustment section for more details about an adjustment's
    properties. Note that GtkSpinButton will by default make its entry
    large enough to accomodate the lower and upper bounds of the adjustment,
    which can lead to surprising results. Best practice is to set both
    the #GtkEntry:width-chars and #GtkEntry:max-width-chars poperties
    to the desired number of characters to display in the entry.
    
    # CSS nodes
    
    ```plain
    spinbutton.horizontal
    ├── undershoot.left
    ├── undershoot.right
    ├── entry
    │   ╰── ...
    ├── button.down
    ╰── button.up
    ```
    
    ```plain
    spinbutton.vertical
    ├── undershoot.left
    ├── undershoot.right
    ├── button.up
    ├── entry
    │   ╰── ...
    ╰── button.down
    ```
    
    GtkSpinButtons main CSS node has the name spinbutton. It creates subnodes
    for the entry and the two buttons, with these names. The button nodes have
    the style classes .up and .down. The GtkEntry subnodes (if present) are put
    below the entry node. The orientation of the spin button is reflected in
    the .vertical or .horizontal style class on the main node.
    
    ## Using a GtkSpinButton to get an integer
    
    ```c
    // Provides a function to retrieve an integer value from a GtkSpinButton
    // and creates a spin button to model percentage values.
    
    gint
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
    
      window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      gtk_container_set_border_width (GTK_CONTAINER (window), 5);
    
      // creates the spinbutton, with no decimal places
      button = gtk_spin_button_new (adjustment, 1.0, 0);
      gtk_container_add (GTK_CONTAINER (window), button);
    
      gtk_widget_show_all (window);
    }
    ```
    
    ## Using a GtkSpinButton to get a floating point value
    
    ```c
    // Provides a function to retrieve a floating point value from a
    // GtkSpinButton, and creates a high precision spin button.
    
    gfloat
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
    
      window = gtk_window_new (GTK_WINDOW_TOPLEVEL);
      gtk_container_set_border_width (GTK_CONTAINER (window), 5);
    
      // creates the spinbutton, with three decimal places
      button = gtk_spin_button_new (adjustment, 0.001, 3);
      gtk_container_add (GTK_CONTAINER (window), button);
    
      gtk_widget_show_all (window);
    }
    ```
*/
class SpinButton : gtk.entry.Entry, gtk.orientable.Orientable
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

  /** */
  @property gtk.adjustment.Adjustment adjustment()
  {
    return getAdjustment();
  }

  /** */
  @property void adjustment(gtk.adjustment.Adjustment propval)
  {
    return setAdjustment(propval);
  }

  /** */
  @property double climbRate()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("climb-rate");
  }

  /** */
  @property void climbRate(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("climb-rate", propval);
  }

  /** */
  @property uint digits()
  {
    return getDigits();
  }

  /** */
  @property void digits(uint propval)
  {
    return setDigits(propval);
  }

  /** */
  @property bool numeric()
  {
    return getNumeric();
  }

  /** */
  @property void numeric(bool propval)
  {
    return setNumeric(propval);
  }

  /** */
  @property bool snapToTicks()
  {
    return getSnapToTicks();
  }

  /** */
  @property void snapToTicks(bool propval)
  {
    return setSnapToTicks(propval);
  }

  /** */
  @property gtk.types.SpinButtonUpdatePolicy updatePolicy()
  {
    return getUpdatePolicy();
  }

  /** */
  @property void updatePolicy(gtk.types.SpinButtonUpdatePolicy propval)
  {
    return setUpdatePolicy(propval);
  }

  /** */
  @property double value()
  {
    return getValue();
  }

  /** */
  @property void value(double propval)
  {
    return setValue(propval);
  }

  /** */
  @property bool wrap()
  {
    return getWrap();
  }

  /** */
  @property void wrap(bool propval)
  {
    return setWrap(propval);
  }

  mixin OrientableT!();

  /**
      Creates a new #GtkSpinButton.
  
      Params:
        adjustment = the #GtkAdjustment object that this spin
              button should use, or null
        climbRate = specifies by how much the rate of change in the value will
              accelerate if you continue to hold down an up/down button or arrow key
        digits = the number of decimal places to display
      Returns: The new spin button as a #GtkWidget
  */
  this(gtk.adjustment.Adjustment adjustment, double climbRate, uint digits)
  {
    GtkWidget* _cretval;
    _cretval = gtk_spin_button_new(adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null, climbRate, digits);
    this(_cretval, No.Take);
  }

  /**
      This is a convenience constructor that allows creation of a numeric
      #GtkSpinButton without manually creating an adjustment. The value is
      initially set to the minimum value and a page increment of 10 * step
      is the default. The precision of the spin button is equivalent to the
      precision of step.
      
      Note that the way in which the precision is derived works best if step
      is a power of ten. If the resulting precision is not suitable for your
      needs, use [gtk.spin_button.SpinButton.setDigits] to correct it.
  
      Params:
        min = Minimum allowable value
        max = Maximum allowable value
        step = Increment added or subtracted by spinning the widget
      Returns: The new spin button as a #GtkWidget
  */
  static gtk.spin_button.SpinButton newWithRange(double min, double max, double step)
  {
    GtkWidget* _cretval;
    _cretval = gtk_spin_button_new_with_range(min, max, step);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.spin_button.SpinButton)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Changes the properties of an existing spin button. The adjustment,
      climb rate, and number of decimal places are updated accordingly.
  
      Params:
        adjustment = a #GtkAdjustment to replace the spin button’s
              existing adjustment, or null to leave its current adjustment unchanged
        climbRate = the new climb rate
        digits = the number of decimal places to display in the spin button
  */
  void configure(gtk.adjustment.Adjustment adjustment, double climbRate, uint digits)
  {
    gtk_spin_button_configure(cast(GtkSpinButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null, climbRate, digits);
  }

  /**
      Get the adjustment associated with a #GtkSpinButton
      Returns: the #GtkAdjustment of spin_button
  */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_spin_button_get_adjustment(cast(GtkSpinButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Fetches the precision of spin_button. See [gtk.spin_button.SpinButton.setDigits].
      Returns: the current precision
  */
  uint getDigits()
  {
    uint _retval;
    _retval = gtk_spin_button_get_digits(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current step and page the increments used by spin_button. See
      [gtk.spin_button.SpinButton.setIncrements].
  
      Params:
        step = location to store step increment, or null
        page = location to store page increment, or null
  */
  void getIncrements(out double step, out double page)
  {
    gtk_spin_button_get_increments(cast(GtkSpinButton*)this._cPtr, cast(double*)&step, cast(double*)&page);
  }

  /**
      Returns whether non-numeric text can be typed into the spin button.
      See [gtk.spin_button.SpinButton.setNumeric].
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
        min = location to store minimum allowed value, or null
        max = location to store maximum allowed value, or null
  */
  void getRange(out double min, out double max)
  {
    gtk_spin_button_get_range(cast(GtkSpinButton*)this._cPtr, cast(double*)&min, cast(double*)&max);
  }

  /**
      Returns whether the values are corrected to the nearest step.
      See [gtk.spin_button.SpinButton.setSnapToTicks].
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
      exceeded. See [gtk.spin_button.SpinButton.setWrap].
      Returns: true if the spin button wraps around
  */
  bool getWrap()
  {
    bool _retval;
    _retval = cast(bool)gtk_spin_button_get_wrap(cast(GtkSpinButton*)this._cPtr);
    return _retval;
  }

  /**
      Replaces the #GtkAdjustment associated with spin_button.
  
      Params:
        adjustment = a #GtkAdjustment to replace the existing adjustment
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_spin_button_set_adjustment(cast(GtkSpinButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Set the precision to be displayed by spin_button. Up to 20 digit precision
      is allowed.
  
      Params:
        digits = the number of digits after the decimal point to be displayed for the spin button’s value
  */
  void setDigits(uint digits)
  {
    gtk_spin_button_set_digits(cast(GtkSpinButton*)this._cPtr, digits);
  }

  /**
      Sets the step and page increments for spin_button.  This affects how
      quickly the value changes when the spin button’s arrows are activated.
  
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
      This determines whether the spin button is always updated
      or only when a valid value is set.
  
      Params:
        policy = a #GtkSpinButtonUpdatePolicy value
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
        direction = a #GtkSpinType indicating the direction to spin
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
      Connect to `ChangeValue` signal.
  
      The ::change-value signal is a [keybinding signal][GtkBindingSignal]
      which gets emitted when the user initiates a value change.
      
      Applications should not connect to it, but may emit it with
      [gobject.global.signalEmitByName] if they need to control the cursor
      programmatically.
      
      The default bindings for this signal are Up/Down and PageUp and/PageDown.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.types.ScrollType scroll, gtk.spin_button.SpinButton spinButton))
  
          `scroll` a #GtkScrollType to specify the speed and amount of change (optional)
  
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
  
      The ::output signal can be used to change to formatting
      of the value that is displayed in the spin buttons entry.
      ```c
      // show leading zeros
      static gboolean
      on_output (GtkSpinButton *spin,
                 gpointer       data)
      {
         GtkAdjustment *adjustment;
         gchar *text;
         int value;
      
         adjustment = gtk_spin_button_get_adjustment (spin);
         value = (int)gtk_adjustment_get_value (adjustment);
         text = g_strdup_printf ("%02d", value);
         gtk_entry_set_text (GTK_ENTRY (spin), text);
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
  
      The ::value-changed signal is emitted when the value represented by
      spinbutton changes. Also see the #GtkSpinButton::output signal.
  
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
  
      The ::wrapped signal is emitted right after the spinbutton wraps
      from its maximum to minimum value or vice-versa.
  
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
