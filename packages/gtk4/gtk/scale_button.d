/// Module for [ScaleButton] class
module gtk.scale_button;

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
import gtk.button;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.orientable;
import gtk.orientable_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.scale_button.ScaleButton] provides a button which pops up a scale widget.
    
    This kind of widget is commonly used for volume controls in multimedia
    applications, and GTK provides a [gtk.volume_button.VolumeButton] subclass that
    is tailored for this use case.
    
    # CSS nodes
    
    ```
    scalebutton.scale
    ╰── button.toggle
        ╰── <icon>
    ```
    
    [gtk.scale_button.ScaleButton] has a single CSS node with name scalebutton and `.scale`
    style class, and contains a `button` node with a `.toggle` style class.
*/
class ScaleButton : gtk.widget.Widget, gtk.accessible_range.AccessibleRange, gtk.orientable.Orientable
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

  /**
      Get `active` property.
      Returns: If the scale button should be pressed in.
  */
  @property bool active()
  {
    return getActive();
  }

  /**
      Get `adjustment` property.
      Returns: The [gtk.adjustment.Adjustment] that is used as the model.
  */
  @property gtk.adjustment.Adjustment adjustment()
  {
    return getAdjustment();
  }

  /**
      Set `adjustment` property.
      Params:
        propval = The [gtk.adjustment.Adjustment] that is used as the model.
  */
  @property void adjustment(gtk.adjustment.Adjustment propval)
  {
    return setAdjustment(propval);
  }

  /**
      Get `hasFrame` property.
      Returns: If the scale button has a frame.
  */
  @property bool hasFrame()
  {
    return getHasFrame();
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = If the scale button has a frame.
  */
  @property void hasFrame(bool propval)
  {
    return setHasFrame(propval);
  }

  /**
      Get `value` property.
      Returns: The value of the scale.
  */
  @property double value()
  {
    return getValue();
  }

  /**
      Set `value` property.
      Params:
        propval = The value of the scale.
  */
  @property void value(double propval)
  {
    return setValue(propval);
  }

  mixin AccessibleRangeT!();
  mixin OrientableT!();

  /**
      Creates a [gtk.scale_button.ScaleButton].
      
      The new scale button has a range between min and max,
      with a stepping of step.
  
      Params:
        min = the minimum value of the scale (usually 0)
        max = the maximum value of the scale (usually 100)
        step = the stepping of value when a scroll-wheel event,
            or up/down arrow event occurs (usually 2)
        icons = a null-terminated
            array of icon names, or null if you want to set the list
            later with [gtk.scale_button.ScaleButton.setIcons]
      Returns: a new [gtk.scale_button.ScaleButton]
  */
  this(double min, double max, double step, string[] icons = null)
  {
    GtkWidget* _cretval;
    char*[] _tmpicons;
    foreach (s; icons)
      _tmpicons ~= s.toCString(No.Alloc);
    _tmpicons ~= null;
    const(char*)* _icons = _tmpicons.ptr;
    _cretval = gtk_scale_button_new(min, max, step, _icons);
    this(_cretval, No.Take);
  }

  /**
      Queries a [gtk.scale_button.ScaleButton] and returns its current state.
      
      Returns true if the scale button is pressed in and false
      if it is raised.
      Returns: whether the button is pressed
  */
  bool getActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_button_get_active(cast(GtkScaleButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gtk.adjustment.Adjustment] associated with the [gtk.scale_button.ScaleButton]’s scale.
      
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
      Returns whether the button has a frame.
      Returns: true if the button has a frame
  */
  bool getHasFrame()
  {
    bool _retval;
    _retval = cast(bool)gtk_scale_button_get_has_frame(cast(GtkScaleButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the minus button of the [gtk.scale_button.ScaleButton].
      Returns: the minus button
          of the [gtk.scale_button.ScaleButton]
  */
  gtk.button.Button getMinusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_minus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the plus button of the `GtkScaleButton.`
      Returns: the plus button
          of the [gtk.scale_button.ScaleButton]
  */
  gtk.button.Button getPlusButton()
  {
    GtkWidget* _cretval;
    _cretval = gtk_scale_button_get_plus_button(cast(GtkScaleButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.button.Button)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the popup of the [gtk.scale_button.ScaleButton].
      Returns: the popup of the [gtk.scale_button.ScaleButton]
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
      Sets the [gtk.adjustment.Adjustment] to be used as a model
      for the [gtk.scale_button.ScaleButton]’s scale.
      
      See [gtk.range.Range.setAdjustment] for details.
  
      Params:
        adjustment = a [gtk.adjustment.Adjustment]
  */
  void setAdjustment(gtk.adjustment.Adjustment adjustment)
  {
    gtk_scale_button_set_adjustment(cast(GtkScaleButton*)this._cPtr, adjustment ? cast(GtkAdjustment*)adjustment._cPtr(No.Dup) : null);
  }

  /**
      Sets the style of the button.
  
      Params:
        hasFrame = whether the button should have a visible frame
  */
  void setHasFrame(bool hasFrame)
  {
    gtk_scale_button_set_has_frame(cast(GtkScaleButton*)this._cPtr, hasFrame);
  }

  /**
      Sets the icons to be used by the scale button.
  
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
      Sets the current value of the scale.
      
      If the value is outside the minimum or maximum range values,
      it will be clamped to fit inside them.
      
      The scale button emits the `signalGtk.ScaleButton::value-changed`
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
  
      Emitted to dismiss the popup.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default binding for this signal is <kbd>Escape</kbd>.
  
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
  
      Emitted to popup the scale widget.
      
      This is a [keybinding signal](class.SignalAction.html).
      
      The default bindings for this signal are <kbd>Space</kbd>,
      <kbd>Enter</kbd> and <kbd>Return</kbd>.
  
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
  
      Emitted when the value field has changed.
  
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
