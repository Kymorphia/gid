/// Module for [RemoteActionGroup] interface mixin
module gid.gio2.remote_action_group_mixin;

public import gid.core.basictypes;
public import gid.gio2.remote_action_group;
public import gid.gio2.remote_action_group_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.variant;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncActivateActionFull`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncActivateActionFull(string actionName, gid.glib2.variant.Variant parameter, gid.glib2.variant.Variant platformData)
  {
    auto _klass = cast(GRemoteActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.remote_action_group.RemoteActionGroup._getGType);
    if (!_klass || !_klass.activateActionFull)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.activateActionFull(cast(GRemoteActionGroup*)this._cPtr, _actionName, parameter ? cast(GVariant*)parameter._cPtr(No.Dup) : null, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncChangeActionStateFull`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncChangeActionStateFull(string actionName, gid.glib2.variant.Variant value, gid.glib2.variant.Variant platformData)
  {
    auto _klass = cast(GRemoteActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.remote_action_group.RemoteActionGroup._getGType);
    if (!_klass || !_klass.changeActionStateFull)
      return;

    const(char)* _actionName = actionName.toCString!(No.Malloc, No.Nullable);
    _klass.changeActionStateFull(cast(GRemoteActionGroup*)this._cPtr, _actionName, value ? cast(GVariant*)value._cPtr(No.Dup) : null, platformData ? cast(GVariant*)platformData._cPtr(No.Dup) : null);
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

  /// True if the D class T overrides any vfunc method of gid.gio2.remote_action_group.RemoteActionGroup (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_remote_action_group_RemoteActionGroup(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivateActionFull", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChangeActionStateFull", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.remote_action_group.RemoteActionGroup vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_remote_action_group_RemoteActionGroup(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncActivateActionFull", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_remote_action_group_RemoteActionGroup(iface, "activate_action_full");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncChangeActionStateFull", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_remote_action_group_RemoteActionGroup(iface, "change_action_state_full");
  }

  private static void _installIfaceVfunc_gid_gio2_remote_action_group_RemoteActionGroup(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GRemoteActionGroupInterface*)iface;

    switch (vfunc)
    {
      case "activate_action_full":
      {
        static extern(C) void _vfuncActivateActionFullTramp(GRemoteActionGroup* remote, const(char)* actionName, GVariant* parameter, GVariant* platformData) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)remote);
          if (!_obj)
          {
            auto _klass = cast(GRemoteActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)remote), gid.gio2.remote_action_group.RemoteActionGroup._getGType);
            if (_klass && _klass.activateActionFull)
              return (cast(typeof(&_vfuncActivateActionFullTramp))_klass.activateActionFull)(remote, actionName, parameter, platformData);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncActivateActionFull(_actionName, parameter ? new gid.glib2.variant.Variant(cast(void*)parameter, No.Take) : null, platformData ? new gid.glib2.variant.Variant(cast(void*)platformData, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.remote_action_group.RemoteActionGroup.vfuncActivateActionFull");
          }
        }

        _klass.activateActionFull = cast(typeof(_klass.activateActionFull))&_vfuncActivateActionFullTramp;
        break;
      }
      case "change_action_state_full":
      {
        static extern(C) void _vfuncChangeActionStateFullTramp(GRemoteActionGroup* remote, const(char)* actionName, GVariant* value, GVariant* platformData) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)remote);
          if (!_obj)
          {
            auto _klass = cast(GRemoteActionGroupInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)remote), gid.gio2.remote_action_group.RemoteActionGroup._getGType);
            if (_klass && _klass.changeActionStateFull)
              return (cast(typeof(&_vfuncChangeActionStateFullTramp))_klass.changeActionStateFull)(remote, actionName, value, platformData);
            return;
          }

          string _actionName = actionName.fromCString!(No.Free);

          try
          {
            _obj.vfuncChangeActionStateFull(_actionName, value ? new gid.glib2.variant.Variant(cast(void*)value, No.Take) : null, platformData ? new gid.glib2.variant.Variant(cast(void*)platformData, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.remote_action_group.RemoteActionGroup.vfuncChangeActionStateFull");
          }
        }

        _klass.changeActionStateFull = cast(typeof(_klass.changeActionStateFull))&_vfuncChangeActionStateFullTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.remote_action_group.RemoteActionGroup]
template RemoteActionGroupGidBuilderT()
{
}
