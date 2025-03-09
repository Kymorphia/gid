module adw.tab_view;

import adw.c.functions;
import adw.c.types;
import adw.tab_page;
import adw.types;
import gid.gid;
import gio.icon;
import gio.menu_model;
import gobject.dclosure;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.selection_model;
import gtk.widget;

/**
    A dynamic tabbed container.
  
  [adw.tab_view.TabView] is a container which shows one child at a time. While it
  provides keyboard shortcuts for switching between pages, it does not provide
  a visible tab switcher and relies on external widgets for that, such as
  `class@TabBar`, `class@TabOverview` and `class@TabButton`.
  
  [adw.tab_view.TabView] maintains a `class@TabPage` object for each page, which holds
  additional per-page properties. You can obtain the [adw.tab_page.TabPage] for a page
  with [adw.tab_view.TabView.getPage], and as the return value for
  [adw.tab_view.TabView.append] and other functions for adding children.
  
  [adw.tab_view.TabView] only aims to be useful for dynamic tabs in multi-window
  document-based applications, such as web browsers, file managers, text
  editors or terminals. It does not aim to replace [gtk.notebook.Notebook] for use
  cases such as tabbed dialogs.
  
  As such, it does not support disabling page reordering or detaching.
  
  [adw.tab_view.TabView] adds a number of global page switching and reordering shortcuts.
  The `property@TabView:shortcuts` property can be used to manage them.
  
  See `flags@TabViewShortcuts` for the list of the available shortcuts. All of
  the shortcuts are enabled by default.
  
  [adw.tab_view.TabView.addShortcuts] and [adw.tab_view.TabView.removeShortcuts] can be
  used to manage shortcuts in a convenient way, for example:
  
  ```c
  adw_tab_view_remove_shortcuts (view, ADW_TAB_VIEW_SHORTCUT_CONTROL_HOME |
                                       ADW_TAB_VIEW_SHORTCUT_CONTROL_END);
  ```
  
  ## CSS nodes
  
  [adw.tab_view.TabView] has a main CSS node with the name `tabview`.
  
  ## Accessibility
  
  [adw.tab_view.TabView] uses the [gtk.types.AccessibleRole.TabPanel] for the tab pages which
  are the accessible parent objects of the child widgets.
*/
class TabView : gtk.widget.Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_tab_view_get_type != &gidSymbolNotFound ? adw_tab_view_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getGType();
  }

  /**
      Creates a new [adw.tab_view.TabView].
    Returns:     the newly created [adw.tab_view.TabView]
  */
  this()
  {
    AdwTabView* _cretval;
    _cretval = adw_tab_view_new();
    this(_cretval, No.Take);
  }

  /**
      Adds child to self with parent as the parent.
    
    This function can be used to automatically position new pages, and to select
    the correct page when this page is closed while being selected (see
    [adw.tab_view.TabView.closePage]).
    
    If parent is `NULL`, this function is equivalent to [adw.tab_view.TabView.append].
    Params:
      child =       a widget to add
      parent =       a parent page for child
    Returns:     the page object representing child
  */
  adw.tab_page.TabPage addPage(gtk.widget.Widget child, adw.tab_page.TabPage parent = null)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_add_page(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, parent ? cast(AdwTabPage*)parent.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds shortcuts for self.
    
    See `propertyTabView:shortcuts` for details.
    Params:
      shortcuts =       the shortcuts to add
  */
  void addShortcuts(adw.types.TabViewShortcuts shortcuts)
  {
    adw_tab_view_add_shortcuts(cast(AdwTabView*)cPtr, shortcuts);
  }

  /**
      Inserts child as the last non-pinned page.
    Params:
      child =       a widget to add
    Returns:     the page object representing child
  */
  adw.tab_page.TabPage append(gtk.widget.Widget child)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_append(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts child as the last pinned page.
    Params:
      child =       a widget to add
    Returns:     the page object representing child
  */
  adw.tab_page.TabPage appendPinned(gtk.widget.Widget child)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_append_pinned(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Requests to close all pages other than page.
    Params:
      page =       a page of self
  */
  void closeOtherPages(adw.tab_page.TabPage page)
  {
    adw_tab_view_close_other_pages(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
  }

  /**
      Requests to close page.
    
    Calling this function will result in the `signalTabView::close-page` signal
    being emitted for page. Closing the page can then be confirmed or
    denied via [adw.tab_view.TabView.closePageFinish].
    
    If the page is waiting for a [adw.tab_view.TabView.closePageFinish] call, this
    function will do nothing.
    
    The default handler for `signalTabView::close-page` will immediately confirm
    closing the page if it's non-pinned, or reject it if it's pinned. This
    behavior can be changed by registering your own handler for that signal.
    
    If page was selected, another page will be selected instead:
    
    If the `propertyTabPage:parent` value is `NULL`, the next page will be
    selected when possible, or if the page was already last, the previous page
    will be selected instead.
    
    If it's not `NULL`, the previous page will be selected if it's a descendant
    (possibly indirect) of the parent. If both the previous page and the parent
    are pinned, the parent will be selected instead.
    Params:
      page =       a page of self
  */
  void closePage(adw.tab_page.TabPage page)
  {
    adw_tab_view_close_page(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
  }

  /**
      Completes a [adw.tab_view.TabView.closePage] call for page.
    
    If confirm is `TRUE`, page will be closed. If it's `FALSE`, it will be
    reverted to its previous state and [adw.tab_view.TabView.closePage] can be called
    for it again.
    
    This function should not be called unless a custom handler for
    `signalTabView::close-page` is used.
    Params:
      page =       a page of self
      confirm =       whether to confirm or deny closing page
  */
  void closePageFinish(adw.tab_page.TabPage page, bool confirm)
  {
    adw_tab_view_close_page_finish(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null, confirm);
  }

  /**
      Requests to close all pages after page.
    Params:
      page =       a page of self
  */
  void closePagesAfter(adw.tab_page.TabPage page)
  {
    adw_tab_view_close_pages_after(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
  }

  /**
      Requests to close all pages before page.
    Params:
      page =       a page of self
  */
  void closePagesBefore(adw.tab_page.TabPage page)
  {
    adw_tab_view_close_pages_before(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
  }

  /**
      Gets the default icon of self.
    Returns:     the default icon of self.
  */
  gio.icon.Icon getDefaultIcon()
  {
    GIcon* _cretval;
    _cretval = adw_tab_view_get_default_icon(cast(AdwTabView*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, No.Take);
    return _retval;
  }

  /**
      Whether a page is being transferred.
    
    The corresponding property will be set to `TRUE` when a drag-n-drop tab
    transfer starts on any [adw.tab_view.TabView], and to `FALSE` after it ends.
    
    During the transfer, children cannot receive pointer input and a tab can
    be safely dropped on the tab view.
    Returns:     whether a page is being transferred
  */
  bool getIsTransferringPage()
  {
    bool _retval;
    _retval = adw_tab_view_get_is_transferring_page(cast(AdwTabView*)cPtr);
    return _retval;
  }

  /**
      Gets the tab context menu model for self.
    Returns:     the tab context menu model for self
  */
  gio.menu_model.MenuModel getMenuModel()
  {
    GMenuModel* _cretval;
    _cretval = adw_tab_view_get_menu_model(cast(AdwTabView*)cPtr);
    auto _retval = ObjectG.getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the number of pages in self.
    Returns:     the number of pages in self
  */
  int getNPages()
  {
    int _retval;
    _retval = adw_tab_view_get_n_pages(cast(AdwTabView*)cPtr);
    return _retval;
  }

  /**
      Gets the number of pinned pages in self.
    
    See [adw.tab_view.TabView.setPagePinned].
    Returns:     the number of pinned pages in self
  */
  int getNPinnedPages()
  {
    int _retval;
    _retval = adw_tab_view_get_n_pinned_pages(cast(AdwTabView*)cPtr);
    return _retval;
  }

  /**
      Gets the `classTabPage` representing the child at position.
    Params:
      position =       the index of the page in self, starting from 0
    Returns:     the page object at position
  */
  adw.tab_page.TabPage getNthPage(int position)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_get_nth_page(cast(AdwTabView*)cPtr, position);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the `classTabPage` object representing child.
    Params:
      child =       a child in self
    Returns:     the page object for child
  */
  adw.tab_page.TabPage getPage(gtk.widget.Widget child)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_get_page(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Finds the position of page in self, starting from 0.
    Params:
      page =       a page of self
    Returns:     the position of page in self
  */
  int getPagePosition(adw.tab_page.TabPage page)
  {
    int _retval;
    _retval = adw_tab_view_get_page_position(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Returns a [gio.list_model.ListModel] that contains the pages of self.
    
    This can be used to keep an up-to-date view. The model also implements
    [gtk.selection_model.SelectionModel] and can be used to track and change the selected
    page.
    Returns:     a [gtk.selection_model.SelectionModel] for the pages of self
  */
  gtk.selection_model.SelectionModel getPages()
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_tab_view_get_pages(cast(AdwTabView*)cPtr);
    auto _retval = ObjectG.getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the currently selected page in self.
    Returns:     the selected page
  */
  adw.tab_page.TabPage getSelectedPage()
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_get_selected_page(cast(AdwTabView*)cPtr);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the enabled shortcuts for self.
    Returns:     the shortcut mask
  */
  adw.types.TabViewShortcuts getShortcuts()
  {
    AdwTabViewShortcuts _cretval;
    _cretval = adw_tab_view_get_shortcuts(cast(AdwTabView*)cPtr);
    adw.types.TabViewShortcuts _retval = cast(adw.types.TabViewShortcuts)_cretval;
    return _retval;
  }

  /**
      Inserts a non-pinned page at position.
    
    It's an error to try to insert a page before a pinned page, in that case
    [adw.tab_view.TabView.insertPinned] should be used instead.
    Params:
      child =       a widget to add
      position =       the position to add child at, starting from 0
    Returns:     the page object representing child
  */
  adw.tab_page.TabPage insert(gtk.widget.Widget child, int position)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_insert(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, position);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts a pinned page at position.
    
    It's an error to try to insert a pinned page after a non-pinned page, in
    that case [adw.tab_view.TabView.insert] should be used instead.
    Params:
      child =       a widget to add
      position =       the position to add child at, starting from 0
    Returns:     the page object representing child
  */
  adw.tab_page.TabPage insertPinned(gtk.widget.Widget child, int position)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_insert_pinned(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null, position);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Invalidates thumbnails for all pages in self.
    
    This is a convenience method, equivalent to calling
    [adw.tab_page.TabPage.invalidateThumbnail] on each page.
  */
  void invalidateThumbnails()
  {
    adw_tab_view_invalidate_thumbnails(cast(AdwTabView*)cPtr);
  }

  /**
      Inserts child as the first non-pinned page.
    Params:
      child =       a widget to add
    Returns:     the page object representing child
  */
  adw.tab_page.TabPage prepend(gtk.widget.Widget child)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_prepend(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts child as the first pinned page.
    Params:
      child =       a widget to add
    Returns:     the page object representing child
  */
  adw.tab_page.TabPage prependPinned(gtk.widget.Widget child)
  {
    AdwTabPage* _cretval;
    _cretval = adw_tab_view_prepend_pinned(cast(AdwTabView*)cPtr, child ? cast(GtkWidget*)child.cPtr(No.Dup) : null);
    auto _retval = ObjectG.getDObject!(adw.tab_page.TabPage)(cast(AdwTabPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Removes shortcuts from self.
    
    See `propertyTabView:shortcuts` for details.
    Params:
      shortcuts =       the shortcuts to reomve
  */
  void removeShortcuts(adw.types.TabViewShortcuts shortcuts)
  {
    adw_tab_view_remove_shortcuts(cast(AdwTabView*)cPtr, shortcuts);
  }

  /**
      Reorders page to before its previous page if possible.
    Params:
      page =       a page of self
    Returns:     whether page was moved
  */
  bool reorderBackward(adw.tab_page.TabPage page)
  {
    bool _retval;
    _retval = adw_tab_view_reorder_backward(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to the first possible position.
    Params:
      page =       a page of self
    Returns:     whether page was moved
  */
  bool reorderFirst(adw.tab_page.TabPage page)
  {
    bool _retval;
    _retval = adw_tab_view_reorder_first(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to after its next page if possible.
    Params:
      page =       a page of self
    Returns:     whether page was moved
  */
  bool reorderForward(adw.tab_page.TabPage page)
  {
    bool _retval;
    _retval = adw_tab_view_reorder_forward(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to the last possible position.
    Params:
      page =       a page of self
    Returns:     whether page was moved
  */
  bool reorderLast(adw.tab_page.TabPage page)
  {
    bool _retval;
    _retval = adw_tab_view_reorder_last(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Reorders page to position.
    
    It's a programmer error to try to reorder a pinned page after a non-pinned
    one, or a non-pinned page before a pinned one.
    Params:
      page =       a page of self
      position =       the position to insert the page at, starting at 0
    Returns:     whether page was moved
  */
  bool reorderPage(adw.tab_page.TabPage page, int position)
  {
    bool _retval;
    _retval = adw_tab_view_reorder_page(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null, position);
    return _retval;
  }

  /**
      Selects the page after the currently selected page.
    
    If the last page was already selected, this function does nothing.
    Returns:     whether the selected page was changed
  */
  bool selectNextPage()
  {
    bool _retval;
    _retval = adw_tab_view_select_next_page(cast(AdwTabView*)cPtr);
    return _retval;
  }

  /**
      Selects the page before the currently selected page.
    
    If the first page was already selected, this function does nothing.
    Returns:     whether the selected page was changed
  */
  bool selectPreviousPage()
  {
    bool _retval;
    _retval = adw_tab_view_select_previous_page(cast(AdwTabView*)cPtr);
    return _retval;
  }

  /**
      Sets the default page icon for self.
    
    If a page doesn't provide its own icon via `propertyTabPage:icon`, a default
    icon may be used instead for contexts where having an icon is necessary.
    
    `classTabBar` will use default icon for pinned tabs in case the page is not
    loading, doesn't have an icon and an indicator. Default icon is never used
    for tabs that aren't pinned.
    
    `classTabOverview` will use default icon for pages with missing thumbnails.
    
    By default, the `adw-tab-icon-missing-symbolic` icon is used.
    Params:
      defaultIcon =       the default icon
  */
  void setDefaultIcon(gio.icon.Icon defaultIcon)
  {
    adw_tab_view_set_default_icon(cast(AdwTabView*)cPtr, defaultIcon ? cast(GIcon*)(cast(ObjectG)defaultIcon).cPtr(No.Dup) : null);
  }

  /**
      Sets the tab context menu model for self.
    
    When a context menu is shown for a tab, it will be constructed from the
    provided menu model. Use the `signalTabView::setup-menu` signal to set up
    the menu actions for the particular tab.
    Params:
      menuModel =       a menu model
  */
  void setMenuModel(gio.menu_model.MenuModel menuModel = null)
  {
    adw_tab_view_set_menu_model(cast(AdwTabView*)cPtr, menuModel ? cast(GMenuModel*)menuModel.cPtr(No.Dup) : null);
  }

  /**
      Pins or unpins page.
    
    Pinned pages are guaranteed to be placed before all non-pinned pages; at any
    given moment the first `propertyTabView:n-pinned-pages` pages in self are
    guaranteed to be pinned.
    
    When a page is pinned or unpinned, it's automatically reordered: pinning a
    page moves it after other pinned pages; unpinning a page moves it before
    other non-pinned pages.
    
    Pinned pages can still be reordered between each other.
    
    `classTabBar` will display pinned pages in a compact form, never showing the
    title or close button, and only showing a single icon, selected in the
    following order:
    
    1. `propertyTabPage:indicator-icon`
    2. A spinner if `propertyTabPage:loading` is `TRUE`
    3. `propertyTabPage:icon`
    4. `propertyTabView:default-icon`
    
    `classTabOverview` will not show a thumbnail for pinned pages, and replace
    the close button with an unpin button. Unlike [adw.tab_bar.TabBar], it will still
    display the page's title, icon and indicator separately.
    
    Pinned pages cannot be closed by default, see `signalTabView::close-page`
    for how to override that behavior.
    
    Changes the value of the `propertyTabPage:pinned` property.
    Params:
      page =       a page of self
      pinned =       whether page should be pinned
  */
  void setPagePinned(adw.tab_page.TabPage page, bool pinned)
  {
    adw_tab_view_set_page_pinned(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null, pinned);
  }

  /**
      Sets the currently selected page in self.
    Params:
      selectedPage =       a page in self
  */
  void setSelectedPage(adw.tab_page.TabPage selectedPage)
  {
    adw_tab_view_set_selected_page(cast(AdwTabView*)cPtr, selectedPage ? cast(AdwTabPage*)selectedPage.cPtr(No.Dup) : null);
  }

  /**
      Sets the enabled shortcuts for self.
    
    See `flagsTabViewShortcuts` for the list of the available shortcuts. All of
    the shortcuts are enabled by default.
    
    [adw.tab_view.TabView.addShortcuts] and [adw.tab_view.TabView.removeShortcuts] provide
    a convenient way to manage individual shortcuts.
    Params:
      shortcuts =       the new shortcuts
  */
  void setShortcuts(adw.types.TabViewShortcuts shortcuts)
  {
    adw_tab_view_set_shortcuts(cast(AdwTabView*)cPtr, shortcuts);
  }

  /**
      Transfers page from self to other_view.
    
    The page object will be reused.
    
    It's a programmer error to try to insert a pinned page after a non-pinned
    one, or a non-pinned page before a pinned one.
    Params:
      page =       a page of self
      otherView =       the tab view to transfer the page to
      position =       the position to insert the page at, starting at 0
  */
  void transferPage(adw.tab_page.TabPage page, adw.tab_view.TabView otherView, int position)
  {
    adw_tab_view_transfer_page(cast(AdwTabView*)cPtr, page ? cast(AdwTabPage*)page.cPtr(No.Dup) : null, otherView ? cast(AdwTabView*)otherView.cPtr(No.Dup) : null, position);
  }

  /**
      Emitted after [adw.tab_view.TabView.closePage] has been called for page.
    
    The handler is expected to call [adw.tab_view.TabView.closePageFinish] to
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
    
    The [adw.tab_view.TabView.closePageFinish] call doesn't have to happen inside
    the handler, so can be used to do asynchronous checks before confirming the
    closing.
    
    A typical reason to connect to this signal is to show a confirmation dialog
    for closing a tab.
    
    The signal handler should return `GDK_EVENT_STOP` to stop propagation or
    `GDK_EVENT_CONTINUE` to invoke the default handler.
  
    ## Parameters
    $(LIST
      * $(B page)       a page of self
      * $(B tabView) the instance the signal is connected to
    )
    Returns:     whether propagation should be stopped
  */
  alias ClosePageCallbackDlg = bool delegate(adw.tab_page.TabPage page, adw.tab_view.TabView tabView);

  /** ditto */
  alias ClosePageCallbackFunc = bool function(adw.tab_page.TabPage page, adw.tab_view.TabView tabView);

  /**
    Connect to ClosePage signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectClosePage(T)(T callback, Flag!"After" after = No.After)
  if (is(T : ClosePageCallbackDlg) || is(T : ClosePageCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      bool _retval;
      auto tabView = getVal!(adw.tab_view.TabView)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      _retval = _dClosure.dlg(page, tabView);
      setVal!bool(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("close-page", closure, after);
  }

  /**
      Emitted when a tab should be transferred into a new window.
    
    This can happen after a tab has been dropped on desktop.
    
    The signal handler is expected to create a new window, position it as
    needed and return its [adw.tab_view.TabView] that the page will be transferred into.
  
    ## Parameters
    $(LIST
      * $(B tabView) the instance the signal is connected to
    )
    Returns:     the [adw.tab_view.TabView] from the new window
  */
  alias CreateWindowCallbackDlg = adw.tab_view.TabView delegate(adw.tab_view.TabView tabView);

  /** ditto */
  alias CreateWindowCallbackFunc = adw.tab_view.TabView function(adw.tab_view.TabView tabView);

  /**
    Connect to CreateWindow signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectCreateWindow(T)(T callback, Flag!"After" after = No.After)
  if (is(T : CreateWindowCallbackDlg) || is(T : CreateWindowCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabView = getVal!(adw.tab_view.TabView)(_paramVals);
      auto _retval = _dClosure.dlg(tabView);
      setVal!adw.tab_view.TabView(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-window", closure, after);
  }

  /**
      Emitted after the indicator icon on page has been activated.
    
    See `propertyTabPage:indicator-icon` and
    `propertyTabPage:indicator-activatable`.
  
    ## Parameters
    $(LIST
      * $(B page)       a page of self
      * $(B tabView) the instance the signal is connected to
    )
  */
  alias IndicatorActivatedCallbackDlg = void delegate(adw.tab_page.TabPage page, adw.tab_view.TabView tabView);

  /** ditto */
  alias IndicatorActivatedCallbackFunc = void function(adw.tab_page.TabPage page, adw.tab_view.TabView tabView);

  /**
    Connect to IndicatorActivated signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectIndicatorActivated(T)(T callback, Flag!"After" after = No.After)
  if (is(T : IndicatorActivatedCallbackDlg) || is(T : IndicatorActivatedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabView = getVal!(adw.tab_view.TabView)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      _dClosure.dlg(page, tabView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("indicator-activated", closure, after);
  }

  /**
      Emitted when a page has been created or transferred to self.
    
    A typical reason to connect to this signal would be to connect to page
    signals for things such as updating window title.
  
    ## Parameters
    $(LIST
      * $(B page)       a page of self
      * $(B position)       the position of the page, starting from 0
      * $(B tabView) the instance the signal is connected to
    )
  */
  alias PageAttachedCallbackDlg = void delegate(adw.tab_page.TabPage page, int position, adw.tab_view.TabView tabView);

  /** ditto */
  alias PageAttachedCallbackFunc = void function(adw.tab_page.TabPage page, int position, adw.tab_view.TabView tabView);

  /**
    Connect to PageAttached signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPageAttached(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PageAttachedCallbackDlg) || is(T : PageAttachedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabView = getVal!(adw.tab_view.TabView)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      auto position = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(page, position, tabView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-attached", closure, after);
  }

  /**
      Emitted when a page has been removed or transferred to another view.
    
    A typical reason to connect to this signal would be to disconnect signal
    handlers connected in the `signalTabView::page-attached` handler.
    
    It is important not to try and destroy the page child in the handler of
    this function as the child might merely be moved to another window; use
    child dispose handler for that or do it in sync with your
    [adw.tab_view.TabView.closePageFinish] calls.
  
    ## Parameters
    $(LIST
      * $(B page)       a page of self
      * $(B position)       the position of the removed page, starting from 0
      * $(B tabView) the instance the signal is connected to
    )
  */
  alias PageDetachedCallbackDlg = void delegate(adw.tab_page.TabPage page, int position, adw.tab_view.TabView tabView);

  /** ditto */
  alias PageDetachedCallbackFunc = void function(adw.tab_page.TabPage page, int position, adw.tab_view.TabView tabView);

  /**
    Connect to PageDetached signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPageDetached(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PageDetachedCallbackDlg) || is(T : PageDetachedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabView = getVal!(adw.tab_view.TabView)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      auto position = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(page, position, tabView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-detached", closure, after);
  }

  /**
      Emitted after page has been reordered to position.
  
    ## Parameters
    $(LIST
      * $(B page)       a page of self
      * $(B position)       the position page was moved to, starting at 0
      * $(B tabView) the instance the signal is connected to
    )
  */
  alias PageReorderedCallbackDlg = void delegate(adw.tab_page.TabPage page, int position, adw.tab_view.TabView tabView);

  /** ditto */
  alias PageReorderedCallbackFunc = void function(adw.tab_page.TabPage page, int position, adw.tab_view.TabView tabView);

  /**
    Connect to PageReordered signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectPageReordered(T)(T callback, Flag!"After" after = No.After)
  if (is(T : PageReorderedCallbackDlg) || is(T : PageReorderedCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabView = getVal!(adw.tab_view.TabView)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      auto position = getVal!(int)(&_paramVals[2]);
      _dClosure.dlg(page, position, tabView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("page-reordered", closure, after);
  }

  /**
      Emitted when a context menu is opened or closed for page.
    
    If the menu has been closed, page will be set to `NULL`.
    
    It can be used to set up menu actions before showing the menu, for example
    disable actions not applicable to page.
  
    ## Parameters
    $(LIST
      * $(B page)       a page of self
      * $(B tabView) the instance the signal is connected to
    )
  */
  alias SetupMenuCallbackDlg = void delegate(adw.tab_page.TabPage page, adw.tab_view.TabView tabView);

  /** ditto */
  alias SetupMenuCallbackFunc = void function(adw.tab_page.TabPage page, adw.tab_view.TabView tabView);

  /**
    Connect to SetupMenu signal.
    Params:
      callback = signal callback delegate or function to connect
      after = Yes.After to execute callback after default handler, No.After to execute before (default)
    Returns: Signal ID
  */
  ulong connectSetupMenu(T)(T callback, Flag!"After" after = No.After)
  if (is(T : SetupMenuCallbackDlg) || is(T : SetupMenuCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto tabView = getVal!(adw.tab_view.TabView)(_paramVals);
      auto page = getVal!(adw.tab_page.TabPage)(&_paramVals[1]);
      _dClosure.dlg(page, tabView);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("setup-menu", closure, after);
  }
}
