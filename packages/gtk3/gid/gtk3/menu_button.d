/// Module for [MenuButton] class
module gid.gtk3.menu_button;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gio2.menu_model;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.menu;
import gid.gtk3.popover;
import gid.gtk3.toggle_button;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkMenuButton widget is used to display a popup when clicked on.
    This popup can be provided either as a #GtkMenu, a #GtkPopover or an
    abstract #GMenuModel.
    
    The #GtkMenuButton widget can hold any valid child widget. That is, it
    can hold almost any other standard #GtkWidget. The most commonly used
    child is #GtkImage. If no widget is explicitely added to the #GtkMenuButton,
    a #GtkImage is automatically created, using an arrow image oriented
    according to #GtkMenuButton:direction or the generic “open-menu-symbolic”
    icon if the direction is not set.
    
    The positioning of the popup is determined by the #GtkMenuButton:direction
    property of the menu button.
    
    For menus, the #GtkWidget:halign and #GtkWidget:valign properties of the
    menu are also taken into account. For example, when the direction is
    [gid.gtk4.types.ArrowType.Down] and the horizontal alignment is [gid.gtk4.types.Align.Start], the
    menu will be positioned below the button, with the starting edge
    (depending on the text direction) of the menu aligned with the starting
    edge of the button. If there is not enough space below the button, the
    menu is popped up above the button instead. If the alignment would move
    part of the menu offscreen, it is “pushed in”.
    
    ## Direction = Down
    
    - halign = start
    
        ![](down-start.png)
    
    - halign = center
    
        ![](down-center.png)
    
    - halign = end
    
        ![](down-end.png)
    
    ## Direction = Up
    
    - halign = start
    
        ![](up-start.png)
    
    - halign = center
    
        ![](up-center.png)
    
    - halign = end
    
        ![](up-end.png)
    
    ## Direction = Left
    
    - valign = start
    
        ![](left-start.png)
    
    - valign = center
    
        ![](left-center.png)
    
    - valign = end
    
        ![](left-end.png)
    
    ## Direction = Right
    
    - valign = start
    
        ![](right-start.png)
    
    - valign = center
    
        ![](right-center.png)
    
    - valign = end
    
        ![](right-end.png)
    
    # CSS nodes
    
    GtkMenuButton has a single CSS node with name button. To differentiate
    it from a plain #GtkButton, it gets the .popup style class.
