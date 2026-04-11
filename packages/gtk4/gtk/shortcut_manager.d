/// Module for [ShortcutManager] interface
module gtk.shortcut_manager;

public import gtk.shortcut_manager_iface_proxy;
import gid.gid;
import gobject.gid_builder;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

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
interface ShortcutManager
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_manager_get_type != &gidSymbolNotFound ? gtk_shortcut_manager_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gtk.shortcut_manager.ShortcutManager]
interface ShortcutManagerGidBuilderImpl(T)
{
}
