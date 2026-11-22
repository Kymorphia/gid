/// Module for [PreferencesDialog] class
module gid.adw1.preferences_dialog;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.dialog;
import gid.adw1.navigation_page;
import gid.adw1.preferences_page;
import gid.adw1.toast;
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
import gid.gtk4.shortcut_manager;
import gid.gtk4.shortcut_manager_mixin;
import gid.gtk4.widget;

/**
    A dialog showing application's preferences.
    
    <picture>
      <source srcset="preferences-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-dialog.png" alt="preferences-dialog">
    </picture>
    
    The [gid.adw1.preferences_dialog.PreferencesDialog] widget presents an application's preferences
    gathered into pages and groups. The preferences are searchable by the user.
    
    ## Actions
    
    `AdwPrefencesDialog` defines the `navigation.pop` action, it doesn't take any
    parameters and pops the current subpage from the navigation stack, equivalent
    to calling [gid.adw1.preferences_dialog.PreferencesDialog.popSubpage].
    
    ## CSS nodes
    
    [gid.adw1.preferences_dialog.PreferencesDialog] has a main CSS node with the name `dialog` and the
    style class `.preferences`.
*/
class PreferencesDialog : gid.adw1.dialog.Dialog
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
    return cast(void function())adw_preferences_dialog_get_type != &gidSymbolNotFound ? adw_preferences_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwPreferencesDialog";
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesDialog self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.preferences_dialog.PreferencesDialog]
      Returns: New builder object
  */
  static PreferencesDialogGidBuilder builder() nothrow
  {
    return new PreferencesDialogGidBuilder;
  }

  /**
      Get `searchEnabled` property.
      Returns: Whether search is enabled.
  */
  @property bool searchEnabled() nothrow
  {
    return getSearchEnabled();
  }

  /**
      Set `searchEnabled` property.
      Params:
        propval = Whether search is enabled.
  */
  @property void searchEnabled(bool propval) nothrow
  {
    setSearchEnabled(propval);
  }

  /**
      Get `visiblePage` property.
      Returns: The currently visible page.
  */
  @property gid.gtk4.widget.Widget visiblePage() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk4.widget.Widget)("visible-page");
  }

  /**
      Set `visiblePage` property.
      Params:
        propval = The currently visible page.
  */
  @property void visiblePage(gid.gtk4.widget.Widget propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk4.widget.Widget)("visible-page", propval);
  }

  /**
      Get `visiblePageName` property.
      Returns: The name of the currently visible page.
        
        See `property@AdwPreferencesDialog:visible-page`.
  */
  @property string visiblePageName() nothrow
  {
    return getVisiblePageName();
  }

  /**
      Set `visiblePageName` property.
      Params:
        propval = The name of the currently visible page.
          
          See `property@AdwPreferencesDialog:visible-page`.
  */
  @property void visiblePageName(string propval) nothrow
  {
    setVisiblePageName(propval);
  }

  /**
      Creates a new [gid.adw1.preferences_dialog.PreferencesDialog].
      Returns: the newly created [gid.adw1.preferences_dialog.PreferencesDialog]
  */
  this() nothrow
  {
    AdwDialog* _cretval;
    _cretval = adw_preferences_dialog_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a preferences page to self.
  
      Params:
        page = the page to add
  */
  void add(gid.adw1.preferences_page.PreferencesPage page) nothrow
  {
    adw_preferences_dialog_add(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Displays toast.
      
      See [gid.adw1.toast_overlay.ToastOverlay.addToast].
  
      Params:
        toast = a toast
  */
  void addToast(gid.adw1.toast.Toast toast) nothrow
  {
    adw_preferences_dialog_add_toast(cast(AdwPreferencesDialog*)this._cPtr, toast ? cast(AdwToast*)toast._cPtr(Yes.Dup) : null);
  }

  /**
      Gets whether search is enabled for self.
      Returns: whether search is enabled for self.
  */
  bool getSearchEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_dialog_get_search_enabled(cast(AdwPreferencesDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently visible page of self.
      Returns: the visible page
  */
  gid.adw1.preferences_page.PreferencesPage getVisiblePage() nothrow
  {
    AdwPreferencesPage* _cretval;
    _cretval = adw_preferences_dialog_get_visible_page(cast(AdwPreferencesDialog*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.preferences_page.PreferencesPage)(cast(AdwPreferencesPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of currently visible page of self.
      Returns: the name of the visible page
  */
  string getVisiblePageName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_dialog_get_visible_page_name(cast(AdwPreferencesDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Pop the visible page from the subpage stack of self.
      Returns: `TRUE` if a page has been popped
  */
  bool popSubpage() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_dialog_pop_subpage(cast(AdwPreferencesDialog*)this._cPtr);
    return _retval;
  }

  /**
      Pushes page onto the subpage stack of self.
      
      The page will be automatically removed when popped.
  
      Params:
        page = the subpage
  */
  void pushSubpage(gid.adw1.navigation_page.NavigationPage page) nothrow
  {
    adw_preferences_dialog_push_subpage(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Removes a page from self.
  
      Params:
        page = the page to remove
  */
  void remove(gid.adw1.preferences_page.PreferencesPage page) nothrow
  {
    adw_preferences_dialog_remove(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Sets whether search is enabled for self.
  
      Params:
        searchEnabled = whether search is enabled
  */
  void setSearchEnabled(bool searchEnabled) nothrow
  {
    adw_preferences_dialog_set_search_enabled(cast(AdwPreferencesDialog*)this._cPtr, searchEnabled);
  }

  /**
      Makes page the visible page of self.
  
      Params:
        page = a page of self
  */
  void setVisiblePage(gid.adw1.preferences_page.PreferencesPage page) nothrow
  {
    adw_preferences_dialog_set_visible_page(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Makes the page with the given name visible.
      
      See [gid.adw1.preferences_dialog.PreferencesDialog.visiblePage].
  
      Params:
        name = the name of the page to make visible
  */
  void setVisiblePageName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    adw_preferences_dialog_set_visible_page_name(cast(AdwPreferencesDialog*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [gid.adw1.preferences_dialog.PreferencesDialog]
class PreferencesDialogGidBuilderImpl(T) : gid.adw1.dialog.DialogGidBuilderImpl!T
{


  /**
      Set `searchEnabled` property.
      Params:
        propval = Whether search is enabled.
      Returns: Builder instance for fluent chaining
  */
  T searchEnabled(bool propval) nothrow
  {
    return setProperty("search-enabled", propval);
  }

  /**
      Set `visiblePage` property.
      Params:
        propval = The currently visible page.
      Returns: Builder instance for fluent chaining
  */
  T visiblePage(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("visible-page", propval);
  }

  /**
      Set `visiblePageName` property.
      Params:
        propval = The name of the currently visible page.
          
          See `property@AdwPreferencesDialog:visible-page`.
      Returns: Builder instance for fluent chaining
  */
  T visiblePageName(string propval) nothrow
  {
    return setProperty("visible-page-name", propval);
  }
}

/// Fluent builder for [gid.adw1.preferences_dialog.PreferencesDialog]
final class PreferencesDialogGidBuilder : PreferencesDialogGidBuilderImpl!PreferencesDialogGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PreferencesDialog build() nothrow
  {
    return new PreferencesDialog(cast(void*)createGObject(PreferencesDialog._getGType), Yes.Take);
  }
}