*/
class MenuButton : gid.gtk3.toggle_button.ToggleButton
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
    return cast(void function())gtk_menu_button_get_type != &gidSymbolNotFound ? gtk_menu_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuButton";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuButton self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_button.MenuButton]
      Returns: New builder object
  */
  static MenuButtonGidBuilder builder() nothrow
  {
    return new MenuButtonGidBuilder;
  }

  /**
      Get `alignWidget` property.
      Returns: The #GtkWidget to use to align the menu with.
  */
  @property gid.gtk3.container.Container alignWidget() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.container.Container)("align-widget");
  }

  /**
      Set `alignWidget` property.
      Params:
        propval = The #GtkWidget to use to align the menu with.
  */
  @property void alignWidget(gid.gtk3.container.Container propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.container.Container)("align-widget", propval);
  }

  /**
      Get `direction` property.
      Returns: The #GtkArrowType representing the direction in which the
        menu or popover will be popped out.
  */
  @property gid.gtk3.types.ArrowType direction() nothrow
  {
    return getDirection();
  }

  /**
      Set `direction` property.
      Params:
        propval = The #GtkArrowType representing the direction in which the
          menu or popover will be popped out.
  */
  @property void direction(gid.gtk3.types.ArrowType propval) nothrow
  {
    setDirection(propval);
  }

  /**
      Get `menuModel` property.
      Returns: The #GMenuModel from which the popup will be created.
        Depending on the #GtkMenuButton:use-popover property, that may
        be a menu or a popover.
        
        See [gid.gtk4.menu_button.MenuButton.setMenuModel] for the interaction with the
        #GtkMenuButton:popup property.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The #GMenuModel from which the popup will be created.
          Depending on the #GtkMenuButton:use-popover property, that may
          be a menu or a popover.
          
          See [gid.gtk4.menu_button.MenuButton.setMenuModel] for the interaction with the
          #GtkMenuButton:popup property.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `popover` property.
      Returns: The #GtkPopover that will be popped up when the button is clicked.
  */
  @property gid.gtk3.popover.Popover popover() nothrow
  {
    return getPopover();
  }

  /**
      Set `popover` property.
      Params:
        propval = The #GtkPopover that will be popped up when the button is clicked.
  */
  @property void popover(gid.gtk3.popover.Popover propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.popover.Popover)("popover", propval);
  }

  /**
      Get `popup` property.
      Returns: The #GtkMenu that will be popped up when the button is clicked.
  */
  @property gid.gtk3.menu.Menu popup() nothrow
  {
    return getPopup();
  }

  /**
      Set `popup` property.
      Params:
        propval = The #GtkMenu that will be popped up when the button is clicked.
  */
  @property void popup(gid.gtk3.menu.Menu propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.menu.Menu)("popup", propval);
  }

  /**
      Get `usePopover` property.
      Returns: Whether to construct a #GtkPopover from the menu model,
        or a #GtkMenu.
  */
  @property bool usePopover() nothrow
  {
    return getUsePopover();
  }

  /**
      Set `usePopover` property.
      Params:
        propval = Whether to construct a #GtkPopover from the menu model,
          or a #GtkMenu.
  */
  @property void usePopover(bool propval) nothrow
  {
    setUsePopover(propval);
  }

  /**
      Creates a new #GtkMenuButton widget with downwards-pointing
      arrow as the only child. You can replace the child widget
      with another #GtkWidget should you wish to.
      Returns: The newly created #GtkMenuButton widget
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_button_new();
    this(_cretval, No.Take);
  }

  /**
      Returns the parent #GtkWidget to use to line up with menu.
      Returns: a #GtkWidget value or null
  */
  gid.gtk3.widget.Widget getAlignWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_button_get_align_widget(cast(GtkMenuButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  alias getDirection = gid.gtk3.widget.Widget.getDirection;

  /**
      Returns the direction the popup will be pointing at when popped up.
      Returns: a #GtkArrowType value
  */
  gid.gtk3.types.ArrowType getDirection() nothrow
  {
    GtkArrowType _cretval;
    _cretval = gtk_menu_button_get_direction(cast(GtkMenuButton*)this._cPtr);
    gid.gtk3.types.ArrowType _retval = cast(gid.gtk3.types.ArrowType)_cretval;
    return _retval;
  }

  /**
      Returns the #GMenuModel used to generate the popup.
      Returns: a #GMenuModel or null
  */
  gid.gio2.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_menu_button_get_menu_model(cast(GtkMenuButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkPopover that pops out of the button.
      If the button is not using a #GtkPopover, this function
      returns null.
      Returns: a #GtkPopover or null
  */
  gid.gtk3.popover.Popover getPopover() nothrow
  {
    GtkPopover* _cretval;
    _cretval = gtk_menu_button_get_popover(cast(GtkMenuButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.popover.Popover)(cast(GtkPopover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the #GtkMenu that pops out of the button.
      If the button does not use a #GtkMenu, this function
      returns null.
      Returns: a #GtkMenu or null
  */
  gid.gtk3.menu.Menu getPopup() nothrow
  {
    GtkMenu* _cretval;
    _cretval = gtk_menu_button_get_popup(cast(GtkMenuButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu.Menu)(cast(GtkMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether a #GtkPopover or a #GtkMenu will be constructed
      from the menu model.
      Returns: true if using a #GtkPopover
  */
  bool getUsePopover() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_button_get_use_popover(cast(GtkMenuButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the #GtkWidget to use to line the menu with when popped up.
      Note that the align_widget must contain the #GtkMenuButton itself.
      
      Setting it to null means that the menu will be aligned with the
      button itself.
      
      Note that this property is only used with menus currently,
      and not for popovers.
  
      Params:
        alignWidget = a #GtkWidget
  */
  void setAlignWidget(gid.gtk3.widget.Widget alignWidget = null) nothrow
  {
    gtk_menu_button_set_align_widget(cast(GtkMenuButton*)this._cPtr, alignWidget ? cast(GtkWidget*)alignWidget._cPtr(No.Dup) : null);
  }

  alias setDirection = gid.gtk3.widget.Widget.setDirection;

  /**
      Sets the direction in which the popup will be popped up, as
      well as changing the arrow’s direction. The child will not
      be changed to an arrow if it was customized.
      
      If the does not fit in the available space in the given direction,
      GTK+ will its best to keep it inside the screen and fully visible.
      
      If you pass [gid.gtk4.types.ArrowType.None] for a direction, the popup will behave
      as if you passed [gid.gtk4.types.ArrowType.Down] (although you won’t see any arrows).
  
      Params:
        direction = a #GtkArrowType
  */
  void setDirection(gid.gtk3.types.ArrowType direction) nothrow
  {
    gtk_menu_button_set_direction(cast(GtkMenuButton*)this._cPtr, direction);
  }

  /**
      Sets the #GMenuModel from which the popup will be constructed,
      or null to dissociate any existing menu model and disable the button.
      
      Depending on the value of #GtkMenuButton:use-popover, either a
      #GtkMenu will be created with [gid.gtk3.menu.Menu.newFromModel], or a
      #GtkPopover with [gid.gtk3.popover.Popover.newFromModel]. In either case,
      actions will be connected as documented for these functions.
      
      If #GtkMenuButton:popup or #GtkMenuButton:popover are already set, those
      widgets are dissociated from the menu_button, and those properties are set
      to null.
  
      Params:
        menuModel = a #GMenuModel, or null to unset and disable the
            button
  */
  void setMenuModel(gid.gio2.menu_model.MenuModel menuModel = null) nothrow
  {
    gtk_menu_button_set_menu_model(cast(GtkMenuButton*)this._cPtr, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkPopover that will be popped up when the menu_button is clicked,
      or null to dissociate any existing popover and disable the button.
      
      If #GtkMenuButton:menu-model or #GtkMenuButton:popup are set, those objects
      are dissociated from the menu_button, and those properties are set to null.
  
      Params:
        popover = a #GtkPopover, or null to unset and disable the button
  */
  void setPopover(gid.gtk3.widget.Widget popover = null) nothrow
  {
    gtk_menu_button_set_popover(cast(GtkMenuButton*)this._cPtr, popover ? cast(GtkWidget*)popover._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkMenu that will be popped up when the menu_button is clicked, or
      null to dissociate any existing menu and disable the button.
      
      If #GtkMenuButton:menu-model or #GtkMenuButton:popover are set, those objects
      are dissociated from the menu_button, and those properties are set to null.
  
      Params:
        menu = a #GtkMenu, or null to unset and disable the button
  */
  void setPopup(gid.gtk3.widget.Widget menu = null) nothrow
  {
    gtk_menu_button_set_popup(cast(GtkMenuButton*)this._cPtr, menu ? cast(GtkWidget*)menu._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to construct a #GtkPopover instead of #GtkMenu
      when [gid.gtk4.menu_button.MenuButton.setMenuModel] is called. Note that
      this property is only consulted when a new menu model is set.
  
      Params:
        usePopover = true to construct a popover from the menu model
  */
  void setUsePopover(bool usePopover) nothrow
  {
    gtk_menu_button_set_use_popover(cast(GtkMenuButton*)this._cPtr, usePopover);
  }
}

/// Fluent builder implementation template for [gid.gtk3.menu_button.MenuButton]
class MenuButtonGidBuilderImpl(T) : gid.gtk3.toggle_button.ToggleButtonGidBuilderImpl!T
{


  /**
      Set `alignWidget` property.
      Params:
        propval = The #GtkWidget to use to align the menu with.
      Returns: Builder instance for fluent chaining
  */
  T alignWidget(gid.gtk3.container.Container propval) nothrow
  {
    return setProperty("align-widget", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = The #GtkArrowType representing the direction in which the
          menu or popover will be popped out.
      Returns: Builder instance for fluent chaining
  */
  T direction(gid.gtk3.types.ArrowType propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The #GMenuModel from which the popup will be created.
          Depending on the #GtkMenuButton:use-popover property, that may
          be a menu or a popover.
          
          See [gid.gtk4.menu_button.MenuButton.setMenuModel] for the interaction with the
          #GtkMenuButton:popup property.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `popover` property.
      Params:
        propval = The #GtkPopover that will be popped up when the button is clicked.
      Returns: Builder instance for fluent chaining
  */
  T popover(gid.gtk3.popover.Popover propval) nothrow
  {
    return setProperty("popover", propval);
  }

  /**
      Set `popup` property.
      Params:
        propval = The #GtkMenu that will be popped up when the button is clicked.
      Returns: Builder instance for fluent chaining
  */
  T popup(gid.gtk3.menu.Menu propval) nothrow
  {
    return setProperty("popup", propval);
  }

  /**
      Set `usePopover` property.
      Params:
        propval = Whether to construct a #GtkPopover from the menu model,
          or a #GtkMenu.
      Returns: Builder instance for fluent chaining
  */
  T usePopover(bool propval) nothrow
  {
    return setProperty("use-popover", propval);
  }
}

/// Fluent builder for [gid.gtk3.menu_button.MenuButton]
final class MenuButtonGidBuilder : MenuButtonGidBuilderImpl!MenuButtonGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuButton build() nothrow
  {
    return new MenuButton(cast(void*)createGObject(MenuButton._getGType), Yes.Take);
  }
}
