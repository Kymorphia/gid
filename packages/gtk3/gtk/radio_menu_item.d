/// Module for [RadioMenuItem] class
module gtk.radio_menu_item;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.check_menu_item;
import gtk.types;

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
class RadioMenuItem : gtk.check_menu_item.CheckMenuItem
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
    return cast(void function())gtk_radio_menu_item_get_type != &gidSymbolNotFound ? gtk_radio_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override RadioMenuItem self()
  {
    return this;
  }

  /**
  Get builder for [gtk.radio_menu_item.RadioMenuItem]
  Returns: New builder object
  */
  static RadioMenuItemGidBuilder builder()
  {
    return new RadioMenuItemGidBuilder;
  }

  /**
      Set `group` property.
      Params:
        propval = The radio menu item whose group this widget belongs to.
  */
  @property void group(gtk.radio_menu_item.RadioMenuItem propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.radio_menu_item.RadioMenuItem)("group", propval);
  }

  /**
      Creates a new #GtkRadioMenuItem.
  
      Params:
        group = the group to which the
            radio menu item is to be attached, or null
      Returns: a new #GtkRadioMenuItem
  */
  this(gtk.radio_menu_item.RadioMenuItem[] group = null)
  {
    GtkWidget* _cretval;
    auto _group = gSListFromD!(gtk.radio_menu_item.RadioMenuItem)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
    _cretval = gtk_radio_menu_item_new(_group);
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkRadioMenuItem adding it to the same group as group.
  
      Params:
        group = An existing #GtkRadioMenuItem
      Returns: The new #GtkRadioMenuItem
  */
  static gtk.radio_menu_item.RadioMenuItem newFromWidget(gtk.radio_menu_item.RadioMenuItem group = null)
  {
    GtkWidget* _cretval;
    _cretval = gtk_radio_menu_item_new_from_widget(group ? cast(GtkRadioMenuItem*)group._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioMenuItem whose child is a simple #GtkLabel.
  
      Params:
        group = group the radio menu item is inside, or null
        label = the text for the label
      Returns: A new #GtkRadioMenuItem
  */
  static gtk.radio_menu_item.RadioMenuItem newWithLabel(gtk.radio_menu_item.RadioMenuItem[] group, string label)
  {
    GtkWidget* _cretval;
    auto _group = gSListFromD!(gtk.radio_menu_item.RadioMenuItem)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_radio_menu_item_new_with_label(_group, _label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
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
  static gtk.radio_menu_item.RadioMenuItem newWithLabelFromWidget(gtk.radio_menu_item.RadioMenuItem group = null, string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_radio_menu_item_new_with_label_from_widget(group ? cast(GtkRadioMenuItem*)group._cPtr(No.Dup) : null, _label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #GtkRadioMenuItem containing a label. The label
      will be created using [gtk.label.Label.newWithMnemonic], so underscores
      in label indicate the mnemonic for the menu item.
  
      Params:
        group = group the radio menu item is inside, or null
        label = the text of the button, with an underscore in front of the
                  mnemonic character
      Returns: a new #GtkRadioMenuItem
  */
  static gtk.radio_menu_item.RadioMenuItem newWithMnemonic(gtk.radio_menu_item.RadioMenuItem[] group, string label)
  {
    GtkWidget* _cretval;
    auto _group = gSListFromD!(gtk.radio_menu_item.RadioMenuItem)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_radio_menu_item_new_with_mnemonic(_group, _label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new GtkRadioMenuItem containing a label. The label will be
      created using [gtk.label.Label.newWithMnemonic], so underscores in label
      indicate the mnemonic for the menu item.
      
      The new #GtkRadioMenuItem is added to the same group as group.
  
      Params:
        group = An existing #GtkRadioMenuItem
        label = the text of the button, with an underscore in front of the
                  mnemonic character
      Returns: The new #GtkRadioMenuItem
  */
  static gtk.radio_menu_item.RadioMenuItem newWithMnemonicFromWidget(gtk.radio_menu_item.RadioMenuItem group = null, string label = null)
  {
    GtkWidget* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_radio_menu_item_new_with_mnemonic_from_widget(group ? cast(GtkRadioMenuItem*)group._cPtr(No.Dup) : null, _label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.radio_menu_item.RadioMenuItem)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the group to which the radio menu item belongs, as a #GList of
      #GtkRadioMenuItem. The list belongs to GTK+ and should not be freed.
      Returns: the group
            of radio_menu_item
  */
  gtk.radio_menu_item.RadioMenuItem[] getGroup()
  {
    GSList* _cretval;
    _cretval = gtk_radio_menu_item_get_group(cast(GtkRadioMenuItem*)this._cPtr);
    auto _retval = gSListToD!(gtk.radio_menu_item.RadioMenuItem, GidOwnership.None)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Joins a #GtkRadioMenuItem object to the group of another #GtkRadioMenuItem
      object.
      
      This function should be used by language bindings to avoid the memory
      manangement of the opaque #GSList of [gtk.radio_menu_item.RadioMenuItem.getGroup]
      and [gtk.radio_menu_item.RadioMenuItem.setGroup].
      
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
  void joinGroup(gtk.radio_menu_item.RadioMenuItem groupSource = null)
  {
    gtk_radio_menu_item_join_group(cast(GtkRadioMenuItem*)this._cPtr, groupSource ? cast(GtkRadioMenuItem*)groupSource._cPtr(No.Dup) : null);
  }

  /**
      Sets the group of a radio menu item, or changes it.
  
      Params:
        group = the new group, or null.
  */
  void setGroup(gtk.radio_menu_item.RadioMenuItem[] group = null)
  {
    auto _group = gSListFromD!(gtk.radio_menu_item.RadioMenuItem)(group);
    scope(exit) containerFree!(GSList*, gtk.radio_menu_item.RadioMenuItem, GidOwnership.None)(_group);
    gtk_radio_menu_item_set_group(cast(GtkRadioMenuItem*)this._cPtr, _group);
  }

  /**
      Connect to `GroupChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.radio_menu_item.RadioMenuItem radioMenuItem))
  
          `radioMenuItem` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGroupChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.radio_menu_item.RadioMenuItem)))
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
    return connectSignalClosure("group-changed", closure, after);
  }
}

class RadioMenuItemGidBuilderImpl(T) : gtk.check_menu_item.CheckMenuItemGidBuilderImpl!T
{


  /**
      Set `group` property.
      Params:
        propval = The radio menu item whose group this widget belongs to.
      Returns: Builder instance for fluent chaining
  */
  T group(gtk.radio_menu_item.RadioMenuItem propval)
  {
    return setProperty("group", propval);
  }
}

/// Fluent builder for [gtk.radio_menu_item.RadioMenuItem]
final class RadioMenuItemGidBuilder : RadioMenuItemGidBuilderImpl!RadioMenuItemGidBuilder
{
  RadioMenuItem build()
  {
    return new RadioMenuItem(cast(void*)createGObject(RadioMenuItem._getGType), No.Take);
  }
}
