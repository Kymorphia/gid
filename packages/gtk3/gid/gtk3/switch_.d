/// Module for [Switch] class
module gid.gtk3.switch_;

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
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    #GtkSwitch is a widget that has two states: on or off. The user can control
    which state should be active by clicking the empty area, or by dragging the
    handle.
    
    GtkSwitch can also handle situations where the underlying state changes with
    a delay. See #GtkSwitch::state-set for details.
    
    # CSS nodes
    
    ```plain
    switch
    ╰── slider
    ```
    
    GtkSwitch has two css nodes, the main node with the name switch and a subnode
    named slider. Neither of them is using any style classes.
*/
@gidGir("Switch", "SwitchClass")
class Switch : gid.gtk3.widget.Widget, gid.gtk3.actionable.Actionable, gid.gtk3.activatable.Activatable
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
      Get builder for [gid.gtk3.switch_.Switch]
      Returns: New builder object
  */
  static SwitchGidBuilder builder() nothrow
  {
    return new SwitchGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the #GtkSwitch widget is in its on or off state.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the #GtkSwitch widget is in its on or off state.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Get `state` property.
      Returns: The backend state that is controlled by the switch.
        See #GtkSwitch::state-set for details.
  */
  @property bool state() nothrow
  {
    return getState();
  }

  /**
      Set `state` property.
      Params:
        propval = The backend state that is controlled by the switch.
          See #GtkSwitch::state-set for details.
  */
  @property void state(bool propval) nothrow
  {
    setState(propval);
  }

  mixin ActionableT!();
  mixin ActivatableT!();

  /**
      Creates a new #GtkSwitch widget.
      Returns: the newly created #GtkSwitch instance
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_switch_new();
      this(_cretval, No.Take);
    }
  }

  /**
      An action signal and emitting it causes the switch to animate.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncActivate()
  {
    auto _klass = cast(GtkSwitchClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkSwitch*)this._cPtr);
  }

  /**
      Class handler for the ::state-set signal.
  
      Params:
        state = 
      Returns: 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncStateSet` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncStateSet(bool state)
  {
    auto _klass = cast(GtkSwitchClass*)_vfuncClass;
    if (!_klass.stateSet)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.stateSet(cast(GtkSwitch*)this._cPtr, state);
    return _retval;
  }

  /**
      Gets whether the #GtkSwitch is in its “on” or “off” state.
      Returns: true if the #GtkSwitch is active, and false otherwise
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_switch_get_active(cast(GtkSwitch*)this._cPtr);
    return _retval;
  }

  alias getState = gid.gtk3.widget.Widget.getState;

  /**
      Gets the underlying state of the #GtkSwitch.
      Returns: the underlying state
  */
  bool getState() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_switch_get_state(cast(GtkSwitch*)this._cPtr);
    return _retval;
  }

  /**
      Changes the state of sw to the desired one.
  
      Params:
        isActive = true if sw should be active, and false otherwise
  */
  void setActive(bool isActive) nothrow
  {
    gtk_switch_set_active(cast(GtkSwitch*)this._cPtr, isActive);
  }

  alias setState = gid.gtk3.widget.Widget.setState;

  /**
      Sets the underlying state of the #GtkSwitch.
      
      Normally, this is the same as #GtkSwitch:active, unless the switch
      is set up for delayed state changes. This function is typically
      called from a #GtkSwitch::state-set signal handler.
      
      See #GtkSwitch::state-set for details.
  
      Params:
        state = the new state
  */
  void setState(bool state) nothrow
  {
    gtk_switch_set_state(cast(GtkSwitch*)this._cPtr, state);
  }

  /**
      Connect to `Activate` signal.
  
      The ::activate signal on GtkSwitch is an action signal and
        emitting it causes the switch to animate.
        Applications should never connect to this signal, but use the
        notify::active signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.switch_.Switch switch_)`
  
          `switch_` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.switch_.Switch)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.switch_.Switch.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `StateSet` signal.
  
      The ::state-set signal on GtkSwitch is emitted to change the underlying
        state. It is emitted when the user changes the switch position. The
        default handler keeps the state in sync with the #GtkSwitch:active
        property.
        
        To implement delayed state change, applications can connect to this signal,
        initiate the change of the underlying state, and call [gid.gtk4.switch_.Switch.setState]
        when the underlying state change is complete. The signal handler should
        return true to prevent the default handler from running.
        
        Visually, the underlying state is represented by the trough color of
        the switch, while the #GtkSwitch:active property is represented by the
        position of the switch.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(bool state, gid.gtk3.switch_.Switch switch_)`
  
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
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.switch_.Switch)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.switch_.Switch.stateSet");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("state-set", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Switch
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.switch_.Switch), T.stringof ~ " is not derived from gid.gtk3.switch_.Switch");

    gid.gtk3.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk3.switch_.Switch))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncStateSet", true)[0]) == gid.gtk3.switch_.Switch))
      _installVfunc(klass, "state_set");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkSwitchClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkSwitch* sw) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.switch_.Switch)(cast(void*)sw);
          if (!_obj)
          {
            auto _klass = cast(GtkSwitchClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sw);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(sw);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.switch_.Switch.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "state_set":
      {
        static extern(C) gboolean _vfuncStateSetTramp(GtkSwitch* sw, gboolean state) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.switch_.Switch)(cast(void*)sw);
          if (!_obj)
          {
            auto _klass = cast(GtkSwitchClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)sw);
            if (_klass.stateSet)
              return (cast(typeof(&_vfuncStateSetTramp))_klass.stateSet)(sw, state);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncStateSet(cast(bool)state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.switch_.Switch.vfuncStateSet");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.stateSet = cast(typeof(_klass.stateSet))&_vfuncStateSetTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.switch_.Switch]
class SwitchGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T, gid.gtk3.actionable.ActionableGidBuilderImpl!T, gid.gtk3.activatable.ActivatableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();
  mixin ActivatableGidBuilderT!();

  /**
      Set `active` property.
      Params:
        propval = Whether the #GtkSwitch widget is in its on or off state.
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
          See #GtkSwitch::state-set for details.
      Returns: Builder instance for fluent chaining
  */
  T state(bool propval) nothrow
  {
    return setProperty("state", propval);
  }
}

/// Fluent builder for [gid.gtk3.switch_.Switch]
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
