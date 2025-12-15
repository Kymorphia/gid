/// Module for [NavigationSplitView] class
module adw.navigation_split_view;

import adw.c.functions;
import adw.c.types;
import adw.navigation_page;
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
    A widget presenting sidebar and content side by side or as a navigation view.
    
    <picture>
      <source srcset="navigation-split-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-split-view.png" alt="navigation-split-view">
    </picture>
    <picture>
      <source srcset="navigation-split-view-collapsed-dark.png" media="(prefers-color-scheme: dark)">
      <img src="navigation-split-view-collapsed.png" alt="navigation-split-view-collapsed">
    </picture>
    
    [adw.navigation_split_view.NavigationSplitView] has two `class@NavigationPage` children: sidebar and
    content, and displays them side by side.
    
    When `property@NavigationSplitView:collapsed` is set to `TRUE`, it instead
    puts both children inside an `class@NavigationView`. The
    `property@NavigationSplitView:show-content` controls which child is visible
    while collapsed.
    
    See also `class@OverlaySplitView`.
    
    [adw.navigation_split_view.NavigationSplitView] is typically used together with an `class@Breakpoint`
    setting the `collapsed` property to `TRUE` on small widths, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">280</property>
      <property name="height-request">200</property>
      <property name="default-width">800</property>
      <property name="default-height">800</property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 400sp</condition>
          <setter object="split_view" property="collapsed">True</setter>
        </object>
      </child>
      <property name="content">
        <object class="AdwNavigationSplitView" id="split_view">
          <property name="sidebar">
            <object class="AdwNavigationPage">
              <property name="title" translatable="yes">Sidebar</property>
              <property name="child">
                <!-- ... -->
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
    
    ## Sizing
    
    When not collapsed, [adw.navigation_split_view.NavigationSplitView] changes the sidebar width
    depending on its own width.
    
    If possible, it tries to allocate a fraction of the total width, controlled
    with the `property@NavigationSplitView:sidebar-width-fraction` property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    `property@NavigationSplitView:min-sidebar-width` and
    `property@NavigationSplitView:max-sidebar-width` properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    `property@NavigationSplitView:sidebar-width-unit`.
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    ## Header Bar Integration
    
    When used inside [adw.navigation_split_view.NavigationSplitView], `class@HeaderBar` will
    automatically hide the window buttons in the middle.
    
    When collapsed, it also displays a back button for the content widget, as
    well as the page titles. See `class@NavigationView` documentation for details.
    
    ## Actions
    
    [adw.navigation_split_view.NavigationSplitView] defines the same actions as [adw.navigation_view.NavigationView], but
    they can be used even when the split view is not collapsed:
    
    $(LIST
      * `navigation.push` takes a string parameter specifying the tag of the page
    )
    to push. If it matches the tag of the content widget, it sets
    `property@NavigationSplitView:show-content` to `TRUE`.
    
    $(LIST
      * `navigation.pop` doesn't take any parameters and sets
    )
    `property@NavigationSplitView:show-content` to `FALSE`.
    
    ## [adw.navigation_split_view.NavigationSplitView] as [gtk.buildable.Buildable]
    
    The [adw.navigation_split_view.NavigationSplitView] implementation of the [gtk.buildable.Buildable]
    interface supports setting the sidebar widget by specifying “sidebar” as the
    “type” attribute of a `<child>` element, Specifying “content” child type or
    omitting it results in setting the content widget.
    
    ## CSS nodes
    
    [adw.navigation_split_view.NavigationSplitView] has a single CSS node with the name
    `navigation-split-view`.
    
    When collapsed, it contains a child node with the name `navigation-view`
    containing both children.
    
    ```
    navigation-split-view
    ╰── navigation-view
        ├── [sidebar child]
        ╰── [content child]
    ```
    
    When not collapsed, it contains two nodes with the name `widget`, one with
    the `.sidebar-pane` style class, the other one with `.content-view` style
    class, containing the sidebar and content children respectively.
    
    ```
    navigation-split-view
    ├── widget.sidebar-pane
    │   ╰── [sidebar child]
    ╰── widget.content-pane
        ╰── [content child]
    ```
    
    ## Accessibility
    
    [adw.navigation_split_view.NavigationSplitView] uses the [gtk.types.AccessibleRole.Group] role.
