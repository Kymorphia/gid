/// Module for [ActionGroup] interface mixin
module gid.gio2.action_group_mixin;

public import gid.core.basictypes;
public import gid.gio2.action_group_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.variant;
public import gid.glib2.variant_type;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.action_group.ActionGroup] represents a group of actions.
    
    Actions can be used to expose functionality in a structured way, either
    from one part of a program to another, or to the outside world. Action
    groups are often used together with a [gid.gio2.menu_model.MenuModel] that provides additional
    representation data for displaying the actions to the user, e.g. in a menu.
    
    The main way to interact with the actions in a [gid.gio2.action_group.ActionGroup] is to
    activate them with [gid.gio2.action_group.ActionGroup.activateAction]. Activating an
    action may require a [gid.glib2.variant.Variant] parameter. The required type of the
    parameter can be inquired with [gid.gio2.action_group.ActionGroup.getActionParameterType].
    Actions may be disabled, see [gid.gio2.action_group.ActionGroup.getActionEnabled].
    Activating a disabled action has no effect.
    
    Actions may optionally have a state in the form of a [gid.glib2.variant.Variant]. The current
    state of an action can be inquired with [gid.gio2.action_group.ActionGroup.getActionState].
    Activating a stateful action may change its state, but it is also possible to
    set the state by calling [gid.gio2.action_group.ActionGroup.changeActionState].
    
    As typical example, consider a text editing application which has an
    option to change the current font to ‘bold’. A good way to represent
    this would be a stateful action, with a boolean state. Activating the
    action would toggle the state.
    
    Each action in the group has a unique name (which is a string).  All
    method calls, except [gid.gio2.action_group.ActionGroup.listActions] take the name of
    an action as an argument.
    
    The [gid.gio2.action_group.ActionGroup] API is meant to be the ‘public’ API to the action
    group. The calls here are exactly the interaction that ‘external
    forces’ (eg: UI, incoming D-Bus messages, etc.) are supposed to have
    with actions. ‘Internal’ APIs (ie: ones meant only to be accessed by
    the action group implementation) are found on subclasses. This is
    why you will find – for example – [gid.gio2.action_group.ActionGroup.getActionEnabled]
    but not an equivalent `set_action_enabled()` method.
    
    Signals are emitted on the action group in response to state changes
    on individual actions.
    
    Implementations of [gid.gio2.action_group.ActionGroup] should provide implementations for
    the virtual functions [gid.gio2.action_group.ActionGroup.listActions] and
    [gid.gio2.action_group.ActionGroup.queryAction]. The other virtual functions should
    not be implemented — their ‘wrappers’ are actually implemented with
    calls to [gid.gio2.action_group.ActionGroup.queryAction].
