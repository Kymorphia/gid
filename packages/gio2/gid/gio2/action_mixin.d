/// Module for [Action] interface mixin
module gid.gio2.action_mixin;

public import gid.core.basictypes;
public import gid.gio2.action_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.glib2.variant;
public import gid.glib2.variant_type;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.action.Action] represents a single named action.
    
    The main interface to an action is that it can be activated with
    [gid.gio2.action.Action.activate]. This results in the 'activate' signal being
    emitted. An activation has a [gid.glib2.variant.Variant] parameter (which may be
    `NULL`). The correct type for the parameter is determined by a static
    parameter type (which is given at construction time).
    
    An action may optionally have a state, in which case the state may be
    set with [gid.gio2.action.Action.changeState]. This call takes a [gid.glib2.variant.Variant]. The
    correct type for the state is determined by a static state type
    (which is given at construction time).
    
    The state may have a hint associated with it, specifying its valid
    range.
    
    [gid.gio2.action.Action] is merely the interface to the concept of an action, as
    described above.  Various implementations of actions exist, including
    [gid.gio2.simple_action.SimpleAction].
    
    In all cases, the implementing class is responsible for storing the
    name of the action, the parameter type, the enabled state, the optional
    state type and the state and emitting the appropriate signals when these
    change. The implementor is responsible for filtering calls to
    [gid.gio2.action.Action.activate] and [gid.gio2.action.Action.changeState]
    for type safety and for the state being enabled.
    
    Probably the only useful thing to do with a [gid.gio2.action.Action] is to put it
    inside of a [gid.gio2.simple_action_group.SimpleActionGroup].
