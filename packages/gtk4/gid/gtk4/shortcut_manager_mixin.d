/// Module for [ShortcutManager] interface mixin
module gid.gtk4.shortcut_manager_mixin;

public import gid.core.basictypes;
public import gid.gtk4.shortcut_manager_iface_proxy;
public import gid.core.utils;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
public import gid.gtk4.shortcut_controller;
public import gid.gtk4.types;

/**
    An interface that is used to implement shortcut scopes.
    
    This is important for [gid.gtk4.native.Native] widgets that have their
    own surface, since the event controllers that are used to implement
    managed and global scopes are limited to the same native.
    
    Examples for widgets implementing [gid.gtk4.shortcut_manager.ShortcutManager] are
    [gid.gtk4.window.Window] and [gid.gtk4.popover.Popover].
    
    Every widget that implements [gid.gtk4.shortcut_manager.ShortcutManager] will be used as a
    [gid.gtk4.types.ShortcutScope.Managed].
*/
template ShortcutManagerT()
{

  /**
      Add a [gid.gtk4.shortcut_controller.ShortcutController] to be managed.
  
      Params:
        controller = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddController`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddController(gid.gtk4.shortcut_controller.ShortcutController controller)
  {
    auto _klass = cast(GtkShortcutManagerInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.shortcut_manager.ShortcutManager._getGType);
    if (!_klass || !_klass.addController)
      return;

    _klass.addController(cast(GtkShortcutManager*)this._cPtr, controller ? cast(GtkShortcutController*)controller._cPtr(No.Dup) : null);
  }

  /**
      Remove a [gid.gtk4.shortcut_controller.ShortcutController] that had previously
        been added
  
      Params:
        controller = 
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveController`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRemoveController(gid.gtk4.shortcut_controller.ShortcutController controller)
  {
    auto _klass = cast(GtkShortcutManagerInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk4.shortcut_manager.ShortcutManager._getGType);
    if (!_klass || !_klass.removeController)
      return;

    _klass.removeController(cast(GtkShortcutManager*)this._cPtr, controller ? cast(GtkShortcutController*)controller._cPtr(No.Dup) : null);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk4.shortcut_manager.ShortcutManager (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk4_shortcut_manager_ShortcutManager(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddController", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveController", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk4.shortcut_manager.ShortcutManager vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk4_shortcut_manager_ShortcutManager(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddController", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_shortcut_manager_ShortcutManager(iface, "add_controller");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveController", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk4_shortcut_manager_ShortcutManager(iface, "remove_controller");
  }

  private static void _installIfaceVfunc_gid_gtk4_shortcut_manager_ShortcutManager(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkShortcutManagerInterface*)iface;

    switch (vfunc)
    {
      case "add_controller":
      {
        static extern(C) void _vfuncAddControllerTramp(GtkShortcutManager* self, GtkShortcutController* controller) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkShortcutManagerInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.shortcut_manager.ShortcutManager._getGType);
            if (_klass && _klass.addController)
              return (cast(typeof(&_vfuncAddControllerTramp))_klass.addController)(self, controller);
            return;
          }

          try
          {
            _obj.vfuncAddController(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.shortcut_controller.ShortcutController)(cast(void*)controller, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.shortcut_manager.ShortcutManager.vfuncAddController");
          }
        }

        _klass.addController = cast(typeof(_klass.addController))&_vfuncAddControllerTramp;
        break;
      }
      case "remove_controller":
      {
        static extern(C) void _vfuncRemoveControllerTramp(GtkShortcutManager* self, GtkShortcutController* controller) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)self);
          if (!_obj)
          {
            auto _klass = cast(GtkShortcutManagerInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)self), gid.gtk4.shortcut_manager.ShortcutManager._getGType);
            if (_klass && _klass.removeController)
              return (cast(typeof(&_vfuncRemoveControllerTramp))_klass.removeController)(self, controller);
            return;
          }

          try
          {
            _obj.vfuncRemoveController(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.shortcut_controller.ShortcutController)(cast(void*)controller, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk4.shortcut_manager.ShortcutManager.vfuncRemoveController");
          }
        }

        _klass.removeController = cast(typeof(_klass.removeController))&_vfuncRemoveControllerTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcut_manager.ShortcutManager]
template ShortcutManagerGidBuilderT()
{
}
