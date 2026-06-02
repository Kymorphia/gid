/// Module for [TabOverview] class
module adw.tab_overview;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.tab_page;
import adw.tab_view;
import adw.types;
import gdk.types;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
import gobject.gid_builder;
import gobject.object;
import gobject.types;
import gobject.value;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.widget;

/**
    A tab overview for [adw.tab_view.TabView].
    
    <picture>
      <source srcset="tab-overview-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-overview.png" alt="tab-overview">
    </picture>
    
    [adw.tab_overview.TabOverview] is a widget that can display tabs from an [adw.tab_view.TabView] in a
    grid.
    
    [adw.tab_overview.TabOverview] shows a thumbnail for each tab. By default thumbnails are
    static for all pages except the selected one. They can be made always live
    by setting [adw.tab_page.TabPage.liveThumbnail] to `TRUE`, or refreshed with
    [adw.tab_page.TabPage.invalidateThumbnail] or
    [adw.tab_view.TabView.invalidateThumbnails] otherwise.
    
    If the pages are too tall or too wide, the thumbnails will be cropped; use
    [adw.tab_page.TabPage.thumbnailXalign] and [adw.tab_page.TabPage.thumbnailYalign] to
    control which part of the page should be visible in this case.
    
    Pinned tabs are shown as smaller cards without thumbnails above the other
    tabs. Unlike in [adw.tab_bar.TabBar], they still have titles, as well as an unpin
    button.
    
    [adw.tab_overview.TabOverview] provides search in open tabs. It searches in tab titles and
    tooltips, as well as [adw.tab_page.TabPage.keyword].
    
    If [adw.tab_overview.TabOverview.enableNewTab] is set to `TRUE`, a new tab button
    will be shown. Connect to the [adw.tab_overview.TabOverview.createTab] signal to use
    it.
    
    [adw.tab_overview.TabOverview.secondaryMenu] can be used to provide a secondary menu
    for the overview. Use it to add extra actions, e.g. to open a new window or
    undo closed tab.
    
    [adw.tab_overview.TabOverview] is intended to be used as the direct child of the window,
    with the rest of the window contents set as the [adw.tab_overview.TabOverview.child].
    The child is expected to contain an [adw.tab_view.TabView].
    
    [adw.tab_overview.TabOverview] shows window buttons by default. They can be disabled by
    setting [adw.tab_overview.TabOverview.showStartTitleButtons] and/or
    [adw.tab_overview.TabOverview.showStartTitleButtons] and/or
    [adw.tab_overview.TabOverview.showEndTitleButtons] to `FALSE`.
    
    If search and window buttons are disabled, and secondary menu is not set, the
    header bar will be hidden.
    
    ## Actions
    
    [adw.tab_overview.TabOverview] defines the `overview.open` and `overview.close` actions for
    opening and closing itself. They can be convenient when used together with
    [adw.tab_button.TabButton].
    
    ## CSS nodes
    
    [adw.tab_overview.TabOverview] has a single CSS node with name `taboverview`.
*/
class TabOverview : gtk.widget.Widget
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
    return cast(void function())adw_tab_overview_get_type != &gidSymbolNotFound ? adw_tab_overview_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TabOverview self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.tab_overview.TabOverview]
      Returns: New builder object
  */
  static TabOverviewGidBuilder builder() nothrow
  {
    return new TabOverviewGidBuilder;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child() nothrow
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval) nothrow
  {
    setChild(propval);
  }

  /**
      Get `enableNewTab` property.
      Returns: Whether to enable new tab button.
        
        Connect to the [adw.tab_overview.TabOverview.createTab] signal to use it.
  */
  @property bool enableNewTab() nothrow
  {
    return getEnableNewTab();
  }

  /**
      Set `enableNewTab` property.
      Params:
        propval = Whether to enable new tab button.
          
          Connect to the [adw.tab_overview.TabOverview.createTab] signal to use it.
  */
  @property void enableNewTab(bool propval) nothrow
  {
    setEnableNewTab(propval);
  }

  /**
      Get `enableSearch` property.
      Returns: Whether to enable search in tabs.
        
        Search matches tab titles and tooltips, as well as keywords, set via
        [adw.tab_page.TabPage.keyword]. Use keywords to search in e.g. page URLs in a
        web browser.
        
        During search, tab reordering and drag-n-drop are disabled.
        
        Use [adw.tab_overview.TabOverview.searchActive] to check out if search is
        currently active.
  */
  @property bool enableSearch() nothrow
  {
    return getEnableSearch();
  }

  /**
      Set `enableSearch` property.
      Params:
        propval = Whether to enable search in tabs.
          
          Search matches tab titles and tooltips, as well as keywords, set via
          [adw.tab_page.TabPage.keyword]. Use keywords to search in e.g. page URLs in a
          web browser.
          
          During search, tab reordering and drag-n-drop are disabled.
          
          Use [adw.tab_overview.TabOverview.searchActive] to check out if search is
          currently active.
  */
  @property void enableSearch(bool propval) nothrow
  {
    setEnableSearch(propval);
  }

  /**
      Get `extraDragPreferredAction` property.
      Returns: The unique action on the `current-drop` of the
        [adw.tab_overview.TabOverview.extraDragDrop].
        
        This property should only be used during a
        [adw.tab_overview.TabOverview.extraDragDrop] and is always a subset of what was
        originally passed to [adw.tab_overview.TabOverview.setupExtraDropTarget].
  */
  @property gdk.types.DragAction extraDragPreferredAction() nothrow
  {
    return getExtraDragPreferredAction();
  }

  /**
      Get `extraDragPreload` property.
      Returns: Whether the drop data should be preloaded on hover.
        
        See [gtk.drop_target.DropTarget.preload].
  */
  @property bool extraDragPreload() nothrow
  {
    return getExtraDragPreload();
  }

  /**
      Set `extraDragPreload` property.
      Params:
        propval = Whether the drop data should be preloaded on hover.
          
          See [gtk.drop_target.DropTarget.preload].
  */
  @property void extraDragPreload(bool propval) nothrow
  {
    setExtraDragPreload(propval);
  }

  /**
      Get `inverted` property.
      Returns: Whether thumbnails use inverted layout.
        
        If set to `TRUE`, thumbnails will have the close or unpin buttons at the
        beginning and the indicator at the end rather than the other way around.
  */
  @property bool inverted() nothrow
  {
    return getInverted();
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether thumbnails use inverted layout.
          
          If set to `TRUE`, thumbnails will have the close or unpin buttons at the
          beginning and the indicator at the end rather than the other way around.
  */
  @property void inverted(bool propval) nothrow
  {
    setInverted(propval);
  }

  /**
      Get `open` property.
      Returns: Whether the overview is open.
  */
  @property bool open() nothrow
  {
    return getOpen();
  }

  /**
      Set `open` property.
      Params:
        propval = Whether the overview is open.
  */
  @property void open(bool propval) nothrow
  {
    setOpen(propval);
  }

  /**
      Get `searchActive` property.
      Returns: Whether search is currently active.
        
        See [adw.tab_overview.TabOverview.enableSearch].
  */
  @property bool searchActive() nothrow
  {
    return getSearchActive();
  }

  /**
      Get `secondaryMenu` property.
      Returns: The secondary menu model.
        
        Use it to add extra actions, e.g. to open a new window or undo closed tab.
  */
  @property gio.menu_model.MenuModel secondaryMenu() nothrow
  {
    return getSecondaryMenu();
  }

  /**
      Set `secondaryMenu` property.
      Params:
        propval = The secondary menu model.
          
          Use it to add extra actions, e.g. to open a new window or undo closed tab.
  */
  @property void secondaryMenu(gio.menu_model.MenuModel propval) nothrow
  {
    setSecondaryMenu(propval);
  }

  /**
      Get `showEndTitleButtons` property.
      Returns: Whether to show end title buttons in the overview's header bar.
        
        See [adw.header_bar.HeaderBar.showStartTitleButtons] for the other side.
  */
  @property bool showEndTitleButtons() nothrow
  {
    return getShowEndTitleButtons();
  }

  /**
      Set `showEndTitleButtons` property.
      Params:
        propval = Whether to show end title buttons in the overview's header bar.
          
          See [adw.header_bar.HeaderBar.showStartTitleButtons] for the other side.
  */
  @property void showEndTitleButtons(bool propval) nothrow
  {
    setShowEndTitleButtons(propval);
  }

  /**
      Get `showStartTitleButtons` property.
      Returns: Whether to show start title buttons in the overview's header bar.
        
        See [adw.header_bar.HeaderBar.showEndTitleButtons] for the other side.
  */
  @property bool showStartTitleButtons() nothrow
  {
    return getShowStartTitleButtons();
  }

  /**
      Set `showStartTitleButtons` property.
      Params:
        propval = Whether to show start title buttons in the overview's header bar.
          
          See [adw.header_bar.HeaderBar.showEndTitleButtons] for the other side.
  */
  @property void showStartTitleButtons(bool propval) nothrow
  {
    setShowStartTitleButtons(propval);
  }

  /**
      Get `view` property.
      Returns: The tab view the overview controls.
        
        The view must be inside the tab overview, see [adw.tab_overview.TabOverview.child].
  */
  @property adw.tab_view.TabView view() nothrow
  {
    return getView();
  }

  /**
      Set `view` property.
      Params:
        propval = The tab view the overview controls.
          
          The view must be inside the tab overview, see [adw.tab_overview.TabOverview.child].
  */
  @property void view(adw.tab_view.TabView propval) nothrow
  {
    setView(propval);
  }

  /**
      Creates a new [adw.tab_overview.TabOverview].
      Returns: the newly created [adw.tab_overview.TabOverview]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_overview_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_overview_get_child(cast(AdwTabOverview*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether to new tab button is enabled for self.
      Returns: whether new tab button is enabled
  */
  bool getEnableNewTab() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_enable_new_tab(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether search in tabs is enabled for self.
      Returns: whether search is enabled
  */
  bool getEnableSearch() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_enable_search(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current action during a drop on the extra_drop_target.
      Returns: the drag action of the current drop.
  */
  gdk.types.DragAction getExtraDragPreferredAction() nothrow
  {
    GdkDragAction _cretval;
    _cretval = adw_tab_overview_get_extra_drag_preferred_action(cast(AdwTabOverview*)this._cPtr);
    gdk.types.DragAction _retval = cast(gdk.types.DragAction)_cretval;
    return _retval;
  }

  /**
      Gets whether drop data should be preloaded on hover.
      Returns: whether drop data should be preloaded on hover
  */
  bool getExtraDragPreload() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_extra_drag_preload(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether thumbnails use inverted layout.
      Returns: whether thumbnails use inverted layout
  */
  bool getInverted() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_inverted(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is open.
      Returns: whether the overview is open
  */
  bool getOpen() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_open(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether search is currently active for self.
      
      See [adw.tab_overview.TabOverview.enableSearch].
      Returns: whether search is active
  */
  bool getSearchActive() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_search_active(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets the secondary menu model for self.
      Returns: the secondary menu model
  */
  gio.menu_model.MenuModel getSecondaryMenu() nothrow
  {
    GMenuModel* _cretval;
    _cretval = adw_tab_overview_get_secondary_menu(cast(AdwTabOverview*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether end title buttons are shown in self's header bar.
      Returns: whether end title buttons are shown
  */
  bool getShowEndTitleButtons() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_show_end_title_buttons(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether start title buttons are shown in self's header bar.
      Returns: whether start title buttons are shown
  */
  bool getShowStartTitleButtons() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_show_start_title_buttons(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tab view self controls.
      Returns: the tab view
  */
  adw.tab_view.TabView getView() nothrow
  {
    AdwTabView* _cretval;
    _cretval = adw_tab_overview_get_view(cast(AdwTabOverview*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.tab_view.TabView)(cast(AdwTabView*)_cretval, No.Take);
    return _retval;
  }

  /**
      Sets the child widget of self.
  
      Params:
        child = the child widget
  */
  void setChild(gtk.widget.Widget child = null) nothrow
  {
    adw_tab_overview_set_child(cast(AdwTabOverview*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to enable new tab button for self.
      
      Connect to the [adw.tab_overview.TabOverview.createTab] signal to use it.
  
      Params:
        enableNewTab = whether to enable new tab button
  */
  void setEnableNewTab(bool enableNewTab) nothrow
  {
    adw_tab_overview_set_enable_new_tab(cast(AdwTabOverview*)this._cPtr, enableNewTab);
  }

  /**
      Sets whether to enable search in tabs for self.
      
      Search matches tab titles and tooltips, as well as keywords, set via
      [adw.tab_page.TabPage.keyword]. Use keywords to search in e.g. page URLs in a web
      browser.
      
      During search, tab reordering and drag-n-drop are disabled.
      
      Use [adw.tab_overview.TabOverview.searchActive] to check out if search is currently
      active.
  
      Params:
        enableSearch = whether to enable search
  */
  void setEnableSearch(bool enableSearch) nothrow
  {
    adw_tab_overview_set_enable_search(cast(AdwTabOverview*)this._cPtr, enableSearch);
  }

  /**
      Sets whether drop data should be preloaded on hover.
      
      See [gtk.drop_target.DropTarget.preload].
  
      Params:
        preload = whether to preload drop data
  */
  void setExtraDragPreload(bool preload) nothrow
  {
    adw_tab_overview_set_extra_drag_preload(cast(AdwTabOverview*)this._cPtr, preload);
  }

  /**
      Sets whether thumbnails use inverted layout.
      
      If set to `TRUE`, thumbnails will have the close or unpin button at the
      beginning and the indicator at the end rather than the other way around.
  
      Params:
        inverted = whether thumbnails use inverted layout
  */
  void setInverted(bool inverted) nothrow
  {
    adw_tab_overview_set_inverted(cast(AdwTabOverview*)this._cPtr, inverted);
  }

  /**
      Sets whether the to open self.
  
      Params:
        open = whether the overview is open
  */
  void setOpen(bool open) nothrow
  {
    adw_tab_overview_set_open(cast(AdwTabOverview*)this._cPtr, open);
  }

  /**
      Sets the secondary menu model for self.
      
      Use it to add extra actions, e.g. to open a new window or undo closed tab.
  
      Params:
        secondaryMenu = a menu model
  */
  void setSecondaryMenu(gio.menu_model.MenuModel secondaryMenu = null) nothrow
  {
    adw_tab_overview_set_secondary_menu(cast(AdwTabOverview*)this._cPtr, secondaryMenu ? cast(GMenuModel*)secondaryMenu._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to show end title buttons in self's header bar.
      
      See [adw.header_bar.HeaderBar.showStartTitleButtons] for the other side.
  
      Params:
        showEndTitleButtons = whether to show end title buttons
  */
  void setShowEndTitleButtons(bool showEndTitleButtons) nothrow
  {
    adw_tab_overview_set_show_end_title_buttons(cast(AdwTabOverview*)this._cPtr, showEndTitleButtons);
  }

  /**
      Sets whether to show start title buttons in self's header bar.
      
      See [adw.header_bar.HeaderBar.showEndTitleButtons] for the other side.
  
      Params:
        showStartTitleButtons = whether to show start title buttons
  */
  void setShowStartTitleButtons(bool showStartTitleButtons) nothrow
  {
    adw_tab_overview_set_show_start_title_buttons(cast(AdwTabOverview*)this._cPtr, showStartTitleButtons);
  }

  /**
      Sets the tab view to control.
      
      The view must be inside self, see [adw.tab_overview.TabOverview.child].
  
      Params:
        view = a tab view
  */
  void setView(adw.tab_view.TabView view = null) nothrow
  {
    adw_tab_overview_set_view(cast(AdwTabOverview*)this._cPtr, view ? cast(AdwTabView*)view._cPtr(No.Dup) : null);
  }

  /**
      Sets the supported types for this drop target.
      
      Sets up an extra drop target on tabs.
      
      This allows to drag arbitrary content onto tabs, for example URLs in a web
      browser.
      
      If a tab is hovered for a certain period of time while dragging the content,
      it will be automatically selected.
      
      The [adw.tab_overview.TabOverview.extraDragDrop] signal can be used to handle the
      drop.
  
      Params:
        actions = the supported actions
        types = all supported `GType`s that can be dropped
  */
  void setupExtraDropTarget(gdk.types.DragAction actions, gobject.types.GType[] types = null) nothrow
  {
    size_t _nTypes;
    if (types)
      _nTypes = cast(size_t)types.length;

    auto _types = types.ptr ? cast(GType*)types.ptr : [GType.init].ptr;
    adw_tab_overview_setup_extra_drop_target(cast(AdwTabOverview*)this._cPtr, actions, _types, _nTypes);
  }

  /**
      Connect to `CreateTab` signal.
  
      Emitted when a tab needs to be created.
        
        This can happen after the new tab button has been pressed, see
        [adw.tab_overview.TabOverview.enableNewTab].
        
        The signal handler is expected to create a new page in the corresponding
        [adw.tab_view.TabView] and return it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `adw.tab_page.TabPage callback(adw.tab_overview.TabOverview tabOverview)`
  
          `tabOverview` the instance the signal is connected to (optional)
  
          `Returns` the newly created page
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCreateTab(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T : adw.tab_page.TabPage)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.tab_overview.TabOverview)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      adw.tab_page.TabPage _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "adw.tab_overview.TabOverview.createTab");
      }

      setVal!(adw.tab_page.TabPage)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("create-tab", closure, after);
  }

  /**
      Connect to `ExtraDragDrop` signal.
  
      This signal is emitted when content is dropped onto a tab.
        
        The content must be of one of the types set up via
        [adw.tab_overview.TabOverview.setupExtraDropTarget].
        
        See [gtk.drop_target.DropTarget.drop].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview)`
  
          `page` the page matching the tab the content was dropped onto (optional)
  
          `value` the [gobject.value.Value] being dropped (optional)
  
          `tabOverview` the instance the signal is connected to (optional)
  
          `Returns` whether the drop was accepted for page
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectExtraDragDrop(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : adw.tab_overview.TabOverview)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "adw.tab_overview.TabOverview.extraDragDrop");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-drop", closure, after);
  }

  /**
      Connect to `ExtraDragValue` signal.
  
      This signal is emitted when the dropped content is preloaded.
        
        In order for data to be preloaded, [adw.tab_overview.TabOverview.extraDragPreload]
        must be set to `TRUE`.
        
        The content must be of one of the types set up via
        [adw.tab_overview.TabOverview.setupExtraDropTarget].
        
        See [gtk.drop_target.DropTarget.value].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gdk.types.DragAction callback(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview)`
  
          `page` the page matching the tab the content was dropped onto (optional)
  
          `value` the [gobject.value.Value] being dropped (optional)
  
          `tabOverview` the instance the signal is connected to (optional)
  
          `Returns` the preferred action for the drop on page
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectExtraDragValue(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
    && is(ReturnType!T == gdk.types.DragAction)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : adw.tab_overview.TabOverview)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gdk.types.DragAction _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "adw.tab_overview.TabOverview.extraDragValue");
      }

      setVal!(gdk.types.DragAction)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-value", closure, after);
  }
}

/// Fluent builder implementation template for [adw.tab_overview.TabOverview]
class TabOverviewGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `child` property.
      Params:
        propval = The child widget.
      Returns: Builder instance for fluent chaining
  */
  T child(gtk.widget.Widget propval) nothrow
  {
    return setProperty("child", propval);
  }

  /**
      Set `enableNewTab` property.
      Params:
        propval = Whether to enable new tab button.
          
          Connect to the [adw.tab_overview.TabOverview.createTab] signal to use it.
      Returns: Builder instance for fluent chaining
  */
  T enableNewTab(bool propval) nothrow
  {
    return setProperty("enable-new-tab", propval);
  }

  /**
      Set `enableSearch` property.
      Params:
        propval = Whether to enable search in tabs.
          
          Search matches tab titles and tooltips, as well as keywords, set via
          [adw.tab_page.TabPage.keyword]. Use keywords to search in e.g. page URLs in a
          web browser.
          
          During search, tab reordering and drag-n-drop are disabled.
          
          Use [adw.tab_overview.TabOverview.searchActive] to check out if search is
          currently active.
      Returns: Builder instance for fluent chaining
  */
  T enableSearch(bool propval) nothrow
  {
    return setProperty("enable-search", propval);
  }

  /**
      Set `extraDragPreload` property.
      Params:
        propval = Whether the drop data should be preloaded on hover.
          
          See [gtk.drop_target.DropTarget.preload].
      Returns: Builder instance for fluent chaining
  */
  T extraDragPreload(bool propval) nothrow
  {
    return setProperty("extra-drag-preload", propval);
  }

  /**
      Set `inverted` property.
      Params:
        propval = Whether thumbnails use inverted layout.
          
          If set to `TRUE`, thumbnails will have the close or unpin buttons at the
          beginning and the indicator at the end rather than the other way around.
      Returns: Builder instance for fluent chaining
  */
  T inverted(bool propval) nothrow
  {
    return setProperty("inverted", propval);
  }

  /**
      Set `open` property.
      Params:
        propval = Whether the overview is open.
      Returns: Builder instance for fluent chaining
  */
  T open(bool propval) nothrow
  {
    return setProperty("open", propval);
  }

  /**
      Set `secondaryMenu` property.
      Params:
        propval = The secondary menu model.
          
          Use it to add extra actions, e.g. to open a new window or undo closed tab.
      Returns: Builder instance for fluent chaining
  */
  T secondaryMenu(gio.menu_model.MenuModel propval) nothrow
  {
    return setProperty("secondary-menu", propval);
  }

  /**
      Set `showEndTitleButtons` property.
      Params:
        propval = Whether to show end title buttons in the overview's header bar.
          
          See [adw.header_bar.HeaderBar.showStartTitleButtons] for the other side.
      Returns: Builder instance for fluent chaining
  */
  T showEndTitleButtons(bool propval) nothrow
  {
    return setProperty("show-end-title-buttons", propval);
  }

  /**
      Set `showStartTitleButtons` property.
      Params:
        propval = Whether to show start title buttons in the overview's header bar.
          
          See [adw.header_bar.HeaderBar.showEndTitleButtons] for the other side.
      Returns: Builder instance for fluent chaining
  */
  T showStartTitleButtons(bool propval) nothrow
  {
    return setProperty("show-start-title-buttons", propval);
  }

  /**
      Set `view` property.
      Params:
        propval = The tab view the overview controls.
          
          The view must be inside the tab overview, see [adw.tab_overview.TabOverview.child].
      Returns: Builder instance for fluent chaining
  */
  T view(adw.tab_view.TabView propval) nothrow
  {
    return setProperty("view", propval);
  }
}

/// Fluent builder for [adw.tab_overview.TabOverview]
final class TabOverviewGidBuilder : TabOverviewGidBuilderImpl!TabOverviewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TabOverview build() nothrow
  {
    return new TabOverview(cast(void*)createGObject(TabOverview._getGType), No.Take);
  }
}
