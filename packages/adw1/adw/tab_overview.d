/// Module for [TabOverview] class
module adw.tab_overview;

import adw.c.functions;
import adw.c.types;
import adw.tab_page;
import adw.tab_view;
import adw.types;
import gdk.types;
import gid.gid;
import gio.menu_model;
import gobject.dclosure;
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
    A tab overview for `class@TabView`.
    
    <picture>
      <source srcset="tab-overview-dark.png" media="(prefers-color-scheme: dark)">
      <img src="tab-overview.png" alt="tab-overview">
    </picture>
    
    [adw.tab_overview.TabOverview] is a widget that can display tabs from an [adw.tab_view.TabView] in a
    grid.
    
    [adw.tab_overview.TabOverview] shows a thumbnail for each tab. By default thumbnails are
    static for all pages except the selected one. They can be made always live
    by setting `property@TabPage:live-thumbnail` to `TRUE`, or refreshed with
    [adw.tab_page.TabPage.invalidateThumbnail] or
    [adw.tab_view.TabView.invalidateThumbnails] otherwise.
    
    If the pages are too tall or too wide, the thumbnails will be cropped; use
    `property@TabPage:thumbnail-xalign` and `property@TabPage:thumbnail-yalign` to
    control which part of the page should be visible in this case.
    
    Pinned tabs are shown as smaller cards without thumbnails above the other
    tabs. Unlike in `class@TabBar`, they still have titles, as well as an unpin
    button.
    
    [adw.tab_overview.TabOverview] provides search in open tabs. It searches in tab titles and
    tooltips, as well as `property@TabPage:keyword`.
    
    If `property@TabOverview:enable-new-tab` is set to `TRUE`, a new tab button
    will be shown. Connect to the `signal@TabOverview::create-tab` signal to use
    it.
    
    `property@TabOverview:secondary-menu` can be used to provide a secondary menu
    for the overview. Use it to add extra actions, e.g. to open a new window or
    undo closed tab.
    
    [adw.tab_overview.TabOverview] is intended to be used as the direct child of the window,
    with the rest of the window contents set as the `property@TabOverview:child`.
    The child is expected to contain an `class@TabView`.
    
    [adw.tab_overview.TabOverview] shows window buttons by default. They can be disabled by
    setting `property@TabOverview:show-start-title-buttons` and/or
    `property@TabOverview:show-start-title-buttons` and/or
    `property@TabOverview:show-end-title-buttons` to `FALSE`.
    
    If search and window buttons are disabled, and secondary menu is not set, the
    header bar will be hidden.
    
    ## Actions
    
    [adw.tab_overview.TabOverview] defines the `overview.open` and `overview.close` actions for
    opening and closing itself. They can be convenient when used together with
    `class@TabButton`.
    
    ## CSS nodes
    
    [adw.tab_overview.TabOverview] has a single CSS node with name `taboverview`.
