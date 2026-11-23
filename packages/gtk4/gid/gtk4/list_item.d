/// Module for [ListItem] class
module gid.gtk4.list_item;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Used by list widgets to represent items in a [gid.gio2.list_model.ListModel].
    
    [gid.gtk4.list_item.ListItem] objects are managed by the list widget (with its factory)
    and cannot be created by applications, but they need to be populated
    by application code. This is done by calling [gid.gtk4.list_item.ListItem.setChild].
    
    [gid.gtk4.list_item.ListItem] objects exist in 2 stages:
    
    1. The unbound stage where the listitem is not currently connected to
       an item in the list. In that case, the [gid.gtk4.list_item.ListItem.item]
       property is set to `NULL`.
    
    2. The bound stage where the listitem references an item from the list.
       The [gid.gtk4.list_item.ListItem.item] property is not `NULL`.
*/
class ListItem : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_list_item_get_type != &gidSymbolNotFound ? gtk_list_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkListItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override ListItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.list_item.ListItem]
      Returns: New builder object
  */
  static ListItemGidBuilder builder() nothrow
  {
    return new ListItemGidBuilder;
  }

  /**
      Get `accessibleDescription` property.
      Returns: The accessible description to set on the listitem.
  */
  @property string accessibleDescription() nothrow
  {
    return getAccessibleDescription();
  }

  /**
      Set `accessibleDescription` property.
      Params:
        propval = The accessible description to set on the listitem.
  */
  @property void accessibleDescription(string propval) nothrow
  {
    setAccessibleDescription(propval);
  }

  /**
      Get `accessibleLabel` property.
      Returns: The accessible label to set on the listitem.
  */
  @property string accessibleLabel() nothrow
  {
    return getAccessibleLabel();
  }

  /**
      Set `accessibleLabel` property.
      Params:
        propval = The accessible label to set on the listitem.
  */
  @property void accessibleLabel(string propval) nothrow
  {
    setAccessibleLabel(propval);
  }

  /**
      Get `activatable` property.
      Returns: If the item can be activated by the user.
  */
  @property bool activatable() nothrow
  {
    return getActivatable();
  }

  /**
      Set `activatable` property.
      Params:
        propval = If the item can be activated by the user.
  */
  @property void activatable(bool propval) nothrow
  {
    setActivatable(propval);
  }

  /**
      Get `child` property.
      Returns: Widget used for display.
  */
  @property gid.gtk4.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = Widget used for display.
  */
  @property void child(gid.gtk4.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `focusable` property.
      Returns: If the item can be focused with the keyboard.
  */
  @property bool focusable() nothrow
  {
    return getFocusable();
  }

  /**
      Set `focusable` property.
      Params:
        propval = If the item can be focused with the keyboard.
  */
  @property void focusable(bool propval) nothrow
  {
    setFocusable(propval);
  }

  /**
      Get `item` property.
      Returns: Displayed item.
  */
  @property gid.gobject2.object.ObjectWrap item() nothrow
  {
    return getItem();
  }

  /**
      Get `position` property.
      Returns: Position of the item.
  */
  @property uint position() nothrow
  {
    return getPosition();
  }

  /**
      Get `selectable` property.
      Returns: If the item can be selected by the user.
  */
  @property bool selectable() nothrow
  {
    return getSelectable();
  }

  /**
      Set `selectable` property.
      Params:
        propval = If the item can be selected by the user.
  */
  @property void selectable(bool propval) nothrow
  {
    setSelectable(propval);
  }

  /**
      Get `selected` property.
      Returns: If the item is currently selected.
  */
  @property bool selected() nothrow
  {
    return getSelected();
  }

  /**
      Gets the accessible description of self.
      Returns: the accessible description
  */
  string getAccessibleDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_list_item_get_accessible_description(cast(GtkListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the accessible label of self.
      Returns: the accessible label
  */
  string getAccessibleLabel() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_list_item_get_accessible_label(cast(GtkListItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Checks if a listitem has been set to be activatable via
      [gid.gtk4.list_item.ListItem.setActivatable].
      Returns: true if the item is activatable
  */
  bool getActivatable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_activatable(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the child previously set via [gid.gtk4.list_item.ListItem.setChild]
      or `NULL` if none was set.
      Returns: The child
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_list_item_get_child(cast(GtkListItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if a listitem has been set to be focusable via
      [gid.gtk4.list_item.ListItem.setFocusable].
      Returns: true if the item is focusable
  */
  bool getFocusable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_focusable(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Gets the model item that associated with self.
      
      If self is unbound, this function returns `NULL`.
      Returns: The item displayed
  */
  gid.gobject2.object.ObjectWrap getItem() nothrow
  {
    GObject* _cretval;
    _cretval = gtk_list_item_get_item(cast(GtkListItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the position in the model that self currently displays.
      
      If self is unbound, [gid.gtk4.types.INVALID_LIST_POSITION] is returned.
      Returns: The position of this item
  */
  uint getPosition() nothrow
  {
    uint _retval;
    _retval = gtk_list_item_get_position(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a listitem has been set to be selectable via
      [gid.gtk4.list_item.ListItem.setSelectable].
      
      Do not confuse this function with [gid.gtk4.list_item.ListItem.getSelected].
      Returns: true if the item is selectable
  */
  bool getSelectable() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_selectable(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Checks if the item is displayed as selected.
      
      The selected state is maintained by the list widget and its model
      and cannot be set otherwise.
      Returns: true if the item is selected.
  */
  bool getSelected() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_list_item_get_selected(cast(GtkListItem*)this._cPtr);
    return _retval;
  }

  /**
      Sets the accessible description for the listitem.
      
      The accessible description may be used by e.g. screen readers.
  
      Params:
        description = the description
  */
  void setAccessibleDescription(string description) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    gtk_list_item_set_accessible_description(cast(GtkListItem*)this._cPtr, _description);
  }

  /**
      Sets the accessible label for the listitem.
      
      The accessible label may be used by e.g. screen readers.
  
      Params:
        label = the label
  */
  void setAccessibleLabel(string label) nothrow
  {
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    gtk_list_item_set_accessible_label(cast(GtkListItem*)this._cPtr, _label);
  }

  /**
      Sets self to be activatable.
      
      If an item is activatable, double-clicking on the item, using
      the Return key or calling [gid.gtk4.widget.Widget.activate] will activate
      the item. Activating instructs the containing view to handle
      activation. [gid.gtk4.list_view.ListView] for example will be emitting the
      [gid.gtk4.list_view.ListView.activate] signal.
      
      By default, listitems are activatable.
  
      Params:
        activatable = if the item should be activatable
  */
  void setActivatable(bool activatable) nothrow
  {
    gtk_list_item_set_activatable(cast(GtkListItem*)this._cPtr, activatable);
  }

  /**
      Sets the child to be used for this listitem.
      
      This function is typically called by applications when
      setting up a listitem so that the widget can be reused when
      binding it multiple times.
  
      Params:
        child = The listitem's child or `NULL` to unset
  */
  void setChild(gid.gtk4.widget.Widget child = null) nothrow
  {
    gtk_list_item_set_child(cast(GtkListItem*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets self to be focusable.
      
      If an item is focusable, it can be focused using the keyboard.
      This works similar to [gid.gtk4.widget.Widget.setFocusable].
      
      Note that if items are not focusable, the keyboard cannot be used to activate
      them and selecting only works if one of the listitem's children is focusable.
      
      By default, listitems are focusable.
  
      Params:
        focusable = if the item should be focusable
  */
  void setFocusable(bool focusable) nothrow
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
      
      By default, listitems are selectable. When rebinding them to
      a new item, they will also be reset to be selectable by GTK.
  
      Params:
        selectable = if the item should be selectable
  */
  void setSelectable(bool selectable) nothrow
  {
    gtk_list_item_set_selectable(cast(GtkListItem*)this._cPtr, selectable);
  }
}

/// Fluent builder implementation template for [gid.gtk4.list_item.ListItem]
class ListItemGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `accessibleDescription` property.
      Params:
        propval = The accessible description to set on the listitem.
      Returns: Builder instance for fluent chaining
  */
  T accessibleDescription(string propval) nothrow
  {
    return setProperty("accessible-description", propval);
  }

  /**
      Set `accessibleLabel` property.
      Params:
        propval = The accessible label to set on the listitem.
      Returns: Builder instance for fluent chaining
  */
  T accessibleLabel(string propval) nothrow
  {
    return setProperty("accessible-label", propval);
  }

  /**
      Set `activatable` property.
      Params:
        propval = If the item can be activated by the user.
      Returns: Builder instance for fluent chaining
  */
  T activatable(bool propval) nothrow
  {
    return setProperty("activatable", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = Widget used for display.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `focusable` property.
      Params:
        propval = If the item can be focused with the keyboard.
      Returns: Builder instance for fluent chaining
  */
  T focusable(bool propval) nothrow
  {
    return setProperty("focusable", propval);
  }

  /**
      Set `selectable` property.
      Params:
        propval = If the item can be selected by the user.
      Returns: Builder instance for fluent chaining
  */
  T selectable(bool propval) nothrow
  {
    return setProperty("selectable", propval);
  }
}

/// Fluent builder for [gid.gtk4.list_item.ListItem]
final class ListItemGidBuilder : ListItemGidBuilderImpl!ListItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ListItem build() nothrow
  {
    return new ListItem(cast(void*)createGObject(ListItem._getGType), Yes.Take);
  }
}
