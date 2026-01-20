/// Module for [ActionGroup] interface
module gio.action_group;

public import gio.action_group_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.dclosure;

/**
    [gio.action_group.ActionGroup] represents a group of actions.
    
    Actions can be used to expose functionality in a structured way, either
    from one part of a program to another, or to the outside world. Action
    groups are often used together with a [gio.menu_model.MenuModel] that provides additional
    representation data for displaying the actions to the user, e.g. in a menu.
    
    The main way to interact with the actions in a [gio.action_group.ActionGroup] is to
    activate them with [gio.action_group.ActionGroup.activateAction]. Activating an
    action may require a [glib.variant.Variant] parameter. The required type of the
    parameter can be inquired with [gio.action_group.ActionGroup.getActionParameterType].
    Actions may be disabled, see [gio.action_group.ActionGroup.getActionEnabled].
    Activating a disabled action has no effect.
    
    Actions may optionally have a state in the form of a #GVariant. The current
    state of an action can be inquired with [gio.action_group.ActionGroup.getActionState].
    Activating a stateful action may change its state, but it is also possible to
    set the state by calling [gio.action_group.ActionGroup.changeActionState].
    
    As typical example, consider a text editing application which has an
    option to change the current font to 'bold'. A good way to represent
    this would be a stateful action, with a boolean state. Activating the
    action would toggle the state.
    
    Each action in the group has a unique name (which is a string).  All
    method calls, except [gio.action_group.ActionGroup.listActions] take the name of
    an action as an argument.
    
    The [gio.action_group.ActionGroup] API is meant to be the 'public' API to the action
    group. The calls here are exactly the interaction that 'external
    forces' (eg: UI, incoming D-Bus messages, etc.) are supposed to have
    with actions. 'Internal' APIs (ie: ones meant only to be accessed by
    the action group implementation) are found on subclasses. This is
    why you will find - for example - [gio.action_group.ActionGroup.getActionEnabled]
    but not an equivalent set() call.
    
    Signals are emitted on the action group in response to state changes
    on individual actions.
    
    Implementations of [gio.action_group.ActionGroup] should provide implementations for
    the virtual functions [gio.action_group.ActionGroup.listActions] and
    [gio.action_group.ActionGroup.queryAction]. The other virtual functions should
    not be implemented - their "wrappers" are actually implemented with
    calls to [gio.action_group.ActionGroup.queryAction].
*/
interface ActionGroup
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_action_group_get_type != &gidSymbolNotFound ? g_action_group_get_type() : cast(GType)0;
  }

  /**
      Emits the #GActionGroup::action-added signal on action_group.
      
      This function should only be called by #GActionGroup implementations.
  
      Params:
        actionName = the name of an action in the group
  */
  void actionAdded(string actionName);

  /**
      Emits the #GActionGroup::action-enabled-changed signal on action_group.
      
      This function should only be called by #GActionGroup implementations.
  
      Params:
        actionName = the name of an action in the group
        enabled = whether or not the action is now enabled
  */
  void actionEnabledChanged(string actionName, bool enabled);

  /**
      Emits the #GActionGroup::action-removed signal on action_group.
      
      This function should only be called by #GActionGroup implementations.
  
      Params:
        actionName = the name of an action in the group
  */
  void actionRemoved(string actionName);

  /**
      Emits the #GActionGroup::action-state-changed signal on action_group.
      
      This function should only be called by #GActionGroup implementations.
  
      Params:
        actionName = the name of an action in the group
        state = the new state of the named action
  */
  void actionStateChanged(string actionName, glib.variant.Variant state);

  /**
      Activate the named action within action_group.
      
      If the action is expecting a parameter, then the correct type of
      parameter must be given as parameter.  If the action is expecting no
      parameters then parameter must be null.  See
      [gio.action_group.ActionGroup.getActionParameterType].
      
      If the #GActionGroup implementation supports asynchronous remote
      activation over D-Bus, this call may return before the relevant
      D-Bus traffic has been sent, or any replies have been received. In
      order to block on such asynchronous activation calls,
      [gio.dbus_connection.DBusConnection.flush] should be called prior to the code, which
      depends on the result of the action activation. Without flushing
      the D-Bus connection, there is no guarantee that the action would
      have been activated.
      
      The following code which runs in a remote app instance, shows an
      example of a "quit" action being activated on the primary app
      instance over D-Bus. Here [gio.dbus_connection.DBusConnection.flush] is called
      before `exit()`. Without [gio.dbus_connection.DBusConnection.flush], the "quit" action
      may fail to be activated on the primary instance.
      
      ```c
      // call "quit" action on primary instance
      g_action_group_activate_action (G_ACTION_GROUP (app), "quit", NULL);
      
      // make sure the action is activated now
      g_dbus_connection_flush (...);
      
      g_debug ("application has been terminated. exiting.");
      
      exit (0);
      ```
  
      Params:
        actionName = the name of the action to activate
        parameter = parameters to the activation
  */
  void activateAction(string actionName, glib.variant.Variant parameter = null);

  /**
      Request for the state of the named action within action_group to be
      changed to value.
      
      The action must be stateful and value must be of the correct type.
      See [gio.action_group.ActionGroup.getActionStateType].
      
      This call merely requests a change.  The action may refuse to change
      its state or may change its state to something other than value.
      See [gio.action_group.ActionGroup.getActionStateHint].
      
      If the value GVariant is floating, it is consumed.
  
      Params:
        actionName = the name of the action to request the change on
        value = the new state
  */
  void changeActionState(string actionName, glib.variant.Variant value);

  /**
      Checks if the named action within action_group is currently enabled.
      
      An action must be enabled in order to be activated or in order to
      have its state changed from outside callers.
  
      Params:
        actionName = the name of the action to query
      Returns: whether or not the action is currently enabled
  */
  bool getActionEnabled(string actionName);

  /**
      Queries the type of the parameter that must be given when activating
      the named action within action_group.
      
      When activating the action using [gio.action_group.ActionGroup.activateAction],
      the #GVariant given to that function must be of the type returned
      by this function.
      
      In the case that this function returns null, you must not give any
      #GVariant, but null instead.
      
      The parameter type of a particular action will never change but it is
      possible for an action to be removed and for a new action to be added
      with the same name but a different parameter type.
  
      Params:
        actionName = the name of the action to query
      Returns: the parameter type
  */
  glib.variant_type.VariantType getActionParameterType(string actionName);

  /**
      Queries the current state of the named action within action_group.
      
      If the action is not stateful then null will be returned.  If the
      action is stateful then the type of the return value is the type
      given by [gio.action_group.ActionGroup.getActionStateType].
      
      The return value (if non-null) should be freed with
      [glib.variant.Variant.unref] when it is no longer required.
  
      Params:
        actionName = the name of the action to query
      Returns: the current state of the action
  */
  glib.variant.Variant getActionState(string actionName);

  /**
      Requests a hint about the valid range of values for the state of the
      named action within action_group.
      
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
  
      Params:
        actionName = the name of the action to query
      Returns: the state range hint
  */
  glib.variant.Variant getActionStateHint(string actionName);

  /**
      Queries the type of the state of the named action within
      action_group.
      
      If the action is stateful then this function returns the
      #GVariantType of the state.  All calls to
      [gio.action_group.ActionGroup.changeActionState] must give a #GVariant of this
      type and [gio.action_group.ActionGroup.getActionState] will return a #GVariant
      of the same type.
      
      If the action is not stateful then this function will return null.
      In that case, [gio.action_group.ActionGroup.getActionState] will return null
      and you must not call [gio.action_group.ActionGroup.changeActionState].
      
      The state type of a particular action will never change but it is
      possible for an action to be removed and for a new action to be added
      with the same name but a different state type.
  
      Params:
        actionName = the name of the action to query
      Returns: the state type, if the action is stateful
  */
  glib.variant_type.VariantType getActionStateType(string actionName);

  /**
      Checks if the named action exists within action_group.
  
      Params:
        actionName = the name of the action to check for
      Returns: whether the named action exists
  */
  bool hasAction(string actionName);

  /**
      Lists the actions contained within action_group.
      
      The caller is responsible for freeing the list with [glib.global.strfreev] when
      it is no longer required.
      Returns: a null-terminated array of the names of the
        actions in the group
  */
  string[] listActions();

  /**
      Queries all aspects of the named action within an action_group.
      
      This function acquires the information available from
      [gio.action_group.ActionGroup.hasAction], [gio.action_group.ActionGroup.getActionEnabled],
      [gio.action_group.ActionGroup.getActionParameterType],
      [gio.action_group.ActionGroup.getActionStateType],
      [gio.action_group.ActionGroup.getActionStateHint] and
      [gio.action_group.ActionGroup.getActionState] with a single function call.
      
      This provides two main benefits.
      
      The first is the improvement in efficiency that comes with not having
      to perform repeated lookups of the action in order to discover
      different things about it.  The second is that implementing
      #GActionGroup can now be done by only overriding this one virtual
      function.
      
      The interface provides a default implementation of this function that
      calls the individual functions, as required, to fetch the
      information.  The interface also provides default implementations of
      those functions that call this function.  All implementations,
      therefore, must override either this function or all of the others.
      
      If the action exists, true is returned and any of the requested
      fields (as indicated by having a non-null reference passed in) are
      filled.  If the action doesn't exist, false is returned and the
      fields may or may not have been modified.
  
      Params:
        actionName = the name of an action in the group
        enabled = if the action is presently enabled
        parameterType = the parameter type, or null if none needed
        stateType = the state type, or null if stateless
        stateHint = the state hint, or null if none
        state = the current state, or null if stateless
      Returns: true if the action exists, else false
  */
  bool queryAction(string actionName, out bool enabled, out glib.variant_type.VariantType parameterType, out glib.variant_type.VariantType stateType, out glib.variant.Variant stateHint, out glib.variant.Variant state);

  /**
      Connect to `ActionAdded` signal.
  
      Signals that a new action was just added to the group.
        This signal is emitted after the action has been added
        and is now visible.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string actionName, gio.action_group.ActionGroup actionGroup))
  
          `actionName` the name of the action in action_group (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActionAdded(T)(string detail = null, T callback, Flag!"After" after = No.After);

  /**
      Connect to `ActionEnabledChanged` signal.
  
      Signals that the enabled status of the named action has changed.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string actionName, bool enabled, gio.action_group.ActionGroup actionGroup))
  
          `actionName` the name of the action in action_group (optional)
  
          `enabled` whether the action is enabled or not (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActionEnabledChanged(T)(string detail = null, T callback, Flag!"After" after = No.After);

  /**
      Connect to `ActionRemoved` signal.
  
      Signals that an action is just about to be removed from the group.
        This signal is emitted before the action is removed, so the action
        is still visible and can be queried from the signal handler.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string actionName, gio.action_group.ActionGroup actionGroup))
  
          `actionName` the name of the action in action_group (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActionRemoved(T)(string detail = null, T callback, Flag!"After" after = No.After);

  /**
      Connect to `ActionStateChanged` signal.
  
      Signals that the state of the named action has changed.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          $(D void callback(string actionName, glib.variant.Variant value, gio.action_group.ActionGroup actionGroup))
  
          `actionName` the name of the action in action_group (optional)
  
          `value` the new value of the state (optional)
  
          `actionGroup` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActionStateChanged(T)(string detail = null, T callback, Flag!"After" after = No.After);
}
