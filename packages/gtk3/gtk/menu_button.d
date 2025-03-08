module gtk.menu_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gio.menu_model;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.popover;
import gtk.toggle_button;
import gtk.types;
import gtk.widget;

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
  [gtk.types.ArrowType.down] and the horizontal alignment is [gtk.types.Align.start], the
  menu will be positioned below the button, with the starting edge
  (depending on the text direction) of the menu aligned with the starting
  edge of the button. If there is not enough space below the button, the
  menu is popped up above the button instead. If the alignment would move
  part of the menu offscreen, it is “pushed in”.
  
  ## Direction = Down
  
  $(LIST
    * halign = start
    
        ![](down-start.png)
    
    * halign = center
    
        ![](down-center.png)
    
    * halign = end
    
        ![](down-end.png)
  )
    
  ## Direction = Up
  
  $(LIST
    * halign = start
    
        ![](up-start.png)
    
    * halign = center
    
        ![](up-center.png)
    
    * halign = end
    
        ![](up-end.png)
  )
    
  ## Direction = Left
  
  $(LIST
    * valign = start
    
        ![](left-start.png)
    
    * valign = center
    
        ![](left-center.png)
    
    * valign = end
    
        ![](left-end.png)
  )
    
  ## Direction = Right
  
  $(LIST
    * valign = start
    
        ![](right-start.png)
    
    * valign = center
    
        ![](right-center.png)
    
    * valign = end
    
        ![](right-end.png)
  )
    
  # CSS nodes
  
  GtkMenuButton has a single CSS node with name button. To differentiate
  it from a plain #GtkButton, it gets the .popup style class.
*/
class MenuButton : gtk.toggle_button.ToggleButton
{

  this(void* ptr, Flag!"take" take = No.take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_menu_button_get_type != &gidSymbolNotFound ? gtk_menu_button_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new #GtkMenuButton widget with downwards-pointing
    arrow as the only child. You can replace the child widget
    with another #GtkWidget should you wish to.
    Returns:     The newly created #GtkMenuButton widget
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_button_new();
    this(_cretval, No.take);
  }

  /**
      Returns the parent #GtkWidget to use to line up with menu.
    Returns:     a #GtkWidget value or null
  */
  gtk.widget.Widget getAlignWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_button_get_align_widget(cast(GtkMenuButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.take);
    return _retval;
  }

  alias getDirection = gtk.widget.Widget.getDirection;

  /**
      Returns the direction the popup will be pointing at when popped up.
    Returns:     a #GtkArrowType value
  */
  gtk.types.ArrowType getDirection()
  {
    GtkArrowType _cretval;
    _cretval = gtk_menu_button_get_direction(cast(GtkMenuButton*)cPtr);
    gtk.types.ArrowType _retval = cast(gtk.types.ArrowType)_cretval;
    return _retval;
  }

