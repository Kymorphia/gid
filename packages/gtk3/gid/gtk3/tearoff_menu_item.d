/// Module for [TearoffMenuItem] class
module gid.gtk3.tearoff_menu_item;

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
    A #GtkTearoffMenuItem is a special #GtkMenuItem which is used to
    tear off and reattach its menu.
    
    When its menu is shown normally, the #GtkTearoffMenuItem is drawn as a
    dotted line indicating that the menu can be torn off.  Activating it
    causes its menu to be torn off and displayed in its own window
    as a tearoff menu.
    
    When its menu is shown as a tearoff menu, the #GtkTearoffMenuItem is drawn
    as a dotted line which has a left pointing arrow graphic indicating that
    the tearoff menu can be reattached.  Activating it will erase the tearoff
    menu window.
    
    > #GtkTearoffMenuItem is deprecated and should not be used in newly
    > written code. Menus are not meant to be torn around.
*/
@gidGir("TearoffMenuItem", "TearoffMenuItemClass")
class TearoffMenuItem : gid.gtk3.menu_item.MenuItem
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
    return cast(void function())gtk_tearoff_menu_item_get_type != &gidSymbolNotFound ? gtk_tearoff_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkTearoffMenuItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override TearoffMenuItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.tearoff_menu_item.TearoffMenuItem]
      Returns: New builder object
  */
  static TearoffMenuItemGidBuilder builder() nothrow
  {
    return new TearoffMenuItemGidBuilder;
  }

  /**
      Creates a new #GtkTearoffMenuItem.
      Returns: a new #GtkTearoffMenuItem.
  
      Deprecated: #GtkTearoffMenuItem is deprecated and should not be
            used in newly written code.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_tearoff_menu_item_new();
      this(_cretval, No.Take);
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.tearoff_menu_item.TearoffMenuItem]
class TearoffMenuItemGidBuilderImpl(T) : gid.gtk3.menu_item.MenuItemGidBuilderImpl!T
{

}

/// Fluent builder for [gid.gtk3.tearoff_menu_item.TearoffMenuItem]
final class TearoffMenuItemGidBuilder : TearoffMenuItemGidBuilderImpl!TearoffMenuItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TearoffMenuItem build() nothrow
  {
    return new TearoffMenuItem(cast(void*)createGObject(TearoffMenuItem._getGType), Yes.Take);
  }
}
