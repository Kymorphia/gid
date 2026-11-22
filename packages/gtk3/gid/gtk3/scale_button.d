/// Module for [ScaleButton] class
module gid.gtk3.scale_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.adjustment;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.button;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.orientable;
import gid.gtk3.orientable_mixin;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkScaleButton provides a button which pops up a scale widget.
    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK+ provides a #GtkVolumeButton subclass that
    is tailored for this use case.
    
    # CSS nodes
    
    GtkScaleButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .scale style class.
    
    The popup widget that contains the scale has a .scale-popup style class.
*/
class ScaleButton : gid.gtk3.button.Button, gid.gtk3.orientable.Orientable
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
      Get builder for [gid.gtk3.scale_button.ScaleButton]
      Returns: New builder object
  */
  static ScaleButtonGidBuilder builder() nothrow
  {
    return new ScaleButtonGidBuilder;
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
        #GtkScaleButton reflects the current value of the scale
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
          #GtkScaleButton reflects the current value of the scale
          better for the users.
  */
  @property void icons(string[] propval) nothrow
  {
    setIcons(propval);
  }

  /** */
  @property gid.gtk3.types.IconSize size() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.types.IconSize)("size");
  }

  /** */
  @property void size(gid.gtk3.types.IconSize propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.types.IconSize)("size", propval);
  }

  /** */
  @property double value() nothrow
  {
    return getValue();
  }

  /** */
  @property void value(double propval) nothrow
  {
    setValue(propval);
  }

  mixin OrientableT!();

  /**
      Creates a #GtkScaleButton, with a range between min and max, with
      a stepping of step.
  
      Params:
        size = a stock icon size (#GtkIconSize)
        min = the minimum value of the scale (usually 0)
        max = the maximum value of the scale (usually 100)
        step = the stepping of value when a scroll-wheel event,
                 or up/down arrow event occurs (usually 2)
        icons = a null-terminated
                  array of icon names, or null if you want to set the list
                  later with [gid.gtk4.scale_button.ScaleButton.setIcons]
      Returns: a new #GtkScaleButton
  */
  this(gid.gtk3.types.IconSize size, double min, double max, double step, string[] icons = null) nothrow
  {
    GtkWidget* _cretval;
    auto _icons_arr = new char*[](icons.length + 1);
    auto _icons = cast(char**)_icons_arr.ptr;
    foreach (i, s; icons) _icons[i] = s.toCString!(No.Malloc);
    _cretval = gtk_scale_button_new(size, min, max, step, _icons);
    this(_cretval, No.Take);
  }

  /**
      Gets the #GtkAdjustment associated with the #GtkScaleButton’s scale.
      See [gid.gtk4.range.Range.getAdjustment] for details.
      Returns: the adjustment associated with the scale
  */
  gid.gtk3.adjustment.Adjustment getAdjustment() nothrow
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scale_button_get_adjustment(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the minus button of the #GtkScaleButton.
      Returns: the minus button of the #GtkScaleButton as a #GtkButton
  */
  gid.gtk3.button.Button getMinusButton() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_minus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the plus button of the #GtkScaleButton.
      Returns: the plus button of the #GtkScaleButton as a #GtkButton
  */
  gid.gtk3.button.Button getPlusButton() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_plus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the popup of the #GtkScaleButton.
      Returns: the popup of the #GtkScaleButton
  */
  gid.gtk3.widget.Widget getPopup() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_popup(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
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
      Sets the #GtkAdjustment to be used as a model
      for the #GtkScaleButton’s scale.
      See [gid.gtk4.range.Range.setAdjustment] for details.
  
      Params:
        adjustment = a #GtkAdjustment
  */
  void setAdjustment(gid.gtk3.adjustment.Adjustment adjustment) nothrow
  {
    gtk_scale_button_set_adjustment(cast(GtkScaleButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the icons to be used by the scale button.
      For details, see the #GtkScaleButton:icons property.
  
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
      Sets the current value of the scale; if the value is outside
      the minimum or maximum range values, it will be clamped to fit
      inside them. The scale button emits the #GtkScaleButton::value-changed
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
  
      The ::popdown signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to popdown the scale widget.
        
        The default binding for this signal is Escape.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.scale_button.ScaleButton scaleButton)`
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopdown(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.scale_button.ScaleButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.scale_button.ScaleButton.popdown");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popdown", closure, after);
  }

  /**
      Connect to `Popup` signal.
  
      The ::popup signal is a
        [keybinding signal][GtkBindingSignal]
        which gets emitted to popup the scale widget.
        
        The default bindings for this signal are Space, Enter and Return.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.scale_button.ScaleButton scaleButton)`
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPopup(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.scale_button.ScaleButton)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.scale_button.ScaleButton.popup");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("popup", closure, after);
  }

  /**
      Connect to `ValueChanged` signal.
  
      The ::value-changed signal is emitted when the value field has
        changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(double value, gid.gtk3.scale_button.ScaleButton scaleButton)`
  
          `value` the new value (optional)
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectValueChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.scale_button.ScaleButton)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.scale_button.ScaleButton.valueChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("value-changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk3.scale_button.ScaleButton]
class ScaleButtonGidBuilderImpl(T) : gid.gtk3.button.ButtonGidBuilderImpl!T, gid.gtk3.orientable.OrientableGidBuilderImpl!T
{

  mixin OrientableGidBuilderT!();

  /** */
  T adjustment(gid.gtk3.adjustment.Adjustment propval) nothrow
  {
    return setProperty("adjustment", propval);
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
          #GtkScaleButton reflects the current value of the scale
          better for the users.
      Returns: Builder instance for fluent chaining
  */
  T icons(string[] propval) nothrow
  {
    return setProperty("icons", propval);
  }

  /** */
  T size(gid.gtk3.types.IconSize propval) nothrow
  {
    return setProperty("size", propval);
  }

  /** */
  T value(double propval) nothrow
  {
    return setProperty("value", propval);
  }
}

/// Fluent builder for [gid.gtk3.scale_button.ScaleButton]
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
