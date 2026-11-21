/// Module for [ShortcutManager] interface
module gid.gtk4.shortcut_manager;

public import gid.core.basictypes;
public import gid.gtk4.shortcut_manager_iface_proxy;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;

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
interface ShortcutManager : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_shortcut_manager_get_type != &gidSymbolNotFound ? gtk_shortcut_manager_get_type() : cast(GType)0;
  }
}

/// Fluent builder implementation template for [gid.gtk4.shortcut_manager.ShortcutManager]
interface ShortcutManagerGidBuilderImpl(T)
{
}
