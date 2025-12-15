/// Module for [SplitButton] class
module adw.split_button;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.popover;
import gtk.types;
import gtk.widget;

/**
    A combined button and dropdown widget.
    
    <picture>
      <source srcset="split-button-dark.png" media="(prefers-color-scheme: dark)">
      <img src="split-button.png" alt="split-button">
    </picture>
    
    [adw.split_button.SplitButton] is typically used to present a set of actions in a menu,
    but allow access to one of them with a single click.
    
    The API is very similar to [gtk.button.Button] and [gtk.menu_button.MenuButton], see
    their documentation for details.
    
    ## CSS nodes
    
    ```
    splitbutton[.image-button][.text-button]
    ├── button
    │   ╰── <content>
    ├── separator
    ╰── menubutton
        ╰── button.toggle
            ╰── arrow
    ```
    
    [adw.split_button.SplitButton]'s CSS node is called `splitbutton`. It contains the css
    nodes: `button`, `separator`, `menubutton`. See [gtk.menu_button.MenuButton]
    documentation for the `menubutton` contents.
    
    The main CSS node will contain the `.image-button` or `.text-button` style
    classes matching the button contents. The nested button nodes will never
    contain them.
    
    ## Accessibility
    
    [adw.split_button.SplitButton] uses the [gtk.types.AccessibleRole.Group] role.
*/
class SplitButton : gtk.widget.Widget, gtk.actionable.Actionable
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
    return cast(void function())adw_split_button_get_type != &gidSymbolNotFound ? adw_split_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SplitButton self()
  {
    return this;
  }

  /**
      Get `canShrink` property.
      Returns: Whether the button can be smaller than the natural size of its contents.
      
      If set to `TRUE`, the label will ellipsize.
      
      See `property@Gtk.Button:can-shrink` and
      `property@Gtk.MenuButton:can-shrink`.
  */
  @property bool canShrink()
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the button can be smaller than the natural size of its contents.
        
        If set to `TRUE`, the label will ellipsize.
        
        See `property@Gtk.Button:can-shrink` and
        `property@Gtk.MenuButton:can-shrink`.
  */
  @property void canShrink(bool propval)
  {
    return setCanShrink(propval);
  }

  /**
      Get `child` property.
      Returns: The child widget.
      
      Setting the child widget will set `property@SplitButton:label` and
      `property@SplitButton:icon-name` to `NULL`.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
        
        Setting the child widget will set `property@SplitButton:label` and
        `property@SplitButton:icon-name` to `NULL`.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `direction` property.
      Returns: The direction in which the popup will be popped up.
      
      The dropdown arrow icon will point at the same direction.
      
      If the does not fit in the available space in the given direction, GTK will
      try its best to keep it inside the screen and fully visible.
      
      If you pass [gtk.types.ArrowType.None], it's equivalent to [gtk.types.ArrowType.Down].
  */
  @property gtk.types.ArrowType direction()
  {
    return getDirection();
  }

  /**
      Set `direction` property.
      Params:
        propval = The direction in which the popup will be popped up.
        
        The dropdown arrow icon will point at the same direction.
        
        If the does not fit in the available space in the given direction, GTK will
        try its best to keep it inside the screen and fully visible.
        
        If you pass [gtk.types.ArrowType.None], it's equivalent to [gtk.types.ArrowType.Down].
  */
  @property void direction(gtk.types.ArrowType propval)
  {
    return setDirection(propval);
  }

  /**
      Get `dropdownTooltip` property.
      Returns: The tooltip of the dropdown button.
      
      The tooltip can be marked up with the Pango text markup language.
  */
  @property string dropdownTooltip()
  {
    return getDropdownTooltip();
  }

  /**
      Set `dropdownTooltip` property.
      Params:
        propval = The tooltip of the dropdown button.
        
        The tooltip can be marked up with the Pango text markup language.
  */
  @property void dropdownTooltip(string propval)
  {
    return setDropdownTooltip(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the icon used to automatically populate the button.
      
      Setting the icon name will set `property@SplitButton:label` and
      `property@SplitButton:child` to `NULL`.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the icon used to automatically populate the button.
        
        Setting the icon name will set `property@SplitButton:label` and
        `property@SplitButton:child` to `NULL`.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `label` property.
      Returns: The label for the button.
      
      Setting the label will set `property@SplitButton:icon-name` and
      `property@SplitButton:child` to `NULL`.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The label for the button.
        
        Setting the label will set `property@SplitButton:icon-name` and
        `property@SplitButton:child` to `NULL`.
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `menuModel` property.
      Returns: The [gio.menu_model.MenuModel] from which the popup will be created.
      
      If the menu model is `NULL`, the dropdown is disabled.
      
      A [gtk.popover.Popover] will be created from the menu model with
      [gtk.popover_menu.PopoverMenu.newFromModel]. Actions will be connected as
      documented for this function.
      
      If `property@SplitButton:popover` is already set, it will be dissociated
      from the button, and the property is set to `NULL`.
  */
  @property gio.menu_model.MenuModel menuModel()
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = The [gio.menu_model.MenuModel] from which the popup will be created.
        
        If the menu model is `NULL`, the dropdown is disabled.
        
        A [gtk.popover.Popover] will be created from the menu model with
        [gtk.popover_menu.PopoverMenu.newFromModel]. Actions will be connected as
        documented for this function.
        
        If `property@SplitButton:popover` is already set, it will be dissociated
        from the button, and the property is set to `NULL`.
  */
  @property void menuModel(gio.menu_model.MenuModel propval)
  {
    return setMenuModel(propval);
  }

  /**
      Get `popover` property.
      Returns: The [gtk.popover.Popover] that will be popped up when the dropdown is clicked.
      
      If the popover is `NULL`, the dropdown is disabled.
      
      If `property@SplitButton:menu-model` is set, the menu model is dissociated
      from the button, and the property is set to `NULL`.
  */
  @property gtk.popover.Popover popover()
  {
    return getPopover();
  }

  /**
      Set `popover` property.
      Params:
        propval = The [gtk.popover.Popover] that will be popped up when the dropdown is clicked.
        
        If the popover is `NULL`, the dropdown is disabled.
        
        If `property@SplitButton:menu-model` is set, the menu model is dissociated
        from the button, and the property is set to `NULL`.
  */
  @property void popover(gtk.popover.Popover propval)
  {
    return setPopover(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an underline in the text indicates a mnemonic.
      
      See `property@SplitButton:label`.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an underline in the text indicates a mnemonic.
        
        See `property@SplitButton:label`.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new [adw.split_button.SplitButton].
      Returns: the newly created [adw.split_button.SplitButton]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_split_button_new();
    this(_cretval, No.Take);
  }

  /**
      gets whether the button can be smaller than the natural size of its contents.
      Returns: whether the button can shrink
  */
  bool getCanShrink()
  {
    bool _retval;
    _retval = cast(bool)adw_split_button_get_can_shrink(cast(AdwSplitButton*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child widget.
      Returns: the child widget
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = adw_split_button_get_child(cast(AdwSplitButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  alias getDirection = gtk.widget.Widget.getDirection;

  /**
      Gets the direction in which the popup will be popped up.
      Returns: the direction
  */
  gtk.types.ArrowType getDirection()
  {
    GtkArrowType _cretval;
    _cretval = adw_split_button_get_direction(cast(AdwSplitButton*)this._cPtr);
    gtk.types.ArrowType _retval = cast(gtk.types.ArrowType)_cretval;
    return _retval;
  }

  /**
      Gets the tooltip of the dropdown button of self.
      Returns: the dropdown tooltip of self
  */
  string getDropdownTooltip()
  {
    const(char)* _cretval;
    _cretval = adw_split_button_get_dropdown_tooltip(cast(AdwSplitButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name of the icon used to automatically populate the button.
      Returns: the icon name
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_split_button_get_icon_name(cast(AdwSplitButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the label for self.
      Returns: the label for self
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = adw_split_button_get_label(cast(AdwSplitButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the menu model from which the popup will be created.
      Returns: the menu model
  */
  gio.menu_model.MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = adw_split_button_get_menu_model(cast(AdwSplitButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the popover that will be popped up when the dropdown is clicked.
      Returns: the popover
  */
  gtk.popover.Popover getPopover()
  {
    GtkPopover* _cretval;
    _cretval = adw_split_button_get_popover(cast(AdwSplitButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.popover.Popover)(cast(GtkPopover*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether an underline in the text indicates a mnemonic.
      Returns: whether an underline in the text indicates a mnemonic
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)adw_split_button_get_use_underline(cast(AdwSplitButton*)this._cPtr);
    return _retval;
  }

  /**
      Dismisses the menu.
  */
  void popdown()
  {
    adw_split_button_popdown(cast(AdwSplitButton*)this._cPtr);
  }

  /**
      Pops up the menu.
  */
  void popup()
  {
    adw_split_button_popup(cast(AdwSplitButton*)this._cPtr);
  }

  /**
      Sets whether the button can be smaller than the natural size of its contents.
      
      If set to `TRUE`, the label will ellipsize.
      
      See [gtk.button.Button.setCanShrink] and
      [gtk.menu_button.MenuButton.setCanShrink].
  
      Params:
        canShrink = whether the button can shrink
  */
  void setCanShrink(bool canShrink)
  {
    adw_split_button_set_can_shrink(cast(AdwSplitButton*)this._cPtr, canShrink);
  }

  /**
      Sets the child widget.
      
      Setting the child widget will set `propertySplitButton:label` and
      `propertySplitButton:icon-name` to `NULL`.
  
      Params:
        child = the new child widget
  */
  void setChild(gtk.widget.Widget child = null)
  {
    adw_split_button_set_child(cast(AdwSplitButton*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  alias setDirection = gtk.widget.Widget.setDirection;

  /**
      Sets the direction in which the popup will be popped up.
      
      The dropdown arrow icon will point at the same direction.
      
      If the does not fit in the available space in the given direction, GTK will
      try its best to keep it inside the screen and fully visible.
      
      If you pass [gtk.types.ArrowType.None], it's equivalent to [gtk.types.ArrowType.Down].
  
      Params:
        direction = the direction
  */
  void setDirection(gtk.types.ArrowType direction)
  {
    adw_split_button_set_direction(cast(AdwSplitButton*)this._cPtr, direction);
  }

  /**
      Sets the tooltip of the dropdown button of self.
      
      The tooltip can be marked up with the Pango text markup language.
  
      Params:
        tooltip = the dropdown tooltip of self
  */
  void setDropdownTooltip(string tooltip)
  {
    const(char)* _tooltip = tooltip.toCString(No.Alloc);
    adw_split_button_set_dropdown_tooltip(cast(AdwSplitButton*)this._cPtr, _tooltip);
  }

  /**
      Sets the name of the icon used to automatically populate the button.
      
      Setting the icon name will set `propertySplitButton:label` and
      `propertySplitButton:child` to `NULL`.
  
      Params:
        iconName = the icon name to set
  */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_split_button_set_icon_name(cast(AdwSplitButton*)this._cPtr, _iconName);
  }

  /**
      Sets the label for self.
      
      Setting the label will set `propertySplitButton:icon-name` and
      `propertySplitButton:child` to `NULL`.
  
      Params:
        label = the label to set
  */
  void setLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    adw_split_button_set_label(cast(AdwSplitButton*)this._cPtr, _label);
  }

  /**
      Sets the menu model from which the popup will be created.
      
      If the menu model is `NULL`, the dropdown is disabled.
      
      A [gtk.popover.Popover] will be created from the menu model with
      [gtk.popover_menu.PopoverMenu.newFromModel]. Actions will be connected as
      documented for this function.
      
      If `propertySplitButton:popover` is already set, it will be dissociated from
      the button, and the property is set to `NULL`.
  
      Params:
        menuModel = the menu model
  */
  void setMenuModel(gio.menu_model.MenuModel menuModel = null)
  {
    adw_split_button_set_menu_model(cast(AdwSplitButton*)this._cPtr, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
  }

  /**
      Sets the popover that will be popped up when the dropdown is clicked.
      
      If the popover is `NULL`, the dropdown is disabled.
      
      If `propertySplitButton:menu-model` is set, the menu model is dissociated
      from the button, and the property is set to `NULL`.
  
      Params:
        popover = the popover
  */
  void setPopover(gtk.popover.Popover popover = null)
  {
    adw_split_button_set_popover(cast(AdwSplitButton*)this._cPtr, popover ? cast(GtkPopover*)popover._cPtr(No.Dup) : null);
  }

  /**
      Sets whether an underline in the text indicates a mnemonic.
      
      See `propertySplitButton:label`.
  
      Params:
        useUnderline = whether an underline in the text indicates a mnemonic
  */
  void setUseUnderline(bool useUnderline)
  {
    adw_split_button_set_use_underline(cast(AdwSplitButton*)this._cPtr, useUnderline);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted to animate press then release.
      
      This is an action signal. Applications should never connect to this signal,
      but use the `signalSplitButton::clicked` signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.split_button.SplitButton splitButton))
  
          `splitButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.split_button.SplitButton)))
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

  /**
      Connect to `Clicked` signal.
  
      Emitted when the button has been activated (pressed and released).
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(adw.split_button.SplitButton splitButton))
  
          `splitButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClicked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.split_button.SplitButton)))
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
    return connectSignalClosure("clicked", closure, after);
  }
}
