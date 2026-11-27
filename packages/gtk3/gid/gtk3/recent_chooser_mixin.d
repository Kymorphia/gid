/// Module for [RecentChooser] interface mixin
module gid.gtk3.recent_chooser_mixin;

public import gid.core.basictypes;
public import gid.gtk3.recent_chooser;
public import gid.gtk3.recent_chooser_iface_proxy;
public import gid.core.utils;
public import gid.glib2.error;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.dclosure;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;
public import gid.gtk3.c.functions;
public import gid.gtk3.c.types;
public import gid.gtk3.recent_filter;
public import gid.gtk3.recent_info;
public import gid.gtk3.recent_manager;
public import gid.gtk3.types;

/**
    #GtkRecentChooser is an interface that can be implemented by widgets
    displaying the list of recently used files.  In GTK+, the main objects
    that implement this interface are #GtkRecentChooserWidget,
    #GtkRecentChooserDialog and #GtkRecentChooserMenu.
    
    Recently used files are supported since GTK+ 2.10.
*/
template RecentChooserT()
{

  /**
      Get `filter` property.
      Returns: The #GtkRecentFilter object to be used when displaying
        the recently used resources.
  */
  @property gid.gtk3.recent_filter.RecentFilter filter() nothrow
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = The #GtkRecentFilter object to be used when displaying
          the recently used resources.
  */
  @property void filter(gid.gtk3.recent_filter.RecentFilter propval) nothrow
  {
    setFilter(propval);
  }

  /**
      Get `limit` property.
      Returns: The maximum number of recently used resources to be displayed,
        or -1 to display all items.
  */
  @property int limit() nothrow
  {
    return getLimit();
  }

  /**
      Set `limit` property.
      Params:
        propval = The maximum number of recently used resources to be displayed,
          or -1 to display all items.
  */
  @property void limit(int propval) nothrow
  {
    setLimit(propval);
  }

  /**
      Get `localOnly` property.
      Returns: Whether this #GtkRecentChooser should display only local (file:)
        resources.
  */
  @property bool localOnly() nothrow
  {
    return getLocalOnly();
  }

  /**
      Set `localOnly` property.
      Params:
        propval = Whether this #GtkRecentChooser should display only local (file:)
          resources.
  */
  @property void localOnly(bool propval) nothrow
  {
    setLocalOnly(propval);
  }

  /**
      Get `selectMultiple` property.
      Returns: Allow the user to select multiple resources.
  */
  @property bool selectMultiple() nothrow
  {
    return getSelectMultiple();
  }

  /**
      Set `selectMultiple` property.
      Params:
        propval = Allow the user to select multiple resources.
  */
  @property void selectMultiple(bool propval) nothrow
  {
    setSelectMultiple(propval);
  }

  /**
      Get `showIcons` property.
      Returns: Whether this #GtkRecentChooser should display an icon near the item.
  */
  @property bool showIcons() nothrow
  {
    return getShowIcons();
  }

  /**
      Set `showIcons` property.
      Params:
        propval = Whether this #GtkRecentChooser should display an icon near the item.
  */
  @property void showIcons(bool propval) nothrow
  {
    setShowIcons(propval);
  }

  /**
      Get `showNotFound` property.
      Returns: Whether this #GtkRecentChooser should display the recently used resources
        even if not present anymore. Setting this to false will perform a
        potentially expensive check on every local resource (every remote
        resource will always be displayed).
  */
  @property bool showNotFound() nothrow
  {
    return getShowNotFound();
  }

  /**
      Set `showNotFound` property.
      Params:
        propval = Whether this #GtkRecentChooser should display the recently used resources
          even if not present anymore. Setting this to false will perform a
          potentially expensive check on every local resource (every remote
          resource will always be displayed).
  */
  @property void showNotFound(bool propval) nothrow
  {
    setShowNotFound(propval);
  }

  /** */
  @property bool showPrivate() nothrow
  {
    return getShowPrivate();
  }

  /** */
  @property void showPrivate(bool propval) nothrow
  {
    setShowPrivate(propval);
  }

  /**
      Get `showTips` property.
      Returns: Whether this #GtkRecentChooser should display a tooltip containing the
        full path of the recently used resources.
  */
  @property bool showTips() nothrow
  {
    return getShowTips();
  }

  /**
      Set `showTips` property.
      Params:
        propval = Whether this #GtkRecentChooser should display a tooltip containing the
          full path of the recently used resources.
  */
  @property void showTips(bool propval) nothrow
  {
    setShowTips(propval);
  }

  /**
      Get `sortType` property.
      Returns: Sorting order to be used when displaying the recently used resources.
  */
  @property gid.gtk3.types.RecentSortType sortType() nothrow
  {
    return getSortType();
  }

  /**
      Set `sortType` property.
      Params:
        propval = Sorting order to be used when displaying the recently used resources.
  */
  @property void sortType(gid.gtk3.types.RecentSortType propval) nothrow
  {
    setSortType(propval);
  }

  /**
      Adds filter to the list of #GtkRecentFilter objects held by chooser.
      
      If no previous filter objects were defined, this function will call
      [gid.gtk3.recent_chooser.RecentChooser.setFilter].
  
      Params:
        filter = a #GtkRecentFilter
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncAddFilter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncAddFilter(gid.gtk3.recent_filter.RecentFilter filter)
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.addFilter)
      return;

    _klass.addFilter(cast(GtkRecentChooser*)this._cPtr, filter ? cast(GtkRecentFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Gets the URI currently selected by chooser.
      Returns: a newly allocated string holding a URI.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetCurrentUri`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncGetCurrentUri()
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.getCurrentUri)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.getCurrentUri(cast(GtkRecentChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the list of recently used resources in form of #GtkRecentInfo objects.
      
      The return value of this function is affected by the “sort-type” and
      “limit” properties of chooser.
      Returns: A newly allocated
          list of #GtkRecentInfo objects.  You should
          use [gid.gtk4.recent_info.RecentInfo.unref] on every item of the list, and then free
          the list itself using [gid.glib2.list.List.free].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncGetItems`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.recent_info.RecentInfo[] vfuncGetItems()
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.getItems)
      return typeof(return).init;

    GList* _cretval;
    _cretval = _klass.getItems(cast(GtkRecentChooser*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.recent_info.RecentInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Signal emitted when the user “activates” a recent
         item in the recent chooser.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncItemActivated`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncItemActivated()
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.itemActivated)
      return;

    _klass.itemActivated(cast(GtkRecentChooser*)this._cPtr);
  }

  /**
      Gets the #GtkRecentFilter objects held by chooser.
      Returns: A singly linked list
          of #GtkRecentFilter objects.  You
          should just free the returned list using [gid.glib2.slist.SList.free].
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncListFilters`
      to chain up from an override.
      Overriding it from D is not supported (callback return container type 'SList' ownership 'Container' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gtk3.recent_filter.RecentFilter[] vfuncListFilters()
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.listFilters)
      return typeof(return).init;

    GSList* _cretval;
    _cretval = _klass.listFilters(cast(GtkRecentChooser*)this._cPtr);
    auto _retval = gSListToD!(gid.gtk3.recent_filter.RecentFilter, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes filter from the list of #GtkRecentFilter objects held by chooser.
  
      Params:
        filter = a #GtkRecentFilter
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncRemoveFilter`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncRemoveFilter(gid.gtk3.recent_filter.RecentFilter filter)
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.removeFilter)
      return;

    _klass.removeFilter(cast(GtkRecentChooser*)this._cPtr, filter ? cast(GtkRecentFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Selects all the items inside chooser, if the chooser supports
      multiple selection.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectAll`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSelectAll()
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.selectAll)
      return;

    _klass.selectAll(cast(GtkRecentChooser*)this._cPtr);
  }

  /**
      Selects uri inside chooser.
  
      Params:
        uri = a URI
      Returns: true if uri was found.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectUri`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSelectUri(string uri)
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.selectUri)
      return typeof(return).init;

    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.selectUri(cast(GtkRecentChooser*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Signal emitted when there is a change in the
         set of selected recently used resources.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSelectionChanged`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSelectionChanged()
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.selectionChanged)
      return;

    _klass.selectionChanged(cast(GtkRecentChooser*)this._cPtr);
  }

  /**
      Sets uri as the current URI for chooser.
  
      Params:
        uri = a URI
      Returns: true if the URI was found.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetCurrentUri`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSetCurrentUri(string uri)
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.setCurrentUri)
      return typeof(return).init;

    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)_klass.setCurrentUri(cast(GtkRecentChooser*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the comparison function used when sorting to be sort_func.  If
      the chooser has the sort type set to #GTK_RECENT_SORT_CUSTOM then
      the chooser will sort using this function.
      
      To the comparison function will be passed two #GtkRecentInfo structs and
      sort_data;  sort_func should return a positive integer if the first
      item comes before the second, zero if the two items are equal and
      a negative integer if the first item comes after the second.
  
      Params:
        sortFunc = the comparison function
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSetSortFunc`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'sort_func' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncSetSortFunc(gid.gtk3.types.RecentSortFunc sortFunc)
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.setSortFunc)
      return;

    extern(C) int _sortFuncCallback(GtkRecentInfo* a, GtkRecentInfo* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk3.types.RecentSortFunc*)userData;
      auto _a = a ? new gid.gtk3.recent_info.RecentInfo(cast(void*)a, Yes.Take)._cBorrow : null;
      auto _b = b ? new gid.gtk3.recent_info.RecentInfo(cast(void*)b, Yes.Take)._cBorrow : null;

      try
      {
        _retval = (*_dlg)(_a, _b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.RecentSortFunc");
      }
      if (_a)
        _a._cUnborrow;
      if (_b)
        _b._cUnborrow;

      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    _klass.setSortFunc(cast(GtkRecentChooser*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Unselects all the items inside chooser.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnselectAll`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnselectAll()
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.unselectAll)
      return;

    _klass.unselectAll(cast(GtkRecentChooser*)this._cPtr);
  }

  /**
      Unselects uri inside chooser.
  
      Params:
        uri = a URI
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncUnselectUri`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncUnselectUri(string uri)
  {
    auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gtk3.recent_chooser.RecentChooser._getGType);
    if (!_klass || !_klass.unselectUri)
      return;

    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _klass.unselectUri(cast(GtkRecentChooser*)this._cPtr, _uri);
  }

  /**
      Adds filter to the list of #GtkRecentFilter objects held by chooser.
      
      If no previous filter objects were defined, this function will call
      [gid.gtk3.recent_chooser.RecentChooser.setFilter].
  
      Params:
        filter = a #GtkRecentFilter
  */
  override void addFilter(gid.gtk3.recent_filter.RecentFilter filter) nothrow
  {
    gtk_recent_chooser_add_filter(cast(GtkRecentChooser*)this._cPtr, filter ? cast(GtkRecentFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Gets the #GtkRecentInfo currently selected by chooser.
      Returns: a #GtkRecentInfo.  Use [gid.gtk4.recent_info.RecentInfo.unref] when
          when you have finished using it.
  */
  override gid.gtk3.recent_info.RecentInfo getCurrentItem() nothrow
  {
    GtkRecentInfo* _cretval;
    _cretval = gtk_recent_chooser_get_current_item(cast(GtkRecentChooser*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.recent_info.RecentInfo(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the URI currently selected by chooser.
      Returns: a newly allocated string holding a URI.
  */
  override string getCurrentUri() nothrow
  {
    char* _cretval;
    _cretval = gtk_recent_chooser_get_current_uri(cast(GtkRecentChooser*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the #GtkRecentFilter object currently used by chooser to affect
      the display of the recently used resources.
      Returns: a #GtkRecentFilter object.
  */
  override gid.gtk3.recent_filter.RecentFilter getFilter() nothrow
  {
    GtkRecentFilter* _cretval;
    _cretval = gtk_recent_chooser_get_filter(cast(GtkRecentChooser*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.recent_filter.RecentFilter)(cast(GtkRecentFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the list of recently used resources in form of #GtkRecentInfo objects.
      
      The return value of this function is affected by the “sort-type” and
      “limit” properties of chooser.
      Returns: A newly allocated
          list of #GtkRecentInfo objects.  You should
          use [gid.gtk4.recent_info.RecentInfo.unref] on every item of the list, and then free
          the list itself using [gid.glib2.list.List.free].
  */
  override gid.gtk3.recent_info.RecentInfo[] getItems() nothrow
  {
    GList* _cretval;
    _cretval = gtk_recent_chooser_get_items(cast(GtkRecentChooser*)this._cPtr);
    auto _retval = gListToD!(gid.gtk3.recent_info.RecentInfo, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the number of items returned by [gid.gtk3.recent_chooser.RecentChooser.getItems]
      and [gid.gtk3.recent_chooser.RecentChooser.getUris].
      Returns: A positive integer, or -1 meaning that all items are
          returned.
  */
  override int getLimit() nothrow
  {
    int _retval;
    _retval = gtk_recent_chooser_get_limit(cast(GtkRecentChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether only local resources should be shown in the recently used
      resources selector.  See [gid.gtk3.recent_chooser.RecentChooser.setLocalOnly]
      Returns: true if only local resources should be shown.
  */
  override bool getLocalOnly() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_chooser_get_local_only(cast(GtkRecentChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether chooser can select multiple items.
      Returns: true if chooser can select more than one item.
  */
  override bool getSelectMultiple() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_chooser_get_select_multiple(cast(GtkRecentChooser*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether chooser should show an icon near the resource.
      Returns: true if the icons should be displayed, false otherwise.
  */
  override bool getShowIcons() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_chooser_get_show_icons(cast(GtkRecentChooser*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves whether chooser should show the recently used resources that
      were not found.
      Returns: true if the resources not found should be displayed, and
          false otheriwse.
  */
  override bool getShowNotFound() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_chooser_get_show_not_found(cast(GtkRecentChooser*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether chooser should display recently used resources
      registered as private.
      Returns: true if the recent chooser should show private items,
          false otherwise.
  */
  override bool getShowPrivate() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_chooser_get_show_private(cast(GtkRecentChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether chooser should display tooltips containing the full path
      of a recently user resource.
      Returns: true if the recent chooser should show tooltips,
          false otherwise.
  */
  override bool getShowTips() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_recent_chooser_get_show_tips(cast(GtkRecentChooser*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value set by [gid.gtk3.recent_chooser.RecentChooser.setSortType].
      Returns: the sorting order of the chooser.
  */
  override gid.gtk3.types.RecentSortType getSortType() nothrow
  {
    GtkRecentSortType _cretval;
    _cretval = gtk_recent_chooser_get_sort_type(cast(GtkRecentChooser*)this._cPtr);
    gid.gtk3.types.RecentSortType _retval = cast(gid.gtk3.types.RecentSortType)_cretval;
    return _retval;
  }

  /**
      Gets the URI of the recently used resources.
      
      The return value of this function is affected by the “sort-type” and “limit”
      properties of chooser.
      
      Since the returned array is null terminated, length may be null.
      Returns: A newly allocated, null-terminated array of strings. Use
            [gid.glib2.global.strfreev] to free it.
  */
  override string[] getUris() nothrow
  {
    char** _cretval;
    size_t _cretlength;
    _cretval = gtk_recent_chooser_get_uris(cast(GtkRecentChooser*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the #GtkRecentFilter objects held by chooser.
      Returns: A singly linked list
          of #GtkRecentFilter objects.  You
          should just free the returned list using [gid.glib2.slist.SList.free].
  */
  override gid.gtk3.recent_filter.RecentFilter[] listFilters() nothrow
  {
    GSList* _cretval;
    _cretval = gtk_recent_chooser_list_filters(cast(GtkRecentChooser*)this._cPtr);
    auto _retval = gSListToD!(gid.gtk3.recent_filter.RecentFilter, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }

  /**
      Removes filter from the list of #GtkRecentFilter objects held by chooser.
  
      Params:
        filter = a #GtkRecentFilter
  */
  override void removeFilter(gid.gtk3.recent_filter.RecentFilter filter) nothrow
  {
    gtk_recent_chooser_remove_filter(cast(GtkRecentChooser*)this._cPtr, filter ? cast(GtkRecentFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Selects all the items inside chooser, if the chooser supports
      multiple selection.
  */
  override void selectAll() nothrow
  {
    gtk_recent_chooser_select_all(cast(GtkRecentChooser*)this._cPtr);
  }

  /**
      Selects uri inside chooser.
  
      Params:
        uri = a URI
      Returns: true if uri was found.
      Throws: [ErrorWrap]
  */
  override bool selectUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)gtk_recent_chooser_select_uri(cast(GtkRecentChooser*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets uri as the current URI for chooser.
  
      Params:
        uri = a URI
      Returns: true if the URI was found.
      Throws: [ErrorWrap]
  */
  override bool setCurrentUri(string uri)
  {
    bool _retval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = cast(bool)gtk_recent_chooser_set_current_uri(cast(GtkRecentChooser*)this._cPtr, _uri, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets filter as the current #GtkRecentFilter object used by chooser
      to affect the displayed recently used resources.
  
      Params:
        filter = a #GtkRecentFilter
  */
  override void setFilter(gid.gtk3.recent_filter.RecentFilter filter = null) nothrow
  {
    gtk_recent_chooser_set_filter(cast(GtkRecentChooser*)this._cPtr, filter ? cast(GtkRecentFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the number of items that should be returned by
      [gid.gtk3.recent_chooser.RecentChooser.getItems] and [gid.gtk3.recent_chooser.RecentChooser.getUris].
  
      Params:
        limit = a positive integer, or -1 for all items
  */
  override void setLimit(int limit) nothrow
  {
    gtk_recent_chooser_set_limit(cast(GtkRecentChooser*)this._cPtr, limit);
  }

  /**
      Sets whether only local resources, that is resources using the file:// URI
      scheme, should be shown in the recently used resources selector.  If
      local_only is true (the default) then the shown resources are guaranteed
      to be accessible through the operating system native file system.
  
      Params:
        localOnly = true if only local files can be shown
  */
  override void setLocalOnly(bool localOnly) nothrow
  {
    gtk_recent_chooser_set_local_only(cast(GtkRecentChooser*)this._cPtr, localOnly);
  }

  /**
      Sets whether chooser can select multiple items.
  
      Params:
        selectMultiple = true if chooser can select more than one item
  */
  override void setSelectMultiple(bool selectMultiple) nothrow
  {
    gtk_recent_chooser_set_select_multiple(cast(GtkRecentChooser*)this._cPtr, selectMultiple);
  }

  /**
      Sets whether chooser should show an icon near the resource when
      displaying it.
  
      Params:
        showIcons = whether to show an icon near the resource
  */
  override void setShowIcons(bool showIcons) nothrow
  {
    gtk_recent_chooser_set_show_icons(cast(GtkRecentChooser*)this._cPtr, showIcons);
  }

  /**
      Sets whether chooser should display the recently used resources that
      it didn’t find.  This only applies to local resources.
  
      Params:
        showNotFound = whether to show the local items we didn’t find
  */
  override void setShowNotFound(bool showNotFound) nothrow
  {
    gtk_recent_chooser_set_show_not_found(cast(GtkRecentChooser*)this._cPtr, showNotFound);
  }

  /**
      Whether to show recently used resources marked registered as private.
  
      Params:
        showPrivate = true to show private items, false otherwise
  */
  override void setShowPrivate(bool showPrivate) nothrow
  {
    gtk_recent_chooser_set_show_private(cast(GtkRecentChooser*)this._cPtr, showPrivate);
  }

  /**
      Sets whether to show a tooltips containing the full path of each
      recently used resource in a #GtkRecentChooser widget.
  
      Params:
        showTips = true if tooltips should be shown
  */
  override void setShowTips(bool showTips) nothrow
  {
    gtk_recent_chooser_set_show_tips(cast(GtkRecentChooser*)this._cPtr, showTips);
  }

  /**
      Sets the comparison function used when sorting to be sort_func.  If
      the chooser has the sort type set to #GTK_RECENT_SORT_CUSTOM then
      the chooser will sort using this function.
      
      To the comparison function will be passed two #GtkRecentInfo structs and
      sort_data;  sort_func should return a positive integer if the first
      item comes before the second, zero if the two items are equal and
      a negative integer if the first item comes after the second.
  
      Params:
        sortFunc = the comparison function
  */
  override void setSortFunc(gid.gtk3.types.RecentSortFunc sortFunc) nothrow
  {
    extern(C) int _sortFuncCallback(GtkRecentInfo* a, GtkRecentInfo* b, void* userData) nothrow
    {
      gidAttachThread();
      int _retval;
      auto _dlg = cast(gid.gtk3.types.RecentSortFunc*)userData;
      auto _a = a ? new gid.gtk3.recent_info.RecentInfo(cast(void*)a, Yes.Take)._cBorrow : null;
      auto _b = b ? new gid.gtk3.recent_info.RecentInfo(cast(void*)b, Yes.Take)._cBorrow : null;

      try
      {
        _retval = (*_dlg)(_a, _b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.types.RecentSortFunc");
      }
      if (_a)
        _a._cUnborrow;
      if (_b)
        _b._cUnborrow;

      return _retval;
    }
    auto _sortFuncCB = sortFunc ? &_sortFuncCallback : null;
    auto _sortFunc = sortFunc ? freezeDelegate(cast(void*)&sortFunc) : null;
    GDestroyNotify _sortFuncDestroyCB = sortFunc ? &thawDelegate : null;
    gtk_recent_chooser_set_sort_func(cast(GtkRecentChooser*)this._cPtr, _sortFuncCB, _sortFunc, _sortFuncDestroyCB);
  }

  /**
      Changes the sorting order of the recently used resources list displayed by
      chooser.
  
      Params:
        sortType = sort order that the chooser should use
  */
  override void setSortType(gid.gtk3.types.RecentSortType sortType) nothrow
  {
    gtk_recent_chooser_set_sort_type(cast(GtkRecentChooser*)this._cPtr, sortType);
  }

  /**
      Unselects all the items inside chooser.
  */
  override void unselectAll() nothrow
  {
    gtk_recent_chooser_unselect_all(cast(GtkRecentChooser*)this._cPtr);
  }

  /**
      Unselects uri inside chooser.
  
      Params:
        uri = a URI
  */
  override void unselectUri(string uri) nothrow
  {
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    gtk_recent_chooser_unselect_uri(cast(GtkRecentChooser*)this._cPtr, _uri);
  }

  /**
      Connect to `ItemActivated` signal.
  
      This signal is emitted when the user "activates" a recent item
        in the recent chooser.  This can happen by double-clicking on an item
        in the recently used resources list, or by pressing
        `Enter`.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.recent_chooser.RecentChooser recentChooser)`
  
          `recentChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectItemActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.recent_chooser.RecentChooser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.itemActivated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("item-activated", closure, after);
  }

  /**
      Connect to `SelectionChanged` signal.
  
      This signal is emitted when there is a change in the set of
        selected recently used resources.  This can happen when a user
        modifies the selection with the mouse or the keyboard, or when
        explicitly calling functions to change the selection.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.recent_chooser.RecentChooser recentChooser)`
  
          `recentChooser` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.recent_chooser.RecentChooser)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.selectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /// True if the D class T overrides any vfunc method of gid.gtk3.recent_chooser.RecentChooser (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gtk3_recent_chooser_RecentChooser(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddFilter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentUri", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetItems", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncItemActivated", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListFilters", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveFilter", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectAll", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectUri", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionChanged", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCurrentUri", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectAll", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectUri", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gtk3.recent_chooser.RecentChooser vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gtk3_recent_chooser_RecentChooser(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncAddFilter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "add_filter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetCurrentUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "get_current_uri");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncGetItems", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "get_items");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncItemActivated", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "item_activated");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncListFilters", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.recent_chooser.RecentChooser.vfuncListFilters is not supported: callback return container type 'SList' ownership 'Container' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncRemoveFilter", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "remove_filter");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectAll", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "select_all");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "select_uri");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSelectionChanged", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "selection_changed");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetCurrentUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "set_current_uri");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSetSortFunc", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gtk3.recent_chooser.RecentChooser.vfuncSetSortFunc is not supported: parameter 'sort_func' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectAll", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "unselect_all");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncUnselectUri", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(iface, "unselect_uri");
  }

  private static void _installIfaceVfunc_gid_gtk3_recent_chooser_RecentChooser(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GtkRecentChooserIface*)iface;

    switch (vfunc)
    {
      case "add_filter":
      {
        static extern(C) void _vfuncAddFilterTramp(GtkRecentChooser* chooser, GtkRecentFilter* filter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.addFilter)
              return (cast(typeof(&_vfuncAddFilterTramp))_klass.addFilter)(chooser, filter);
            return;
          }

          try
          {
            _obj.vfuncAddFilter(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.recent_filter.RecentFilter)(cast(void*)filter, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncAddFilter");
          }
        }

        _klass.addFilter = cast(typeof(_klass.addFilter))&_vfuncAddFilterTramp;
        break;
      }
      case "get_current_uri":
      {
        static extern(C) char* _vfuncGetCurrentUriTramp(GtkRecentChooser* chooser) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.getCurrentUri)
              return (cast(typeof(&_vfuncGetCurrentUriTramp))_klass.getCurrentUri)(chooser);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncGetCurrentUri();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncGetCurrentUri");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.getCurrentUri = cast(typeof(_klass.getCurrentUri))&_vfuncGetCurrentUriTramp;
        break;
      }
      case "get_items":
      {
        static extern(C) GList* _vfuncGetItemsTramp(GtkRecentChooser* chooser) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.getItems)
              return (cast(typeof(&_vfuncGetItemsTramp))_klass.getItems)(chooser);
            return typeof(return).init;
          }

          gid.gtk3.recent_info.RecentInfo[] _dretval;

          try
          {
            _dretval = _obj.vfuncGetItems();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncGetItems");
          }
          auto _retval = gListFromD!(gid.gtk3.recent_info.RecentInfo)(_dretval);

          return _retval;
        }

        _klass.getItems = cast(typeof(_klass.getItems))&_vfuncGetItemsTramp;
        break;
      }
      case "item_activated":
      {
        static extern(C) void _vfuncItemActivatedTramp(GtkRecentChooser* chooser) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.itemActivated)
              return (cast(typeof(&_vfuncItemActivatedTramp))_klass.itemActivated)(chooser);
            return;
          }

          try
          {
            _obj.vfuncItemActivated();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncItemActivated");
          }
        }

        _klass.itemActivated = cast(typeof(_klass.itemActivated))&_vfuncItemActivatedTramp;
        break;
      }
      case "remove_filter":
      {
        static extern(C) void _vfuncRemoveFilterTramp(GtkRecentChooser* chooser, GtkRecentFilter* filter) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.removeFilter)
              return (cast(typeof(&_vfuncRemoveFilterTramp))_klass.removeFilter)(chooser, filter);
            return;
          }

          try
          {
            _obj.vfuncRemoveFilter(gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.recent_filter.RecentFilter)(cast(void*)filter, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncRemoveFilter");
          }
        }

        _klass.removeFilter = cast(typeof(_klass.removeFilter))&_vfuncRemoveFilterTramp;
        break;
      }
      case "select_all":
      {
        static extern(C) void _vfuncSelectAllTramp(GtkRecentChooser* chooser) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.selectAll)
              return (cast(typeof(&_vfuncSelectAllTramp))_klass.selectAll)(chooser);
            return;
          }

          try
          {
            _obj.vfuncSelectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncSelectAll");
          }
        }

        _klass.selectAll = cast(typeof(_klass.selectAll))&_vfuncSelectAllTramp;
        break;
      }
      case "select_uri":
      {
        static extern(C) gboolean _vfuncSelectUriTramp(GtkRecentChooser* chooser, const(char)* uri, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.selectUri)
              return (cast(typeof(&_vfuncSelectUriTramp))_klass.selectUri)(chooser, uri, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _uri = uri.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSelectUri(_uri);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.selectUri = cast(typeof(_klass.selectUri))&_vfuncSelectUriTramp;
        break;
      }
      case "selection_changed":
      {
        static extern(C) void _vfuncSelectionChangedTramp(GtkRecentChooser* chooser) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.selectionChanged)
              return (cast(typeof(&_vfuncSelectionChangedTramp))_klass.selectionChanged)(chooser);
            return;
          }

          try
          {
            _obj.vfuncSelectionChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncSelectionChanged");
          }
        }

        _klass.selectionChanged = cast(typeof(_klass.selectionChanged))&_vfuncSelectionChangedTramp;
        break;
      }
      case "set_current_uri":
      {
        static extern(C) gboolean _vfuncSetCurrentUriTramp(GtkRecentChooser* chooser, const(char)* uri, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.setCurrentUri)
              return (cast(typeof(&_vfuncSetCurrentUriTramp))_klass.setCurrentUri)(chooser, uri, _err);
            return typeof(return).init;
          }

          bool _dretval;
          string _uri = uri.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncSetCurrentUri(_uri);
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.setCurrentUri = cast(typeof(_klass.setCurrentUri))&_vfuncSetCurrentUriTramp;
        break;
      }
      case "unselect_all":
      {
        static extern(C) void _vfuncUnselectAllTramp(GtkRecentChooser* chooser) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.unselectAll)
              return (cast(typeof(&_vfuncUnselectAllTramp))_klass.unselectAll)(chooser);
            return;
          }

          try
          {
            _obj.vfuncUnselectAll();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncUnselectAll");
          }
        }

        _klass.unselectAll = cast(typeof(_klass.unselectAll))&_vfuncUnselectAllTramp;
        break;
      }
      case "unselect_uri":
      {
        static extern(C) void _vfuncUnselectUriTramp(GtkRecentChooser* chooser, const(char)* uri) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)chooser);
          if (!_obj)
          {
            auto _klass = cast(GtkRecentChooserIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)chooser), gid.gtk3.recent_chooser.RecentChooser._getGType);
            if (_klass && _klass.unselectUri)
              return (cast(typeof(&_vfuncUnselectUriTramp))_klass.unselectUri)(chooser, uri);
            return;
          }

          string _uri = uri.fromCString!(No.Free);

          try
          {
            _obj.vfuncUnselectUri(_uri);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.recent_chooser.RecentChooser.vfuncUnselectUri");
          }
        }

        _klass.unselectUri = cast(typeof(_klass.unselectUri))&_vfuncUnselectUriTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.recent_chooser.RecentChooser]
template RecentChooserGidBuilderT()
{

  /**
      Set `filter` property.
      Params:
        propval = The #GtkRecentFilter object to be used when displaying
          the recently used resources.
      Returns: Builder instance for fluent chaining
  */
  T filter(gid.gtk3.recent_filter.RecentFilter propval) nothrow
  {
    return setProperty("filter", propval);
  }

  /**
      Set `limit` property.
      Params:
        propval = The maximum number of recently used resources to be displayed,
          or -1 to display all items.
      Returns: Builder instance for fluent chaining
  */
  T limit(int propval) nothrow
  {
    return setProperty("limit", propval);
  }

  /**
      Set `localOnly` property.
      Params:
        propval = Whether this #GtkRecentChooser should display only local (file:)
          resources.
      Returns: Builder instance for fluent chaining
  */
  T localOnly(bool propval) nothrow
  {
    return setProperty("local-only", propval);
  }

  /**
      Set `recentManager` property.
      Params:
        propval = The #GtkRecentManager instance used by the #GtkRecentChooser to
          display the list of recently used resources.
      Returns: Builder instance for fluent chaining
  */
  T recentManager(gid.gtk3.recent_manager.RecentManager propval) nothrow
  {
    return setProperty("recent-manager", propval);
  }

  /**
      Set `selectMultiple` property.
      Params:
        propval = Allow the user to select multiple resources.
      Returns: Builder instance for fluent chaining
  */
  T selectMultiple(bool propval) nothrow
  {
    return setProperty("select-multiple", propval);
  }

  /**
      Set `showIcons` property.
      Params:
        propval = Whether this #GtkRecentChooser should display an icon near the item.
      Returns: Builder instance for fluent chaining
  */
  T showIcons(bool propval) nothrow
  {
    return setProperty("show-icons", propval);
  }

  /**
      Set `showNotFound` property.
      Params:
        propval = Whether this #GtkRecentChooser should display the recently used resources
          even if not present anymore. Setting this to false will perform a
          potentially expensive check on every local resource (every remote
          resource will always be displayed).
      Returns: Builder instance for fluent chaining
  */
  T showNotFound(bool propval) nothrow
  {
    return setProperty("show-not-found", propval);
  }

  /** */
  T showPrivate(bool propval) nothrow
  {
    return setProperty("show-private", propval);
  }

  /**
      Set `showTips` property.
      Params:
        propval = Whether this #GtkRecentChooser should display a tooltip containing the
          full path of the recently used resources.
      Returns: Builder instance for fluent chaining
  */
  T showTips(bool propval) nothrow
  {
    return setProperty("show-tips", propval);
  }

  /**
      Set `sortType` property.
      Params:
        propval = Sorting order to be used when displaying the recently used resources.
      Returns: Builder instance for fluent chaining
  */
  T sortType(gid.gtk3.types.RecentSortType propval) nothrow
  {
    return setProperty("sort-type", propval);
  }
}
