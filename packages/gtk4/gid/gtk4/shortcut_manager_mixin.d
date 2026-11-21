/// Module for [ShortcutManager] interface mixin
module gid.gtk4.shortcut_manager_mixin;

public import gid.core.basictypes;
public import gid.gtk4.shortcut_manager_iface_proxy;
public import gid.core.gid;
public import gid.gobject2.gid_builder;
public import gid.gtk4.c.functions;
public import gid.gtk4.c.types;
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
}

/// Fluent builder implementation template for [gid.gtk4.shortcut_manager.ShortcutManager]
template ShortcutManagerGidBuilderT()
{
}
