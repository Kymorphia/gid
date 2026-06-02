/// Module for [NavigationSplitView] class
module adw.navigation_split_view;

public import gid.basictypes;
import adw.c.functions;
import adw.c.types;
import adw.navigation_page;
import adw.types;
import gid.gid;
import gobject.gid_builder;
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
    
    [adw.navigation_split_view.NavigationSplitView] has two [adw.navigation_page.NavigationPage] children: sidebar and
    content, and displays them side by side.
    
    When [adw.navigation_split_view.NavigationSplitView.collapsed] is set to `TRUE`, it instead
    puts both children inside an [adw.navigation_view.NavigationView]. The
    [adw.navigation_split_view.NavigationSplitView.showContent] controls which child is visible
    while collapsed.
    
    See also [adw.overlay_split_view.OverlaySplitView].
    
    [adw.navigation_split_view.NavigationSplitView] is typically used together with an [adw.breakpoint.Breakpoint]
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
    with the [adw.navigation_split_view.NavigationSplitView.sidebarWidthFraction] property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
    [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth] properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    ## Header Bar Integration
    
    When used inside [adw.navigation_split_view.NavigationSplitView], [adw.header_bar.HeaderBar] will
    automatically hide the window buttons in the middle.
    
    When collapsed, it also displays a back button for the content widget, as
    well as the page titles. See [adw.navigation_view.NavigationView] documentation for details.
    
    ## Actions
    
    [adw.navigation_split_view.NavigationSplitView] defines the same actions as [adw.navigation_view.NavigationView], but
    they can be used even when the split view is not collapsed:
    
    - `navigation.push` takes a string parameter specifying the tag of the page
    to push. If it matches the tag of the content widget, it sets
    [adw.navigation_split_view.NavigationSplitView.showContent] to `TRUE`.
    
    - `navigation.pop` doesn't take any parameters and sets
    [adw.navigation_split_view.NavigationSplitView.showContent] to `FALSE`.
    
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())adw_navigation_split_view_get_type != &gidSymbolNotFound ? adw_navigation_split_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NavigationSplitView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [adw.navigation_split_view.NavigationSplitView]
      Returns: New builder object
  */
  static NavigationSplitViewGidBuilder builder() nothrow
  {
    return new NavigationSplitViewGidBuilder;
  }

  /**
      Get `collapsed` property.
      Returns: Whether the split view is collapsed.
        
        When collapsed, the children are put inside an [adw.navigation_view.NavigationView],
        otherwise they are displayed side by side.
        
        The [adw.navigation_split_view.NavigationSplitView.showContent] controls which child is
        visible while collapsed.
  */
  @property bool collapsed() nothrow
  {
    return getCollapsed();
  }

  /**
      Set `collapsed` property.
      Params:
        propval = Whether the split view is collapsed.
          
          When collapsed, the children are put inside an [adw.navigation_view.NavigationView],
          otherwise they are displayed side by side.
          
          The [adw.navigation_split_view.NavigationSplitView.showContent] controls which child is
          visible while collapsed.
  */
  @property void collapsed(bool propval) nothrow
  {
    setCollapsed(propval);
  }

  /**
      Get `content` property.
      Returns: The content widget.
  */
  @property adw.navigation_page.NavigationPage content() nothrow
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
  */
  @property void content(adw.navigation_page.NavigationPage propval) nothrow
  {
    setContent(propval);
  }

  /**
      Get `maxSidebarWidth` property.
      Returns: The maximum sidebar width.
        
        Maximum width is affected by
        [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
        
        The sidebar widget can still be allocated with larger width if its own
        minimum width exceeds it.
  */
  @property double maxSidebarWidth() nothrow
  {
    return getMaxSidebarWidth();
  }

  /**
      Set `maxSidebarWidth` property.
      Params:
        propval = The maximum sidebar width.
          
          Maximum width is affected by
          [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
          
          The sidebar widget can still be allocated with larger width if its own
          minimum width exceeds it.
  */
  @property void maxSidebarWidth(double propval) nothrow
  {
    setMaxSidebarWidth(propval);
  }

  /**
      Get `minSidebarWidth` property.
      Returns: The minimum sidebar width.
        
        Minimum width is affected by
        [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
        
        The sidebar widget can still be allocated with larger width if its own
        minimum width exceeds it.
  */
  @property double minSidebarWidth() nothrow
  {
    return getMinSidebarWidth();
  }

  /**
      Set `minSidebarWidth` property.
      Params:
        propval = The minimum sidebar width.
          
          Minimum width is affected by
          [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
          
          The sidebar widget can still be allocated with larger width if its own
          minimum width exceeds it.
  */
  @property void minSidebarWidth(double propval) nothrow
  {
    setMinSidebarWidth(propval);
  }

  /**
      Get `showContent` property.
      Returns: Determines the visible page when collapsed.
        
        If set to `TRUE`, the content widget will be the visible page when
        [adw.navigation_split_view.NavigationSplitView.collapsed] is `TRUE`; otherwise the sidebar
        widget will be visible.
        
        If the split view is already collapsed, the visible page changes
        immediately.
  */
  @property bool showContent() nothrow
  {
    return getShowContent();
  }

  /**
      Set `showContent` property.
      Params:
        propval = Determines the visible page when collapsed.
          
          If set to `TRUE`, the content widget will be the visible page when
          [adw.navigation_split_view.NavigationSplitView.collapsed] is `TRUE`; otherwise the sidebar
          widget will be visible.
          
          If the split view is already collapsed, the visible page changes
          immediately.
  */
  @property void showContent(bool propval) nothrow
  {
    setShowContent(propval);
  }

  /**
      Get `sidebar` property.
      Returns: The sidebar widget.
  */
  @property adw.navigation_page.NavigationPage sidebar() nothrow
  {
    return getSidebar();
  }

  /**
      Set `sidebar` property.
      Params:
        propval = The sidebar widget.
  */
  @property void sidebar(adw.navigation_page.NavigationPage propval) nothrow
  {
    setSidebar(propval);
  }

  /**
      Get `sidebarWidthFraction` property.
      Returns: The preferred sidebar width as a fraction of the total width.
        
        The preferred width is additionally limited by
        [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
        [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
        
        The sidebar widget can be allocated with larger width if its own minimum
        width exceeds the preferred width.
  */
  @property double sidebarWidthFraction() nothrow
  {
    return getSidebarWidthFraction();
  }

  /**
      Set `sidebarWidthFraction` property.
      Params:
        propval = The preferred sidebar width as a fraction of the total width.
          
          The preferred width is additionally limited by
          [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
          [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
          
          The sidebar widget can be allocated with larger width if its own minimum
          width exceeds the preferred width.
  */
  @property void sidebarWidthFraction(double propval) nothrow
  {
    setSidebarWidthFraction(propval);
  }

  /**
      Get `sidebarWidthUnit` property.
      Returns: The length unit for minimum and maximum sidebar widths.
        
        See [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
        [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
  */
  @property adw.types.LengthUnit sidebarWidthUnit() nothrow
  {
    return getSidebarWidthUnit();
  }

  /**
      Set `sidebarWidthUnit` property.
      Params:
        propval = The length unit for minimum and maximum sidebar widths.
          
          See [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
          [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
  */
  @property void sidebarWidthUnit(adw.types.LengthUnit propval) nothrow
  {
    setSidebarWidthUnit(propval);
  }

  /**
      Creates a new [adw.navigation_split_view.NavigationSplitView].
      Returns: the newly created [adw.navigation_split_view.NavigationSplitView]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_navigation_split_view_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether self is collapsed.
      Returns: whether self is collapsed
  */
  bool getCollapsed() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_split_view_get_collapsed(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Sets the content widget for self.
      Returns: the content widget
  */
  adw.navigation_page.NavigationPage getContent() nothrow
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
  double getMaxSidebarWidth() nothrow
  {
    double _retval;
    _retval = adw_navigation_split_view_get_max_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimum sidebar width for self.
      Returns: the minimum width
  */
  double getMinSidebarWidth() nothrow
  {
    double _retval;
    _retval = adw_navigation_split_view_get_min_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets which page is visible when self is collapsed.
      Returns: whether to show content when collapsed
  */
  bool getShowContent() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_navigation_split_view_get_show_content(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the sidebar widget for self.
      Returns: the sidebar widget
  */
  adw.navigation_page.NavigationPage getSidebar() nothrow
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
  double getSidebarWidthFraction() nothrow
  {
    double _retval;
    _retval = adw_navigation_split_view_get_sidebar_width_fraction(cast(AdwNavigationSplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for minimum and maximum sidebar widths.
      Returns: the length unit
  */
  adw.types.LengthUnit getSidebarWidthUnit() nothrow
  {
    AdwLengthUnit _cretval;
    _cretval = adw_navigation_split_view_get_sidebar_width_unit(cast(AdwNavigationSplitView*)this._cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets whether self is collapsed.
      
      When collapsed, the children are put inside an [adw.navigation_view.NavigationView],
      otherwise they are displayed side by side.
      
      The [adw.navigation_split_view.NavigationSplitView.showContent] controls which child is
      visible while collapsed.
  
      Params:
        collapsed = whether self is collapsed
  */
  void setCollapsed(bool collapsed) nothrow
  {
    adw_navigation_split_view_set_collapsed(cast(AdwNavigationSplitView*)this._cPtr, collapsed);
  }

  /**
      Sets the content widget for self.
  
      Params:
        content = the content widget
  */
  void setContent(adw.navigation_page.NavigationPage content = null) nothrow
  {
    adw_navigation_split_view_set_content(cast(AdwNavigationSplitView*)this._cPtr, content ? cast(AdwNavigationPage*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets the maximum sidebar width for self.
      
      Maximum width is affected by
      [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the maximum width
  */
  void setMaxSidebarWidth(double width) nothrow
  {
    adw_navigation_split_view_set_max_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr, width);
  }

  /**
      Sets the minimum sidebar width for self.
      
      Minimum width is affected by
      [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the minimum width
  */
  void setMinSidebarWidth(double width) nothrow
  {
    adw_navigation_split_view_set_min_sidebar_width(cast(AdwNavigationSplitView*)this._cPtr, width);
  }

  /**
      Sets which page is visible when self is collapsed.
      
      If set to `TRUE`, the content widget will be the visible page when
      [adw.navigation_split_view.NavigationSplitView.collapsed] is `TRUE`; otherwise the sidebar
      widget will be visible.
      
      If the split view is already collapsed, the visible page changes immediately.
  
      Params:
        showContent = whether to show content when collapsed
  */
  void setShowContent(bool showContent) nothrow
  {
    adw_navigation_split_view_set_show_content(cast(AdwNavigationSplitView*)this._cPtr, showContent);
  }

  /**
      Sets the sidebar widget for self.
  
      Params:
        sidebar = the sidebar widget
  */
  void setSidebar(adw.navigation_page.NavigationPage sidebar = null) nothrow
  {
    adw_navigation_split_view_set_sidebar(cast(AdwNavigationSplitView*)this._cPtr, sidebar ? cast(AdwNavigationPage*)sidebar._cPtr(No.Dup) : null);
  }

  /**
      Sets the preferred sidebar width as a fraction of the total width of self.
      
      The preferred width is additionally limited by
      [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
      [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
      
      The sidebar widget can be allocated with larger width if its own minimum
      width exceeds the preferred width.
  
      Params:
        fraction = the preferred width fraction
  */
  void setSidebarWidthFraction(double fraction) nothrow
  {
    adw_navigation_split_view_set_sidebar_width_fraction(cast(AdwNavigationSplitView*)this._cPtr, fraction);
  }

  /**
      Sets the length unit for minimum and maximum sidebar widths.
      
      See [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
      [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
  
      Params:
        unit = the length unit
  */
  void setSidebarWidthUnit(adw.types.LengthUnit unit) nothrow
  {
    adw_navigation_split_view_set_sidebar_width_unit(cast(AdwNavigationSplitView*)this._cPtr, unit);
  }
}

/// Fluent builder implementation template for [adw.navigation_split_view.NavigationSplitView]
class NavigationSplitViewGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `collapsed` property.
      Params:
        propval = Whether the split view is collapsed.
          
          When collapsed, the children are put inside an [adw.navigation_view.NavigationView],
          otherwise they are displayed side by side.
          
          The [adw.navigation_split_view.NavigationSplitView.showContent] controls which child is
          visible while collapsed.
      Returns: Builder instance for fluent chaining
  */
  T collapsed(bool propval) nothrow
  {
    return setProperty("collapsed", propval);
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
      Returns: Builder instance for fluent chaining
  */
  T content(adw.navigation_page.NavigationPage propval) nothrow
  {
    return setProperty("content", propval);
  }

  /**
      Set `maxSidebarWidth` property.
      Params:
        propval = The maximum sidebar width.
          
          Maximum width is affected by
          [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
          
          The sidebar widget can still be allocated with larger width if its own
          minimum width exceeds it.
      Returns: Builder instance for fluent chaining
  */
  T maxSidebarWidth(double propval) nothrow
  {
    return setProperty("max-sidebar-width", propval);
  }

  /**
      Set `minSidebarWidth` property.
      Params:
        propval = The minimum sidebar width.
          
          Minimum width is affected by
          [adw.navigation_split_view.NavigationSplitView.sidebarWidthUnit].
          
          The sidebar widget can still be allocated with larger width if its own
          minimum width exceeds it.
      Returns: Builder instance for fluent chaining
  */
  T minSidebarWidth(double propval) nothrow
  {
    return setProperty("min-sidebar-width", propval);
  }

  /**
      Set `showContent` property.
      Params:
        propval = Determines the visible page when collapsed.
          
          If set to `TRUE`, the content widget will be the visible page when
          [adw.navigation_split_view.NavigationSplitView.collapsed] is `TRUE`; otherwise the sidebar
          widget will be visible.
          
          If the split view is already collapsed, the visible page changes
          immediately.
      Returns: Builder instance for fluent chaining
  */
  T showContent(bool propval) nothrow
  {
    return setProperty("show-content", propval);
  }

  /**
      Set `sidebar` property.
      Params:
        propval = The sidebar widget.
      Returns: Builder instance for fluent chaining
  */
  T sidebar(adw.navigation_page.NavigationPage propval) nothrow
  {
    return setProperty("sidebar", propval);
  }

  /**
      Set `sidebarWidthFraction` property.
      Params:
        propval = The preferred sidebar width as a fraction of the total width.
          
          The preferred width is additionally limited by
          [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
          [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
          
          The sidebar widget can be allocated with larger width if its own minimum
          width exceeds the preferred width.
      Returns: Builder instance for fluent chaining
  */
  T sidebarWidthFraction(double propval) nothrow
  {
    return setProperty("sidebar-width-fraction", propval);
  }

  /**
      Set `sidebarWidthUnit` property.
      Params:
        propval = The length unit for minimum and maximum sidebar widths.
          
          See [adw.navigation_split_view.NavigationSplitView.minSidebarWidth] and
          [adw.navigation_split_view.NavigationSplitView.maxSidebarWidth].
      Returns: Builder instance for fluent chaining
  */
  T sidebarWidthUnit(adw.types.LengthUnit propval) nothrow
  {
    return setProperty("sidebar-width-unit", propval);
  }
}

/// Fluent builder for [adw.navigation_split_view.NavigationSplitView]
final class NavigationSplitViewGidBuilder : NavigationSplitViewGidBuilderImpl!NavigationSplitViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  NavigationSplitView build() nothrow
  {
    return new NavigationSplitView(cast(void*)createGObject(NavigationSplitView._getGType), No.Take);
  }
}
