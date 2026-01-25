/// Module for [MenuItem] class
module gio.menu_item;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.icon;
import gio.menu_model;
import gio.types;
import glib.variant;
import glib.variant_type;
import gobject.object;

/**
    #GMenuItem is an opaque structure type.  You must access it using the
    functions below.
*/
class MenuItem : gobject.object.ObjectWrap
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
    return cast(void function())g_menu_item_get_type != &gidSymbolNotFound ? g_menu_item_get_type() : cast(GType)0;
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
      Creates a new #GMenuItem.
      
      If label is non-null it is used to set the "label" attribute of the
      new item.
      
      If detailed_action is non-null it is used to set the "action" and
      possibly the "target" attribute of the new item.  See
      [gio.menu_item.MenuItem.setDetailedAction] for more information.
  
      Params:
        label = the section label, or null
        detailedAction = the detailed action string, or null
      Returns: a new #GMenuItem
  */
  this(string label = null, string detailedAction = null)
  {
    GMenuItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    const(char)* _detailedAction = detailedAction.toCString(No.Alloc);
    _cretval = g_menu_item_new(_label, _detailedAction);
    this(_cretval, Yes.Take);
  }

  /**
      Creates a #GMenuItem as an exact copy of an existing menu item in a
      #GMenuModel.
      
      item_index must be valid (ie: be sure to call
      [gio.menu_model.MenuModel.getNItems] first).
  
      Params:
        model = a #GMenuModel
        itemIndex = the index of an item in model
      Returns: a new #GMenuItem.
  */
  static gio.menu_item.MenuItem newFromModel(gio.menu_model.MenuModel model, int itemIndex)
  {
    GMenuItem* _cretval;
    _cretval = g_menu_item_new_from_model(model ? cast(GMenuModel*)model._cPtr(No.Dup) : null, itemIndex);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_item.MenuItem)(cast(GMenuItem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMenuItem representing a section.
      
      This is a convenience API around [gio.menu_item.MenuItem.new_] and
      [gio.menu_item.MenuItem.setSection].
      
      The effect of having one menu appear as a section of another is
      exactly as it sounds: the items from section become a direct part of
      the menu that menu_item is added to.
      
      Visual separation is typically displayed between two non-empty
      sections.  If label is non-null then it will be encorporated into
      this visual indication.  This allows for labeled subsections of a
      menu.
      
      As a simple example, consider a typical "Edit" menu from a simple
      program.  It probably contains an "Undo" and "Redo" item, followed by
      a separator, followed by "Cut", "Copy" and "Paste".
      
      This would be accomplished by creating three #GMenu instances.  The
      first would be populated with the "Undo" and "Redo" items, and the
      second with the "Cut", "Copy" and "Paste" items.  The first and
      second menus would then be added as submenus of the third.  In XML
      format, this would look something like the following:
      ```
      <menu id='edit-menu'>
        <section>
          <item label='Undo'/>
          <item label='Redo'/>
        </section>
        <section>
          <item label='Cut'/>
          <item label='Copy'/>
          <item label='Paste'/>
        </section>
      </menu>
      ```
      
      The following example is exactly equivalent.  It is more illustrative
      of the exact relationship between the menus and items (keeping in
      mind that the 'link' element defines a new menu that is linked to the
      containing one).  The style of the second example is more verbose and
      difficult to read (and therefore not recommended except for the
      purpose of understanding what is really going on).
      ```
      <menu id='edit-menu'>
        <item>
          <link name='section'>
            <item label='Undo'/>
            <item label='Redo'/>
          </link>
        </item>
        <item>
          <link name='section'>
            <item label='Cut'/>
            <item label='Copy'/>
            <item label='Paste'/>
          </link>
        </item>
      </menu>
      ```
  
      Params:
        label = the section label, or null
        section = a #GMenuModel with the items of the section
      Returns: a new #GMenuItem
  */
  static gio.menu_item.MenuItem newSection(string label, gio.menu_model.MenuModel section)
  {
    GMenuItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = g_menu_item_new_section(_label, section ? cast(GMenuModel*)section._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_item.MenuItem)(cast(GMenuItem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a new #GMenuItem representing a submenu.
      
      This is a convenience API around [gio.menu_item.MenuItem.new_] and
      [gio.menu_item.MenuItem.setSubmenu].
  
      Params:
        label = the section label, or null
        submenu = a #GMenuModel with the items of the submenu
      Returns: a new #GMenuItem
  */
  static gio.menu_item.MenuItem newSubmenu(string label, gio.menu_model.MenuModel submenu)
  {
    GMenuItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = g_menu_item_new_submenu(_label, submenu ? cast(GMenuModel*)submenu._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_item.MenuItem)(cast(GMenuItem*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Queries the named attribute on menu_item.
      
      If expected_type is specified and the attribute does not have this
      type, null is returned.  null is also returned if the attribute
      simply does not exist.
  
      Params:
        attribute = the attribute name to query
        expectedType = the expected type of the attribute
      Returns: the attribute value, or null
  */
  glib.variant.Variant getAttributeValue(string attribute, glib.variant_type.VariantType expectedType = null)
  {
    GVariant* _cretval;
    const(char)* _attribute = attribute.toCString(No.Alloc);
    _cretval = g_menu_item_get_attribute_value(cast(GMenuItem*)this._cPtr, _attribute, expectedType ? cast(const(GVariantType)*)expectedType._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Queries the named link on menu_item.
  
      Params:
        link = the link name to query
      Returns: the link, or null
  */
  gio.menu_model.MenuModel getLink(string link)
  {
    GMenuModel* _cretval;
    const(char)* _link = link.toCString(No.Alloc);
    _cretval = g_menu_item_get_link(cast(GMenuItem*)this._cPtr, _link);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Sets or unsets the "action" and "target" attributes of menu_item.
      
      If action is null then both the "action" and "target" attributes
      are unset (and target_value is ignored).
      
      If action is non-null then the "action" attribute is set.  The
      "target" attribute is then set to the value of target_value if it is
      non-null or unset otherwise.
      
      Normal menu items (ie: not submenu, section or other custom item
      types) are expected to have the "action" attribute set to identify
      the action that they are associated with.  The state type of the
      action help to determine the disposition of the menu item.  See
      #GAction and #GActionGroup for an overview of actions.
      
      In general, clicking on the menu item will result in activation of
      the named action with the "target" attribute given as the parameter
      to the action invocation.  If the "target" attribute is not set then
      the action is invoked with no parameter.
      
      If the action has no state then the menu item is usually drawn as a
      plain menu item (ie: with no additional decoration).
      
      If the action has a boolean state then the menu item is usually drawn
      as a toggle menu item (ie: with a checkmark or equivalent
      indication).  The item should be marked as 'toggled' or 'checked'
      when the boolean state is true.
      
      If the action has a string state then the menu item is usually drawn
      as a radio menu item (ie: with a radio bullet or equivalent
      indication).  The item should be marked as 'selected' when the string
      state is equal to the value of the target property.
      
      See [gio.menu_item.MenuItem.setActionAndTarget] or
      [gio.menu_item.MenuItem.setDetailedAction] for two equivalent calls that are
      probably more convenient for most uses.
  
      Params:
        action = the name of the action for this item
        targetValue = a #GVariant to use as the action target
  */
  void setActionAndTargetValue(string action = null, glib.variant.Variant targetValue = null)
  {
    const(char)* _action = action.toCString(No.Alloc);
    g_menu_item_set_action_and_target_value(cast(GMenuItem*)this._cPtr, _action, targetValue ? cast(GVariant*)targetValue._cPtr(No.Dup) : null);
  }

  /**
      Sets or unsets an attribute on menu_item.
      
      The attribute to set or unset is specified by attribute. This
      can be one of the standard attribute names [gio.types.MENU_ATTRIBUTE_LABEL],
      [gio.types.MENU_ATTRIBUTE_ACTION], [gio.types.MENU_ATTRIBUTE_TARGET], or a custom
      attribute name.
      Attribute names are restricted to lowercase characters, numbers
      and '-'. Furthermore, the names must begin with a lowercase character,
      must not end with a '-', and must not contain consecutive dashes.
      
      must consist only of lowercase
      ASCII characters, digits and '-'.
      
      If value is non-null then it is used as the new value for the
      attribute.  If value is null then the attribute is unset. If
      the value #GVariant is floating, it is consumed.
      
      See also [gio.menu_item.MenuItem.setAttribute] for a more convenient way to do
      the same.
  
      Params:
        attribute = the attribute to set
        value = a #GVariant to use as the value, or null
  */
  void setAttributeValue(string attribute, glib.variant.Variant value = null)
  {
    const(char)* _attribute = attribute.toCString(No.Alloc);
    g_menu_item_set_attribute_value(cast(GMenuItem*)this._cPtr, _attribute, value ? cast(GVariant*)value._cPtr(No.Dup) : null);
  }

  /**
      Sets the "action" and possibly the "target" attribute of menu_item.
      
      The format of detailed_action is the same format parsed by
      [gio.action.Action.parseDetailedName].
      
      See [gio.menu_item.MenuItem.setActionAndTarget] or
      [gio.menu_item.MenuItem.setActionAndTargetValue] for more flexible (but
      slightly less convenient) alternatives.
      
      See also [gio.menu_item.MenuItem.setActionAndTargetValue] for a description of
      the semantics of the action and target attributes.
  
      Params:
        detailedAction = the "detailed" action string
  */
  void setDetailedAction(string detailedAction)
  {
    const(char)* _detailedAction = detailedAction.toCString(No.Alloc);
    g_menu_item_set_detailed_action(cast(GMenuItem*)this._cPtr, _detailedAction);
  }

  /**
      Sets (or unsets) the icon on menu_item.
      
      This call is the same as calling [gio.icon.Icon.serialize] and using the
      result as the value to [gio.menu_item.MenuItem.setAttributeValue] for
      [gio.types.MENU_ATTRIBUTE_ICON].
      
      This API is only intended for use with "noun" menu items; things like
      bookmarks or applications in an "Open With" menu.  Don't use it on
      menu items corresponding to verbs (eg: stock icons for 'Save' or
      'Quit').
      
      If icon is null then the icon is unset.
  
      Params:
        icon = a #GIcon, or null
  */
  void setIcon(gio.icon.Icon icon)
  {
    g_menu_item_set_icon(cast(GMenuItem*)this._cPtr, icon ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon)._cPtr(No.Dup) : null);
  }

  /**
      Sets or unsets the "label" attribute of menu_item.
      
      If label is non-null it is used as the label for the menu item.  If
      it is null then the label attribute is unset.
  
      Params:
        label = the label to set, or null to unset
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    g_menu_item_set_label(cast(GMenuItem*)this._cPtr, _label);
  }

  /**
      Creates a link from menu_item to model if non-null, or unsets it.
      
      Links are used to establish a relationship between a particular menu
      item and another menu.  For example, [gio.types.MENU_LINK_SUBMENU] is used to
      associate a submenu with a particular menu item, and [gio.types.MENU_LINK_SECTION]
      is used to create a section. Other types of link can be used, but there
      is no guarantee that clients will be able to make sense of them.
      Link types are restricted to lowercase characters, numbers
      and '-'. Furthermore, the names must begin with a lowercase character,
      must not end with a '-', and must not contain consecutive dashes.
  
      Params:
        link = type of link to establish or unset
        model = the #GMenuModel to link to (or null to unset)
  */
  void setLink(string link, gio.menu_model.MenuModel model = null)
  {
    const(char)* _link = link.toCString(No.Alloc);
    g_menu_item_set_link(cast(GMenuItem*)this._cPtr, _link, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets or unsets the "section" link of menu_item to section.
      
      The effect of having one menu appear as a section of another is
      exactly as it sounds: the items from section become a direct part of
      the menu that menu_item is added to.  See [gio.menu_item.MenuItem.newSection]
      for more information about what it means for a menu item to be a
      section.
  
      Params:
        section = a #GMenuModel, or null
  */
  void setSection(gio.menu_model.MenuModel section = null)
  {
    g_menu_item_set_section(cast(GMenuItem*)this._cPtr, section ? cast(GMenuModel*)section._cPtr(No.Dup) : null);
  }

  /**
      Sets or unsets the "submenu" link of menu_item to submenu.
      
      If submenu is non-null, it is linked to.  If it is null then the
      link is unset.
      
      The effect of having one menu appear as a submenu of another is
      exactly as it sounds.
  
      Params:
        submenu = a #GMenuModel, or null
  */
  void setSubmenu(gio.menu_model.MenuModel submenu = null)
  {
    g_menu_item_set_submenu(cast(GMenuItem*)this._cPtr, submenu ? cast(GMenuModel*)submenu._cPtr(No.Dup) : null);
  }
}
