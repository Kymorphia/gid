/// Module for [TabView] class
module gid.adw1.tab_view;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.tab_page;
import gid.adw1.types;
import gid.core.utils;
import gid.gio2.icon;
import gid.gio2.menu_model;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.selection_model;
import gid.gtk4.widget;

/**
    A dynamic tabbed container.
    
    [gid.adw1.tab_view.TabView] is a container which shows one child at a time. While it
    provides keyboard shortcuts for switching between pages, it does not provide
    a visible tab switcher and relies on external widgets for that, such as
    [gid.adw1.tab_bar.TabBar], [gid.adw1.tab_overview.TabOverview] and [gid.adw1.tab_button.TabButton].
    
    [gid.adw1.tab_view.TabView] maintains a [gid.adw1.tab_page.TabPage] object for each page, which holds
    additional per-page properties. You can obtain the [gid.adw1.tab_page.TabPage] for a page
    with [gid.adw1.tab_view.TabView.getPage], and as the return value for
    [gid.adw1.tab_view.TabView.append] and other functions for adding children.
    
    [gid.adw1.tab_view.TabView] only aims to be useful for dynamic tabs in multi-window
    document-based applications, such as web browsers, file managers, text
    editors or terminals. It does not aim to replace [gid.gtk4.notebook.Notebook] for use
    cases such as tabbed dialogs.
    
    As such, it does not support disabling page reordering or detaching.
    
    [gid.adw1.tab_view.TabView] adds a number of global page switching and reordering shortcuts.
    The [gid.adw1.tab_view.TabView.shortcuts] property can be used to manage them.
    
    See [gid.adw1.types.TabViewShortcuts] for the list of the available shortcuts. All of
    the shortcuts are enabled by default.
    
    [gid.adw1.tab_view.TabView.addShortcuts] and [gid.adw1.tab_view.TabView.removeShortcuts] can be
    used to manage shortcuts in a convenient way, for example:
    
    ```c
    adw_tab_view_remove_shortcuts (view, ADW_TAB_VIEW_SHORTCUT_CONTROL_HOME |
                                         ADW_TAB_VIEW_SHORTCUT_CONTROL_END);
    ```
    
    ## CSS nodes
    
    [gid.adw1.tab_view.TabView] has a main CSS node with the name `tabview`.
    
    ## Accessibility
    
    [gid.adw1.tab_view.TabView] uses the `enum@Gtk.AccessibleRole.tab-panel` role for the tab
    pages which are the accessible parent objects of the child widgets.
*/
@gidGir("TabView", "TabViewClass")
class TabView : gid.gtk4.widget.Widget
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
    return cast(void function())adw_tab_view_get_type != &gidSymbolNotFound ? adw_tab_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwTabView";
  }

  /** Returns `this`, for use in `with` statements. */
  override TabView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.tab_view.TabView]
      Returns: New builder object
  */
  static TabViewGidBuilder builder() nothrow
  {
    return new TabViewGidBuilder;
  }

  /**
      Get `defaultIcon` property.
      Returns: Default page icon.
        
        If a page doesn't provide its own icon via [gid.adw1.tab_page.TabPage.icon], a
        default icon may be used instead for contexts where having an icon is
        necessary.
        
        [gid.adw1.tab_bar.TabBar] will use default icon for pinned tabs in case the page is
        not loading, doesn't have an icon and an indicator. Default icon is never
        used for tabs that aren't pinned.
        
        [gid.adw1.tab_overview.TabOverview] will use default icon for pages with missing
        thumbnails.
        
        By default, the `adw-tab-icon-missing-symbolic` icon is used.
  */
  @property gid.gio2.icon.Icon defaultIcon() nothrow
  {
    return getDefaultIcon();
  }

  /**
      Set `defaultIcon` property.
      Params:
        propval = Default page icon.
          
          If a page doesn't provide its own icon via [gid.adw1.tab_page.TabPage.icon], a
          default icon may be used instead for contexts where having an icon is
          necessary.
          
          [gid.adw1.tab_bar.TabBar] will use default icon for pinned tabs in case the page is
          not loading, doesn't have an icon and an indicator. Default icon is never
          used for tabs that aren't pinned.
          
          [gid.adw1.tab_overview.TabOverview] will use default icon for pages with missing
          thumbnails.
          
          By default, the `adw-tab-icon-missing-symbolic` icon is used.
  */
  @property void defaultIcon(gid.gio2.icon.Icon propval) nothrow
  {
    setDefaultIcon(propval);
  }

  /**
      Get `isTransferringPage` property.
      Returns: Whether a page is being transferred.
        
        This property will be set to `TRUE` when a drag-n-drop tab transfer starts
        on any [gid.adw1.tab_view.TabView], and to `FALSE` after it ends.
        
        During the transfer, children cannot receive pointer input and a tab can
        be safely dropped on the tab view.
  */
  @property bool isTransferringPage() nothrow
  {
    return getIsTransferringPage();
  }

  /**
      Get `menuModel` property.
      Returns: Tab context menu model.
        
        When a context menu is shown for a tab, it will be constructed from the
        provided menu model. Use the [gid.adw1.tab_view.TabView.setupMenu] signal to set up
        the menu actions for the particular tab.
  */
  @property gid.gio2.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = Tab context menu model.
          
          When a context menu is shown for a tab, it will be constructed from the
          provided menu model. Use the [gid.adw1.tab_view.TabView.setupMenu] signal to set up
          the menu actions for the particular tab.
  */
  @property void menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `nPages` property.
      Returns: The number of pages in the tab view.
  */
  @property int nPages() nothrow
  {
    return getNPages();
  }

  /**
      Get `nPinnedPages` property.
      Returns: The number of pinned pages in the tab view.
        
        See [gid.adw1.tab_view.TabView.setPagePinned].
  */
  @property int nPinnedPages() nothrow
  {
    return getNPinnedPages();
  }

  /**
      Get `pages` property.
      Returns: A list model with the tab view's pages.
        
        This can be used to keep an up-to-date view.
        
        The model implements [gid.gtk4.section_model.SectionModel], with one section for pinned
        pages and one for the rest of the pages.
        
        It also implements [gid.gtk4.selection_model.SelectionModel] and can be used to track and
        change the selected page.
  */
  @property gid.gtk4.selection_model.SelectionModel pages() nothrow
  {
    return getPages();
  }

  /**
      Get `selectedPage` property.
      Returns: The currently selected page.
  */
  @property gid.adw1.tab_page.TabPage selectedPage() nothrow
  {
    return getSelectedPage();
  }

  /**
      Set `selectedPage` property.
      Params:
        propval = The currently selected page.
  */
  @property void selectedPage(gid.adw1.tab_page.TabPage propval) nothrow
  {
    setSelectedPage(propval);
  }

  /**
      Get `shortcuts` property.
      Returns: The enabled shortcuts.
        
        See [gid.adw1.types.TabViewShortcuts] for the list of the available shortcuts. All
        of the shortcuts are enabled by default.
        
        [gid.adw1.tab_view.TabView.addShortcuts] and [gid.adw1.tab_view.TabView.removeShortcuts]
        provide a convenient way to manage individual shortcuts.
  */
  @property gid.adw1.types.TabViewShortcuts shortcuts() nothrow
  {
    return getShortcuts();
  }

  /**
      Set `shortcuts` property.
      Params:
        propval = The enabled shortcuts.
          
          See [gid.adw1.types.TabViewShortcuts] for the list of the available shortcuts. All
          of the shortcuts are enabled by default.
          
          [gid.adw1.tab_view.TabView.addShortcuts] and [gid.adw1.tab_view.TabView.removeShortcuts]
          provide a convenient way to manage individual shortcuts.
  */
  @property void shortcuts(gid.adw1.types.TabViewShortcuts propval) nothrow
  {
    setShortcuts(propval);
  }

  /**
      Creates a new [gid.adw1.tab_view.TabView].
      Returns: the newly created [gid.adw1.tab_view.TabView]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      AdwTabView* _cretval;
      _cretval = adw_tab_view_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Adds child to self with parent as the parent.
      
      This function can be used to automatically position new pages, and to select
      the correct page when this page is closed while being selected (see
      [gid.adw1.tab_view.TabView.closePage]).
      
      If parent is `NULL`, this function is equivalent to [gid.adw1.tab_view.TabView.append].
  
      Params:
        child = a widget to add
        parent = a parent page for child
      Returns: the page object representing child
  */
  gid.adw1.tab_page.TabPage addPage(gid.gtk4.widget.Widget child, gid.adw1.tab_page.TabPage parent = null) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_add_page(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, parent ? cast(AdwTabPage*)parent._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds shortcuts for self.
      
      See [gid.adw1.tab_view.TabView.shortcuts] for details.
  
      Params:
        shortcuts = the shortcuts to add
  */
  void addShortcuts(gid.adw1.types.TabViewShortcuts shortcuts) nothrow
  {
    adw_tab_view_add_shortcuts(cast(AdwTabView*)this._cPtr, shortcuts);
  }

  /**
      Inserts child as the last non-pinned page.
  
      Params:
        child = a widget to add
      Returns: the page object representing child
  */
  gid.adw1.tab_page.TabPage append(gid.gtk4.widget.Widget child) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_append(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts child as the last pinned page.
  
      Params:
        child = a widget to add
      Returns: the page object representing child
  */
  gid.adw1.tab_page.TabPage appendPinned(gid.gtk4.widget.Widget child) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_append_pinned(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Requests to close all pages other than page.
  
      Params:
        page = a page of self
  */
  void closeOtherPages(gid.adw1.tab_page.TabPage page) nothrow
  {
    adw_tab_view_close_other_pages(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Requests to close page.
      
      Calling this function will result in the [gid.adw1.tab_view.TabView.closePage] signal
      being emitted for page. Closing the page can then be confirmed or
      denied via [gid.adw1.tab_view.TabView.closePageFinish].
      
      If the page is waiting for a [gid.adw1.tab_view.TabView.closePageFinish] call, this
      function will do nothing.
      
      The default handler for [gid.adw1.tab_view.TabView.closePage] will immediately confirm
      closing the page if it's non-pinned, or reject it if it's pinned. This
      behavior can be changed by registering your own handler for that signal.
      
      If page was selected, another page will be selected instead:
      
      If the [gid.adw1.tab_page.TabPage.parent] value is `NULL`, the next page will be
      selected when possible, or if the page was already last, the previous page
      will be selected instead.
      
      If it's not `NULL`, the previous page will be selected if it's a descendant
      (possibly indirect) of the parent. If both the previous page and the parent
      are pinned, the parent will be selected instead.
  
      Params:
        page = a page of self
  */
  void closePage(gid.adw1.tab_page.TabPage page) nothrow
  {
    adw_tab_view_close_page(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Completes a [gid.adw1.tab_view.TabView.closePage] call for page.
      
      If confirm is `TRUE`, page will be closed. If it's `FALSE`, it will be
      reverted to its previous state and [gid.adw1.tab_view.TabView.closePage] can be called
      for it again.
      
      This function should not be called unless a custom handler for
      [gid.adw1.tab_view.TabView.closePage] is used.
  
      Params:
        page = a page of self
        confirm = whether to confirm or deny closing page
  */
  void closePageFinish(gid.adw1.tab_page.TabPage page, bool confirm) nothrow
  {
    adw_tab_view_close_page_finish(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null, confirm);
  }

  /**
      Requests to close all pages after page.
  
      Params:
        page = a page of self
  */
  void closePagesAfter(gid.adw1.tab_page.TabPage page) nothrow
  {
    adw_tab_view_close_pages_after(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Requests to close all pages before page.
  
      Params:
        page = a page of self
  */
  void closePagesBefore(gid.adw1.tab_page.TabPage page) nothrow
  {
    adw_tab_view_close_pages_before(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
  }

  /**
      Gets the default icon of self.
      Returns: the default icon of self.
  */
  gid.gio2.icon.Icon getDefaultIcon() nothrow
  {
    GIcon* _cretval;
    _cretval = adw_tab_view_get_default_icon(cast(AdwTabView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Whether a page is being transferred.
      
      The corresponding property will be set to `TRUE` when a drag-n-drop tab
      transfer starts on any [gid.adw1.tab_view.TabView], and to `FALSE` after it ends.
      
      During the transfer, children cannot receive pointer input and a tab can
      be safely dropped on the tab view.
      Returns: whether a page is being transferred
  */
  bool getIsTransferringPage() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_get_is_transferring_page(cast(AdwTabView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tab context menu model for self.
      Returns: the tab context menu model for self
  */
  gid.gio2.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = adw_tab_view_get_menu_model(cast(AdwTabView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of pages in self.
      Returns: the number of pages in self
  */
  int getNPages() nothrow
  {
    int _retval;
    _retval = adw_tab_view_get_n_pages(cast(AdwTabView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the number of pinned pages in self.
      
      See [gid.adw1.tab_view.TabView.setPagePinned].
      Returns: the number of pinned pages in self
  */
  int getNPinnedPages() nothrow
  {
    int _retval;
    _retval = adw_tab_view_get_n_pinned_pages(cast(AdwTabView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.adw1.tab_page.TabPage] representing the child at position.
  
      Params:
        position = the index of the page in self, starting from 0
      Returns: the page object at position
  */
  gid.adw1.tab_page.TabPage getNthPage(int position) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_get_nth_page(cast(AdwTabView*)this._cPtr, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.adw1.tab_page.TabPage] object representing child.
  
      Params:
        child = a child in self
      Returns: the page object for child
  */
  gid.adw1.tab_page.TabPage getPage(gid.gtk4.widget.Widget child) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_get_page(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the position of page in self, starting from 0.
  
      Params:
        page = a page of self
      Returns: the position of page in self
  */
  int getPagePosition(gid.adw1.tab_page.TabPage page) nothrow
  {
    int _retval;
    _retval = adw_tab_view_get_page_position(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns a [gid.gio2.list_model.ListModel] that contains the pages of self.
      
      This can be used to keep an up-to-date view.
      
      The model implements [gid.gtk4.section_model.SectionModel], with one section for pinned
      pages and one for the rest of the pages.
      
      It also implements [gid.gtk4.selection_model.SelectionModel] and can be used to track and
      change the selected page.
      Returns: a [gid.gtk4.selection_model.SelectionModel] for the pages of self
  */
  gid.gtk4.selection_model.SelectionModel getPages() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_tab_view_get_pages(cast(AdwTabView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the currently selected page in self.
      Returns: the selected page
  */
  gid.adw1.tab_page.TabPage getSelectedPage() nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_get_selected_page(cast(AdwTabView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the enabled shortcuts for self.
      Returns: the shortcut mask
  */
  gid.adw1.types.TabViewShortcuts getShortcuts() nothrow
  {
    AdwTabViewShortcuts _cretval;
    _cretval = adw_tab_view_get_shortcuts(cast(AdwTabView*)this._cPtr);
    gid.adw1.types.TabViewShortcuts _retval = cast(gid.adw1.types.TabViewShortcuts)_cretval;
    return _retval;
  }

  /**
      Inserts a non-pinned page at position.
      
      It's an error to try to insert a page before a pinned page, in that case
      [gid.adw1.tab_view.TabView.insertPinned] should be used instead.
  
      Params:
        child = a widget to add
        position = the position to add child at, starting from 0
      Returns: the page object representing child
  */
  gid.adw1.tab_page.TabPage insert(gid.gtk4.widget.Widget child, int position) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_insert(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts a pinned page at position.
      
      It's an error to try to insert a pinned page after a non-pinned page, in
      that case [gid.adw1.tab_view.TabView.insert] should be used instead.
  
      Params:
        child = a widget to add
        position = the position to add child at, starting from 0
      Returns: the page object representing child
  */
  gid.adw1.tab_page.TabPage insertPinned(gid.gtk4.widget.Widget child, int position) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_insert_pinned(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null, position);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Invalidates thumbnails for all pages in self.
      
      This is a convenience method, equivalent to calling
      [gid.adw1.tab_page.TabPage.invalidateThumbnail] on each page.
  */
  void invalidateThumbnails() nothrow
  {
    adw_tab_view_invalidate_thumbnails(cast(AdwTabView*)this._cPtr);
  }

  /**
      Inserts child as the first non-pinned page.
  
      Params:
        child = a widget to add
      Returns: the page object representing child
  */
  gid.adw1.tab_page.TabPage prepend(gid.gtk4.widget.Widget child) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_prepend(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts child as the first pinned page.
  
      Params:
        child = a widget to add
      Returns: the page object representing child
  */
  gid.adw1.tab_page.TabPage prependPinned(gid.gtk4.widget.Widget child) nothrow
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_prepend_pinned(cast(AdwTabView*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes shortcuts from self.
      
      See [gid.adw1.tab_view.TabView.shortcuts] for details.
  
      Params:
        shortcuts = the shortcuts to remove
  */
  void removeShortcuts(gid.adw1.types.TabViewShortcuts shortcuts) nothrow
  {
    adw_tab_view_remove_shortcuts(cast(AdwTabView*)this._cPtr, shortcuts);
  }

  /**
      Reorders page to before its previous page if possible.
  
      Params:
        page = a page of self
      Returns: whether page was moved
  */
  bool reorderBackward(gid.adw1.tab_page.TabPage page) nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_reorder_backward(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to the first possible position.
  
      Params:
        page = a page of self
      Returns: whether page was moved
  */
  bool reorderFirst(gid.adw1.tab_page.TabPage page) nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_reorder_first(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to after its next page if possible.
  
      Params:
        page = a page of self
      Returns: whether page was moved
  */
  bool reorderForward(gid.adw1.tab_page.TabPage page) nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_reorder_forward(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to the last possible position.
  
      Params:
        page = a page of self
      Returns: whether page was moved
  */
  bool reorderLast(gid.adw1.tab_page.TabPage page) nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_reorder_last(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to position.
      
      It's a programmer error to try to reorder a pinned page after a non-pinned
      one, or a non-pinned page before a pinned one.
  
      Params:
        page = a page of self
        position = the position to insert the page at, starting at 0
      Returns: whether page was moved
  */
  bool reorderPage(gid.adw1.tab_page.TabPage page, int position) nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_reorder_page(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Selects the page after the currently selected page.
      
      If the last page was already selected, this function does nothing.
      Returns: whether the selected page was changed
  */
  bool selectNextPage() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_select_next_page(cast(AdwTabView*)this._cPtr);
    return _retval;
  }

  /**
      Selects the page before the currently selected page.
      
      If the first page was already selected, this function does nothing.
      Returns: whether the selected page was changed
  */
  bool selectPreviousPage() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_view_select_previous_page(cast(AdwTabView*)this._cPtr);
    return _retval;
  }

  /**
      Sets the default page icon for self.
      
      If a page doesn't provide its own icon via [gid.adw1.tab_page.TabPage.icon], a default
      icon may be used instead for contexts where having an icon is necessary.
      
      [gid.adw1.tab_bar.TabBar] will use default icon for pinned tabs in case the page is not
      loading, doesn't have an icon and an indicator. Default icon is never used
      for tabs that aren't pinned.
      
      [gid.adw1.tab_overview.TabOverview] will use default icon for pages with missing thumbnails.
      
      By default, the `adw-tab-icon-missing-symbolic` icon is used.
  
      Params:
        defaultIcon = the default icon
  */
  void setDefaultIcon(gid.gio2.icon.Icon defaultIcon) nothrow
  {
    adw_tab_view_set_default_icon(cast(AdwTabView*)this._cPtr, defaultIcon ? cast(GIcon*)(cast(gid.gobject2.object.ObjectWrap)defaultIcon)._cPtr(No.Dup) : null);
  }

  /**
      Sets the tab context menu model for self.
      
      When a context menu is shown for a tab, it will be constructed from the
      provided menu model. Use the [gid.adw1.tab_view.TabView.setupMenu] signal to set up
      the menu actions for the particular tab.
  
      Params:
        menuModel = a menu model
  */
  void setMenuModel(gid.gio2.menu_model.MenuModel menuModel = null) nothrow
  {
    adw_tab_view_set_menu_model(cast(AdwTabView*)this._cPtr, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
  }

  /**
      Pins or unpins page.
      
      Pinned pages are guaranteed to be placed before all non-pinned pages; at any
      given moment the first [gid.adw1.tab_view.TabView.nPinnedPages] pages in self are
      guaranteed to be pinned.
      
      When a page is pinned or unpinned, it's automatically reordered: pinning a
      page moves it after other pinned pages; unpinning a page moves it before
      other non-pinned pages.
      
      Pinned pages can still be reordered between each other.
      
      [gid.adw1.tab_bar.TabBar] will display pinned pages in a compact form, never showing the
      title or close button, and only showing a single icon, selected in the
      following order:
      
      1. [gid.adw1.tab_page.TabPage.indicatorIcon]
      2. A spinner if [gid.adw1.tab_page.TabPage.loading] is `TRUE`
      3. [gid.adw1.tab_page.TabPage.icon]
      4. [gid.adw1.tab_view.TabView.defaultIcon]
      
      [gid.adw1.tab_overview.TabOverview] will not show a thumbnail for pinned pages, and replace
      the close button with an unpin button. Unlike [gid.adw1.tab_bar.TabBar], it will still
      display the page's title, icon and indicator separately.
      
      Pinned pages cannot be closed by default, see [gid.adw1.tab_view.TabView.closePage]
      for how to override that behavior.
      
      Changes the value of the [gid.adw1.tab_page.TabPage.pinned] property.
  
      Params:
        page = a page of self
        pinned = whether page should be pinned
  */
  void setPagePinned(gid.adw1.tab_page.TabPage page, bool pinned) nothrow
  {
    adw_tab_view_set_page_pinned(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null, pinned);
  }

  /**
      Sets the currently selected page in self.
  
      Params:
        selectedPage = a page in self
  */
  void setSelectedPage(gid.adw1.tab_page.TabPage selectedPage) nothrow
  {
    adw_tab_view_set_selected_page(cast(AdwTabView*)this._cPtr, selectedPage ? cast(AdwTabPage*)selectedPage._cPtr(No.Dup) : null);
  }

  /**
      Sets the enabled shortcuts for self.
      
      See [gid.adw1.types.TabViewShortcuts] for the list of the available shortcuts. All of
      the shortcuts are enabled by default.
      
      [gid.adw1.tab_view.TabView.addShortcuts] and [gid.adw1.tab_view.TabView.removeShortcuts] provide
      a convenient way to manage individual shortcuts.
  
      Params:
        shortcuts = the new shortcuts
  */
  void setShortcuts(gid.adw1.types.TabViewShortcuts shortcuts) nothrow
  {
    adw_tab_view_set_shortcuts(cast(AdwTabView*)this._cPtr, shortcuts);
  }

  /**
      Transfers page from self to other_view.
      
      The page object will be reused.
      
      It's a programmer error to try to insert a pinned page after a non-pinned
      one, or a non-pinned page before a pinned one.
  
      Params:
        page = a page of self
        otherView = the tab view to transfer the page to
        position = the position to insert the page at, starting at 0
  */
  void transferPage(gid.adw1.tab_page.TabPage page, gid.adw1.tab_view.TabView otherView, int position) nothrow
  {
    adw_tab_view_transfer_page(cast(AdwTabView*)this._cPtr, page ? cast(AdwTabPage*)page._cPtr(No.Dup) : null, otherView ? cast(AdwTabView*)otherView._cPtr(No.Dup) : null, position);
  }

  /**
      Connect to `ClosePage` signal.
  
      Emitted after [gid.adw1.tab_view.TabView.closePage] has been called for page.
        
        The handler is expected to call [gid.adw1.tab_view.TabView.closePageFinish] to
        confirm or reject the closing.
        
        The default handler will immediately confirm closing for non-pinned pages,
        or reject it for pinned pages, equivalent to the following example:
        
        ```c
        static gboolean
        close_page_cb (AdwTabView *view,
                       AdwTabPage *page,
                       gpointer    user_data)
        {
          adw_tab_view_close_page_finish (view, page, !adw_tab_page_get_pinned (page));
        
          return GDK_EVENT_STOP;
        }
        ```
        
        The [gid.adw1.tab_view.TabView.closePageFinish] call doesn't have to happen inside
        the handler, so can be used to do asynchronous checks before confirming the
        closing.
        
        A typical reason to connect to this signal is to show a confirmation dialog
        for closing a tab.
        
        The signal handler should return [gid.gdk4.types.EVENT_STOP] to stop propagation
        or [gid.gdk4.types.EVENT_PROPAGATE] to invoke the default handler.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(gid.adw1.tab_page.TabPage page, gid.adw1.tab_view.TabView tabView)`
  
          `page` a page of self (optional)
  
          `tabView` the instance the signal is connected to (optional)
  
          `Returns` whether propagation should be stopped
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectClosePage(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.adw1.tab_view.TabView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_view.TabView.closePage");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close-page", closure, after);
  }

  /**
      Connect to `CreateWindow` signal.
  
      Emitted when a tab should be transferred into a new window.
        
        This can happen after a tab has been dropped on desktop.
        
        The signal handler is expected to create a new window, position it as
        needed and return its [gid.adw1.tab_view.TabView] that the page will be transferred into.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gid.adw1.tab_view.TabView callback(gid.adw1.tab_view.TabView tabView)`
  
          `tabView` the instance the signal is connected to (optional)
  
          `Returns` the [gid.adw1.tab_view.TabView] from the new window
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T : gid.adw1.tab_view.TabView)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_view.TabView)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gid.adw1.tab_view.TabView _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_view.TabView.createWindow");
      }

      setVal!(gid.adw1.tab_view.TabView)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-window", closure, after);
  }

  /**
      Connect to `IndicatorActivated` signal.
  
      Emitted after the indicator icon on page has been activated.
        
        See [gid.adw1.tab_page.TabPage.indicatorIcon] and
        [gid.adw1.tab_page.TabPage.indicatorActivatable].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.tab_page.TabPage page, gid.adw1.tab_view.TabView tabView)`
  
          `page` a page of self (optional)
  
          `tabView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectIndicatorActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.adw1.tab_view.TabView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_view.TabView.indicatorActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("indicator-activated", closure, after);
  }

  /**
      Connect to `PageAttached` signal.
  
      Emitted when a page has been created or transferred to self.
        
        A typical reason to connect to this signal would be to connect to page
        signals for things such as updating window title.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.tab_page.TabPage page, int position, gid.adw1.tab_view.TabView tabView)`
  
          `page` a page of self (optional)
  
          `position` the position of the page, starting from 0 (optional)
  
          `tabView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageAttached(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.adw1.tab_view.TabView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_view.TabView.pageAttached");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-attached", closure, after);
  }

  /**
      Connect to `PageDetached` signal.
  
      Emitted when a page has been removed or transferred to another view.
        
        A typical reason to connect to this signal would be to disconnect signal
        handlers connected in the [gid.adw1.tab_view.TabView.pageAttached] handler.
        
        It is important not to try and destroy the page child in the handler of
        this function as the child might merely be moved to another window; use
        child dispose handler for that or do it in sync with your
        [gid.adw1.tab_view.TabView.closePageFinish] calls.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.tab_page.TabPage page, int position, gid.adw1.tab_view.TabView tabView)`
  
          `page` a page of self (optional)
  
          `position` the position of the removed page, starting from 0 (optional)
  
          `tabView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageDetached(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.adw1.tab_view.TabView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_view.TabView.pageDetached");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-detached", closure, after);
  }

  /**
      Connect to `PageReordered` signal.
  
      Emitted after page has been reordered to position.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.tab_page.TabPage page, int position, gid.adw1.tab_view.TabView tabView)`
  
          `page` a page of self (optional)
  
          `position` the position page was moved to, starting at 0 (optional)
  
          `tabView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPageReordered(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == int)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.adw1.tab_view.TabView)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_view.TabView.pageReordered");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-reordered", closure, after);
  }

  /**
      Connect to `SetupMenu` signal.
  
      Emitted when a context menu is opened or closed for page.
        
        If the menu has been closed, page will be set to `NULL`.
        
        It can be used to set up menu actions before showing the menu, for example
        disable actions not applicable to page.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.adw1.tab_page.TabPage page, gid.adw1.tab_view.TabView tabView)`
  
          `page` a page of self (optional)
  
          `tabView` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSetupMenu(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.adw1.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.adw1.tab_view.TabView)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.adw1.tab_view.TabView.setupMenu");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("setup-menu", closure, after);
  }
}

/// Fluent builder implementation template for [gid.adw1.tab_view.TabView]
class TabViewGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `defaultIcon` property.
      Params:
        propval = Default page icon.
          
          If a page doesn't provide its own icon via [gid.adw1.tab_page.TabPage.icon], a
          default icon may be used instead for contexts where having an icon is
          necessary.
          
          [gid.adw1.tab_bar.TabBar] will use default icon for pinned tabs in case the page is
          not loading, doesn't have an icon and an indicator. Default icon is never
          used for tabs that aren't pinned.
          
          [gid.adw1.tab_overview.TabOverview] will use default icon for pages with missing
          thumbnails.
          
          By default, the `adw-tab-icon-missing-symbolic` icon is used.
      Returns: Builder instance for fluent chaining
  */
  T defaultIcon(gid.gio2.icon.Icon propval) nothrow
  {
    return setProperty("default-icon", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = Tab context menu model.
          
          When a context menu is shown for a tab, it will be constructed from the
          provided menu model. Use the [gid.adw1.tab_view.TabView.setupMenu] signal to set up
          the menu actions for the particular tab.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `selectedPage` property.
      Params:
        propval = The currently selected page.
      Returns: Builder instance for fluent chaining
  */
  T selectedPage(gid.adw1.tab_page.TabPage propval) nothrow
  {
    return setProperty("selected-page", propval);
  }

  /**
      Set `shortcuts` property.
      Params:
        propval = The enabled shortcuts.
          
          See [gid.adw1.types.TabViewShortcuts] for the list of the available shortcuts. All
          of the shortcuts are enabled by default.
          
          [gid.adw1.tab_view.TabView.addShortcuts] and [gid.adw1.tab_view.TabView.removeShortcuts]
          provide a convenient way to manage individual shortcuts.
      Returns: Builder instance for fluent chaining
  */
  T shortcuts(gid.adw1.types.TabViewShortcuts propval) nothrow
  {
    return setProperty("shortcuts", propval);
  }
}

/// Fluent builder for [gid.adw1.tab_view.TabView]
final class TabViewGidBuilder : TabViewGidBuilderImpl!TabViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TabView build() nothrow
  {
    return new TabView(cast(void*)createGObject(TabView._getGType), Yes.Take);
  }
}
