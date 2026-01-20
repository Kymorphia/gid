/// Module for [PopoverMenuBar] class
module gtk.popover_menu_bar;

import gid.gid;
import gio.menu_model;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.popover_menu_bar.PopoverMenuBar] presents a horizontal bar of items that pop
    up popover menus when clicked.
    
    ![An example GtkPopoverMenuBar](menubar.png)
    
    The only way to create instances of [gtk.popover_menu_bar.PopoverMenuBar] is
    from a [gio.menu_model.MenuModel].
    
    # CSS nodes
    
    ```
    menubar
    ├── item[.active]
    ┊   ╰── popover
    ╰── item
        ╰── popover
    ```
    
    [gtk.popover_menu_bar.PopoverMenuBar] has a single CSS node with name menubar, below which
    each item has its CSS node, and below that the corresponding popover.
    
    The item whose popover is currently open gets the .active
    style class.
    
    # Accessibility
    
    [gtk.popover_menu_bar.PopoverMenuBar] uses the [gtk.types.AccessibleRole.MenuBar] role,
    the menu items use the [gtk.types.AccessibleRole.MenuItem] role and
    the menus use the [gtk.types.AccessibleRole.Menu] role.
*/
class PopoverMenuBar : gtk.widget.Widget
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
    return cast(void function())gtk_popover_menu_bar_get_type != &gidSymbolNotFound ? gtk_popover_menu_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverMenuBar self()
  {
    return this;
  }

  /**
      Get `menuModel` property.
      Returns: The [gio.menu_model.MenuModel] from which the menu bar is created.
        
        The model should only contain submenus as toplevel elements.
  */
  @property gio.menu_model.MenuModel menuModel()
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gio.menu_model.MenuModel] from which the menu bar is created.
          
          The model should only contain submenus as toplevel elements.
  */
  @property void menuModel(gio.menu_model.MenuModel propval)
  {
    return setMenuModel(propval);
  }

  /**
      Creates a [gtk.popover_menu_bar.PopoverMenuBar] from a [gio.menu_model.MenuModel].
  
      Params:
        model = a [gio.menu_model.MenuModel]
      Returns: a new [gtk.popover_menu_bar.PopoverMenuBar]
  */
  static gtk.popover_menu_bar.PopoverMenuBar newFromModel(gio.menu_model.MenuModel model = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_bar_new_from_model(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover_menu_bar.PopoverMenuBar)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a custom widget to a generated menubar.
      
      For this to work, the menu model of bar must have an
      item with a `custom` attribute that matches id.
  
      Params:
        child = the [gtk.widget.Widget] to add
        id = the ID to insert child at
      Returns: true if id was found and the widget added
  */
  bool addChild(gtk.widget.Widget child, string id)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    _retval = cast(bool)gtk_popover_menu_bar_add_child(cast(GtkPopoverMenuBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _id);
    return _retval;
  }

  /**
      Returns the model from which the contents of bar are taken.
      Returns: a [gio.menu_model.MenuModel]
  */
  gio.menu_model.MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = gtk_popover_menu_bar_get_menu_model(cast(GtkPopoverMenuBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a widget that has previously been added with
      [gtk.popover_menu_bar.PopoverMenuBar.addChild].
  
      Params:
        child = the [gtk.widget.Widget] to remove
      Returns: true if the widget was removed
  */
  bool removeChild(gtk.widget.Widget child)
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_menu_bar_remove_child(cast(GtkPopoverMenuBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets a menu model from which bar should take
      its contents.
  
      Params:
        model = a [gio.menu_model.MenuModel]
  */
  void setMenuModel(gio.menu_model.MenuModel model = null)
  {
    gtk_popover_menu_bar_set_menu_model(cast(GtkPopoverMenuBar*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }
}
