/// Module for [Switch] class
module gid.gtk4.switch_;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.actionable;
import gid.gtk4.actionable_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Shows a "light switch" that has two states: on or off.
    
    <picture>
      <source srcset="switch-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkSwitch" src="switch.png">
    </picture>
    
    The user can control which state should be active by clicking the
    empty area, or by dragging the slider.
    
    [gid.gtk4.switch_.Switch] can also express situations where the underlying state changes
    with a delay. In this case, the slider position indicates the user's recent
    change (represented by the [gid.gtk4.switch_.Switch.active] property), while the
    trough color indicates the present underlying state (represented by the
    [gid.gtk4.switch_.Switch.state] property).
    
    <picture>
      <source srcset="switch-state-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="GtkSwitch with delayed state change" src="switch-state.png">
    </picture>
    
    See [gid.gtk4.switch_.Switch.stateSet] for details.
    
    # Shortcuts and Gestures
    
    [gid.gtk4.switch_.Switch] supports pan and drag gestures to move the slider.
    
    # CSS nodes
    
    ```
    switch
    ├── image
    ├── image
    ╰── slider
    ```
    
    [gid.gtk4.switch_.Switch] has four css nodes, the main node with the name switch and
    subnodes for the slider and the on and off images. Neither of them is
    using any style classes.
    
    # Accessibility
    
    [gid.gtk4.switch_.Switch] uses the [gid.gtk4.types.AccessibleRole.Switch] role.
*/
class Switch : gid.gtk4.widget.Widget, gid.gtk4.actionable.Actionable
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
    return cast(void function())gtk_switch_get_type != &gidSymbolNotFound ? gtk_switch_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSwitch";
  }

  /** Returns `this`, for use in `with` statements. */
  override Switch self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.switch_.Switch]
      Returns: New builder object
  */
  static SwitchGidBuilder builder() nothrow
  {
    return new SwitchGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the [gid.gtk4.switch_.Switch] widget is in its on or off state.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the [gid.gtk4.switch_.Switch] widget is in its on or off state.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Get `state` property.
      Returns: The backend state that is controlled by the switch.
        
        Applications should usually set the [gid.gtk4.switch_.Switch.active] property,
        except when indicating a change to the backend state which occurs
        separately from the user's interaction.
        
        See [gid.gtk4.switch_.Switch.stateSet] for details.
  */
  @property bool state() nothrow
  {
    return getState();
  }

  /**
      Set `state` property.
      Params:
        propval = The backend state that is controlled by the switch.
          
          Applications should usually set the [gid.gtk4.switch_.Switch.active] property,
          except when indicating a change to the backend state which occurs
          separately from the user's interaction.
          
          See [gid.gtk4.switch_.Switch.stateSet] for details.
  */
  @property void state(bool propval) nothrow
  {
    setState(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [gid.gtk4.switch_.Switch] widget.
      Returns: the newly created [gid.gtk4.switch_.Switch] instance
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_switch_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether the [gid.gtk4.switch_.Switch] is in its “on” or “off” state.
      Returns: true if the [gid.gtk4.switch_.Switch] is active, and false otherwise
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_switch_get_active(cast(GtkSwitch*)this._cPtr);
    return _retval;
  }

  /**
      Gets the underlying state of the [gid.gtk4.switch_.Switch].
      Returns: the underlying state
  */
  bool getState() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_switch_get_state(cast(GtkSwitch*)this._cPtr);
    return _retval;
  }

  /**
      Changes the state of self to the desired one.
  
      Params:
        isActive = true if self should be active, and false otherwise
  */
  void setActive(bool isActive) nothrow
  {
    gtk_switch_set_active(cast(GtkSwitch*)this._cPtr, isActive);
  }

  /**
      Sets the underlying state of the [gid.gtk4.switch_.Switch].
      
      This function is typically called from a [gid.gtk4.switch_.Switch.stateSet]
      signal handler in order to set up delayed state changes.
      
      See [gid.gtk4.switch_.Switch.stateSet] for details.
  
      Params:
        state = the new state
  */
  void setState(bool state) nothrow
  {
    gtk_switch_set_state(cast(GtkSwitch*)this._cPtr, state);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to animate the switch.
        
        Applications should never connect to this signal,
        but use the [gid.gtk4.switch_.Switch.active] property.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.switch_.Switch switch_)`
  
          `switch_` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.switch_.Switch)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.switch_.Switch.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `StateSet` signal.
  
      Emitted to change the underlying state.
        
        The ::state-set signal is emitted when the user changes the switch
        position. The default handler calls [gid.gtk4.switch_.Switch.setState] with the
        value of state.
        
        To implement delayed state change, applications can connect to this
        signal, initiate the change of the underlying state, and call
        [gid.gtk4.switch_.Switch.setState] when the underlying state change is
        complete. The signal handler should return true to prevent the
        default handler from running.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool state, gid.gtk4.switch_.Switch switch_)`
  
          `state` the new state of the switch (optional)
  
          `switch_` the instance the signal is connected to (optional)
  
          `Returns` true to stop the signal emission
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectStateSet(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk4.switch_.Switch)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.switch_.Switch.stateSet");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-set", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.switch_.Switch]
class SwitchGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.gtk4.actionable.ActionableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();

  /**
      Set `active` property.
      Params:
        propval = Whether the [gid.gtk4.switch_.Switch] widget is in its on or off state.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `state` property.
      Params:
        propval = The backend state that is controlled by the switch.
          
          Applications should usually set the [gid.gtk4.switch_.Switch.active] property,
          except when indicating a change to the backend state which occurs
          separately from the user's interaction.
          
          See [gid.gtk4.switch_.Switch.stateSet] for details.
      Returns: Builder instance for fluent chaining
  */
  T state(bool propval) nothrow
  {
    return setProperty("state", propval);
  }
}

/// Fluent builder for [gid.gtk4.switch_.Switch]
final class SwitchGidBuilder : SwitchGidBuilderImpl!SwitchGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Switch build() nothrow
  {
    return new Switch(cast(void*)createGObject(Switch._getGType), Yes.Take);
  }
}
