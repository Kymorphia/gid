/// Module for [RemoteActionGroup] interface
module gid.gio2.remote_action_group;

public import gid.core.basictypes;
public import gid.gio2.remote_action_group_iface_proxy;
import gid.core.utils;
import gid.gio2.action_group;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.variant;
import gid.gobject2.gid_builder;

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
@gidGir("RemoteActionGroup", "RemoteActionGroupInterface")
interface RemoteActionGroup : gid.gio2.action_group.ActionGroup
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_remote_action_group_get_type != &gidSymbolNotFound ? g_remote_action_group_get_type() : cast(GType)0;
  }



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
  void activateActionFull(string actionName, gid.glib2.variant.Variant parameter, gid.glib2.variant.Variant platformData);

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
  void changeActionStateFull(string actionName, gid.glib2.variant.Variant value, gid.glib2.variant.Variant platformData);
}

/// Fluent builder implementation template for [gid.gio2.remote_action_group.RemoteActionGroup]
interface RemoteActionGroupGidBuilderImpl(T) : gid.gio2.action_group.ActionGroupGidBuilderImpl!T
{
}
