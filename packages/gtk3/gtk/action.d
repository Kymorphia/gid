/// Module for [Action] class
module gtk.action;

import gid.gid;
import gio.icon;
import gobject.closure;
import gobject.dclosure;
import gobject.object;
import gtk.accel_group;
import gtk.action_group;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    > In GTK+ 3.10, GtkAction has been deprecated. Use #GAction
    > instead, and associate actions with #GtkActionable widgets. Use
    > #GMenuModel for creating menus with [gtk.menu.Menu.newFromModel].
    
    Actions represent operations that the user can be perform, along with
    some information how it should be presented in the interface. Each action
    provides methods to create icons, menu items and toolbar items
    representing itself.
    
    As well as the callback that is called when the action gets activated,
    the following also gets associated with the action:
    
    $(LIST
      * a name (not translated, for path lookup)
      
      * a label (translated, for display)
      
      * an accelerator
      
      * whether label indicates a stock id
      
      * a tooltip (optional, translated)
      
      * a toolbar label (optional, shorter than label)
    )
      
      
    The action will also have some state information:
    
    $(LIST
      * visible (shown/hidden)
      
      * sensitive (enabled/disabled)
    )
      
    Apart from regular actions, there are [toggle actions][GtkToggleAction],
    which can be toggled between two states and
    [radio actions][GtkRadioAction], of which only one in a group
    can be in the “active” state. Other actions can be implemented as #GtkAction
    subclasses.
    
    Each action can have one or more proxy widgets. To act as an action proxy,
    widget needs to implement #GtkActivatable interface. Proxies mirror the state
    of the action and should change when the action’s state changes. Properties
    that are always mirrored by proxies are #GtkAction:sensitive and
    #GtkAction:visible. #GtkAction:gicon, #GtkAction:icon-name, #GtkAction:label,
    #GtkAction:short-label and #GtkAction:stock-id properties are only mirorred
    if proxy widget has #GtkActivatable:use-action-appearance property set to
    true.
    
    When the proxy is activated, it should activate its action.