*/
template ActionT()
{

  /**
      Get `enabled` property.
      Returns: If @action is currently enabled.
        
        If the action is disabled then calls to [gid.gio2.action.Action.activate] and
        [gid.gio2.action.Action.changeState] have no effect.
  */
  @property bool enabled() nothrow
  {
    return getEnabled();
  }

  /**
      Get `name` property.
      Returns: The name of the action.  This is mostly meaningful for identifying
        the action once it has been added to a [gid.gio2.action_group.ActionGroup]. It is immutable.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `parameterType` property.
      Returns: The type of the parameter that must be given when activating the
        action. This is immutable, and may be `NULL` if no parameter is needed when
        activating the action.
  */
  @property gid.glib2.variant_type.VariantType parameterType() nothrow
  {
    return getParameterType();
  }

  /**
      Get `state` property.
      Returns: The state of the action, or `NULL` if the action is stateless.
  */
  @property gid.glib2.variant.Variant state() nothrow
  {
    return getState();
  }

  /**
      Get `stateType` property.
      Returns: The [gid.glib2.variant_type.VariantType] of the state that the action has, or `NULL` if the
        action is stateless. This is immutable.
  */
  @property gid.glib2.variant_type.VariantType stateType() nothrow
  {
    return getStateType();
  }




  /**
      Activates the action.
      
      parameter must be the correct type of parameter for the action (ie:
      the parameter type given at construction time).  If the parameter
      type was `NULL` then parameter must also be `NULL`.
      
      If the parameter [gid.glib2.variant.Variant] is floating, it is consumed.
  
      Params:
        parameter = the parameter to the activation
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActivate`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActivate(gid.glib2.variant.Variant parameter = null)
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.activate)
      return;

    _klass.activate(cast(GAction*)this._cPtr, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null);
  }

  /**
      Request for the state of action to be changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gid.gio2.action.Action.getStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gid.gio2.action.Action.getStateHint].
      
      If the value [gid.glib2.variant.Variant] is floating, it is consumed.
  
      Params:
        value = the new state
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChangeState`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChangeState(gid.glib2.variant.Variant value)
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.changeState)
      return;

    _klass.changeState(cast(GAction*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Checks if action is currently enabled.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
      Returns: whether the action is enabled
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetEnabled`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetEnabled()
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.getEnabled)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.getEnabled(cast(GAction*)this._cPtr);
    return _retval;
  }

  /**
      Queries the name of action.
      Returns: the name of the action
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetName`
      to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetName()
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.getName)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getName(cast(GAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Queries the type of the parameter that must be given when activating
      action.
      
      When activating the action using [gid.gio2.action.Action.activate], the
      [gid.glib2.variant.Variant] given to that function must be of the type returned by
      this function.
      
      In the case that this function returns `NULL`, you must not give any
      [gid.glib2.variant.Variant], but `NULL` instead.
      Returns: the parameter type
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetParameterType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant_type.VariantType vfuncGetParameterType()
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.getParameterType)
      return typeof(return).init;

    const(GVariantType)* _cretval;
    _cretval = _klass.getParameterType(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries the current state of action.
      
      If the action is not stateful then `NULL` will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gid.gio2.action.Action.getStateType].
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
      Returns: the current state of the action
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetState`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant.Variant vfuncGetState()
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.getState)
      return typeof(return).init;

    GVariant* _cretval;
    _cretval = _klass.getState(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Requests a hint about the valid range of values for the state of
      action.
      
      If `NULL` is returned it either means that the action is not stateful
      or that there is no hint about the valid range of values for the
      state of the action.
      
      If a [gid.glib2.variant.Variant] array is returned then each item in the array is a
      possible value for the state.  If a [gid.glib2.variant.Variant] pair (ie: two-tuple) is
      returned then the tuple specifies the inclusive lower and upper bound
      of valid values for the state.
      
      In any case, the information is merely a hint.  It may be possible to
      have a state value outside of the hinted range and setting a value
      within the range may fail.
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
      Returns: the state range hint
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStateHint`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant.Variant vfuncGetStateHint()
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.getStateHint)
      return typeof(return).init;

    GVariant* _cretval;
    _cretval = _klass.getStateHint(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the type of the state of action.
      
      If the action is stateful (e.g. created with
      [gid.gio2.simple_action.SimpleAction.newStateful]) then this function returns the
      [gid.glib2.variant_type.VariantType] of the state.  This is the type of the initial value
      given as the state. All calls to [gid.gio2.action.Action.changeState] must give a
      [gid.glib2.variant.Variant] of this type and [gid.gio2.action.Action.getState] will return a
      [gid.glib2.variant.Variant] of the same type.
      
      If the action is not stateful (e.g. created with [gid.gio2.simple_action.SimpleAction.new_])
      then this function will return `NULL`. In that case, [gid.gio2.action.Action.getState]
      will return `NULL` and you must not call [gid.gio2.action.Action.changeState].
      Returns: the state type, if the action is stateful
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetStateType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant_type.VariantType vfuncGetStateType()
  {
    auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action.Action._getGType);
    if (!_klass || !_klass.getStateType)
      return typeof(return).init;

    const(GVariantType)* _cretval;
    _cretval = _klass.getStateType(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Activates the action.
      
      parameter must be the correct type of parameter for the action (ie:
      the parameter type given at construction time).  If the parameter
      type was `NULL` then parameter must also be `NULL`.
      
      If the parameter [gid.glib2.variant.Variant] is floating, it is consumed.
  
      Params:
        parameter = the parameter to the activation
  */
  override void activate(gid.glib2.variant.Variant parameter = null) nothrow
  {
    g_action_activate(cast(GAction*)this._cPtr, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null);
  }

  /**
      Request for the state of action to be changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gid.gio2.action.Action.getStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gid.gio2.action.Action.getStateHint].
      
      If the value [gid.glib2.variant.Variant] is floating, it is consumed.
  
      Params:
        value = the new state
  */
  override void changeState(gid.glib2.variant.Variant value) nothrow
  {
    g_action_change_state(cast(GAction*)this._cPtr, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Checks if action is currently enabled.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
      Returns: whether the action is enabled
  */
  override bool getEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_action_get_enabled(cast(GAction*)this._cPtr);
    return _retval;
  }

  /**
      Queries the name of action.
      Returns: the name of the action
  */
  override string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_action_get_name(cast(GAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Queries the type of the parameter that must be given when activating
      action.
      
      When activating the action using [gid.gio2.action.Action.activate], the
      [gid.glib2.variant.Variant] given to that function must be of the type returned by
      this function.
      
      In the case that this function returns `NULL`, you must not give any
      [gid.glib2.variant.Variant], but `NULL` instead.
      Returns: the parameter type
  */
  override gid.glib2.variant_type.VariantType getParameterType() nothrow
  {
    const(GVariantType)* _cretval;
    _cretval = g_action_get_parameter_type(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries the current state of action.
      
      If the action is not stateful then `NULL` will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gid.gio2.action.Action.getStateType].
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
      Returns: the current state of the action
  */
  override gid.glib2.variant.Variant getState() nothrow
  {
    GVariant* _cretval;
    _cretval = g_action_get_state(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Requests a hint about the valid range of values for the state of
      action.
      
      If `NULL` is returned it either means that the action is not stateful
      or that there is no hint about the valid range of values for the
      state of the action.
      
      If a [gid.glib2.variant.Variant] array is returned then each item in the array is a
      possible value for the state.  If a [gid.glib2.variant.Variant] pair (ie: two-tuple) is
      returned then the tuple specifies the inclusive lower and upper bound
      of valid values for the state.
      
      In any case, the information is merely a hint.  It may be possible to
      have a state value outside of the hinted range and setting a value
      within the range may fail.
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
      Returns: the state range hint
  */
  override gid.glib2.variant.Variant getStateHint() nothrow
  {
    GVariant* _cretval;
    _cretval = g_action_get_state_hint(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the type of the state of action.
      
      If the action is stateful (e.g. created with
      [gid.gio2.simple_action.SimpleAction.newStateful]) then this function returns the
      [gid.glib2.variant_type.VariantType] of the state.  This is the type of the initial value
      given as the state. All calls to [gid.gio2.action.Action.changeState] must give a
      [gid.glib2.variant.Variant] of this type and [gid.gio2.action.Action.getState] will return a
      [gid.glib2.variant.Variant] of the same type.
      
      If the action is not stateful (e.g. created with [gid.gio2.simple_action.SimpleAction.new_])
      then this function will return `NULL`. In that case, [gid.gio2.action.Action.getState]
      will return `NULL` and you must not call [gid.gio2.action.Action.changeState].
      Returns: the state type, if the action is stateful
  */
  override gid.glib2.variant_type.VariantType getStateType() nothrow
  {
    const(GVariantType)* _cretval;
    _cretval = g_action_get_state_type(cast(GAction*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.action.Action (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_action_Action(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChangeState", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetEnabled", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetParameterType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetState", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStateHint", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStateType", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.action.Action vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_action_Action(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_Action(iface, "activate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChangeState", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_Action(iface, "change_state");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetEnabled", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_Action(iface, "get_enabled");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetName", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.action.Action.vfuncGetName is not supported: callback string return value with transfer none is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetParameterType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_Action(iface, "get_parameter_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetState", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_Action(iface, "get_state");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStateHint", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_Action(iface, "get_state_hint");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetStateType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_Action(iface, "get_state_type");
  }

  private static void _installIfaceVfunc_gid_gio2_action_Action(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GActionInterface*)iface;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GAction* action, GVariant* parameter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.gio2.action.Action._getGType);
            if (_klass && _klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(action, parameter);
            return;
          }

          try
          {
            _obj.vfuncActivate(parameter ? new gid.glib2.variant.Variant(cast(void*)parameter, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action.Action.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "change_state":
      {
        static extern(C) void _vfuncChangeStateTramp(GAction* action, GVariant* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.gio2.action.Action._getGType);
            if (_klass && _klass.changeState)
              return (cast(typeof(&_vfuncChangeStateTramp))_klass.changeState)(action, value);
            return;
          }

          try
          {
            _obj.vfuncChangeState(value ? new gid.glib2.variant.Variant(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action.Action.vfuncChangeState");
          }
        }

        _klass.changeState = cast(typeof(_klass.changeState))&_vfuncChangeStateTramp;
        break;
      }
      case "get_enabled":
      {
        static extern(C) gboolean _vfuncGetEnabledTramp(GAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.gio2.action.Action._getGType);
            if (_klass && _klass.getEnabled)
              return (cast(typeof(&_vfuncGetEnabledTramp))_klass.getEnabled)(action);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncGetEnabled();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action.Action.vfuncGetEnabled");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getEnabled = cast(typeof(_klass.getEnabled))&_vfuncGetEnabledTramp;
        break;
      }
      case "get_parameter_type":
      {
        static extern(C) const(GVariantType)* _vfuncGetParameterTypeTramp(GAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.gio2.action.Action._getGType);
            if (_klass && _klass.getParameterType)
              return (cast(typeof(&_vfuncGetParameterTypeTramp))_klass.getParameterType)(action);
            return typeof(return).init;
          }

          gid.glib2.variant_type.VariantType _dretval;

          try
          {
            _dretval = _obj.vfuncGetParameterType();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action.Action.vfuncGetParameterType");
          }
          auto _retval = _dretval ? cast(const(GVariantType)*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getParameterType = cast(typeof(_klass.getParameterType))&_vfuncGetParameterTypeTramp;
        break;
      }
      case "get_state":
      {
        static extern(C) GVariant* _vfuncGetStateTramp(GAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.gio2.action.Action._getGType);
            if (_klass && _klass.getState)
              return (cast(typeof(&_vfuncGetStateTramp))_klass.getState)(action);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;

          try
          {
            _dretval = _obj.vfuncGetState();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action.Action.vfuncGetState");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getState = cast(typeof(_klass.getState))&_vfuncGetStateTramp;
        break;
      }
      case "get_state_hint":
      {
        static extern(C) GVariant* _vfuncGetStateHintTramp(GAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.gio2.action.Action._getGType);
            if (_klass && _klass.getStateHint)
              return (cast(typeof(&_vfuncGetStateHintTramp))_klass.getStateHint)(action);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;

          try
          {
            _dretval = _obj.vfuncGetStateHint();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action.Action.vfuncGetStateHint");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getStateHint = cast(typeof(_klass.getStateHint))&_vfuncGetStateHintTramp;
        break;
      }
      case "get_state_type":
      {
        static extern(C) const(GVariantType)* _vfuncGetStateTypeTramp(GAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GActionInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action), gid.gio2.action.Action._getGType);
            if (_klass && _klass.getStateType)
              return (cast(typeof(&_vfuncGetStateTypeTramp))_klass.getStateType)(action);
            return typeof(return).init;
          }

          gid.glib2.variant_type.VariantType _dretval;

          try
          {
            _dretval = _obj.vfuncGetStateType();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action.Action.vfuncGetStateType");
          }
          auto _retval = _dretval ? cast(const(GVariantType)*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getStateType = cast(typeof(_klass.getStateType))&_vfuncGetStateTypeTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.action.Action]
template ActionGidBuilderT()
{
}
