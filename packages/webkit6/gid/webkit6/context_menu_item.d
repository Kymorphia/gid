/// Module for [ContextMenuItem] class
module gid.webkit6.context_menu_item;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.action;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.initially_unowned;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.context_menu;
import gid.webkit6.types;

/**
    One item of a #WebKitContextMenu.
    
    The #WebKitContextMenu is composed of #WebKitContextMenuItem<!--
    -->s. These items can be created from a #GtkAction, from a
    #WebKitContextMenuAction or from a #WebKitContextMenuAction and a
    label. These #WebKitContextMenuAction<!-- -->s denote stock actions
    for the items. You can also create separators and submenus.
*/
class ContextMenuItem : gid.gobject2.initially_unowned.InitiallyUnowned
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
    return cast(void function())webkit_context_menu_item_get_type != &gidSymbolNotFound ? webkit_context_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitContextMenuItem";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContextMenuItem self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.context_menu_item.ContextMenuItem]
      Returns: New builder object
  */
  static ContextMenuItemGidBuilder builder() nothrow
  {
    return new ContextMenuItemGidBuilder;
  }

  /**
      Creates a new #WebKitContextMenuItem for the given action and label.
      
      On activation
      target will be passed as parameter to the callback.
  
      Params:
        action = a #GAction
        label = the menu item label text
        target = a #GVariant to use as the action target
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static gid.webkit6.context_menu_item.ContextMenuItem newFromGaction(gid.gio2.action.Action action, string label, gid.glib2.variant.Variant target = null) nothrow
  {
    WebKitContextMenuItem* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_context_menu_item_new_from_gaction(action ? cast(GAction*)(cast(gid.gobject2.object.ObjectWrap)action)._cPtr(No.Dup) : null, _label, target ? cast(GVariant*)target._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #WebKitContextMenuItem for the given stock action.
      
      Stock actions are handled automatically by WebKit so that, for example,
      when a menu item created with a [gid.webkitwebprocessextension6.types.ContextMenuAction.Stop] is
      activated the action associated will be handled by WebKit and the current
      load operation will be stopped. You can get the #GAction of a
      #WebKitContextMenuItem created with a #WebKitContextMenuAction with
      [gid.webkitwebprocessextension6.context_menu_item.ContextMenuItem.getGaction] and connect to the #GSimpleAction::activate signal
      to be notified when the item is activated, but you can't prevent the associated
      action from being performed.
  
      Params:
        action = a #WebKitContextMenuAction stock action
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static gid.webkit6.context_menu_item.ContextMenuItem newFromStockAction(gid.webkit6.types.ContextMenuAction action) nothrow
  {
    WebKitContextMenuItem* _cretval;
    _cretval = webkit_context_menu_item_new_from_stock_action(action);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #WebKitContextMenuItem for the given stock action using the given label.
      
      Stock actions have a predefined label, this method can be used to create a
      #WebKitContextMenuItem for a #WebKitContextMenuAction but using a custom label.
  
      Params:
        action = a #WebKitContextMenuAction stock action
        label = a custom label text to use instead of the predefined one
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static gid.webkit6.context_menu_item.ContextMenuItem newFromStockActionWithLabel(gid.webkit6.types.ContextMenuAction action, string label) nothrow
  {
    WebKitContextMenuItem* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_context_menu_item_new_from_stock_action_with_label(action, _label);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #WebKitContextMenuItem representing a separator.
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static gid.webkit6.context_menu_item.ContextMenuItem newSeparator() nothrow
  {
    WebKitContextMenuItem* _cretval;
    _cretval = webkit_context_menu_item_new_separator();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #WebKitContextMenuItem using the given label with a submenu.
  
      Params:
        label = the menu item label text
        submenu = a #WebKitContextMenu to set
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static gid.webkit6.context_menu_item.ContextMenuItem newWithSubmenu(string label, gid.webkit6.context_menu.ContextMenu submenu) nothrow
  {
    WebKitContextMenuItem* _cretval;
    const(char)* _label = label.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_context_menu_item_new_with_submenu(_label, submenu ? cast(WebKitContextMenu*)submenu._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the action associated to item as a #GAction.
      Returns: the #GAction associated to the #WebKitContextMenuItem,
           or null if item is a separator.
  */
  gid.gio2.action.Action getGaction() nothrow
  {
    GAction* _cretval;
    _cretval = webkit_context_menu_item_get_gaction(cast(WebKitContextMenuItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.action.Action)(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the target #GVariant associated with item.
      Returns: the target #GVariant of the #WebKitContextMenuItem,
           or null if item was not created with [gid.webkitwebprocessextension6.context_menu_item.ContextMenuItem.newFromGaction]
           or if no target was specified.
  */
  gid.glib2.variant.Variant getGactionTarget() nothrow
  {
    GVariant* _cretval;
    _cretval = webkit_context_menu_item_get_gaction_target(cast(WebKitContextMenuItem*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the #WebKitContextMenuAction of item.
      
      If the #WebKitContextMenuItem was not
      created for a stock action [gid.webkitwebprocessextension6.types.ContextMenuAction.Custom] will be
      returned. If the #WebKitContextMenuItem is a separator [gid.webkitwebprocessextension6.types.ContextMenuAction.NoAction]
      will be returned.
      Returns: the #WebKitContextMenuAction of item
  */
  gid.webkit6.types.ContextMenuAction getStockAction() nothrow
  {
    WebKitContextMenuAction _cretval;
    _cretval = webkit_context_menu_item_get_stock_action(cast(WebKitContextMenuItem*)this._cPtr);
    gid.webkit6.types.ContextMenuAction _retval = cast(gid.webkit6.types.ContextMenuAction)_cretval;
    return _retval;
  }

  /**
      Gets the submenu of item.
      Returns: the #WebKitContextMenu representing the submenu of
           item or null if item doesn't have a submenu.
  */
  gid.webkit6.context_menu.ContextMenu getSubmenu() nothrow
  {
    WebKitContextMenu* _cretval;
    _cretval = webkit_context_menu_item_get_submenu(cast(WebKitContextMenuItem*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu.ContextMenu)(cast(WebKitContextMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the title of item.
      Returns: the title of item, or null if item is a separator.
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_context_menu_item_get_title(cast(WebKitContextMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Checks whether item is a separator.
      Returns: true is item is a separator or false otherwise
  */
  bool isSeparator() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_context_menu_item_is_separator(cast(WebKitContextMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Sets or replaces the item submenu.
      
      If submenu is null the current
      submenu of item is removed.
  
      Params:
        submenu = a #WebKitContextMenu
  */
  void setSubmenu(gid.webkit6.context_menu.ContextMenu submenu = null) nothrow
  {
    webkit_context_menu_item_set_submenu(cast(WebKitContextMenuItem*)this._cPtr, submenu ? cast(WebKitContextMenu*)submenu._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.webkit6.context_menu_item.ContextMenuItem]
class ContextMenuItemGidBuilderImpl(T) : gid.gobject2.initially_unowned.InitiallyUnownedGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.context_menu_item.ContextMenuItem]
final class ContextMenuItemGidBuilder : ContextMenuItemGidBuilderImpl!ContextMenuItemGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContextMenuItem build() nothrow
  {
    return new ContextMenuItem(cast(void*)createGObject(ContextMenuItem._getGType), Yes.Take);
  }
}
