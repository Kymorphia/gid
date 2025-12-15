/// Module for [OptionMenuItem] class
module webkit.option_menu_item;

import gid.gid;
import gobject.boxed;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    One item of a #WebKitOptionMenu.
    
    The #WebKitOptionMenu is composed of WebKitOptionMenuItem<!-- -->s.
    A WebKitOptionMenuItem always has a label and can contain a tooltip text.
    You can use the WebKitOptionMenuItem of a #WebKitOptionMenu to build your
    own menus.
*/
class OptionMenuItem : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_option_menu_item_get_type != &gidSymbolNotFound ? webkit_option_menu_item_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OptionMenuItem self()
  {
    return this;
  }

  /**
      Make a copy of the #WebKitOptionMenuItem.
      Returns: A copy of passed in #WebKitOptionMenuItem
  */
  webkit.option_menu_item.OptionMenuItem copy()
  {
    WebKitOptionMenuItem* _cretval;
    _cretval = webkit_option_menu_item_copy(cast(WebKitOptionMenuItem*)this._cPtr);
    auto _retval = _cretval ? new webkit.option_menu_item.OptionMenuItem(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the label of a #WebKitOptionMenuItem.
      Returns: The label of item.
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = webkit_option_menu_item_get_label(cast(WebKitOptionMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the tooltip of a #WebKitOptionMenuItem.
      Returns: The tooltip of item, or null.
  */
  string getTooltip()
  {
    const(char)* _cretval;
    _cretval = webkit_option_menu_item_get_tooltip(cast(WebKitOptionMenuItem*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Whether a #WebKitOptionMenuItem is enabled.
      Returns: true if the item is enabled or false otherwise.
  */
  bool isEnabled()
  {
    bool _retval;
    _retval = cast(bool)webkit_option_menu_item_is_enabled(cast(WebKitOptionMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Whether a #WebKitOptionMenuItem is a group child.
      Returns: true if the item is a group child or false otherwise.
  */
  bool isGroupChild()
  {
    bool _retval;
    _retval = cast(bool)webkit_option_menu_item_is_group_child(cast(WebKitOptionMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Whether a #WebKitOptionMenuItem is a group label.
      Returns: true if the item is a group label or false otherwise.
  */
  bool isGroupLabel()
  {
    bool _retval;
    _retval = cast(bool)webkit_option_menu_item_is_group_label(cast(WebKitOptionMenuItem*)this._cPtr);
    return _retval;
  }

  /**
      Whether a #WebKitOptionMenuItem is the currently selected one.
      Returns: true if the item is selected or false otherwise.
  */
  bool isSelected()
  {
    bool _retval;
    _retval = cast(bool)webkit_option_menu_item_is_selected(cast(WebKitOptionMenuItem*)this._cPtr);
    return _retval;
  }
}
