/// Module for [RemoteActionGroup] interface mixin
module gid.gio2.remote_action_group_mixin;

public import gid.core.basictypes;
public import gid.gio2.remote_action_group_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.variant;
public import gid.gobject2.gid_builder;

/**
    The [gid.gio2.remote_action_group.RemoteActionGroup] interface is implemented by [gid.gio2.action_group.ActionGroup]
    instances that either transmit action invocations to other processes
    or receive action invocations in the local process from other
    processes.
    
    The interface has `_full` variants of the two
    methods on [gid.gio2.action_group.ActionGroup] used to activate actions:
    [gid.gio2.action_group.ActionGroup.activateAction] and
    [gid.gio2.action_group.ActionGroup.changeActionState]. These variants allow a
    ‘platform data’ [gid.glib2.variant.Variant] to be specified: a dictionary providing
    context for the action invocation (for example: timestamps, startup
    notification IDs, etc).
    
    [gid.gio2.dbus_action_group.DBusActionGroup] implements [gid.gio2.remote_action_group.RemoteActionGroup].  This provides a
    mechanism to send platform data for action invocations over D-Bus.
    
    Additionally, [gid.gio2.dbus_connection.DBusConnection.exportActionGroup] will check if
    the exported [gid.gio2.action_group.ActionGroup] implements [gid.gio2.remote_action_group.RemoteActionGroup] and use
    the `_full` variants of the calls if available.  This
    provides a mechanism by which to receive platform data for action
    invocations that arrive by way of D-Bus.
*/
template RemoteActionGroupT()
{

  /**
      Activates the remote action.
      
      This is the same as [gid.gio2.action_group.ActionGroup.activateAction] except that it
      allows for provision of "platform data" to be sent along with the
      activation request.  This typically contains details such as the user
      interaction timestamp or startup notification information.
      
      platform_data must be non-null and must have the type
      `G_VARIANT_TYPE_VARDICT`.  If it is floating, it will be consumed.
  
      Params:
        actionName = the name of the action to activate
        parameter = the optional parameter to the activation
        platformData = the platform data to send
  */
  override void activateActionFull(string actionName, gid.glib2.variant.Variant parameter, gid.glib2.variant.Variant platformData) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_remote_action_group_activate_action_full(cast(GRemoteActionGroup*)this._cPtr, _actionName, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
  }

  /**
      Changes the state of a remote action.
      
      This is the same as [gid.gio2.action_group.ActionGroup.changeActionState] except that
      it allows for provision of "platform data" to be sent along with the
      state change request.  This typically contains details such as the
      user interaction timestamp or startup notification information.
      
      platform_data must be non-null and must have the type
      `G_VARIANT_TYPE_VARDICT`.  If it is floating, it will be consumed.
  
      Params:
        actionName = the name of the action to change the state of
        value = the new requested value for the state
        platformData = the platform data to send
  */
  override void changeActionStateFull(string actionName, gid.glib2.variant.Variant value, gid.glib2.variant.Variant platformData) nothrow
  {
    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    g_remote_action_group_change_action_state_full(cast(GRemoteActionGroup*)this._cPtr, _actionName, value ? cast(GVariant*)value._cPtr(No.Dup) : null, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gio2.remote_action_group.RemoteActionGroup]
template RemoteActionGroupGidBuilderT()
{
}
