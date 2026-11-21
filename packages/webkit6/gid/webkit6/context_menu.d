/// Module for [ContextMenu] class
module gid.webkit6.context_menu;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk4.event;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.context_menu_item;
import gid.webkit6.types;

/**
    Represents the context menu in a #WebKitWebView.
    
    #WebKitContextMenu represents a context menu containing
    #WebKitContextMenuItem<!-- -->s in a #WebKitWebView.
    
    When a #WebKitWebView is about to display the context menu, it
    emits the #WebKitWebView::context-menu signal, which has the
    #WebKitContextMenu as an argument. You can modify it, adding new
    submenus that you can create with [gid.webkitwebprocessextension6.context_menu.ContextMenu.new_], adding
    new #WebKitContextMenuItem<!-- -->s with
    [gid.webkitwebprocessextension6.context_menu.ContextMenu.prepend], [gid.webkitwebprocessextension6.context_menu.ContextMenu.append] or
    [gid.webkitwebprocessextension6.context_menu.ContextMenu.insert], maybe after having removed the
    existing ones with [gid.webkitwebprocessextension6.context_menu.ContextMenu.removeAll].
*/
class ContextMenu : gid.gobject2.object.ObjectWrap
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
    return cast(void function())webkit_context_menu_get_type != &gidSymbolNotFound ? webkit_context_menu_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "WebKitContextMenu";
  }

  /** Returns `this`, for use in `with` statements. */
  override ContextMenu self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.webkit6.context_menu.ContextMenu]
      Returns: New builder object
  */
  static ContextMenuGidBuilder builder() nothrow
  {
    return new ContextMenuGidBuilder;
  }

  /**
      Creates a new #WebKitContextMenu object.
      
      Creates a new #WebKitContextMenu object to be used as a submenu of an existing
      #WebKitContextMenu. The context menu of a #WebKitWebView is created by the view
      and passed as an argument of #WebKitWebView::context-menu signal.
      To add items to the menu use [gid.webkitwebprocessextension6.context_menu.ContextMenu.prepend],
      [gid.webkitwebprocessextension6.context_menu.ContextMenu.append] or [gid.webkitwebprocessextension6.context_menu.ContextMenu.insert].
      See also [gid.webkitwebprocessextension6.context_menu.ContextMenu.newWithItems] to create a #WebKitContextMenu with
      a list of initial items.
      Returns: The newly created #WebKitContextMenu object
  */
  this() nothrow
  {
    WebKitContextMenu* _cretval;
    _cretval = webkit_context_menu_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #WebKitContextMenu object with the given items.
      
      Creates a new #WebKitContextMenu object to be used as a submenu of an existing
      #WebKitContextMenu with the given initial items.
      See also [gid.webkitwebprocessextension6.context_menu.ContextMenu.new_]
  
      Params:
        items = a #GList of #WebKitContextMenuItem
      Returns: The newly created #WebKitContextMenu object
  */
  static gid.webkit6.context_menu.ContextMenu newWithItems(gid.webkit6.context_menu_item.ContextMenuItem[] items) nothrow
  {
    WebKitContextMenu* _cretval;
    auto _items = gListFromD!(gid.webkit6.context_menu_item.ContextMenuItem)(items);
    scope(exit) containerFree!(GList*, gid.webkit6.context_menu_item.ContextMenuItem, GidOwnership.None)(_items);
    _cretval = webkit_context_menu_new_with_items(_items);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu.ContextMenu)(cast(WebKitContextMenu*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Adds item at the end of the menu.
  
      Params:
        item = the #WebKitContextMenuItem to add
  */
  void append(gid.webkit6.context_menu_item.ContextMenuItem item) nothrow
  {
    webkit_context_menu_append(cast(WebKitContextMenu*)this._cPtr, item ? cast(WebKitContextMenuItem*)item._cPtr(No.Dup) : null);
  }

  /**
      Gets the first item in the menu.
      Returns: the first #WebKitContextMenuItem of menu,
           or null if the #WebKitContextMenu is empty.
  */
  gid.webkit6.context_menu_item.ContextMenuItem first() nothrow
  {
    WebKitContextMenuItem* _cretval;
    _cretval = webkit_context_menu_first(cast(WebKitContextMenu*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GdkEvent that triggered the context menu. This function only returns a valid
      #GdkEvent when called for a #WebKitContextMenu passed to #WebKitWebView::context-menu
      signal; in all other cases, null is returned.
      
      The returned #GdkEvent is expected to be one of the following types:
      <itemizedlist>
      <listitem><para>
      a #GdkEventButton of type [gid.gdk4.types.EventType.ButtonPress] when the context menu was triggered with mouse.
      </para></listitem>
      <listitem><para>
      a #GdkEventKey of type [gid.gdk4.types.EventType.KeyPress] if the keyboard was used to show the menu.
      </para></listitem>
      <listitem><para>
      a generic #GdkEvent of type [gid.gdk3.types.EventType.Nothing] when the #GtkWidget::popup-menu signal was used to show the context menu.
      </para></listitem>
      </itemizedlist>
      Returns: the menu event or null.
  */
  gid.gdk4.event.Event getEvent() nothrow
  {
    GdkEvent* _cretval;
    _cretval = webkit_context_menu_get_event(cast(WebKitContextMenu*)this._cPtr);
    auto _retval = _cretval ? new gid.gdk4.event.Event(cast(GdkEvent*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the item at the given position in the menu.
  
      Params:
        position = the position of the item, counting from 0
      Returns: the #WebKitContextMenuItem at position position in menu,
           or null if the position is off the end of the menu.
  */
  gid.webkit6.context_menu_item.ContextMenuItem getItemAtPosition(uint position) nothrow
  {
    WebKitContextMenuItem* _cretval;
    _cretval = webkit_context_menu_get_item_at_position(cast(WebKitContextMenu*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the item list of menu.
      Returns: a #GList of
           #WebKitContextMenuItem<!-- -->s
  */
  gid.webkit6.context_menu_item.ContextMenuItem[] getItems() nothrow
  {
    GList* _cretval;
    _cretval = webkit_context_menu_get_items(cast(WebKitContextMenu*)this._cPtr);
    auto _retval = gListToD!(gid.webkit6.context_menu_item.ContextMenuItem, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the length of the menu.
      Returns: the number of #WebKitContextMenuItem<!-- -->s in menu
  */
  uint getNItems() nothrow
  {
    uint _retval;
    _retval = webkit_context_menu_get_n_items(cast(WebKitContextMenu*)this._cPtr);
    return _retval;
  }

  /**
      Gets the position in view coordinates where the context menu was triggered.
      
      This function only returns valid coordinates when called for a #WebKitContextMenu
      passed to #WebKitWebView::context-menu signal.
  
      Params:
        x = return location for the x coordinate
        y = return location for the y coordinate
      Returns: true if valid position coordinates are available, false otherwise
  */
  bool getPosition(out int x, out int y) nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_context_menu_get_position(cast(WebKitContextMenu*)this._cPtr, cast(int*)&x, cast(int*)&y);
    return _retval;
  }

  /**
      Gets the user data of menu.
      
      This function can be used from the UI Process to get user data previously set
      from the Web Process with [gid.webkitwebprocessextension6.context_menu.ContextMenu.setUserData].
      Returns: the user data of menu, or null if menu doesn't have user data
  */
  gid.glib2.variant.Variant getUserData() nothrow
  {
    GVariant* _cretval;
    _cretval = webkit_context_menu_get_user_data(cast(WebKitContextMenu*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Inserts item into the menu at the given position.
      
      If position is negative, or is larger than the number of items
      in the #WebKitContextMenu, the item is added on to the end of
      the menu. The first position is 0.
  
      Params:
        item = the #WebKitContextMenuItem to add
        position = the position to insert the item
  */
  void insert(gid.webkit6.context_menu_item.ContextMenuItem item, int position) nothrow
  {
    webkit_context_menu_insert(cast(WebKitContextMenu*)this._cPtr, item ? cast(WebKitContextMenuItem*)item._cPtr(No.Dup) : null, position);
  }

  /**
      Gets the last item in the menu.
      Returns: the last #WebKitContextMenuItem of menu,
           or null if the #WebKitContextMenu is empty.
  */
  gid.webkit6.context_menu_item.ContextMenuItem last() nothrow
  {
    WebKitContextMenuItem* _cretval;
    _cretval = webkit_context_menu_last(cast(WebKitContextMenu*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.webkit6.context_menu_item.ContextMenuItem)(cast(WebKitContextMenuItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Moves item to the given position in the menu.
      
      If position is negative, or is larger than the number of items
      in the #WebKitContextMenu, the item is added on to the end of
      the menu.
      The first position is 0.
  
      Params:
        item = the #WebKitContextMenuItem to add
        position = the new position to move the item
  */
  void moveItem(gid.webkit6.context_menu_item.ContextMenuItem item, int position) nothrow
  {
    webkit_context_menu_move_item(cast(WebKitContextMenu*)this._cPtr, item ? cast(WebKitContextMenuItem*)item._cPtr(No.Dup) : null, position);
  }

  /**
      Adds item at the beginning of the menu.
  
      Params:
        item = the #WebKitContextMenuItem to add
  */
  void prepend(gid.webkit6.context_menu_item.ContextMenuItem item) nothrow
  {
    webkit_context_menu_prepend(cast(WebKitContextMenu*)this._cPtr, item ? cast(WebKitContextMenuItem*)item._cPtr(No.Dup) : null);
  }

  /**
      Removes item from the menu.
      
      See also [gid.webkitwebprocessextension6.context_menu.ContextMenu.removeAll] to remove all items.
  
      Params:
        item = the #WebKitContextMenuItem to remove
  */
  void remove(gid.webkit6.context_menu_item.ContextMenuItem item) nothrow
  {
    webkit_context_menu_remove(cast(WebKitContextMenu*)this._cPtr, item ? cast(WebKitContextMenuItem*)item._cPtr(No.Dup) : null);
  }

  /**
      Removes all items of the menu.
  */
  void removeAll() nothrow
  {
    webkit_context_menu_remove_all(cast(WebKitContextMenu*)this._cPtr);
  }

  /**
      Sets user data to menu.
      
      This function can be used from a Web Process extension to set user data
      that can be retrieved from the UI Process using [gid.webkitwebprocessextension6.context_menu.ContextMenu.getUserData].
      If the user_data #GVariant is floating, it is consumed.
  
      Params:
        userData = a #GVariant
  */
  void setUserData(gid.glib2.variant.Variant userData) nothrow
  {
    webkit_context_menu_set_user_data(cast(WebKitContextMenu*)this._cPtr, userData ? cast(GVariant*)userData._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.webkit6.context_menu.ContextMenu]
class ContextMenuGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.webkit6.context_menu.ContextMenu]
final class ContextMenuGidBuilder : ContextMenuGidBuilderImpl!ContextMenuGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ContextMenu build() nothrow
  {
    return new ContextMenu(cast(void*)createGObject(ContextMenu._getGType), Yes.Take);
  }
}
