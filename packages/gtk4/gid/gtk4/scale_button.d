/// Module for [ScaleButton] class
module gid.gtk4.scale_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.accessible_range;
import gid.gtk4.accessible_range_mixin;
import gid.gtk4.adjustment;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.button;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.orientable;
import gid.gtk4.orientable_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Provides a button which pops up a scale widget.
    
    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK provides a [gid.gtk4.volume_button.VolumeButton] subclass that
    is tailored for this use case.
    
    # Shortcuts and Gestures
    
    The following signals have default keybindings:
    
    - [gid.gtk4.scale_button.ScaleButton.popup]
    
    # CSS nodes
    
    ```
    scalebutton.scale
    ╰── button.toggle
        ╰── <icon>
    ```
    
    [gid.gtk4.scale_button.ScaleButton] has a single CSS node with name scalebutton and `.scale`
    style class, and contains a `button` node with a `.toggle` style class.
*/
@gidGir("ScaleButton", "ScaleButtonClass")
class ScaleButton : gid.gtk4.widget.Widget, gid.gtk4.accessible_range.AccessibleRange, gid.gtk4.orientable.Orientable
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
    return cast(void function())gtk_scale_button_get_type != &gidSymbolNotFound ? gtk_scale_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkScaleButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaleButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.scale_button.ScaleButton]
      Returns: New builder object
  */
  static ScaleButtonGidBuilder builder() nothrow
  {
    return new ScaleButtonGidBuilder;
  }

  /**
      Get `active` property.
      Returns: If the scale button should be pressed in.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Get `adjustment` property.
      Returns: The [gid.gtk4.adjustment.Adjustment] that is used as the model.
  */
  @property gid.gtk4.adjustment.Adjustment adjustment() nothrow
  {
    return getAdjustment();
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The [gid.gtk4.adjustment.Adjustment] that is used as the model.
  */
  @property void adjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    setAdjustment(propval);
  }

  /**
      Get `hasFrame` property.
      Returns: If the scale button has a frame.
  */
  @property bool hasFrame() nothrow
  {
    return getHasFrame();
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = If the scale button has a frame.
  */
  @property void hasFrame(bool propval) nothrow
  {
    setHasFrame(propval);
  }

  /**
      Get `icons` property.
      Returns: The names of the icons to be used by the scale button.
        
        The first item in the array will be used in the button
        when the current value is the lowest value, the second
        item for the highest value. All the subsequent icons will
        be used for all the other values, spread evenly over the
        range of values.
        
        If there's only one icon name in the @icons array, it will
        be used for all the values. If only two icon names are in
        the @icons array, the first one will be used for the bottom
        50% of the scale, and the second one for the top 50%.
        
        It is recommended to use at least 3 icons so that the
        [gid.gtk4.scale_button.ScaleButton] reflects the current value of the scale
        better for the users.
  */
  @property string[] icons() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string[])("icons");
  }

  /**
      Set `icons` property.
      Params:
        propval = The names of the icons to be used by the scale button.
          
          The first item in the array will be used in the button
          when the current value is the lowest value, the second
          item for the highest value. All the subsequent icons will
          be used for all the other values, spread evenly over the
          range of values.
          
          If there's only one icon name in the @icons array, it will
          be used for all the values. If only two icon names are in
          the @icons array, the first one will be used for the bottom
          50% of the scale, and the second one for the top 50%.
          
          It is recommended to use at least 3 icons so that the
          [gid.gtk4.scale_button.ScaleButton] reflects the current value of the scale
          better for the users.
  */
  @property void icons(string[] propval) nothrow
  {
    setIcons(propval);
  }

  /**
      Get `value` property.
      Returns: The value of the scale.
  */
  @property double value() nothrow
  {
    return getValue();
  }

  /**
      Set `value` property.
      Params:
        propval = The value of the scale.
  */
  @property void value(double propval) nothrow
  {
    setValue(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a [gid.gtk4.scale_button.ScaleButton].
      
      The new scale button has a range between min and max,
      with a stepping of step.
  
      Params:
        min = the minimum value of the scale (usually 0)
        max = the maximum value of the scale (usually 100)
        step = the stepping of value when a scroll-wheel event,
            or up/down arrow event occurs (usually 2)
        icons = a null-terminated
            array of icon names, or null if you want to set the list
            later with [gid.gtk4.scale_button.ScaleButton.setIcons]
      Returns: a new [gid.gtk4.scale_button.ScaleButton]
  */
  this(double min, double max, double step, string[] icons = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      auto _icons_arr = new char*[](icons.length + 1);
      auto _icons = cast(char**)_icons_arr.ptr;
      foreach (i, s; icons) _icons[i] = s.toCString!(No.Malloc);
      _cretval = gtk_scale_button_new(min, max, step, _icons);
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncValueChanged(double value)
  {
    auto _klass = cast(GtkScaleButtonClass*)_vfuncClass;
    if (!_klass.valueChanged)
      return;

    _klass.valueChanged(cast(GtkScaleButton*)this._cPtr, value);
  }

  /**
      Queries a [gid.gtk4.scale_button.ScaleButton] and returns its current state.
      
      Returns true if the scale button is pressed in and false
      if it is raised.
      Returns: whether the button is pressed
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_button_get_active(cast(GtkScaleButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.gtk4.adjustment.Adjustment] associated with the [gid.gtk4.scale_button.ScaleButton]’s scale.
      
      See [gid.gtk4.range.Range.getAdjustment] for details.
      Returns: the adjustment associated with the scale
  */
  gid.gtk4.adjustment.Adjustment getAdjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scale_button_get_adjustment(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the button has a frame.
      Returns: true if the button has a frame
  */
  bool getHasFrame() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_button_get_has_frame(cast(GtkScaleButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the minus button of the [gid.gtk4.scale_button.ScaleButton].
      Returns: the minus button
          of the [gid.gtk4.scale_button.ScaleButton]
  */
  gid.gtk4.button.Button getMinusButton() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_minus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the plus button of the `GtkScaleButton.`
      Returns: the plus button
          of the [gid.gtk4.scale_button.ScaleButton]
  */
  gid.gtk4.button.Button getPlusButton() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_plus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the popup of the [gid.gtk4.scale_button.ScaleButton].
      Returns: the popup of the [gid.gtk4.scale_button.ScaleButton]
  */
  gid.gtk4.widget.Widget getPopup() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_popup(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current value of the scale button.
      Returns: current value of the scale button
  */
  double getValue() nothrow
  {
    double _retval;
    _retval = gtk_scale_button_get_value(cast(GtkScaleButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the [gid.gtk4.adjustment.Adjustment] to be used as a model
      for the [gid.gtk4.scale_button.ScaleButton]’s scale.
      
      See [gid.gtk4.range.Range.setAdjustment] for details.
  
      Params:
        adjustment = a [gid.gtk4.adjustment.Adjustment]
  */
  void setAdjustment(gid.gtk4.adjustment.Adjustment adjustment) nothrow
  {
    gtk_scale_button_set_adjustment(cast(GtkScaleButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the style of the button.
  
      Params:
        hasFrame = whether the button should have a visible frame
  */
  void setHasFrame(bool hasFrame) nothrow
  {
    gtk_scale_button_set_has_frame(cast(GtkScaleButton*)this._cPtr, hasFrame);
  }

  /**
      Sets the icons to be used by the scale button.
  
      Params:
        icons = a null-terminated array of icon names
  */
  void setIcons(string[] icons) nothrow
  {
    auto _icons_arr = new char*[](icons.length + 1);
    auto _icons = cast(char**)_icons_arr.ptr;
    foreach (i, s; icons) _icons[i] = s.toCString!(No.Malloc);
    gtk_scale_button_set_icons(cast(GtkScaleButton*)this._cPtr, _icons);
  }

  /**
      Sets the current value of the scale.
      
      If the value is outside the minimum or maximum range values,
      it will be clamped to fit inside them.
      
      The scale button emits the [gid.gtk4.scale_button.ScaleButton.valueChanged]
      signal if the value changes.
  
      Params:
        value = new value of the scale button
  */
  void setValue(double value) nothrow
  {
    gtk_scale_button_set_value(cast(GtkScaleButton*)this._cPtr, value);
  }

  /**
      Connect to `Popdown` signal.
  
      Emitted to dismiss the popup.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default binding for this signal is <kbd>Escape</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.scale_button.ScaleButton scaleButton)`
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopdown(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.scale_button.ScaleButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.scale_button.ScaleButton.popdown");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popdown", closure, after);
  }

  /**
      Connect to `Popup` signal.
  
      Emitted to popup the scale widget.
        
        This is a [keybinding signal](class.SignalAction.html).
        
        The default bindings for this signal are <kbd>Space</kbd>,
        <kbd>Enter</kbd> and <kbd>Return</kbd>.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.scale_button.ScaleButton scaleButton)`
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.scale_button.ScaleButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.scale_button.ScaleButton.popup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popup", closure, after);
  }

  /**
      Connect to `ValueChanged` signal.
  
      Emitted when the value field has changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double value, gid.gtk4.scale_button.ScaleButton scaleButton)`
  
          `value` the new value (optional)
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.scale_button.ScaleButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.scale_button.ScaleButton.valueChanged");
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
        T = D class derived from ScaleButton
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk4.scale_button.ScaleButton), T.stringof ~ " is not derived from gid.gtk4.scale_button.ScaleButton");

    gid.gtk4.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncValueChanged", true)[0]) == gid.gtk4.scale_button.ScaleButton))
      _installVfunc(klass, "value_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkScaleButtonClass*)klass;

    switch (vfunc)
    {
      case "value_changed":
      {
        static extern(C) void _vfuncValueChangedTramp(GtkScaleButton* button, double value) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk4.scale_button.ScaleButton)(cast(void*)button);
          if (!_obj)
          {
            auto _klass = cast(GtkScaleButtonClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)button);
            if (_klass.valueChanged)
              return (cast(typeof(&_vfuncValueChangedTramp))_klass.valueChanged)(button, value);
            return;
          }

          try
          {
            _obj.vfuncValueChanged(value);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.scale_button.ScaleButton.vfuncValueChanged");
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

/// Fluent builder implementation template for [gid.gtk4.scale_button.ScaleButton]
class ScaleButtonGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.accessible_range.AccessibleRangeGidBuilderImpl!T, gid.gtk4.orientable.OrientableGidBuilderImpl!T
{

  mixin AccessibleRangeGidBuilderT!();
  mixin OrientableGidBuilderT!();

  /**
      Set `adjustment` property.
      Params:
        propval = The [gid.gtk4.adjustment.Adjustment] that is used as the model.
      Returns: Builder instance for fluent chaining
  */
  T adjustment(gid.gtk4.adjustment.Adjustment propval) nothrow
  {
    return setProperty("adjustment", propval);
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = If the scale button has a frame.
      Returns: Builder instance for fluent chaining
  */
  T hasFrame(bool propval) nothrow
  {
    return setProperty("has-frame", propval);
  }

  /**
      Set `icons` property.
      Params:
        propval = The names of the icons to be used by the scale button.
          
          The first item in the array will be used in the button
          when the current value is the lowest value, the second
          item for the highest value. All the subsequent icons will
          be used for all the other values, spread evenly over the
          range of values.
          
          If there's only one icon name in the @icons array, it will
          be used for all the values. If only two icon names are in
          the @icons array, the first one will be used for the bottom
          50% of the scale, and the second one for the top 50%.
          
          It is recommended to use at least 3 icons so that the
          [gid.gtk4.scale_button.ScaleButton] reflects the current value of the scale
          better for the users.
      Returns: Builder instance for fluent chaining
  */
  T icons(string[] propval) nothrow
  {
    return setProperty("icons", propval);
  }

  /**
      Set `value` property.
      Params:
        propval = The value of the scale.
      Returns: Builder instance for fluent chaining
  */
  T value(double propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [gid.gtk4.scale_button.ScaleButton]
final class ScaleButtonGidBuilder : ScaleButtonGidBuilderImpl!ScaleButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScaleButton build() nothrow
  {
    return new ScaleButton(cast(void*)createGObject(ScaleButton._getGType), Yes.Take);
  }
}
