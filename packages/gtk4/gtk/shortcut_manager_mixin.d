/// Module for [ShortcutManager] interface mixin
module gtk.shortcut_manager_mixin;

public import gtk.shortcut_manager_iface_proxy;
public import gid.gid;
public import gobject.gid_builder;
public import gtk.c.functions;
public import gtk.c.types;
public import gtk.types;

/**
    The [gtk.shortcut_manager.ShortcutManager] interface is used to implement
    shortcut scopes.
    
    This is important for [gtk.native.Native] widgets that have their
    own surface, since the event controllers that are used to implement
    managed and global scopes are limited to the same native.
    
    Examples for widgets implementing [gtk.shortcut_manager.ShortcutManager] are
    [gtk.window.Window] and [gtk.popover.Popover].
    
    Every widget that implements [gtk.shortcut_manager.ShortcutManager] will be used as a
    [gtk.types.ShortcutScope.Managed].
*/
template ShortcutManagerT()
{
}

/// Fluent builder implementation template for [gtk.shortcut_manager.ShortcutManager]
template ShortcutManagerGidBuilderT()
{
}