*/
class NavigationSplitView : gtk.widget.Widget
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
    return cast(void function())adw_navigation_split_view_get_type != &gidSymbolNotFound ? adw_navigation_split_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NavigationSplitView self()
  {
    return this;
  }

  /**
      Get `collapsed` property.
      Returns: Whether the split view is collapsed.
      
      When collapsed, the children are put inside an `class@NavigationView`,
      otherwise they are displayed side by side.
      
      The `property@NavigationSplitView:show-content` controls which child is
      visible while collapsed.
  */
  @property bool collapsed()
  {
    return getCollapsed();
  }

  /**
      Set `collapsed` property.
      Params:
        propval = Whether the split view is collapsed.
        
        When collapsed, the children are put inside an `class@NavigationView`,
        otherwise they are displayed side by side.
        
        The `property@NavigationSplitView:show-content` controls which child is
        visible while collapsed.
  */
  @property void collapsed(bool propval)
  {
    return setCollapsed(propval);
  }

  /**
      Get `content` property.
      Returns: The content widget.
  */
  @property adw.navigation_page.NavigationPage content()
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
  */
  @property void content(adw.navigation_page.NavigationPage propval)
  {
    return setContent(propval);
  }

  /**
      Get `maxSidebarWidth` property.
      Returns: The maximum sidebar width.
      
      Maximum width is affected by
      `property@NavigationSplitView:sidebar-width-unit`.
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  */
  @property double maxSidebarWidth()
  {
    return getMaxSidebarWidth();
  }

  /**
      Set `maxSidebarWidth` property.
      Params:
        propval = The maximum sidebar width.
        
        Maximum width is affected by
        `property@NavigationSplitView:sidebar-width-unit`.
        
        The sidebar widget can still be allocated with larger width if its own
        minimum width exceeds it.
  */
  @property void maxSidebarWidth(double propval)
  {
    return setMaxSidebarWidth(propval);
  }

  /**
      Get `minSidebarWidth` property.
      Returns: The minimum sidebar width.
      
      Minimum width is affected by
      `property@NavigationSplitView:sidebar-width-unit`.
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  */
  @property double minSidebarWidth()
  {
    return getMinSidebarWidth();
  }

  /**
      Set `minSidebarWidth` property.
      Params:
        propval = The minimum sidebar width.
        
        Minimum width is affected by
        `property@NavigationSplitView:sidebar-width-unit`.
        
        The sidebar widget can still be allocated with larger width if its own
        minimum width exceeds it.
  */
  @property void minSidebarWidth(double propval)
  {
    return setMinSidebarWidth(propval);
  }

  /**
      Get `showContent` property.
      Returns: Determines the visible page when collapsed.
      
      If set to `TRUE`, the content widget will be the visible page when
      `property@NavigationSplitView:collapsed` is `TRUE`; otherwise the sidebar
      widget will be visible.
      
      If the split view is already collapsed, the visible page changes
      immediately.
  */
  @property bool showContent()
  {
    return getShowContent();
  }

  /**
      Set `showContent` property.
      Params:
        propval = Determines the visible page when collapsed.
        
        If set to `TRUE`, the content widget will be the visible page when
        `property@NavigationSplitView:collapsed` is `TRUE`; otherwise the sidebar
        widget will be visible.
        
        If the split view is already collapsed, the visible page changes
        immediately.
  */
  @property void showContent(bool propval)
  {
    return setShowContent(propval);
  }

  /**
      Get `sidebar` property.
      Returns: The sidebar widget.
  */
  @property adw.navigation_page.NavigationPage sidebar()
  {
    return getSidebar();
  }

  /**
      Set `sidebar` property.
      Params:
        propval = The sidebar widget.
  */
  @property void sidebar(adw.navigation_page.NavigationPage propval)
  {
    return setSidebar(propval);
  }

  /**
      Get `sidebarWidthFraction` property.
      Returns: The preferred sidebar width as a fraction of the total width.
      
      The preferred width is additionally limited by
      `property@NavigationSplitView:min-sidebar-width` and
      `property@NavigationSplitView:max-sidebar-width`.
      
      The sidebar widget can be allocated with larger width if its own minimum
      width exceeds the preferred width.
  */
  @property double sidebarWidthFraction()
  {
    return getSidebarWidthFraction();
  }

  /**
      Set `sidebarWidthFraction` property.
      Params:
        propval = The preferred sidebar width as a fraction of the total width.
        
        The preferred width is additionally limited by
        `property@NavigationSplitView:min-sidebar-width` and
        `property@NavigationSplitView:max-sidebar-width`.
        
        The sidebar widget can be allocated with larger width if its own minimum
        width exceeds the preferred width.
  */
  @property void sidebarWidthFraction(double propval)
  {
    return setSidebarWidthFraction(propval);
  }

  /**
      Get `sidebarWidthUnit` property.
      Returns: The length unit for minimum and maximum sidebar widths.
      
      See `property@NavigationSplitView:min-sidebar-width` and
      `property@NavigationSplitView:max-sidebar-width`.
  */
  @property adw.types.LengthUnit sidebarWidthUnit()
  {
    return getSidebarWidthUnit();
  }

  /**
      Set `sidebarWidthUnit` property.
      Params:
        propval = The length unit for minimum and maximum sidebar widths.
        
        See `property@NavigationSplitView:min-sidebar-width` and
        `property@NavigationSplitView:max-sidebar-width`.
  */
  @property void sidebarWidthUnit(adw.types.LengthUnit propval)
  {
    return setSidebarWidthUnit(propval);
  }

  /**
      Creates a new [adw.navigation_split_view.NavigationSplitView].
      Returns: the newly created [adw.navigation_split_view.NavigationSplitView]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_navigation_split_view_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether self is collapsed.
      Returns: whether self is collapsed
  */
  bool getCollapsed()
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_split_view_get_collapsed(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Sets the content widget for self.
      Returns: the content widget
  */
  adw.navigation_page.NavigationPage getContent()
  {
    AdwNavigationPage* _cretval;
    _cretval = adw_navigation_split_view_get_content(cast(AdwNavigationSplitView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.navigation_page.NavigationPage)(cast(AdwNavigationPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the maximum sidebar width for self.
      Returns: the maximum width
  */
  double getMaxSidebarWidth()
  {
    double _retval;
    _retval = adw_navigation_split_view_get_max_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimum sidebar width for self.
      Returns: the minimum width
  */
  double getMinSidebarWidth()
  {
    double _retval;
    _retval = adw_navigation_split_view_get_min_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets which page is visible when self is collapsed.
      Returns: whether to show content when collapsed
  */
  bool getShowContent()
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_split_view_get_show_content(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the sidebar widget for self.
      Returns: the sidebar widget
  */
  adw.navigation_page.NavigationPage getSidebar()
  {
    AdwNavigationPage* _cretval;
    _cretval = adw_navigation_split_view_get_sidebar(cast(AdwNavigationSplitView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.navigation_page.NavigationPage)(cast(AdwNavigationPage*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the preferred sidebar width fraction for self.
      Returns: the preferred width fraction
  */
  double getSidebarWidthFraction()
  {
    double _retval;
    _retval = adw_navigation_split_view_get_sidebar_width_fraction(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for minimum and maximum sidebar widths.
      Returns: the length unit
  */
  adw.types.LengthUnit getSidebarWidthUnit()
  {
    AdwLengthUnit _cretval;
    _cretval = adw_navigation_split_view_get_sidebar_width_unit(cast(AdwNavigationSplitView*)this._cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets whether self is collapsed.
      
      When collapsed, the children are put inside an `classNavigationView`,
      otherwise they are displayed side by side.
      
      The `propertyNavigationSplitView:show-content` controls which child is
      visible while collapsed.
  
      Params:
        collapsed = whether self is collapsed
  */
  void setCollapsed(bool collapsed)
  {
    adw_navigation_split_view_set_collapsed(cast(AdwNavigationSplitView*)this._cPtr, collapsed);
  }

  /**
      Sets the content widget for self.
  
      Params:
        content = the content widget
  */
  void setContent(adw.navigation_page.NavigationPage content = null)
  {
    adw_navigation_split_view_set_content(cast(AdwNavigationSplitView*)this._cPtr, content ? cast(AdwNavigationPage*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets the maximum sidebar width for self.
      
      Maximum width is affected by
      `propertyNavigationSplitView:sidebar-width-unit`.
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the maximum width
  */
  void setMaxSidebarWidth(double width)
  {
    adw_navigation_split_view_set_max_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr, width);
  }

  /**
      Sets the minimum sidebar width for self.
      
      Minimum width is affected by
      `propertyNavigationSplitView:sidebar-width-unit`.
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the minimum width
  */
  void setMinSidebarWidth(double width)
  {
    adw_navigation_split_view_set_min_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr, width);
  }

  /**
      Sets which page is visible when self is collapsed.
      
      If set to `TRUE`, the content widget will be the visible page when
      `propertyNavigationSplitView:collapsed` is `TRUE`; otherwise the sidebar
      widget will be visible.
      
      If the split view is already collapsed, the visible page changes immediately.
  
      Params:
        showContent = whether to show content when collapsed
  */
  void setShowContent(bool showContent)
  {
    adw_navigation_split_view_set_show_content(cast(AdwNavigationSplitView*)this._cPtr, showContent);
  }

  /**
      Sets the sidebar widget for self.
  
      Params:
        sidebar = the sidebar widget
  */
  void setSidebar(adw.navigation_page.NavigationPage sidebar = null)
  {
    adw_navigation_split_view_set_sidebar(cast(AdwNavigationSplitView*)this._cPtr, sidebar ? cast(AdwNavigationPage*)sidebar._cPtr(No.Dup) : null);
  }

  /**
      Sets the preferred sidebar width as a fraction of the total width of self.
      
      The preferred width is additionally limited by
      `propertyNavigationSplitView:min-sidebar-width` and
      `propertyNavigationSplitView:max-sidebar-width`.
      
      The sidebar widget can be allocated with larger width if its own minimum
      width exceeds the preferred width.
  
      Params:
        fraction = the preferred width fraction
  */
  void setSidebarWidthFraction(double fraction)
  {
    adw_navigation_split_view_set_sidebar_width_fraction(cast(AdwNavigationSplitView*)this._cPtr, fraction);
  }

  /**
      Sets the length unit for minimum and maximum sidebar widths.
      
      See `propertyNavigationSplitView:min-sidebar-width` and
      `propertyNavigationSplitView:max-sidebar-width`.
  
      Params:
        unit = the length unit
  */
  void setSidebarWidthUnit(adw.types.LengthUnit unit)
  {
    adw_navigation_split_view_set_sidebar_width_unit(cast(AdwNavigationSplitView*)this._cPtr, unit);
  }
}
