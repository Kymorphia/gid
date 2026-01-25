/// Module for [MenuModel] class
module gio.menu_model;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.menu_attribute_iter;
import gio.menu_link_iter;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.dclosure;
import gobject.object;

/**
    [gio.menu_model.MenuModel] represents the contents of a menu — an ordered list of
    menu items. The items are associated with actions, which can be
    activated through them. Items can be grouped in sections, and may
    have submenus associated with them. Both items and sections usually
    have some representation data, such as labels or icons. The type of
    the associated action (ie whether it is stateful, and what kind of
    state it has) can influence the representation of the item.
    
    The conceptual model of menus in [gio.menu_model.MenuModel] is hierarchical:
    sections and submenus are again represented by [gio.menu_model.MenuModel]s.
    Menus themselves do not define their own roles. Rather, the role
    of a particular [gio.menu_model.MenuModel] is defined by the item that references
    it (or, in the case of the ‘root’ menu, is defined by the context
    in which it is used).
    
    As an example, consider the visible portions of this menu:
    
    ## An example menu
    
    ![](menu-example.png)
    
    There are 8 ‘menus’ visible in the screenshot: one menubar, two
    submenus and 5 sections:
    
    $(LIST
      * the toplevel menubar (containing 4 items)
      * the View submenu (containing 3 sections)
      * the first section of the View submenu (containing 2 items)
      * the second section of the View submenu (containing 1 item)
      * the final section of the View submenu (containing 1 item)
      * the Highlight Mode submenu (containing 2 sections)
      * the Sources section (containing 2 items)
      * the Markup section (containing 2 items)
    )
      
    The [example](#a-menu-example) illustrates the conceptual connection between
    these 8 menus. Each large block in the figure represents a menu and the
    smaller blocks within the large block represent items in that menu. Some
    items contain references to other menus.
    
    ## A menu example
    
    ![](menu-model.png)
    
    Notice that the separators visible in the [example](#an-example-menu)
    appear nowhere in the [menu model](#a-menu-example). This is because
    separators are not explicitly represented in the menu model. Instead,
    a separator is inserted between any two non-empty sections of a menu.
    Section items can have labels just like any other item. In that case,
    a display system may show a section header instead of a separator.
    
    The motivation for this abstract model of application controls is
    that modern user interfaces tend to make these controls available
    outside the application. Examples include global menus, jumplists,
    dash boards, etc. To support such uses, it is necessary to ‘export’
    information about actions and their representation in menus, which
    is exactly what the action group exporter and the menu model exporter do for
    [gio.action_group.ActionGroup] and [gio.menu_model.MenuModel]. The client-side
    counterparts to make use of the exported information are
    [gio.dbus_action_group.DBusActionGroup] and [gio.dbus_menu_model.DBusMenuModel].
    
    The API of [gio.menu_model.MenuModel] is very generic, with iterators for the
    attributes and links of an item, see
    [gio.menu_model.MenuModel.iterateItemAttributes] and
    [gio.menu_model.MenuModel.iterateItemLinks]. The ‘standard’ attributes and
    link types have predefined names: [gio.types.MENU_ATTRIBUTE_LABEL],
    [gio.types.MENU_ATTRIBUTE_ACTION], [gio.types.MENU_ATTRIBUTE_TARGET], [gio.types.MENU_LINK_SECTION]
    and [gio.types.MENU_LINK_SUBMENU].
    
    Items in a [gio.menu_model.MenuModel] represent active controls if they refer to
    an action that can get activated when the user interacts with the
    menu item. The reference to the action is encoded by the string ID
    in the [gio.types.MENU_ATTRIBUTE_ACTION] attribute. An action ID uniquely
    identifies an action in an action group. Which action group(s) provide
    actions depends on the context in which the menu model is used.
    E.g. when the model is exported as the application menu of a
    [[gtk.application.Application]](https://docs.gtk.org/gtk4/class.Application.html),
    actions can be application-wide or window-specific (and thus come from
    two different action groups). By convention, the application-wide actions
    have names that start with `app.`, while the names of window-specific
    actions start with `win.`.
    
    While a wide variety of stateful actions is possible, the following
    is the minimum that is expected to be supported by all users of exported
    menu information:
    $(LIST
      * an action with no parameter type and no state
      * an action with no parameter type and boolean state
      * an action with string parameter type and string state
    )
      
    ## Stateless
    
    A stateless action typically corresponds to an ordinary menu item.
    
    Selecting such a menu item will activate the action (with no parameter).
    
    ## Boolean State
    
    An action with a boolean state will most typically be used with a ‘toggle’
    or ‘switch’ menu item. The state can be set directly, but activating the
    action (with no parameter) results in the state being toggled.
    
    Selecting a toggle menu item will activate the action. The menu item should
    be rendered as ‘checked’ when the state is true.
    
    ## String Parameter and State
    
    Actions with string parameters and state will most typically be used to
    represent an enumerated choice over the items available for a group of
    radio menu items. Activating the action with a string parameter is
    equivalent to setting that parameter as the state.
    
    Radio menu items, in addition to being associated with the action, will
    have a target value. Selecting that menu item will result in activation
    of the action with the target value as the parameter. The menu item should
    be rendered as ‘selected’ when the state of the action is equal to the
    target value of the menu item.
*/
class MenuModel : gobject.object.ObjectWrap
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
    return cast(void function())g_menu_model_get_type != &gidSymbolNotFound ? g_menu_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuModel self()
  {
    return this;
  }

  /**
      Queries the item at position item_index in model for the attribute
      specified by attribute.
      
      If expected_type is non-null then it specifies the expected type of
      the attribute.  If it is null then any type will be accepted.
      
      If the attribute exists and matches expected_type (or if the
      expected type is unspecified) then the value is returned.
      
      If the attribute does not exist, or does not match the expected type
      then null is returned.
  
      Params:
        itemIndex = the index of the item
        attribute = the attribute to query
        expectedType = the expected type of the attribute, or
              null
      Returns: the value of the attribute
  */
  glib.variant.Variant getItemAttributeValue(int itemIndex, string attribute, glib.variant_type.VariantType expectedType = null)
  {
    GVariant* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_menu_model_get_item_attribute_value(cast(GMenuModel*)this._cPtr, itemIndex, _attribute, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the item at position item_index in model for the link
      specified by link.
      
      If the link exists, the linked #GMenuModel is returned.  If the link
      does not exist, null is returned.
  
      Params:
        itemIndex = the index of the item
        link = the link to query
      Returns: the linked #GMenuModel, or null
  */
  gio.menu_model.MenuModel getItemLink(int itemIndex, string link)
  {
    GMenuModel* _cretval;
    const(char)* _link = link.toCString(No.Alloc);
    _cretval = g_menu_model_get_item_link(cast(GMenuModel*)this._cPtr, itemIndex, _link);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Query the number of items in model.
      Returns: the number of items
  */
  int getNItems()
  {
    int _retval;
    _retval = g_menu_model_get_n_items(cast(GMenuModel*)this._cPtr);
    return _retval;
  }

  /**
      Queries if model is mutable.
      
      An immutable #GMenuModel will never emit the #GMenuModel::items-changed
      signal. Consumers of the model may make optimisations accordingly.
      Returns: true if the model is mutable (ie: "items-changed" may be
            emitted).
  */
  bool isMutable()
  {
    bool _retval;
    _retval = cast(bool)g_menu_model_is_mutable(cast(GMenuModel*)this._cPtr);
    return _retval;
  }

  /**
      Requests emission of the #GMenuModel::items-changed signal on model.
      
      This function should never be called except by #GMenuModel
      subclasses.  Any other calls to this function will very likely lead
      to a violation of the interface of the model.
      
      The implementation should update its internal representation of the
      menu before emitting the signal.  The implementation should further
      expect to receive queries about the new state of the menu (and
      particularly added menu items) while signal handlers are running.
      
      The implementation must dispatch this call directly from a mainloop
      entry and not in response to calls -- particularly those from the
      #GMenuModel API.  Said another way: the menu must not change while
      user code is running without returning to the mainloop.
  
      Params:
        position = the position of the change
        removed = the number of items removed
        added = the number of items added
  */
  void itemsChanged(int position, int removed, int added)
  {
    g_menu_model_items_changed(cast(GMenuModel*)this._cPtr, position, removed, added);
  }

  /**
      Creates a #GMenuAttributeIter to iterate over the attributes of
      the item at position item_index in model.
      
      You must free the iterator with [gobject.object.ObjectWrap.unref] when you are done.
  
      Params:
        itemIndex = the index of the item
      Returns: a new #GMenuAttributeIter
  */
  gio.menu_attribute_iter.MenuAttributeIter iterateItemAttributes(int itemIndex)
  {
    GMenuAttributeIter* _cretval;
    _cretval = g_menu_model_iterate_item_attributes(cast(GMenuModel*)this._cPtr, itemIndex);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_attribute_iter.MenuAttributeIter)(cast(GMenuAttributeIter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GMenuLinkIter to iterate over the links of the item at
      position item_index in model.
      
      You must free the iterator with [gobject.object.ObjectWrap.unref] when you are done.
  
      Params:
        itemIndex = the index of the item
      Returns: a new #GMenuLinkIter
  */
  gio.menu_link_iter.MenuLinkIter iterateItemLinks(int itemIndex)
  {
    GMenuLinkIter* _cretval;
    _cretval = g_menu_model_iterate_item_links(cast(GMenuModel*)this._cPtr, itemIndex);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_link_iter.MenuLinkIter)(cast(GMenuLinkIter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Connect to `ItemsChanged` signal.
  
      Emitted when a change has occurred to the menu.
        
        The only changes that can occur to a menu is that items are removed
        or added.  Items may not change (except by being removed and added
        back in the same location).  This signal is capable of describing
        both of those changes (at the same time).
        
        The signal means that starting at the index position, removed
        items were removed and added items were added in their place.  If
        removed is zero then only items were added.  If added is zero
        then only items were removed.
        
        As an example, if the menu contains items a, b, c, d (in that
        order) and the signal (2, 1, 3) occurs then the new composition of
        the menu will be a, b, _, _, _, d (with each _ representing some
        new item).
        
        Signal handlers may query the model (particularly the added items)
        and expect to see the results of the modification that is being
        reported.  The signal is emitted after the modification.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(int position, int removed, int added, gio.menu_model.MenuModel menuModel))
  
          `position` the position of the change (optional)
  
          `removed` the number of items removed (optional)
  
          `added` the number of items added (optional)
  
          `menuModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectItemsChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gio.menu_model.MenuModel)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);


      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("items-changed", closure, after);
  }
}
