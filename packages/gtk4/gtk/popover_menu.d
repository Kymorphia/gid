/// Module for [PopoverMenu] class
module gtk.popover_menu;

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
import gtk.native;
import gtk.native_mixin;
import gtk.popover;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.types;
import gtk.widget;

/**
    [gtk.popover_menu.PopoverMenu] is a subclass of [gtk.popover.Popover] that implements menu
    behavior.
    
    ![An example GtkPopoverMenu](menu.png)
    
    [gtk.popover_menu.PopoverMenu] treats its children like menus and allows switching
    between them. It can open submenus as traditional, nested submenus,
    or in a more touch-friendly sliding fashion.
    The property [gtk.popover_menu.PopoverMenu.flags] controls this appearance.
    
    [gtk.popover_menu.PopoverMenu] is meant to be used primarily with menu models,
    using [gtk.popover_menu.PopoverMenu.newFromModel]. If you need to put
    other widgets such as a [gtk.spin_button.SpinButton] or a [gtk.switch_.Switch] into a popover,
    you can use [gtk.popover_menu.PopoverMenu.addChild].
    
    For more dialog-like behavior, use a plain [gtk.popover.Popover].
    
    ## Menu models
    
    The XML format understood by [gtk.builder.Builder] for [gio.menu_model.MenuModel] consists
    of a toplevel `<menu>` element, which contains one or more `<item>`
    elements. Each `<item>` element contains `<attribute>` and `<link>`
    elements with a mandatory name attribute. `<link>` elements have the
    same content model as `<menu>`. Instead of `<link name="submenu">`
    or `<link name="section">`, you can use `<submenu>` or `<section>`
    elements.
    
    ```xml
    <menu id='app-menu'>
      <section>
        <item>
          <attribute name='label' translatable='yes'>_New Window</attribute>
          <attribute name='action'>app.new</attribute>
        </item>
        <item>
          <attribute name='label' translatable='yes'>_About Sunny</attribute>
          <attribute name='action'>app.about</attribute>
        </item>
        <item>
          <attribute name='label' translatable='yes'>_Quit</attribute>
          <attribute name='action'>app.quit</attribute>
        </item>
      </section>
    </menu>
    ```
    
    Attribute values can be translated using gettext, like other [gtk.builder.Builder]
    content. `<attribute>` elements can be marked for translation with a
    `translatable="yes"` attribute. It is also possible to specify message
    context and translator comments, using the context and comments attributes.
    To make use of this, the [gtk.builder.Builder] must have been given the gettext
    domain to use.
    
    The following attributes are used when constructing menu items:
    
    $(LIST
      * "label": a user-visible string to display
      * "use-markup": whether the text in the menu item includes [Pango markup](https://docs.gtk.org/Pango/pango_markup.html)
      * "action": the prefixed name of the action to trigger
      * "target": the parameter to use when activating the action
      * "icon" and "verb-icon": names of icons that may be displayed
      * "submenu-action": name of an action that may be used to track
           whether a submenu is open
      * "hidden-when": a string used to determine when the item will be hidden.
           Possible values include "action-disabled", "action-missing", "macos-menubar".
           This is mainly useful for exported menus, see [gtk.application.Application.setMenubar].
      * "custom": a string used to match against the ID of a custom child added with
           [gtk.popover_menu.PopoverMenu.addChild], [gtk.popover_menu_bar.PopoverMenuBar.addChild],
           or in the ui file with `<child type="ID">`.
    )
      
    The following attributes are used when constructing sections:
    
    $(LIST
      * "label": a user-visible string to use as section heading
      * "display-hint": a string used to determine special formatting for the section.
          Possible values include "horizontal-buttons", "circular-buttons" and
          "inline-buttons". They all indicate that section should be
          displayed as a horizontal row of buttons.
      * "text-direction": a string used to determine the [gtk.types.TextDirection] to use
          when "display-hint" is set to "horizontal-buttons". Possible values
          include "rtl", "ltr", and "none".
    )
      
    The following attributes are used when constructing submenus:
    
    $(LIST
      * "label": a user-visible string to display
      * "icon": icon name to display
    )
      
    Menu items will also show accelerators, which are usually associated
    with actions via [gtk.application.Application.setAccelsForAction],
    [gtk.widget_class.WidgetClass.addBindingAction] or
    [gtk.shortcut_controller.ShortcutController.addShortcut].
    
    # CSS Nodes
    
    [gtk.popover_menu.PopoverMenu] is just a subclass of [gtk.popover.Popover] that adds custom content
    to it, therefore it has the same CSS nodes. It is one of the cases that add
    a `.menu` style class to the main `popover` node.
    
    Menu items have nodes with name `button` and class `.model`. If a section
    display-hint is set, the section gets a node `box` with class `horizontal`
    plus a class with the same text as the display hint. Note that said box may
    not be the direct ancestor of the item `button`s. Thus, for example, to style
    items in an `inline-buttons` section, select `.inline-buttons button.model`.
    Other things that may be of interest to style in menus include `label` nodes.
    
    # Accessibility
    
    [gtk.popover_menu.PopoverMenu] uses the [gtk.types.AccessibleRole.Menu] role, and its
    items use the [gtk.types.AccessibleRole.MenuItem],
    [gtk.types.AccessibleRole.MenuItemCheckbox] or
    [gtk.types.AccessibleRole.MenuItemRadio] roles, depending on the
    action they are connected to.
*/
class PopoverMenu : gtk.popover.Popover
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
    return cast(void function())gtk_popover_menu_get_type != &gidSymbolNotFound ? gtk_popover_menu_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverMenu self()
  {
    return this;
  }

  /**
      Get `flags` property.
      Returns: The flags that @popover uses to create/display a menu from its model.
        
        If a model is set and the flags change, contents are rebuilt, so if setting
        properties individually, set flags before model to avoid a redundant rebuild.
  */
  @property gtk.types.PopoverMenuFlags flags()
  {
    return getFlags();
  }

  /**
      Set `flags` property.
      Params:
        propval = The flags that @popover uses to create/display a menu from its model.
          
          If a model is set and the flags change, contents are rebuilt, so if setting
          properties individually, set flags before model to avoid a redundant rebuild.
  */
  @property void flags(gtk.types.PopoverMenuFlags propval)
  {
    return setFlags(propval);
  }

  /**
      Get `menuModel` property.
      Returns: The model from which the menu is made.
  */
  @property gio.menu_model.MenuModel menuModel()
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The model from which the menu is made.
  */
  @property void menuModel(gio.menu_model.MenuModel propval)
  {
    return setMenuModel(propval);
  }

  /**
      Get `visibleSubmenu` property.
      Returns: The name of the visible submenu.
  */
  @property string visibleSubmenu()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("visible-submenu");
  }

  /**
      Set `visibleSubmenu` property.
      Params:
        propval = The name of the visible submenu.
  */
  @property void visibleSubmenu(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("visible-submenu", propval);
  }

  /**
      Creates a [gtk.popover_menu.PopoverMenu] and populates it according to model.
      
      The created buttons are connected to actions found in the
      [gtk.application_window.ApplicationWindow] to which the popover belongs - typically
      by means of being attached to a widget that is contained within
      the [gtk.application_window.ApplicationWindow]s widget hierarchy.
      
      Actions can also be added using [gtk.widget.Widget.insertActionGroup]
      on the menus attach widget or on any of its parent widgets.
      
      This function creates menus with sliding submenus.
      See [gtk.popover_menu.PopoverMenu.newFromModelFull] for a way
      to control this.
  
      Params:
        model = a [gio.menu_model.MenuModel]
      Returns: the new [gtk.popover_menu.PopoverMenu]
  */
  static gtk.popover_menu.PopoverMenu newFromModel(gio.menu_model.MenuModel model = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_new_from_model(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover_menu.PopoverMenu)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gtk.popover_menu.PopoverMenu] and populates it according to model.
      
      The created buttons are connected to actions found in the
      action groups that are accessible from the parent widget.
      This includes the [gtk.application_window.ApplicationWindow] to which the popover
      belongs. Actions can also be added using [gtk.widget.Widget.insertActionGroup]
      on the parent widget or on any of its parent widgets.
  
      Params:
        model = a [gio.menu_model.MenuModel]
        flags = flags that affect how the menu is created
      Returns: the new [gtk.popover_menu.PopoverMenu]
  */
  static gtk.popover_menu.PopoverMenu newFromModelFull(gio.menu_model.MenuModel model, gtk.types.PopoverMenuFlags flags)
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_new_from_model_full(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null, flags);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover_menu.PopoverMenu)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a custom widget to a generated menu.
      
      For this to work, the menu model of popover must have
      an item with a `custom` attribute that matches id.
  
      Params:
        child = the [gtk.widget.Widget] to add
        id = the ID to insert child at
      Returns: true if id was found and the widget added
  */
  bool addChild(gtk.widget.Widget child, string id)
  {
    bool _retval;
    const(char)* _id = id.toCString(No.Alloc);
    _retval = cast(bool)gtk_popover_menu_add_child(cast(GtkPopoverMenu*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _id);
    return _retval;
  }

  /**
      Returns the flags that popover uses to create/display a menu from its model.
      Returns: the [gtk.types.PopoverMenuFlags]
  */
  gtk.types.PopoverMenuFlags getFlags()
  {
    GtkPopoverMenuFlags _cretval;
    _cretval = gtk_popover_menu_get_flags(cast(GtkPopoverMenu*)this._cPtr);
    gtk.types.PopoverMenuFlags _retval = cast(gtk.types.PopoverMenuFlags)_cretval;
    return _retval;
  }

  /**
      Returns the menu model used to populate the popover.
      Returns: the menu model of popover
  */
  gio.menu_model.MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = gtk_popover_menu_get_menu_model(cast(GtkPopoverMenu*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a widget that has previously been added with
      [gtk.popover_menu.PopoverMenu.addChild]
  
      Params:
        child = the [gtk.widget.Widget] to remove
      Returns: true if the widget was removed
  */
  bool removeChild(gtk.widget.Widget child)
  {
    bool _retval;
    _retval = cast(bool)gtk_popover_menu_remove_child(cast(GtkPopoverMenu*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Sets the flags that popover uses to create/display a menu from its model.
      
      If a model is set and the flags change, contents are rebuilt, so if setting
      properties individually, set flags before model to avoid a redundant rebuild.
  
      Params:
        flags = a set of [gtk.types.PopoverMenuFlags]
  */
  void setFlags(gtk.types.PopoverMenuFlags flags)
  {
    gtk_popover_menu_set_flags(cast(GtkPopoverMenu*)this._cPtr, flags);
  }

  /**
      Sets a new menu model on popover.
      
      The existing contents of popover are removed, and
      the popover is populated with new contents according
      to model.
  
      Params:
        model = a [gio.menu_model.MenuModel]
  */
  void setMenuModel(gio.menu_model.MenuModel model = null)
  {
    gtk_popover_menu_set_menu_model(cast(GtkPopoverMenu*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }
}
