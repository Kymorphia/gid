/// Module for [Action] interface mixin
module gio.action_mixin;

public import gio.action_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import glib.error;
public import glib.variant;
public import glib.variant_type;

/**
    [gio.action.Action] represents a single named action.
    
    The main interface to an action is that it can be activated with
    [gio.action.Action.activate]. This results in the 'activate' signal being
    emitted. An activation has a [glib.variant.Variant] parameter (which may be
    `NULL`). The correct type for the parameter is determined by a static
    parameter type (which is given at construction time).
    
    An action may optionally have a state, in which case the state may be
    set with [gio.action.Action.changeState]. This call takes a #GVariant. The
    correct type for the state is determined by a static state type
    (which is given at construction time).
    
    The state may have a hint associated with it, specifying its valid
    range.
    
    [gio.action.Action] is merely the interface to the concept of an action, as
    described above.  Various implementations of actions exist, including
    [gio.simple_action.SimpleAction].
    
    In all cases, the implementing class is responsible for storing the
    name of the action, the parameter type, the enabled state, the optional
    state type and the state and emitting the appropriate signals when these
    change. The implementor is responsible for filtering calls to
    [gio.action.Action.activate] and [gio.action.Action.changeState]
    for type safety and for the state being enabled.
    
    Probably the only useful thing to do with a [gio.action.Action] is to put it
    inside of a [gio.simple_action_group.SimpleActionGroup].
*/
template ActionT()
{

  /**
      Get `enabled` property.
      Returns: If @action is currently enabled.
      
      If the action is disabled then calls to [gio.action.Action.activate] and
      [gio.action.Action.changeState] have no effect.
  */
  @property bool enabled()
  {
    return getEnabled();
  }

  /**
      Get `name` property.
      Returns: The name of the action.  This is mostly meaningful for identifying
      the action once it has been added to a #GActionGroup. It is immutable.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Get `parameterType` property.
      Returns: The type of the parameter that must be given when activating the
      action. This is immutable, and may be null if no parameter is needed when
      activating the action.
  */
  @property glib.variant_type.VariantType parameterType()
  {
    return getParameterType();
  }

  /**
      Get `state` property.
      Returns: The state of the action, or null if the action is stateless.
  */
  @property glib.variant.Variant state()
  {
    return getState();
  }

  /**
      Get `stateType` property.
      Returns: The #GVariantType of the state that the action has, or null if the
      action is stateless. This is immutable.
  */
  @property glib.variant_type.VariantType stateType()
  {
    return getStateType();
  }




  /**
      Activates the action.
      
      parameter must be the correct type of parameter for the action (ie:
      the parameter type given at construction time).  If the parameter
      type was null then parameter must also be null.
      
      If the parameter GVariant is floating, it is consumed.
  
      Params:
        parameter = the parameter to the activation
  */
  override void activate(glib.variant.Variant parameter = null)
  {
    g_action_activate(cast(GAction*)this._cPtr, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null);
  }

  /**
      Request for the state of action to be changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gio.action.Action.getStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gio.action.Action.getStateHint].
      
      If the value GVariant is floating, it is consumed.
  
      Params:
        value = the new state
  */
  override void changeState(glib.variant.Variant value)
  {
    g_action_change_state(cast(GAction*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Checks if action is currently enabled.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
      Returns: whether the action is enabled
  */
  override bool getEnabled()
  {
    bool _retval;
    _retval = cast(bool)g_action_get_enabled(cast(GAction*)this._cPtr);
    return _retval;
  }

  /**
      Queries the name of action.
      Returns: the name of the action
  */
  override string getName()
  {
    const(char)* _cretval;
    _cretval = g_action_get_name(cast(GAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Queries the type of the parameter that must be given when activating
      action.
      
      When activating the action using [gio.action.Action.activate], the #GVariant
      given to that function must be of the type returned by this function.
      
      In the case that this function returns null, you must not give any
      #GVariant, but null instead.
      Returns: the parameter type
  */
  override glib.variant_type.VariantType getParameterType()
  {
    const(GVariantType)* _cretval;
    _cretval = g_action_get_parameter_type(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries the current state of action.
      
      If the action is not stateful then null will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gio.action.Action.getStateType].
      
      The return value (if non-null) should be freed with
      [glib.variant.Variant.unref] when it is no longer required.
      Returns: the current state of the action
  */
  override glib.variant.Variant getState()
  {
    GVariant* _cretval;
    _cretval = g_action_get_state(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Requests a hint about the valid range of values for the state of
      action.
      
      If null is returned it either means that the action is not stateful
      or that there is no hint about the valid range of values for the
      state of the action.
      
      If a #GVariant array is returned then each item in the array is a
      possible value for the state.  If a #GVariant pair (ie: two-tuple) is
      returned then the tuple specifies the inclusive lower and upper bound
      of valid values for the state.
      
      In any case, the information is merely a hint.  It may be possible to
      have a state value outside of the hinted range and setting a value
      within the range may fail.
      
      The return value (if non-null) should be freed with
      [glib.variant.Variant.unref] when it is no longer required.
      Returns: the state range hint
  */
  override glib.variant.Variant getStateHint()
  {
    GVariant* _cretval;
    _cretval = g_action_get_state_hint(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the type of the state of action.
      
      If the action is stateful (e.g. created with
      [gio.simple_action.SimpleAction.newStateful]) then this function returns the
      #GVariantType of the state.  This is the type of the initial value
      given as the state. All calls to [gio.action.Action.changeState] must give a
      #GVariant of this type and [gio.action.Action.getState] will return a
      #GVariant of the same type.
      
      If the action is not stateful (e.g. created with [gio.simple_action.SimpleAction.new_])
      then this function will return null. In that case, [gio.action.Action.getState]
      will return null and you must not call [gio.action.Action.changeState].
      Returns: the state type, if the action is stateful
  */
  override glib.variant_type.VariantType getStateType()
  {
    const(GVariantType)* _cretval;
    _cretval = g_action_get_state_type(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }
}
