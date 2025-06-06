/// Module for [RemoteActionGroup] interface
module gio.remote_action_group;

public import gio.remote_action_group_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.variant;

/**
    The [gio.remote_action_group.RemoteActionGroup] interface is implemented by [gio.action_group.ActionGroup]
    instances that either transmit action invocations to other processes
    or receive action invocations in the local process from other
    processes.
    
    The interface has `_full` variants of the two
    methods on [gio.action_group.ActionGroup] used to activate actions:
    [gio.action_group.ActionGroup.activateAction] and
    [gio.action_group.ActionGroup.changeActionState]. These variants allow a
    ‘platform data’ [glib.variant.Variant] to be specified: a dictionary providing
    context for the action invocation (for example: timestamps, startup
    notification IDs, etc).
    
    [gio.dbus_action_group.DBusActionGroup] implements [gio.remote_action_group.RemoteActionGroup].  This provides a
    mechanism to send platform data for action invocations over D-Bus.
    
    Additionally, [gio.dbus_connection.DBusConnection.exportActionGroup] will check if
    the exported [gio.action_group.ActionGroup] implements [gio.remote_action_group.RemoteActionGroup] and use
    the `_full` variants of the calls if available.  This
    provides a mechanism by which to receive platform data for action
    invocations that arrive by way of D-Bus.
*/
interface RemoteActionGroup
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_remote_action_group_get_type != &gidSymbolNotFound ? g_remote_action_group_get_type() : cast(GType)0;
  }

  /**
      Activates the remote action.
      
      This is the same as [gio.action_group.ActionGroup.activateAction] except that it
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
  void activateActionFull(string actionName, glib.variant.Variant parameter, glib.variant.Variant platformData);

  /**
      Changes the state of a remote action.
      
      This is the same as [gio.action_group.ActionGroup.changeActionState] except that
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
  void changeActionStateFull(string actionName, glib.variant.Variant value, glib.variant.Variant platformData);
}
