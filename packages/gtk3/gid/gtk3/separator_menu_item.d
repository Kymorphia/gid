/// Module for [SeparatorMenuItem] class
module gid.gtk3.separator_menu_item;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.menu_item;
import gid.gtk3.types;

/**
    The #GtkSeparatorMenuItem is a separator used to group
    items within a menu. It displays a horizontal line with a shadow to
    make it appear sunken into the interface.
    
    # CSS nodes
    
    GtkSeparatorMenuItem has a single CSS node with name separator.
*/
class SeparatorMenuItem : gid.gtk3.menu_item.MenuItem
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_menu_item_get_type != &gidSymbolNotFound ? gtk_separator_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSeparatorMenuItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override SeparatorMenuItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.separator_menu_item.SeparatorMenuItem]
      Returns: New builder object
  */
  static SeparatorMenuItemGidBuilder builder() nothrow
  {
    return new SeparatorMenuItemGidBuilder;
  }

  /**
      Creates a new #GtkSeparatorMenuItem.
      Returns: a new #GtkSeparatorMenuItem.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_separator_menu_item_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.separator_menu_item.SeparatorMenuItem]
class SeparatorMenuItemGidBuilderImpl(T) : gid.gtk3.menu_item.MenuItemGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.separator_menu_item.SeparatorMenuItem]
final class SeparatorMenuItemGidBuilder : SeparatorMenuItemGidBuilderImpl!SeparatorMenuItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SeparatorMenuItem build() nothrow
  {
    return new SeparatorMenuItem(cast(void*)createGObject(SeparatorMenuItem._getGType), Yes.Take);
  }
}
