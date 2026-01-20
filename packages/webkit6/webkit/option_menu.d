/// Module for [OptionMenu] class
module webkit.option_menu;

import gdk.event;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.option_menu_item;
import webkit.types;

/**
    Represents the dropdown menu of a `select` element in a #WebKitWebView.
    
    When a select element in a #WebKitWebView needs to display a dropdown menu, the signal
    #WebKitWebView::show-option-menu is emitted, providing a WebKitOptionMenu with the
    #WebKitOptionMenuItem<!-- -->s that should be displayed.
*/
class OptionMenu : gobject.object.ObjectWrap
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
    return cast(void function())webkit_option_menu_get_type != &gidSymbolNotFound ? webkit_option_menu_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OptionMenu self()
  {
    return this;
  }

  /**
      Activates the #WebKitOptionMenuItem at index in menu.
      
      Activating an item changes the value
      of the element making the item the active one. You are expected to close the menu with
      [webkit.option_menu.OptionMenu.close] after activating an item, calling this function again will have no
      effect.
  
      Params:
        index = the index of the item
  */
  void activateItem(uint index)
  {
    webkit_option_menu_activate_item(cast(WebKitOptionMenu*)this._cPtr, index);
  }

  /**
      Request to close a #WebKitOptionMenu.
      
      This emits WebKitOptionMenu::close signal.
      This function should always be called to notify WebKit that the associated
      menu has been closed. If the menu is closed and neither [webkit.option_menu.OptionMenu.selectItem]
      nor [webkit.option_menu.OptionMenu.activateItem] have been called, the element value remains
      unchanged.
  */
  void close()
  {
    webkit_option_menu_close(cast(WebKitOptionMenu*)this._cPtr);
  }

  /**
      Gets the #GdkEvent that triggered the dropdown menu.
      If menu was not triggered by a user interaction, like a mouse click,
      null is returned.
      Returns: the menu event or null.
  */
  gdk.event.Event getEvent()
  {
    GdkEvent* _cretval;
    _cretval = webkit_option_menu_get_event(cast(WebKitOptionMenu*)this._cPtr);
    auto _retval = _cretval ? new gdk.event.Event(cast(GdkEvent*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the #WebKitOptionMenuItem at index in menu.
  
      Params:
        index = the index of the item
      Returns: a #WebKitOptionMenuItem of menu.
  */
  webkit.option_menu_item.OptionMenuItem getItem(uint index)
  {
    WebKitOptionMenuItem* _cretval;
    _cretval = webkit_option_menu_get_item(cast(WebKitOptionMenu*)this._cPtr, index);
    auto _retval = _cretval ? new webkit.option_menu_item.OptionMenuItem(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the length of the menu.
      Returns: the number of #WebKitOptionMenuItem<!-- -->s in menu
  */
  uint getNItems()
  {
    uint _retval;
    _retval = webkit_option_menu_get_n_items(cast(WebKitOptionMenu*)this._cPtr);
    return _retval;
  }

  /**
      Selects the #WebKitOptionMenuItem at index in menu.
      
      Selecting an item changes the
      text shown by the combo button, but it doesn't change the value of the element. You need to
      explicitly activate the item with [webkit.option_menu.OptionMenu.selectItem] or close the menu with
      [webkit.option_menu.OptionMenu.close] in which case the currently selected item will be activated.
  
      Params:
        index = the index of the item
  */
  void selectItem(uint index)
  {
    webkit_option_menu_select_item(cast(WebKitOptionMenu*)this._cPtr, index);
  }

  /**
      Connect to `Close` signal.
  
      Emitted when closing a #WebKitOptionMenu is requested. This can happen
        when the user explicitly calls [webkit.option_menu.OptionMenu.close] or when the
        element is detached from the current page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(webkit.option_menu.OptionMenu optionMenu))
  
          `optionMenu` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClose(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : webkit.option_menu.OptionMenu)))
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
    return connectSignalClosure("close", closure, after);
  }
}
