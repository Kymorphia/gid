/// Module for [ViewStackPage] class
module adw.view_stack_page;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.widget;

/**
    An auxiliary class used by [adw.view_stack.ViewStack].
*/
class ViewStackPage : gobject.object.ObjectWrap, gtk.accessible.Accessible
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_view_stack_page_get_type != &gidSymbolNotFound ? adw_view_stack_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ViewStackPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.view_stack_page.ViewStackPage]
      Returns: New builder object
  */
  static ViewStackPageGidBuilder builder() nothrow
  {
    return new ViewStackPageGidBuilder;
  }

  /**
      Get `badgeNumber` property.
      Returns: The badge number for this page.
        
        [adw.view_switcher.ViewSwitcher] can display it as a badge next to the page icon. It is
        commonly used to display a number of unread items within the page.
        
        It can be used together with [adw.view_stack.ViewStack].
  */
  @property uint badgeNumber() nothrow
  {
    return getBadgeNumber();
  }

  /**
      Set `badgeNumber` property.
      Params:
        propval = The badge number for this page.
          
          [adw.view_switcher.ViewSwitcher] can display it as a badge next to the page icon. It is
          commonly used to display a number of unread items within the page.
          
          It can be used together with [adw.view_stack.ViewStack].
  */
  @property void badgeNumber(uint propval) nothrow
  {
    setBadgeNumber(propval);
  }

  /**
      Get `child` property.
      Returns: The stack child to which the page belongs.
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Get `iconName` property.
      Returns: The icon name of the child page.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name of the child page.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `name` property.
      Returns: The name of the child page.
  */
  @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the child page.
  */
  @property void name(string propval) nothrow
  {
    setName(propval);
  }

  /**
      Get `needsAttention` property.
      Returns: Whether the page requires the user attention.
        
        [adw.view_switcher.ViewSwitcher] will display it as a dot next to the page icon.
  */
  @property bool needsAttention() nothrow
  {
    return getNeedsAttention();
  }

  /**
      Set `needsAttention` property.
      Params:
        propval = Whether the page requires the user attention.
          
          [adw.view_switcher.ViewSwitcher] will display it as a dot next to the page icon.
  */
  @property void needsAttention(bool propval) nothrow
  {
    setNeedsAttention(propval);
  }

  /**
      Get `title` property.
      Returns: The title of the child page.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the child page.
  */
  @property void title(string propval) nothrow
  {
    setTitle(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an embedded underline in the title indicates a mnemonic.
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an embedded underline in the title indicates a mnemonic.
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether this page is visible.
        
        This is independent from the [gtk.widget.Widget.visible] property of
        [adw.view_stack_page.ViewStackPage.child].
  */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether this page is visible.
          
          This is independent from the [gtk.widget.Widget.visible] property of
          [adw.view_stack_page.ViewStackPage.child].
  */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  mixin AccessibleT!();

  /**
      Gets the badge number for this page.
      Returns: the badge number for this page
  */
  uint getBadgeNumber() nothrow
  {
    uint _retval;
    _retval = adw_view_stack_page_get_badge_number(cast(AdwViewStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the stack child to which self belongs.
      Returns: the child to which self belongs
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_view_stack_page_get_child(cast(AdwViewStackPage*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name of the page.
      Returns: the icon name of the page
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_page_get_icon_name(cast(AdwViewStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the name of the page.
      Returns: the name of the page
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_page_get_name(cast(AdwViewStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the page requires the user attention.
      Returns: whether the page needs attention
  */
  bool getNeedsAttention() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_page_get_needs_attention(cast(AdwViewStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the page title.
      Returns: the page title
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_view_stack_page_get_title(cast(AdwViewStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether underlines in the page title indicate mnemonics.
      Returns: whether underlines in the page title indicate mnemonics
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_page_get_use_underline(cast(AdwViewStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is visible in its [adw.view_stack.ViewStack].
      
      This is independent from the [gtk.widget.Widget.visible]
      property of its widget.
      Returns: whether self is visible
  */
  bool getVisible() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_view_stack_page_get_visible(cast(AdwViewStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Sets the badge number for this page.
      
      [adw.view_switcher.ViewSwitcher] can display it as a badge next to the page icon. It is
      commonly used to display a number of unread items within the page.
      
      It can be used together with [adw.view_stack.ViewStack].
  
      Params:
        badgeNumber = the new value to set
  */
  void setBadgeNumber(uint badgeNumber) nothrow
  {
    adw_view_stack_page_set_badge_number(cast(AdwViewStackPage*)this._cPtr, badgeNumber);
  }

  /**
      Sets the icon name of the page.
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    adw_view_stack_page_set_icon_name(cast(AdwViewStackPage*)this._cPtr, _iconName);
  }

  /**
      Sets the name of the page.
  
      Params:
        name = the page name
  */
  void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    adw_view_stack_page_set_name(cast(AdwViewStackPage*)this._cPtr, _name);
  }

  /**
      Sets whether the page requires the user attention.
      
      [adw.view_switcher.ViewSwitcher] will display it as a dot next to the page icon.
  
      Params:
        needsAttention = the new value to set
  */
  void setNeedsAttention(bool needsAttention) nothrow
  {
    adw_view_stack_page_set_needs_attention(cast(AdwViewStackPage*)this._cPtr, needsAttention);
  }

  /**
      Sets the page title.
  
      Params:
        title = the page title
  */
  void setTitle(string title = null) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, Yes.Nullable);
    adw_view_stack_page_set_title(cast(AdwViewStackPage*)this._cPtr, _title);
  }

  /**
      Sets whether underlines in the page title indicate mnemonics.
  
      Params:
        useUnderline = the new value to set
  */
  void setUseUnderline(bool useUnderline) nothrow
  {
    adw_view_stack_page_set_use_underline(cast(AdwViewStackPage*)this._cPtr, useUnderline);
  }

  /**
      Sets whether page is visible in its [adw.view_stack.ViewStack].
      
      This is independent from the [gtk.widget.Widget.visible] property of
      [adw.view_stack_page.ViewStackPage.child].
  
      Params:
        visible = whether self is visible
  */
  void setVisible(bool visible) nothrow
  {
    adw_view_stack_page_set_visible(cast(AdwViewStackPage*)this._cPtr, visible);
  }
}

/// Fluent builder implementation template for [adw.view_stack_page.ViewStackPage]
class ViewStackPageGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, gtk.accessible.AccessibleGidBuilderImpl!T
{

  mixin AccessibleGidBuilderT!();

  /**
      Set `badgeNumber` property.
      Params:
        propval = The badge number for this page.
          
          [adw.view_switcher.ViewSwitcher] can display it as a badge next to the page icon. It is
          commonly used to display a number of unread items within the page.
          
          It can be used together with [adw.view_stack.ViewStack].
      Returns: Builder instance for fluent chaining
  */
  T badgeNumber(uint propval) nothrow
  {
    return setProperty("badge-number", propval);
  }

  /**
      Set `child` property.
      Params:
        propval = The stack child to which the page belongs.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name of the child page.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of the child page.
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `needsAttention` property.
      Params:
        propval = Whether the page requires the user attention.
          
          [adw.view_switcher.ViewSwitcher] will display it as a dot next to the page icon.
      Returns: Builder instance for fluent chaining
  */
  T needsAttention(bool propval) nothrow
  {
    return setProperty("needs-attention", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title of the child page.
      Returns: Builder instance for fluent chaining
  */
  T title(string propval) nothrow
  {
    return setProperty("title", propval);
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an embedded underline in the title indicates a mnemonic.
      Returns: Builder instance for fluent chaining
  */
  T useUnderline(bool propval) nothrow
  {
    return setProperty("use-underline", propval);
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether this page is visible.
          
          This is independent from the [gtk.widget.Widget.visible] property of
          [adw.view_stack_page.ViewStackPage.child].
      Returns: Builder instance for fluent chaining
  */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }
}

/// Fluent builder for [adw.view_stack_page.ViewStackPage]
final class ViewStackPageGidBuilder : ViewStackPageGidBuilderImpl!ViewStackPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ViewStackPage build() nothrow
  {
    return new ViewStackPage(cast(void*)createGObject(ViewStackPage._getGType), No.Take);
  }
}