*/
template ActionGroupT()
{

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionAdded] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActionAdded`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActionAdded(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.actionAdded)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.actionAdded(cast(GActionGroup*)this._cPtr, _actionName);
  }

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionEnabledChanged] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
        enabled = whether the action is now enabled
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActionEnabledChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActionEnabledChanged(string actionName, bool enabled)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.actionEnabledChanged)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.actionEnabledChanged(cast(GActionGroup*)this._cPtr, _actionName, enabled);
  }

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionRemoved] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActionRemoved`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActionRemoved(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.actionRemoved)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.actionRemoved(cast(GActionGroup*)this._cPtr, _actionName);
  }

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionStateChanged] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
        state = the new state of the named action
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActionStateChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActionStateChanged(string actionName, gid.glib2.variant.Variant state)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.actionStateChanged)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.actionStateChanged(cast(GActionGroup*)this._cPtr, _actionName, state ? cast(GVariant*)state._cPtr(No.Dup) : null);
  }

  /**
      Activate the named action within action_group.
      
      If the action is expecting a parameter, then the correct type of
      parameter must be given as parameter.  If the action is expecting no
      parameters then parameter must be `NULL`.  See
      [gid.gio2.action_group.ActionGroup.getActionParameterType].
      
      If the [gid.gio2.action_group.ActionGroup] implementation supports asynchronous remote
      activation over D-Bus, this call may return before the relevant
      D-Bus traffic has been sent, or any replies have been received. In
      order to block on such asynchronous activation calls,
      [gid.gio2.dbus_connection.DBusConnection.flush] should be called prior to the code, which
      depends on the result of the action activation. Without flushing
      the D-Bus connection, there is no guarantee that the action would
      have been activated.
      
      The following code which runs in a remote app instance, shows an
      example of a ‘quit’ action being activated on the primary app
      instance over D-Bus. Here [gid.gio2.dbus_connection.DBusConnection.flush] is called
      before `exit()`. Without `[gid.gio2.dbus_connection.DBusConnection.flush]`, the ‘quit’ action
      may fail to be activated on the primary instance.
      
      ```c
      // call ‘quit’ action on primary instance
      g_action_group_activate_action (G_ACTION_GROUP (app), "quit", NULL);
      
      // make sure the action is activated now
      g_dbus_connection_flush (…);
      
      g_debug ("Application has been terminated. Exiting.");
      
      exit (0);
      ```
  
      Params:
        actionName = the name of the action to activate
        parameter = parameters to the activation
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActivateAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActivateAction(string actionName, gid.glib2.variant.Variant parameter = null)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.activateAction)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.activateAction(cast(GActionGroup*)this._cPtr, _actionName, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null);
  }

  /**
      Request for the state of the named action within action_group to be
      changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gid.gio2.action_group.ActionGroup.getActionStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gid.gio2.action_group.ActionGroup.getActionStateHint].
      
      If the value GVariant is floating, it is consumed.
  
      Params:
        actionName = the name of the action to request the change on
        value = the new state
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChangeActionState`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChangeActionState(string actionName, gid.glib2.variant.Variant value)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.changeActionState)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.changeActionState(cast(GActionGroup*)this._cPtr, _actionName, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Checks if the named action within action_group is currently enabled.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
  
      Params:
        actionName = the name of the action to query
      Returns: whether the action is currently enabled
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActionEnabled`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncGetActionEnabled(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.getActionEnabled)
      return typeof(return).init;

    bool _retval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.getActionEnabled(cast(GActionGroup*)this._cPtr, _actionName);
    return _retval;
  }

  /**
      Queries the type of the parameter that must be given when activating
      the named action within action_group.
      
      When activating the action using [gid.gio2.action_group.ActionGroup.activateAction],
      the [gid.glib2.variant.Variant] given to that function must be of the type returned
      by this function.
      
      In the case that this function returns `NULL`, you must not give any
      [gid.glib2.variant.Variant], but `NULL` instead.
      
      The parameter type of a particular action will never change but it is
      possible for an action to be removed and for a new action to be added
      with the same name but a different parameter type.
  
      Params:
        actionName = the name of the action to query
      Returns: the parameter type
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActionParameterType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant_type.VariantType vfuncGetActionParameterType(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.getActionParameterType)
      return typeof(return).init;

    const(GVariantType)* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getActionParameterType(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries the current state of the named action within action_group.
      
      If the action is not stateful then `NULL` will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gid.gio2.action_group.ActionGroup.getActionStateType].
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
  
      Params:
        actionName = the name of the action to query
      Returns: the current state of the action
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActionState`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant.Variant vfuncGetActionState(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.getActionState)
      return typeof(return).init;

    GVariant* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getActionState(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Requests a hint about the valid range of values for the state of the
      named action within action_group.
      
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
  
      Params:
        actionName = the name of the action to query
      Returns: the state range hint
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActionStateHint`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant.Variant vfuncGetActionStateHint(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.getActionStateHint)
      return typeof(return).init;

    GVariant* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getActionStateHint(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the type of the state of the named action within
      action_group.
      
      If the action is stateful then this function returns the
      [gid.glib2.variant_type.VariantType] of the state.  All calls to
      [gid.gio2.action_group.ActionGroup.changeActionState] must give a [gid.glib2.variant.Variant] of this
      type and [gid.gio2.action_group.ActionGroup.getActionState] will return a [gid.glib2.variant.Variant]
      of the same type.
      
      If the action is not stateful then this function will return `NULL`.
      In that case, [gid.gio2.action_group.ActionGroup.getActionState] will return `NULL`
      and you must not call [gid.gio2.action_group.ActionGroup.changeActionState].
      
      The state type of a particular action will never change but it is
      possible for an action to be removed and for a new action to be added
      with the same name but a different state type.
  
      Params:
        actionName = the name of the action to query
      Returns: the state type, if the action is stateful
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetActionStateType`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.glib2.variant_type.VariantType vfuncGetActionStateType(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.getActionStateType)
      return typeof(return).init;

    const(GVariantType)* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getActionStateType(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if the named action exists within action_group.
  
      Params:
        actionName = the name of the action to check for
      Returns: whether the named action exists
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncHasAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncHasAction(string actionName)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.hasAction)
      return typeof(return).init;

    bool _retval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)_klass.hasAction(cast(GActionGroup*)this._cPtr, _actionName);
    return _retval;
  }

  /**
      Lists the actions contained within action_group.
      
      The caller is responsible for freeing the list with `funcGLib.strfreev` when
      it is no longer required.
      Returns: a `NULL`-terminated array
          of the names of the actions in the group
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncListActions`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncListActions()
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.listActions)
      return typeof(return).init;

    char** _cretval;
    _cretval = _klass.listActions(cast(GActionGroup*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Queries all aspects of the named action within an action_group.
      
      This function acquires the information available from
      [gid.gio2.action_group.ActionGroup.hasAction], [gid.gio2.action_group.ActionGroup.getActionEnabled],
      [gid.gio2.action_group.ActionGroup.getActionParameterType],
      [gid.gio2.action_group.ActionGroup.getActionStateType],
      [gid.gio2.action_group.ActionGroup.getActionStateHint] and
      [gid.gio2.action_group.ActionGroup.getActionState] with a single function call.
      
      This provides two main benefits.
      
      The first is the improvement in efficiency that comes with not having
      to perform repeated lookups of the action in order to discover
      different things about it.  The second is that implementing
      [gid.gio2.action_group.ActionGroup] can now be done by only overriding this one virtual
      function.
      
      The interface provides a default implementation of this function that
      calls the individual functions, as required, to fetch the
      information.  The interface also provides default implementations of
      those functions that call this function.  All implementations,
      therefore, must override either this function or all of the others.
      
      If the action exists, `TRUE` is returned and any of the requested
      fields (as indicated by having a non-`NULL` reference passed in) are
      filled.  If the action doesn’t exist, `FALSE` is returned and the
      fields may or may not have been modified.
  
      Params:
        actionName = the name of an action in the group
        enabled = if the action is presently enabled
        parameterType = the parameter type, or `NULL` if none needed
        stateType = the state type, or `NULL` if stateless
        stateHint = the state hint, or `NULL` if none
        state = the current state, or `NULL` if stateless
      Returns: `TRUE` if the action exists, else `FALSE`
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncQueryAction`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncQueryAction(string actionName, out bool enabled, out gid.glib2.variant_type.VariantType parameterType, out gid.glib2.variant_type.VariantType stateType, out gid.glib2.variant.Variant stateHint, out gid.glib2.variant.Variant state)
  {
    auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.action_group.ActionGroup._getGType);
    if (!_klass || !_klass.queryAction)
      return typeof(return).init;

    bool _retval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    gboolean _enabled;
    const(GVariantType)* _parameterType;
    const(GVariantType)* _stateType;
    GVariant* _stateHint;
    GVariant* _state;
    _retval = cast(bool)_klass.queryAction(cast(GActionGroup*)this._cPtr, _actionName, &_enabled, &_parameterType, &_stateType, &_stateHint, &_state);
    enabled = cast(bool)_enabled;
    if (_parameterType)
      parameterType = new gid.glib2.variant_type.VariantType(cast(void*)_parameterType, No.Take);
    if (_stateType)
      stateType = new gid.glib2.variant_type.VariantType(cast(void*)_stateType, No.Take);
    if (_stateHint)
      stateHint = new gid.glib2.variant.Variant(cast(void*)_stateHint, Yes.Take);
    if (_state)
      state = new gid.glib2.variant.Variant(cast(void*)_state, Yes.Take);
    return _retval;
  }

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionAdded] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
  */
  override void actionAdded(string actionName) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_action_group_action_added(cast(GActionGroup*)this._cPtr, _actionName);
  }

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionEnabledChanged] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
        enabled = whether the action is now enabled
  */
  override void actionEnabledChanged(string actionName, bool enabled) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_action_group_action_enabled_changed(cast(GActionGroup*)this._cPtr, _actionName, enabled);
  }

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionRemoved] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
  */
  override void actionRemoved(string actionName) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_action_group_action_removed(cast(GActionGroup*)this._cPtr, _actionName);
  }

  /**
      Emits the [gid.gio2.action_group.ActionGroup.actionStateChanged] signal on action_group.
      
      This function should only be called by [gid.gio2.action_group.ActionGroup] implementations.
  
      Params:
        actionName = the name of an action in the group
        state = the new state of the named action
  */
  override void actionStateChanged(string actionName, gid.glib2.variant.Variant state) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_action_group_action_state_changed(cast(GActionGroup*)this._cPtr, _actionName, state ? cast(GVariant*)state._cPtr(No.Dup) : null);
  }

  /**
      Activate the named action within action_group.
      
      If the action is expecting a parameter, then the correct type of
      parameter must be given as parameter.  If the action is expecting no
      parameters then parameter must be `NULL`.  See
      [gid.gio2.action_group.ActionGroup.getActionParameterType].
      
      If the [gid.gio2.action_group.ActionGroup] implementation supports asynchronous remote
      activation over D-Bus, this call may return before the relevant
      D-Bus traffic has been sent, or any replies have been received. In
      order to block on such asynchronous activation calls,
      [gid.gio2.dbus_connection.DBusConnection.flush] should be called prior to the code, which
      depends on the result of the action activation. Without flushing
      the D-Bus connection, there is no guarantee that the action would
      have been activated.
      
      The following code which runs in a remote app instance, shows an
      example of a ‘quit’ action being activated on the primary app
      instance over D-Bus. Here [gid.gio2.dbus_connection.DBusConnection.flush] is called
      before `exit()`. Without `[gid.gio2.dbus_connection.DBusConnection.flush]`, the ‘quit’ action
      may fail to be activated on the primary instance.
      
      ```c
      // call ‘quit’ action on primary instance
      g_action_group_activate_action (G_ACTION_GROUP (app), "quit", NULL);
      
      // make sure the action is activated now
      g_dbus_connection_flush (…);
      
      g_debug ("Application has been terminated. Exiting.");
      
      exit (0);
      ```
  
      Params:
        actionName = the name of the action to activate
        parameter = parameters to the activation
  */
  override void activateAction(string actionName, gid.glib2.variant.Variant parameter = null) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_action_group_activate_action(cast(GActionGroup*)this._cPtr, _actionName, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null);
  }

  /**
      Request for the state of the named action within action_group to be
      changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gid.gio2.action_group.ActionGroup.getActionStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gid.gio2.action_group.ActionGroup.getActionStateHint].
      
      If the value GVariant is floating, it is consumed.
  
      Params:
        actionName = the name of the action to request the change on
        value = the new state
  */
  override void changeActionState(string actionName, gid.glib2.variant.Variant value) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_action_group_change_action_state(cast(GActionGroup*)this._cPtr, _actionName, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Checks if the named action within action_group is currently enabled.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
  
      Params:
        actionName = the name of the action to query
      Returns: whether the action is currently enabled
  */
  override bool getActionEnabled(string actionName) nothrow
  {
    bool _retval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_action_group_get_action_enabled(cast(GActionGroup*)this._cPtr, _actionName);
    return _retval;
  }

  /**
      Queries the type of the parameter that must be given when activating
      the named action within action_group.
      
      When activating the action using [gid.gio2.action_group.ActionGroup.activateAction],
      the [gid.glib2.variant.Variant] given to that function must be of the type returned
      by this function.
      
      In the case that this function returns `NULL`, you must not give any
      [gid.glib2.variant.Variant], but `NULL` instead.
      
      The parameter type of a particular action will never change but it is
      possible for an action to be removed and for a new action to be added
      with the same name but a different parameter type.
  
      Params:
        actionName = the name of the action to query
      Returns: the parameter type
  */
  override gid.glib2.variant_type.VariantType getActionParameterType(string actionName) nothrow
  {
    const(GVariantType)* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_action_group_get_action_parameter_type(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Queries the current state of the named action within action_group.
      
      If the action is not stateful then `NULL` will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gid.gio2.action_group.ActionGroup.getActionStateType].
      
      The return value (if non-`NULL`) should be freed with
      [gid.glib2.variant.Variant.unref] when it is no longer required.
  
      Params:
        actionName = the name of the action to query
      Returns: the current state of the action
  */
  override gid.glib2.variant.Variant getActionState(string actionName) nothrow
  {
    GVariant* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_action_group_get_action_state(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Requests a hint about the valid range of values for the state of the
      named action within action_group.
      
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
  
      Params:
        actionName = the name of the action to query
      Returns: the state range hint
  */
  override gid.glib2.variant.Variant getActionStateHint(string actionName) nothrow
  {
    GVariant* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_action_group_get_action_state_hint(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the type of the state of the named action within
      action_group.
      
      If the action is stateful then this function returns the
      [gid.glib2.variant_type.VariantType] of the state.  All calls to
      [gid.gio2.action_group.ActionGroup.changeActionState] must give a [gid.glib2.variant.Variant] of this
      type and [gid.gio2.action_group.ActionGroup.getActionState] will return a [gid.glib2.variant.Variant]
      of the same type.
      
      If the action is not stateful then this function will return `NULL`.
      In that case, [gid.gio2.action_group.ActionGroup.getActionState] will return `NULL`
      and you must not call [gid.gio2.action_group.ActionGroup.changeActionState].
      
      The state type of a particular action will never change but it is
      possible for an action to be removed and for a new action to be added
      with the same name but a different state type.
  
      Params:
        actionName = the name of the action to query
      Returns: the state type, if the action is stateful
  */
  override gid.glib2.variant_type.VariantType getActionStateType(string actionName) nothrow
  {
    const(GVariantType)* _cretval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _cretval = g_action_group_get_action_state_type(cast(GActionGroup*)this._cPtr, _actionName);
    auto _retval = _cretval ? new gid.glib2.variant_type.VariantType(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Checks if the named action exists within action_group.
  
      Params:
        actionName = the name of the action to check for
      Returns: whether the named action exists
  */
  override bool hasAction(string actionName) nothrow
  {
    bool _retval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_action_group_has_action(cast(GActionGroup*)this._cPtr, _actionName);
    return _retval;
  }

  /**
      Lists the actions contained within action_group.
      
      The caller is responsible for freeing the list with `funcGLib.strfreev` when
      it is no longer required.
      Returns: a `NULL`-terminated array
          of the names of the actions in the group
  */
  override string[] listActions() nothrow
  {
    char** _cretval;
    _cretval = g_action_group_list_actions(cast(GActionGroup*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Queries all aspects of the named action within an action_group.
      
      This function acquires the information available from
      [gid.gio2.action_group.ActionGroup.hasAction], [gid.gio2.action_group.ActionGroup.getActionEnabled],
      [gid.gio2.action_group.ActionGroup.getActionParameterType],
      [gid.gio2.action_group.ActionGroup.getActionStateType],
      [gid.gio2.action_group.ActionGroup.getActionStateHint] and
      [gid.gio2.action_group.ActionGroup.getActionState] with a single function call.
      
      This provides two main benefits.
      
      The first is the improvement in efficiency that comes with not having
      to perform repeated lookups of the action in order to discover
      different things about it.  The second is that implementing
      [gid.gio2.action_group.ActionGroup] can now be done by only overriding this one virtual
      function.
      
      The interface provides a default implementation of this function that
      calls the individual functions, as required, to fetch the
      information.  The interface also provides default implementations of
      those functions that call this function.  All implementations,
      therefore, must override either this function or all of the others.
      
      If the action exists, `TRUE` is returned and any of the requested
      fields (as indicated by having a non-`NULL` reference passed in) are
      filled.  If the action doesn’t exist, `FALSE` is returned and the
      fields may or may not have been modified.
  
      Params:
        actionName = the name of an action in the group
        enabled = if the action is presently enabled
        parameterType = the parameter type, or `NULL` if none needed
        stateType = the state type, or `NULL` if stateless
        stateHint = the state hint, or `NULL` if none
        state = the current state, or `NULL` if stateless
      Returns: `TRUE` if the action exists, else `FALSE`
  */
  override bool queryAction(string actionName, out bool enabled, out gid.glib2.variant_type.VariantType parameterType, out gid.glib2.variant_type.VariantType stateType, out gid.glib2.variant.Variant stateHint, out gid.glib2.variant.Variant state) nothrow
  {
    bool _retval;
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    gboolean _enabled;
    const(GVariantType)* _parameterType;
    const(GVariantType)* _stateType;
    GVariant* _stateHint;
    GVariant* _state;
    _retval = cast(bool)g_action_group_query_action(cast(GActionGroup*)this._cPtr, _actionName, &_enabled, &_parameterType, &_stateType, &_stateHint, &_state);
    enabled = cast(bool)_enabled;
    if (_parameterType)
      parameterType = new gid.glib2.variant_type.VariantType(cast(void*)_parameterType, No.Take);
    if (_stateType)
      stateType = new gid.glib2.variant_type.VariantType(cast(void*)_stateType, No.Take);
    if (_stateHint)
      stateHint = new gid.glib2.variant.Variant(cast(void*)_stateHint, Yes.Take);
    if (_state)
      state = new gid.glib2.variant.Variant(cast(void*)_state, Yes.Take);
    return _retval;
  }

  /**
      Connect to `ActionAdded` signal.
  
      Signals that a new action was just added to the group.
        
        This signal is emitted after the action has been added
        and is now visible.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string actionName, gid.gio2.action_group.ActionGroup actionGroup)`
  
          `actionName` the name of the action in action_group (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActionAdded(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.action_group.ActionGroup)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.actionAdded");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("action-added"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `ActionEnabledChanged` signal.
  
      Signals that the enabled status of the named action has changed.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string actionName, bool enabled, gid.gio2.action_group.ActionGroup actionGroup)`
  
          `actionName` the name of the action in action_group (optional)
  
          `enabled` whether the action is enabled (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActionEnabledChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == bool)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.action_group.ActionGroup)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.actionEnabledChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("action-enabled-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `ActionRemoved` signal.
  
      Signals that an action is just about to be removed from the group.
        
        This signal is emitted before the action is removed, so the action
        is still visible and can be queried from the signal handler.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string actionName, gid.gio2.action_group.ActionGroup actionGroup)`
  
          `actionName` the name of the action in action_group (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActionRemoved(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gio2.action_group.ActionGroup)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.actionRemoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("action-removed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `ActionStateChanged` signal.
  
      Signals that the state of the named action has changed.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string actionName, gid.glib2.variant.Variant value, gid.gio2.action_group.ActionGroup actionGroup)`
  
          `actionName` the name of the action in action_group (optional)
  
          `value` the new value of the state (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActionStateChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.glib2.variant.Variant)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.gio2.action_group.ActionGroup)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.actionStateChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("action-state-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.action_group.ActionGroup (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_action_group_ActionGroup(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionAdded", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionEnabledChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionStateChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivateAction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChangeActionState", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionEnabled", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionParameterType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionState", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionStateHint", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionStateType", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasAction", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListActions", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryAction", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.action_group.ActionGroup vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gobject.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_action_group_ActionGroup(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionAdded", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "action_added");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionEnabledChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "action_enabled_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionRemoved", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "action_removed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActionStateChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "action_state_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivateAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "activate_action");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChangeActionState", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "change_action_state");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionEnabled", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "get_action_enabled");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionParameterType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "get_action_parameter_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionState", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "get_action_state");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionStateHint", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "get_action_state_hint");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetActionStateType", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "get_action_state_type");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncHasAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "has_action");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListActions", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "list_actions");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncQueryAction", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_action_group_ActionGroup(iface, "query_action");
  }

  private static void _installIfaceVfunc_gid_gio2_action_group_ActionGroup(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GActionGroupInterface*)iface;

    switch (vfunc)
    {
      case "action_added":
      {
        static extern(C) void _vfuncActionAddedTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.actionAdded)
              return (cast(typeof(&_vfuncActionAddedTramp))_klass.actionAdded)(actionGroup, actionName);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncActionAdded(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncActionAdded");
          }
        }

        _klass.actionAdded = cast(typeof(_klass.actionAdded))&_vfuncActionAddedTramp;
        break;
      }
      case "action_enabled_changed":
      {
        static extern(C) void _vfuncActionEnabledChangedTramp(GActionGroup* actionGroup, const(char)* actionName, gboolean enabled) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.actionEnabledChanged)
              return (cast(typeof(&_vfuncActionEnabledChangedTramp))_klass.actionEnabledChanged)(actionGroup, actionName, enabled);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncActionEnabledChanged(_actionName, cast(bool)enabled);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncActionEnabledChanged");
          }
        }

        _klass.actionEnabledChanged = cast(typeof(_klass.actionEnabledChanged))&_vfuncActionEnabledChangedTramp;
        break;
      }
      case "action_removed":
      {
        static extern(C) void _vfuncActionRemovedTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.actionRemoved)
              return (cast(typeof(&_vfuncActionRemovedTramp))_klass.actionRemoved)(actionGroup, actionName);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncActionRemoved(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncActionRemoved");
          }
        }

        _klass.actionRemoved = cast(typeof(_klass.actionRemoved))&_vfuncActionRemovedTramp;
        break;
      }
      case "action_state_changed":
      {
        static extern(C) void _vfuncActionStateChangedTramp(GActionGroup* actionGroup, const(char)* actionName, GVariant* state) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.actionStateChanged)
              return (cast(typeof(&_vfuncActionStateChangedTramp))_klass.actionStateChanged)(actionGroup, actionName, state);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncActionStateChanged(_actionName, state ? new gid.glib2.variant.Variant(cast(void*)state, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncActionStateChanged");
          }
        }

        _klass.actionStateChanged = cast(typeof(_klass.actionStateChanged))&_vfuncActionStateChangedTramp;
        break;
      }
      case "activate_action":
      {
        static extern(C) void _vfuncActivateActionTramp(GActionGroup* actionGroup, const(char)* actionName, GVariant* parameter) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.activateAction)
              return (cast(typeof(&_vfuncActivateActionTramp))_klass.activateAction)(actionGroup, actionName, parameter);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncActivateAction(_actionName, parameter ? new gid.glib2.variant.Variant(cast(void*)parameter, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncActivateAction");
          }
        }

        _klass.activateAction = cast(typeof(_klass.activateAction))&_vfuncActivateActionTramp;
        break;
      }
      case "change_action_state":
      {
        static extern(C) void _vfuncChangeActionStateTramp(GActionGroup* actionGroup, const(char)* actionName, GVariant* value) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.changeActionState)
              return (cast(typeof(&_vfuncChangeActionStateTramp))_klass.changeActionState)(actionGroup, actionName, value);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncChangeActionState(_actionName, value ? new gid.glib2.variant.Variant(cast(void*)value, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncChangeActionState");
          }
        }

        _klass.changeActionState = cast(typeof(_klass.changeActionState))&_vfuncChangeActionStateTramp;
        break;
      }
      case "get_action_enabled":
      {
        static extern(C) gboolean _vfuncGetActionEnabledTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.getActionEnabled)
              return (cast(typeof(&_vfuncGetActionEnabledTramp))_klass.getActionEnabled)(actionGroup, actionName);
            return typeof(return).init;
          }

          bool _dretval;
          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetActionEnabled(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncGetActionEnabled");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.getActionEnabled = cast(typeof(_klass.getActionEnabled))&_vfuncGetActionEnabledTramp;
        break;
      }
      case "get_action_parameter_type":
      {
        static extern(C) const(GVariantType)* _vfuncGetActionParameterTypeTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.getActionParameterType)
              return (cast(typeof(&_vfuncGetActionParameterTypeTramp))_klass.getActionParameterType)(actionGroup, actionName);
            return typeof(return).init;
          }

          gid.glib2.variant_type.VariantType _dretval;
          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetActionParameterType(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncGetActionParameterType");
          }
          auto _retval = _dretval ? cast(const(GVariantType)*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getActionParameterType = cast(typeof(_klass.getActionParameterType))&_vfuncGetActionParameterTypeTramp;
        break;
      }
      case "get_action_state":
      {
        static extern(C) GVariant* _vfuncGetActionStateTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.getActionState)
              return (cast(typeof(&_vfuncGetActionStateTramp))_klass.getActionState)(actionGroup, actionName);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;
          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetActionState(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncGetActionState");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getActionState = cast(typeof(_klass.getActionState))&_vfuncGetActionStateTramp;
        break;
      }
      case "get_action_state_hint":
      {
        static extern(C) GVariant* _vfuncGetActionStateHintTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.getActionStateHint)
              return (cast(typeof(&_vfuncGetActionStateHintTramp))_klass.getActionStateHint)(actionGroup, actionName);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;
          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetActionStateHint(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncGetActionStateHint");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getActionStateHint = cast(typeof(_klass.getActionStateHint))&_vfuncGetActionStateHintTramp;
        break;
      }
      case "get_action_state_type":
      {
        static extern(C) const(GVariantType)* _vfuncGetActionStateTypeTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.getActionStateType)
              return (cast(typeof(&_vfuncGetActionStateTypeTramp))_klass.getActionStateType)(actionGroup, actionName);
            return typeof(return).init;
          }

          gid.glib2.variant_type.VariantType _dretval;
          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetActionStateType(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncGetActionStateType");
          }
          auto _retval = _dretval ? cast(const(GVariantType)*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.getActionStateType = cast(typeof(_klass.getActionStateType))&_vfuncGetActionStateTypeTramp;
        break;
      }
      case "has_action":
      {
        static extern(C) gboolean _vfuncHasActionTramp(GActionGroup* actionGroup, const(char)* actionName) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.hasAction)
              return (cast(typeof(&_vfuncHasActionTramp))_klass.hasAction)(actionGroup, actionName);
            return typeof(return).init;
          }

          bool _dretval;
          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncHasAction(_actionName);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncHasAction");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.hasAction = cast(typeof(_klass.hasAction))&_vfuncHasActionTramp;
        break;
      }
      case "list_actions":
      {
        static extern(C) char** _vfuncListActionsTramp(GActionGroup* actionGroup) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.listActions)
              return (cast(typeof(&_vfuncListActionsTramp))_klass.listActions)(actionGroup);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncListActions();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncListActions");
          }
          char** _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc((_dretval.length + 1) * (*_retval).sizeof);

            foreach (i; 0 .. _dretval.length)
              _retval[i] = toCString!(Yes.Malloc)(_dretval[i]);
          }


          return _retval;
        }

        _klass.listActions = cast(typeof(_klass.listActions))&_vfuncListActionsTramp;
        break;
      }
      case "query_action":
      {
        static extern(C) gboolean _vfuncQueryActionTramp(GActionGroup* actionGroup, const(char)* actionName, gboolean* enabled, const(GVariantType*)* parameterType, const(GVariantType*)* stateType, GVariant** stateHint, GVariant** state) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)actionGroup);
          if (!_obj)
          {
            auto _klass = cast(GActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)actionGroup), gid.gio2.action_group.ActionGroup._getGType);
            if (_klass && _klass.queryAction)
              return (cast(typeof(&_vfuncQueryActionTramp))_klass.queryAction)(actionGroup, actionName, enabled, parameterType, stateType, stateHint, state);
            return typeof(return).init;
          }

          typeof(*parameterType) _parameterTypeNull;
          if (!parameterType)
            parameterType = &_parameterTypeNull;

          typeof(*stateType) _stateTypeNull;
          if (!stateType)
            stateType = &_stateTypeNull;

          typeof(*stateHint) _stateHintNull;
          if (!stateHint)
            stateHint = &_stateHintNull;

          typeof(*state) _stateNull;
          if (!state)
            state = &_stateNull;

          bool _dretval;
          string _actionName = actionName.fromCString!(No.Free);
          bool _enabled;
          gid.glib2.variant_type.VariantType _parameterType;
          gid.glib2.variant_type.VariantType _stateType;
          gid.glib2.variant.Variant _stateHint;
          gid.glib2.variant.Variant _state;

          try
          {
            _dretval = _obj.vfuncQueryAction(_actionName, _enabled, _parameterType, _stateType, _stateHint, _state);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.action_group.ActionGroup.vfuncQueryAction");
          }
          auto _retval = cast(gboolean)_dretval;
          *enabled = _enabled;
          *cast(GVariantType**)parameterType = _parameterType ? cast(GVariantType*)_parameterType._cPtr(No.Dup) : null;
          *cast(GVariantType**)stateType = _stateType ? cast(GVariantType*)_stateType._cPtr(No.Dup) : null;
          *stateHint = _stateHint ? cast(GVariant*)_stateHint._cPtr(Yes.Dup) : null;
          *state = _state ? cast(GVariant*)_state._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.queryAction = cast(typeof(_klass.queryAction))&_vfuncQueryActionTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.action_group.ActionGroup]
template ActionGroupGidBuilderT()
{
}
