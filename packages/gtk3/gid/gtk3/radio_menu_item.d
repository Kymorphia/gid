/// Module for [RadioMenuItem] class
module gid.gtk3.radio_menu_item;

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
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.check_menu_item;
import gid.gtk3.types;

/**
    A radio menu item is a check menu item that belongs to a group. At each
    instant exactly one of the radio menu items from a group is selected.
    
    The group list does not need to be freed, as each #GtkRadioMenuItem will
    remove itself and its list item when it is destroyed.
    
    The correct way to create a group of radio menu items is approximatively
    this:
    
    ## How to create a group of radio menu items.
    
    ```c
    GSList *group = NULL;
    GtkWidget *item;
    gint i;
    
    for (i = 0; i < 5; i++)
    {
      item = gtk_radio_menu_item_new_with_label (group, "This is an example");
      group = gtk_radio_menu_item_get_group (GTK_RADIO_MENU_ITEM (item));
      if (i == 1)
        gtk_check_menu_item_set_active (GTK_CHECK_MENU_ITEM (item), TRUE);
    }
    ```
    
    # CSS nodes
    
    ```plain
    menuitem
    ├── radio.left
    ╰── <child>
    ```
    
    GtkRadioMenuItem has a main CSS node with name menuitem, and a subnode
    with name radio, which gets the .left or .right style class.
*/
class RadioMenuItem : gid.gtk3.check_menu_item.CheckMenuItem
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
    return cast(void function())gtk_radio_menu_item_get_type != &gidSymbolNotFound ? gtk_radio_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkRadioMenuItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioMenuItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.radio_menu_item.RadioMenuItem]
      Returns: New builder object
  */
  static RadioMenuItemGidBuilder builder() nothrow
  {
    return new RadioMenuItemGidBuilder;
  }

  /**
      Set `group` property.
      Params:
        propval = The radio menu item whose group this widget belongs to.
  */
  @property void group(gid.gtk3.radio_menu_item.RadioMenuItem propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.radio_menu_item.RadioMenuItem)("group", propval);
  }

  /**
      Creates a new #GtkRadioMenuItem.
  
      Params:
        group = the group to which the
            radio menu item is to be attached, or null
      Returns: a new #GtkRadioMenuItem
  */
  this(gid.gtk3.radio_menu_item.RadioMenuItem[] group = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, group !is null), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      auto _group = gSListFromD!(gid.gtk3.radio_menu_item.RadioMenuItem)(group);
      scope(exit) containerFree!(GSList*, gid.gtk3.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
      _cretval = gtk_radio_menu_item_new(_group);
      this(_cretval, No.Take);
    }
  }

  /**
      Creates a new #GtkRadioMenuItem adding it to the same group as group.
  
      Params:
        group = An existing #GtkRadioMenuItem
      Returns: The new #GtkRadioMenuItem
  */
  static gid.gtk3.radio_menu_item.RadioMenuItem newFromWidget(gid.gtk3.radio_menu_item.RadioMenuItem group = null) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_radio_menu_item_new_from_widget(group ? cast(GtkRadioMenuItem*)group._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioMenuItem whose child is a simple #GtkLabel.
  
      Params:
        group = group the radio menu item is inside, or null
        label = the text for the label
      Returns: A new #GtkRadioMenuItem
  */
  static gid.gtk3.radio_menu_item.RadioMenuItem newWithLabel(gid.gtk3.radio_menu_item.RadioMenuItem[] group, string label) nothrow
  {
    GtkWidget* _cretval;
    auto _group = gSListFromD!(gid.gtk3.radio_menu_item.RadioMenuItem)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_menu_item_new_with_label(_group, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new GtkRadioMenuItem whose child is a simple GtkLabel.
      The new #GtkRadioMenuItem is added to the same group as group.
  
      Params:
        group = an existing #GtkRadioMenuItem
        label = the text for the label
      Returns: The new #GtkRadioMenuItem
  */
  static gid.gtk3.radio_menu_item.RadioMenuItem newWithLabelFromWidget(gid.gtk3.radio_menu_item.RadioMenuItem group = null, string label = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_radio_menu_item_new_with_label_from_widget(group ? cast(GtkRadioMenuItem*)group._cPtr(No.Dup) : null, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioMenuItem containing a label. The label
      will be created using [gid.gtk4.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the menu item.
  
      Params:
        group = group the radio menu item is inside, or null
        label = the text of the button, with an underscore in front of the
                  mnemonic character
      Returns: a new #GtkRadioMenuItem
  */
  static gid.gtk3.radio_menu_item.RadioMenuItem newWithMnemonic(gid.gtk3.radio_menu_item.RadioMenuItem[] group, string label) nothrow
  {
    GtkWidget* _cretval;
    auto _group = gSListFromD!(gid.gtk3.radio_menu_item.RadioMenuItem)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_radio_menu_item_new_with_mnemonic(_group, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new GtkRadioMenuItem containing a label. The label will be
      created using [gid.gtk4.label.Label.newWithMnemonic], so underscores in label
      indicate the mnemonic for the menu item.
      
      The new #GtkRadioMenuItem is added to the same group as group.
  
      Params:
        group = An existing #GtkRadioMenuItem
        label = the text of the button, with an underscore in front of the
                  mnemonic character
      Returns: The new #GtkRadioMenuItem
  */
  static gid.gtk3.radio_menu_item.RadioMenuItem newWithMnemonicFromWidget(gid.gtk3.radio_menu_item.RadioMenuItem group = null, string label = null) nothrow
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gtk_radio_menu_item_new_with_mnemonic_from_widget(group ? cast(GtkRadioMenuItem*)group._cPtr(No.Dup) : null, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  protected void vfuncGroupChanged()
  {
    auto _klass = cast(GtkRadioMenuItemClass*)_vfuncClass;
    if (!_klass.groupChanged)
      return;

    _klass.groupChanged(cast(GtkRadioMenuItem*)this._cPtr);
  }

  /**
      Returns the group to which the radio menu item belongs, as a #GList of
      #GtkRadioMenuItem. The list belongs to GTK+ and should not be freed.
      Returns: the group
            of radio_menu_item
  */
  gid.gtk3.radio_menu_item.RadioMenuItem[] getGroup() nothrow
  {
    GSList* _cretval;
    _cretval = gtk_radio_menu_item_get_group(cast(GtkRadioMenuItem*)this._cPtr);
    auto _retval = gSListToD!(gid.gtk3.radio_menu_item.RadioMenuItem, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Joins a #GtkRadioMenuItem object to the group of another #GtkRadioMenuItem
      object.
      
      This function should be used by language bindings to avoid the memory
      manangement of the opaque #GSList of [gid.gtk3.radio_menu_item.RadioMenuItem.getGroup]
      and [gid.gtk3.radio_menu_item.RadioMenuItem.setGroup].
      
      A common way to set up a group of #GtkRadioMenuItem instances is:
      
      ```
        GtkRadioMenuItem *last_item = NULL;
      
        while ( ...more items to add... )
          {
            GtkRadioMenuItem *radio_item;
      
            radio_item = gtk_radio_menu_item_new (...);
      
            gtk_radio_menu_item_join_group (radio_item, last_item);
            last_item = radio_item;
          }
      ```
  
      Params:
        groupSource = a #GtkRadioMenuItem whose group we are
            joining, or null to remove the radio_menu_item from its current
            group
  */
  void joinGroup(gid.gtk3.radio_menu_item.RadioMenuItem groupSource = null) nothrow
  {
    gtk_radio_menu_item_join_group(cast(GtkRadioMenuItem*)this._cPtr, groupSource ? cast(GtkRadioMenuItem*)groupSource._cPtr(No.Dup) : null);
  }

  /**
      Sets the group of a radio menu item, or changes it.
  
      Params:
        group = the new group, or null.
  */
  void setGroup(gid.gtk3.radio_menu_item.RadioMenuItem[] group = null) nothrow
  {
    auto _group = gSListFromD!(gid.gtk3.radio_menu_item.RadioMenuItem)(group);
    scope(exit) containerFree!(GSList*, gid.gtk3.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
    gtk_radio_menu_item_set_group(cast(GtkRadioMenuItem*)this._cPtr, _group);
  }

  /**
      Connect to `GroupChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.radio_menu_item.RadioMenuItem radioMenuItem)`
  
          `radioMenuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGroupChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.radio_menu_item.RadioMenuItem)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.radio_menu_item.RadioMenuItem.groupChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("group-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from RadioMenuItem
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.radio_menu_item.RadioMenuItem), T.stringof ~ " is not derived from gid.gtk3.radio_menu_item.RadioMenuItem");

    gid.gtk3.check_menu_item.CheckMenuItem._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGroupChanged", true)[0]) == gid.gtk3.radio_menu_item.RadioMenuItem))
      _installVfunc(klass, "group_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkRadioMenuItemClass*)klass;

    switch (vfunc)
    {
      case "group_changed":
      {
        static extern(C) void _vfuncGroupChangedTramp(GtkRadioMenuItem* radioMenuItem) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.radio_menu_item.RadioMenuItem)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)radioMenuItem);
          if (!_obj)
          {
            auto _klass = cast(GtkRadioMenuItemClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)radioMenuItem);
            if (_klass.groupChanged)
              return (cast(typeof(&_vfuncGroupChangedTramp))_klass.groupChanged)(radioMenuItem);
            return;
          }

          try
          {
            _obj.vfuncGroupChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.radio_menu_item.RadioMenuItem.vfuncGroupChanged");
          }
        }

        _klass.groupChanged = cast(typeof(_klass.groupChanged))&_vfuncGroupChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.radio_menu_item.RadioMenuItem]
class RadioMenuItemGidBuilderImpl(T) : gid.gtk3.check_menu_item.CheckMenuItemGidBuilderImpl!T
{


  /**
      Set `group` property.
      Params:
        propval = The radio menu item whose group this widget belongs to.
      Returns: Builder instance for fluent chaining
  */
  T group(gid.gtk3.radio_menu_item.RadioMenuItem propval) nothrow
  {
    return setProperty("group", propval);
  }
}

/// Fluent builder for [gid.gtk3.radio_menu_item.RadioMenuItem]
final class RadioMenuItemGidBuilder : RadioMenuItemGidBuilderImpl!RadioMenuItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  RadioMenuItem build() nothrow
  {
    return new RadioMenuItem(cast(void*)createGObject(RadioMenuItem._getGType), Yes.Take);
  }
}
