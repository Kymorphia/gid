/// Module for [Sidebar] class
module adw.sidebar;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.sidebar_item;
import adw.sidebar_section;
import adw.types;
import gdk.types;
import gid.gid;
import gio.list_model;
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
import gtk.filter;
import gtk.selection_model;
import gtk.widget;

/**
    Adaptive sidebar widget.
    
    <picture>
      <source srcset="sidebar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="sidebar.png" alt="sidebar">
    </picture>
    
    [adw.sidebar.Sidebar] contains [adw.sidebar_section.SidebarSection] objects, which in turn contain
    [adw.sidebar_item.SidebarItem] objects.
    
    To add sections, use [adw.sidebar.Sidebar.append], [adw.sidebar.Sidebar.prepend] or
    [adw.sidebar.Sidebar.insert].
    
    To remove sections, use [adw.sidebar.Sidebar.remove] or
    [adw.sidebar.Sidebar.removeAll].
    
    To inspect the items, use [adw.sidebar.Sidebar.getItem] or
    [adw.sidebar.Sidebar.items].
    
    To inspect sections themselves, use [adw.sidebar.Sidebar.getSection] or
    [adw.sidebar.Sidebar.sections].
    
    ## Selection and activation
    
    [adw.sidebar.Sidebar] has zero or one selected items. The index of the item can be
    accessed and changed via [adw.sidebar.Sidebar.selected]. Set it to
    [gtk.types.INVALID_LIST_POSITION] to remove selection.
    
    Selection cannot be permanently disabled.
    
    [adw.sidebar.Sidebar.selectedItem] can be used to access the selected item.
    
    Connect to the [adw.sidebar.Sidebar.activated] signal to run code when an item
    has been activated. This can be used to toggle the visible pane when used in
    a split view.
    
    See also: [adw.view_switcher_sidebar.ViewSwitcherSidebar].
    
    ## Modes
    
    <picture>
      <source srcset="sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
      <img src="sidebar-modes.png" alt="sidebar-modes">
    </picture>
    
    [adw.sidebar.Sidebar] is adaptive and can act as either a regular sidebar, or a page
    of boxed lists.
    
    Use the [adw.sidebar.Sidebar.mode] to determine its look and behavior.
    
    A typical use case involves using [adw.sidebar.Sidebar] inside the sidebar pane of a
    [adw.navigation_split_view.NavigationSplitView], and switching mode to page whenever it's
    collapsed, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="default-width">800</property>
      <property name="default-height">600</property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 400sp</condition>
          <setter object="split_view" property="collapsed">True</setter>
          <setter object="sidebar" property="mode">page</setter>
        </object>
      </child>
      <property name="content">
        <object class="AdwNavigationSplitView" id="split_view">
          <property name="sidebar">
            <object class="AdwNavigationPage">
              <property name="title" translatable="yes">Sidebar</property>
              <property name="child">
                <object class="AdwToolbarView">
                  <child type="top">
                    <object class="AdwHeaderBar"/>
                  </child>
                  <property name="content">
                    <object class="AdwSidebar" id="sidebar">
                      <!-- Calls adw_navigation_split_view_set_show_content (split_view, TRUE); -->
                      <signal name="activated" handler="sidebar_activated_cb"/>
                      <!-- ... -->
                    </object>
                  </property>
                </object>
              </property>
            </object>
          </property>
          <property name="content">
            <object class="AdwNavigationPage">
              <property name="title" translatable="yes">Content</property>
              <property name="child">
                <!-- ... -->
              </property>
            </object>
          </property>
        </object>
      </property>
    </object>
    ```
    
    When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
    mode, as the sidebar pane is still a sidebar when collapsed.
    
    ## Search
    
    [adw.sidebar.Sidebar] supports filtering items via the [adw.sidebar.Sidebar.filter]
    property.
    
    Use [adw.sidebar.Sidebar.placeholder] to provide an empty state widget. It will
    be shown when all items have been filtered out, or the sidebar has no items
    otherwise.
    
    ## Context Menu
    
    To create a context menu for the sidebar items, use the
    [adw.sidebar.Sidebar.menuModel] property to provide a menu model, and the
    [adw.sidebar.Sidebar.setupMenu] signal to set up actions for the given item.
    
    To set or override the menu for just one section, use
    [adw.sidebar_section.SidebarSection.menuModel] instead.
    
    ## Drag-and-Drop
    
    [adw.sidebar.Sidebar] items can have a drop target for arbitrary content.
    
    Use [adw.sidebar.Sidebar.setupDropTarget] to set it up, specifying the
    supported content types and drag actions, then connect to
    [adw.sidebar.Sidebar.drop] to handle drops.
    
    In some cases, it may be necessary to determine the used action based on the
    dragged content, or the hovered item.
    
    To determine it based on the sidebar item, connect to the
    [adw.sidebar.Sidebar.dropEnter] signal and return the action from its handler.
    
    To determine it based on the content, set [adw.sidebar.Sidebar.dropPreload] to
    `TRUE`, then connect to [adw.sidebar.Sidebar.dropValueLoaded] signal and return
    the action from its handler.
    
    In both cases the action will be passed as a parameter to the
    [adw.sidebar.Sidebar.drop] signal.
    
    Regardless of whether a drop target was set up, dragging content over sidebar
    items activates them after a timeout. To disable this behavior for specific
    items, set [adw.sidebar_item.SidebarItem.dragMotionActivate] to `FALSE` on them.
    
    ## [adw.sidebar.Sidebar] as [gtk.buildable.Buildable]
    
    [adw.sidebar.Sidebar] allows adding sections as children.
    
    Example of an [adw.sidebar.Sidebar] UI definition:
    
    ```xml
    <object class="AdwSidebar">
      <child>
        <object class="AdwSidebarSection">
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Recent</property>
              <property name="icon-name">document-open-recent-symbolic</property>
            </object>
          </child>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Starred</property>
              <property name="icon-name">starred-symbolic</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="AdwSidebarSection">
          <property name="title" translatable="yes">Places</property>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Music</property>
              <property name="icon-name">folder-music-symbolic</property>
            </object>
          </child>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Pictures</property>
              <property name="icon-name">folder-pictures-symbolic</property>
            </object>
          </child>
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Videos</property>
              <property name="icon-name">folder-videos-symbolic</property>
            </object>
          </child>
        </object>
      </child>
      <child>
        <object class="AdwSidebarSection">
          <child>
            <object class="AdwSidebarItem">
              <property name="title" translatable="yes">Trash</property>
              <property name="icon-name">user-trash-symbolic</property>
            </object>
          </child>
        </object>
      </child>
    </object>
    ```
    
    ## CSS nodes
    
    [adw.sidebar.Sidebar] has a main CSS node with the name `sidebar`.
    
    Internally, it's using a [gtk.list_box.ListBox] with the
    [`.navigation-sidebar`](style-classes.html#sidebars) style class in sidebar
    mode, or an [adw.preferences_page.PreferencesPage] in page mode.
    
    ## Accessibility
    
    [adw.sidebar.Sidebar] uses the [gtk.types.AccessibleRole.Generic] role.
*/
class Sidebar : gtk.widget.Widget
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_sidebar_get_type != &gidSymbolNotFound ? adw_sidebar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Sidebar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.sidebar.Sidebar]
      Returns: New builder object
  */
  static SidebarGidBuilder builder() nothrow
  {
    return new SidebarGidBuilder;
  }

  /**
      Get `dropPreload` property.
      Returns: Whether the drop data should be preloaded on hover.
        
        See [gtk.drop_target.DropTarget.preload].
  */
  @property bool dropPreload() nothrow
  {
    return getDropPreload();
  }

  /**
      Set `dropPreload` property.
      Params:
        propval = Whether the drop data should be preloaded on hover.
          
          See [gtk.drop_target.DropTarget.preload].
  */
  @property void dropPreload(bool propval) nothrow
  {
    setDropPreload(propval);
  }

  /**
      Get `filter` property.
      Returns: The item filter.
        
        Can be used to implement search within the sidebar.
        
        Use [adw.sidebar.Sidebar.placeholder] to provide an empty state.
  */
  @property gtk.filter.Filter filter() nothrow
  {
    return getFilter();
  }

  /**
      Set `filter` property.
      Params:
        propval = The item filter.
          
          Can be used to implement search within the sidebar.
          
          Use [adw.sidebar.Sidebar.placeholder] to provide an empty state.
  */
  @property void filter(gtk.filter.Filter propval) nothrow
  {
    setFilter(propval);
  }

  /**
      Get `items` property.
      Returns: A list model with the sidebar's items.
        
        This can be used to keep an up-to-date view.
        
        The model implements [gtk.section_model.SectionModel] and creates sections
        corresponding to the sidebar's sections.
        
        The model also implements [gtk.selection_model.SelectionModel] and can be used to
        track and change the selection.
        
        To only track sections, use [adw.sidebar.Sidebar.sections] instead.
  */
  @property gtk.selection_model.SelectionModel items() nothrow
  {
    return getItems();
  }

  /**
      Get `menuModel` property.
      Returns: Context menu model for the items.
        
        When a context menu is shown for an item, it will be constructed from the
        provided menu model. Use the [adw.sidebar.Sidebar.setupMenu] signal to set up
        the menu actions for the particular item.
        
        [adw.sidebar.Sidebar.menuModel] will be preferred over this model if set.
  */
  @property gio.menu_model.MenuModel menuModel() nothrow
  {
    return getMenuModel();
  }

  /**
      Set `menuModel` property.
      Params:
        propval = Context menu model for the items.
          
          When a context menu is shown for an item, it will be constructed from the
          provided menu model. Use the [adw.sidebar.Sidebar.setupMenu] signal to set up
          the menu actions for the particular item.
          
          [adw.sidebar.Sidebar.menuModel] will be preferred over this model if set.
  */
  @property void menuModel(gio.menu_model.MenuModel propval) nothrow
  {
    setMenuModel(propval);
  }

  /**
      Get `mode` property.
      Returns: Determines the sidebar's look and behavior.
        
        <picture>
          <source srcset="sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
          <img src="sidebar-modes.png" alt="sidebar-modes">
        </picture>
        
        If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
        sidebar style and a persistent selection.
        
        If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
        In this mode, the selection is invisible and only tracked to determine the
        initially selected item once switched back to sidebar mode.
        
        The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
        collapsed, as the sidebar pane becomes a page there.
        
        When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
        mode, as the sidebar pane is still a sidebar when collapsed.
  */
  @property adw.types.SidebarMode mode() nothrow
  {
    return getMode();
  }

  /**
      Set `mode` property.
      Params:
        propval = Determines the sidebar's look and behavior.
          
          <picture>
            <source srcset="sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
            <img src="sidebar-modes.png" alt="sidebar-modes">
          </picture>
          
          If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
          sidebar style and a persistent selection.
          
          If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
          In this mode, the selection is invisible and only tracked to determine the
          initially selected item once switched back to sidebar mode.
          
          The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
          collapsed, as the sidebar pane becomes a page there.
          
          When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
          mode, as the sidebar pane is still a sidebar when collapsed.
  */
  @property void mode(adw.types.SidebarMode propval) nothrow
  {
    setMode(propval);
  }

  /**
      Get `placeholder` property.
      Returns: The placeholder widget.
        
        This widget will be shown if the sidebar has no items, or all of its items
        have been filtered out by [adw.sidebar.Sidebar.filter].
  */
  @property gtk.widget.Widget placeholder() nothrow
  {
    return getPlaceholder();
  }

  /**
      Set `placeholder` property.
      Params:
        propval = The placeholder widget.
          
          This widget will be shown if the sidebar has no items, or all of its items
          have been filtered out by [adw.sidebar.Sidebar.filter].
  */
  @property void placeholder(gtk.widget.Widget propval) nothrow
  {
    setPlaceholder(propval);
  }

  /**
      Get `sections` property.
      Returns: A list model with the sidebar's sections.
        
        This can be used to keep an up-to-date view.
        
        To track items, use [adw.sidebar.Sidebar.items] instead.
  */
  @property gio.list_model.ListModel sections() nothrow
  {
    return getSections();
  }

  /**
      Get `selected` property.
      Returns: The index of the currently selected item.
        
        If set to [gtk.types.INVALID_LIST_POSITION], no item is selected.
        
        If [adw.sidebar.Sidebar.mode] is set to [adw.types.SidebarMode.Page], the
        selection is invisible, but still tracked, indicating which item will be
        selected once the mode is changed to [adw.types.SidebarMode.Sidebar].
        
        See also: [adw.sidebar.Sidebar.selectedItem].
  */
  @property uint selected() nothrow
  {
    return getSelected();
  }

  /**
      Set `selected` property.
      Params:
        propval = The index of the currently selected item.
          
          If set to [gtk.types.INVALID_LIST_POSITION], no item is selected.
          
          If [adw.sidebar.Sidebar.mode] is set to [adw.types.SidebarMode.Page], the
          selection is invisible, but still tracked, indicating which item will be
          selected once the mode is changed to [adw.types.SidebarMode.Sidebar].
          
          See also: [adw.sidebar.Sidebar.selectedItem].
  */
  @property void selected(uint propval) nothrow
  {
    setSelected(propval);
  }

  /**
      Get `selectedItem` property.
      Returns: The currently selected item.
        
        This is a convenience property, equivalent to calling
        [adw.sidebar.Sidebar.getItem] with [adw.sidebar.Sidebar.selected] provided as the
        index.
        
        To change selection, use [adw.sidebar.Sidebar.selected].
  */
  @property adw.sidebar_item.SidebarItem selectedItem() nothrow
  {
    return getSelectedItem();
  }

  /**
      Creates a new [adw.sidebar.Sidebar].
      Returns: the newly created [adw.sidebar.Sidebar]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_sidebar_new();
    this(_cretval, No.Take);
  }

  /**
      Appends section to self.
  
      Params:
        section = a section to append
  */
  void append(adw.sidebar_section.SidebarSection section) nothrow
  {
    adw_sidebar_append(cast(AdwSidebar*)this._cPtr, section ? cast(AdwSidebarSection*)section._cPtr(Yes.Dup) : null);
  }

  /**
      Gets whether drop data should be preloaded on hover.
      Returns: whether drop data should be preloaded on hover
  */
  bool getDropPreload() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_sidebar_get_drop_preload(cast(AdwSidebar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the item filter for self.
      Returns: the item filter
  */
  gtk.filter.Filter getFilter() nothrow
  {
    GtkFilter* _cretval;
    _cretval = adw_sidebar_get_filter(cast(AdwSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.filter.Filter)(cast(GtkFilter*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the item at index within self.
      
      The index starts from 0 at the top of the sidebar, and is same as the one
      returned by [adw.sidebar_item.SidebarItem.getIndex].
      
      Can return `NULL` if index is larger or equal to the number of items.
  
      Params:
        index = index of the item
      Returns: the item at index
  */
  adw.sidebar_item.SidebarItem getItem(uint index) nothrow
  {
    AdwSidebarItem* _cretval;
    _cretval = adw_sidebar_get_item(cast(AdwSidebar*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.sidebar_item.SidebarItem)(cast(AdwSidebarItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list model with self's items.
      
      This can be used to keep an up-to-date view.
      
      The model implements [gtk.section_model.SectionModel] and creates sections
      corresponding to the sidebar's sections.
      
      The model also implements [gtk.selection_model.SelectionModel] and can be used to
      track and change the selection.
      
      To only track sections, use [adw.sidebar.Sidebar.sections] instead.
      Returns: a model containing the items
  */
  gtk.selection_model.SelectionModel getItems() nothrow
  {
    GtkSelectionModel* _cretval;
    _cretval = adw_sidebar_get_items(cast(AdwSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.selection_model.SelectionModel)(cast(GtkSelectionModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the context menu model for self's items.
      Returns: the context menu model
  */
  gio.menu_model.MenuModel getMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = adw_sidebar_get_menu_model(cast(AdwSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets self's look and behavior.
      Returns: the current mode
  */
  adw.types.SidebarMode getMode() nothrow
  {
    AdwSidebarMode _cretval;
    _cretval = adw_sidebar_get_mode(cast(AdwSidebar*)this._cPtr);
    adw.types.SidebarMode _retval = cast(adw.types.SidebarMode)_cretval;
    return _retval;
  }

  /**
      Gets the placeholder widget for self.
      Returns: the placeholder widget
  */
  gtk.widget.Widget getPlaceholder() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_sidebar_get_placeholder(cast(AdwSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the section at index within self.
      
      Can return `NULL` if index is larger or equal to the number of sections.
  
      Params:
        index = index of the section
      Returns: the section at index
  */
  adw.sidebar_section.SidebarSection getSection(uint index) nothrow
  {
    AdwSidebarSection* _cretval;
    _cretval = adw_sidebar_get_section(cast(AdwSidebar*)this._cPtr, index);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.sidebar_section.SidebarSection)(cast(AdwSidebarSection*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets a list model with self's sections.
      
      This can be used to keep an up-to-date view.
      
      To track items, use [adw.sidebar.Sidebar.items] instead.
      Returns: a model containing the sections
  */
  gio.list_model.ListModel getSections() nothrow
  {
    GListModel* _cretval;
    _cretval = adw_sidebar_get_sections(cast(AdwSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.list_model.ListModel)(cast(GListModel*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the index of the currently selected item.
      
      See also: [adw.sidebar.Sidebar.getSelectedItem].
      Returns: index of the currently selected item
  */
  uint getSelected() nothrow
  {
    uint _retval;
    _retval = adw_sidebar_get_selected(cast(AdwSidebar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the currently selected item.
      
      This is a convenience method, equivalent to calling [adw.sidebar.Sidebar.getItem]
      with [adw.sidebar.Sidebar.selected] provided as the index.
      
      To change selection, use [adw.sidebar.Sidebar.setSelected].
      Returns: the selected item
  */
  adw.sidebar_item.SidebarItem getSelectedItem() nothrow
  {
    AdwSidebarItem* _cretval;
    _cretval = adw_sidebar_get_selected_item(cast(AdwSidebar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.sidebar_item.SidebarItem)(cast(AdwSidebarItem*)_cretval, No.Take);
    return _retval;
  }

  /**
      Inserts section at position to self.
      
      If position is -1, or larger than the total number of sections in self,
      the section will be appended to the end.
  
      Params:
        section = a section to insert
        position = position to insert section at
  */
  void insert(adw.sidebar_section.SidebarSection section, int position) nothrow
  {
    adw_sidebar_insert(cast(AdwSidebar*)this._cPtr, section ? cast(AdwSidebarSection*)section._cPtr(Yes.Dup) : null, position);
  }

  /**
      Prepends section to self.
  
      Params:
        section = a section to prepend
  */
  void prepend(adw.sidebar_section.SidebarSection section) nothrow
  {
    adw_sidebar_prepend(cast(AdwSidebar*)this._cPtr, section ? cast(AdwSidebarSection*)section._cPtr(Yes.Dup) : null);
  }

  /**
      Removes section from self.
  
      Params:
        section = a section to remove
  */
  void remove(adw.sidebar_section.SidebarSection section) nothrow
  {
    adw_sidebar_remove(cast(AdwSidebar*)this._cPtr, section ? cast(AdwSidebarSection*)section._cPtr(No.Dup) : null);
  }

  /**
      Removes all sections from self.
  */
  void removeAll() nothrow
  {
    adw_sidebar_remove_all(cast(AdwSidebar*)this._cPtr);
  }

  /**
      Sets whether drop data should be preloaded on hover.
      
      See [gtk.drop_target.DropTarget.preload].
  
      Params:
        preload = whether to preload drop data
  */
  void setDropPreload(bool preload) nothrow
  {
    adw_sidebar_set_drop_preload(cast(AdwSidebar*)this._cPtr, preload);
  }

  /**
      Sets the item filter for self.
      
      Can be used to implement search within the sidebar.
      
      Use [adw.sidebar.Sidebar.placeholder] to provide an empty state.
  
      Params:
        filter = the item filter
  */
  void setFilter(gtk.filter.Filter filter = null) nothrow
  {
    adw_sidebar_set_filter(cast(AdwSidebar*)this._cPtr, filter ? cast(GtkFilter*)filter._cPtr(No.Dup) : null);
  }

  /**
      Sets the context menu model for self's items.
      
      When a context menu is shown for an item, it will be constructed from the
      provided menu model. Use the [adw.sidebar.Sidebar.setupMenu] signal to set up
      the menu actions for the particular item.
      
      [adw.sidebar.Sidebar.menuModel] will be preferred over this model if set.
  
      Params:
        menuModel = a menu model
  */
  void setMenuModel(gio.menu_model.MenuModel menuModel = null) nothrow
  {
    adw_sidebar_set_menu_model(cast(AdwSidebar*)this._cPtr, menuModel ? cast(GMenuModel*)menuModel._cPtr(No.Dup) : null);
  }

  /**
      Sets self's look and behavior.
      
      <picture>
        <source srcset="sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
        <img src="sidebar-modes.png" alt="sidebar-modes">
      </picture>
      
      If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
      sidebar style and a persistent selection.
      
      If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
      In this mode, the selection is invisible and only tracked to determine the
      initially selected item once switched back to sidebar mode.
      
      The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
      collapsed, as the sidebar pane becomes a page there.
      
      When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
      mode, as the sidebar pane is still a sidebar when collapsed.
  
      Params:
        mode = the new mode
  */
  void setMode(adw.types.SidebarMode mode) nothrow
  {
    adw_sidebar_set_mode(cast(AdwSidebar*)this._cPtr, mode);
  }

  /**
      Sets the placeholder widget for self.
      
      This widget will be shown if self has no items, or all of its items have
      been filtered out by [adw.sidebar.Sidebar.filter].
  
      Params:
        placeholder = the placeholder widget
  */
  void setPlaceholder(gtk.widget.Widget placeholder = null) nothrow
  {
    adw_sidebar_set_placeholder(cast(AdwSidebar*)this._cPtr, placeholder ? cast(GtkWidget*)placeholder._cPtr(No.Dup) : null);
  }

  /**
      Selects the item at selected.
      
      If set to [gtk.types.INVALID_LIST_POSITION], no item is selected.
      
      If [adw.sidebar.Sidebar.mode] is set to [adw.types.SidebarMode.Page], the
      selection is invisible, but still tracked, indicating which item will be
      selected once the mode is changed to [adw.types.SidebarMode.Sidebar].
      
      See also: [adw.sidebar.Sidebar.selectedItem].
  
      Params:
        selected = index of the newly selected item
  */
  void setSelected(uint selected) nothrow
  {
    adw_sidebar_set_selected(cast(AdwSidebar*)this._cPtr, selected);
  }

  /**
      Sets up a drop target on the items.
      
      This allows to drag arbitrary content onto items.
      
      The [adw.sidebar.Sidebar.drop] signal can be used to handle the drop.
  
      Params:
        actions = the supported actions
        types = all supported `GType`s that can be dropped
  */
  void setupDropTarget(gdk.types.DragAction actions, gobject.types.GType[] types = null) nothrow
  {
    size_t _nTypes;
    if (types)
      _nTypes = cast(size_t)types.length;

    auto _types = cast(GType*)types.ptr;
    adw_sidebar_setup_drop_target(cast(AdwSidebar*)this._cPtr, actions, _types, _nTypes);
  }

  /**
      Connect to `Activated` signal.
  
      Emitted when an item at index has been activated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint index, adw.sidebar.Sidebar sidebar)`
  
          `index` the item index (optional)
  
          `sidebar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectActivated(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.sidebar.Sidebar)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "adw.sidebar.Sidebar.activated");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("activated", closure, after);
  }

  /**
      Connect to `Drop` signal.
  
      Emitted when content is dropped onto the item at index.
        
        The content must be of one of the types set up via
        [adw.sidebar.Sidebar.setupDropTarget].
        
        See [gtk.drop_target.DropTarget.drop].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(uint index, gobject.value.Value value, gdk.types.DragAction preferredAction, adw.sidebar.Sidebar sidebar)`
  
          `index` index of the item the content was dropped onto (optional)
  
          `value` the [gobject.value.Value] being dropped (optional)
  
          `preferredAction` the preferred drop action (optional)
  
          `sidebar` the instance the signal is connected to (optional)
  
          `Returns` whether the drop was accepted
            
            SinceL 1.9
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDrop(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] == gdk.types.DragAction)))
  && (Parameters!T.length < 4 || (ParameterStorageClassTuple!T[3] == ParameterStorageClass.none && is(Parameters!T[3] : adw.sidebar.Sidebar)))
  && Parameters!T.length < 5)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 4, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[3]);

      static if (Parameters!T.length > 3)
        _paramTuple[3] = getVal!(Parameters!T[3])(&_paramVals[0]);

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "adw.sidebar.Sidebar.drop");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drop", closure, after);
  }

  /**
      Connect to `DropEnter` signal.
  
      Emitted when the pointer enters the item at index.
        
        Applications can use this to set their default drop action even when
        [adw.sidebar.Sidebar.dropPreload] is set to `FALSE`.
        
        See [gtk.drop_target.DropTarget.enter].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gdk.types.DragAction callback(uint index, adw.sidebar.Sidebar sidebar)`
  
          `index` index of the hovered item (optional)
  
          `sidebar` the instance the signal is connected to (optional)
  
          `Returns` the preferred action for the drop
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDropEnter(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gdk.types.DragAction)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.sidebar.Sidebar)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      gdk.types.DragAction _retval;

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
        gidInvokeCallbackExceptionHandler(e, "adw.sidebar.Sidebar.dropEnter");
      }

      setVal!(gdk.types.DragAction)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drop-enter", closure, after);
  }

  /**
      Connect to `DropValueLoaded` signal.
  
      Emitted when the dropped content is preloaded for the item at index.
        
        In order for data to be preloaded, [adw.sidebar.Sidebar.dropPreload]
        must be set to `TRUE`.
        
        The content must be of one of the types set up via
        [adw.sidebar.Sidebar.setupDropTarget].
        
        See [gtk.drop_target.DropTarget.value].
  
      Params:
        callback = signal callback delegate or function to connect
  
          `gdk.types.DragAction callback(uint index, gobject.value.Value value, adw.sidebar.Sidebar sidebar)`
  
          `index` index of the hovered item (optional)
  
          `value` the [gobject.value.Value] being dropped (optional)
  
          `sidebar` the instance the signal is connected to (optional)
  
          `Returns` the preferred action for the drop
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDropValueLoaded(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == gdk.types.DragAction)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gobject.value.Value)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : adw.sidebar.Sidebar)))
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
        gidInvokeCallbackExceptionHandler(e, "adw.sidebar.Sidebar.dropValueLoaded");
      }

      setVal!(gdk.types.DragAction)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drop-value-loaded", closure, after);
  }

  /**
      Connect to `SetupMenu` signal.
  
      Emitted when a context menu is opened or closed for item.
        
        If the menu has been closed, item will be set to `NULL`.
        
        It can be used to set up menu actions before showing the menu, for example
        disable actions not applicable to item.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(adw.sidebar_item.SidebarItem item, adw.sidebar.Sidebar sidebar)`
  
          `item` an item in self (optional)
  
          `sidebar` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSetupMenu(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : adw.sidebar_item.SidebarItem)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : adw.sidebar.Sidebar)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
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
        gidInvokeCallbackExceptionHandler(e, "adw.sidebar.Sidebar.setupMenu");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("setup-menu", closure, after);
  }
}

/// Fluent builder implementation template for [adw.sidebar.Sidebar]
class SidebarGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `dropPreload` property.
      Params:
        propval = Whether the drop data should be preloaded on hover.
          
          See [gtk.drop_target.DropTarget.preload].
      Returns: Builder instance for fluent chaining
  */
  T dropPreload(bool propval) nothrow
  {
    return setProperty("drop-preload", propval);
  }

  /**
      Set `filter` property.
      Params:
        propval = The item filter.
          
          Can be used to implement search within the sidebar.
          
          Use [adw.sidebar.Sidebar.placeholder] to provide an empty state.
      Returns: Builder instance for fluent chaining
  */
  T filter(gtk.filter.Filter propval) nothrow
  {
    return setProperty("filter", propval);
  }

  /**
      Set `menuModel` property.
      Params:
        propval = Context menu model for the items.
          
          When a context menu is shown for an item, it will be constructed from the
          provided menu model. Use the [adw.sidebar.Sidebar.setupMenu] signal to set up
          the menu actions for the particular item.
          
          [adw.sidebar.Sidebar.menuModel] will be preferred over this model if set.
      Returns: Builder instance for fluent chaining
  */
  T menuModel(gio.menu_model.MenuModel propval) nothrow
  {
    return setProperty("menu-model", propval);
  }

  /**
      Set `mode` property.
      Params:
        propval = Determines the sidebar's look and behavior.
          
          <picture>
            <source srcset="sidebar-modes-dark.png" media="(prefers-color-scheme: dark)">
            <img src="sidebar-modes.png" alt="sidebar-modes">
          </picture>
          
          If set to [adw.types.SidebarMode.Sidebar], behaves like a sidebar: with a
          sidebar style and a persistent selection.
          
          If set to [adw.types.SidebarMode.Page], behaves like a page of boxed lists.
          In this mode, the selection is invisible and only tracked to determine the
          initially selected item once switched back to sidebar mode.
          
          The page mode is intended to be used with [adw.navigation_split_view.NavigationSplitView] when
          collapsed, as the sidebar pane becomes a page there.
          
          When used with [adw.overlay_split_view.OverlaySplitView], the sidebar should stay in sidebar
          mode, as the sidebar pane is still a sidebar when collapsed.
      Returns: Builder instance for fluent chaining
  */
  T mode(adw.types.SidebarMode propval) nothrow
  {
    return setProperty("mode", propval);
  }

  /**
      Set `placeholder` property.
      Params:
        propval = The placeholder widget.
          
          This widget will be shown if the sidebar has no items, or all of its items
          have been filtered out by [adw.sidebar.Sidebar.filter].
      Returns: Builder instance for fluent chaining
  */
  T placeholder(gtk.widget.Widget propval) nothrow
  {
    return setProperty("placeholder", propval);
  }

  /**
      Set `selected` property.
      Params:
        propval = The index of the currently selected item.
          
          If set to [gtk.types.INVALID_LIST_POSITION], no item is selected.
          
          If [adw.sidebar.Sidebar.mode] is set to [adw.types.SidebarMode.Page], the
          selection is invisible, but still tracked, indicating which item will be
          selected once the mode is changed to [adw.types.SidebarMode.Sidebar].
          
          See also: [adw.sidebar.Sidebar.selectedItem].
      Returns: Builder instance for fluent chaining
  */
  T selected(uint propval) nothrow
  {
    return setProperty("selected", propval);
  }
}

/// Fluent builder for [adw.sidebar.Sidebar]
final class SidebarGidBuilder : SidebarGidBuilderImpl!SidebarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Sidebar build() nothrow
  {
    return new Sidebar(cast(void*)createGObject(Sidebar._getGType), Yes.Take);
  }
}
