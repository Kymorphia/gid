/// Module for [PreferencesPage] class
module adw.preferences_page;

import adw.c.functions;
import adw.c.types;
import adw.preferences_group;
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
    A page from `class@PreferencesDialog`.
    
    <picture>
      <source srcset="preferences-page-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-page.png" alt="preferences-page">
    </picture>
    
    The [adw.preferences_page.PreferencesPage] widget gathers preferences groups into a single page
    of a preferences window.
    
    ## CSS nodes
    
    [adw.preferences_page.PreferencesPage] has a single CSS node with name `preferencespage`.
    
    ## Accessibility
    
    [adw.preferences_page.PreferencesPage] uses the [gtk.types.AccessibleRole.Group] role.
*/
class PreferencesPage : gtk.widget.Widget
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
    return cast(void function())adw_preferences_page_get_type != &gidSymbolNotFound ? adw_preferences_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesPage self()
  {
    return this;
  }

  /**
      Get `description` property.
      Returns: The description to be displayed at the top of the page.
  */
  @property string description()
  {
    return getDescription();
  }

  /**
      Set `description` property.
      Params:
        propval = The description to be displayed at the top of the page.
  */
  @property void description(string propval)
  {
    return setDescription(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for this page.
  */
  @property string iconName()
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this page.
  */
  @property void iconName(string propval)
  {
    return setIconName(propval);
  }

  /**
      Get `name` property.
      Returns: The name of this page.
  */
  override @property string name()
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of this page.
  */
  override @property void name(string propval)
  {
    return setName(propval);
  }

  /**
      Get `title` property.
      Returns: The title for this page.
  */
  @property string title()
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this page.
  */
  @property void title(string propval)
  {
    return setTitle(propval);
  }

  /**
      Get `useUnderline` property.
      Returns: Whether an embedded underline in the title indicates a mnemonic.
  */
  @property bool useUnderline()
  {
    return getUseUnderline();
  }

  /**
      Set `useUnderline` property.
      Params:
        propval = Whether an embedded underline in the title indicates a mnemonic.
  */
  @property void useUnderline(bool propval)
  {
    return setUseUnderline(propval);
  }

  /**
      Creates a new [adw.preferences_page.PreferencesPage].
      Returns: the newly created [adw.preferences_page.PreferencesPage]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_preferences_page_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a preferences group to self.
  
      Params:
        group = the group to add
  */
  void add(adw.preferences_group.PreferencesGroup group)
  {
    adw_preferences_page_add(cast(AdwPreferencesPage*)this._cPtr, group ? cast(AdwPreferencesGroup*)group._cPtr(No.Dup) : null);
  }

  /**
      Gets the description of self.
      Returns: the description of self.
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_description(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the icon name for self.
      Returns: the icon name for self
  */
  string getIconName()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_icon_name(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the name of self.
      Returns: the name of self
  */
  override string getName()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_name(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title of self.
  */
  string getTitle()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_title(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether an embedded underline in the title indicates a mnemonic.
      Returns: whether an embedded underline in the title indicates a mnemonic
  */
  bool getUseUnderline()
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_page_get_use_underline(cast(AdwPreferencesPage*)this._cPtr);
    return _retval;
  }

  /**
      Removes a group from self.
  
      Params:
        group = the group to remove
  */
  void remove(adw.preferences_group.PreferencesGroup group)
  {
    adw_preferences_page_remove(cast(AdwPreferencesPage*)this._cPtr, group ? cast(AdwPreferencesGroup*)group._cPtr(No.Dup) : null);
  }

  /**
      Scrolls the scrolled window of self to the top.
  */
  void scrollToTop()
  {
    adw_preferences_page_scroll_to_top(cast(AdwPreferencesPage*)this._cPtr);
  }

  /**
      Sets the description of self.
      
      The description is displayed at the top of the page.
  
      Params:
        description = the description
  */
  void setDescription(string description)
  {
    const(char)* _description = description.toCString(No.Alloc);
    adw_preferences_page_set_description(cast(AdwPreferencesPage*)this._cPtr, _description);
  }

  /**
      Sets the icon name for self.
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName = null)
  {
    const(char)* _iconName = iconName.toCString(No.Alloc);
    adw_preferences_page_set_icon_name(cast(AdwPreferencesPage*)this._cPtr, _iconName);
  }

  /**
      Sets the name of self.
  
      Params:
        name = the name
  */
  override void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    adw_preferences_page_set_name(cast(AdwPreferencesPage*)this._cPtr, _name);
  }

  /**
      Sets the title of self.
  
      Params:
        title = the title
  */
  void setTitle(string title)
  {
    const(char)* _title = title.toCString(No.Alloc);
    adw_preferences_page_set_title(cast(AdwPreferencesPage*)this._cPtr, _title);
  }

  /**
      Sets whether an embedded underline in the title indicates a mnemonic.
  
      Params:
        useUnderline = `TRUE` if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline)
  {
    adw_preferences_page_set_use_underline(cast(AdwPreferencesPage*)this._cPtr, useUnderline);
  }
}
