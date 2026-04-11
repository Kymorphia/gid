/// Module for [SeparatorMenuItem] class
module gtk.separator_menu_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.gid_builder;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu_item;
import gtk.types;

/**
    The #GtkSeparatorMenuItem is a separator used to group
    items within a menu. It displays a horizontal line with a shadow to
    make it appear sunken into the interface.
    
    # CSS nodes
    
    GtkSeparatorMenuItem has a single CSS node with name separator.
*/
class SeparatorMenuItem : gtk.menu_item.MenuItem
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_menu_item_get_type != &gidSymbolNotFound ? gtk_separator_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SeparatorMenuItem self()
  {
    return this;
  }

  /**
      Get builder for [gtk.separator_menu_item.SeparatorMenuItem]
      Returns: New builder object
  */
  static SeparatorMenuItemGidBuilder builder()
  {
    return new SeparatorMenuItemGidBuilder;
  }

  /**
      Creates a new #GtkSeparatorMenuItem.
      Returns: a new #GtkSeparatorMenuItem.
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_separator_menu_item_new();
    this(_cretval, No.Take);
  }
}

/// Fluent builder implementation template for [gtk.separator_menu_item.SeparatorMenuItem]
class SeparatorMenuItemGidBuilderImpl(T) : gtk.menu_item.MenuItemGidBuilderImpl!T
{

}

/// Fluent builder for [gtk.separator_menu_item.SeparatorMenuItem]
final class SeparatorMenuItemGidBuilder : SeparatorMenuItemGidBuilderImpl!SeparatorMenuItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SeparatorMenuItem build()
  {
    return new SeparatorMenuItem(cast(void*)createGObject(SeparatorMenuItem._getGType), No.Take);
  }
}
