/// Module for [ContextMenuItem] class
module webkit.context_menu_item;

import gid.gid;
import gio.action;
import glib.variant;
import gobject.initially_unowned;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.context_menu;
import webkit.types;

/**
    One item of a #WebKitContextMenu.
    
    The #WebKitContextMenu is composed of #WebKitContextMenuItem<!--
    -->s. These items can be created from a #GtkAction, from a
    #WebKitContextMenuAction or from a #WebKitContextMenuAction and a
    label. These #WebKitContextMenuAction<!-- -->s denote stock actions
    for the items. You can also create separators and submenus.
*/
class ContextMenuItem : gobject.initially_unowned.InitiallyUnowned
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
    return cast(void function())webkit_context_menu_item_get_type != &gidSymbolNotFound ? webkit_context_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ContextMenuItem self()
  {
    return this;
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
  static webkit.context_menu_item.ContextMenuItem newFromGaction(gio.action.Action action, string label, glib.variant.Variant target = null)
  {
    WebKitContextMenuItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = webkit_context_menu_item_new_from_gaction(action ? cast(GAction*)(cast(gobject.object.ObjectWrap)action)._cPtr(No.Dup) : null, _label, target ? cast(GVariant*)target._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #WebKitContextMenuItem for the given stock action.
      
      Stock actions are handled automatically by WebKit so that, for example,
      when a menu item created with a [webkit.types.ContextMenuAction.Stop] is
      activated the action associated will be handled by WebKit and the current
      load operation will be stopped. You can get the #GAction of a
      #WebKitContextMenuItem created with a #WebKitContextMenuAction with
      [webkitwebprocessextension.context_menu_item.ContextMenuItem.getGaction] and connect to the #GSimpleAction::activate signal
      to be notified when the item is activated, but you can't prevent the associated
      action from being performed.
  
      Params:
        action = a #WebKitContextMenuAction stock action
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static webkit.context_menu_item.ContextMenuItem newFromStockAction(webkit.types.ContextMenuAction action)
  {
    WebKitContextMenuItem* _cretval;
    _cretval = webkit_context_menu_item_new_from_stock_action(action);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
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
  static webkit.context_menu_item.ContextMenuItem newFromStockActionWithLabel(webkit.types.ContextMenuAction action, string label)
  {
    WebKitContextMenuItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = webkit_context_menu_item_new_from_stock_action_with_label(action, _label);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #WebKitContextMenuItem representing a separator.
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static webkit.context_menu_item.ContextMenuItem newSeparator()
  {
    WebKitContextMenuItem* _cretval;
    _cretval = webkit_context_menu_item_new_separator();
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Creates a new #WebKitContextMenuItem using the given label with a submenu.
  
      Params:
        label = the menu item label text
        submenu = a #WebKitContextMenu to set
      Returns: the newly created #WebKitContextMenuItem object.
  */
  static webkit.context_menu_item.ContextMenuItem newWithSubmenu(string label, webkit.context_menu.ContextMenu submenu)
  {
    WebKitContextMenuItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = webkit_context_menu_item_new_with_submenu(_label, submenu ? cast(WebKitContextMenu*)submenu._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the action associated to item as a #GAction.
      Returns: the #GAction associated to the #WebKitContextMenuItem,
           or null if item is a separator.
  */
  gio.action.Action getGaction()
  {
    GAction* _cretval;
    _cretval = webkit_context_menu_item_get_gaction(cast(WebKitContextMenuItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.action.Action)(cast(GAction*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #WebKitContextMenuAction of item.
      
      If the #WebKitContextMenuItem was not
      created for a stock action [webkit.types.ContextMenuAction.Custom] will be
      returned. If the #WebKitContextMenuItem is a separator [webkit.types.ContextMenuAction.NoAction]
      will be returned.
      Returns: the #WebKitContextMenuAction of item
  */
  webkit.types.ContextMenuAction getStockAction()
  {
    WebKitContextMenuAction _cretval;
    _cretval = webkit_context_menu_item_get_stock_action(cast(WebKitContextMenuItem*)this._cPtr);
    webkit.types.ContextMenuAction _retval = cast(webkit.types.ContextMenuAction)_cretval;
    return _retval;
  }

  /**
      Gets the submenu of item.
      Returns: the #WebKitContextMenu representing the submenu of
           item or null if item doesn't have a submenu.
  */
  webkit.context_menu.ContextMenu getSubmenu()
  {
    WebKitContextMenu* _cretval;
    _cretval = webkit_context_menu_item_get_submenu(cast(WebKitContextMenuItem*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(webkit.context_menu.ContextMenu)(cast(WebKitContextMenu*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether item is a separator.
      Returns: true is item is a separator or false otherwise
  */
  bool isSeparator()
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
  void setSubmenu(webkit.context_menu.ContextMenu submenu = null)
  {
    webkit_context_menu_item_set_submenu(cast(WebKitContextMenuItem*)this._cPtr, submenu ? cast(WebKitContextMenu*)submenu._cPtr(No.Dup) : null);
  }
}
