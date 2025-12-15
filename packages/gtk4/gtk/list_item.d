/// Module for [ListItem] class
module gtk.list_item;

import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.list_item.ListItem] is used by list widgets to represent items in a
    [gio.list_model.ListModel].
    
    [gtk.list_item.ListItem] objects are managed by the list widget (with its factory)
    and cannot be created by applications, but they need to be populated
    by application code. This is done by calling [gtk.list_item.ListItem.setChild].
    
    [gtk.list_item.ListItem] objects exist in 2 stages:
    
    1. The unbound stage where the listitem is not currently connected to
       an item in the list. In that case, the [gtk.list_item.ListItem.item]
       property is set to null.
    
    2. The bound stage where the listitem references an item from the list.
       The [gtk.list_item.ListItem.item] property is not null.
*/
class ListItem : gobject.object.ObjectWrap
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
    return cast(void function())gtk_list_item_get_type != &gidSymbolNotFound ? gtk_list_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ListItem self()
  {
    return this;
  }

  /**
      Get `accessibleDescription` property.
      Returns: The accessible description to set on the list item.
  */
  @property string accessibleDescription()
  {
    return getAccessibleDescription();
  }

  /**
      Set `accessibleDescription` property.
      Params:
        propval = The accessible description to set on the list item.
  */
  @property void accessibleDescription(string propval)
  {
    return setAccessibleDescription(propval);
  }

  /**
      Get `accessibleLabel` property.
      Returns: The accessible label to set on the list item.
  */
  @property string accessibleLabel()
  {
    return getAccessibleLabel();
  }

  /**
      Set `accessibleLabel` property.
      Params:
        propval = The accessible label to set on the list item.
  */
  @property void accessibleLabel(string propval)
  {
    return setAccessibleLabel(propval);
  }

  /**
      Get `activatable` property.
      Returns: If the item can be activated by the user.
  */
  @property bool activatable()
  {
    return getActivatable();
  }

  /**
      Set `activatable` property.
      Params:
        propval = If the item can be activated by the user.
  */
  @property void activatable(bool propval)
  {
    return setActivatable(propval);
  }

  /**
      Get `child` property.
      Returns: Widget used for display.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = Widget used for display.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `focusable` property.
      Returns: If the item can be focused with the keyboard.
  */
  @property bool focusable()
  {
    return getFocusable();
  }

  /**
      Set `focusable` property.
      Params:
        propval = If the item can be focused with the keyboard.
  */
  @property void focusable(bool propval)
  {
    return setFocusable(propval);
  }

  /**
      Get `item` property.
      Returns: Displayed item.
  */
  @property gobject.object.ObjectWrap item()
  {
    return getItem();
  }

  /**
      Get `position` property.
      Returns: Position of the item.
  */
  @property uint position()
  {
    return getPosition();
  }

  /**
      Get `selectable` property.
      Returns: If the item can be selected by the user.
  */
  @property bool selectable()
  {
    return getSelectable();
  }

  /**
      Set `selectable` property.
      Params:
        propval = If the item can be selected by the user.
  */
  @property void selectable(bool propval)
  {
    return setSelectable(propval);
  }

  /**
      Get `selected` property.
      Returns: If the item is currently selected.
  */
  @property bool selected()
  {
    return getSelected();
  }

  /**
      Gets the accessible description of self.
      Returns: the accessible description
  */
  string getAccessibleDescription()
  {
    const(char)* _cretval;
    _cretval = gtk_list_item_get_accessible_description(cast(GtkListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the accessible label of self.
      Returns: the accessible label
  */
  string getAccessibleLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_list_item_get_accessible_label(cast(GtkListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Checks if a list item has been set to be activatable via
      [gtk.list_item.ListItem.setActivatable].
      Returns: true if the item is activatable
  */
  bool getActivatable()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_activatable(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child previously set via [gtk.list_item.ListItem.setChild] or
      null if none was set.
      Returns: The child
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_item_get_child(cast(GtkListItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a list item has been set to be focusable via
      [gtk.list_item.ListItem.setFocusable].
      Returns: true if the item is focusable
  */
  bool getFocusable()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_focusable(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model item that associated with self.
      
      If self is unbound, this function returns null.
      Returns: The item displayed
  */
  gobject.object.ObjectWrap getItem()
  {
    GObject* _cretval;
    _cretval = gtk_list_item_get_item(cast(GtkListItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position in the model that self currently displays.
      
      If self is unbound, `GTK_INVALID_LIST_POSITION` is returned.
      Returns: The position of this item
  */
  uint getPosition()
  {
    uint _retval;
    _retval = gtk_list_item_get_position(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a list item has been set to be selectable via
      [gtk.list_item.ListItem.setSelectable].
      
      Do not confuse this function with [gtk.list_item.ListItem.getSelected].
      Returns: true if the item is selectable
  */
  bool getSelectable()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_selectable(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the item is displayed as selected.
      
      The selected state is maintained by the liste widget and its model
      and cannot be set otherwise.
      Returns: true if the item is selected.
  */
  bool getSelected()
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_selected(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Sets the accessible description for the list item,
      which may be used by e.g. screen readers.
  
      Params:
        description = the description
  */
  void setAccessibleDescription(string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    gtk_list_item_set_accessible_description(cast(GtkListItem*)this._cPtr, _description);
  }

  /**
      Sets the accessible label for the list item,
      which may be used by e.g. screen readers.
  
      Params:
        label = the label
  */
  void setAccessibleLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_list_item_set_accessible_label(cast(GtkListItem*)this._cPtr, _label);
  }

  /**
      Sets self to be activatable.
      
      If an item is activatable, double-clicking on the item, using
      the Return key or calling [gtk.widget.Widget.activate] will activate
      the item. Activating instructs the containing view to handle
      activation. [gtk.list_view.ListView] for example will be emitting the
      [gtk.list_view.ListView.activate] signal.
      
      By default, list items are activatable.
  
      Params:
        activatable = if the item should be activatable
  */
  void setActivatable(bool activatable)
  {
    gtk_list_item_set_activatable(cast(GtkListItem*)this._cPtr, activatable);
  }

  /**
      Sets the child to be used for this listitem.
      
      This function is typically called by applications when
      setting up a listitem so that the widget can be reused when
      binding it multiple times.
  
      Params:
        child = The list item's child or null to unset
  */
  void setChild(gtk.widget.Widget child = null)
  {
    gtk_list_item_set_child(cast(GtkListItem*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets self to be focusable.
      
      If an item is focusable, it can be focused using the keyboard.
      This works similar to [gtk.widget.Widget.setFocusable].
      
      Note that if items are not focusable, the keyboard cannot be used to activate
      them and selecting only works if one of the listitem's children is focusable.
      
      By default, list items are focusable.
  
      Params:
        focusable = if the item should be focusable
  */
  void setFocusable(bool focusable)
  {
    gtk_list_item_set_focusable(cast(GtkListItem*)this._cPtr, focusable);
  }

  /**
      Sets self to be selectable.
      
      If an item is selectable, clicking on the item or using the keyboard
      will try to select or unselect the item. If this succeeds is up to
      the model to determine, as it is managing the selected state.
      
      Note that this means that making an item non-selectable has no
      influence on the selected state at all. A non-selectable item
      may still be selected.
      
      By default, list items are selectable. When rebinding them to
      a new item, they will also be reset to be selectable by GTK.
  
      Params:
        selectable = if the item should be selectable
  */
  void setSelectable(bool selectable)
  {
    gtk_list_item_set_selectable(cast(GtkListItem*)this._cPtr, selectable);
  }
}
