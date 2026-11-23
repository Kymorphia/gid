/// Module for [Action] class
module gid.gtk3.action;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.icon;
import gid.gobject2.closure;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.accel_group;
import gid.gtk3.action_group;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    > In GTK+ 3.10, GtkAction has been deprecated. Use #GAction
    > instead, and associate actions with #GtkActionable widgets. Use
    > #GMenuModel for creating menus with [gid.gtk3.menu.Menu.newFromModel].
    
    Actions represent operations that the user can be perform, along with
    some information how it should be presented in the interface. Each action
    provides methods to create icons, menu items and toolbar items
    representing itself.
    
    As well as the callback that is called when the action gets activated,
    the following also gets associated with the action:
    
    - a name (not translated, for path lookup)
    
    - a label (translated, for display)
    
    - an accelerator
    
    - whether label indicates a stock id
    
    - a tooltip (optional, translated)
    
    - a toolbar label (optional, shorter than label)
    
    
    The action will also have some state information:
    
    - visible (shown/hidden)
    
    - sensitive (enabled/disabled)
    
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
class Action : gid.gobject2.object.ObjectWrap, gid.gtk3.buildable.Buildable
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
    return cast(void function())gtk_action_get_type != &gidSymbolNotFound ? gtk_action_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkAction";
  }

  /** Returns `this`, for use in `with` statements. */
  override Action self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.action.Action]
      Returns: New builder object
  */
  static ActionGidBuilder builder() nothrow
  {
    return new ActionGidBuilder;
  }

  /**
      Get `actionGroup` property.
      Returns: The GtkActionGroup this GtkAction is associated with, or NULL
        (for internal use).
  
      Deprecated: Lookup the #GAction using [gid.gio2.action_map.ActionMap.lookupAction]
        instead
  */
  @property gid.gtk3.action_group.ActionGroup actionGroup() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.action_group.ActionGroup)("action-group");
  }

  /**
      Set `actionGroup` property.
      Params:
        propval = The GtkActionGroup this GtkAction is associated with, or NULL
          (for internal use).
  
      Deprecated: Lookup the #GAction using [gid.gio2.action_map.ActionMap.lookupAction]
        instead
  */
  @property void actionGroup(gid.gtk3.action_group.ActionGroup propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.action_group.ActionGroup)("action-group", propval);
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
  @property bool alwaysShowImage() nothrow
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
  @property void alwaysShowImage(bool propval) nothrow
  {
    setAlwaysShowImage(propval);
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
  @property gid.gio2.icon.Icon gicon() nothrow
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
  @property void gicon(gid.gio2.icon.Icon propval) nothrow
  {
    setGicon(propval);
  }

  /**
      Get `hideIfEmpty` property.
      Returns: When TRUE, empty menu proxies for this action are hidden.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool hideIfEmpty() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("hide-if-empty");
  }

  /**
      Set `hideIfEmpty` property.
      Params:
        propval = When TRUE, empty menu proxies for this action are hidden.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void hideIfEmpty(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("hide-if-empty", propval);
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
  @property string iconName() nothrow
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
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `isImportant` property.
      Returns: Whether the action is considered important. When TRUE, toolitem
        proxies for this action show text in GTK_TOOLBAR_BOTH_HORIZ mode.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool isImportant() nothrow
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
  @property void isImportant(bool propval) nothrow
  {
    setIsImportant(propval);
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
  @property string label() nothrow
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
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `name` property.
      Returns: A unique name for the action.
  
      Deprecated: Use #GAction:name instead
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Get `sensitive` property.
      Returns: Whether the action is enabled.
  
      Deprecated: Use #GAction:enabled and #GSimpleAction:enabled
        instead
  */
  @property bool sensitive() nothrow
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
  @property void sensitive(bool propval) nothrow
  {
    setSensitive(propval);
  }

  /**
      Get `shortLabel` property.
      Returns: A shorter label that may be used on toolbar buttons.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property string shortLabel() nothrow
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
  @property void shortLabel(string propval) nothrow
  {
    setShortLabel(propval);
  }

  /**
      Get `stockId` property.
      Returns: The stock icon displayed in widgets representing this action.
        
        This is an appearance property and thus only applies if
        #GtkActivatable:use-action-appearance is true.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property string stockId() nothrow
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
  @property void stockId(string propval) nothrow
  {
    setStockId(propval);
  }

  /**
      Get `tooltip` property.
      Returns: A tooltip for this action.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setTooltipText] instead
  */
  @property string tooltip() nothrow
  {
    return getTooltip();
  }

  /**
      Set `tooltip` property.
      Params:
        propval = A tooltip for this action.
  
      Deprecated: Use [gid.gtk4.widget.Widget.setTooltipText] instead
  */
  @property void tooltip(string propval) nothrow
  {
    setTooltip(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether the action is visible.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visible() nothrow
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
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  /**
      Get `visibleHorizontal` property.
      Returns: Whether the toolbar item is visible when the toolbar is in a horizontal orientation.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visibleHorizontal() nothrow
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
  @property void visibleHorizontal(bool propval) nothrow
  {
    setVisibleHorizontal(propval);
  }

  /**
      Get `visibleOverflown` property.
      Returns: When true, toolitem proxies for this action are represented in the
        toolbar overflow menu.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visibleOverflown() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("visible-overflown");
  }

  /**
      Set `visibleOverflown` property.
      Params:
        propval = When true, toolitem proxies for this action are represented in the
          toolbar overflow menu.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property void visibleOverflown(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("visible-overflown", propval);
  }

  /**
      Get `visibleVertical` property.
      Returns: Whether the toolbar item is visible when the toolbar is in a vertical orientation.
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  @property bool visibleVertical() nothrow
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
  @property void visibleVertical(bool propval) nothrow
  {
    setVisibleVertical(propval);
  }

  mixin BuildableT!();

  /**
      Creates a new #GtkAction object. To add the action to a
      #GtkActionGroup and set the accelerator for the action,
      call [gid.gtk3.action_group.ActionGroup.addActionWithAccel].
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
        #GtkActionable or creating a #GtkMenu with [gid.gtk3.menu.Menu.newFromModel]
  */
  this(string name, string label = null, string tooltip = null, string stockId = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      GtkAction* _cretval;
      const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
      const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _tooltip = tooltip.toCString!(No.Malloc, Yes.Nullable);
      const(char)* _stockId = stockId.toCString!(No.Malloc, Yes.Nullable);
      _cretval = gtk_action_new(_name, _label, _tooltip, _stockId);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Emits the “activate” signal on the specified action, if it isn't
      insensitive. This gets called by the proxy widgets when they get
      activated.
      
      It can also be used to manually activate an action.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.action_group.ActionGroup.activateAction] on a #GAction instead
  */
  protected void vfuncActivate()
  {
    auto _klass = cast(GtkActionClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkAction*)this._cPtr);
  }

  /** */
  protected void vfuncConnectProxy(gid.gtk3.widget.Widget proxy)
  {
    auto _klass = cast(GtkActionClass*)_vfuncClass;
    if (!_klass.connectProxy)
      return;

    _klass.connectProxy(cast(GtkAction*)this._cPtr, proxy ? cast(GtkWidget*)proxy._cPtr(No.Dup) : null);
  }

  /**
      If action provides a #GtkMenu widget as a submenu for the menu
      item or the toolbar item it creates, this function returns an
      instance of that menu.
      Returns: the menu item provided by the
                      action, or null.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateMenu` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use #GAction and #GMenuModel instead, and create a
        #GtkMenu with [gid.gtk3.menu.Menu.newFromModel]
  */
  protected gid.gtk3.widget.Widget vfuncCreateMenu()
  {
    auto _klass = cast(GtkActionClass*)_vfuncClass;
    if (!_klass.createMenu)
      return typeof(return).init;

    GtkWidget* _cretval;
    _cretval = _klass.createMenu(cast(GtkAction*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a menu item widget that proxies for the given action.
      Returns: a menu item connected to the action.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateMenuItem` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.gio2.menu_item.MenuItem.new_] and associate it with a #GAction
        instead.
  */
  protected gid.gtk3.widget.Widget vfuncCreateMenuItem()
  {
    auto _klass = cast(GtkActionClass*)_vfuncClass;
    if (!_klass.createMenuItem)
      return typeof(return).init;

    GtkWidget* _cretval;
    _cretval = _klass.createMenuItem(cast(GtkAction*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a toolbar item widget that proxies for the given action.
      Returns: a toolbar item connected to the action.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCreateToolItem` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use a #GtkToolItem and associate it with a #GAction using
        [gid.gtk4.actionable.Actionable.setActionName] instead
  */
  protected gid.gtk3.widget.Widget vfuncCreateToolItem()
  {
    auto _klass = cast(GtkActionClass*)_vfuncClass;
    if (!_klass.createToolItem)
      return typeof(return).init;

    GtkWidget* _cretval;
    _cretval = _klass.createToolItem(cast(GtkAction*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncDisconnectProxy(gid.gtk3.widget.Widget proxy)
  {
    auto _klass = cast(GtkActionClass*)_vfuncClass;
    if (!_klass.disconnectProxy)
      return;

    _klass.disconnectProxy(cast(GtkAction*)this._cPtr, proxy ? cast(GtkWidget*)proxy._cPtr(No.Dup) : null);
  }

  /**
      Emits the “activate” signal on the specified action, if it isn't
      insensitive. This gets called by the proxy widgets when they get
      activated.
      
      It can also be used to manually activate an action.
  
      Deprecated: Use [gid.gio2.action_group.ActionGroup.activateAction] on a #GAction instead
  */
  void activate() nothrow
  {
    gtk_action_activate(cast(GtkAction*)this._cPtr);
  }

  /**
      Disable activation signals from the action
      
      This is needed when updating the state of your proxy
      #GtkActivatable widget could result in calling [gid.gtk3.action.Action.activate],
      this is a convenience function to avoid recursing in those
      cases (updating toggle state for instance).
  
      Deprecated: Use [gid.gio2.simple_action.SimpleAction.setEnabled] to disable the
        #GSimpleAction instead
  */
  void blockActivate() nothrow
  {
    gtk_action_block_activate(cast(GtkAction*)this._cPtr);
  }

  /**
      Installs the accelerator for action if action has an
      accel path and group. See [gid.gtk3.action.Action.setAccelPath] and
      [gid.gtk3.action.Action.setAccelGroup]
      
      Since multiple proxies may independently trigger the installation
      of the accelerator, the action counts the number of times this
      function has been called and doesn’t remove the accelerator until
      [gid.gtk3.action.Action.disconnectAccelerator] has been called as many times.
  
      Deprecated: Use #GAction and the accelerator group on an associated
        #GtkMenu instead
  */
  void connectAccelerator() nothrow
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
  
      Deprecated: Use [gid.gio2.menu_item.MenuItem.setIcon] to set an icon on a #GMenuItem,
        or [gid.gtk3.container.Container.add] to add a #GtkImage to a #GtkButton
  */
  gid.gtk3.widget.Widget createIcon(gid.gtk3.types.IconSize iconSize) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_icon(cast(GtkAction*)this._cPtr, iconSize);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      If action provides a #GtkMenu widget as a submenu for the menu
      item or the toolbar item it creates, this function returns an
      instance of that menu.
      Returns: the menu item provided by the
                      action, or null.
  
      Deprecated: Use #GAction and #GMenuModel instead, and create a
        #GtkMenu with [gid.gtk3.menu.Menu.newFromModel]
  */
  gid.gtk3.widget.Widget createMenu() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_menu(cast(GtkAction*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a menu item widget that proxies for the given action.
      Returns: a menu item connected to the action.
  
      Deprecated: Use [gid.gio2.menu_item.MenuItem.new_] and associate it with a #GAction
        instead.
  */
  gid.gtk3.widget.Widget createMenuItem() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_menu_item(cast(GtkAction*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a toolbar item widget that proxies for the given action.
      Returns: a toolbar item connected to the action.
  
      Deprecated: Use a #GtkToolItem and associate it with a #GAction using
        [gid.gtk4.actionable.Actionable.setActionName] instead
  */
  gid.gtk3.widget.Widget createToolItem() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_action_create_tool_item(cast(GtkAction*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Undoes the effect of one call to [gid.gtk3.action.Action.connectAccelerator].
  
      Deprecated: Use #GAction and the accelerator group on an associated
        #GtkMenu instead
  */
  void disconnectAccelerator() nothrow
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
  gid.gobject2.closure.Closure getAccelClosure() nothrow
  {
    GClosure* _cretval;
    _cretval = gtk_action_get_accel_closure(cast(GtkAction*)this._cPtr);
    auto _retval = _cretval ? new gid.gobject2.closure.Closure(cast(void*)_cretval, No.Take) : null;
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
  string getAccelPath() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_accel_path(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether action's menu item proxies will always
      show their image, if available.
      Returns: true if the menu item proxies will always show their image
  
      Deprecated: Use [gid.gio2.menu_item.MenuItem.getAttributeValue] on a #GMenuItem
        instead
  */
  bool getAlwaysShowImage() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_always_show_image(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Gets the gicon of action.
      Returns: The action’s #GIcon if one is set.
  
      Deprecated: Use #GAction instead, and
        [gid.gio2.menu_item.MenuItem.getAttributeValue] to get an icon from a #GMenuItem
        associated with a #GAction
  */
  gid.gio2.icon.Icon getGicon() nothrow
  {
    GIcon* _cretval;
    _cretval = gtk_action_get_gicon(cast(GtkAction*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of action.
      Returns: the icon name
  
      Deprecated: Use #GAction instead, and
        [gid.gio2.menu_item.MenuItem.getAttributeValue] to get an icon from a #GMenuItem
        associated with a #GAction
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_icon_name(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Checks whether action is important or not
      Returns: whether action is important
  
      Deprecated: Use #GAction instead, and control and monitor whether
        labels are shown directly
  */
  bool getIsImportant() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_is_important(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Gets the label text of action.
      Returns: the label text
  
      Deprecated: Use #GAction instead, and get a label from a menu item
        with [gid.gio2.menu_item.MenuItem.getAttributeValue]. For #GtkActionable widgets, use the
        widget-specific API to get a label
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_label(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the name of the action.
      Returns: the name of the action. The string belongs to GTK+ and should not
          be freed.
  
      Deprecated: Use [gid.gio2.action.Action.getName] on a #GAction instead
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_name(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the proxy widgets for an action.
      See also [gid.gtk3.activatable.Activatable.getRelatedAction].
      Returns: a #GSList of proxy widgets. The list is owned by GTK+
        and must not be modified.
  */
  gid.gtk3.widget.Widget[] getProxies() nothrow
  {
    GSList* _cretval;
    _cretval = gtk_action_get_proxies(cast(GtkAction*)this._cPtr);
    auto _retval = gSListToD!(gid.gtk3.widget.Widget, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Returns whether the action itself is sensitive. Note that this doesn’t
      necessarily mean effective sensitivity. See [gid.gtk3.action.Action.isSensitive]
      for that.
      Returns: true if the action itself is sensitive.
  
      Deprecated: Use [gid.gio2.action.Action.getEnabled] on a #GAction
        instead
  */
  bool getSensitive() nothrow
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
  string getShortLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_short_label(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the stock id of action.
      Returns: the stock id
  
      Deprecated: Use #GAction instead, which has no equivalent of stock
        items
  */
  string getStockId() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_stock_id(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the tooltip text of action.
      Returns: the tooltip text
  
      Deprecated: Use #GAction instead, and get tooltips from associated
        #GtkActionable widgets with [gid.gtk4.widget.Widget.getTooltipText]
  */
  string getTooltip() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_action_get_tooltip(cast(GtkAction*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the action itself is visible. Note that this doesn’t
      necessarily mean effective visibility. See [gid.gtk3.action.Action.isSensitive]
      for that.
      Returns: true if the action itself is visible.
  
      Deprecated: Use #GAction instead, and control and monitor the state of
        #GtkActionable widgets directly
  */
  bool getVisible() nothrow
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
  bool getVisibleHorizontal() nothrow
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
  bool getVisibleVertical() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_action_get_visible_vertical(cast(GtkAction*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the action is effectively sensitive.
      Returns: true if the action and its associated action group
        are both sensitive.
  
      Deprecated: Use [gid.gio2.action.Action.getEnabled] on a #GAction
        instead
  */
  bool isSensitive() nothrow
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
  bool isVisible() nothrow
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
  void setAccelGroup(gid.gtk3.accel_group.AccelGroup accelGroup = null) nothrow
  {
    gtk_action_set_accel_group(cast(GtkAction*)this._cPtr, accelGroup ? cast(GtkAccelGroup*)accelGroup._cPtr(No.Dup) : null);
  }

  /**
      Sets the accel path for this action.  All proxy widgets associated
      with the action will have this accel path, so that their
      accelerators are consistent.
      
      Note that accel_path string will be stored in a #GQuark. Therefore, if you
      pass a static string, you can save some memory by interning it first with
      [gid.glib2.global.internStaticString].
  
      Params:
        accelPath = the accelerator path
  
      Deprecated: Use #GAction and the accelerator path on an associated
        #GtkMenu instead
  */
  void setAccelPath(string accelPath) nothrow
  {
    const(char)* _accelPath = accelPath.toCString!(No.Malloc, No.Nullable);
    gtk_action_set_accel_path(cast(GtkAction*)this._cPtr, _accelPath);
  }

  /**
      Sets whether action's menu item proxies will ignore the
      #GtkSettings:gtk-menu-images setting and always show their image, if available.
      
      Use this if the menu item would be useless or hard to use
      without their image.
  
      Params:
        alwaysShow = true if menuitem proxies should always show their image
  
      Deprecated: Use [gid.gio2.menu_item.MenuItem.setIcon] on a #GMenuItem instead, if the
        item should have an image
  */
  void setAlwaysShowImage(bool alwaysShow) nothrow
  {
    gtk_action_set_always_show_image(cast(GtkAction*)this._cPtr, alwaysShow);
  }

  /**
      Sets the icon of action.
  
      Params:
        icon = the #GIcon to set
  
      Deprecated: Use #GAction instead, and [gid.gio2.menu_item.MenuItem.setIcon] to set an
        icon on a #GMenuItem associated with a #GAction, or [gid.gtk3.container.Container.add] to
        add a #GtkImage to a #GtkButton
  */
  void setGicon(gid.gio2.icon.Icon icon) nothrow
  {
    gtk_action_set_gicon(cast(GtkAction*)this._cPtr, icon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the icon name on action
  
      Params:
        iconName = the icon name to set
  
      Deprecated: Use #GAction instead, and [gid.gio2.menu_item.MenuItem.setIcon] to set an
        icon on a #GMenuItem associated with a #GAction, or [gid.gtk3.container.Container.add] to
        add a #GtkImage to a #GtkButton
  */
  void setIconName(string iconName) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
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
  void setIsImportant(bool isImportant) nothrow
  {
    gtk_action_set_is_important(cast(GtkAction*)this._cPtr, isImportant);
  }

  /**
      Sets the label of action.
  
      Params:
        label = the label text to set
  
      Deprecated: Use #GAction instead, and set a label on a menu item with
        [gid.gio2.menu_item.MenuItem.setLabel]. For #GtkActionable widgets, use the widget-specific
        API to set a label
  */
  void setLabel(string label) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    gtk_action_set_label(cast(GtkAction*)this._cPtr, _label);
  }

  /**
      Sets the :sensitive property of the action to sensitive. Note that
      this doesn’t necessarily mean effective sensitivity. See
      [gid.gtk3.action.Action.isSensitive]
      for that.
  
      Params:
        sensitive = true to make the action sensitive
  
      Deprecated: Use [gid.gio2.simple_action.SimpleAction.setEnabled] on a #GSimpleAction
        instead
  */
  void setSensitive(bool sensitive) nothrow
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
  void setShortLabel(string shortLabel) nothrow
  {
    const(char)* _shortLabel = shortLabel.toCString!(No.Malloc, No.Nullable);
    gtk_action_set_short_label(cast(GtkAction*)this._cPtr, _shortLabel);
  }

  /**
      Sets the stock id on action
  
      Params:
        stockId = the stock id
  
      Deprecated: Use #GAction instead, which has no equivalent of stock
        items
  */
  void setStockId(string stockId) nothrow
  {
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    gtk_action_set_stock_id(cast(GtkAction*)this._cPtr, _stockId);
  }

  /**
      Sets the tooltip text on action
  
      Params:
        tooltip = the tooltip text
  
      Deprecated: Use #GAction instead, and set tooltips on associated
        #GtkActionable widgets with [gid.gtk4.widget.Widget.setTooltipText]
  */
  void setTooltip(string tooltip) nothrow
  {
    const(char)* _tooltip = tooltip.toCString!(No.Malloc, No.Nullable);
    gtk_action_set_tooltip(cast(GtkAction*)this._cPtr, _tooltip);
  }

  /**
      Sets the :visible property of the action to visible. Note that
      this doesn’t necessarily mean effective visibility. See
      [gid.gtk3.action.Action.isVisible]
      for that.
  
      Params:
        visible = true to make the action visible
  
      Deprecated: Use #GAction instead, and control and monitor the state of
        #GtkActionable widgets directly
  */
  void setVisible(bool visible) nothrow
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
  void setVisibleHorizontal(bool visibleHorizontal) nothrow
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
  void setVisibleVertical(bool visibleVertical) nothrow
  {
    gtk_action_set_visible_vertical(cast(GtkAction*)this._cPtr, visibleVertical);
  }

  /**
      Reenable activation signals from the action
  
      Deprecated: Use [gid.gio2.simple_action.SimpleAction.setEnabled] to enable the
        #GSimpleAction instead
  */
  void unblockActivate() nothrow
  {
    gtk_action_unblock_activate(cast(GtkAction*)this._cPtr);
  }

  /**
      Connect to `Activate` signal.
  
      The "activate" signal is emitted when the action is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.action.Action action)`
  
          `action` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use #GSimpleAction::activate instead
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.action.Action)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.action.Action.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Action
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.action.Action), T.stringof ~ " is not derived from gid.gtk3.action.Action");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk3.action.Action))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncConnectProxy", true)[0]) == gid.gtk3.action.Action))
      _installVfunc(klass, "connect_proxy");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateMenu", true)[0]) == gid.gtk3.action.Action))
      _installVfunc(klass, "create_menu");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateMenuItem", true)[0]) == gid.gtk3.action.Action))
      _installVfunc(klass, "create_menu_item");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCreateToolItem", true)[0]) == gid.gtk3.action.Action))
      _installVfunc(klass, "create_tool_item");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDisconnectProxy", true)[0]) == gid.gtk3.action.Action))
      _installVfunc(klass, "disconnect_proxy");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkActionClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.action.Action)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(action);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.action.Action.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "connect_proxy":
      {
        static extern(C) void _vfuncConnectProxyTramp(GtkAction* action, GtkWidget* proxy) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.action.Action)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.connectProxy)
              return (cast(typeof(&_vfuncConnectProxyTramp))_klass.connectProxy)(action, proxy);
            return;
          }

          try
          {
            _obj.vfuncConnectProxy(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)proxy, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.action.Action.vfuncConnectProxy");
          }
        }

        _klass.connectProxy = cast(typeof(_klass.connectProxy))&_vfuncConnectProxyTramp;
        break;
      }
      case "create_menu":
      {
        static extern(C) GtkWidget* _vfuncCreateMenuTramp(GtkAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.action.Action)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.createMenu)
              return (cast(typeof(&_vfuncCreateMenuTramp))_klass.createMenu)(action);
            return typeof(return).init;
          }

          gid.gtk3.widget.Widget _dretval;

          try
          {
            _dretval = _obj.vfuncCreateMenu();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.action.Action.vfuncCreateMenu");
          }
          auto _retval = _dretval ? cast(GtkWidget*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.createMenu = cast(typeof(_klass.createMenu))&_vfuncCreateMenuTramp;
        break;
      }
      case "create_menu_item":
      {
        static extern(C) GtkWidget* _vfuncCreateMenuItemTramp(GtkAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.action.Action)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.createMenuItem)
              return (cast(typeof(&_vfuncCreateMenuItemTramp))_klass.createMenuItem)(action);
            return typeof(return).init;
          }

          gid.gtk3.widget.Widget _dretval;

          try
          {
            _dretval = _obj.vfuncCreateMenuItem();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.action.Action.vfuncCreateMenuItem");
          }
          auto _retval = _dretval ? cast(GtkWidget*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.createMenuItem = cast(typeof(_klass.createMenuItem))&_vfuncCreateMenuItemTramp;
        break;
      }
      case "create_tool_item":
      {
        static extern(C) GtkWidget* _vfuncCreateToolItemTramp(GtkAction* action) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.action.Action)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.createToolItem)
              return (cast(typeof(&_vfuncCreateToolItemTramp))_klass.createToolItem)(action);
            return typeof(return).init;
          }

          gid.gtk3.widget.Widget _dretval;

          try
          {
            _dretval = _obj.vfuncCreateToolItem();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.action.Action.vfuncCreateToolItem");
          }
          auto _retval = _dretval ? cast(GtkWidget*)_dretval._cPtr(No.Dup) : null;

          return _retval;
        }

        _klass.createToolItem = cast(typeof(_klass.createToolItem))&_vfuncCreateToolItemTramp;
        break;
      }
      case "disconnect_proxy":
      {
        static extern(C) void _vfuncDisconnectProxyTramp(GtkAction* action, GtkWidget* proxy) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.action.Action)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)action);
          if (!_obj)
          {
            auto _klass = cast(GtkActionClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)action);
            if (_klass.disconnectProxy)
              return (cast(typeof(&_vfuncDisconnectProxyTramp))_klass.disconnectProxy)(action, proxy);
            return;
          }

          try
          {
            _obj.vfuncDisconnectProxy(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(void*)proxy, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.action.Action.vfuncDisconnectProxy");
          }
        }

        _klass.disconnectProxy = cast(typeof(_klass.disconnectProxy))&_vfuncDisconnectProxyTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.action.Action]
class ActionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk3.buildable.BuildableGidBuilderImpl!T
{

  mixin BuildableGidBuilderT!();

  /**
      Set `actionGroup` property.
      Params:
        propval = The GtkActionGroup this GtkAction is associated with, or NULL
          (for internal use).
      Returns: Builder instance for fluent chaining
  
      Deprecated: Lookup the #GAction using [gid.gio2.action_map.ActionMap.lookupAction]
        instead
  */
  T actionGroup(gid.gtk3.action_group.ActionGroup propval) nothrow
  {
    return setProperty("action-group", propval);
  }

  /**
      Set `alwaysShowImage` property.
      Params:
        propval = If true, the action's menu item proxies will ignore the #GtkSettings:gtk-menu-images
          setting and always show their image, if available.
          
          Use this property if the menu item would be useless or hard to use
          without their image.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T alwaysShowImage(bool propval) nothrow
  {
    return setProperty("always-show-image", propval);
  }

  /**
      Set `gicon` property.
      Params:
        propval = The #GIcon displayed in the #GtkAction.
          
          Note that the stock icon is preferred, if the #GtkAction:stock-id
          property holds the id of an existing stock icon.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use the "icon" attribute on a #GMenuItem instead
  */
  T gicon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("gicon", propval);
  }

  /**
      Set `hideIfEmpty` property.
      Params:
        propval = When TRUE, empty menu proxies for this action are hidden.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T hideIfEmpty(bool propval) nothrow
  {
    return setProperty("hide-if-empty", propval);
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
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use the "icon" attribute on a #GMenuItem instead
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `isImportant` property.
      Params:
        propval = Whether the action is considered important. When TRUE, toolitem
          proxies for this action show text in GTK_TOOLBAR_BOTH_HORIZ mode.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T isImportant(bool propval) nothrow
  {
    return setProperty("is-important", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = The label used for menu items and buttons that activate
          this action. If the label is null, GTK+ uses the stock
          label specified via the stock-id property.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use the "label" attribute on #GMenuItem instead
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = A unique name for the action.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GAction:name instead
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `sensitive` property.
      Params:
        propval = Whether the action is enabled.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use #GAction:enabled and #GSimpleAction:enabled
        instead
  */
  T sensitive(bool propval) nothrow
  {
    return setProperty("sensitive", propval);
  }

  /**
      Set `shortLabel` property.
      Params:
        propval = A shorter label that may be used on toolbar buttons.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T shortLabel(string propval) nothrow
  {
    return setProperty("short-label", propval);
  }

  /**
      Set `stockId` property.
      Params:
        propval = The stock icon displayed in widgets representing this action.
          
          This is an appearance property and thus only applies if
          #GtkActivatable:use-action-appearance is true.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T stockId(string propval) nothrow
  {
    return setProperty("stock-id", propval);
  }

  /**
      Set `tooltip` property.
      Params:
        propval = A tooltip for this action.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [gid.gtk4.widget.Widget.setTooltipText] instead
  */
  T tooltip(string propval) nothrow
  {
    return setProperty("tooltip", propval);
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether the action is visible.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }

  /**
      Set `visibleHorizontal` property.
      Params:
        propval = Whether the toolbar item is visible when the toolbar is in a horizontal orientation.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T visibleHorizontal(bool propval) nothrow
  {
    return setProperty("visible-horizontal", propval);
  }

  /**
      Set `visibleOverflown` property.
      Params:
        propval = When true, toolitem proxies for this action are represented in the
          toolbar overflow menu.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T visibleOverflown(bool propval) nothrow
  {
    return setProperty("visible-overflown", propval);
  }

  /**
      Set `visibleVertical` property.
      Params:
        propval = Whether the toolbar item is visible when the toolbar is in a vertical orientation.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There is no corresponding replacement when using
        #GAction
  */
  T visibleVertical(bool propval) nothrow
  {
    return setProperty("visible-vertical", propval);
  }
}

/// Fluent builder for [gid.gtk3.action.Action]
final class ActionGidBuilder : ActionGidBuilderImpl!ActionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Action build() nothrow
  {
    return new Action(cast(void*)createGObject(Action._getGType), Yes.Take);
  }
}
