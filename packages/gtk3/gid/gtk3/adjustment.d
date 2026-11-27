/// Module for [Adjustment] class
module gid.gtk3.adjustment;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;

/**
    The #GtkAdjustment object represents a value which has an associated lower
    and upper bound, together with step and page increments, and a page size.
    It is used within several GTK+ widgets, including #GtkSpinButton, #GtkViewport,
    and #GtkRange (which is a base class for #GtkScrollbar and #GtkScale).
    
    The #GtkAdjustment object does not update the value itself. Instead
    it is left up to the owner of the #GtkAdjustment to control the value.
*/
@gidGir("Adjustment", "AdjustmentClass")
class Adjustment : gid.gobject2.initially_unowned.InitiallyUnowned
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
    return cast(void function())gtk_adjustment_get_type != &gidSymbolNotFound ? gtk_adjustment_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAdjustment";
  }

  /** Returns `this`, for use in `with` statements. */
  override Adjustment self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.adjustment.Adjustment]
      Returns: New builder object
  */
  static AdjustmentGidBuilder builder() nothrow
  {
    return new AdjustmentGidBuilder;
  }

  /**
      Get `lower` property.
      Returns: The minimum value of the adjustment.
  */
  @property double lower() nothrow
  {
    return getLower();
  }

  /**
      Set `lower` property.
      Params:
        propval = The minimum value of the adjustment.
  */
  @property void lower(double propval) nothrow
  {
    setLower(propval);
  }

  /**
      Get `pageIncrement` property.
      Returns: The page increment of the adjustment.
  */
  @property double pageIncrement() nothrow
  {
    return getPageIncrement();
  }

  /**
      Set `pageIncrement` property.
      Params:
        propval = The page increment of the adjustment.
  */
  @property void pageIncrement(double propval) nothrow
  {
    setPageIncrement(propval);
  }

  /**
      Get `pageSize` property.
      Returns: The page size of the adjustment.
        Note that the page-size is irrelevant and should be set to zero
        if the adjustment is used for a simple scalar value, e.g. in a
        #GtkSpinButton.
  */
  @property double pageSize() nothrow
  {
    return getPageSize();
  }

  /**
      Set `pageSize` property.
      Params:
        propval = The page size of the adjustment.
          Note that the page-size is irrelevant and should be set to zero
          if the adjustment is used for a simple scalar value, e.g. in a
          #GtkSpinButton.
  */
  @property void pageSize(double propval) nothrow
  {
    setPageSize(propval);
  }

  /**
      Get `stepIncrement` property.
      Returns: The step increment of the adjustment.
  */
  @property double stepIncrement() nothrow
  {
    return getStepIncrement();
  }

  /**
      Set `stepIncrement` property.
      Params:
        propval = The step increment of the adjustment.
  */
  @property void stepIncrement(double propval) nothrow
  {
    setStepIncrement(propval);
  }

  /**
      Get `upper` property.
      Returns: The maximum value of the adjustment.
        Note that values will be restricted by
        `upper - page-size` if the page-size
        property is nonzero.
  */
  @property double upper() nothrow
  {
    return getUpper();
  }

  /**
      Set `upper` property.
      Params:
        propval = The maximum value of the adjustment.
          Note that values will be restricted by
          `upper - page-size` if the page-size
          property is nonzero.
  */
  @property void upper(double propval) nothrow
  {
    setUpper(propval);
  }

  /**
      Get `value` property.
      Returns: The value of the adjustment.
  */
  @property double value() nothrow
  {
    return getValue();
  }

  /**
      Set `value` property.
      Params:
        propval = The value of the adjustment.
  */
  @property void value(double propval) nothrow
  {
    setValue(propval);
  }

  /**
      Creates a new #GtkAdjustment.
  
      Params:
        value = the initial value
        lower = the minimum value
        upper = the maximum value
        stepIncrement = the step increment
        pageIncrement = the page increment
        pageSize = the page size
      Returns: a new #GtkAdjustment
  */
  this(double value, double lower, double upper, double stepIncrement, double pageIncrement, double pageSize) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkAdjustment* _cretval;
      _cretval = gtk_adjustment_new(value, lower, upper, stepIncrement, pageIncrement, pageSize);
      this(_cretval, No.Take);
    }
  }

  /**
      Emits a #GtkAdjustment::changed signal from the #GtkAdjustment.
      This is typically called by the owner of the #GtkAdjustment after it has
      changed any of the #GtkAdjustment properties other than the value.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: GTK+ emits #GtkAdjustment::changed itself whenever any
           of the properties (other than value) change
  */
  protected void vfuncChanged()
  {
    auto _klass = cast(GtkAdjustmentClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GtkAdjustment*)this._cPtr);
  }

  /**
      Emits a #GtkAdjustment::value-changed signal from the #GtkAdjustment.
      This is typically called by the owner of the #GtkAdjustment after it has
      changed the #GtkAdjustment:value property.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncValueChanged` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: GTK+ emits #GtkAdjustment::value-changed itself whenever
           the value changes
  */
  protected void vfuncValueChanged()
  {
    auto _klass = cast(GtkAdjustmentClass*)_vfuncClass;
    if (!_klass.valueChanged)
      return;

    _klass.valueChanged(cast(GtkAdjustment*)this._cPtr);
  }

  /**
      Emits a #GtkAdjustment::changed signal from the #GtkAdjustment.
      This is typically called by the owner of the #GtkAdjustment after it has
      changed any of the #GtkAdjustment properties other than the value.
  
      Deprecated: GTK+ emits #GtkAdjustment::changed itself whenever any
           of the properties (other than value) change
  */
  void changed() nothrow
  {
    gtk_adjustment_changed(cast(GtkAdjustment*)this._cPtr);
  }

  /**
      Updates the #GtkAdjustment:value property to ensure that the range
      between lower and upper is in the current page (i.e. between
      #GtkAdjustment:value and #GtkAdjustment:value + #GtkAdjustment:page-size).
      If the range is larger than the page size, then only the start of it will
      be in the current page.
      
      A #GtkAdjustment::value-changed signal will be emitted if the value is changed.
  
      Params:
        lower = the lower value
        upper = the upper value
  */
  void clampPage(double lower, double upper) nothrow
  {
    gtk_adjustment_clamp_page(cast(GtkAdjustment*)this._cPtr, lower, upper);
  }

  /**
      Sets all properties of the adjustment at once.
      
      Use this function to avoid multiple emissions of the
      #GtkAdjustment::changed signal. See [gid.gtk4.adjustment.Adjustment.setLower]
      for an alternative way of compressing multiple emissions of
      #GtkAdjustment::changed into one.
  
      Params:
        value = the new value
        lower = the new minimum value
        upper = the new maximum value
        stepIncrement = the new step increment
        pageIncrement = the new page increment
        pageSize = the new page size
  */
  void configure(double value, double lower, double upper, double stepIncrement, double pageIncrement, double pageSize) nothrow
  {
    gtk_adjustment_configure(cast(GtkAdjustment*)this._cPtr, value, lower, upper, stepIncrement, pageIncrement, pageSize);
  }

  /**
      Retrieves the minimum value of the adjustment.
      Returns: The current minimum value of the adjustment
  */
  double getLower() nothrow
  {
    double _retval;
    _retval = gtk_adjustment_get_lower(cast(GtkAdjustment*)this._cPtr);
    return _retval;
  }

  /**
      Gets the smaller of step increment and page increment.
      Returns: the minimum increment of adjustment
  */
  double getMinimumIncrement() nothrow
  {
    double _retval;
    _retval = gtk_adjustment_get_minimum_increment(cast(GtkAdjustment*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the page increment of the adjustment.
      Returns: The current page increment of the adjustment
  */
  double getPageIncrement() nothrow
  {
    double _retval;
    _retval = gtk_adjustment_get_page_increment(cast(GtkAdjustment*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the page size of the adjustment.
      Returns: The current page size of the adjustment
  */
  double getPageSize() nothrow
  {
    double _retval;
    _retval = gtk_adjustment_get_page_size(cast(GtkAdjustment*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the step increment of the adjustment.
      Returns: The current step increment of the adjustment.
  */
  double getStepIncrement() nothrow
  {
    double _retval;
    _retval = gtk_adjustment_get_step_increment(cast(GtkAdjustment*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the maximum value of the adjustment.
      Returns: The current maximum value of the adjustment
  */
  double getUpper() nothrow
  {
    double _retval;
    _retval = gtk_adjustment_get_upper(cast(GtkAdjustment*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current value of the adjustment.
      See [gid.gtk4.adjustment.Adjustment.setValue].
      Returns: The current value of the adjustment
  */
  double getValue() nothrow
  {
    double _retval;
    _retval = gtk_adjustment_get_value(cast(GtkAdjustment*)this._cPtr);
    return _retval;
  }

  /**
      Sets the minimum value of the adjustment.
      
      When setting multiple adjustment properties via their individual
      setters, multiple #GtkAdjustment::changed signals will be emitted.
      However, since the emission of the #GtkAdjustment::changed signal
      is tied to the emission of the #GObject::notify signals of the changed
      properties, it’s possible to compress the #GtkAdjustment::changed
      signals into one by calling [gid.gobject2.object.ObjectWrap.freezeNotify] and
      [gid.gobject2.object.ObjectWrap.thawNotify] around the calls to the individual setters.
      
      Alternatively, using a single [gid.gobject2.object.ObjectWrap.set] for all the properties
      to change, or using [gid.gtk4.adjustment.Adjustment.configure] has the same effect
      of compressing #GtkAdjustment::changed emissions.
  
      Params:
        lower = the new minimum value
  */
  void setLower(double lower) nothrow
  {
    gtk_adjustment_set_lower(cast(GtkAdjustment*)this._cPtr, lower);
  }

  /**
      Sets the page increment of the adjustment.
      
      See [gid.gtk4.adjustment.Adjustment.setLower] about how to compress multiple
      emissions of the #GtkAdjustment::changed signal when setting
      multiple adjustment properties.
  
      Params:
        pageIncrement = the new page increment
  */
  void setPageIncrement(double pageIncrement) nothrow
  {
    gtk_adjustment_set_page_increment(cast(GtkAdjustment*)this._cPtr, pageIncrement);
  }

  /**
      Sets the page size of the adjustment.
      
      See [gid.gtk4.adjustment.Adjustment.setLower] about how to compress multiple
      emissions of the GtkAdjustment::changed signal when setting
      multiple adjustment properties.
  
      Params:
        pageSize = the new page size
  */
  void setPageSize(double pageSize) nothrow
  {
    gtk_adjustment_set_page_size(cast(GtkAdjustment*)this._cPtr, pageSize);
  }

  /**
      Sets the step increment of the adjustment.
      
      See [gid.gtk4.adjustment.Adjustment.setLower] about how to compress multiple
      emissions of the #GtkAdjustment::changed signal when setting
      multiple adjustment properties.
  
      Params:
        stepIncrement = the new step increment
  */
  void setStepIncrement(double stepIncrement) nothrow
  {
    gtk_adjustment_set_step_increment(cast(GtkAdjustment*)this._cPtr, stepIncrement);
  }

  /**
      Sets the maximum value of the adjustment.
      
      Note that values will be restricted by `upper - page-size`
      if the page-size property is nonzero.
      
      See [gid.gtk4.adjustment.Adjustment.setLower] about how to compress multiple
      emissions of the #GtkAdjustment::changed signal when setting
      multiple adjustment properties.
  
      Params:
        upper = the new maximum value
  */
  void setUpper(double upper) nothrow
  {
    gtk_adjustment_set_upper(cast(GtkAdjustment*)this._cPtr, upper);
  }

  /**
      Sets the #GtkAdjustment value. The value is clamped to lie between
      #GtkAdjustment:lower and #GtkAdjustment:upper.
      
      Note that for adjustments which are used in a #GtkScrollbar, the
      effective range of allowed values goes from #GtkAdjustment:lower to
      #GtkAdjustment:upper - #GtkAdjustment:page-size.
  
      Params:
        value = the new value
  */
  void setValue(double value) nothrow
  {
    gtk_adjustment_set_value(cast(GtkAdjustment*)this._cPtr, value);
  }

  /**
      Emits a #GtkAdjustment::value-changed signal from the #GtkAdjustment.
      This is typically called by the owner of the #GtkAdjustment after it has
      changed the #GtkAdjustment:value property.
  
      Deprecated: GTK+ emits #GtkAdjustment::value-changed itself whenever
           the value changes
  */
  void valueChanged() nothrow
  {
    gtk_adjustment_value_changed(cast(GtkAdjustment*)this._cPtr);
  }

  /**
      Connect to `Changed` signal.
  
      Emitted when one or more of the #GtkAdjustment properties have been
        changed, other than the #GtkAdjustment:value property.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.adjustment.Adjustment adjustment)`
  
          `adjustment` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.adjustment.Adjustment)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.adjustment.Adjustment.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Connect to `ValueChanged` signal.
  
      Emitted when the #GtkAdjustment:value property has been changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.adjustment.Adjustment adjustment)`
  
          `adjustment` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.adjustment.Adjustment)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.adjustment.Adjustment.valueChanged");
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
        T = D class derived from Adjustment
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.adjustment.Adjustment), T.stringof ~ " is not derived from gid.gtk3.adjustment.Adjustment");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gtk3.adjustment.Adjustment))
      _installVfunc(klass, "changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncValueChanged", true)[0]) == gid.gtk3.adjustment.Adjustment))
      _installVfunc(klass, "value_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkAdjustmentClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkAdjustment* adjustment) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.adjustment.Adjustment)(cast(void*)adjustment);
          if (!_obj)
          {
            auto _klass = cast(GtkAdjustmentClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)adjustment);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(adjustment);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.adjustment.Adjustment.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      case "value_changed":
      {
        static extern(C) void _vfuncValueChangedTramp(GtkAdjustment* adjustment) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.adjustment.Adjustment)(cast(void*)adjustment);
          if (!_obj)
          {
            auto _klass = cast(GtkAdjustmentClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)adjustment);
            if (_klass.valueChanged)
              return (cast(typeof(&_vfuncValueChangedTramp))_klass.valueChanged)(adjustment);
            return;
          }

          try
          {
            _obj.vfuncValueChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.adjustment.Adjustment.vfuncValueChanged");
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

/// Fluent builder implementation template for [gid.gtk3.adjustment.Adjustment]
class AdjustmentGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{

  /**
      Set `lower` property.
      Params:
        propval = The minimum value of the adjustment.
      Returns: Builder instance for fluent chaining
  */
  T lower(double propval) nothrow
  {
    return setProperty("lower", propval);
  }

  /**
      Set `pageIncrement` property.
      Params:
        propval = The page increment of the adjustment.
      Returns: Builder instance for fluent chaining
  */
  T pageIncrement(double propval) nothrow
  {
    return setProperty("page-increment", propval);
  }

  /**
      Set `pageSize` property.
      Params:
        propval = The page size of the adjustment.
          Note that the page-size is irrelevant and should be set to zero
          if the adjustment is used for a simple scalar value, e.g. in a
          #GtkSpinButton.
      Returns: Builder instance for fluent chaining
  */
  T pageSize(double propval) nothrow
  {
    return setProperty("page-size", propval);
  }

  /**
      Set `stepIncrement` property.
      Params:
        propval = The step increment of the adjustment.
      Returns: Builder instance for fluent chaining
  */
  T stepIncrement(double propval) nothrow
  {
    return setProperty("step-increment", propval);
  }

  /**
      Set `upper` property.
      Params:
        propval = The maximum value of the adjustment.
          Note that values will be restricted by
          `upper - page-size` if the page-size
          property is nonzero.
      Returns: Builder instance for fluent chaining
  */
  T upper(double propval) nothrow
  {
    return setProperty("upper", propval);
  }

  /**
      Set `value` property.
      Params:
        propval = The value of the adjustment.
      Returns: Builder instance for fluent chaining
  */
  T value(double propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [gid.gtk3.adjustment.Adjustment]
final class AdjustmentGidBuilder : AdjustmentGidBuilderImpl!AdjustmentGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Adjustment build() nothrow
  {
    return new Adjustment(cast(void*)createGObject(Adjustment._getGType), Yes.Take);
  }
}