  /**
      Returns the #GMenuModel used to generate the popup.
    Returns:     a #GMenuModel or null
  */
  gio.menu_model.MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = gtk_menu_button_get_menu_model(cast(GtkMenuButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the #GtkPopover that pops out of the button.
    If the button is not using a #GtkPopover, this function
    returns null.
    Returns:     a #GtkPopover or null
  */
  gtk.popover.Popover getPopover()
  {
    GtkPopover* _cretval;
    _cretval = gtk_menu_button_get_popover(cast(GtkMenuButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.popover.Popover)(cast(GtkPopover*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns the #GtkMenu that pops out of the button.
    If the button does not use a #GtkMenu, this function
    returns null.
    Returns:     a #GtkMenu or null
  */
  gtk.menu.Menu getPopup()
  {
    GtkMenu* _cretval;
    _cretval = gtk_menu_button_get_popup(cast(GtkMenuButton*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.menu.Menu)(cast(GtkMenu*)_cretval, No.take);
    return _retval;
  }

  /**
      Returns whether a #GtkPopover or a #GtkMenu will be constructed
    from the menu model.
    Returns:     true if using a #GtkPopover
  */
  bool getUsePopover()
  {
    bool _retval;
    _retval = gtk_menu_button_get_use_popover(cast(GtkMenuButton*)cPtr);
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
      alignWidget =       a #GtkWidget
  */
  void setAlignWidget(gtk.widget.Widget alignWidget = null)
  {
    gtk_menu_button_set_align_widget(cast(GtkMenuButton*)cPtr, alignWidget ? cast(GtkWidget*)alignWidget.cPtr(No.dup) : null);
  }

  alias setDirection = gtk.widget.Widget.setDirection;

  /**
      Sets the direction in which the popup will be popped up, as
    well as changing the arrow’s direction. The child will not
    be changed to an arrow if it was customized.
    
    If the does not fit in the available space in the given direction,
    GTK+ will its best to keep it inside the screen and fully visible.
    
    If you pass [gtk.types.ArrowType.none] for a direction, the popup will behave
    as if you passed [gtk.types.ArrowType.down] (although you won’t see any arrows).
    Params:
      direction =       a #GtkArrowType
  */
  void setDirection(gtk.types.ArrowType direction)
  {
    gtk_menu_button_set_direction(cast(GtkMenuButton*)cPtr, direction);
  }

  /**
      Sets the #GMenuModel from which the popup will be constructed,
    or null to dissociate any existing menu model and disable the button.
    
    Depending on the value of #GtkMenuButton:use-popover, either a
    #GtkMenu will be created with [gtk.menu.Menu.newFromModel], or a
    #GtkPopover with [gtk.popover.Popover.newFromModel]. In either case,
    actions will be connected as documented for these functions.
    
    If #GtkMenuButton:popup or #GtkMenuButton:popover are already set, those
    widgets are dissociated from the menu_button, and those properties are set
    to null.
    Params:
      menuModel =       a #GMenuModel, or null to unset and disable the
          button
  */
  void setMenuModel(gio.menu_model.MenuModel menuModel = null)
  {
    gtk_menu_button_set_menu_model(cast(GtkMenuButton*)cPtr, menuModel ? cast(GMenuModel*)menuModel.cPtr(No.dup) : null);
  }

  /**
      Sets the #GtkPopover that will be popped up when the menu_button is clicked,
    or null to dissociate any existing popover and disable the button.
    
    If #GtkMenuButton:menu-model or #GtkMenuButton:popup are set, those objects
    are dissociated from the menu_button, and those properties are set to null.
    Params:
      popover =       a #GtkPopover, or null to unset and disable the button
  */
  void setPopover(gtk.widget.Widget popover = null)
  {
    gtk_menu_button_set_popover(cast(GtkMenuButton*)cPtr, popover ? cast(GtkWidget*)popover.cPtr(No.dup) : null);
  }

  /**
      Sets the #GtkMenu that will be popped up when the menu_button is clicked, or
    null to dissociate any existing menu and disable the button.
    
    If #GtkMenuButton:menu-model or #GtkMenuButton:popover are set, those objects
    are dissociated from the menu_button, and those properties are set to null.
    Params:
      menu =       a #GtkMenu, or null to unset and disable the button
  */
  void setPopup(gtk.widget.Widget menu = null)
  {
    gtk_menu_button_set_popup(cast(GtkMenuButton*)cPtr, menu ? cast(GtkWidget*)menu.cPtr(No.dup) : null);
  }

  /**
      Sets whether to construct a #GtkPopover instead of #GtkMenu
    when [gtk.menu_button.MenuButton.setMenuModel] is called. Note that
    this property is only consulted when a new menu model is set.
    Params:
      usePopover =       true to construct a popover from the menu model
  */
  void setUsePopover(bool usePopover)
  {
    gtk_menu_button_set_use_popover(cast(GtkMenuButton*)cPtr, usePopover);
  }
}
