/// Module for [ToolButton] class
module gtk.tool_button;

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
import gtk.tool_item;
import gtk.types;
import gtk.widget;

/**
    #GtkToolButtons are #GtkToolItems containing buttons.
    
    Use [gtk.tool_button.ToolButton.new_] to create a new #GtkToolButton.
    
    The label of a #GtkToolButton is determined by the properties
    #GtkToolButton:label-widget, #GtkToolButton:label, and
    #GtkToolButton:stock-id. If #GtkToolButton:label-widget is
    non-null, then that widget is used as the label. Otherwise, if
    #GtkToolButton:label is non-null, that string is used as the label.
    Otherwise, if #GtkToolButton:stock-id is non-null, the label is
    determined by the stock item. Otherwise, the button does not have a label.
    
    The icon of a #GtkToolButton is determined by the properties
    #GtkToolButton:icon-widget and #GtkToolButton:stock-id. If
    #GtkToolButton:icon-widget is non-null, then
    that widget is used as the icon. Otherwise, if #GtkToolButton:stock-id is
    non-null, the icon is determined by the stock item. Otherwise,
    the button does not have a icon.
    
    # CSS nodes
    
    GtkToolButton has a single CSS node with name toolbutton.
*/
class ToolButton : gtk.tool_item.ToolItem, gtk.actionable.Actionable
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
    return cast(void function())gtk_tool_button_get_type != &gidSymbolNotFound ? gtk_tool_button_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToolButton self()
  {
    return this;
  }

  /**
      Get `iconName` property.
      Returns: The name of the themed icon displayed on the item.
        This property only has an effect if not overridden by
        #GtkToolButton:label-widget, #GtkToolButton:icon-widget or
        #GtkToolButton:stock-id properties.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the themed icon displayed on the item.
          This property only has an effect if not overridden by
          #GtkToolButton:label-widget, #GtkToolButton:icon-widget or
          #GtkToolButton:stock-id properties.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /** */
  @property gtk.widget.Widget iconWidget()
  {
    return getIconWidget();
  }

  /** */
  @property void iconWidget(gtk.widget.Widget propval)
  {
    return setIconWidget(propval);
  }

  /** */
  @property string label()
  {
    return getLabel();
  }

  /** */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /** */
  @property gtk.widget.Widget labelWidget()
  {
    return getLabelWidget();
  }

  /** */
  @property void labelWidget(gtk.widget.Widget propval)
  {
    return setLabelWidget(propval);
  }

  /** */
  @property string stockId()
  {
    return getStockId();
  }

  /** */
  @property void stockId(string propval)
  {
    return setStockId(propval);
  }

  /** */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /** */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  mixin ActionableT!();

  /**
      Creates a new #GtkToolButton using icon_widget as contents and label as
      label.
  
      Params:
        iconWidget = a widget that will be used as the button contents, or null
        label = a string that will be used as label, or null
      Returns: A new #GtkToolButton
  */
  this(gtk.widget.Widget iconWidget = null, string label = null)
  {
    GtkToolItem* _cretval;
    const(char)* _label = label.toCString(No.Alloc);
    _cretval = gtk_tool_button_new(iconWidget ? cast(GtkWidget*)iconWidget._cPtr(No.Dup) : null, _label);
    this(_cretval, No.Take);
  }

  /**
      Creates a new #GtkToolButton containing the image and text from a
      stock item. Some stock ids have preprocessor macros like #GTK_STOCK_OK
      and #GTK_STOCK_APPLY.
      
      It is an error if stock_id is not a name of a stock item.
  
      Params:
        stockId = the name of the stock item
      Returns: A new #GtkToolButton
  
      Deprecated: Use [gtk.tool_button.ToolButton.new_] together with
        [gtk.image.Image.newFromIconName] instead.
  */
  static gtk.tool_button.ToolButton newFromStock(string stockId)
  {
    GtkToolItem* _cretval;
    const(char)* _stockId = stockId.toCString(No.Alloc);
    _cretval = gtk_tool_button_new_from_stock(_stockId);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.tool_button.ToolButton)(cast(GtkToolItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the themed icon for the tool button,
      see [gtk.tool_button.ToolButton.setIconName].
      Returns: the icon name or null if the tool button has
        no themed icon
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_tool_button_get_icon_name(cast(GtkToolButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Return the widget used as icon widget on button.
      See [gtk.tool_button.ToolButton.setIconWidget].
      Returns: The widget used as icon
            on button, or null.
  */
  gtk.widget.Widget getIconWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_button_get_icon_widget(cast(GtkToolButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the label used by the tool button, or null if the tool button
      doesn’t have a label. or uses a the label from a stock item. The returned
      string is owned by GTK+, and must not be modified or freed.
      Returns: The label, or null
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = gtk_tool_button_get_label(cast(GtkToolButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the widget used as label on button.
      See [gtk.tool_button.ToolButton.setLabelWidget].
      Returns: The widget used as label
            on button, or null.
  */
  gtk.widget.Widget getLabelWidget()
  {
    GtkWidget* _cretval;
    _cretval = gtk_tool_button_get_label_widget(cast(GtkToolButton*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the name of the stock item. See [gtk.tool_button.ToolButton.setStockId].
      The returned string is owned by GTK+ and must not be freed or modifed.
      Returns: the name of the stock item for button.
  
      Deprecated: Use [gtk.tool_button.ToolButton.getIconName] instead.
  */
  string getStockId()
  {
    const(char)* _cretval;
    _cretval = gtk_tool_button_get_stock_id(cast(GtkToolButton*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether underscores in the label property are used as mnemonics
      on menu items on the overflow menu. See [gtk.tool_button.ToolButton.setUseUnderline].
      Returns: true if underscores in the label property are used as
        mnemonics on menu items on the overflow menu.
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)gtk_tool_button_get_use_underline(cast(GtkToolButton*)this._cPtr);
    return _retval;
  }

  /**
      Sets the icon for the tool button from a named themed icon.
      See the docs for #GtkIconTheme for more details.
      The #GtkToolButton:icon-name property only has an effect if not
      overridden by non-null #GtkToolButton:label-widget,
      #GtkToolButton:icon-widget and #GtkToolButton:stock-id properties.
  
      Params:
        iconName = the name of the themed icon
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    gtk_tool_button_set_icon_name(cast(GtkToolButton*)this._cPtr, _iconName);
  }

  /**
      Sets icon as the widget used as icon on button. If icon_widget is
      null the icon is determined by the #GtkToolButton:stock-id property. If the
      #GtkToolButton:stock-id property is also null, button will not have an icon.
  
      Params:
        iconWidget = the widget used as icon, or null
  */
  void setIconWidget(gtk.widget.Widget iconWidget = null)
  {
    gtk_tool_button_set_icon_widget(cast(GtkToolButton*)this._cPtr, iconWidget ? cast(GtkWidget*)iconWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets label as the label used for the tool button. The #GtkToolButton:label
      property only has an effect if not overridden by a non-null
      #GtkToolButton:label-widget property. If both the #GtkToolButton:label-widget
      and #GtkToolButton:label properties are null, the label is determined by the
      #GtkToolButton:stock-id property. If the #GtkToolButton:stock-id property is
      also null, button will not have a label.
  
      Params:
        label = a string that will be used as label, or null.
  */
  void setLabel(string label = null)
  {
    const(char)* _label = label.toCString(No.Alloc);
    gtk_tool_button_set_label(cast(GtkToolButton*)this._cPtr, _label);
  }

  /**
      Sets label_widget as the widget that will be used as the label
      for button. If label_widget is null the #GtkToolButton:label property is used
      as label. If #GtkToolButton:label is also null, the label in the stock item
      determined by the #GtkToolButton:stock-id property is used as label. If
      #GtkToolButton:stock-id is also null, button does not have a label.
  
      Params:
        labelWidget = the widget used as label, or null
  */
  void setLabelWidget(gtk.widget.Widget labelWidget = null)
  {
    gtk_tool_button_set_label_widget(cast(GtkToolButton*)this._cPtr, labelWidget ? cast(GtkWidget*)labelWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets the name of the stock item. See [gtk.tool_button.ToolButton.newFromStock].
      The stock_id property only has an effect if not overridden by non-null
      #GtkToolButton:label-widget and #GtkToolButton:icon-widget properties.
  
      Params:
        stockId = a name of a stock item, or null
  
      Deprecated: Use [gtk.tool_button.ToolButton.setIconName] instead.
  */
  void setStockId(string stockId = null)
  {
    const(char)* _stockId = stockId.toCString(No.Alloc);
    gtk_tool_button_set_stock_id(cast(GtkToolButton*)this._cPtr, _stockId);
  }

  /**
      If set, an underline in the label property indicates that the next character
      should be used for the mnemonic accelerator key in the overflow menu. For
      example, if the label property is “_Open” and use_underline is true,
      the label on the tool button will be “Open” and the item on the overflow
      menu will have an underlined “O”.
      
      Labels shown on tool buttons never have mnemonics on them; this property
      only affects the menu item on the overflow menu.
  
      Params:
        useUnderline = whether the button label has the form “_Open”
  */
  void setUseUnderline(bool useUnderline)
  {
    gtk_tool_button_set_use_underline(cast(GtkToolButton*)this._cPtr, useUnderline);
  }

  /**
      Connect to `Clicked` signal.
  
      This signal is emitted when the tool button is clicked with the mouse
        or activated with the keyboard.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtk.tool_button.ToolButton toolButton))
  
          `toolButton` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectClicked(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtk.tool_button.ToolButton)))
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
    return connectSignalClosure("clicked", closure, after);
  }
}
