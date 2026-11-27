/// Module for [MenuBar] class
module gid.gtk3.menu_bar;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.menu_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.menu_shell;
import gid.gtk3.types;

/**
    The #GtkMenuBar is a subclass of #GtkMenuShell which contains one or
    more #GtkMenuItems. The result is a standard menu bar which can hold
    many menu items.
    
    # CSS nodes
    
    GtkMenuBar has a single CSS node with name menubar.
*/
@gidGir("MenuBar", "MenuBarClass")
class MenuBar : gid.gtk3.menu_shell.MenuShell
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
    return cast(void function())gtk_menu_bar_get_type != &gidSymbolNotFound ? gtk_menu_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_bar.MenuBar]
      Returns: New builder object
  */
  static MenuBarGidBuilder builder() nothrow
  {
    return new MenuBarGidBuilder;
  }

  /**
      Get `childPackDirection` property.
      Returns: The child pack direction of the menubar. It determines how
        the widgets contained in child menuitems are arranged.
  */
  @property gid.gtk3.types.PackDirection childPackDirection() nothrow
  {
    return getChildPackDirection();
  }

  /**
      Set `childPackDirection` property.
      Params:
        propval = The child pack direction of the menubar. It determines how
          the widgets contained in child menuitems are arranged.
  */
  @property void childPackDirection(gid.gtk3.types.PackDirection propval) nothrow
  {
    setChildPackDirection(propval);
  }

  /**
      Get `packDirection` property.
      Returns: The pack direction of the menubar. It determines how
        menuitems are arranged in the menubar.
  */
  @property gid.gtk3.types.PackDirection packDirection() nothrow
  {
    return getPackDirection();
  }

  /**
      Set `packDirection` property.
      Params:
        propval = The pack direction of the menubar. It determines how
          menuitems are arranged in the menubar.
  */
  @property void packDirection(gid.gtk3.types.PackDirection propval) nothrow
  {
    setPackDirection(propval);
  }

  /**
      Creates a new #GtkMenuBar
      Returns: the new menu bar, as a #GtkWidget
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
      _cretval = gtk_menu_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkMenuBar and populates it with menu items
      and submenus according to model.
      
      The created menu items are connected to actions found in the
      #GtkApplicationWindow to which the menu bar belongs - typically
      by means of being contained within the #GtkApplicationWindows
      widget hierarchy.
  
      Params:
        model = a #GMenuModel
      Returns: a new #GtkMenuBar
  */
  static gid.gtk3.menu_bar.MenuBar newFromModel(gid.gio2.menu_model.MenuModel model) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_bar_new_from_model(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu_bar.MenuBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Retrieves the current child pack direction of the menubar.
      See [gid.gtk3.menu_bar.MenuBar.setChildPackDirection].
      Returns: the child pack direction
  */
  gid.gtk3.types.PackDirection getChildPackDirection() nothrow
  {
    GtkPackDirection _cretval;
    _cretval = gtk_menu_bar_get_child_pack_direction(cast(GtkMenuBar*)this._cPtr);
    gid.gtk3.types.PackDirection _retval = cast(gid.gtk3.types.PackDirection)_cretval;
    return _retval;
  }

  /**
      Retrieves the current pack direction of the menubar.
      See [gid.gtk3.menu_bar.MenuBar.setPackDirection].
      Returns: the pack direction
  */
  gid.gtk3.types.PackDirection getPackDirection() nothrow
  {
    GtkPackDirection _cretval;
    _cretval = gtk_menu_bar_get_pack_direction(cast(GtkMenuBar*)this._cPtr);
    gid.gtk3.types.PackDirection _retval = cast(gid.gtk3.types.PackDirection)_cretval;
    return _retval;
  }

  /**
      Sets how widgets should be packed inside the children of a menubar.
  
      Params:
        childPackDir = a new #GtkPackDirection
  */
  void setChildPackDirection(gid.gtk3.types.PackDirection childPackDir) nothrow
  {
    gtk_menu_bar_set_child_pack_direction(cast(GtkMenuBar*)this._cPtr, childPackDir);
  }

  /**
      Sets how items should be packed inside a menubar.
  
      Params:
        packDir = a new #GtkPackDirection
  */
  void setPackDirection(gid.gtk3.types.PackDirection packDir) nothrow
  {
    gtk_menu_bar_set_pack_direction(cast(GtkMenuBar*)this._cPtr, packDir);
  }
}

/// Fluent builder implementation template for [gid.gtk3.menu_bar.MenuBar]
class MenuBarGidBuilderImpl(T) : gid.gtk3.menu_shell.MenuShellGidBuilderImpl!T
{


  /**
      Set `childPackDirection` property.
      Params:
        propval = The child pack direction of the menubar. It determines how
          the widgets contained in child menuitems are arranged.
      Returns: Builder instance for fluent chaining
  */
  T childPackDirection(gid.gtk3.types.PackDirection propval) nothrow
  {
    return setProperty("child-pack-direction", propval);
  }

  /**
      Set `packDirection` property.
      Params:
        propval = The pack direction of the menubar. It determines how
          menuitems are arranged in the menubar.
      Returns: Builder instance for fluent chaining
  */
  T packDirection(gid.gtk3.types.PackDirection propval) nothrow
  {
    return setProperty("pack-direction", propval);
  }
}

/// Fluent builder for [gid.gtk3.menu_bar.MenuBar]
final class MenuBarGidBuilder : MenuBarGidBuilderImpl!MenuBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuBar build() nothrow
  {
    return new MenuBar(cast(void*)createGObject(MenuBar._getGType), Yes.Take);
  }
}
