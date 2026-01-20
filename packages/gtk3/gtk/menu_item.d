/// Module for [MenuItem] class
module gtk.menu_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.bin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.types;
import gtk.widget;

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
class MenuItem : gtk.bin.Bin, gtk.actionable.Actionable, gtk.activatable.Activatable
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
    return cast(void function())gtk_menu_item_get_type != &gidSymbolNotFound ? gtk_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuItem self()
  {
    return this;
  }

  /**
      Get `accelPath` property.
      Returns: Sets the accelerator path of the menu item, through which runtime
        changes of the menu item's accelerator caused by the user can be
        identified and saved to persistant storage.
  */
  @property string accelPath()
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
  @property void accelPath(string propval)
  {
    return setAccelPath(propval);
  }

  /**
      Get `label` property.
      Returns: The text for the child label.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The text for the child label.
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `rightJustified` property.
      Returns: Sets whether the menu item appears justified
        at the right side of a menu bar.
  */
  @property bool rightJustified()
  {
    return getRightJustified();
  }

  /**
      Set `rightJustified` property.
      Params:
        propval = Sets whether the menu item appears justified
          at the right side of a menu bar.
  */
  @property void rightJustified(bool propval)
  {
    return setRightJustified(propval);
  }

  /**
      Get `submenu` property.
      Returns: The submenu attached to the menu item, or null if it has none.
  */
  @property gtk.menu.Menu submenu()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.menu.Menu)("submenu");
  }

  /**
      Set `submenu` property.
      Params:
        propval = The submenu attached to the menu item, or null if it has none.
  */
  @property void submenu(gtk.menu.Menu propval)
  {
    return setSubmenu(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: true if underlines in the text indicate mnemonics.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = true if underlines in the text indicate mnemonics.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  mixin ActionableT!();
  mixin ActivatableT!();

  /**
      Creates a new #GtkMenuItem.
      Returns: the newly created #GtkMenuItem
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_item_new();
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkMenuItem whose child is a #GtkLabel.
  
      Params:
        label = the text for the label
      Returns: the newly created #GtkMenuItem
  */
  static gtk.menu_item.MenuItem newWithLabel(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_menu_item_new_with_label(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.menu_item.MenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkMenuItem containing a label.
      
      The label will be created using [gtk.label.Label.newWithMnemonic],
      so underscores in label indicate the mnemonic for the menu item.
  
      Params:
        label = The text of the button, with an underscore in front of the
              mnemonic character
      Returns: a new #GtkMenuItem
  */
  static gtk.menu_item.MenuItem newWithMnemonic(string label)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_menu_item_new_with_mnemonic(_label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.menu_item.MenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  alias activate = gtk.widget.Widget.activate;

  /**
      Emits the #GtkMenuItem::activate signal on the given item
  */
  void activate()
  {
    gtk_menu_item_activate(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Emits the #GtkMenuItem::deselect signal on the given item.
  */
  void deselect()
  {
    gtk_menu_item_deselect(cast(GtkMenuItem*)this._cPtr);
  }

  /**
      Retrieve the accelerator path that was previously set on menu_item.
      
      See [gtk.menu_item.MenuItem.setAccelPath] for details.
      Returns: the accelerator path corresponding to
            this menu item’s functionality, or null if not set
  */
  string getAccelPath()
  {
    const(char)* _cretval;
    _cretval = gtk_menu_item_get_accel_path(cast(GtkMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets text on the menu_item label
      Returns: The text in the menu_item label. This is the internal
          string used by the label, and must not be modified.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_menu_item_get_label(cast(GtkMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the menu_item reserves space for
      the submenu indicator, regardless if it has a submenu
      or not.
      Returns: true if menu_item always reserves space for the
            submenu indicator
  */
  bool getReserveIndicator()
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
  
      Deprecated: See [gtk.menu_item.MenuItem.setRightJustified]
  */
  bool getRightJustified()
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_item_get_right_justified(cast(GtkMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the submenu underneath this menu item, if any.
      See [gtk.menu_item.MenuItem.setSubmenu].
      Returns: submenu for this menu item, or null if none
  */
  gtk.widget.Widget getSubmenu()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_item_get_submenu(cast(GtkMenuItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if an underline in the text indicates the next character
      should be used for the mnemonic accelerator key.
      Returns: true if an embedded underline in the label
            indicates the mnemonic accelerator key.
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)gtk_menu_item_get_use_underline(cast(GtkMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Emits the #GtkMenuItem::select signal on the given item.
  */
  void select()
  {
    gtk_menu_item_select(cast(GtkMenuItem*)this._cPtr);
  }

  alias setAccelPath = gtk.widget.Widget.setAccelPath;

  /**
      Set the accelerator path on menu_item, through which runtime
      changes of the menu item’s accelerator caused by the user can be
      identified and saved to persistent storage (see [gtk.accel_map.AccelMap.save]
      on this). To set up a default accelerator for this menu item, call
      [gtk.accel_map.AccelMap.addEntry] with the same accel_path. See also
      [gtk.accel_map.AccelMap.addEntry] on the specifics of accelerator paths,
      and [gtk.menu.Menu.setAccelPath] for a more convenient variant of
      this function.
      
      This function is basically a convenience wrapper that handles
      calling [gtk.widget.Widget.setAccelPath] with the appropriate accelerator
      group for the menu item.
      
      Note that you do need to set an accelerator on the parent menu with
      [gtk.menu.Menu.setAccelGroup] for this to work.
      
      Note that accel_path string will be stored in a #GQuark.
      Therefore, if you pass a static string, you can save some memory
      by interning it first with [glib.global.internStaticString].
  
      Params:
        accelPath = accelerator path, corresponding to this menu
              item’s functionality, or null to unset the current path.
  */
  void setAccelPath(string accelPath = null)
  {
    const(char)* _accelPath = accelPath.toCString(No.Alloc);
    gtk_menu_item_set_accel_path(cast(GtkMenuItem*)this._cPtr, _accelPath);
  }

  /**
      Sets text on the menu_item label
  
      Params:
        label = the text you want to set
  */
  void setLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
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
  void setReserveIndicator(bool reserve)
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
          [gtk.widget.Widget.setHexpand] and [gtk.widget.Widget.setHalign].
  */
  void setRightJustified(bool rightJustified)
  {
    gtk_menu_item_set_right_justified(cast(GtkMenuItem*)this._cPtr, rightJustified);
  }

  /**
      Sets or replaces the menu item’s submenu, or removes it when a null
      submenu is passed.
  
      Params:
        submenu = the submenu, or null
  */
  void setSubmenu(gtk.menu.Menu submenu = null)
  {
    gtk_menu_item_set_submenu(cast(GtkMenuItem*)this._cPtr, submenu ? cast(GtkWidget*)submenu._cPtr(No.Dup) : null);
  }

  /**
      If true, an underline in the text indicates the next character
      should be used for the mnemonic accelerator key.
  
      Params:
        setting = true if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool setting)
  {
    gtk_menu_item_set_use_underline(cast(GtkMenuItem*)this._cPtr, setting);
  }

  /**
      Emits the #GtkMenuItem::toggle-size-allocate signal on the given item.
  
      Params:
        allocation = the allocation to use as signal data.
  */
  void toggleSizeAllocate(int allocation)
  {
    gtk_menu_item_toggle_size_allocate(cast(GtkMenuItem*)this._cPtr, allocation);
  }

  /**
      Emits the #GtkMenuItem::toggle-size-request signal on the given item.
  
      Params:
        requisition = the requisition to use as signal data.
  */
  void toggleSizeRequest(ref int requisition)
  {
    gtk_menu_item_toggle_size_request(cast(GtkMenuItem*)this._cPtr, cast(int*)&requisition);
  }

  /**
      Connect to `Activate` signal.
  
      Emitted when the item is activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.menu_item.MenuItem menuItem))
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.menu_item.MenuItem)))
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
      Connect to `ActivateItem` signal.
  
      Emitted when the item is activated, but also if the menu item has a
        submenu. For normal applications, the relevant signal is
        #GtkMenuItem::activate.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.menu_item.MenuItem menuItem))
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectActivateItem(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.menu_item.MenuItem)))
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
    return connectSignalClosure("activate-item", closure, after);
  }

  /**
      Connect to `Deselect` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.menu_item.MenuItem menuItem))
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectDeselect(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.menu_item.MenuItem)))
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
    return connectSignalClosure("deselect", closure, after);
  }

  /**
      Connect to `Select` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.menu_item.MenuItem menuItem))
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectSelect(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.menu_item.MenuItem)))
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
    return connectSignalClosure("select", closure, after);
  }

  /**
      Connect to `ToggleSizeAllocate` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int object, gtk.menu_item.MenuItem menuItem))
  
          `object`  (optional)
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleSizeAllocate(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.menu_item.MenuItem)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-size-allocate", closure, after);
  }

  /**
      Connect to `ToggleSizeRequest` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(void* object, gtk.menu_item.MenuItem menuItem))
  
          `object`  (optional)
  
          `menuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectToggleSizeRequest(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == void*)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gtk.menu_item.MenuItem)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("toggle-size-request", closure, after);
  }
}
