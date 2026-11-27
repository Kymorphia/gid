/// Module for [MenuModel] class
module gid.gio2.menu_model;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.menu_attribute_iter;
import gid.gio2.menu_link_iter;
import gid.gio2.types;
import gid.glib2.variant;
import gid.glib2.variant_type;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.menu_model.MenuModel] represents the contents of a menu — an ordered list of
    menu items. The items are associated with actions, which can be
    activated through them. Items can be grouped in sections, and may
    have submenus associated with them. Both items and sections usually
    have some representation data, such as labels or icons. The type of
    the associated action (ie whether it is stateful, and what kind of
    state it has) can influence the representation of the item.
    
    The conceptual model of menus in [gid.gio2.menu_model.MenuModel] is hierarchical:
    sections and submenus are again represented by [gid.gio2.menu_model.MenuModel]s.
    Menus themselves do not define their own roles. Rather, the role
    of a particular [gid.gio2.menu_model.MenuModel] is defined by the item that references
    it (or, in the case of the ‘root’ menu, is defined by the context
    in which it is used).
    
    As an example, consider the visible portions of this menu:
    
    ## An example menu
    
    ![](menu-example.png)
    
    While this kind of deeply nested menu is no longer considered good UI
    practice, it serves as a good example of the concepts in [gid.gio2.menu_model.MenuModel].
    There are 8 ‘menus’ visible in the screenshot: one menubar, two
    submenus and 5 sections:
    
    - the toplevel menubar (containing 4 items)
    - the View submenu (containing 3 sections)
    - the first section of the View submenu (containing 2 items)
    - the second section of the View submenu (containing 1 item)
    - the final section of the View submenu (containing 1 item)
    - the Highlight Mode submenu (containing 2 sections)
    - the Sources section (containing 2 items)
    - the Markup section (containing 2 items)
    
    The [example](#a-menu-example) illustrates the conceptual connection between
    these 8 menus. Each large block in the figure represents a menu and the
    smaller blocks within the large block represent items in that menu. Some
    items contain references to other menus.
    
    ## A menu example
    
    <picture>
      <source srcset="menu-model-dark.svg" media="(prefers-color-scheme: dark)">
      <img src="menu-model-light.svg" alt="menu model">
    </picture>
    
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
    [gid.gio2.action_group.ActionGroup] and [gid.gio2.menu_model.MenuModel]. The client-side
    counterparts to make use of the exported information are
    [gid.gio2.dbus_action_group.DBusActionGroup] and [gid.gio2.dbus_menu_model.DBusMenuModel].
    
    The API of [gid.gio2.menu_model.MenuModel] is very generic, with iterators for the
    attributes and links of an item, see
    [gid.gio2.menu_model.MenuModel.iterateItemAttributes] and
    [gid.gio2.menu_model.MenuModel.iterateItemLinks]. The ‘standard’ attributes and
    link types have predefined names: [gid.gio2.types.MENU_ATTRIBUTE_LABEL],
    [gid.gio2.types.MENU_ATTRIBUTE_ACTION], [gid.gio2.types.MENU_ATTRIBUTE_TARGET], [gid.gio2.types.MENU_LINK_SECTION]
    and [gid.gio2.types.MENU_LINK_SUBMENU].
    
    Items in a [gid.gio2.menu_model.MenuModel] represent active controls if they refer to
    an action that can get activated when the user interacts with the
    menu item. The reference to the action is encoded by the string ID
    in the [gid.gio2.types.MENU_ATTRIBUTE_ACTION] attribute. An action ID uniquely
    identifies an action in an action group. Which action group(s) provide
    actions depends on the context in which the menu model is used.
    E.g. when the model is exported as the application menu of a
    [[gid.gtk4.application.Application]](https://docs.gtk.org/gtk4/class.Application.html),
    actions can be application-wide or window-specific (and thus come from
    two different action groups). By convention, the application-wide actions
    have names that start with `app.`, while the names of window-specific
    actions start with `win.`.
    
    While a wide variety of stateful actions is possible, the following
    is the minimum that is expected to be supported by all users of exported
    menu information:
    - an action with no parameter type and no state
    - an action with no parameter type and boolean state
    - an action with string parameter type and string state
    
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
@gidGir("MenuModel", "MenuModelClass")
class MenuModel : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_menu_model_get_type != &gidSymbolNotFound ? g_menu_model_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMenuModel";
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuModel self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.menu_model.MenuModel]
      Returns: New builder object
  */
  static MenuModelGidBuilder builder() nothrow
  {
    return new MenuModelGidBuilder;
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetItemAttributeValue` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.glib2.variant.Variant vfuncGetItemAttributeValue(int itemIndex, string attribute, gid.glib2.variant_type.VariantType expectedType = null)
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.getItemAttributeValue)
      return typeof(return).init;

    GVariant* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getItemAttributeValue(cast(GMenuModel*)this._cPtr, itemIndex, _attribute, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets all the attributes associated with the item in the menu model.
  
      Params:
        itemIndex = The #GMenuItem to query
        attributes = Attributes on the item
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetItemAttributes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetItemAttributes(int itemIndex, out gid.glib2.variant.Variant[string] attributes)
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.getItemAttributes)
      return;

    GHashTable* _attributes;
    _klass.getItemAttributes(cast(GMenuModel*)this._cPtr, itemIndex, &_attributes);
    attributes = gHashTableToD!(string, gid.glib2.variant.Variant, GidOwnership.Full)(_attributes);
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
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetItemLink` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.menu_model.MenuModel vfuncGetItemLink(int itemIndex, string link)
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.getItemLink)
      return typeof(return).init;

    GMenuModel* _cretval;
    const(char)* _link = link.toCString!(No.Malloc, No.Nullable);
    _cretval = _klass.getItemLink(cast(GMenuModel*)this._cPtr, itemIndex, _link);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets all the links associated with the item in the menu model.
  
      Params:
        itemIndex = The #GMenuItem to query
        links = Links from the item
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetItemLinks` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncGetItemLinks(int itemIndex, out gid.gio2.menu_model.MenuModel[string] links)
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.getItemLinks)
      return;

    GHashTable* _links;
    _klass.getItemLinks(cast(GMenuModel*)this._cPtr, itemIndex, &_links);
    links = gHashTableToD!(string, gid.gio2.menu_model.MenuModel, GidOwnership.Full)(_links);
  }

  /**
      Query the number of items in model.
      Returns: the number of items
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncGetNItems` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected int vfuncGetNItems()
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.getNItems)
      return typeof(return).init;

    int _retval;
    _retval = _klass.getNItems(cast(GMenuModel*)this._cPtr);
    return _retval;
  }

  /**
      Queries if model is mutable.
      
      An immutable #GMenuModel will never emit the #GMenuModel::items-changed
      signal. Consumers of the model may make optimisations accordingly.
      Returns: true if the model is mutable (ie: "items-changed" may be
            emitted).
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIsMutable` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected bool vfuncIsMutable()
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.isMutable)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isMutable(cast(GMenuModel*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #GMenuAttributeIter to iterate over the attributes of
      the item at position item_index in model.
      
      You must free the iterator with [gid.gobject2.object.ObjectWrap.unref] when you are done.
  
      Params:
        itemIndex = the index of the item
      Returns: a new #GMenuAttributeIter
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIterateItemAttributes` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.menu_attribute_iter.MenuAttributeIter vfuncIterateItemAttributes(int itemIndex)
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.iterateItemAttributes)
      return typeof(return).init;

    GMenuAttributeIter* _cretval;
    _cretval = _klass.iterateItemAttributes(cast(GMenuModel*)this._cPtr, itemIndex);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_attribute_iter.MenuAttributeIter)(cast(GMenuAttributeIter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GMenuLinkIter to iterate over the links of the item at
      position item_index in model.
      
      You must free the iterator with [gid.gobject2.object.ObjectWrap.unref] when you are done.
  
      Params:
        itemIndex = the index of the item
      Returns: a new #GMenuLinkIter
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncIterateItemLinks` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected gid.gio2.menu_link_iter.MenuLinkIter vfuncIterateItemLinks(int itemIndex)
  {
    auto _klass = cast(GMenuModelClass*)_vfuncClass;
    if (!_klass.iterateItemLinks)
      return typeof(return).init;

    GMenuLinkIter* _cretval;
    _cretval = _klass.iterateItemLinks(cast(GMenuModel*)this._cPtr, itemIndex);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_link_iter.MenuLinkIter)(cast(GMenuLinkIter*)_cretval, Yes.Take);
    return _retval;
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
  gid.glib2.variant.Variant getItemAttributeValue(int itemIndex, string attribute, gid.glib2.variant_type.VariantType expectedType = null) nothrow
  {
    GVariant* _cretval;
    const(char)* _attribute = attribute.toCString!(No.Malloc, No.Nullable);
    _cretval = g_menu_model_get_item_attribute_value(cast(GMenuModel*)this._cPtr, itemIndex, _attribute, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
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
  gid.gio2.menu_model.MenuModel getItemLink(int itemIndex, string link) nothrow
  {
    GMenuModel* _cretval;
    const(char)* _link = link.toCString!(No.Malloc, No.Nullable);
    _cretval = g_menu_model_get_item_link(cast(GMenuModel*)this._cPtr, itemIndex, _link);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Query the number of items in model.
      Returns: the number of items
  */
  int getNItems() nothrow
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
  bool isMutable() nothrow
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
  void itemsChanged(int position, int removed, int added) nothrow
  {
    g_menu_model_items_changed(cast(GMenuModel*)this._cPtr, position, removed, added);
  }

  /**
      Creates a #GMenuAttributeIter to iterate over the attributes of
      the item at position item_index in model.
      
      You must free the iterator with [gid.gobject2.object.ObjectWrap.unref] when you are done.
  
      Params:
        itemIndex = the index of the item
      Returns: a new #GMenuAttributeIter
  */
  gid.gio2.menu_attribute_iter.MenuAttributeIter iterateItemAttributes(int itemIndex) nothrow
  {
    GMenuAttributeIter* _cretval;
    _cretval = g_menu_model_iterate_item_attributes(cast(GMenuModel*)this._cPtr, itemIndex);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_attribute_iter.MenuAttributeIter)(cast(GMenuAttributeIter*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GMenuLinkIter to iterate over the links of the item at
      position item_index in model.
      
      You must free the iterator with [gid.gobject2.object.ObjectWrap.unref] when you are done.
  
      Params:
        itemIndex = the index of the item
      Returns: a new #GMenuLinkIter
  */
  gid.gio2.menu_link_iter.MenuLinkIter iterateItemLinks(int itemIndex) nothrow
  {
    GMenuLinkIter* _cretval;
    _cretval = g_menu_model_iterate_item_links(cast(GMenuModel*)this._cPtr, itemIndex);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_link_iter.MenuLinkIter)(cast(GMenuLinkIter*)_cretval, Yes.Take);
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
        the menu will be a, b, \_, \_, \_, d (with each _ representing some
        new item).
        
        Signal handlers may query the model (particularly the added items)
        and expect to see the results of the modification that is being
        reported.  The signal is emitted after the modification.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int position, int removed, int added, gid.gio2.menu_model.MenuModel menuModel)`
  
          `position` the position of the change (optional)
  
          `removed` the number of items removed (optional)
  
          `added` the number of items added (optional)
  
          `menuModel` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectItemsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == int)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : gid.gio2.menu_model.MenuModel)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
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

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.itemsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("items-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from MenuModel
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gio2.menu_model.MenuModel), T.stringof ~ " is not derived from gid.gio2.menu_model.MenuModel");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetItemAttributeValue", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "get_item_attribute_value");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetItemAttributes", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "get_item_attributes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetItemLink", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "get_item_link");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetItemLinks", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "get_item_links");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetNItems", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "get_n_items");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIsMutable", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "is_mutable");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIterateItemAttributes", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "iterate_item_attributes");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIterateItemLinks", true)[0]) == gid.gio2.menu_model.MenuModel))
      _installVfunc(klass, "iterate_item_links");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GMenuModelClass*)klass;

    switch (vfunc)
    {
      case "get_item_attribute_value":
      {
        static extern(C) GVariant* _vfuncGetItemAttributeValueTramp(GMenuModel* model, int itemIndex, const(char)* attribute, const(GVariantType)* expectedType) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.getItemAttributeValue)
              return (cast(typeof(&_vfuncGetItemAttributeValueTramp))_klass.getItemAttributeValue)(model, itemIndex, attribute, expectedType);
            return typeof(return).init;
          }

          gid.glib2.variant.Variant _dretval;
          string _attribute = attribute.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetItemAttributeValue(itemIndex, _attribute, expectedType ? new gid.glib2.variant_type.VariantType(cast(void*)expectedType, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncGetItemAttributeValue");
          }
          auto _retval = _dretval ? cast(GVariant*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getItemAttributeValue = cast(typeof(_klass.getItemAttributeValue))&_vfuncGetItemAttributeValueTramp;
        break;
      }
      case "get_item_attributes":
      {
        static extern(C) void _vfuncGetItemAttributesTramp(GMenuModel* model, int itemIndex, GHashTable** attributes) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.getItemAttributes)
              return (cast(typeof(&_vfuncGetItemAttributesTramp))_klass.getItemAttributes)(model, itemIndex, attributes);
            return;
          }

          gid.glib2.variant.Variant[string] _attributes;

          try
          {
            _obj.vfuncGetItemAttributes(itemIndex, _attributes);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncGetItemAttributes");
          }
          *attributes = gHashTableFromD!(string, gid.glib2.variant.Variant)(_attributes);

        }

        _klass.getItemAttributes = cast(typeof(_klass.getItemAttributes))&_vfuncGetItemAttributesTramp;
        break;
      }
      case "get_item_link":
      {
        static extern(C) GMenuModel* _vfuncGetItemLinkTramp(GMenuModel* model, int itemIndex, const(char)* link) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.getItemLink)
              return (cast(typeof(&_vfuncGetItemLinkTramp))_klass.getItemLink)(model, itemIndex, link);
            return typeof(return).init;
          }

          gid.gio2.menu_model.MenuModel _dretval;
          string _link = link.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncGetItemLink(itemIndex, _link);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncGetItemLink");
          }
          auto _retval = _dretval ? cast(GMenuModel*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.getItemLink = cast(typeof(_klass.getItemLink))&_vfuncGetItemLinkTramp;
        break;
      }
      case "get_item_links":
      {
        static extern(C) void _vfuncGetItemLinksTramp(GMenuModel* model, int itemIndex, GHashTable** links) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.getItemLinks)
              return (cast(typeof(&_vfuncGetItemLinksTramp))_klass.getItemLinks)(model, itemIndex, links);
            return;
          }

          gid.gio2.menu_model.MenuModel[string] _links;

          try
          {
            _obj.vfuncGetItemLinks(itemIndex, _links);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncGetItemLinks");
          }
          *links = gHashTableFromD!(string, gid.gio2.menu_model.MenuModel)(_links);

        }

        _klass.getItemLinks = cast(typeof(_klass.getItemLinks))&_vfuncGetItemLinksTramp;
        break;
      }
      case "get_n_items":
      {
        static extern(C) int _vfuncGetNItemsTramp(GMenuModel* model) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.getNItems)
              return (cast(typeof(&_vfuncGetNItemsTramp))_klass.getNItems)(model);
            return typeof(return).init;
          }

          int _retval;

          try
          {
            _retval = _obj.vfuncGetNItems();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncGetNItems");
          }
          return _retval;
        }

        _klass.getNItems = cast(typeof(_klass.getNItems))&_vfuncGetNItemsTramp;
        break;
      }
      case "is_mutable":
      {
        static extern(C) gboolean _vfuncIsMutableTramp(GMenuModel* model) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.isMutable)
              return (cast(typeof(&_vfuncIsMutableTramp))_klass.isMutable)(model);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsMutable();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncIsMutable");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isMutable = cast(typeof(_klass.isMutable))&_vfuncIsMutableTramp;
        break;
      }
      case "iterate_item_attributes":
      {
        static extern(C) GMenuAttributeIter* _vfuncIterateItemAttributesTramp(GMenuModel* model, int itemIndex) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.iterateItemAttributes)
              return (cast(typeof(&_vfuncIterateItemAttributesTramp))_klass.iterateItemAttributes)(model, itemIndex);
            return typeof(return).init;
          }

          gid.gio2.menu_attribute_iter.MenuAttributeIter _dretval;

          try
          {
            _dretval = _obj.vfuncIterateItemAttributes(itemIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncIterateItemAttributes");
          }
          auto _retval = _dretval ? cast(GMenuAttributeIter*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.iterateItemAttributes = cast(typeof(_klass.iterateItemAttributes))&_vfuncIterateItemAttributesTramp;
        break;
      }
      case "iterate_item_links":
      {
        static extern(C) GMenuLinkIter* _vfuncIterateItemLinksTramp(GMenuModel* model, int itemIndex) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gio2.menu_model.MenuModel)(cast(void*)model);
          if (!_obj)
          {
            auto _klass = cast(GMenuModelClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)model);
            if (_klass.iterateItemLinks)
              return (cast(typeof(&_vfuncIterateItemLinksTramp))_klass.iterateItemLinks)(model, itemIndex);
            return typeof(return).init;
          }

          gid.gio2.menu_link_iter.MenuLinkIter _dretval;

          try
          {
            _dretval = _obj.vfuncIterateItemLinks(itemIndex);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.menu_model.MenuModel.vfuncIterateItemLinks");
          }
          auto _retval = _dretval ? cast(GMenuLinkIter*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.iterateItemLinks = cast(typeof(_klass.iterateItemLinks))&_vfuncIterateItemLinksTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.menu_model.MenuModel]
class MenuModelGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.menu_model.MenuModel]
final class MenuModelGidBuilder : MenuModelGidBuilderImpl!MenuModelGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MenuModel build() nothrow
  {
    return new MenuModel(cast(void*)createGObject(MenuModel._getGType), Yes.Take);
  }
}