*/
class Action : gobject.object.ObjectWrap, gtk.buildable.Buildable
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
    return cast(void function())gtk_action_get_type != &gidSymbolNotFound ? gtk_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Action self()
  {
    return this;
  }

  /**
      Get `actionGroup` property.
      Returns: The GtkActionGroup this GtkAction is associated with, or NULL
        (for internal use).
  
      Deprecated: Lookup the #GAction using [gio.action_map.ActionMap.lookupAction]
        instead
  */
  @property gtk.action_group.ActionGroup actionGroup()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.action_group.ActionGroup)("action-group");
  }

  /**
      Set `actionGroup` property.
      Params:
        propval = The GtkActionGroup this GtkAction is associated with, or NULL
          (for internal use).
  
      Deprecated: Lookup the #GAction using [gio.action_map.ActionMap.lookupAction]
        instead
  */
  @property void actionGroup(gtk.action_group.ActionGroup propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.action_group.ActionGroup)("action-group", propval);
  }

  /**
      Get `alwaysShowImage` property.
      Returns: If true, the action's menu item proxies will ignore the #GtkSettings:gtk-menu-images
        setting and always show their image, if available.
        
        Use this property if the menu item would be useless or hard to use
        without their image.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool alwaysShowImage()
  {
    return getAlwaysShowImage();
  }

  /**
      Set `alwaysShowImage` property.
      Params:
        propval = If true, the action's menu item proxies will ignore the #GtkSettings:gtk-menu-images
          setting and always show their image, if available.
          
          Use this property if the menu item would be useless or hard to use
          without their image.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void alwaysShowImage(bool propval)
  {
    return setAlwaysShowImage(propval);
  }

  /**
      Get `gicon` property.
      Returns: The #GIcon displayed in the #GtkAction.
        
        Note that the stock icon is preferred, if the #GtkAction:stock-id
        property holds the id of an existing stock icon.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  
      Deprecated: Use the "icon" attribute on a #GMenuItem instead
  */
  @property gio.icon.Icon gicon()
  {
    return getGicon();
  }

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon displayed in the #GtkAction.
          
          Note that the stock icon is preferred, if the #GtkAction:stock-id
          property holds the id of an existing stock icon.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
  
      Deprecated: Use the "icon" attribute on a #GMenuItem instead
  */
  @property void gicon(gio.icon.Icon propval)
  {
    return setGicon(propval);
  }

  /**
      Get `hideIfEmpty` property.
      Returns: When TRUE, empty menu proxies for this action are hidden.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool hideIfEmpty()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("hide-if-empty");
  }

  /**
      Set `hideIfEmpty` property.
      Params:
        propval = When TRUE, empty menu proxies for this action are hidden.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void hideIfEmpty(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("hide-if-empty", propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon from the icon theme.
        
        Note that the stock icon is preferred, if the #GtkAction:stock-id
        property holds the id of an existing stock icon, and the #GIcon is
        preferred if the #GtkAction:gicon property is set.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  
      Deprecated: Use the "icon" attribute on a #GMenuItem instead
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon from the icon theme.
          
          Note that the stock icon is preferred, if the #GtkAction:stock-id
          property holds the id of an existing stock icon, and the #GIcon is
          preferred if the #GtkAction:gicon property is set.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
  
      Deprecated: Use the "icon" attribute on a #GMenuItem instead
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `isImportant` property.
      Returns: Whether the action is considered important. When TRUE, toolitem
        proxies for this action show text in GTK_TOOLBAR_BOTH_HORIZ mode.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool isImportant()
  {
    return getIsImportant();
  }

  /**
      Set `isImportant` property.
      Params:
        propval = Whether the action is considered important. When TRUE, toolitem
          proxies for this action show text in GTK_TOOLBAR_BOTH_HORIZ mode.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void isImportant(bool propval)
  {
    return setIsImportant(propval);
  }

  /**
      Get `label` property.
      Returns: The label used for menu items and buttons that activate
        this action. If the label is null, GTK+ uses the stock
        label specified via the stock-id property.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  
      Deprecated: Use the "label" attribute on #GMenuItem instead
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The label used for menu items and buttons that activate
          this action. If the label is null, GTK+ uses the stock
          label specified via the stock-id property.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
  
      Deprecated: Use the "label" attribute on #GMenuItem instead
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `sensitive` property.
      Returns: Whether the action is enabled.
  
      Deprecated: Use #GAction:enabled and #GSimpleAction:enabled
        instead
  */
  @property bool sensitive()
  {
    return getSensitive();
  }

  /**
      Set `sensitive` property.
      Params:
        propval = Whether the action is enabled.
  
      Deprecated: Use #GAction:enabled and #GSimpleAction:enabled
        instead
  */
  @property void sensitive(bool propval)
  {
    return setSensitive(propval);
  }

  /**
      Get `shortLabel` property.
      Returns: A shorter label that may be used on toolbar buttons.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property string shortLabel()
  {
    return getShortLabel();
  }

  /**
      Set `shortLabel` property.
      Params:
        propval = A shorter label that may be used on toolbar buttons.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void shortLabel(string propval)
  {
    return setShortLabel(propval);
  }

  /**
      Get `stockId` property.
      Returns: The stock icon displayed in widgets representing this action.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property string stockId()
  {
    return getStockId();
  }

  /**
      Set `stockId` property.
      Params:
        propval = The stock icon displayed in widgets representing this action.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void stockId(string propval)
  {
    return setStockId(propval);
  }

  /**
      Get `tooltip` property.
      Returns: A tooltip for this action.
  
      Deprecated: Use [gtk.widget.Widget.setTooltipText] instead
  */
  @property string tooltip()
  {
    return getTooltip();
  }

  /**
      Set `tooltip` property.
      Params:
        propval = A tooltip for this action.
  
      Deprecated: Use [gtk.widget.Widget.setTooltipText] instead
  */
  @property void tooltip(string propval)
  {
    return setTooltip(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether the action is visible.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visible()
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the action is visible.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void visible(bool propval)
  {
    return setVisible(propval);
  }

  /**
      Get `visibleHorizontal` property.
      Returns: Whether the toolbar item is visible when the toolbar is in a horizontal orientation.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visibleHorizontal()
  {
    return getVisibleHorizontal();
  }

  /**
      Set `visibleHorizontal` property.
      Params:
        propval = Whether the toolbar item is visible when the toolbar is in a horizontal orientation.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void visibleHorizontal(bool propval)
  {
    return setVisibleHorizontal(propval);
  }

  /**
      Get `visibleOverflown` property.
      Returns: When true, toolitem proxies for this action are represented in the
        toolbar overflow menu.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visibleOverflown()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("visible-overflown");
  }

  /**
      Set `visibleOverflown` property.
      Params:
        propval = When true, toolitem proxies for this action are represented in the
          toolbar overflow menu.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void visibleOverflown(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("visible-overflown", propval);
  }

  /**
      Get `visibleVertical` property.
      Returns: Whether the toolbar item is visible when the toolbar is in a vertical orientation.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visibleVertical()
  {
    return getVisibleVertical();
  }

  /**
      Set `visibleVertical` property.
      Params:
        propval = Whether the toolbar item is visible when the toolbar is in a vertical orientation.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void visibleVertical(bool propval)
  {
    return setVisibleVertical(propval);
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkAction object. To add the action to a
      #GtkActionGroup and set the accelerator for the action,
      call [gtk.action_group.ActionGroup.addActionWithAccel].
      See the [UI Definition section][XML-UI] for information on allowed action
      names.
  
      Params:
        name = A unique name for the action
        label = the label displayed in menu items and on buttons,
                  or null
        tooltip = a tooltip for the action, or null
        stockId = the stock icon to display in widgets representing
                     the action, or null
      Returns: a new #GtkAction
  
      Deprecated: Use #GAction instead, associating it to a widget with
        #GtkActionable or creating a #GtkMenu with [gtk.menu.Menu.newFromModel]
  */
  this(string name, string label = null, string tooltip = null, string stockId = null)
  {
    GtkAction* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_action_new(_name, _label, _tooltip, _stockId);
    this(_cretval, Yes.Take);
  }

  /**
      Emits the “activate” signal on the specified action, if it isn't
      insensitive. This gets called by the proxy widgets when they get
      activated.
      
      It can also be used to manually activate an action.
  
      Deprecated: Use [gio.action_group.ActionGroup.activateAction] on a #GAction instead
  */
  void activate()
  {
    gtk_action_activate(cast(GtkAction*)this._cPtr);
  }

  /**
      Disable activation signals from the action
      
      This is needed when updating the state of your proxy
      #GtkActivatable widget could result in calling [gtk.action.Action.activate],
      this is a convenience function to avoid recursing in those
      cases (updating toggle state for instance).
  
      Deprecated: Use [gio.simple_action.SimpleAction.setEnabled] to disable the
        #GSimpleAction instead
  */
  void blockActivate()
  {
    gtk_action_block_activate(cast(GtkAction*)this._cPtr);
  }

  /**
      Installs the accelerator for action if action has an
      accel path and group. See [gtk.action.Action.setAccelPath] and
      [gtk.action.Action.setAccelGroup]
      
      Since multiple proxies may independently trigger the installation
      of the accelerator, the action counts the number of times this
      function has been called and doesn’t remove the accelerator until
      [gtk.action.Action.disconnectAccelerator] has been called as many times.
  
      Deprecated: Use #GAction and the accelerator group on an associated
        #GtkMenu instead
  */
  void connectAccelerator()
  {
    gtk_action_connect_accelerator(cast(GtkAction*)this._cPtr);
  }

  /**
      This function is intended for use by action implementations to
      create icons displayed in the proxy widgets.
  
      Params:
        iconSize = the size of the icon (#GtkIconSize) that should
               be created.
      Returns: a widget that displays the icon for this action.
  
      Deprecated: Use [gio.menu_item.MenuItem.setIcon] to set an icon on a #GMenuItem,
        or [gtk.container.Container.add] to add a #GtkImage to a #GtkButton
  */
  gtk.widget.Widget createIcon(gtk.types.IconSize iconSize)
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_icon(cast(GtkAction*)this._cPtr, iconSize);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      If action provides a #GtkMenu widget as a submenu for the menu
      item or the toolbar item it creates, this function returns an
      instance of that menu.
      Returns: the menu item provided by the
                      action, or null.
  
      Deprecated: Use #GAction and #GMenuModel instead, and create a
        #GtkMenu with [gtk.menu.Menu.newFromModel]
  */
  gtk.widget.Widget createMenu()
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_menu(cast(GtkAction*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a menu item widget that proxies for the given action.
      Returns: a menu item connected to the action.
  
      Deprecated: Use [gio.menu_item.MenuItem.new_] and associate it with a #GAction
        instead.
  */
  gtk.widget.Widget createMenuItem()
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_menu_item(cast(GtkAction*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a toolbar item widget that proxies for the given action.
      Returns: a toolbar item connected to the action.
  
      Deprecated: Use a #GtkToolItem and associate it with a #GAction using
        [gtk.actionable.Actionable.setActionName] instead
  */
  gtk.widget.Widget createToolItem()
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_tool_item(cast(GtkAction*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Undoes the effect of one call to [gtk.action.Action.connectAccelerator].
  
      Deprecated: Use #GAction and the accelerator group on an associated
        #GtkMenu instead
  */
  void disconnectAccelerator()
  {
    gtk_action_disconnect_accelerator(cast(GtkAction*)this._cPtr);
  }

  /**
      Returns the accel closure for this action.
      Returns: the accel closure for this action. The
                 returned closure is owned by GTK+ and must not be unreffed
                 or modified.
  
      Deprecated: Use #GAction and #GtkMenu instead, which have no
        equivalent for getting the accel closure
  */
  gobject.closure.Closure getAccelClosure()
  {
    GClosure* _cretval;
    _cretval = gtk_action_get_accel_closure(cast(GtkAction*)this._cPtr);
    auto _retval = _cretval ? new gobject.closure.Closure(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the accel path for this action.
      Returns: the accel path for this action, or null
          if none is set. The returned string is owned by GTK+
          and must not be freed or modified.
  
      Deprecated: Use #GAction and the accelerator path on an associated
        #GtkMenu instead
  */
  string getAccelPath()
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_accel_path(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether action's menu item proxies will always
      show their image, if available.
      Returns: true if the menu item proxies will always show their image
  
      Deprecated: Use [gio.menu_item.MenuItem.getAttributeValue] on a #GMenuItem
        instead
  */
  bool getAlwaysShowImage()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_always_show_image(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Gets the gicon of action.
      Returns: The action’s #GIcon if one is set.
  
      Deprecated: Use #GAction instead, and
        [gio.menu_item.MenuItem.getAttributeValue] to get an icon from a #GMenuItem
        associated with a #GAction
  */
  gio.icon.Icon getGicon()
  {
    GIcon* _cretval;
    _cretval = gtk_action_get_gicon(cast(GtkAction*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of action.
      Returns: the icon name
  
      Deprecated: Use #GAction instead, and
        [gio.menu_item.MenuItem.getAttributeValue] to get an icon from a #GMenuItem
        associated with a #GAction
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_icon_name(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks whether action is important or not
      Returns: whether action is important
  
      Deprecated: Use #GAction instead, and control and monitor whether
        labels are shown directly
  */
  bool getIsImportant()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_is_important(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Gets the label text of action.
      Returns: the label text
  
      Deprecated: Use #GAction instead, and get a label from a menu item
        with [gio.menu_item.MenuItem.getAttributeValue]. For #GtkActionable widgets, use the
        widget-specific API to get a label
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_label(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the name of the action.
      Returns: the name of the action. The string belongs to GTK+ and should not
          be freed.
  
      Deprecated: Use [gio.action.Action.getName] on a #GAction instead
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_name(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the proxy widgets for an action.
      See also [gtk.activatable.Activatable.getRelatedAction].
      Returns: a #GSList of proxy widgets. The list is owned by GTK+
        and must not be modified.
  */
  gtk.widget.Widget[] getProxies()
  {
    GSList* _cretval;
    _cretval = gtk_action_get_proxies(cast(GtkAction*)this._cPtr);
    auto _retval = gSListToD!(gtk.widget.Widget, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns whether the action itself is sensitive. Note that this doesn’t
      necessarily mean effective sensitivity. See [gtk.action.Action.isSensitive]
      for that.
      Returns: true if the action itself is sensitive.
  
      Deprecated: Use [gio.action.Action.getEnabled] on a #GAction
        instead
  */
  bool getSensitive()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_sensitive(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Gets the short label text of action.
      Returns: the short label text.
  
      Deprecated: Use #GAction instead, which has no equivalent of short
        labels
  */
  string getShortLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_short_label(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the stock id of action.
      Returns: the stock id
  
      Deprecated: Use #GAction instead, which has no equivalent of stock
        items
  */
  string getStockId()
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_stock_id(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the tooltip text of action.
      Returns: the tooltip text
  
      Deprecated: Use #GAction instead, and get tooltips from associated
        #GtkActionable widgets with [gtk.widget.Widget.getTooltipText]
  */
  string getTooltip()
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_tooltip(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the action itself is visible. Note that this doesn’t
      necessarily mean effective visibility. See [gtk.action.Action.isSensitive]
      for that.
      Returns: true if the action itself is visible.
  
      Deprecated: Use #GAction instead, and control and monitor the state of
        #GtkActionable widgets directly
  */
  bool getVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_visible(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether action is visible when horizontal
      Returns: whether action is visible when horizontal
  
      Deprecated: Use #GAction instead, and control and monitor the
        visibility of associated widgets and menu items directly
  */
  bool getVisibleHorizontal()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_visible_horizontal(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether action is visible when horizontal
      Returns: whether action is visible when horizontal
  
      Deprecated: Use #GAction instead, and control and monitor the
        visibility of associated widgets and menu items directly
  */
  bool getVisibleVertical()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_visible_vertical(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the action is effectively sensitive.
      Returns: true if the action and its associated action group
        are both sensitive.
  
      Deprecated: Use [gio.action.Action.getEnabled] on a #GAction
        instead
  */
  bool isSensitive()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_is_sensitive(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the action is effectively visible.
      Returns: true if the action and its associated action group
        are both visible.
  
      Deprecated: Use #GAction instead, and control and monitor the state of
        #GtkActionable widgets directly
  */
  bool isVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_action_is_visible(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Sets the #GtkAccelGroup in which the accelerator for this action
      will be installed.
  
      Params:
        accelGroup = a #GtkAccelGroup or null
  
      Deprecated: Use #GAction and the accelerator group on an associated
        #GtkMenu instead
  */
  void setAccelGroup(gtk.accel_group.AccelGroup accelGroup = null)
  {
    gtk_action_set_accel_group(cast(GtkAction*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  /**
      Sets the accel path for this action.  All proxy widgets associated
      with the action will have this accel path, so that their
      accelerators are consistent.
      
      Note that accel_path string will be stored in a #GQuark. Therefore, if you
      pass a static string, you can save some memory by interning it first with
      [glib.global.internStaticString].
  
      Params:
        accelPath = the accelerator path
  
      Deprecated: Use #GAction and the accelerator path on an associated
        #GtkMenu instead
  */
  void setAccelPath(string accelPath)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_action_set_accel_path(cast(GtkAction*)this._cPtr, _accelPath);
  }

  /**
      Sets whether action's menu item proxies will ignore the
      #GtkSettings:gtk-menu-images setting and always show their image, if available.
      
      Use this if the menu item would be useless or hard to use
      without their image.
  
      Params:
        alwaysShow = true if menuitem proxies should always show their image
  
      Deprecated: Use [gio.menu_item.MenuItem.setIcon] on a #GMenuItem instead, if the
        item should have an image
  */
  void setAlwaysShowImage(bool alwaysShow)
  {
    gtk_action_set_always_show_image(cast(GtkAction*)this._cPtr, alwaysShow);
  }

  /**
      Sets the icon of action.
  
      Params:
        icon = the #GIcon to set
  
      Deprecated: Use #GAction instead, and [gio.menu_item.MenuItem.setIcon] to set an
        icon on a #GMenuItem associated with a #GAction, or [gtk.container.Container.add] to
        add a #GtkImage to a #GtkButton
  */
  void setGicon(gio.icon.Icon icon)
  {
    gtk_action_set_gicon(cast(GtkAction*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name on action
  
      Params:
        iconName = the icon name to set
  
      Deprecated: Use #GAction instead, and [gio.menu_item.MenuItem.setIcon] to set an
        icon on a #GMenuItem associated with a #GAction, or [gtk.container.Container.add] to
        add a #GtkImage to a #GtkButton
  */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_action_set_icon_name(cast(GtkAction*)this._cPtr, _iconName);
  }

  /**
      Sets whether the action is important, this attribute is used
      primarily by toolbar items to decide whether to show a label
      or not.
  
      Params:
        isImportant = true to make the action important
  
      Deprecated: Use #GAction instead, and control and monitor whether
        labels are shown directly
  */
  void setIsImportant(bool isImportant)
  {
    gtk_action_set_is_important(cast(GtkAction*)this._cPtr, isImportant);
  }

  /**
      Sets the label of action.
  
      Params:
        label = the label text to set
  
      Deprecated: Use #GAction instead, and set a label on a menu item with
        [gio.menu_item.MenuItem.setLabel]. For #GtkActionable widgets, use the widget-specific
        API to set a label
  */
  void setLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_action_set_label(cast(GtkAction*)this._cPtr, _label);
  }

  /**
      Sets the :sensitive property of the action to sensitive. Note that
      this doesn’t necessarily mean effective sensitivity. See
      [gtk.action.Action.isSensitive]
      for that.
  
      Params:
        sensitive = true to make the action sensitive
  
      Deprecated: Use [gio.simple_action.SimpleAction.setEnabled] on a #GSimpleAction
        instead
  */
  void setSensitive(bool sensitive)
  {
    gtk_action_set_sensitive(cast(GtkAction*)this._cPtr, sensitive);
  }

  /**
      Sets a shorter label text on action.
  
      Params:
        shortLabel = the label text to set
  
      Deprecated: Use #GAction instead, which has no equivalent of short
        labels
  */
  void setShortLabel(string shortLabel)
  {
    const(char)* _shortLabel = shortLabel.toCString(No.Alloc);
    gtk_action_set_short_label(cast(GtkAction*)this._cPtr, _shortLabel);
  }

  /**
      Sets the stock id on action
  
      Params:
        stockId = the stock id
  
      Deprecated: Use #GAction instead, which has no equivalent of stock
        items
  */
  void setStockId(string stockId)
  {
    const(char)* _stockId = stockId.toCString(No.Alloc);
    gtk_action_set_stock_id(cast(GtkAction*)this._cPtr, _stockId);
  }

  /**
      Sets the tooltip text on action
  
      Params:
        tooltip = the tooltip text
  
      Deprecated: Use #GAction instead, and set tooltips on associated
        #GtkActionable widgets with [gtk.widget.Widget.setTooltipText]
  */
  void setTooltip(string tooltip)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    gtk_action_set_tooltip(cast(GtkAction*)this._cPtr, _tooltip);
  }

  /**
      Sets the :visible property of the action to visible. Note that
      this doesn’t necessarily mean effective visibility. See
      [gtk.action.Action.isVisible]
      for that.
  
      Params:
        visible = true to make the action visible
  
      Deprecated: Use #GAction instead, and control and monitor the state of
        #GtkActionable widgets directly
  */
  void setVisible(bool visible)
  {
    gtk_action_set_visible(cast(GtkAction*)this._cPtr, visible);
  }

  /**
      Sets whether action is visible when horizontal
  
      Params:
        visibleHorizontal = whether the action is visible horizontally
  
      Deprecated: Use #GAction instead, and control and monitor the
        visibility of associated widgets and menu items directly
  */
  void setVisibleHorizontal(bool visibleHorizontal)
  {
    gtk_action_set_visible_horizontal(cast(GtkAction*)this._cPtr, visibleHorizontal);
  }

  /**
      Sets whether action is visible when vertical
  
      Params:
        visibleVertical = whether the action is visible vertically
  
      Deprecated: Use #GAction instead, and control and monitor the
        visibility of associated widgets and menu items directly
  */
  void setVisibleVertical(bool visibleVertical)
  {
    gtk_action_set_visible_vertical(cast(GtkAction*)this._cPtr, visibleVertical);
  }

  /**
      Reenable activation signals from the action
  
      Deprecated: Use [gio.simple_action.SimpleAction.setEnabled] to enable the
        #GSimpleAction instead
  */
  void unblockActivate()
  {
    gtk_action_unblock_activate(cast(GtkAction*)this._cPtr);
  }

  /**
      Connect to `Activate` signal.
  
      The "activate" signal is emitted when the action is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.action.Action action))
  
          `action` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use #GSimpleAction::activate instead
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.action.Action)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}
