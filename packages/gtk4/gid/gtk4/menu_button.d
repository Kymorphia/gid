/// Module for [MenuButton] class
module gid.gtk4.menu_button;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.menu_model;
import gid.gobject2.dclosure;
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
import gid.gtk4.popover;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Displays a popup when clicked.
    
    <picture>
      <source srcset="menu-button-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkMenuButton" src="menu-button.png">
    </picture>
    
    This popup can be provided either as a [gid.gtk4.popover.Popover] or as an abstract
    [gid.gio2.menu_model.MenuModel].
    
    The [gid.gtk4.menu_button.MenuButton] widget can show either an icon (set with the
    [gid.gtk4.menu_button.MenuButton.iconName] property) or a label (set with the
    [gid.gtk4.menu_button.MenuButton.label] property). If neither is explicitly set,
    a [gid.gtk4.image.Image] is automatically created, using an arrow image oriented
    according to [gid.gtk4.menu_button.MenuButton.direction] or the generic
    “open-menu-symbolic” icon if the direction is not set.
    
    The positioning of the popup is determined by the
    [gid.gtk4.menu_button.MenuButton.direction] property of the menu button.
    
    For menus, the [gid.gtk4.widget.Widget.halign] and [gid.gtk4.widget.Widget.valign]
    properties of the menu are also taken into account. For example, when the
    direction is [gid.gtk4.types.ArrowType.Down] and the horizontal alignment is [gid.gtk4.types.Align.Start],
    the menu will be positioned below the button, with the starting edge
    (depending on the text direction) of the menu aligned with the starting
    edge of the button. If there is not enough space below the button, the
    menu is popped up above the button instead. If the alignment would move
    part of the menu offscreen, it is “pushed in”.
    
    |           | start                | center                | end                |
    | -         | ---                  | ---                   | ---                |
    | **down**  | ![](down-start.png)  | ![](down-center.png)  | ![](down-end.png)  |
    | **up**    | ![](up-start.png)    | ![](up-center.png)    | ![](up-end.png)    |
    | **left**  | ![](left-start.png)  | ![](left-center.png)  | ![](left-end.png)  |
    | **right** | ![](right-start.png) | ![](right-center.png) | ![](right-end.png) |
    
    # CSS nodes
    
    ```
    menubutton
    ╰── button.toggle
        ╰── <content>
             ╰── [arrow]
    ```
    
    [gid.gtk4.menu_button.MenuButton] has a single CSS node with name `menubutton`
    which contains a `button` node with a `.toggle` style class.
    
    If the button contains an icon, it will have the `.image-button` style class,
    if it contains text, it will have `.text-button` style class. If an arrow is
    visible in addition to an icon, text or a custom child, it will also have
    `.arrow-button` style class.
    
    Inside the toggle button content, there is an `arrow` node for
    the indicator, which will carry one of the `.none`, `.up`, `.down`,
    `.left` or `.right` style classes to indicate the direction that
    the menu will appear in. The CSS is expected to provide a suitable
    image for each of these cases using the `-gtk-icon-source` property.
    
    Optionally, the `menubutton` node can carry the `.circular` style class
    to request a round appearance.
    
    # Accessibility
    
    [gid.gtk4.menu_button.MenuButton] uses the [gid.gtk4.types.AccessibleRole.Button] role.
