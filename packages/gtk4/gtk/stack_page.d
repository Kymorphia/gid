/// Module for [StackPage] class
module gtk.stack_page;

import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget;

/**
    [gtk.stack_page.StackPage] is an auxiliary class used by [gtk.stack.Stack].
*/
class StackPage : gobject.object.ObjectWrap, gtk.accessible.Accessible
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
    return cast(void function())gtk_stack_page_get_type != &gidSymbolNotFound ? gtk_stack_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StackPage self()
  {
    return this;
  }

  /**
      Get `iconName` property.
      Returns: The icon name of the child page.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name of the child page.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `name` property.
      Returns: The name of the child page.
  */
  @property string name()
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the child page.
  */
  @property void name(string propval)
  {
    return setName(propval);
  }

  /**
      Get `needsAttention` property.
      Returns: Whether the page requires the user attention.
        
        This is used by the [gtk.stack_switcher.StackSwitcher] to change the
        appearance of the corresponding button when a page needs
        attention and it is not the current one.
  */
  @property bool needsAttention()
  {
    return getNeedsAttention();
  }

  /**
      Set `needsAttention` property.
      Params:
        propval = Whether the page requires the user attention.
          
          This is used by the [gtk.stack_switcher.StackSwitcher] to change the
          appearance of the corresponding button when a page needs
          attention and it is not the current one.
  */
  @property void needsAttention(bool propval)
  {
    return setNeedsAttention(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the child page.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the child page.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: If set, an underline in the title indicates a mnemonic.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set, an underline in the title indicates a mnemonic.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether this page is visible.
  */
  @property bool visible()
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether this page is visible.
  */
  @property void visible(bool propval)
  {
    return setVisible(propval);
  }

  mixin AccessibleT!();

  /**
      Returns the stack child to which self belongs.
      Returns: the child to which self belongs
  */
  gtk.widget.Widget getChild()
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_page_get_child(cast(GtkStackPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the icon name of the page.
      Returns: The value of the `propertyGtk.StackPage:icon-name` property
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = gtk_stack_page_get_icon_name(cast(GtkStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns the name of the page.
      Returns: The value of the [gtk.stack_page.StackPage.name] property
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = gtk_stack_page_get_name(cast(GtkStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Returns whether the page is marked as “needs attention”.
      Returns: The value of the `propertyGtk.StackPage:needs-attention`
          property.
  */
  bool getNeedsAttention()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_page_get_needs_attention(cast(GtkStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the page title.
      Returns: The value of the [gtk.stack_page.StackPage.title] property
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = gtk_stack_page_get_title(cast(GtkStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether underlines in the page title indicate mnemonics.
      Returns: The value of the `propertyGtk.StackPage:use-underline` property
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_page_get_use_underline(cast(GtkStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether page is visible in its [gtk.stack.Stack].
      
      This is independent from the [gtk.widget.Widget.visible]
      property of its widget.
      Returns: true if page is visible
  */
  bool getVisible()
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_page_get_visible(cast(GtkStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Sets the icon name of the page.
  
      Params:
        setting = the new value to set
  */
  void setIconName(string setting)
  {
    const(char)* _setting = setting.toCString(No.Alloc);
    gtk_stack_page_set_icon_name(cast(GtkStackPage*)this._cPtr, _setting);
  }

  /**
      Sets the name of the page.
  
      Params:
        setting = the new value to set
  */
  void setName(string setting)
  {
    const(char)* _setting = setting.toCString(No.Alloc);
    gtk_stack_page_set_name(cast(GtkStackPage*)this._cPtr, _setting);
  }

  /**
      Sets whether the page is marked as “needs attention”.
  
      Params:
        setting = the new value to set
  */
  void setNeedsAttention(bool setting)
  {
    gtk_stack_page_set_needs_attention(cast(GtkStackPage*)this._cPtr, setting);
  }

  /**
      Sets the page title.
  
      Params:
        setting = the new value to set
  */
  void setTitle(string setting)
  {
    const(char)* _setting = setting.toCString(No.Alloc);
    gtk_stack_page_set_title(cast(GtkStackPage*)this._cPtr, _setting);
  }

  /**
      Sets whether underlines in the page title indicate mnemonics.
  
      Params:
        setting = the new value to set
  */
  void setUseUnderline(bool setting)
  {
    gtk_stack_page_set_use_underline(cast(GtkStackPage*)this._cPtr, setting);
  }

  /**
      Sets whether page is visible in its [gtk.stack.Stack].
  
      Params:
        visible = The new property value
  */
  void setVisible(bool visible)
  {
    gtk_stack_page_set_visible(cast(GtkStackPage*)this._cPtr, visible);
  }
}
