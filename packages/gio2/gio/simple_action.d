/// Module for [SimpleAction] class
module gio.simple_action;

import gid.gid;
import gio.action;
import gio.action_mixin;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.dclosure;
import gobject.object;

/**
    A [gio.simple_action.SimpleAction] is the obvious simple implementation of the
    [gio.action.Action] interface. This is the easiest way to create an action for
    purposes of adding it to a [gio.simple_action_group.SimpleActionGroup].
*/
class SimpleAction : gobject.object.ObjectWrap, gio.action.Action
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
    return cast(void function())g_simple_action_get_type != &gidSymbolNotFound ? g_simple_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleAction self()
  {
    return this;
  }

  /**
      Get `enabled` property.
      Returns: If @action is currently enabled.
        
        If the action is disabled then calls to [gio.action.Action.activate] and
        [gio.action.Action.changeState] have no effect.
  */
  @property bool enabled()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("enabled");
  }

  /**
      Set `enabled` property.
      Params:
        propval = If @action is currently enabled.
          
          If the action is disabled then calls to [gio.action.Action.activate] and
          [gio.action.Action.changeState] have no effect.
  */
  @property void enabled(bool propval)
  {
    return setEnabled(propval);
  }

  /**
      Get `state` property.
      Returns: The state of the action, or null if the action is stateless.
  */
  @property glib.variant.Variant state()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.variant.Variant)("state");
  }

  /**
      Set `state` property.
      Params:
        propval = The state of the action, or null if the action is stateless.
  */
  @property void state(glib.variant.Variant propval)
  {
    return setState(propval);
  }

  /**
      Get `stateType` property.
      Returns: The #GVariantType of the state that the action has, or null if the
        action is stateless.
  */
  @property glib.variant_type.VariantType stateType()
  {
    return gobject.object.ObjectWrap.getProperty!(glib.variant_type.VariantType)("state-type");
  }

  mixin ActionT!();

  /**
      Creates a new action.
      
      The created action is stateless. See [gio.simple_action.SimpleAction.newStateful] to create
      an action that has state.
  
      Params:
        name = the name of the action
        parameterType = the type of parameter that will be passed to
            handlers for the #GSimpleAction::activate signal, or null for no parameter
      Returns: a new #GSimpleAction
  */
  this(string name, glib.variant_type.VariantType parameterType = null)
  {
    GSimpleAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_simple_action_new(_name, parameterType ? cast(const(GVariantType)*)parameterType._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new stateful action.
      
      All future state values must have the same #GVariantType as the initial
      state.
      
      If the state #GVariant is floating, it is consumed.
  
      Params:
        name = the name of the action
        parameterType = the type of the parameter that will be passed to
            handlers for the #GSimpleAction::activate signal, or null for no parameter
        state = the initial state of the action
      Returns: a new #GSimpleAction
  */
  static gio.simple_action.SimpleAction newStateful(string name, glib.variant_type.VariantType parameterType, glib.variant.Variant state)
  {
    GSimpleAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_simple_action_new_stateful(_name, parameterType ? cast(const(GVariantType)*)parameterType._cPtr(No.Dup) : null, state ? cast(GVariant*)state._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.simple_action.SimpleAction)(cast(GSimpleAction*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets the action as enabled or not.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
      
      This should only be called by the implementor of the action.  Users
      of the action should not attempt to modify its enabled flag.
  
      Params:
        enabled = whether the action is enabled
  */
  void setEnabled(bool enabled)
  {
    g_simple_action_set_enabled(cast(GSimpleAction*)this._cPtr, enabled);
  }

  /**
      Sets the state of the action.
      
      This directly updates the 'state' property to the given value.
      
      This should only be called by the implementor of the action.  Users
      of the action should not attempt to directly modify the 'state'
      property.  Instead, they should call [gio.action.Action.changeState] to
      request the change.
      
      If the value GVariant is floating, it is consumed.
  
      Params:
        value = the new #GVariant for the state
  */
  void setState(glib.variant.Variant value)
  {
    g_simple_action_set_state(cast(GSimpleAction*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the state hint for the action.
      
      See [gio.action.Action.getStateHint] for more information about
      action state hints.
  
      Params:
        stateHint = a #GVariant representing the state hint
  */
  void setStateHint(glib.variant.Variant stateHint = null)
  {
    g_simple_action_set_state_hint(cast(GSimpleAction*)this._cPtr, stateHint ? cast(GVariant*)stateHint._cPtr(No.Dup) : null);
  }

  /**
      Connect to `Activate` signal.
  
      Indicates that the action was just activated.
        
        parameter will always be of the expected type, i.e. the parameter type
        specified when the action was created. If an incorrect type is given when
        activating the action, this signal is not emitted.
        
        Since GLib 2.40, if no handler is connected to this signal then the
        default behaviour for boolean-stated actions with a null parameter
        type is to toggle them via the #GSimpleAction::change-state signal.
        For stateful actions where the state type is equal to the parameter
        type, the default is to forward them directly to
        #GSimpleAction::change-state.  This should allow almost all users
        of #GSimpleAction to connect only one handler or the other.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(glib.variant.Variant parameter, gio.simple_action.SimpleAction simpleAction))
  
          `parameter` the parameter to the activation, or null if it has
              no parameter (optional)
  
          `simpleAction` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.variant.Variant)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.simple_action.SimpleAction)))
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
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `ChangeState` signal.
  
      Indicates that the action just received a request to change its
        state.
        
        value will always be of the correct state type, i.e. the type of the
        initial state passed to [gio.simple_action.SimpleAction.newStateful]. If an incorrect
        type is given when requesting to change the state, this signal is not
        emitted.
        
        If no handler is connected to this signal then the default
        behaviour is to call [gio.simple_action.SimpleAction.setState] to set the state
        to the requested value. If you connect a signal handler then no
        default action is taken. If the state should change then you must
        call [gio.simple_action.SimpleAction.setState] from the handler.
        
        An example of a 'change-state' handler:
        ```c
        static void
        change_volume_state (GSimpleAction *action,
                             GVariant      *value,
                             gpointer       user_data)
        {
          gint requested;
        
          requested = g_variant_get_int32 (value);
        
          // Volume only goes from 0 to 10
          if (0 <= requested && requested <= 10)
            g_simple_action_set_state (action, value);
        }
        ```
        
        The handler need not set the state to the requested value.
        It could set it to any value at all, or take some other action.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(glib.variant.Variant value, gio.simple_action.SimpleAction simpleAction))
  
          `value` the requested value for the state (optional)
  
          `simpleAction` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChangeState(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == glib.variant.Variant)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gio.simple_action.SimpleAction)))
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
    return connectSignalClosure("change-state", closure, after);
  }
}
