/// Module for [ScaleButton] class
module gtk.scale_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.adjustment;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

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
class ScaleButton : gtk.button.Button, gtk.orientable.Orientable
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
    return cast(void function())gtk_scale_button_get_type != &gidSymbolNotFound ? gtk_scale_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScaleButton self()
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
  @property gtk.types.IconSize size()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.IconSize)("size");
  }

  /** */
  @property void size(gtk.types.IconSize propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.IconSize)("size", propval);
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
                  later with [gtk.scale_button.ScaleButton.setIcons]
      Returns: a new #GtkScaleButton
  */
  this(gtk.types.IconSize size, double min, double max, double step, string[] icons = null)
  {
    GtkWidget* _cretval;
    char*[] _tmpicons;
    foreach (s; icons)
      _tmpicons ~= s.toCString(No.Alloc);
    _tmpicons ~= null;
    const(char*)* _icons = _tmpicons.ptr;

    _cretval = gtk_scale_button_new(size, min, max, step, _icons);
    this(_cretval, No.Take);
  }

  /**
      Gets the #GtkAdjustment associated with the #GtkScaleButton’s scale.
      See [gtk.range.Range.getAdjustment] for details.
      Returns: the adjustment associated with the scale
  */
  gtk.adjustment.Adjustment getAdjustment()
  {
    GtkAdjustment* _cretval;
    _cretval = gtk_scale_button_get_adjustment(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.adjustment.Adjustment)(cast(GtkAdjustment*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the minus button of the #GtkScaleButton.
      Returns: the minus button of the #GtkScaleButton as a #GtkButton
  */
  gtk.button.Button getMinusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_minus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the plus button of the #GtkScaleButton.
      Returns: the plus button of the #GtkScaleButton as a #GtkButton
  */
  gtk.button.Button getPlusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_plus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the popup of the #GtkScaleButton.
      Returns: the popup of the #GtkScaleButton
  */
  gtk.widget.Widget getPopup()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_popup(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current value of the scale button.
      Returns: current value of the scale button
  */
  double getValue()
  {
    double _retval;
    _retval = gtk_scale_button_get_value(cast(GtkScaleButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the #GtkAdjustment to be used as a model
      for the #GtkScaleButton’s scale.
      See [gtk.range.Range.setAdjustment] for details.
  
      Params:
        adjustment = a #GtkAdjustment
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_scale_button_set_adjustment(cast(GtkScaleButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the icons to be used by the scale button.
      For details, see the #GtkScaleButton:icons property.
  
      Params:
        icons = a null-terminated array of icon names
  */
  void setIcons(string[] icons)
  {
    char*[] _tmpicons;
    foreach (s; icons)
      _tmpicons ~= s.toCString(No.Alloc);
    _tmpicons ~= null;
    const(char*)* _icons = _tmpicons.ptr;

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
  void setValue(double value)
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
  
          $(D void callback(gtk.scale_button.ScaleButton scaleButton))
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopdown(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.scale_button.ScaleButton)))
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
  
          $(D void callback(gtk.scale_button.ScaleButton scaleButton))
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectPopup(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.scale_button.ScaleButton)))
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
    return connectSignalClosure("popup", closure, after);
  }

  /**
      Connect to `ValueChanged` signal.
  
      The ::value-changed signal is emitted when the value field has
        changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(double value, gtk.scale_button.ScaleButton scaleButton))
  
          `value` the new value (optional)
  
          `scaleButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectValueChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == double)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.scale_button.ScaleButton)))
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
    return connectSignalClosure("value-changed", closure, after);
  }
}
