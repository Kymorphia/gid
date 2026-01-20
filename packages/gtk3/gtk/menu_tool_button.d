/// Module for [MenuToolButton] class
module gtk.menu_tool_button;

import atk.implementor_iface;
import atk.implementor_iface_mixin;
import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtk.actionable;
import gtk.actionable_mixin;
import gtk.activatable;
import gtk.activatable_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.menu;
import gtk.tool_button;
import gtk.types;
import gtk.widget;

/**
    A #GtkMenuToolButton is a #GtkToolItem that contains a button and
    a small additional button with an arrow. When clicked, the arrow
    button pops up a dropdown menu.
    
    Use [gtk.menu_tool_button.MenuToolButton.new_] to create a new
    #GtkMenuToolButton.
    
    # GtkMenuToolButton as GtkBuildable
    
    The GtkMenuToolButton implementation of the GtkBuildable interface
    supports adding a menu by specifying “menu” as the “type” attribute
    of a `<child>` element.
    
    An example for a UI definition fragment with menus:
    
    ```xml
    <object class="GtkMenuToolButton">
      <child type="menu">
        <object class="GtkMenu"/>
      </child>
    </object>
    ```
*/
class MenuToolButton : gtk.tool_button.ToolButton
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
    return cast(void function())gtk_menu_tool_button_get_type != &gidSymbolNotFound ? gtk_menu_tool_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MenuToolButton self()
  {
    return this;
  }

  /** */
  @property gtk.menu.Menu menu()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.menu.Menu)("menu");
  }

  /** */
  @property void menu(gtk.menu.Menu propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.menu.Menu)("menu", propval);
  }

  /**
      Creates a new #GtkMenuToolButton using icon_widget as icon and
      label as label.
  
      Params:
        iconWidget = a widget that will be used as icon widget, or null
        label = a string that will be used as label, or null
      Returns: the new #GtkMenuToolButton
  */
  this(gtk.widget.Widget iconWidget = null, string label = null)
  {
    GtkToolItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_menu_tool_button_new(iconWidget ? cast(GtkWidget*)iconWidget._cPtr(No.Dup) : null, _label);
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkMenuToolButton.
      The new #GtkMenuToolButton will contain an icon and label from
      the stock item indicated by stock_id.
  
      Params:
        stockId = the name of a stock item
      Returns: the new #GtkMenuToolButton
  
      Deprecated: Use [gtk.menu_tool_button.MenuToolButton.new_] instead.
  */
  static gtk.menu_tool_button.MenuToolButton newFromStock(string stockId)
  {
    GtkToolItem* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_menu_tool_button_new_from_stock(_stockId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.menu_tool_button.MenuToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkMenu associated with #GtkMenuToolButton.
      Returns: the #GtkMenu associated
            with #GtkMenuToolButton
  */
  gtk.widget.Widget getMenu()
  {
    GtkWidget* _cretval;
    _cretval = gtk_menu_tool_button_get_menu(cast(GtkMenuToolButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the tooltip markup text to be used as tooltip for the arrow button
      which pops up the menu.  See [gtk.tool_item.ToolItem.setTooltipText] for setting
      a tooltip on the whole #GtkMenuToolButton.
  
      Params:
        markup = markup text to be used as tooltip text for button’s arrow button
  */
  void setArrowTooltipMarkup(string markup)
  {
    const(char)* _markup = markup.toCString(No.Alloc);
    gtk_menu_tool_button_set_arrow_tooltip_markup(cast(GtkMenuToolButton*)this._cPtr, _markup);
  }

  /**
      Sets the tooltip text to be used as tooltip for the arrow button which
      pops up the menu.  See [gtk.tool_item.ToolItem.setTooltipText] for setting a tooltip
      on the whole #GtkMenuToolButton.
  
      Params:
        text = text to be used as tooltip text for button’s arrow button
  */
  void setArrowTooltipText(string text)
  {
    const(char)* _text = text.toCString(No.Alloc);
    gtk_menu_tool_button_set_arrow_tooltip_text(cast(GtkMenuToolButton*)this._cPtr, _text);
  }

  /**
      Sets the #GtkMenu that is popped up when the user clicks on the arrow.
      If menu is NULL, the arrow button becomes insensitive.
  
      Params:
        menu = the #GtkMenu associated with #GtkMenuToolButton
  */
  void setMenu(gtk.widget.Widget menu)
  {
    gtk_menu_tool_button_set_menu(cast(GtkMenuToolButton*)this._cPtr, menu ? cast(GtkWidget*)menu._cPtr(No.Dup) : null);
  }

  /**
      Connect to `ShowMenu` signal.
  
      The ::show-menu signal is emitted before the menu is shown.
        
        It can be used to populate the menu on demand, using
        [gtk.menu_tool_button.MenuToolButton.setMenu].
        
        Note that even if you populate the menu dynamically in this way,
        you must set an empty menu on the #GtkMenuToolButton beforehand,
        since the arrow is made insensitive if the menu is not set.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.menu_tool_button.MenuToolButton menuToolButton))
  
          `menuToolButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectShowMenu(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.menu_tool_button.MenuToolButton)))
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
    return connectSignalClosure("show-menu", closure, after);
  }
}
