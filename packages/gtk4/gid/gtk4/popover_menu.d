/// Module for [PopoverMenu] class
module gid.gtk4.popover_menu;

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
import gid.gtk4.native;
import gid.gtk4.native_mixin;
import gid.gtk4.popover;
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A subclass of [gid.gtk4.popover.Popover] that implements menu behavior.
    
    <picture>
      <source srcset="menu-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkPopoverMenu" src="menu.png">
    </picture>
    
    [gid.gtk4.popover_menu.PopoverMenu] treats its children like menus and allows switching
    between them. It can open submenus as traditional, nested submenus,
    or in a more touch-friendly sliding fashion.
    The property [gid.gtk4.popover_menu.PopoverMenu.flags] controls this appearance.
    
    [gid.gtk4.popover_menu.PopoverMenu] is meant to be used primarily with menu models,
    using [gid.gtk4.popover_menu.PopoverMenu.newFromModel]. If you need to put
    other widgets such as a [gid.gtk4.spin_button.SpinButton] or a [gid.gtk4.switch_.Switch] into a popover,
    you can use [gid.gtk4.popover_menu.PopoverMenu.addChild].
    
    For more dialog-like behavior, use a plain [gid.gtk4.popover.Popover].
    
    ## Menu models
    
    The XML format understood by [gid.gtk4.builder.Builder] for [gid.gio2.menu_model.MenuModel] consists
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
    
    Attribute values can be translated using gettext, like other [gid.gtk4.builder.Builder]
    content. `<attribute>` elements can be marked for translation with a
    `translatable="yes"` attribute. It is also possible to specify message
    context and translator comments, using the context and comments attributes.
    To make use of this, the [gid.gtk4.builder.Builder] must have been given the gettext
    domain to use.
    
    The following attributes are used when constructing menu items:
    
    - "label": a user-visible string to display
    - "use-markup": whether the text in the menu item includes [Pango markup](https://docs.gtk.org/Pango/pango_markup.html)
    - "action": the prefixed name of the action to trigger
    - "target": the parameter to use when activating the action
    - "icon" and "verb-icon": names of icons that may be displayed
    - "submenu-action": name of an action that may be used to track
         whether a submenu is open
    - "hidden-when": a string used to determine when the item will be hidden.
         Possible values include "action-disabled", "action-missing", "macos-menubar".
         This is mainly useful for exported menus, see [gid.gtk4.application.Application.setMenubar].
    - "custom": a string used to match against the ID of a custom child added with
         [gid.gtk4.popover_menu.PopoverMenu.addChild], [gid.gtk4.popover_menu_bar.PopoverMenuBar.addChild],
         or in the ui file with `<child type="ID">`.
    
    The following attributes are used when constructing sections:
    
    - "label": a user-visible string to use as section heading
    - "display-hint": a string used to determine special formatting for the section.
        Possible values include "horizontal-buttons", "circular-buttons" and
        "inline-buttons". They all indicate that section should be
        displayed as a horizontal row of buttons.
    - "text-direction": a string used to determine the [gid.gtk4.types.TextDirection] to use
        when "display-hint" is set to "horizontal-buttons". Possible values
        include "rtl", "ltr", and "none".
    
    The following attributes are used when constructing submenus:
    
    - "label": a user-visible string to display
    - "icon": icon name to display
    - "gtk-macos-special": (macOS only, ignored by others) Add special meaning to a menu
        in the macOS menu bar. See [Using GTK on Apple macOS](osx.html).
    
    Menu items will also show accelerators, which are usually associated
    with actions via [gid.gtk4.application.Application.setAccelsForAction],
    [gid.gtk4.widget_class.WidgetClass.addBindingAction] or
    [gid.gtk4.shortcut_controller.ShortcutController.addShortcut].
    
    # Shortcuts and Gestures
    
    [gid.gtk4.popover_menu.PopoverMenu] supports the following keyboard shortcuts:
    
    - <kbd>Space</kbd> activates the default widget.
    
    # CSS Nodes
    
    [gid.gtk4.popover_menu.PopoverMenu] is just a subclass of [gid.gtk4.popover.Popover] that adds custom content
    to it, therefore it has the same CSS nodes. It is one of the cases that add
    a `.menu` style class to the main `popover` node.
    
    Menu items have nodes with name `button` and class `.model`. If a section
    display-hint is set, the section gets a node `box` with class `horizontal`
    plus a class with the same text as the display hint. Note that said box may
    not be the direct ancestor of the item `button`s. Thus, for example, to style
    items in an `inline-buttons` section, select `.inline-buttons button.model`.
    Other things that may be of interest to style in menus include `label` nodes.
    
    # Accessibility
    
    [gid.gtk4.popover_menu.PopoverMenu] uses the [gid.gtk4.types.AccessibleRole.Menu] role, and its
    items use the [gid.gtk4.types.AccessibleRole.MenuItem],
    [gid.gtk4.types.AccessibleRole.Checkbox] or [gid.gtk4.types.AccessibleRole.MenuItemRadio]
    roles, depending on the action they are connected to.
*/
@gidGir("PopoverMenu")
class PopoverMenu : gid.gtk4.popover.Popover
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_popover_menu_get_type != &gidSymbolNotFound ? gtk_popover_menu_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkPopoverMenu";
  }

  /** Returns `this`, for use in `with` statements. */
  override PopoverMenu self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.popover_menu.PopoverMenu]
      Returns: New builder object
  */
  static PopoverMenuGidBuilder builder() nothrow
  {
    return new PopoverMenuGidBuilder;
  }

  /**
      Get `flags` property.
      Returns: The flags that @popover uses to create/display a menu from its model.
        
        If a model is set and the flags change, contents are rebuilt, so if setting
        properties individually, set flags before model to avoid a redundant rebuild.
  */
  @property gid.gtk4.types.PopoverMenuFlags flags() nothrow
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
  @property void flags(gid.gtk4.types.PopoverMenuFlags propval) nothrow
  {
    setFlags(propval);
  }

  /**
      Get `menuModel` property.
      Returns: The model from which the menu is made.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The model from which the menu is made.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `visibleSubmenu` property.
      Returns: The name of the visible submenu.
  */
  @property string visibleSubmenu() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("visible-submenu");
  }

  /**
      Set `visibleSubmenu` property.
      Params:
        propval = The name of the visible submenu.
  */
  @property void visibleSubmenu(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("visible-submenu", propval);
  }

  /**
      Creates a [gid.gtk4.popover_menu.PopoverMenu] and populates it according to model.
      
      The created buttons are connected to actions found in the
      [gid.gtk4.application_window.ApplicationWindow] to which the popover belongs - typically
      by means of being attached to a widget that is contained within
      the [gid.gtk4.application_window.ApplicationWindow]s widget hierarchy.
      
      Actions can also be added using [gid.gtk4.widget.Widget.insertActionGroup]
      on the menus attach widget or on any of its parent widgets.
      
      This function creates menus with sliding submenus.
      See [gid.gtk4.popover_menu.PopoverMenu.newFromModelFull] for a way
      to control this.
  
      Params:
        model = a [gid.gio2.menu_model.MenuModel]
      Returns: the new [gid.gtk4.popover_menu.PopoverMenu]
  */
  static gid.gtk4.popover_menu.PopoverMenu newFromModel(gid.gio2.menu_model.MenuModel model = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_new_from_model(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.popover_menu.PopoverMenu)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a [gid.gtk4.popover_menu.PopoverMenu] and populates it according to model.
      
      The created buttons are connected to actions found in the
      action groups that are accessible from the parent widget.
      This includes the [gid.gtk4.application_window.ApplicationWindow] to which the popover
      belongs. Actions can also be added using [gid.gtk4.widget.Widget.insertActionGroup]
      on the parent widget or on any of its parent widgets.
  
      Params:
        model = a [gid.gio2.menu_model.MenuModel]
        flags = flags that affect how the menu is created
      Returns: the new [gid.gtk4.popover_menu.PopoverMenu]
  */
  static gid.gtk4.popover_menu.PopoverMenu newFromModelFull(gid.gio2.menu_model.MenuModel model, gid.gtk4.types.PopoverMenuFlags flags) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_popover_menu_new_from_model_full(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null, flags);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.popover_menu.PopoverMenu)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds a custom widget to a generated menu.
      
      For this to work, the menu model of popover must have
      an item with a `custom` attribute that matches id.
  
      Params:
        child = the [gid.gtk4.widget.Widget] to add
        id = the ID to insert child at
      Returns: true if id was found and the widget added
  */
  bool addChild(gid.gtk4.widget.Widget child, string id) nothrow
  {
    bool _retval;
    const(char)* _id = id.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_popover_menu_add_child(cast(GtkPopoverMenu*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, _id);
    return _retval;
  }

  /**
      Returns the flags that popover uses to create/display a menu from its model.
      Returns: the [gid.gtk4.types.PopoverMenuFlags]
  */
  gid.gtk4.types.PopoverMenuFlags getFlags() nothrow
  {
    GtkPopoverMenuFlags _cretval;
    _cretval = gtk_popover_menu_get_flags(cast(GtkPopoverMenu*)this._cPtr);
    gid.gtk4.types.PopoverMenuFlags _retval = cast(gid.gtk4.types.PopoverMenuFlags)_cretval;
    return _retval;
  }

  /**
      Returns the menu model used to populate the popover.
      Returns: the menu model of popover
  */
  gid.gio2.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_popover_menu_get_menu_model(cast(GtkPopoverMenu*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes a widget that has previously been added with
      [gid.gtk4.popover_menu.PopoverMenu.addChild]
  
      Params:
        child = the [gid.gtk4.widget.Widget] to remove
      Returns: true if the widget was removed
  */
  bool removeChild(gid.gtk4.widget.Widget child) nothrow
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
        flags = a set of [gid.gtk4.types.PopoverMenuFlags]
  */
  void setFlags(gid.gtk4.types.PopoverMenuFlags flags) nothrow
  {
    gtk_popover_menu_set_flags(cast(GtkPopoverMenu*)this._cPtr, flags);
  }

  /**
      Sets a new menu model on popover.
      
      The existing contents of popover are removed, and
      the popover is populated with new contents according
      to model.
  
      Params:
        model = a [gid.gio2.menu_model.MenuModel]
  */
  void setMenuModel(gid.gio2.menu_model.MenuModel model = null) nothrow
  {
    gtk_popover_menu_set_menu_model(cast(GtkPopoverMenu*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gtk4.popover_menu.PopoverMenu]
class PopoverMenuGidBuilderImpl(T) : gid.gtk4.popover.PopoverGidBuilderImpl!T
{


  /**
      Set `flags` property.
      Params:
        propval = The flags that @popover uses to create/display a menu from its model.
          
          If a model is set and the flags change, contents are rebuilt, so if setting
          properties individually, set flags before model to avoid a redundant rebuild.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.gtk4.types.PopoverMenuFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The model from which the menu is made.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `visibleSubmenu` property.
      Params:
        propval = The name of the visible submenu.
      Returns: Builder instance for fluent chaining
  */
  T visibleSubmenu(string propval) nothrow
  {
    return setProperty("visible-submenu", propval);
  }
}

/// Fluent builder for [gid.gtk4.popover_menu.PopoverMenu]
final class PopoverMenuGidBuilder : PopoverMenuGidBuilderImpl!PopoverMenuGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PopoverMenu build() nothrow
  {
    return new PopoverMenu(cast(void*)createGObject(PopoverMenu._getGType), Yes.Take);
  }
}
