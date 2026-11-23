/// Module for [StackPage] class
module gid.gtk4.stack_page;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    An auxiliary class used by [gid.gtk4.stack.Stack].
*/
class StackPage : gid.gobject2.object.ObjectWrap, gid.gtk4.accessible.Accessible
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
    return cast(void function())gtk_stack_page_get_type != &gidSymbolNotFound ? gtk_stack_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStackPage";
  }

  /** Returns `this`, for use in `with` statements. */
  override StackPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.stack_page.StackPage]
      Returns: New builder object
  */
  static StackPageGidBuilder builder() nothrow
  {
    return new StackPageGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child that this page is for.
  */
  @property gid.gtk4.widget.Widget child() nothrow
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
        
        This is used by the [gid.gtk4.stack_switcher.StackSwitcher] to change the
        appearance of the corresponding button when a page needs
        attention and it is not the current one.
  */
  @property bool needsAttention() nothrow
  {
    return getNeedsAttention();
  }

  /**
      Set `needsAttention` property.
      Params:
        propval = Whether the page requires the user attention.
          
          This is used by the [gid.gtk4.stack_switcher.StackSwitcher] to change the
          appearance of the corresponding button when a page needs
          attention and it is not the current one.
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
      Returns: If set, an underline in the title indicates a mnemonic.
  */
  @property bool useUnderline() nothrow
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = If set, an underline in the title indicates a mnemonic.
  */
  @property void useUnderline(bool propval) nothrow
  {
    setUseUnderline(propval);
  }

  /**
      Get `visible` property.
      Returns: Whether this page is visible.
  */
  @property bool visible() nothrow
  {
    return getVisible();
  }

  /**
      Set `visible` property.
      Params:
        propval = Whether this page is visible.
  */
  @property void visible(bool propval) nothrow
  {
    setVisible(propval);
  }

  mixin AccessibleT!();

  /**
      Returns the stack child to which self belongs.
      Returns: the child to which self belongs
  */
  gid.gtk4.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_stack_page_get_child(cast(GtkStackPage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the icon name of the page.
      Returns: The value of the [gid.gtk4.stack_page.StackPage.iconName] property
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_stack_page_get_icon_name(cast(GtkStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the name of the page.
      Returns: The value of the [gid.gtk4.stack_page.StackPage.name] property
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_stack_page_get_name(cast(GtkStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the page is marked as “needs attention”.
      Returns: The value of the [gid.gtk4.stack_page.StackPage.needsAttention]
          property.
  */
  bool getNeedsAttention() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_page_get_needs_attention(cast(GtkStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the page title.
      Returns: The value of the [gid.gtk4.stack_page.StackPage.title] property
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_stack_page_get_title(cast(GtkStackPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether underlines in the page title indicate mnemonics.
      Returns: The value of the [gid.gtk4.stack_page.StackPage.useUnderline] property
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_stack_page_get_use_underline(cast(GtkStackPage*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether page is visible in its [gid.gtk4.stack.Stack].
      
      This is independent from the [gid.gtk4.widget.Widget.visible]
      property of its widget.
      Returns: true if page is visible
  */
  bool getVisible() nothrow
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
  void setIconName(string setting) nothrow
  {
    const(char)* _setting = setting.toCString!(No.Malloc, No.Nullable);
    gtk_stack_page_set_icon_name(cast(GtkStackPage*)this._cPtr, _setting);
  }

  /**
      Sets the name of the page.
  
      Params:
        setting = the new value to set
  */
  void setName(string setting) nothrow
  {
    const(char)* _setting = setting.toCString!(No.Malloc, No.Nullable);
    gtk_stack_page_set_name(cast(GtkStackPage*)this._cPtr, _setting);
  }

  /**
      Sets whether the page is marked as “needs attention”.
  
      Params:
        setting = the new value to set
  */
  void setNeedsAttention(bool setting) nothrow
  {
    gtk_stack_page_set_needs_attention(cast(GtkStackPage*)this._cPtr, setting);
  }

  /**
      Sets the page title.
  
      Params:
        setting = the new value to set
  */
  void setTitle(string setting) nothrow
  {
    const(char)* _setting = setting.toCString!(No.Malloc, No.Nullable);
    gtk_stack_page_set_title(cast(GtkStackPage*)this._cPtr, _setting);
  }

  /**
      Sets whether underlines in the page title indicate mnemonics.
  
      Params:
        setting = the new value to set
  */
  void setUseUnderline(bool setting) nothrow
  {
    gtk_stack_page_set_use_underline(cast(GtkStackPage*)this._cPtr, setting);
  }

  /**
      Sets whether page is visible in its [gid.gtk4.stack.Stack].
  
      Params:
        visible = The new property value
  */
  void setVisible(bool visible) nothrow
  {
    gtk_stack_page_set_visible(cast(GtkStackPage*)this._cPtr, visible);
  }
}

/// Fluent builder implementation template for [gid.gtk4.stack_page.StackPage]
class StackPageGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gtk4.accessible.AccessibleGidBuilderImpl!T
{

  mixin AccessibleGidBuilderT!();

  /**
      Set `child` property.
      Params:
        propval = The child that this page is for.
      Returns: Builder instance for fluent chaining
  */
  T child(gid.gtk4.widget.Widget propval) nothrow
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
          
          This is used by the [gid.gtk4.stack_switcher.StackSwitcher] to change the
          appearance of the corresponding button when a page needs
          attention and it is not the current one.
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
        propval = If set, an underline in the title indicates a mnemonic.
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
      Returns: Builder instance for fluent chaining
  */
  T visible(bool propval) nothrow
  {
    return setProperty("visible", propval);
  }
}

/// Fluent builder for [gid.gtk4.stack_page.StackPage]
final class StackPageGidBuilder : StackPageGidBuilderImpl!StackPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StackPage build() nothrow
  {
    return new StackPage(cast(void*)createGObject(StackPage._getGType), Yes.Take);
  }
}
