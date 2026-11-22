/// Module for [PopoverMenuBar] class
module gid.gtk4.popover_menu_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.menu_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Presents a horizontal bar of items that pop up menus when clicked.
    
    <picture>
      <source srcset="menubar-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkPopoverMenuBar" src="menubar.png">
    </picture>
    
    The only way to create instances of [gid.gtk4.popover_menu_bar.PopoverMenuBar] is
    from a [gid.gio2.menu_model.MenuModel].
    
    # CSS nodes
    
    ```
    menubar
    ├── item[.active]
    ┊   ╰── popover
    ╰── item
        ╰── popover
    ```
    
    [gid.gtk4.popover_menu_bar.PopoverMenuBar] has a single CSS node with name menubar, below which
    each item has its CSS node, and below that the corresponding popover.
    
    The item whose popover is currently open gets the .active
    style class.
    
    # Accessibility
    
    [gid.gtk4.popover_menu_bar.PopoverMenuBar] uses the [gid.gtk4.types.AccessibleRole.MenuBar] role,
    the menu items use the [gid.gtk4.types.AccessibleRole.MenuItem] role and
    the menus use the [gid.gtk4.types.AccessibleRole.Menu] role.
*/
class PopoverMenuBar : gid.gtk4.widget.Widget
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
    return cast(void function())gtk_popover_menu_bar_get_type != &gidSymbolNotFound ? gtk_popover_menu_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPopoverMenuBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverMenuBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.popover_menu_bar.PopoverMenuBar]
      Returns: New builder object
  */
  static PopoverMenuBarGidBuilder builder() nothrow
  {
    return new PopoverMenuBarGidBuilder;
  }

  /**
      Get `menuModel` property.
      Returns: The [gid.gio2.menu_model.MenuModel] from which the menu bar is created.
        
        The model should only contain submenus as toplevel elements.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gid.gio2.menu_model.MenuModel] from which the menu bar is created.
          
          The model should only contain submenus as toplevel elements.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Creates a [gid.gtk4.popover_menu_bar.PopoverMenuBar] from a [gid.gio2.menu_model.MenuModel].
  
      Params:
        model = a [gid.gio2.menu_model.MenuModel]
      Returns: a new [gid.gtk4.popover_menu_bar.PopoverMenuBar]
  */
  static gid.gtk4.popover_menu_bar.PopoverMenuBar newFromModel(gid.gio2.menu_model.MenuModel model = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_bar_new_from_model(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.popover_menu_bar.PopoverMenuBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a custom widget to a generated menubar.
      
      For this to work, the menu model of bar must have an
      item with a `custom` attribute that matches id.
  
      Params:
        child = the [gid.gtk4.widget.Widget] to add
        id = the ID to insert child at
      Returns: true if id was found and the widget added
  */
  bool addChild(gid.gtk4.widget.Widget child, string id) nothrow
  {
    bool _retval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_popover_menu_bar_add_child(cast(GtkPopoverMenuBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _id);
    return _retval;
  }

  /**
      Returns the model from which the contents of bar are taken.
      Returns: a [gid.gio2.menu_model.MenuModel]
  */
  gid.gio2.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_popover_menu_bar_get_menu_model(cast(GtkPopoverMenuBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a widget that has previously been added with
      [gid.gtk4.popover_menu_bar.PopoverMenuBar.addChild].
  
      Params:
        child = the [gid.gtk4.widget.Widget] to remove
      Returns: true if the widget was removed
  */
  bool removeChild(gid.gtk4.widget.Widget child) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_menu_bar_remove_child(cast(GtkPopoverMenuBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets a menu model from which bar should take
      its contents.
  
      Params:
        model = a [gid.gio2.menu_model.MenuModel]
  */
  void setMenuModel(gid.gio2.menu_model.MenuModel model = null) nothrow
  {
    gtk_popover_menu_bar_set_menu_model(cast(GtkPopoverMenuBar*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.popover_menu_bar.PopoverMenuBar]
class PopoverMenuBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `menuModel` property.
      Params:
        propval = The [gid.gio2.menu_model.MenuModel] from which the menu bar is created.
          
          The model should only contain submenus as toplevel elements.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }
}

/// Fluent builder for [gid.gtk4.popover_menu_bar.PopoverMenuBar]
final class PopoverMenuBarGidBuilder : PopoverMenuBarGidBuilderImpl!PopoverMenuBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PopoverMenuBar build() nothrow
  {
    return new PopoverMenuBar(cast(void*)createGObject(PopoverMenuBar._getGType), Yes.Take);
  }
}