*/
class TabOverview : gtk.widget.Widget
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
    return cast(void function())adw_tab_overview_get_type != &gidSymbolNotFound ? adw_tab_overview_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TabOverview self()
  {
    return this;
  }

  /**
      Get `child` property.
      Returns: The child widget.
  */
  @property gtk.widget.Widget child()
  {
    return getChild();
  }

  /**
      Set `child` property.
      Params:
        propval = The child widget.
  */
  @property void child(gtk.widget.Widget propval)
  {
    return setChild(propval);
  }

  /**
      Get `enableNewTab` property.
      Returns: Whether to enable new tab button.
        
        Connect to the `signal@TabOverview::create-tab` signal to use it.
  */
  @property bool enableNewTab()
  {
    return getEnableNewTab();
  }

  /**
      Set `enableNewTab` property.
      Params:
        propval = Whether to enable new tab button.
          
          Connect to the `signal@TabOverview::create-tab` signal to use it.
  */
  @property void enableNewTab(bool propval)
  {
    return setEnableNewTab(propval);
  }

  /**
      Get `enableSearch` property.
      Returns: Whether to enable search in tabs.
        
        Search matches tab titles and tooltips, as well as keywords, set via
        `property@TabPage:keyword`. Use keywords to search in e.g. page URLs in a
        web browser.
        
        During search, tab reordering and drag-n-drop are disabled.
        
        Use `property@TabOverview:search-active` to check out if search is
        currently active.
  */
  @property bool enableSearch()
  {
    return getEnableSearch();
  }

  /**
      Set `enableSearch` property.
      Params:
        propval = Whether to enable search in tabs.
          
          Search matches tab titles and tooltips, as well as keywords, set via
          `property@TabPage:keyword`. Use keywords to search in e.g. page URLs in a
          web browser.
          
          During search, tab reordering and drag-n-drop are disabled.
          
          Use `property@TabOverview:search-active` to check out if search is
          currently active.
  */
  @property void enableSearch(bool propval)
  {
    return setEnableSearch(propval);
  }

  /**
      Get `extraDragPreferredAction` property.
      Returns: The unique action on the `current-drop` of the
        `signal@TabOverview::extra-drag-drop`.
        
        This property should only be used during a
        `signal@TabOverview::extra-drag-drop` and is always a subset of what was
        originally passed to [adw.tab_overview.TabOverview.setupExtraDropTarget].
  */
  @property gdk.types.DragAction extraDragPreferredAction()
  {
    return getExtraDragPreferredAction();
  }

  /**
      Get `extraDragPreload` property.
      Returns: Whether the drop data should be preloaded on hover.
        
        See [gtk.drop_target.DropTarget.preload].
  */
  @property bool extraDragPreload()
  {
    return getExtraDragPreload();
  }

  /**
      Set `extraDragPreload` property.
      Params:
        propval = Whether the drop data should be preloaded on hover.
          
          See [gtk.drop_target.DropTarget.preload].
  */
  @property void extraDragPreload(bool propval)
  {
    return setExtraDragPreload(propval);
  }

  /**
      Get `inverted` property.
      Returns: Whether thumbnails use inverted layout.
        
        If set to `TRUE`, thumbnails will have the close or unpin buttons at the
        beginning and the indicator at the end rather than the other way around.
  */
  @property bool inverted()
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
  @property void inverted(bool propval)
  {
    return setInverted(propval);
  }

  /**
      Get `open` property.
      Returns: Whether the overview is open.
  */
  @property bool open()
  {
    return getOpen();
  }

  /**
      Set `open` property.
      Params:
        propval = Whether the overview is open.
  */
  @property void open(bool propval)
  {
    return setOpen(propval);
  }

  /**
      Get `searchActive` property.
      Returns: Whether search is currently active.
        
        See `property@TabOverview:enable-search`.
  */
  @property bool searchActive()
  {
    return getSearchActive();
  }

  /**
      Get `secondaryMenu` property.
      Returns: The secondary menu model.
        
        Use it to add extra actions, e.g. to open a new window or undo closed tab.
  */
  @property gio.menu_model.MenuModel secondaryMenu()
  {
    return getSecondaryMenu();
  }

  /**
      Set `secondaryMenu` property.
      Params:
        propval = The secondary menu model.
          
          Use it to add extra actions, e.g. to open a new window or undo closed tab.
  */
  @property void secondaryMenu(gio.menu_model.MenuModel propval)
  {
    return setSecondaryMenu(propval);
  }

  /**
      Get `showEndTitleButtons` property.
      Returns: Whether to show end title buttons in the overview's header bar.
        
        See `property@HeaderBar:show-start-title-buttons` for the other side.
  */
  @property bool showEndTitleButtons()
  {
    return getShowEndTitleButtons();
  }

  /**
      Set `showEndTitleButtons` property.
      Params:
        propval = Whether to show end title buttons in the overview's header bar.
          
          See `property@HeaderBar:show-start-title-buttons` for the other side.
  */
  @property void showEndTitleButtons(bool propval)
  {
    return setShowEndTitleButtons(propval);
  }

  /**
      Get `showStartTitleButtons` property.
      Returns: Whether to show start title buttons in the overview's header bar.
        
        See `property@HeaderBar:show-end-title-buttons` for the other side.
  */
  @property bool showStartTitleButtons()
  {
    return getShowStartTitleButtons();
  }

  /**
      Set `showStartTitleButtons` property.
      Params:
        propval = Whether to show start title buttons in the overview's header bar.
          
          See `property@HeaderBar:show-end-title-buttons` for the other side.
  */
  @property void showStartTitleButtons(bool propval)
  {
    return setShowStartTitleButtons(propval);
  }

  /**
      Get `view` property.
      Returns: The tab view the overview controls.
        
        The view must be inside the tab overview, see `property@TabOverview:child`.
  */
  @property adw.tab_view.TabView view()
  {
    return getView();
  }

  /**
      Set `view` property.
      Params:
        propval = The tab view the overview controls.
          
          The view must be inside the tab overview, see `property@TabOverview:child`.
  */
  @property void view(adw.tab_view.TabView propval)
  {
    return setView(propval);
  }

  /**
      Creates a new [adw.tab_overview.TabOverview].
      Returns: the newly created [adw.tab_overview.TabOverview]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_tab_overview_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the child widget of self.
      Returns: the child widget of self
  */
  gtk.widget.Widget getChild()
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
  bool getEnableNewTab()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_enable_new_tab(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether search in tabs is enabled for self.
      Returns: whether search is enabled
  */
  bool getEnableSearch()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_enable_search(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current action during a drop on the extra_drop_target.
      Returns: the drag action of the current drop.
  */
  gdk.types.DragAction getExtraDragPreferredAction()
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
  bool getExtraDragPreload()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_extra_drag_preload(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether thumbnails use inverted layout.
      Returns: whether thumbnails use inverted layout
  */
  bool getInverted()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_inverted(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self is open.
      Returns: whether the overview is open
  */
  bool getOpen()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_open(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether search is currently active for self.
      
      See `propertyTabOverview:enable-search`.
      Returns: whether search is active
  */
  bool getSearchActive()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_search_active(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets the secondary menu model for self.
      Returns: the secondary menu model
  */
  gio.menu_model.MenuModel getSecondaryMenu()
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
  bool getShowEndTitleButtons()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_show_end_title_buttons(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether start title buttons are shown in self's header bar.
      Returns: whether start title buttons are shown
  */
  bool getShowStartTitleButtons()
  {
    bool _retval;
    _retval = cast(bool)adw_tab_overview_get_show_start_title_buttons(cast(AdwTabOverview*)this._cPtr);
    return _retval;
  }

  /**
      Gets the tab view self controls.
      Returns: the tab view
  */
  adw.tab_view.TabView getView()
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
  void setChild(gtk.widget.Widget child = null)
  {
    adw_tab_overview_set_child(cast(AdwTabOverview*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to enable new tab button for self.
      
      Connect to the `signalTabOverview::create-tab` signal to use it.
  
      Params:
        enableNewTab = whether to enable new tab button
  */
  void setEnableNewTab(bool enableNewTab)
  {
    adw_tab_overview_set_enable_new_tab(cast(AdwTabOverview*)this._cPtr, enableNewTab);
  }

  /**
      Sets whether to enable search in tabs for self.
      
      Search matches tab titles and tooltips, as well as keywords, set via
      `propertyTabPage:keyword`. Use keywords to search in e.g. page URLs in a web
      browser.
      
      During search, tab reordering and drag-n-drop are disabled.
      
      Use `propertyTabOverview:search-active` to check out if search is currently
      active.
  
      Params:
        enableSearch = whether to enable search
  */
  void setEnableSearch(bool enableSearch)
  {
    adw_tab_overview_set_enable_search(cast(AdwTabOverview*)this._cPtr, enableSearch);
  }

  /**
      Sets whether drop data should be preloaded on hover.
      
      See [gtk.drop_target.DropTarget.preload].
  
      Params:
        preload = whether to preload drop data
  */
  void setExtraDragPreload(bool preload)
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
  void setInverted(bool inverted)
  {
    adw_tab_overview_set_inverted(cast(AdwTabOverview*)this._cPtr, inverted);
  }

  /**
      Sets whether the to open self.
  
      Params:
        open = whether the overview is open
  */
  void setOpen(bool open)
  {
    adw_tab_overview_set_open(cast(AdwTabOverview*)this._cPtr, open);
  }

  /**
      Sets the secondary menu model for self.
      
      Use it to add extra actions, e.g. to open a new window or undo closed tab.
  
      Params:
        secondaryMenu = a menu model
  */
  void setSecondaryMenu(gio.menu_model.MenuModel secondaryMenu = null)
  {
    adw_tab_overview_set_secondary_menu(cast(AdwTabOverview*)this._cPtr, secondaryMenu ? cast(GMenuModel*)secondaryMenu._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to show end title buttons in self's header bar.
      
      See `propertyHeaderBar:show-start-title-buttons` for the other side.
  
      Params:
        showEndTitleButtons = whether to show end title buttons
  */
  void setShowEndTitleButtons(bool showEndTitleButtons)
  {
    adw_tab_overview_set_show_end_title_buttons(cast(AdwTabOverview*)this._cPtr, showEndTitleButtons);
  }

  /**
      Sets whether to show start title buttons in self's header bar.
      
      See `propertyHeaderBar:show-end-title-buttons` for the other side.
  
      Params:
        showStartTitleButtons = whether to show start title buttons
  */
  void setShowStartTitleButtons(bool showStartTitleButtons)
  {
    adw_tab_overview_set_show_start_title_buttons(cast(AdwTabOverview*)this._cPtr, showStartTitleButtons);
  }

  /**
      Sets the tab view to control.
      
      The view must be inside self, see `propertyTabOverview:child`.
  
      Params:
        view = a tab view
  */
  void setView(adw.tab_view.TabView view = null)
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
      
      The `signalTabOverview::extra-drag-drop` signal can be used to handle the
      drop.
  
      Params:
        actions = the supported actions
        types = all supported [gobject.types.TYPE_FLAG_RESERVED_ID_BIT]s that can be dropped
  */
  void setupExtraDropTarget(gdk.types.DragAction actions, gobject.types.GType[] types = null)
  {
    size_t _nTypes;
    if (types)
      _nTypes = cast(size_t)types.length;

    auto _types = cast(GType*)types.ptr;
    adw_tab_overview_setup_extra_drop_target(cast(AdwTabOverview*)this._cPtr, actions, _types, _nTypes);
  }

  /**
      Connect to `CreateTab` signal.
  
      Emitted when a tab needs to be created.
        
        This can happen after the new tab button has been pressed, see
        `propertyTabOverview:enable-new-tab`.
        
        The signal handler is expected to create a new page in the corresponding
        `classTabView` and return it.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D adw.tab_page.TabPage callback(adw.tab_overview.TabOverview tabOverview))
  
          `tabOverview` the instance the signal is connected to (optional)
  
          `Returns` the newly created page
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCreateTab(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T : adw.tab_page.TabPage)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.tab_overview.TabOverview)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
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
  
          $(D bool callback(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview))
  
          `page` the page matching the tab the content was dropped onto (optional)
  
          `value` the [gobject.value.Value] being dropped (optional)
  
          `tabOverview` the instance the signal is connected to (optional)
  
          `Returns` whether the drop was accepted for page
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectExtraDragDrop(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : adw.tab_overview.TabOverview)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-drop", closure, after);
  }

  /**
      Connect to `ExtraDragValue` signal.
  
      This signal is emitted when the dropped content is preloaded.
        
        In order for data to be preloaded, `propertyTabOverview:extra-drag-preload`
        must be set to `TRUE`.
        
        The content must be of one of the types set up via
        [adw.tab_overview.TabOverview.setupExtraDropTarget].
        
        See [gtk.drop_target.DropTarget.value].
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D gdk.types.DragAction callback(adw.tab_page.TabPage page, gobject.value.Value value, adw.tab_overview.TabOverview tabOverview))
  
          `page` the page matching the tab the content was dropped onto (optional)
  
          `value` the [gobject.value.Value] being dropped (optional)
  
          `tabOverview` the instance the signal is connected to (optional)
  
          `Returns` the preferred action for the drop on page
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectExtraDragValue(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == gdk.types.DragAction)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.tab_page.TabPage)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : adw.tab_overview.TabOverview)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;


      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);


      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      auto _retval = _dClosure.cb(_paramTuple[]);
      setVal!(gdk.types.DragAction)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("extra-drag-value", closure, after);
  }
}
