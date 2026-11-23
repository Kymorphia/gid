/// Module for [PreferencesPage] class
module gid.adw1.preferences_page;

public import gid.core.basictypes;
import gid.adw1.banner;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.preferences_group;
import gid.adw1.types;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.widget;

/**
    A page from [gid.adw1.preferences_dialog.PreferencesDialog].
    
    <picture>
      <source srcset="preferences-page-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-page.png" alt="preferences-page">
    </picture>
    
    The [gid.adw1.preferences_page.PreferencesPage] widget gathers preferences groups into a single page
    of a preferences window.
    
    ## CSS nodes
    
    [gid.adw1.preferences_page.PreferencesPage] has a single CSS node with name `preferencespage`.
    
    ## Accessibility
    
    [gid.adw1.preferences_page.PreferencesPage] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
class PreferencesPage : gid.gtk4.widget.Widget
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
    return cast(void function())adw_preferences_page_get_type != &gidSymbolNotFound ? adw_preferences_page_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwPreferencesPage";
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesPage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.preferences_page.PreferencesPage]
      Returns: New builder object
  */
  static PreferencesPageGidBuilder builder() nothrow
  {
    return new PreferencesPageGidBuilder;
  }

  /**
      Get `banner` property.
      Returns: A [gid.adw1.banner.Banner] displayed at the top of the page.
  */
  @property gid.adw1.banner.Banner banner() nothrow
  {
    return getBanner();
  }

  /**
      Set `banner` property.
      Params:
        propval = A [gid.adw1.banner.Banner] displayed at the top of the page.
  */
  @property void banner(gid.adw1.banner.Banner propval) nothrow
  {
    setBanner(propval);
  }

  /**
      Get `description` property.
      Returns: The description to be displayed at the top of the page.
  */
  @property string description() nothrow
  {
    return getDescription();
  }

  /**
      Set `description` property.
      Params:
        propval = The description to be displayed at the top of the page.
  */
  @property void description(string propval) nothrow
  {
    setDescription(propval);
  }

  /**
      Get `descriptionCentered` property.
      Returns: Whether the description should be centered.
  */
  @property bool descriptionCentered() nothrow
  {
    return getDescriptionCentered();
  }

  /**
      Set `descriptionCentered` property.
      Params:
        propval = Whether the description should be centered.
  */
  @property void descriptionCentered(bool propval) nothrow
  {
    setDescriptionCentered(propval);
  }

  /**
      Get `iconName` property.
      Returns: The icon name for this page.
  */
  @property string iconName() nothrow
  {
    return getIconName();
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this page.
  */
  @property void iconName(string propval) nothrow
  {
    setIconName(propval);
  }

  /**
      Get `name` property.
      Returns: The name of this page.
  */
  override @property string name() nothrow
  {
    return getName();
  }

  /**
      Set `name` property.
      Params:
        propval = The name of this page.
  */
  override @property void name(string propval) nothrow
  {
    setName(propval);
  }

  /**
      Get `title` property.
      Returns: The title for this page.
  */
  @property string title() nothrow
  {
    return getTitle();
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this page.
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
      Creates a new [gid.adw1.preferences_page.PreferencesPage].
      Returns: the newly created [gid.adw1.preferences_page.PreferencesPage]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = adw_preferences_page_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds a preferences group to self.
  
      Params:
        group = the group to add
  */
  void add(gid.adw1.preferences_group.PreferencesGroup group) nothrow
  {
    adw_preferences_page_add(cast(AdwPreferencesPage*)this._cPtr, group ? cast(AdwPreferencesGroup*)group._cPtr(No.Dup) : null);
  }

  /**
      Gets the banner displayed at the top of the page.
      Returns: the banner for self
  */
  gid.adw1.banner.Banner getBanner() nothrow
  {
    AdwBanner* _cretval;
    _cretval = adw_preferences_page_get_banner(cast(AdwPreferencesPage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.banner.Banner)(cast(AdwBanner*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the description of self.
      Returns: the description of self.
  */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_description(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the description is centered.
      Returns: whether the description is centered.
  */
  bool getDescriptionCentered() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_page_get_description_centered(cast(AdwPreferencesPage*)this._cPtr);
    return _retval;
  }

  /**
      Gets the group at index.
      
      Can return `NULL` if index is larger than the number of groups in the page.
  
      Params:
        index = a group index
      Returns: the group at index
  */
  gid.adw1.preferences_group.PreferencesGroup getGroup(uint index) nothrow
  {
    AdwPreferencesGroup* _cretval;
    _cretval = adw_preferences_page_get_group(cast(AdwPreferencesPage*)this._cPtr, index);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.preferences_group.PreferencesGroup)(cast(AdwPreferencesGroup*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the icon name for self.
      Returns: the icon name for self
  */
  string getIconName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_icon_name(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the name of self.
      Returns: the name of self
  */
  override string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_name(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the title of self.
      Returns: the title of self.
  */
  string getTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_page_get_title(cast(AdwPreferencesPage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether an embedded underline in the title indicates a mnemonic.
      Returns: whether an embedded underline in the title indicates a mnemonic
  */
  bool getUseUnderline() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_page_get_use_underline(cast(AdwPreferencesPage*)this._cPtr);
    return _retval;
  }

  /**
      Inserts a preferences group to self at index.
      
      If index is negative or larger than the number of groups, appends the group,
      same as [gid.adw1.preferences_page.PreferencesPage.add].
  
      Params:
        group = the group to add
        index = the index to insert group a
  */
  void insert(gid.adw1.preferences_group.PreferencesGroup group, int index) nothrow
  {
    adw_preferences_page_insert(cast(AdwPreferencesPage*)this._cPtr, group ? cast(AdwPreferencesGroup*)group._cPtr(No.Dup) : null, index);
  }

  /**
      Removes a group from self.
  
      Params:
        group = the group to remove
  */
  void remove(gid.adw1.preferences_group.PreferencesGroup group) nothrow
  {
    adw_preferences_page_remove(cast(AdwPreferencesPage*)this._cPtr, group ? cast(AdwPreferencesGroup*)group._cPtr(No.Dup) : null);
  }

  /**
      Scrolls the scrolled window of self to the top.
  */
  void scrollToTop() nothrow
  {
    adw_preferences_page_scroll_to_top(cast(AdwPreferencesPage*)this._cPtr);
  }

  /**
      Sets the banner displayed at the top of the page.
  
      Params:
        banner = the banner to display at the top of the page
  */
  void setBanner(gid.adw1.banner.Banner banner = null) nothrow
  {
    adw_preferences_page_set_banner(cast(AdwPreferencesPage*)this._cPtr, banner ? cast(AdwBanner*)banner._cPtr(No.Dup) : null);
  }

  /**
      Sets the description of self.
      
      The description is displayed at the top of the page.
  
      Params:
        description = the description
  */
  void setDescription(string description) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, No.Nullable);
    adw_preferences_page_set_description(cast(AdwPreferencesPage*)this._cPtr, _description);
  }

  /**
      Sets whether the description should be centered.
  
      Params:
        centered = If the description should be centered
  */
  void setDescriptionCentered(bool centered) nothrow
  {
    adw_preferences_page_set_description_centered(cast(AdwPreferencesPage*)this._cPtr, centered);
  }

  /**
      Sets the icon name for self.
  
      Params:
        iconName = the icon name
  */
  void setIconName(string iconName = null) nothrow
  {
    const(char)* _iconName = iconName.toCString!(No.Malloc, Yes.Nullable);
    adw_preferences_page_set_icon_name(cast(AdwPreferencesPage*)this._cPtr, _iconName);
  }

  /**
      Sets the name of self.
  
      Params:
        name = the name
  */
  override void setName(string name = null) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    adw_preferences_page_set_name(cast(AdwPreferencesPage*)this._cPtr, _name);
  }

  /**
      Sets the title of self.
  
      Params:
        title = the title
  */
  void setTitle(string title) nothrow
  {
    const(char)* _title = title.toCString!(No.Malloc, No.Nullable);
    adw_preferences_page_set_title(cast(AdwPreferencesPage*)this._cPtr, _title);
  }

  /**
      Sets whether an embedded underline in the title indicates a mnemonic.
  
      Params:
        useUnderline = `TRUE` if underlines in the text indicate mnemonics
  */
  void setUseUnderline(bool useUnderline) nothrow
  {
    adw_preferences_page_set_use_underline(cast(AdwPreferencesPage*)this._cPtr, useUnderline);
  }
}

/// Fluent builder implementation template for [gid.adw1.preferences_page.PreferencesPage]
class PreferencesPageGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `banner` property.
      Params:
        propval = A [gid.adw1.banner.Banner] displayed at the top of the page.
      Returns: Builder instance for fluent chaining
  */
  T banner(gid.adw1.banner.Banner propval) nothrow
  {
    return setProperty("banner", propval);
  }

  /**
      Set `description` property.
      Params:
        propval = The description to be displayed at the top of the page.
      Returns: Builder instance for fluent chaining
  */
  T description(string propval) nothrow
  {
    return setProperty("description", propval);
  }

  /**
      Set `descriptionCentered` property.
      Params:
        propval = Whether the description should be centered.
      Returns: Builder instance for fluent chaining
  */
  T descriptionCentered(bool propval) nothrow
  {
    return setProperty("description-centered", propval);
  }

  /**
      Set `iconName` property.
      Params:
        propval = The icon name for this page.
      Returns: Builder instance for fluent chaining
  */
  T iconName(string propval) nothrow
  {
    return setProperty("icon-name", propval);
  }

  /**
      Set `name` property.
      Params:
        propval = The name of this page.
      Returns: Builder instance for fluent chaining
  */
  override T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }

  /**
      Set `title` property.
      Params:
        propval = The title for this page.
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
}

/// Fluent builder for [gid.adw1.preferences_page.PreferencesPage]
final class PreferencesPageGidBuilder : PreferencesPageGidBuilderImpl!PreferencesPageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PreferencesPage build() nothrow
  {
    return new PreferencesPage(cast(void*)createGObject(PreferencesPage._getGType), Yes.Take);
  }
}
