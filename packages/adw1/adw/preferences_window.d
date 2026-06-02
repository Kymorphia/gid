/// Module for [PreferencesWindow] class
module adw.preferences_window;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.navigation_page;
import adw.preferences_page;
import adw.toast;
import adw.types;
import adw.window;
import gid.gid;
import gobject.gid_builder;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.native;
import gtk.native_mixin;
import gtk.root;
import gtk.root_mixin;
import gtk.shortcut_manager;
import gtk.shortcut_manager_mixin;
import gtk.widget;

/**
    A window to present an application's preferences.
    
    <picture>
      <source srcset="preferences-window-dark.png" media="(prefers-color-scheme: dark)">
      <img src="preferences-window.png" alt="preferences-window">
    </picture>
    
    The [adw.preferences_window.PreferencesWindow] widget presents an application's preferences
    gathered into pages and groups. The preferences are searchable by the user.
    
    ## CSS nodes
    
    [adw.preferences_window.PreferencesWindow] has a main CSS node with the name `window` and the
    style class `.preferences`.
*/
class PreferencesWindow : adw.window.Window
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
    return cast(void function())adw_preferences_window_get_type != &gidSymbolNotFound ? adw_preferences_window_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PreferencesWindow self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.preferences_window.PreferencesWindow]
      Returns: New builder object
  */
  static PreferencesWindowGidBuilder builder() nothrow
  {
    return new PreferencesWindowGidBuilder;
  }

  /**
      Get `canNavigateBack` property.
      Returns: Whether gestures and shortcuts for closing subpages are enabled.
        
        The supported gestures are:
        
        - One-finger swipe on touchscreens
        - Horizontal scrolling on touchpads (usually two-finger swipe)
        - Back mouse button
        
        The keyboard back key is also supported, as well as the
        <kbd>Alt</kbd>+<kbd>←</kbd> shortcut.
        
        For right-to-left locales, gestures and shortcuts are reversed.
  
      Deprecated: Use [adw.navigation_page.NavigationPage.canPop] instead.
        
        Has no effect for subpages added with
        [adw.preferences_window.PreferencesWindow.pushSubpage].
  */
  @property bool canNavigateBack() nothrow
  {
    return getCanNavigateBack();
  }

  /**
      Set `canNavigateBack` property.
      Params:
        propval = Whether gestures and shortcuts for closing subpages are enabled.
          
          The supported gestures are:
          
          - One-finger swipe on touchscreens
          - Horizontal scrolling on touchpads (usually two-finger swipe)
          - Back mouse button
          
          The keyboard back key is also supported, as well as the
          <kbd>Alt</kbd>+<kbd>←</kbd> shortcut.
          
          For right-to-left locales, gestures and shortcuts are reversed.
  
      Deprecated: Use [adw.navigation_page.NavigationPage.canPop] instead.
        
        Has no effect for subpages added with
        [adw.preferences_window.PreferencesWindow.pushSubpage].
  */
  @property void canNavigateBack(bool propval) nothrow
  {
    setCanNavigateBack(propval);
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
  @property gtk.widget.Widget visiblePage() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.widget.Widget)("visible-page");
  }

  /**
      Set `visiblePage` property.
      Params:
        propval = The currently visible page.
  */
  @property void visiblePage(gtk.widget.Widget propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(gtk.widget.Widget)("visible-page", propval);
  }

  /**
      Get `visiblePageName` property.
      Returns: The name of the currently visible page.
        
        See [adw.preferences_window.PreferencesWindow.visiblePage].
  */
  @property string visiblePageName() nothrow
  {
    return getVisiblePageName();
  }

  /**
      Set `visiblePageName` property.
      Params:
        propval = The name of the currently visible page.
          
          See [adw.preferences_window.PreferencesWindow.visiblePage].
  */
  @property void visiblePageName(string propval) nothrow
  {
    setVisiblePageName(propval);
  }

  /**
      Creates a new [adw.preferences_window.PreferencesWindow].
      Returns: the newly created [adw.preferences_window.PreferencesWindow]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_preferences_window_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a preferences page to self.
  
      Params:
        page = the page to add
  */
  void add(adw.preferences_page.PreferencesPage page) nothrow
  {
    adw_preferences_window_add(cast(AdwPreferencesWindow*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Displays toast.
      
      See [adw.toast_overlay.ToastOverlay.addToast].
  
      Params:
        toast = a toast
  */
  void addToast(adw.toast.Toast toast) nothrow
  {
    adw_preferences_window_add_toast(cast(AdwPreferencesWindow*)this._cPtr, toast ? cast(AdwToast*)toast._cPtr(Yes.Dup) : null);
  }

  /**
      Closes the current subpage.
      
      If there is no presented subpage, this does nothing.
  
      Deprecated: Use [adw.preferences_window.PreferencesWindow.popSubpage] instead.
  */
  void closeSubpage() nothrow
  {
    adw_preferences_window_close_subpage(cast(AdwPreferencesWindow*)this._cPtr);
  }

  /**
      Gets whether gestures and shortcuts for closing subpages are enabled.
      Returns: whether gestures and shortcuts are enabled.
  
      Deprecated: Use [adw.navigation_page.NavigationPage.getCanPop] instead.
  */
  bool getCanNavigateBack() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_window_get_can_navigate_back(cast(AdwPreferencesWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether search is enabled for self.
      Returns: whether search is enabled for self.
  */
  bool getSearchEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_window_get_search_enabled(cast(AdwPreferencesWindow*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently visible page of self.
      Returns: the visible page
  */
  adw.preferences_page.PreferencesPage getVisiblePage() nothrow
  {
    AdwPreferencesPage* _cretval;
    _cretval = adw_preferences_window_get_visible_page(cast(AdwPreferencesWindow*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.preferences_page.PreferencesPage)(cast(AdwPreferencesPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the name of currently visible page of self.
      Returns: the name of the visible page
  */
  string getVisiblePageName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_preferences_window_get_visible_page_name(cast(AdwPreferencesWindow*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Pop the visible page from the subpage stack of self.
      Returns: `TRUE` if a page has been popped
  */
  bool popSubpage() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_preferences_window_pop_subpage(cast(AdwPreferencesWindow*)this._cPtr);
    return _retval;
  }

  /**
      Sets subpage as the window's subpage and opens it.
      
      The transition can be cancelled by the user, in which case visible child will
      change back to the previously visible child.
  
      Params:
        subpage = the subpage
  
      Deprecated: Use [adw.preferences_window.PreferencesWindow.pushSubpage] instead.
  */
  void presentSubpage(gtk.widget.Widget subpage) nothrow
  {
    adw_preferences_window_present_subpage(cast(AdwPreferencesWindow*)this._cPtr, subpage ? cast(GtkWidget*)subpage._cPtr(No.Dup) : null);
  }

  /**
      Pushes page onto the subpage stack of self.
      
      The page will be automatically removed when popped.
  
      Params:
        page = the subpage
  */
  void pushSubpage(adw.navigation_page.NavigationPage page) nothrow
  {
    adw_preferences_window_push_subpage(cast(AdwPreferencesWindow*)this._cPtr, page ? cast(AdwNavigationPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Removes a page from self.
  
      Params:
        page = the page to remove
  */
  void remove(adw.preferences_page.PreferencesPage page) nothrow
  {
    adw_preferences_window_remove(cast(AdwPreferencesWindow*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Sets whether gestures and shortcuts for closing subpages are enabled.
      
      The supported gestures are:
      
      - One-finger swipe on touchscreens
      - Horizontal scrolling on touchpads (usually two-finger swipe)
      - Back mouse button
      
      The keyboard back key is also supported, as well as the
      <kbd>Alt</kbd>+<kbd>←</kbd> shortcut.
      
      For right-to-left locales, gestures and shortcuts are reversed.
  
      Params:
        canNavigateBack = the new value
  
      Deprecated: Use [adw.navigation_page.NavigationPage.setCanPop] instead.
        
        Has no effect for subpages added with [adw.preferences_window.PreferencesWindow.pushSubpage].
  */
  void setCanNavigateBack(bool canNavigateBack) nothrow
  {
    adw_preferences_window_set_can_navigate_back(cast(AdwPreferencesWindow*)this._cPtr, canNavigateBack);
  }

  /**
      Sets whether search is enabled for self.
  
      Params:
        searchEnabled = whether search is enabled
  */
  void setSearchEnabled(bool searchEnabled) nothrow
  {
    adw_preferences_window_set_search_enabled(cast(AdwPreferencesWindow*)this._cPtr, searchEnabled);
  }

  /**
      Makes page the visible page of self.
  
      Params:
        page = a page of self
  */
  void setVisiblePage(adw.preferences_page.PreferencesPage page) nothrow
  {
    adw_preferences_window_set_visible_page(cast(AdwPreferencesWindow*)this._cPtr, page ? cast(AdwPreferencesPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Makes the page with the given name visible.
      
      See [adw.preferences_window.PreferencesWindow.visiblePage].
  
      Params:
        name = the name of the page to make visible
  */
  void setVisiblePageName(string name) nothrow
  {
    const(char)* _name = name.toCString(No.Alloc);
    adw_preferences_window_set_visible_page_name(cast(AdwPreferencesWindow*)this._cPtr, _name);
  }
}

/// Fluent builder implementation template for [adw.preferences_window.PreferencesWindow]
class PreferencesWindowGidBuilderImpl(T) : adw.window.WindowGidBuilderImpl!T
{


  /**
      Set `canNavigateBack` property.
      Params:
        propval = Whether gestures and shortcuts for closing subpages are enabled.
          
          The supported gestures are:
          
          - One-finger swipe on touchscreens
          - Horizontal scrolling on touchpads (usually two-finger swipe)
          - Back mouse button
          
          The keyboard back key is also supported, as well as the
          <kbd>Alt</kbd>+<kbd>←</kbd> shortcut.
          
          For right-to-left locales, gestures and shortcuts are reversed.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Use [adw.navigation_page.NavigationPage.canPop] instead.
        
        Has no effect for subpages added with
        [adw.preferences_window.PreferencesWindow.pushSubpage].
  */
  T canNavigateBack(bool propval) nothrow
  {
    return setProperty("can-navigate-back", propval);
  }

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
  T visiblePage(gtk.widget.Widget propval) nothrow
  {
    return setProperty("visible-page", propval);
  }

  /**
      Set `visiblePageName` property.
      Params:
        propval = The name of the currently visible page.
          
          See [adw.preferences_window.PreferencesWindow.visiblePage].
      Returns: Builder instance for fluent chaining
  */
  T visiblePageName(string propval) nothrow
  {
    return setProperty("visible-page-name", propval);
  }
}

/// Fluent builder for [adw.preferences_window.PreferencesWindow]
final class PreferencesWindowGidBuilder : PreferencesWindowGidBuilderImpl!PreferencesWindowGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  PreferencesWindow build() nothrow
  {
    return new PreferencesWindow(cast(void*)createGObject(PreferencesWindow._getGType), No.Take);
  }
}