*/
class MenuButton : gid.gtk4.widget.Widget
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
      Get builder for [gid.gtk4.menu_button.MenuButton]
      Returns: New builder object
  */
  static MenuButtonGidBuilder builder() nothrow
  {
    return new MenuButtonGidBuilder;
  }

  /**
      Get `active` property.
      Returns: Whether the menu button is active.
  */
  @property bool active() nothrow
  {
    return getActive();
  }

  /**
      Set `active` property.
      Params:
        propval = Whether the menu button is active.
  */
  @property void active(bool propval) nothrow
  {
    setActive(propval);
  }

  /**
      Get `alwaysShowArrow` property.
      Returns: Whether to show a dropdown arrow even when using an icon or a custom child.
  */
  @property bool alwaysShowArrow() nothrow
  {
    return getAlwaysShowArrow();
  }

  /**
      Set `alwaysShowArrow` property.
      Params:
        propval = Whether to show a dropdown arrow even when using an icon or a custom child.
  */
  @property void alwaysShowArrow(bool propval) nothrow
  {
    setAlwaysShowArrow(propval);
  }

  /**
      Get `canShrink` property.
      Returns: Whether the size of the button can be made smaller than the natural
        size of its contents.
  */
  @property bool canShrink() nothrow
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the size of the button can be made smaller than the natural
          size of its contents.
  */
  @property void canShrink(bool propval) nothrow
  {
    setCanShrink(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `direction` property.
      Returns: The [gid.gtk4.types.ArrowType] representing the direction in which the
        menu or popover will be popped out.
  */
  @property gid.gtk4.types.ArrowType direction() nothrow
  {
    return getDirection();
  }

  /**
      Set `direction` property.
      Params:
        propval = The [gid.gtk4.types.ArrowType] representing the direction in which the
          menu or popover will be popped out.
  */
  @property void direction(gid.gtk4.types.ArrowType propval) nothrow
  {
    setDirection(propval);
  }

  /**
      Get `hasFrame` property.
      Returns: Whether the button has a frame.
  */
  @property bool hasFrame() nothrow
  {
    return getHasFrame();
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = Whether the button has a frame.
  */
  @property void hasFrame(bool propval) nothrow
  {
    setHasFrame(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon used to automatically populate the button.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon used to automatically populate the button.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `label` property.
      Returns: The label for the button.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The label for the button.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `menuModel` property.
      Returns: The [gid.gio2.menu_model.MenuModel] from which the popup will be created.
        
        See [gid.gtk4.menu_button.MenuButton.setMenuModel] for the interaction
        with the [gid.gtk4.menu_button.MenuButton.popover] property.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gid.gio2.menu_model.MenuModel] from which the popup will be created.
          
          See [gid.gtk4.menu_button.MenuButton.setMenuModel] for the interaction
          with the [gid.gtk4.menu_button.MenuButton.popover] property.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `popover` property.
      Returns: The [gid.gtk4.popover.Popover] that will be popped up when the button is clicked.
  */
  @property gid.gtk4.popover.Popover popover() nothrow
  {
    return getPopover();
  }

  /**
      Set `popover` property.
      Params:
        propval = The [gid.gtk4.popover.Popover] that will be popped up when the button is clicked.
  */
  @property void popover(gid.gtk4.popover.Popover propval) nothrow
  {
    setPopover(propval);
  }

  /**
      Get `primary` property.
      Returns: Whether the menu button acts as a primary menu.
        
        Primary menus can be opened using the <kbd>F10</kbd> key
  */
  @property bool primary() nothrow
  {
    return getPrimary();
  }

  /**
      Set `primary` property.
      Params:
        propval = Whether the menu button acts as a primary menu.
          
          Primary menus can be opened using the <kbd>F10</kbd> key
  */
  @property void primary(bool propval) nothrow
  {
    setPrimary(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: If set an underscore in the text indicates a mnemonic.
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set an underscore in the text indicates a mnemonic.
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Creates a new [gid.gtk4.menu_button.MenuButton] widget with downwards-pointing
      arrow as the only child.
      
      You can replace the child widget with another [gid.gtk4.widget.Widget]
      should you wish to.
      Returns: The newly created [gid.gtk4.menu_button.MenuButton]
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
      _cretval = gtk_menu_button_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Returns whether the menu button is active.
      Returns: TRUE if the button is active
  */
  bool getActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_button_get_active(cast(GtkMenuButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to show a dropdown arrow even when using an icon or a custom
      child.
      Returns: whether to show a dropdown arrow even when using an icon or a custom
        child.
  */
  bool getAlwaysShowArrow() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_button_get_always_show_arrow(cast(GtkMenuButton*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether the button can be smaller than the natural
      size of its contents.
      Returns: true if the button can shrink, and false otherwise
  */
  bool getCanShrink() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_button_get_can_shrink(cast(GtkMenuButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget of menu_button.
      Returns: the child widget of menu_button
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_button_get_child(cast(GtkMenuButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  alias getDirection = gid.gtk4.widget.Widget.getDirection;

  /**
      Returns the direction the popup will be pointing at when popped up.
      Returns: a [gid.gtk4.types.ArrowType] value
  */
  gid.gtk4.types.ArrowType getDirection() nothrow
  {
    GtkArrowType _cretval;
    _cretval = gtk_menu_button_get_direction(cast(GtkMenuButton*)this._cPtr);
    gid.gtk4.types.ArrowType _retval = cast(gid.gtk4.types.ArrowType)_cretval;
    return _retval;
  }

  /**
      Returns whether the button has a frame.
      Returns: true if the button has a frame
  */
  bool getHasFrame() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_button_get_has_frame(cast(GtkMenuButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of the icon shown in the button.
      Returns: the name of the icon shown in the button
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_menu_button_get_icon_name(cast(GtkMenuButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the label shown in the button
      Returns: the label shown in the button
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_menu_button_get_label(cast(GtkMenuButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the [gid.gio2.menu_model.MenuModel] used to generate the popup.
      Returns: a [gid.gio2.menu_model.MenuModel]
  */
  gid.gio2.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = gtk_menu_button_get_menu_model(cast(GtkMenuButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the [gid.gtk4.popover.Popover] that pops out of the button.
      
      If the button is not using a [gid.gtk4.popover.Popover], this function
      returns null.
      Returns: a [gid.gtk4.popover.Popover] or null
  */
  gid.gtk4.popover.Popover getPopover() nothrow
  {
    GtkPopover* _cretval;
    _cretval = gtk_menu_button_get_popover(cast(GtkMenuButton*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.popover.Popover)(cast(GtkPopover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether the menu button acts as a primary menu.
      Returns: true if the button is a primary menu
  */
  bool getPrimary() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_button_get_primary(cast(GtkMenuButton*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether an embedded underline in the text indicates a
      mnemonic.
      Returns: true whether an embedded underline in the text indicates
          the mnemonic accelerator keys.
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_button_get_use_underline(cast(GtkMenuButton*)this._cPtr);
    return _retval;
  }

  /**
      Dismiss the menu.
  */
  void popdown() nothrow
  {
    gtk_menu_button_popdown(cast(GtkMenuButton*)this._cPtr);
  }

  /**
      Pop up the menu.
  */
  void popup() nothrow
  {
    gtk_menu_button_popup(cast(GtkMenuButton*)this._cPtr);
  }

  /**
      Sets whether the menu button is active.
  
      Params:
        active = whether the menu button is active
  */
  void setActive(bool active) nothrow
  {
    gtk_menu_button_set_active(cast(GtkMenuButton*)this._cPtr, active);
  }

  /**
      Sets whether to show a dropdown arrow even when using an icon or a custom
      child.
  
      Params:
        alwaysShowArrow = whether to show a dropdown arrow even when using an icon
          or a custom child
  */
  void setAlwaysShowArrow(bool alwaysShowArrow) nothrow
  {
    gtk_menu_button_set_always_show_arrow(cast(GtkMenuButton*)this._cPtr, alwaysShowArrow);
  }

  /**
      Sets whether the button size can be smaller than the natural size of
      its contents.
      
      For text buttons, setting can_shrink to true will ellipsize the label.
      
      For icon buttons, this function has no effect.
  
      Params:
        canShrink = whether the button can shrink
  */
  void setCanShrink(bool canShrink) nothrow
  {
    gtk_menu_button_set_can_shrink(cast(GtkMenuButton*)this._cPtr, canShrink);
  }

  /**
      Sets the child widget of menu_button.
      
      Setting a child resets [gid.gtk4.menu_button.MenuButton.label] and
      [gid.gtk4.menu_button.MenuButton.iconName].
      
      If [gid.gtk4.menu_button.MenuButton.alwaysShowArrow] is set to `TRUE` and
      [gid.gtk4.menu_button.MenuButton.direction] is not [gid.gtk4.types.ArrowType.None], a dropdown arrow
      will be shown next to the child.
  
      Params:
        child = the child widget
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_menu_button_set_child(cast(GtkMenuButton*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets func to be called when a popup is about to be shown.
      
      func should use one of
      
       - [gid.gtk4.menu_button.MenuButton.setPopover]
       - [gid.gtk4.menu_button.MenuButton.setMenuModel]
      
      to set a popup for menu_button.
      If func is non-null, menu_button will always be sensitive.
      
      Using this function will not reset the menu widget attached to
      menu_button. Instead, this can be done manually in func.
  
      Params:
        func = function
            to call when a popup is about to be shown, but none has been provided via other means,
            or null to reset to default behavior
  */
  void setCreatePopupFunc(gid.gtk4.types.MenuButtonCreatePopupFunc func = null) nothrow
  {
    extern(C) void _funcCallback(GtkMenuButton* menuButton, void* userData) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.gtk4.types.MenuButtonCreatePopupFunc*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.menu_button.MenuButton)(cast(void*)menuButton, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.types.MenuButtonCreatePopupFunc");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    gtk_menu_button_set_create_popup_func(cast(GtkMenuButton*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  alias setDirection = gid.gtk4.widget.Widget.setDirection;

  /**
      Sets the direction in which the popup will be popped up.
      
      If the button is automatically populated with an arrow icon,
      its direction will be changed to match.
      
      If the does not fit in the available space in the given direction,
      GTK will its best to keep it inside the screen and fully visible.
      
      If you pass [gid.gtk4.types.ArrowType.None] for a direction, the popup will behave
      as if you passed [gid.gtk4.types.ArrowType.Down] (although you won’t see any arrows).
  
      Params:
        direction = a [gid.gtk4.types.ArrowType]
  */
  void setDirection(gid.gtk4.types.ArrowType direction) nothrow
  {
    gtk_menu_button_set_direction(cast(GtkMenuButton*)this._cPtr, direction);
  }

  /**
      Sets the style of the button.
  
      Params:
        hasFrame = whether the button should have a visible frame
  */
  void setHasFrame(bool hasFrame) nothrow
  {
    gtk_menu_button_set_has_frame(cast(GtkMenuButton*)this._cPtr, hasFrame);
  }

  /**
      Sets the name of an icon to show inside the menu button.
      
      Setting icon name resets [gid.gtk4.menu_button.MenuButton.label] and
      [gid.gtk4.menu_button.MenuButton.child].
      
      If [gid.gtk4.menu_button.MenuButton.alwaysShowArrow] is set to `TRUE` and
      [gid.gtk4.menu_button.MenuButton.direction] is not [gid.gtk4.types.ArrowType.None], a dropdown arrow
      will be shown next to the icon.
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, No.Nullable);
    gtk_menu_button_set_icon_name(cast(GtkMenuButton*)this._cPtr, _iconName);
  }

  /**
      Sets the label to show inside the menu button.
      
      Setting a label resets [gid.gtk4.menu_button.MenuButton.iconName] and
      [gid.gtk4.menu_button.MenuButton.child].
      
      If [gid.gtk4.menu_button.MenuButton.direction] is not [gid.gtk4.types.ArrowType.None], a dropdown
      arrow will be shown next to the label.
  
      Params:
        label = the label
  */
  void setLabel(string label) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    gtk_menu_button_set_label(cast(GtkMenuButton*)this._cPtr, _label);
  }

  /**
      Sets the [gid.gio2.menu_model.MenuModel] from which the popup will be constructed.
      
      If menu_model is null, the button is disabled.
      
      A [gid.gtk4.popover.Popover] will be created from the menu model with
      [gid.gtk4.popover_menu.PopoverMenu.newFromModel]. Actions will be connected
      as documented for this function.
      
      If [gid.gtk4.menu_button.MenuButton.popover] is already set, it will be
      dissociated from the menu_button, and the property is set to null.
  
      Params:
        menuModel = a [gid.gio2.menu_model.MenuModel], or null to unset and disable the
            button
  */
  void setMenuModel(gid.gio2.menu_model.MenuModel menuModel = null) nothrow
  {
    gtk_menu_button_set_menu_model(cast(GtkMenuButton*)this._cPtr, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
  }

  /**
      Sets the [gid.gtk4.popover.Popover] that will be popped up when the menu_button is clicked.
      
      If popover is null, the button is disabled.
      
      If [gid.gtk4.menu_button.MenuButton.menuModel] is set, the menu model is dissociated
      from the menu_button, and the property is set to null.
  
      Params:
        popover = a [gid.gtk4.popover.Popover], or null to unset and
            disable the button
  */
  void setPopover(gid.gtk4.popover.Popover popover = null) nothrow
  {
    gtk_menu_button_set_popover(cast(GtkMenuButton*)this._cPtr, popover ? cast(GtkWidget*)popover._cPtr(No.Dup) : null);
  }

  /**
      Sets whether menu button acts as a primary menu.
      
      Primary menus can be opened with the <kbd>F10</kbd> key.
  
      Params:
        primary = whether the menubutton should act as a primary menu
  */
  void setPrimary(bool primary) nothrow
  {
    gtk_menu_button_set_primary(cast(GtkMenuButton*)this._cPtr, primary);
  }

  /**
      If true, an underline in the text indicates a mnemonic.
  
      Params:
        useUnderline = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline) nothrow
  {
    gtk_menu_button_set_use_underline(cast(GtkMenuButton*)this._cPtr, useUnderline);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to when the menu button is activated.
        
        The `::activate` signal on [gid.gtk4.menu_button.MenuButton] is an action signal and
        emitting it causes the button to pop up its menu.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk4.menu_button.MenuButton menuButton)`
  
          `menuButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk4.menu_button.MenuButton)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk4.menu_button.MenuButton.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtk4.menu_button.MenuButton]
class MenuButtonGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `active` property.
      Params:
        propval = Whether the menu button is active.
      Returns: Builder instance for fluent chaining
  */
  T active(bool propval) nothrow
  {
    return setProperty("active", propval);
  }

  /**
      Set `alwaysShowArrow` property.
      Params:
        propval = Whether to show a dropdown arrow even when using an icon or a custom child.
      Returns: Builder instance for fluent chaining
  */
  T alwaysShowArrow(bool propval) nothrow
  {
    return setProperty("always-show-arrow", propval);
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the size of the button can be made smaller than the natural
          size of its contents.
      Returns: Builder instance for fluent chaining
  */
  T canShrink(bool propval) nothrow
  {
    return setProperty("can-shrink", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `direction` property.
      Params:
        propval = The [gid.gtk4.types.ArrowType] representing the direction in which the
          menu or popover will be popped out.
      Returns: Builder instance for fluent chaining
  */
  T direction(gid.gtk4.types.ArrowType propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /**
      Set `hasFrame` property.
      Params:
        propval = Whether the button has a frame.
      Returns: Builder instance for fluent chaining
  */
  T hasFrame(bool propval) nothrow
  {
    return setProperty("has-frame", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon used to automatically populate the button.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = The label for the button.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gid.gio2.menu_model.MenuModel] from which the popup will be created.
          
          See [gid.gtk4.menu_button.MenuButton.setMenuModel] for the interaction
          with the [gid.gtk4.menu_button.MenuButton.popover] property.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `popover` property.
      Params:
        propval = The [gid.gtk4.popover.Popover] that will be popped up when the button is clicked.
      Returns: Builder instance for fluent chaining
  */
  T popover(gid.gtk4.popover.Popover propval) nothrow
  {
    return setProperty("popover", propval);
  }

  /**
      Set `primary` property.
      Params:
        propval = Whether the menu button acts as a primary menu.
          
          Primary menus can be opened using the <kbd>F10</kbd> key
      Returns: Builder instance for fluent chaining
  */
  T primary(bool propval) nothrow
  {
    return setProperty("primary", propval);
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set an underscore in the text indicates a mnemonic.
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }
}

/// Fluent builder for [gid.gtk4.menu_button.MenuButton]
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
