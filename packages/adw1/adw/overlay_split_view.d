/// Module for [OverlaySplitView] class
module adw.overlay_split_view;

import adw.c.functions;
import adw.c.types;
import adw.swipeable;
import adw.swipeable_mixin;
import adw.types;
import gid.gid;
import gobject.object;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

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
    
    [adw.overlay_split_view.OverlaySplitView] has two children: sidebar and content, and displays
    them side by side.
    
    When `property@OverlaySplitView:collapsed` is set to `TRUE`, the sidebar is
    instead shown as an overlay above the content widget.
    
    The sidebar can be hidden or shown using the
    `property@OverlaySplitView:show-sidebar` property.
    
    Sidebar can be displayed before or after the content, this can be controlled
    with the `property@OverlaySplitView:sidebar-position` property.
    
    Collapsing the split view automatically hides the sidebar widget, and
    uncollapsing it shows the sidebar. If this behavior is not desired, the
    `property@OverlaySplitView:pin-sidebar` property can be used to override it.
    
    [adw.overlay_split_view.OverlaySplitView] supports an edge swipe gesture for showing the sidebar,
    and a swipe from the sidebar for hiding it. Gestures are only supported on
    touchscreen, but not touchpad. Gestures can be controlled with the
    `property@OverlaySplitView:enable-show-gesture` and
    `property@OverlaySplitView:enable-hide-gesture` properties.
    
    See also `class@NavigationSplitView`.
    
    [adw.overlay_split_view.OverlaySplitView] is typically used together with an `class@Breakpoint`
    setting the `collapsed` property to `TRUE` on small widths, as follows:
    
    ```xml
    <object class="AdwWindow">
      <property name="width-request">360</property>
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
    
    [adw.overlay_split_view.OverlaySplitView] is often used for implementing the
    [utility pane](https://developer.gnome.org/hig/patterns/containers/utility-panes.html)
    pattern.
    
    ## Sizing
    
    When not collapsed, [adw.overlay_split_view.OverlaySplitView] changes the sidebar width
    depending on its own width.
    
    If possible, it tries to allocate a fraction of the total width, controlled
    with the `property@OverlaySplitView:sidebar-width-fraction` property.
    
    The sidebar also has minimum and maximum sizes, controlled with the
    `property@OverlaySplitView:min-sidebar-width` and
    `property@OverlaySplitView:max-sidebar-width` properties.
    
    The minimum and maximum sizes are using the length unit specified with the
    `property@OverlaySplitView:sidebar-width-unit`.
    
    By default, sidebar is using 25% of the total width, with 180sp as the
    minimum size and 280sp as the maximum size.
    
    When collapsed, the preferred width fraction is ignored and the sidebar uses
    `property@OverlaySplitView:max-sidebar-width` when possible.
    
    ## Header Bar Integration
    
    When used inside [adw.overlay_split_view.OverlaySplitView], `class@HeaderBar` will automatically
    hide the window buttons in the middle.
    
    ## [adw.overlay_split_view.OverlaySplitView] as [gtk.buildable.Buildable]
    
    The [adw.overlay_split_view.OverlaySplitView] implementation of the [gtk.buildable.Buildable]
    interface supports setting the sidebar widget by specifying “sidebar” as the
    “type” attribute of a `<child>` element, Specifying “content” child type or
    omitting it results in setting the content widget.
    
    ## CSS nodes
    
    [adw.overlay_split_view.OverlaySplitView] has a single CSS node with the name
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
    
    [adw.overlay_split_view.OverlaySplitView] uses the [gtk.types.AccessibleRole.Group] role.
*/
class OverlaySplitView : gtk.widget.Widget, adw.swipeable.Swipeable
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
    return cast(void function())adw_overlay_split_view_get_type != &gidSymbolNotFound ? adw_overlay_split_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override OverlaySplitView self()
  {
    return this;
  }

  /**
      Get `collapsed` property.
      Returns: Whether the split view is collapsed.
      
      When collapsed, the sidebar widget is presented as an overlay above the
      content widget, otherwise they are displayed side by side.
  */
  @property bool collapsed()
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
  @property void collapsed(bool propval)
  {
    return setCollapsed(propval);
  }

  /**
      Get `content` property.
      Returns: The content widget.
  */
  @property gtk.widget.Widget content()
  {
    return getContent();
  }

  /**
      Set `content` property.
      Params:
        propval = The content widget.
  */
  @property void content(gtk.widget.Widget propval)
  {
    return setContent(propval);
  }

  /**
      Get `enableHideGesture` property.
      Returns: Whether the sidebar can be closed with a swipe gesture.
      
      Only touchscreen swipes are supported.
  */
  @property bool enableHideGesture()
  {
    return getEnableHideGesture();
  }

  /**
      Set `enableHideGesture` property.
      Params:
        propval = Whether the sidebar can be closed with a swipe gesture.
        
        Only touchscreen swipes are supported.
  */
  @property void enableHideGesture(bool propval)
  {
    return setEnableHideGesture(propval);
  }

  /**
      Get `enableShowGesture` property.
      Returns: Whether the sidebar can be opened with an edge swipe gesture.
      
      Only touchscreen swipes are supported.
  */
  @property bool enableShowGesture()
  {
    return getEnableShowGesture();
  }

  /**
      Set `enableShowGesture` property.
      Params:
        propval = Whether the sidebar can be opened with an edge swipe gesture.
        
        Only touchscreen swipes are supported.
  */
  @property void enableShowGesture(bool propval)
  {
    return setEnableShowGesture(propval);
  }

  /**
      Get `maxSidebarWidth` property.
      Returns: The maximum sidebar width.
      
      Maximum width is affected by
      `property@OverlaySplitView:sidebar-width-unit`.
      
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
        `property@OverlaySplitView:sidebar-width-unit`.
        
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
      `property@OverlaySplitView:sidebar-width-unit`.
      
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
        `property@OverlaySplitView:sidebar-width-unit`.
        
        The sidebar widget can still be allocated with larger width if its own
        minimum width exceeds it.
  */
  @property void minSidebarWidth(double propval)
  {
    return setMinSidebarWidth(propval);
  }

  /**
      Get `pinSidebar` property.
      Returns: Whether the sidebar widget is pinned.
      
      By default, collapsing @self automatically hides the sidebar widget, and
      uncollapsing it shows the sidebar. If set to `TRUE`, sidebar visibility
      never changes on its own.
  */
  @property bool pinSidebar()
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
  @property void pinSidebar(bool propval)
  {
    return setPinSidebar(propval);
  }

  /**
      Get `showSidebar` property.
      Returns: Whether the sidebar widget is shown.
  */
  @property bool showSidebar()
  {
    return getShowSidebar();
  }

  /**
      Set `showSidebar` property.
      Params:
        propval = Whether the sidebar widget is shown.
  */
  @property void showSidebar(bool propval)
  {
    return setShowSidebar(propval);
  }

  /**
      Get `sidebar` property.
      Returns: The sidebar widget.
  */
  @property gtk.widget.Widget sidebar()
  {
    return getSidebar();
  }

  /**
      Set `sidebar` property.
      Params:
        propval = The sidebar widget.
  */
  @property void sidebar(gtk.widget.Widget propval)
  {
    return setSidebar(propval);
  }

  /**
      Get `sidebarPosition` property.
      Returns: The sidebar position.
      
      If it's set to [gtk.types.PackType.Start], the sidebar is displayed before the content,
      if [gtk.types.PackType.End], it's displayed after the content.
  */
  @property gtk.types.PackType sidebarPosition()
  {
    return getSidebarPosition();
  }

  /**
      Set `sidebarPosition` property.
      Params:
        propval = The sidebar position.
        
        If it's set to [gtk.types.PackType.Start], the sidebar is displayed before the content,
        if [gtk.types.PackType.End], it's displayed after the content.
  */
  @property void sidebarPosition(gtk.types.PackType propval)
  {
    return setSidebarPosition(propval);
  }

  /**
      Get `sidebarWidthFraction` property.
      Returns: The preferred sidebar width as a fraction of the total width.
      
      The preferred width is additionally limited by
      `property@OverlaySplitView:min-sidebar-width` and
      `property@OverlaySplitView:max-sidebar-width`.
      
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
        `property@OverlaySplitView:min-sidebar-width` and
        `property@OverlaySplitView:max-sidebar-width`.
        
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
      
      See `property@OverlaySplitView:min-sidebar-width` and
      `property@OverlaySplitView:max-sidebar-width`.
  */
  @property adw.types.LengthUnit sidebarWidthUnit()
  {
    return getSidebarWidthUnit();
  }

  /**
      Set `sidebarWidthUnit` property.
      Params:
        propval = The length unit for minimum and maximum sidebar widths.
        
        See `property@OverlaySplitView:min-sidebar-width` and
        `property@OverlaySplitView:max-sidebar-width`.
  */
  @property void sidebarWidthUnit(adw.types.LengthUnit propval)
  {
    return setSidebarWidthUnit(propval);
  }

  mixin SwipeableT!();

  /**
      Creates a new [adw.overlay_split_view.OverlaySplitView].
      Returns: the newly created [adw.overlay_split_view.OverlaySplitView]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_overlay_split_view_new();
    this(_cretval, No.Take);
  }

  /**
      Gets whether self is collapsed.
      Returns: whether self is collapsed
  */
  bool getCollapsed()
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_collapsed(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the content widget for self.
      Returns: the content widget for self
  */
  gtk.widget.Widget getContent()
  {
    GtkWidget* _cretval;
    _cretval = adw_overlay_split_view_get_content(cast(AdwOverlaySplitView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether self can be closed with a swipe gesture.
      Returns: `TRUE` if self can be closed with a swipe gesture
  */
  bool getEnableHideGesture()
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_enable_hide_gesture(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether self can be opened with an edge swipe gesture.
      Returns: `TRUE` if self can be opened with a swipe gesture
  */
  bool getEnableShowGesture()
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_enable_show_gesture(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the maximum sidebar width for self.
      Returns: the maximum width
  */
  double getMaxSidebarWidth()
  {
    double _retval;
    _retval = adw_overlay_split_view_get_max_sidebar_width(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the minimum sidebar width for self.
      Returns: the minimum width
  */
  double getMinSidebarWidth()
  {
    double _retval;
    _retval = adw_overlay_split_view_get_min_sidebar_width(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the sidebar widget is pinned for self.
      Returns: whether if the sidebar widget is pinned
  */
  bool getPinSidebar()
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_pin_sidebar(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the sidebar widget is shown for self.
      Returns: `TRUE` if the sidebar widget is shown
  */
  bool getShowSidebar()
  {
    bool _retval;
    _retval = cast(bool)adw_overlay_split_view_get_show_sidebar(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the sidebar widget for self.
      Returns: the sidebar widget for self
  */
  gtk.widget.Widget getSidebar()
  {
    GtkWidget* _cretval;
    _cretval = adw_overlay_split_view_get_sidebar(cast(AdwOverlaySplitView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the sidebar position for self.
      Returns: the sidebar position for self
  */
  gtk.types.PackType getSidebarPosition()
  {
    GtkPackType _cretval;
    _cretval = adw_overlay_split_view_get_sidebar_position(cast(AdwOverlaySplitView*)this._cPtr);
    gtk.types.PackType _retval = cast(gtk.types.PackType)_cretval;
    return _retval;
  }

  /**
      Gets the preferred sidebar width fraction for self.
      Returns: the preferred width fraction
  */
  double getSidebarWidthFraction()
  {
    double _retval;
    _retval = adw_overlay_split_view_get_sidebar_width_fraction(cast(AdwOverlaySplitView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the length unit for minimum and maximum sidebar widths.
      Returns: the length unit
  */
  adw.types.LengthUnit getSidebarWidthUnit()
  {
    AdwLengthUnit _cretval;
    _cretval = adw_overlay_split_view_get_sidebar_width_unit(cast(AdwOverlaySplitView*)this._cPtr);
    adw.types.LengthUnit _retval = cast(adw.types.LengthUnit)_cretval;
    return _retval;
  }

  /**
      Sets whether self view is collapsed.
      
      When collapsed, the sidebar widget is presented as an overlay above the
      content widget, otherwise they are displayed side by side.
  
      Params:
        collapsed = whether self is collapsed
  */
  void setCollapsed(bool collapsed)
  {
    adw_overlay_split_view_set_collapsed(cast(AdwOverlaySplitView*)this._cPtr, collapsed);
  }

  /**
      Sets the content widget for self.
  
      Params:
        content = the content widget
  */
  void setContent(gtk.widget.Widget content = null)
  {
    adw_overlay_split_view_set_content(cast(AdwOverlaySplitView*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets whether self can be closed with a swipe gesture.
      
      Only touchscreen swipes are supported.
  
      Params:
        enableHideGesture = whether self can be closed with a swipe gesture
  */
  void setEnableHideGesture(bool enableHideGesture)
  {
    adw_overlay_split_view_set_enable_hide_gesture(cast(AdwOverlaySplitView*)this._cPtr, enableHideGesture);
  }

  /**
      Sets whether self can be opened with an edge swipe gesture.
      
      Only touchscreen swipes are supported.
  
      Params:
        enableShowGesture = whether self can be opened with a swipe gesture
  */
  void setEnableShowGesture(bool enableShowGesture)
  {
    adw_overlay_split_view_set_enable_show_gesture(cast(AdwOverlaySplitView*)this._cPtr, enableShowGesture);
  }

  /**
      Sets the maximum sidebar width for self.
      
      Maximum width is affected by `propertyOverlaySplitView:sidebar-width-unit`.
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the maximum width
  */
  void setMaxSidebarWidth(double width)
  {
    adw_overlay_split_view_set_max_sidebar_width(cast(AdwOverlaySplitView*)this._cPtr, width);
  }

  /**
      Sets the minimum sidebar width for self.
      
      Minimum width is affected by `propertyOverlaySplitView:sidebar-width-unit`.
      
      The sidebar widget can still be allocated with larger width if its own
      minimum width exceeds it.
  
      Params:
        width = the minimum width
  */
  void setMinSidebarWidth(double width)
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
  void setPinSidebar(bool pinSidebar)
  {
    adw_overlay_split_view_set_pin_sidebar(cast(AdwOverlaySplitView*)this._cPtr, pinSidebar);
  }

  /**
      Sets whether the sidebar widget is shown for self.
  
      Params:
        showSidebar = whether to show the sidebar widget
  */
  void setShowSidebar(bool showSidebar)
  {
    adw_overlay_split_view_set_show_sidebar(cast(AdwOverlaySplitView*)this._cPtr, showSidebar);
  }

  /**
      Sets the sidebar widget for self.
  
      Params:
        sidebar = the sidebar widget
  */
  void setSidebar(gtk.widget.Widget sidebar = null)
  {
    adw_overlay_split_view_set_sidebar(cast(AdwOverlaySplitView*)this._cPtr, sidebar ? cast(GtkWidget*)sidebar._cPtr(No.Dup) : null);
  }

  /**
      Sets the sidebar position for self.
      
      If it's set to [gtk.types.PackType.Start], the sidebar is displayed before the content,
      if [gtk.types.PackType.End], it's displayed after the content.
  
      Params:
        position = the new position
  */
  void setSidebarPosition(gtk.types.PackType position)
  {
    adw_overlay_split_view_set_sidebar_position(cast(AdwOverlaySplitView*)this._cPtr, position);
  }

  /**
      Sets the preferred sidebar width as a fraction of the total width of self.
      
      The preferred width is additionally limited by
      `propertyOverlaySplitView:min-sidebar-width` and
      `propertyOverlaySplitView:max-sidebar-width`.
      
      The sidebar widget can be allocated with larger width if its own minimum
      width exceeds the preferred width.
  
      Params:
        fraction = the preferred width fraction
  */
  void setSidebarWidthFraction(double fraction)
  {
    adw_overlay_split_view_set_sidebar_width_fraction(cast(AdwOverlaySplitView*)this._cPtr, fraction);
  }

  /**
      Sets the length unit for minimum and maximum sidebar widths.
      
      See `propertyOverlaySplitView:min-sidebar-width` and
      `propertyOverlaySplitView:max-sidebar-width`.
  
      Params:
        unit = the length unit
  */
  void setSidebarWidthUnit(adw.types.LengthUnit unit)
  {
    adw_overlay_split_view_set_sidebar_width_unit(cast(AdwOverlaySplitView*)this._cPtr, unit);
  }
}
