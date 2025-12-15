/// Module for [Switch] class
module gtk.switch_;

import gid.gid;
import gobject.dclosure;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.switch_.Switch] is a "light switch" that has two states: on or off.
    
    ![An example GtkSwitch](switch.png)
    
    The user can control which state should be active by clicking the
    empty area, or by dragging the handle.
    
    [gtk.switch_.Switch] can also handle situations where the underlying state
    changes with a delay. In this case, the slider position indicates
    the user's recent change (as indicated by the [gtk.switch_.Switch.active]
    property), and the color indicates whether the underlying state (represented
    by the [gtk.switch_.Switch.state] property) has been updated yet.
    
    ![GtkSwitch with delayed state change](switch-state.png)
    
    See `signal@Gtk.Switch::state-set` for details.
    
    # CSS nodes
    
    ```
    switch
    ├── image
    ├── image
    ╰── slider
    ```
    
    [gtk.switch_.Switch] has four css nodes, the main node with the name switch and
    subnodes for the slider and the on and off images. Neither of them is
    using any style classes.
    
    # Accessibility
    
    [gtk.switch_.Switch] uses the [gtk.types.AccessibleRole.Switch] role.
*/
class Switch : gtk.widget.Widget, gtk.actionable.Actionable
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
    return cast(void function())gtk_switch_get_type != &gidSymbolNotFound ? gtk_switch_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Switch self()
  {
    return this;
  }

  /**
      Get `active` property.
      Returns: Whether the [gtk.switch_.Switch] widget is in its on or off state.
  */
  @property bool active()
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the [gtk.switch_.Switch] widget is in its on or off state.
  */
  @property void active(bool propval)
  {
    return setActive(propval);
  }

  /**
      Get `state` property.
      Returns: The backend state that is controlled by the switch.
      
      See `signal@Gtk.Switch::state-set` for details.
  */
  @property bool state()
  {
    return getState();
  }

  /**
      Set `state` property.
      Params:
        propval = The backend state that is controlled by the switch.
        
        See `signal@Gtk.Switch::state-set` for details.
  */
  @property void state(bool propval)
  {
    return setState(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [gtk.switch_.Switch] widget.
      Returns: the newly created [gtk.switch_.Switch] instance
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_switch_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether the [gtk.switch_.Switch] is in its “on” or “off” state.
      Returns: true if the [gtk.switch_.Switch] is active, and false otherwise
  */
  bool getActive()
  {
    bool _retval;
    _retval = cast(bool)gtk_switch_get_active(cast(GtkSwitch*)this._cPtr);
    return _retval;
  }

  /**
      Gets the underlying state of the [gtk.switch_.Switch].
      Returns: the underlying state
  */
  bool getState()
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
  void setActive(bool isActive)
  {
    gtk_switch_set_active(cast(GtkSwitch*)this._cPtr, isActive);
  }

  /**
      Sets the underlying state of the [gtk.switch_.Switch].
      
      This function is typically called from a `signalGtk.Switch::state-set`
      signal handler in order to set up delayed state changes.
      
      See `signalGtk.Switch::state-set` for details.
  
      Params:
        state = the new state
  */
  void setState(bool state)
  {
    gtk_switch_set_state(cast(GtkSwitch*)this._cPtr, state);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to animate the switch.
      
      Applications should never connect to this signal,
      but use the [gtk.switch_.Switch.active] property.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.switch_.Switch switch_))
  
          `switch_` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.switch_.Switch)))
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
      Connect to `StateSet` signal.
  
      Emitted to change the underlying state.
      
      The ::state-set signal is emitted when the user changes the switch
      position. The default handler keeps the state in sync with the
      [gtk.switch_.Switch.active] property.
      
      To implement delayed state change, applications can connect to this
      signal, initiate the change of the underlying state, and call
      [gtk.switch_.Switch.setState] when the underlying state change is
      complete. The signal handler should return true to prevent the
      default handler from running.
      
      Visually, the underlying state is represented by the trough color of
      the switch, while the [gtk.switch_.Switch.active] property is
      represented by the position of the switch.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D bool callback(bool state, gtk.switch_.Switch switch_))
  
          `state` the new state of the switch (optional)
  
          `switch_` the instance the signal is connected to (optional)
  
          `Returns` true to stop the signal emission
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectStateSet(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == bool)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.switch_.Switch)))
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

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-set", closure, after);
  }
}
