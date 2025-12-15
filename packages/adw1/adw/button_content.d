/// Module for [ButtonContent] class
module adw.button_content;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A helper widget for creating buttons.
    
    <picture>
      <source srcset="button-content-dark.png" media="(prefers-color-scheme: dark)">
      <img src="button-content.png" alt="button-content">
    </picture>
    
    [adw.button_content.ButtonContent] is a box-like widget with an icon and a label.
    
    It's intended to be used as a direct child of [gtk.button.Button],
    [gtk.menu_button.MenuButton] or `class@SplitButton`, when they need to have both an
    icon and a label, as follows:
    
    ```xml
    <object class="GtkButton">
      <property name="child">
        <object class="AdwButtonContent">
          <property name="icon-name">document-open-symbolic</property>
          <property name="label" translatable="yes">_Open</property>
          <property name="use-underline">True</property>
        </object>
      </property>
    </object>
    ```
    
    [adw.button_content.ButtonContent] handles style classes and connecting the mnemonic to the
    button automatically.
    
    ## CSS nodes
    
    ```
    buttoncontent
    ╰── box
        ├── image
        ╰── label
    ```
    
    [adw.button_content.ButtonContent]'s CSS node is called `buttoncontent`. It contains a `box`
    subnode that serves as a container for the  `image` and `label` nodes.
    
    When inside a [gtk.button.Button] or [adw.split_button.SplitButton], the button will receive the
    `.image-text-button` style class. When inside a [gtk.menu_button.MenuButton], the
    internal [gtk.button.Button] will receive it instead.
    
    ## Accessibility
    
    [adw.button_content.ButtonContent] uses the [gtk.types.AccessibleRole.Group] role.
*/
class ButtonContent : gtk.widget.Widget
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
    return cast(void function())adw_button_content_get_type != &gidSymbolNotFound ? adw_button_content_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ButtonContent self()
  {
    return this;
  }

  /**
      Get `canShrink` property.
      Returns: Whether the button can be smaller than the natural size of its contents.
      
      If set to `TRUE`, the label will ellipsize.
      
      See `property@Gtk.Button:can-shrink`.
  */
  @property bool canShrink()
  {
    return getCanShrink();
  }

  /**
      Set `canShrink` property.
      Params:
        propval = Whether the button can be smaller than the natural size of its contents.
        
        If set to `TRUE`, the label will ellipsize.
        
        See `property@Gtk.Button:can-shrink`.
  */
  @property void canShrink(bool propval)
  {
    return setCanShrink(propval);
  }

  /**
      Get `iconName` property.
      Returns: The name of the displayed icon.
      
      If empty, the icon is not shown.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The name of the displayed icon.
        
        If empty, the icon is not shown.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `label` property.
      Returns: The displayed label.
  */
  @property string label()
  {
    return getLabel();
  }

  /**
      Set `label` property.
      Params:
        propval = The displayed label.
  */
  @property void label(string propval)
  {
    return setLabel(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an underline in the text indicates a mnemonic.
      
      The mnemonic can be used to activate the parent button.
      
      See `property@ButtonContent:label`.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an underline in the text indicates a mnemonic.
        
        The mnemonic can be used to activate the parent button.
        
        See `property@ButtonContent:label`.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Creates a new [adw.button_content.ButtonContent].
      Returns: the new created [adw.button_content.ButtonContent]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_button_content_new();
    this(_cretval, No.Take);
  }

  /**
      gets whether the button can be smaller than the natural size of its contents.
      Returns: whether the button can shrink
  */
  bool getCanShrink()
  {
    bool _retval;
    _retval = cast(bool)adw_button_content_get_can_shrink(cast(AdwButtonContent*)this._cPtr);
    return _retval;
  }

  /**
      Gets the name of the displayed icon.
      Returns: the icon name
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_button_content_get_icon_name(cast(AdwButtonContent*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the displayed label.
      Returns: the label
  */
  string getLabel()
  {
    const(char)* _cretval;
    _cretval = adw_button_content_get_label(cast(AdwButtonContent*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether an underline in the text indicates a mnemonic.
      Returns: whether an underline in the text indicates a mnemonic
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)adw_button_content_get_use_underline(cast(AdwButtonContent*)this._cPtr);
    return _retval;
  }

  /**
      Sets whether the button can be smaller than the natural size of its contents.
      
      If set to `TRUE`, the label will ellipsize.
      
      See [gtk.button.Button.setCanShrink].
  
      Params:
        canShrink = whether the button can shrink
  */
  void setCanShrink(bool canShrink)
  {
    adw_button_content_set_can_shrink(cast(AdwButtonContent*)this._cPtr, canShrink);
  }

  /**
      Sets the name of the displayed icon.
      
      If empty, the icon is not shown.
  
      Params:
        iconName = the new icon name
  */
  void setIconName(string iconName)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_button_content_set_icon_name(cast(AdwButtonContent*)this._cPtr, _iconName);
  }

  /**
      Sets the displayed label.
  
      Params:
        label = the new label
  */
  void setLabel(string label)
  {
    const(char)* _label = label.toCString(No.Alloc);
    adw_button_content_set_label(cast(AdwButtonContent*)this._cPtr, _label);
  }

  /**
      Sets whether an underline in the text indicates a mnemonic.
      
      The mnemonic can be used to activate the parent button.
      
      See `propertyButtonContent:label`.
  
      Params:
        useUnderline = whether an underline in the text indicates a mnemonic
  */
  void setUseUnderline(bool useUnderline)
  {
    adw_button_content_set_use_underline(cast(AdwButtonContent*)this._cPtr, useUnderline);
  }
}
