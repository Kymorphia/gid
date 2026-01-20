/// Module for [PreferencesDialog] class
module adw.preferences_dialog;

import adw.c.functions;
import adw.c.types;
import adw.dialog;
import adw.navigation_page;
import adw.preferences_page;
import adw.toast;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A dialog showing application's preferences.
    
    <picture>
      <source srcset="preferences-dialog-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-dialog.png" alt="preferences-dialog">
    </picture>
    
    The [adw.preferences_dialog.PreferencesDialog] widget presents an application's preferences
    gathered into pages and groups. The preferences are searchable by the user.
    
    ## CSS nodes
    
    [adw.preferences_dialog.PreferencesDialog] has a main CSS node with the name `dialog` and the
    style class `.preferences`.
*/
class PreferencesDialog : adw.dialog.Dialog
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
    return cast(void function())adw_preferences_dialog_get_type != &gidSymbolNotFound ? adw_preferences_dialog_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesDialog self()
  {
    return this;
  }

  /**
      Get `searchEnabled` property.
      Returns: Whether search is enabled.
  */
  @property bool searchEnabled()
  {
    return getSearchEnabled();
  }

  /**
      Set `searchEnabled` property.
      Params:
        propval = Whether search is enabled.
  */
  @property void searchEnabled(bool propval)
  {
    return setSearchEnabled(propval);
  }

  /**
      Get `visiblePage` property.
      Returns: The currently visible page.
  */
  @property gtk.widget.Widget visiblePage()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("visible-page");
  }

  /**
      Set `visiblePage` property.
      Params:
        propval = The currently visible page.
  */
  @property void visiblePage(gtk.widget.Widget propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.widget.Widget)("visible-page", propval);
  }

  /**
      Get `visiblePageName` property.
      Returns: The name of the currently visible page.
        
        See `property@AdwPreferencesDialog:visible-page`.
  */
  @property string visiblePageName()
  {
    return getVisiblePageName();
  }

  /**
      Set `visiblePageName` property.
      Params:
        propval = The name of the currently visible page.
          
          See `property@AdwPreferencesDialog:visible-page`.
  */
  @property void visiblePageName(string propval)
  {
    return setVisiblePageName(propval);
  }

  /**
      Creates a new [adw.preferences_dialog.PreferencesDialog].
      Returns: the newly created [adw.preferences_dialog.PreferencesDialog]
  */
  this()
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
  void add(adw.preferences_page.PreferencesPage page)
  {
    adw_preferences_dialog_add(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Displays toast.
      
      See [adw.toast_overlay.ToastOverlay.addToast].
  
      Params:
        toast = a toast
  */
  void addToast(adw.toast.Toast toast)
  {
    adw_preferences_dialog_add_toast(cast(AdwPreferencesDialog*)this._cPtr, toast ? cast(AdwToast*)toast._cPtr(Yes.Dup) : null);
  }

  /**
      Gets whether search is enabled for self.
      Returns: whether search is enabled for self.
  */
  bool getSearchEnabled()
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_dialog_get_search_enabled(cast(AdwPreferencesDialog*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently visible page of self.
      Returns: the visible page
  */
  adw.preferences_page.PreferencesPage getVisiblePage()
  {
    AdwPreferencesPage* _cretval;
    _cretval = adw_preferences_dialog_get_visible_page(cast(AdwPreferencesDialog*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.preferences_page.PreferencesPage)(cast(AdwPreferencesPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of currently visible page of self.
      Returns: the name of the visible page
  */
  string getVisiblePageName()
  {
    const(char)* _cretval;
    _cretval = adw_preferences_dialog_get_visible_page_name(cast(AdwPreferencesDialog*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Pop the visible page from the subpage stack of self.
      Returns: `TRUE` if a page has been popped
  */
  bool popSubpage()
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
  void pushSubpage(adw.navigation_page.NavigationPage page)
  {
    adw_preferences_dialog_push_subpage(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Removes a page from self.
  
      Params:
        page = the page to remove
  */
  void remove(adw.preferences_page.PreferencesPage page)
  {
    adw_preferences_dialog_remove(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Sets whether search is enabled for self.
  
      Params:
        searchEnabled = whether search is enabled
  */
  void setSearchEnabled(bool searchEnabled)
  {
    adw_preferences_dialog_set_search_enabled(cast(AdwPreferencesDialog*)this._cPtr, searchEnabled);
  }

  /**
      Makes page the visible page of self.
  
      Params:
        page = a page of self
  */
  void setVisiblePage(adw.preferences_page.PreferencesPage page)
  {
    adw_preferences_dialog_set_visible_page(cast(AdwPreferencesDialog*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Makes the page with the given name visible.
      
      See `propertyPreferencesDialog:visible-page`.
  
      Params:
        name = the name of the page to make visible
  */
  void setVisiblePageName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    adw_preferences_dialog_set_visible_page_name(cast(AdwPreferencesDialog*)this._cPtr, _name);
  }
}
