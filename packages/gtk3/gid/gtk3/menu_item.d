/// Module for [MenuItem] class
module gid.gtk3.menu_item;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.core.utils;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk3.actionable;
import gid.gtk3.actionable_mixin;
import gid.gtk3.activatable;
import gid.gtk3.activatable_mixin;
import gid.gtk3.bin;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.container;
import gid.gtk3.menu;
import gid.gtk3.types;
import gid.gtk3.widget;

/**
    The #GtkMenuItem widget and the derived widgets are the only valid
    children for menus. Their function is to correctly handle highlighting,
    alignment, events and submenus.
    
    As a GtkMenuItem derives from #GtkBin it can hold any valid child widget,
    although only a few are really useful.
    
    By default, a GtkMenuItem sets a #GtkAccelLabel as its child.
    GtkMenuItem has direct functions to set the label and its mnemonic.
    For more advanced label settings, you can fetch the child widget from the GtkBin.
    
    An example for setting markup and accelerator on a MenuItem:
    
    ```c
    GtkWidget *menu_item = gtk_menu_item_new_with_label ("Example Menu Item");
    
    GtkWidget *child = gtk_bin_get_child (GTK_BIN (menu_item));
    gtk_label_set_markup (GTK_LABEL (child), "<i>new label</i> with <b>markup</b>");
    gtk_accel_label_set_accel (GTK_ACCEL_LABEL (child), GDK_KEY_1, 0);
    ```
    
    # GtkMenuItem as GtkBuildable
    
    The GtkMenuItem implementation of the #GtkBuildable interface supports
    adding a submenu by specifying “submenu” as the “type” attribute of
    a `<child>` element.
    
    An example of UI definition fragment with submenus:
    
    ```xml
    <object class="GtkMenuItem">
      <child type="submenu">
        <object class="GtkMenu"/>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```plain
    menuitem
    ├── <child>
    ╰── [arrow.right]
    ```
    
    GtkMenuItem has a single CSS node with name menuitem. If the menuitem
    has a submenu, it gets another CSS node with name arrow, which has
    the .left or .right style class.
*/
class MenuItem : gid.gtk3.bin.Bin, gid.gtk3.actionable.Actionable, gid.gtk3.activatable.Activatable
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
    return cast(void function())gtk_menu_item_get_type != &gidSymbolNotFound ? gtk_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkMenuItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.menu_item.MenuItem]
      Returns: New builder object
  */
  static MenuItemGidBuilder builder() nothrow
  {
    return new MenuItemGidBuilder;
  }

  /**
      Get `accelPath` property.
      Returns: Sets the accelerator path of the menu item, through which runtime
        changes of the menu item's accelerator caused by the user can be
        identified and saved to persistant storage.
  */
  @property string accelPath() nothrow
  {
    return getAccelPath();
  }

  /**
      Set `accelPath` property.
      Params:
        propval = Sets the accelerator path of the menu item, through which runtime
          changes of the menu item's accelerator caused by the user can be
          identified and saved to persistant storage.
  */
  @property void accelPath(string propval) nothrow
  {
    setAccelPath(propval);
  }

  /**
      Get `label` property.
      Returns: The text for the child label.
  */
  @property string label() nothrow
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The text for the child label.
  */
  @property void label(string propval) nothrow
  {
    setLabel(propval);
  }

  /**
      Get `rightJustified` property.
      Returns: Sets whether the menu item appears justified
        at the right side of a menu bar.
  */
  @property bool rightJustified() nothrow
  {
    return getRightJustified();
  }

  /**
      Set `rightJustified` property.
      Params:
        propval = Sets whether the menu item appears justified
          at the right side of a menu bar.
  */
  @property void rightJustified(bool propval) nothrow
  {
    setRightJustified(propval);
  }

  /**
      Get `submenu` property.
      Returns: The submenu attached to the menu item, or null if it has none.
  */
  @property gid.gtk3.menu.Menu submenu() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.menu.Menu)("submenu");
  }

  /**
      Set `submenu` property.
      Params:
        propval = The submenu attached to the menu item, or null if it has none.
  */
  @property void submenu(gid.gtk3.menu.Menu propval) nothrow
  {
    setSubmenu(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: true if underlines in the text indicate mnemonics.
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = true if underlines in the text indicate mnemonics.
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  mixin ActionableT!();
  mixin ActivatableT!();

  /**
      Creates a new #GtkMenuItem.
      Returns: the newly created #GtkMenuItem
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_menu_item_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkMenuItem whose child is a #GtkLabel.
  
      Params:
        label = the text for the label
      Returns: the newly created #GtkMenuItem
  */
  static gid.gtk3.menu_item.MenuItem newWithLabel(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_menu_item_new_with_label(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu_item.MenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkMenuItem containing a label.
      
      The label will be created using [gid.gtk4.label.Label.newWithMnemonic],
      so underscores in label indicate the mnemonic for the menu item.
  
      Params:
        label = The text of the button, with an underscore in front of the
              mnemonic character
      Returns: a new #GtkMenuItem
  */
  static gid.gtk3.menu_item.MenuItem newWithMnemonic(string label) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_menu_item_new_with_mnemonic(_label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.menu_item.MenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Emits the #GtkMenuItem::activate signal on the given item
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncActivate()
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.activate)
      return;

    _klass.activate(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Signal emitted when the item is activated, but also
         if the menu item has a submenu.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncActivateItem` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncActivateItem()
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.activateItem)
      return;

    _klass.activateItem(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Emits the #GtkMenuItem::deselect signal on the given item.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncDeselect` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncDeselect()
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.deselect)
      return;

    _klass.deselect(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Sets text on the menu_item label
      Returns: The text in the menu_item label. This is the internal
          string used by the label, and must not be modified.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetLabel` to chain up from an override.
      Overriding it from D is not supported (callback string return value with transfer none is not supported).
  */
  protected string vfuncGetLabel()
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.getLabel)
      return typeof(return).init;

    const(char)* _cretval;
    _cretval = _klass.getLabel(cast(GtkMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Emits the #GtkMenuItem::select signal on the given item.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSelect` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncSelect()
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.select)
      return;

    _klass.select(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Sets text on the menu_item label
  
      Params:
        label = the text you want to set
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncSetLabel` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncSetLabel(string label)
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.setLabel)
      return;

    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _klass.setLabel(cast(GtkMenuItem*)this._cPtr, _label);
  }

  /**
      Emits the #GtkMenuItem::toggle-size-allocate signal on the given item.
  
      Params:
        allocation = the allocation to use as signal data.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggleSizeAllocate` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncToggleSizeAllocate(int allocation)
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.toggleSizeAllocate)
      return;

    _klass.toggleSizeAllocate(cast(GtkMenuItem*)this._cPtr, allocation);
  }

  /**
      Emits the #GtkMenuItem::toggle-size-request signal on the given item.
  
      Params:
        requisition = the requisition to use as signal data.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncToggleSizeRequest` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gobject.object.GObjectSubclass`).
  */
  protected void vfuncToggleSizeRequest(ref int requisition)
  {
    auto _klass = cast(GtkMenuItemClass*)_vfuncClass;
    if (!_klass.toggleSizeRequest)
      return;

    _klass.toggleSizeRequest(cast(GtkMenuItem*)this._cPtr, cast(int*)&requisition);
  }

  alias activate = gid.gtk3.widget.Widget.activate;

  /**
      Emits the #GtkMenuItem::activate signal on the given item
  */
  void activate() nothrow
  {
    gtk_menu_item_activate(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Emits the #GtkMenuItem::deselect signal on the given item.
  */
  void deselect() nothrow
  {
    gtk_menu_item_deselect(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Retrieve the accelerator path that was previously set on menu_item.
      
      See [gid.gtk3.menu_item.MenuItem.setAccelPath] for details.
      Returns: the accelerator path corresponding to
            this menu item’s functionality, or null if not set
  */
  string getAccelPath() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_menu_item_get_accel_path(cast(GtkMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets text on the menu_item label
      Returns: The text in the menu_item label. This is the internal
          string used by the label, and must not be modified.
  */
  string getLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_menu_item_get_label(cast(GtkMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the menu_item reserves space for
      the submenu indicator, regardless if it has a submenu
      or not.
      Returns: true if menu_item always reserves space for the
            submenu indicator
  */
  bool getReserveIndicator() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_item_get_reserve_indicator(cast(GtkMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the menu item appears justified at the right
      side of the menu bar.
      Returns: true if the menu item will appear at the
          far right if added to a menu bar.
  
      Deprecated: See [gid.gtk3.menu_item.MenuItem.setRightJustified]
  */
  bool getRightJustified() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_item_get_right_justified(cast(GtkMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the submenu underneath this menu item, if any.
      See [gid.gtk3.menu_item.MenuItem.setSubmenu].
      Returns: submenu for this menu item, or null if none
  */
  gid.gtk3.widget.Widget getSubmenu() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_item_get_submenu(cast(GtkMenuItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if an underline in the text indicates the next character
      should be used for the mnemonic accelerator key.
      Returns: true if an embedded underline in the label
            indicates the mnemonic accelerator key.
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_item_get_use_underline(cast(GtkMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkMenuItem::select signal on the given item.
  */
  void select() nothrow
  {
    gtk_menu_item_select(cast(GtkMenuItem*)this._cPtr);
  }

  alias setAccelPath = gid.gtk3.widget.Widget.setAccelPath;

  /**
      Set the accelerator path on menu_item, through which runtime
      changes of the menu item’s accelerator caused by the user can be
      identified and saved to persistent storage (see [gid.gtk3.accel_map.AccelMap.save]
      on this). To set up a default accelerator for this menu item, call
      [gid.gtk3.accel_map.AccelMap.addEntry] with the same accel_path. See also
      [gid.gtk3.accel_map.AccelMap.addEntry] on the specifics of accelerator paths,
      and [gid.gtk3.menu.Menu.setAccelPath] for a more convenient variant of
      this function.
      
      This function is basically a convenience wrapper that handles
      calling [gid.gtk3.widget.Widget.setAccelPath] with the appropriate accelerator
      group for the menu item.
      
      Note that you do need to set an accelerator on the parent menu with
      [gid.gtk3.menu.Menu.setAccelGroup] for this to work.
      
      Note that accel_path string will be stored in a #GQuark.
      Therefore, if you pass a static string, you can save some memory
      by interning it first with [gid.glib2.global.internStaticString].
  
      Params:
        accelPath = accelerator path, corresponding to this menu
              item’s functionality, or null to unset the current path.
  */
  void setAccelPath(string accelPath = null) nothrow
  {
    const(char)* _accelPath = accelPath.toCString!(No.Malloc, Yes.Nullable);
    gtk_menu_item_set_accel_path(cast(GtkMenuItem*)this._cPtr, _accelPath);
  }

  /**
      Sets text on the menu_item label
  
      Params:
        label = the text you want to set
  */
  void setLabel(string label) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    gtk_menu_item_set_label(cast(GtkMenuItem*)this._cPtr, _label);
  }

  /**
      Sets whether the menu_item should reserve space for
      the submenu indicator, regardless if it actually has
      a submenu or not.
      
      There should be little need for applications to call
      this functions.
  
      Params:
        reserve = the new value
  */
  void setReserveIndicator(bool reserve) nothrow
  {
    gtk_menu_item_set_reserve_indicator(cast(GtkMenuItem*)this._cPtr, reserve);
  }

  /**
      Sets whether the menu item appears justified at the right
      side of a menu bar. This was traditionally done for “Help”
      menu items, but is now considered a bad idea. (If the widget
      layout is reversed for a right-to-left language like Hebrew
      or Arabic, right-justified-menu-items appear at the left.)
  
      Params:
        rightJustified = if true the menu item will appear at the
            far right if added to a menu bar
  
      Deprecated: If you insist on using it, use
          [gid.gtk4.widget.Widget.setHexpand] and [gid.gtk4.widget.Widget.setHalign].
  */
  void setRightJustified(bool rightJustified) nothrow
  {
    gtk_menu_item_set_right_justified(cast(GtkMenuItem*)this._cPtr, rightJustified);
  }

  /**
      Sets or replaces the menu item’s submenu, or removes it when a null
      submenu is passed.
  
      Params:
        submenu = the submenu, or null
  */
  void setSubmenu(gid.gtk3.menu.Menu submenu = null) nothrow
  {
    gtk_menu_item_set_submenu(cast(GtkMenuItem*)this._cPtr, submenu ? cast(GtkWidget*)submenu._cPtr(No.Dup) : null);
  }

  /**
      If true, an underline in the text indicates the next character
      should be used for the mnemonic accelerator key.
  
      Params:
        setting = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool setting) nothrow
  {
    gtk_menu_item_set_use_underline(cast(GtkMenuItem*)this._cPtr, setting);
  }

  /**
      Emits the #GtkMenuItem::toggle-size-allocate signal on the given item.
  
      Params:
        allocation = the allocation to use as signal data.
  */
  void toggleSizeAllocate(int allocation) nothrow
  {
    gtk_menu_item_toggle_size_allocate(cast(GtkMenuItem*)this._cPtr, allocation);
  }

  /**
      Emits the #GtkMenuItem::toggle-size-request signal on the given item.
  
      Params:
        requisition = the requisition to use as signal data.
  */
  void toggleSizeRequest(ref int requisition) nothrow
  {
    gtk_menu_item_toggle_size_request(cast(GtkMenuItem*)this._cPtr, cast(int*)&requisition);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the item is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu_item.MenuItem menuItem)`
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu_item.MenuItem)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.activate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate", closure, after);
  }

  /**
      Connect to `ActivateItem` signal.
  
      Emitted when the item is activated, but also if the menu item has a
        submenu. For normal applications, the relevant signal is
        #GtkMenuItem::activate.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu_item.MenuItem menuItem)`
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivateItem(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu_item.MenuItem)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.activateItem");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activate-item", closure, after);
  }

  /**
      Connect to `Deselect` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu_item.MenuItem menuItem)`
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeselect(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu_item.MenuItem)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.deselect");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deselect", closure, after);
  }

  /**
      Connect to `Select` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.menu_item.MenuItem menuItem)`
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelect(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.menu_item.MenuItem)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.select");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("select", closure, after);
  }

  /**
      Connect to `ToggleSizeAllocate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int object, gid.gtk3.menu_item.MenuItem menuItem)`
  
          `object`  (optional)
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleSizeAllocate(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.menu_item.MenuItem)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.toggleSizeAllocate");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-size-allocate", closure, after);
  }

  /**
      Connect to `ToggleSizeRequest` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(void* object, gid.gtk3.menu_item.MenuItem menuItem)`
  
          `object`  (optional)
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectToggleSizeRequest(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.gtk3.menu_item.MenuItem)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.toggleSizeRequest");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-size-request", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gobject.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from MenuItem
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.menu_item.MenuItem), T.stringof ~ " is not derived from gid.gtk3.menu_item.MenuItem");

    gid.gtk3.container.Container._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivate", true)[0]) == gid.gtk3.menu_item.MenuItem))
      _installVfunc(klass, "activate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncActivateItem", true)[0]) == gid.gtk3.menu_item.MenuItem))
      _installVfunc(klass, "activate_item");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeselect", true)[0]) == gid.gtk3.menu_item.MenuItem))
      _installVfunc(klass, "deselect");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetLabel", true)[0]) == gid.gtk3.menu_item.MenuItem))
      static assert(0, "Overriding gid.gtk3.menu_item.MenuItem.vfuncGetLabel is not supported: callback string return value with transfer none is not supported");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelect", true)[0]) == gid.gtk3.menu_item.MenuItem))
      _installVfunc(klass, "select");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetLabel", true)[0]) == gid.gtk3.menu_item.MenuItem))
      _installVfunc(klass, "set_label");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleSizeAllocate", true)[0]) == gid.gtk3.menu_item.MenuItem))
      _installVfunc(klass, "toggle_size_allocate");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncToggleSizeRequest", true)[0]) == gid.gtk3.menu_item.MenuItem))
      _installVfunc(klass, "toggle_size_request");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkMenuItemClass*)klass;

    switch (vfunc)
    {
      case "activate":
      {
        static extern(C) void _vfuncActivateTramp(GtkMenuItem* menuItem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_item.MenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuItem);
            if (_klass.activate)
              return (cast(typeof(&_vfuncActivateTramp))_klass.activate)(menuItem);
            return;
          }

          try
          {
            _obj.vfuncActivate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.vfuncActivate");
          }
        }

        _klass.activate = cast(typeof(_klass.activate))&_vfuncActivateTramp;
        break;
      }
      case "activate_item":
      {
        static extern(C) void _vfuncActivateItemTramp(GtkMenuItem* menuItem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_item.MenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuItem);
            if (_klass.activateItem)
              return (cast(typeof(&_vfuncActivateItemTramp))_klass.activateItem)(menuItem);
            return;
          }

          try
          {
            _obj.vfuncActivateItem();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.vfuncActivateItem");
          }
        }

        _klass.activateItem = cast(typeof(_klass.activateItem))&_vfuncActivateItemTramp;
        break;
      }
      case "deselect":
      {
        static extern(C) void _vfuncDeselectTramp(GtkMenuItem* menuItem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_item.MenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuItem);
            if (_klass.deselect)
              return (cast(typeof(&_vfuncDeselectTramp))_klass.deselect)(menuItem);
            return;
          }

          try
          {
            _obj.vfuncDeselect();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.vfuncDeselect");
          }
        }

        _klass.deselect = cast(typeof(_klass.deselect))&_vfuncDeselectTramp;
        break;
      }
      case "select":
      {
        static extern(C) void _vfuncSelectTramp(GtkMenuItem* menuItem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_item.MenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuItem);
            if (_klass.select)
              return (cast(typeof(&_vfuncSelectTramp))_klass.select)(menuItem);
            return;
          }

          try
          {
            _obj.vfuncSelect();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.vfuncSelect");
          }
        }

        _klass.select = cast(typeof(_klass.select))&_vfuncSelectTramp;
        break;
      }
      case "set_label":
      {
        static extern(C) void _vfuncSetLabelTramp(GtkMenuItem* menuItem, const(char)* label) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_item.MenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuItem);
            if (_klass.setLabel)
              return (cast(typeof(&_vfuncSetLabelTramp))_klass.setLabel)(menuItem, label);
            return;
          }

          string _label = label.fromCString!(No.Free);

          try
          {
            _obj.vfuncSetLabel(_label);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.vfuncSetLabel");
          }
        }

        _klass.setLabel = cast(typeof(_klass.setLabel))&_vfuncSetLabelTramp;
        break;
      }
      case "toggle_size_allocate":
      {
        static extern(C) void _vfuncToggleSizeAllocateTramp(GtkMenuItem* menuItem, int allocation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_item.MenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuItem);
            if (_klass.toggleSizeAllocate)
              return (cast(typeof(&_vfuncToggleSizeAllocateTramp))_klass.toggleSizeAllocate)(menuItem, allocation);
            return;
          }

          try
          {
            _obj.vfuncToggleSizeAllocate(allocation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.vfuncToggleSizeAllocate");
          }
        }

        _klass.toggleSizeAllocate = cast(typeof(_klass.toggleSizeAllocate))&_vfuncToggleSizeAllocateTramp;
        break;
      }
      case "toggle_size_request":
      {
        static extern(C) void _vfuncToggleSizeRequestTramp(GtkMenuItem* menuItem, int* requisition) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.menu_item.MenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)menuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)menuItem);
            if (_klass.toggleSizeRequest)
              return (cast(typeof(&_vfuncToggleSizeRequestTramp))_klass.toggleSizeRequest)(menuItem, requisition);
            return;
          }

          try
          {
            _obj.vfuncToggleSizeRequest(*requisition);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.menu_item.MenuItem.vfuncToggleSizeRequest");
          }
        }

        _klass.toggleSizeRequest = cast(typeof(_klass.toggleSizeRequest))&_vfuncToggleSizeRequestTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.menu_item.MenuItem]
class MenuItemGidBuilderImpl(T) : gid.gtk3.bin.BinGidBuilderImpl!T, gid.gtk3.actionable.ActionableGidBuilderImpl!T, gid.gtk3.activatable.ActivatableGidBuilderImpl!T
{

  mixin ActionableGidBuilderT!();
  mixin ActivatableGidBuilderT!();

  /**
      Set `accelPath` property.
      Params:
        propval = Sets the accelerator path of the menu item, through which runtime
          changes of the menu item's accelerator caused by the user can be
          identified and saved to persistant storage.
      Returns: Builder instance for fluent chaining
  */
  T accelPath(string propval) nothrow
  {
    return setProperty("accel-path", propval);
  }

  /**
      Set `label` property.
      Params:
        propval = The text for the child label.
      Returns: Builder instance for fluent chaining
  */
  T label(string propval) nothrow
  {
    return setProperty("label", propval);
  }

  /**
      Set `rightJustified` property.
      Params:
        propval = Sets whether the menu item appears justified
          at the right side of a menu bar.
      Returns: Builder instance for fluent chaining
  */
  T rightJustified(bool propval) nothrow
  {
    return setProperty("right-justified", propval);
  }

  /**
      Set `submenu` property.
      Params:
        propval = The submenu attached to the menu item, or null if it has none.
      Returns: Builder instance for fluent chaining
  */
  T submenu(gid.gtk3.menu.Menu propval) nothrow
  {
    return setProperty("submenu", propval);
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = true if underlines in the text indicate mnemonics.
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }
}

/// Fluent builder for [gid.gtk3.menu_item.MenuItem]
final class MenuItemGidBuilder : MenuItemGidBuilderImpl!MenuItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuItem build() nothrow
  {
    return new MenuItem(cast(void*)createGObject(MenuItem._getGType), Yes.Take);
  }
}
