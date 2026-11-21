/// Module for [OverlaySplitView] class
module gid.adw1.overlay_split_view;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.swipeable;
import gid.adw1.swipeable_mixin;
import gid.adw1.types;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    A widget presenting sidebar and content side by side or as an overlay.
    
    <picture>
      <source srcset="overlay-split-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="overlay-split-view.png" alt="overlay-split-view">
    </picture>
    <picture>
      <source srcset="overlay-split-view-collapsed-dark.png" media="(prefers-color-scheme: dark)">
      <img src="overlay-split-view-collapsed.png" alt="overlay-split-view-collapsed">
    </picture>
    
    [gid.adw1.overlay_split_view.OverlaySplitView] has two children: sidebar and content, and displays
    them side by side.
    
    When [gid.adw1.overlay_split_view.OverlaySplitView.collapsed] is set to `TRUE`, the sidebar is
    instead shown as an overlay above the content widget.
    
    The sidebar can be hidden or shown using the
    [gid.adw1.overlay_split_view.OverlaySplitView.showSidebar] property.
    
    Sidebar can be displayed before or after the content, this can be controlled
    with the [gid.adw1.overlay_split_view.OverlaySplitView.sidebarPosition] property.
    
    Collapsing the split view automatically hides the sidebar widget, and
    uncollapsing it shows the sidebar. If this behavior is not desired, the
    [gid.adw1.overlay_split_view.OverlaySplitView.pinSidebar] property can be used to override it.
    
    [gid.adw1.overlay_split_view.OverlaySplitView] supports an edge swipe gesture for showing the sidebar,
    and a swipe from the sidebar for hiding it. Gestures are only supported on
    touchscreen, but not touchpad. Gestures can be controlled with the
    [gid.adw1.overlay_split_view.OverlaySplitView.enableShowGesture] and
    [gid.adw1.overlay_split_view.OverlaySplitView.enableHideGesture] properties.
    
    See also [gid.adw1.navigation_split_view.NavigationSplitView].
    
    [gid.adw1.overlay_split_view.OverlaySplitView] is typically used together with an [gid.adw1.breakpoint.Breakpoint]
    setting the `collapsed` property to `TRUE` on small widths, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="default-width">800</property>
      <property name="default-height">800</property>
      <child>
        <object class="AdwBreakpoint">
          <condition>max-width: 400sp</condition>
          <setter object="split_view" property="collapsed">True</setter>
        </object>
      </child>
      <property name="content">
        <object class="AdwOverlaySplitView" id="split_view">
          <property name="sidebar">
            <!-- ... -->
          </property>
          <property name="content">
            <!-- ... -->
          </property>
        </object>
      </property>
    </object>
    ```
    
    [gid.adw1.overlay_split_view.OverlaySplitView] is often used for implementing the
    [utility pane](https://developer.gnome.org/hig/patterns/containers/utility-panes.html)
    pattern.
    
    ## Sizing
    
    When not collapsed, [gid.adw1.overlay_split_view.OverlaySplitView] changes the sidebar width
    depending on its own width.
    
    If possible, it tries to allocate a fraction of the total width, controlled
    with the [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthFraction] property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
    [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth] properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    When collapsed, the preferred width fraction is ignored and the sidebar uses
    [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth] when possible.
    
    ## Header Bar Integration
    
    When used inside [gid.adw1.overlay_split_view.OverlaySplitView], [gid.adw1.header_bar.HeaderBar] will automatically
    hide the window buttons in the middle.
    
    ## [gid.adw1.overlay_split_view.OverlaySplitView] as [gid.gtk4.buildable.Buildable]
    
    The [gid.adw1.overlay_split_view.OverlaySplitView] implementation of the [gid.gtk4.buildable.Buildable]
    interface supports setting the sidebar widget by specifying “sidebar” as the
    “type” attribute of a `<child>` element, Specifying “content” child type or
    omitting it results in setting the content widget.
    
    ## CSS nodes
    
    [gid.adw1.overlay_split_view.OverlaySplitView] has a single CSS node with the name
    `overlay-split-view`.
    
    It contains two nodes with the name `widget`, containing the sidebar and
    content children.
    
    When not collapsed, they have the `.sidebar-view` and `.content-view` style
    classes respectively.
    
    ```
    overlay-split-view
    ├── widget.sidebar-pane
    │   ╰── [sidebar child]
    ╰── widget.content-pane
        ╰── [content child]
    ```
    
    When collapsed, the one containing the sidebar child has the `.background`
    style class and the other one has no style classes.
    
    ```
    overlay-split-view
    ├── widget.background
    │   ╰── [sidebar child]
    ╰── widget
        ╰── [content child]
    ```
    
    ## Accessibility
    
    [gid.adw1.overlay_split_view.OverlaySplitView] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
class OverlaySplitView : gid.gtk4.widget.Widget, gid.adw1.swipeable.Swipeable
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
    return cast(void function())adw_overlay_split_view_get_type != &gidSymbolNotFound ? adw_overlay_split_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwOverlaySplitView";
  }

  /** Returns `this`, for use in `with` statements. */
  override OverlaySplitView self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.overlay_split_view.OverlaySplitView]
      Returns: New builder object
  */
  static OverlaySplitViewGidBuilder builder() nothrow
  {
    return new OverlaySplitViewGidBuilder;
  }

  /**
      Get `collapsed` property.
      Returns: Whether the split view is collapsed.
        
        When collapsed, the sidebar widget is presented as an overlay above the
        content widget, otherwise they are displayed side by side.
  */
  @property bool collapsed() nothrow
  {
    return getCollapsed();
  }

  /**
      Set `collapsed` property.
      Params:
        propval = Whether the split view is collapsed.
          
          When collapsed, the sidebar widget is presented as an overlay above the
          content widget, otherwise they are displayed side by side.
  */
  @property void collapsed(bool propval) nothrow
  {
    setCollapsed(propval);
  }

  /**
      Get `content` property.
      Returns: The content widget.
  */
  @property gid.gtk4.widget.Widget content() nothrow
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
  */
  @property void content(gid.gtk4.widget.Widget propval) nothrow
  {
    setContent(propval);
  }

  /**
      Get `enableHideGesture` property.
      Returns: Whether the sidebar can be closed with a swipe gesture.
        
        Only touchscreen swipes are supported.
  */
  @property bool enableHideGesture() nothrow
  {
    return getEnableHideGesture();
  }

  /**
      Set `enableHideGesture` property.
      Params:
        propval = Whether the sidebar can be closed with a swipe gesture.
          
          Only touchscreen swipes are supported.
  */
  @property void enableHideGesture(bool propval) nothrow
  {
    setEnableHideGesture(propval);
  }

  /**
      Get `enableShowGesture` property.
      Returns: Whether the sidebar can be opened with an edge swipe gesture.
        
        Only touchscreen swipes are supported.
  */
  @property bool enableShowGesture() nothrow
  {
    return getEnableShowGesture();
  }

  /**
      Set `enableShowGesture` property.
      Params:
        propval = Whether the sidebar can be opened with an edge swipe gesture.
          
          Only touchscreen swipes are supported.
  */
  @property void enableShowGesture(bool propval) nothrow
  {
    setEnableShowGesture(propval);
  }

  /**
      Get `maxSidebarWidth` property.
      Returns: The maximum sidebar width.
        
        Maximum width is affected by
        [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
        
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
          [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
          
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
        [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
        
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
          [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
          
          The sidebar widget can still be allocated with larger width if its own
          minimum width exceeds it.
  */
  @property void minSidebarWidth(double propval) nothrow
  {
    setMinSidebarWidth(propval);
  }

  /**
      Get `pinSidebar` property.
      Returns: Whether the sidebar widget is pinned.
        
        By default, collapsing @self automatically hides the sidebar widget, and
        uncollapsing it shows the sidebar. If set to `TRUE`, sidebar visibility
        never changes on its own.
  */
  @property bool pinSidebar() nothrow
  {
    return getPinSidebar();
  }

  /**
      Set `pinSidebar` property.
      Params:
        propval = Whether the sidebar widget is pinned.
          
          By default, collapsing @self automatically hides the sidebar widget, and
          uncollapsing it shows the sidebar. If set to `TRUE`, sidebar visibility
          never changes on its own.
  */
  @property void pinSidebar(bool propval) nothrow
  {
    setPinSidebar(propval);
  }

  /**
      Get `showSidebar` property.
      Returns: Whether the sidebar widget is shown.
  */
  @property bool showSidebar() nothrow
  {
    return getShowSidebar();
  }

  /**
      Set `showSidebar` property.
      Params:
        propval = Whether the sidebar widget is shown.
  */
  @property void showSidebar(bool propval) nothrow
  {
    setShowSidebar(propval);
  }

  /**
      Get `sidebar` property.
      Returns: The sidebar widget.
  */
  @property gid.gtk4.widget.Widget sidebar() nothrow
  {
    return getSidebar();
  }

  /**
      Set `sidebar` property.
      Params:
        propval = The sidebar widget.
  */
  @property void sidebar(gid.gtk4.widget.Widget propval) nothrow
  {
    setSidebar(propval);
  }

  /**
      Get `sidebarPosition` property.
      Returns: The sidebar position.
        
        If it's set to [gid.gtk4.types.PackType.Start], the sidebar is displayed before
        the content; if [gid.gtk4.types.PackType.End], it's displayed after the content.
  */
  @property gid.gtk4.types.PackType sidebarPosition() nothrow
  {
    return getSidebarPosition();
  }

  /**
      Set `sidebarPosition` property.
      Params:
        propval = The sidebar position.
          
          If it's set to [gid.gtk4.types.PackType.Start], the sidebar is displayed before
          the content; if [gid.gtk4.types.PackType.End], it's displayed after the content.
  */
  @property void sidebarPosition(gid.gtk4.types.PackType propval) nothrow
  {
    setSidebarPosition(propval);
  }

  /**
      Get `sidebarWidthFraction` property.
      Returns: The preferred sidebar width as a fraction of the total width.
        
        The preferred width is additionally limited by
        [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
        [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
        
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
          [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
          [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
          
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
        
        See [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
        [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
  */
  @property gid.adw1.types.LengthUnit sidebarWidthUnit() nothrow
  {
    return getSidebarWidthUnit();
  }

  /**
      Set `sidebarWidthUnit` property.
      Params:
        propval = The length unit for minimum and maximum sidebar widths.
          
          See [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
          [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
  */
  @property void sidebarWidthUnit(gid.adw1.types.LengthUnit propval) nothrow
  {
    setSidebarWidthUnit(propval);
  }

  mixin SwipeableT!();

  /**
      Creates a new [gid.adw1.overlay_split_view.OverlaySplitView].
      Returns: the newly created [gid.adw1.overlay_split_view.OverlaySplitView]
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_overlay_split_view_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether self is collapsed.
      Returns: whether self is collapsed
  */
  bool getCollapsed() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_collapsed(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the content widget for self.
      Returns: the content widget for self
  */
  gid.gtk4.widget.Widget getContent() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_overlay_split_view_get_content(cast(AdwOverlaySplitView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self can be closed with a swipe gesture.
      Returns: `TRUE` if self can be closed with a swipe gesture
  */
  bool getEnableHideGesture() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_enable_hide_gesture(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self can be opened with an edge swipe gesture.
      Returns: `TRUE` if self can be opened with a swipe gesture
  */
  bool getEnableShowGesture() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_enable_show_gesture(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum sidebar width for self.
      Returns: the maximum width
  */
  double getMaxSidebarWidth() nothrow
  {
    double _retval;
    _retval = adw_overlay_split_view_get_max_sidebar_width(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimum sidebar width for self.
      Returns: the minimum width
  */
  double getMinSidebarWidth() nothrow
  {
    double _retval;
    _retval = adw_overlay_split_view_get_min_sidebar_width(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the sidebar widget is pinned for self.
      Returns: whether if the sidebar widget is pinned
  */
  bool getPinSidebar() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_pin_sidebar(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the sidebar widget is shown for self.
      Returns: `TRUE` if the sidebar widget is shown
  */
  bool getShowSidebar() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_show_sidebar(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the sidebar widget for self.
      Returns: the sidebar widget for self
  */
  gid.gtk4.widget.Widget getSidebar() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_overlay_split_view_get_sidebar(cast(AdwOverlaySplitView*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the sidebar position for self.
      Returns: the sidebar position for self
  */
  gid.gtk4.types.PackType getSidebarPosition() nothrow
  {
    GtkPackType _cretval;
    _cretval = adw_overlay_split_view_get_sidebar_position(cast(AdwOverlaySplitView*)this._cPtr);
    gid.gtk4.types.PackType _retval = cast(gid.gtk4.types.PackType)_cretval;
    return _retval;
  }

  /**
      Gets the preferred sidebar width fraction for self.
      Returns: the preferred width fraction
  */
  double getSidebarWidthFraction() nothrow
  {
    double _retval;
    _retval = adw_overlay_split_view_get_sidebar_width_fraction(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for minimum and maximum sidebar widths.
      Returns: the length unit
  */
  gid.adw1.types.LengthUnit getSidebarWidthUnit() nothrow
  {
    AdwLengthUnit _cretval;
    _cretval = adw_overlay_split_view_get_sidebar_width_unit(cast(AdwOverlaySplitView*)this._cPtr);
    gid.adw1.types.LengthUnit _retval = cast(gid.adw1.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets whether self view is collapsed.
      
      When collapsed, the sidebar widget is presented as an overlay above the
      content widget, otherwise they are displayed side by side.
  
      Params:
        collapsed = whether self is collapsed
  */
  void setCollapsed(bool collapsed) nothrow
  {
    adw_overlay_split_view_set_collapsed(cast(AdwOverlaySplitView*)this._cPtr, collapsed);
  }

  /**
      Sets the content widget for self.
  
      Params:
        content = the content widget
  */
  void setContent(gid.gtk4.widget.Widget content = null) nothrow
  {
    adw_overlay_split_view_set_content(cast(AdwOverlaySplitView*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets whether self can be closed with a swipe gesture.
      
      Only touchscreen swipes are supported.
  
      Params:
        enableHideGesture = whether self can be closed with a swipe gesture
  */
  void setEnableHideGesture(bool enableHideGesture) nothrow
  {
    adw_overlay_split_view_set_enable_hide_gesture(cast(AdwOverlaySplitView*)this._cPtr, enableHideGesture);
  }

  /**
      Sets whether self can be opened with an edge swipe gesture.
      
      Only touchscreen swipes are supported.
  
      Params:
        enableShowGesture = whether self can be opened with a swipe gesture
  */
  void setEnableShowGesture(bool enableShowGesture) nothrow
  {
    adw_overlay_split_view_set_enable_show_gesture(cast(AdwOverlaySplitView*)this._cPtr, enableShowGesture);
  }

  /**
      Sets the maximum sidebar width for self.
      
      Maximum width is affected by [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the maximum width
  */
  void setMaxSidebarWidth(double width) nothrow
  {
    adw_overlay_split_view_set_max_sidebar_width(cast(AdwOverlaySplitView*)this._cPtr, width);
  }

  /**
      Sets the minimum sidebar width for self.
      
      Minimum width is affected by [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the minimum width
  */
  void setMinSidebarWidth(double width) nothrow
  {
    adw_overlay_split_view_set_min_sidebar_width(cast(AdwOverlaySplitView*)this._cPtr, width);
  }

  /**
      Sets whether the sidebar widget is pinned for self.
      
      By default, collapsing self automatically hides the sidebar widget, and
      uncollapsing it shows the sidebar. If set to `TRUE`, sidebar visibility never
      changes on its own.
  
      Params:
        pinSidebar = whether to pin the sidebar widget
  */
  void setPinSidebar(bool pinSidebar) nothrow
  {
    adw_overlay_split_view_set_pin_sidebar(cast(AdwOverlaySplitView*)this._cPtr, pinSidebar);
  }

  /**
      Sets whether the sidebar widget is shown for self.
  
      Params:
        showSidebar = whether to show the sidebar widget
  */
  void setShowSidebar(bool showSidebar) nothrow
  {
    adw_overlay_split_view_set_show_sidebar(cast(AdwOverlaySplitView*)this._cPtr, showSidebar);
  }

  /**
      Sets the sidebar widget for self.
  
      Params:
        sidebar = the sidebar widget
  */
  void setSidebar(gid.gtk4.widget.Widget sidebar = null) nothrow
  {
    adw_overlay_split_view_set_sidebar(cast(AdwOverlaySplitView*)this._cPtr, sidebar ? cast(GtkWidget*)sidebar._cPtr(No.Dup) : null);
  }

  /**
      Sets the sidebar position for self.
      
      If it's set to [gid.gtk4.types.PackType.Start], the sidebar is displayed before the
      content; if [gid.gtk4.types.PackType.End], it's displayed after the content.
  
      Params:
        position = the new position
  */
  void setSidebarPosition(gid.gtk4.types.PackType position) nothrow
  {
    adw_overlay_split_view_set_sidebar_position(cast(AdwOverlaySplitView*)this._cPtr, position);
  }

  /**
      Sets the preferred sidebar width as a fraction of the total width of self.
      
      The preferred width is additionally limited by
      [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
      [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
      
      The sidebar widget can be allocated with larger width if its own minimum
      width exceeds the preferred width.
  
      Params:
        fraction = the preferred width fraction
  */
  void setSidebarWidthFraction(double fraction) nothrow
  {
    adw_overlay_split_view_set_sidebar_width_fraction(cast(AdwOverlaySplitView*)this._cPtr, fraction);
  }

  /**
      Sets the length unit for minimum and maximum sidebar widths.
      
      See [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
      [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
  
      Params:
        unit = the length unit
  */
  void setSidebarWidthUnit(gid.adw1.types.LengthUnit unit) nothrow
  {
    adw_overlay_split_view_set_sidebar_width_unit(cast(AdwOverlaySplitView*)this._cPtr, unit);
  }
}

/// Fluent builder implementation template for [gid.adw1.overlay_split_view.OverlaySplitView]
class OverlaySplitViewGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T, gid.adw1.swipeable.SwipeableGidBuilderImpl!T
{

  mixin SwipeableGidBuilderT!();

  /**
      Set `collapsed` property.
      Params:
        propval = Whether the split view is collapsed.
          
          When collapsed, the sidebar widget is presented as an overlay above the
          content widget, otherwise they are displayed side by side.
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
  T content(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("content", propval);
  }

  /**
      Set `enableHideGesture` property.
      Params:
        propval = Whether the sidebar can be closed with a swipe gesture.
          
          Only touchscreen swipes are supported.
      Returns: Builder instance for fluent chaining
  */
  T enableHideGesture(bool propval) nothrow
  {
    return setProperty("enable-hide-gesture", propval);
  }

  /**
      Set `enableShowGesture` property.
      Params:
        propval = Whether the sidebar can be opened with an edge swipe gesture.
          
          Only touchscreen swipes are supported.
      Returns: Builder instance for fluent chaining
  */
  T enableShowGesture(bool propval) nothrow
  {
    return setProperty("enable-show-gesture", propval);
  }

  /**
      Set `maxSidebarWidth` property.
      Params:
        propval = The maximum sidebar width.
          
          Maximum width is affected by
          [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
          
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
          [gid.adw1.overlay_split_view.OverlaySplitView.sidebarWidthUnit].
          
          The sidebar widget can still be allocated with larger width if its own
          minimum width exceeds it.
      Returns: Builder instance for fluent chaining
  */
  T minSidebarWidth(double propval) nothrow
  {
    return setProperty("min-sidebar-width", propval);
  }

  /**
      Set `pinSidebar` property.
      Params:
        propval = Whether the sidebar widget is pinned.
          
          By default, collapsing @self automatically hides the sidebar widget, and
          uncollapsing it shows the sidebar. If set to `TRUE`, sidebar visibility
          never changes on its own.
      Returns: Builder instance for fluent chaining
  */
  T pinSidebar(bool propval) nothrow
  {
    return setProperty("pin-sidebar", propval);
  }

  /**
      Set `showSidebar` property.
      Params:
        propval = Whether the sidebar widget is shown.
      Returns: Builder instance for fluent chaining
  */
  T showSidebar(bool propval) nothrow
  {
    return setProperty("show-sidebar", propval);
  }

  /**
      Set `sidebar` property.
      Params:
        propval = The sidebar widget.
      Returns: Builder instance for fluent chaining
  */
  T sidebar(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("sidebar", propval);
  }

  /**
      Set `sidebarPosition` property.
      Params:
        propval = The sidebar position.
          
          If it's set to [gid.gtk4.types.PackType.Start], the sidebar is displayed before
          the content; if [gid.gtk4.types.PackType.End], it's displayed after the content.
      Returns: Builder instance for fluent chaining
  */
  T sidebarPosition(gid.gtk4.types.PackType propval) nothrow
  {
    return setProperty("sidebar-position", propval);
  }

  /**
      Set `sidebarWidthFraction` property.
      Params:
        propval = The preferred sidebar width as a fraction of the total width.
          
          The preferred width is additionally limited by
          [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
          [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
          
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
          
          See [gid.adw1.overlay_split_view.OverlaySplitView.minSidebarWidth] and
          [gid.adw1.overlay_split_view.OverlaySplitView.maxSidebarWidth].
      Returns: Builder instance for fluent chaining
  */
  T sidebarWidthUnit(gid.adw1.types.LengthUnit propval) nothrow
  {
    return setProperty("sidebar-width-unit", propval);
  }
}

/// Fluent builder for [gid.adw1.overlay_split_view.OverlaySplitView]
final class OverlaySplitViewGidBuilder : OverlaySplitViewGidBuilderImpl!OverlaySplitViewGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  OverlaySplitView build() nothrow
  {
    return new OverlaySplitView(cast(void*)createGObject(OverlaySplitView._getGType), Yes.Take);
  }
}
