/// Module for [ToolbarView] class
module adw.toolbar_view;

import adw.c.functions;
import adw.c.types;
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
    A widget containing a page, as well as top and/or bottom bars.
    
    <picture>
      <source srcset="toolbar-view-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view.png" alt="toolbar-view">
    </picture>
    
    [adw.toolbar_view.ToolbarView] has a single content widget and one or multiple top and
    bottom bars, shown at the top and bottom sides respectively.
    
    Example of an [adw.toolbar_view.ToolbarView] UI definition:
    ```xml
    <object class="AdwToolbarView">
      <child type="top">
        <object class="AdwHeaderBar"/>
      </child>
      <property name="content">
        <object class="AdwPreferencesPage">
          <!-- ... -->
        </object>
      </property>
    </object>
    ```
    
    The following kinds of top and bottom bars are supported:
    
    $(LIST
      * `class@HeaderBar`
      * `class@TabBar`
      * `class@ViewSwitcherBar`
      * [gtk.action_bar.ActionBar]
      * [gtk.header_bar.HeaderBar]
      * [gtk.popover_menu_bar.PopoverMenuBar]
      * [gtk.search_bar.SearchBar]
      * Any [gtk.box.Box] or a similar widget with the
        [`.toolbar`](style-classes.html#toolbars) style class
    )
      
    By default, top and bottom bars are flat and scrolling content has a subtle
    undershoot shadow, same as when using the
    [`.undershoot-top`](style-classes.html#undershoot-indicators) and
    [`.undershoot-bottom`](style-classes.html#undershoot-indicators) style
    classes. This works well in most cases, e.g. with `class@StatusPage` or
    `class@PreferencesPage`, where the background at the top and bottom parts of
    the page is uniform. Additionally, windows with sidebars should always use
    this style.
    
    `property@ToolbarView:top-bar-style` and
    `property@ToolbarView:bottom-bar-style` properties can be used add an opaque
    background and a persistent shadow to top and bottom bars, this can be useful
    for content such as [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
    where some elements are adjacent to the top/bottom bars, or `class@TabView`,
    where each page can have a different background.
    
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-flat-1-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-flat-1.png" alt="toolbar-view-flat-1">
    </picture>
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-flat-2-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-flat-2.png" alt="toolbar-view-flat-2">
    </picture>
    <picture style="min-width: 33%; display: inline-block;">
      <source srcset="toolbar-view-raised-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-raised.png" alt="toolbar-view-raised">
    </picture>
    
    [adw.toolbar_view.ToolbarView] ensures the top and bottom bars have consistent backdrop
    styles and vertical spacing. For comparison:
    
    <picture style="min-width: 40%; display: inline-block;">
      <source srcset="toolbar-view-spacing-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-spacing.png" alt="toolbar-view-spacing">
    </picture>
    <picture style="min-width: 40%; display: inline-block;">
      <source srcset="toolbar-view-spacing-box-dark.png" media="(prefers-color-scheme: dark)">
      <img src="toolbar-view-spacing-box.png" alt="toolbar-view-spacing-box">
    </picture>
    
    Any top and bottom bars can also be dragged to move the window, equivalent
    to putting them into a [gtk.window_handle.WindowHandle].
    
    Content is typically place between top and bottom bars, but can also extend
    behind them. This is controlled with the
    `property@ToolbarView:extend-content-to-top-edge` and
    `property@ToolbarView:extend-content-to-bottom-edge` properties.
    
    Top and bottom bars can be hidden and revealed with an animation using the
    `property@ToolbarView:reveal-top-bars` and
    `property@ToolbarView:reveal-bottom-bars` properties.
    
    ## [adw.toolbar_view.ToolbarView] as [gtk.buildable.Buildable]
    
    The [adw.toolbar_view.ToolbarView] implementation of the [gtk.buildable.Buildable] interface
    supports adding a top bar by specifying “top” as the “type” attribute of a
    `<child>` element, or adding a bottom bar by specifying “bottom”.
    
    ## Accessibility
    
    [adw.toolbar_view.ToolbarView] uses the [gtk.types.AccessibleRole.Group] role.
*/
class ToolbarView : gtk.widget.Widget
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
    return cast(void function())adw_toolbar_view_get_type != &gidSymbolNotFound ? adw_toolbar_view_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ToolbarView self()
  {
    return this;
  }

  /**
      Get `bottomBarHeight` property.
      Returns: The current bottom bar height.
        
        Bottom bar height does change depending on
        `property@ToolbarView:reveal-bottom-bars`, including during the transition.
        
        See `property@ToolbarView:top-bar-height`.
  */
  @property int bottomBarHeight()
  {
    return getBottomBarHeight();
  }

  /**
      Get `bottomBarStyle` property.
      Returns: Appearance of the bottom bars.
        
        If set to [adw.types.ToolbarStyle.Flat], bottom bars are flat and scrolling content
        has a subtle undershoot shadow when touching them, same as the
        [`.undershoot-bottom`](style-classes.html#undershoot-indicators)
        style class. This works well for simple content, e.g. `class@StatusPage` or
        `class@PreferencesPage`, where the background at the bottom of the page is
        uniform. Additionally, windows with sidebars should always use this style.
        
        Undershoot shadow is only present if a bottom bar is actually present and
        visible. It is also never present if
        `property@ToolbarView:extend-content-to-bottom-edge` is set to `TRUE`.
        
        If set to [adw.types.ToolbarStyle.Raised], bottom bars have an opaque background and a
        persistent shadow, this is suitable for content such as
        [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
        where some elements are directly adjacent to the bottom bars, or
        `class@TabView`, where each page can have a different background.
        
        [adw.types.ToolbarStyle.RaisedBorder] is similar to [adw.types.ToolbarStyle.Raised], but the
        shadow is replaced with a more subtle border. This can be useful for
        applications like image viewers.
        
        See also `property@ToolbarView:top-bar-style`.
  */
  @property adw.types.ToolbarStyle bottomBarStyle()
  {
    return getBottomBarStyle();
  }

  /**
      Set `bottomBarStyle` property.
      Params:
        propval = Appearance of the bottom bars.
          
          If set to [adw.types.ToolbarStyle.Flat], bottom bars are flat and scrolling content
          has a subtle undershoot shadow when touching them, same as the
          [`.undershoot-bottom`](style-classes.html#undershoot-indicators)
          style class. This works well for simple content, e.g. `class@StatusPage` or
          `class@PreferencesPage`, where the background at the bottom of the page is
          uniform. Additionally, windows with sidebars should always use this style.
          
          Undershoot shadow is only present if a bottom bar is actually present and
          visible. It is also never present if
          `property@ToolbarView:extend-content-to-bottom-edge` is set to `TRUE`.
          
          If set to [adw.types.ToolbarStyle.Raised], bottom bars have an opaque background and a
          persistent shadow, this is suitable for content such as
          [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
          where some elements are directly adjacent to the bottom bars, or
          `class@TabView`, where each page can have a different background.
          
          [adw.types.ToolbarStyle.RaisedBorder] is similar to [adw.types.ToolbarStyle.Raised], but the
          shadow is replaced with a more subtle border. This can be useful for
          applications like image viewers.
          
          See also `property@ToolbarView:top-bar-style`.
  */
  @property void bottomBarStyle(adw.types.ToolbarStyle propval)
  {
    return setBottomBarStyle(propval);
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
      Get `extendContentToBottomEdge` property.
      Returns: Whether the content widget can extend behind bottom bars.
        
        This can be used in combination with
        `property@ToolbarView:reveal-bottom-bars` to show and hide toolbars in
        fullscreen.
        
        See `property@ToolbarView:extend-content-to-top-edge`.
  */
  @property bool extendContentToBottomEdge()
  {
    return getExtendContentToBottomEdge();
  }

  /**
      Set `extendContentToBottomEdge` property.
      Params:
        propval = Whether the content widget can extend behind bottom bars.
          
          This can be used in combination with
          `property@ToolbarView:reveal-bottom-bars` to show and hide toolbars in
          fullscreen.
          
          See `property@ToolbarView:extend-content-to-top-edge`.
  */
  @property void extendContentToBottomEdge(bool propval)
  {
    return setExtendContentToBottomEdge(propval);
  }

  /**
      Get `extendContentToTopEdge` property.
      Returns: Whether the content widget can extend behind top bars.
        
        This can be used in combination with `property@ToolbarView:reveal-top-bars`
        to show and hide toolbars in fullscreen.
        
        See `property@ToolbarView:extend-content-to-bottom-edge`.
  */
  @property bool extendContentToTopEdge()
  {
    return getExtendContentToTopEdge();
  }

  /**
      Set `extendContentToTopEdge` property.
      Params:
        propval = Whether the content widget can extend behind top bars.
          
          This can be used in combination with `property@ToolbarView:reveal-top-bars`
          to show and hide toolbars in fullscreen.
          
          See `property@ToolbarView:extend-content-to-bottom-edge`.
  */
  @property void extendContentToTopEdge(bool propval)
  {
    return setExtendContentToTopEdge(propval);
  }

  /**
      Get `revealBottomBars` property.
      Returns: Whether bottom bars are visible.
        
        The transition will be animated.
        
        This can be used in combination with
        `property@ToolbarView:extend-content-to-bottom-edge` to show and hide
        toolbars in fullscreen.
        
        See `property@ToolbarView:reveal-top-bars`.
  */
  @property bool revealBottomBars()
  {
    return getRevealBottomBars();
  }

  /**
      Set `revealBottomBars` property.
      Params:
        propval = Whether bottom bars are visible.
          
          The transition will be animated.
          
          This can be used in combination with
          `property@ToolbarView:extend-content-to-bottom-edge` to show and hide
          toolbars in fullscreen.
          
          See `property@ToolbarView:reveal-top-bars`.
  */
  @property void revealBottomBars(bool propval)
  {
    return setRevealBottomBars(propval);
  }

  /**
      Get `revealTopBars` property.
      Returns: Whether top bars are revealed.
        
        The transition will be animated.
        
        This can be used in combination with
        `property@ToolbarView:extend-content-to-top-edge` to show and hide toolbars
        in fullscreen.
        
        See `property@ToolbarView:reveal-bottom-bars`.
  */
  @property bool revealTopBars()
  {
    return getRevealTopBars();
  }

  /**
      Set `revealTopBars` property.
      Params:
        propval = Whether top bars are revealed.
          
          The transition will be animated.
          
          This can be used in combination with
          `property@ToolbarView:extend-content-to-top-edge` to show and hide toolbars
          in fullscreen.
          
          See `property@ToolbarView:reveal-bottom-bars`.
  */
  @property void revealTopBars(bool propval)
  {
    return setRevealTopBars(propval);
  }

  /**
      Get `topBarHeight` property.
      Returns: The current top bar height.
        
        Top bar height does change depending `property@ToolbarView:reveal-top-bars`,
        including during the transition.
        
        See `property@ToolbarView:bottom-bar-height`.
  */
  @property int topBarHeight()
  {
    return getTopBarHeight();
  }

  /**
      Get `topBarStyle` property.
      Returns: Appearance of the top bars.
        
        If set to [adw.types.ToolbarStyle.Flat], top bars are flat and scrolling content has a
        subtle undershoot shadow when touching them, same as the
        [`.undershoot-top`](style-classes.html#undershoot-indicators)
        style class. This works well for simple content, e.g. `class@StatusPage` or
        `class@PreferencesPage`, where the background at the top of the page is
        uniform. Additionally, windows with sidebars should always use this style.
        
        Undershoot shadow is only present if a top bar is actually present and
        visible. It is also never present if
        `property@ToolbarView:extend-content-to-top-edge` is set to `TRUE`.
        
        If set to [adw.types.ToolbarStyle.Raised], top bars have an opaque background and a
        persistent shadow, this is suitable for content such as
        [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
        where some elements are directly adjacent to the top bars, or
        `class@TabView`, where each page can have a different background.
        
        [adw.types.ToolbarStyle.RaisedBorder] is similar to [adw.types.ToolbarStyle.Raised], but the
        shadow is replaced with a more subtle border. This can be useful for
        applications like image viewers.
        
        See also `property@ToolbarView:bottom-bar-style`.
  */
  @property adw.types.ToolbarStyle topBarStyle()
  {
    return getTopBarStyle();
  }

  /**
      Set `topBarStyle` property.
      Params:
        propval = Appearance of the top bars.
          
          If set to [adw.types.ToolbarStyle.Flat], top bars are flat and scrolling content has a
          subtle undershoot shadow when touching them, same as the
          [`.undershoot-top`](style-classes.html#undershoot-indicators)
          style class. This works well for simple content, e.g. `class@StatusPage` or
          `class@PreferencesPage`, where the background at the top of the page is
          uniform. Additionally, windows with sidebars should always use this style.
          
          Undershoot shadow is only present if a top bar is actually present and
          visible. It is also never present if
          `property@ToolbarView:extend-content-to-top-edge` is set to `TRUE`.
          
          If set to [adw.types.ToolbarStyle.Raised], top bars have an opaque background and a
          persistent shadow, this is suitable for content such as
          [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
          where some elements are directly adjacent to the top bars, or
          `class@TabView`, where each page can have a different background.
          
          [adw.types.ToolbarStyle.RaisedBorder] is similar to [adw.types.ToolbarStyle.Raised], but the
          shadow is replaced with a more subtle border. This can be useful for
          applications like image viewers.
          
          See also `property@ToolbarView:bottom-bar-style`.
  */
  @property void topBarStyle(adw.types.ToolbarStyle propval)
  {
    return setTopBarStyle(propval);
  }

  /**
      Creates a new [adw.toolbar_view.ToolbarView].
      Returns: the newly created [adw.toolbar_view.ToolbarView]
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_toolbar_view_new();
    this(_cretval, No.Take);
  }

  /**
      Adds a bottom bar to self.
  
      Params:
        widget = a widget
  */
  void addBottomBar(gtk.widget.Widget widget)
  {
    adw_toolbar_view_add_bottom_bar(cast(AdwToolbarView*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Adds a top bar to self.
  
      Params:
        widget = a widget
  */
  void addTopBar(gtk.widget.Widget widget)
  {
    adw_toolbar_view_add_top_bar(cast(AdwToolbarView*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Gets the current bottom bar height for self.
      
      Bottom bar height does change depending on
      `propertyToolbarView:reveal-bottom-bars`, including during the transition.
      
      See [adw.toolbar_view.ToolbarView.getTopBarHeight].
      Returns: the current bottom bar height
  */
  int getBottomBarHeight()
  {
    int _retval;
    _retval = adw_toolbar_view_get_bottom_bar_height(cast(AdwToolbarView*)this._cPtr);
    return _retval;
  }

  /**
      Gets appearance of the botom bars for self.
      Returns: bottom bar style
  */
  adw.types.ToolbarStyle getBottomBarStyle()
  {
    AdwToolbarStyle _cretval;
    _cretval = adw_toolbar_view_get_bottom_bar_style(cast(AdwToolbarView*)this._cPtr);
    adw.types.ToolbarStyle _retval = cast(adw.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Gets the content widget for self.
      Returns: the content widget
  */
  gtk.widget.Widget getContent()
  {
    GtkWidget* _cretval;
    _cretval = adw_toolbar_view_get_content(cast(AdwToolbarView*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the content widget can extend behind bottom bars.
      Returns: whether content extends behind bottom bars
  */
  bool getExtendContentToBottomEdge()
  {
    bool _retval;
    _retval = cast(bool)adw_toolbar_view_get_extend_content_to_bottom_edge(cast(AdwToolbarView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the content widget can extend behind top bars.
      Returns: whether content extends behind top bars
  */
  bool getExtendContentToTopEdge()
  {
    bool _retval;
    _retval = cast(bool)adw_toolbar_view_get_extend_content_to_top_edge(cast(AdwToolbarView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether bottom bars are revealed for self.
      Returns: whether bottom bars are revealed
  */
  bool getRevealBottomBars()
  {
    bool _retval;
    _retval = cast(bool)adw_toolbar_view_get_reveal_bottom_bars(cast(AdwToolbarView*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether top bars are revealed for self.
      Returns: whether top bars are revealed
  */
  bool getRevealTopBars()
  {
    bool _retval;
    _retval = cast(bool)adw_toolbar_view_get_reveal_top_bars(cast(AdwToolbarView*)this._cPtr);
    return _retval;
  }

  /**
      Gets the current top bar height for self.
      
      Top bar height does change depending on
      `propertyToolbarView:reveal-top-bars`, including during the transition.
      
      See [adw.toolbar_view.ToolbarView.getBottomBarHeight].
      Returns: the current top bar height
  */
  int getTopBarHeight()
  {
    int _retval;
    _retval = adw_toolbar_view_get_top_bar_height(cast(AdwToolbarView*)this._cPtr);
    return _retval;
  }

  /**
      Gets appearance of the top bars for self.
      Returns: top bar style
  */
  adw.types.ToolbarStyle getTopBarStyle()
  {
    AdwToolbarStyle _cretval;
    _cretval = adw_toolbar_view_get_top_bar_style(cast(AdwToolbarView*)this._cPtr);
    adw.types.ToolbarStyle _retval = cast(adw.types.ToolbarStyle)_cretval;
    return _retval;
  }

  /**
      Removes a child from self.
  
      Params:
        widget = the child to be removed
  */
  void remove(gtk.widget.Widget widget)
  {
    adw_toolbar_view_remove(cast(AdwToolbarView*)this._cPtr, widget ? cast(GtkWidget*)widget._cPtr(No.Dup) : null);
  }

  /**
      Sets appearance of the bottom bars for self.
      
      If set to [adw.types.ToolbarStyle.Flat], bottom bars are flat and scrolling content has
      a subtle undershoot shadow when touching them, same as the
      [`.undershoot-bottom`](style-classes.html#undershoot-indicators)
      style class. This works well for simple content, e.g. `classStatusPage` or
      `classPreferencesPage`, where the background at the bottom of the page is
      uniform. Additionally, windows with sidebars should always use this style.
      
      Undershoot shadow is only present if a bottom bar is actually present and
      visible. It is also never present if
      `propertyToolbarView:extend-content-to-bottom-edge` is set to `TRUE`.
      
      If set to [adw.types.ToolbarStyle.Raised], bottom bars have an opaque background and a
      persistent shadow, this is suitable for content such as
      [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
      where some elements are directly adjacent to the bottom bars, or
      `classTabView`, where each page can have a different background.
      
      [adw.types.ToolbarStyle.RaisedBorder] is similar to [adw.types.ToolbarStyle.Raised], but the
      shadow is replaced with a more subtle border. This can be useful for
      applications like image viewers.
      
      See also [adw.toolbar_view.ToolbarView.setTopBarStyle].
  
      Params:
        style = bottom bar style
  */
  void setBottomBarStyle(adw.types.ToolbarStyle style)
  {
    adw_toolbar_view_set_bottom_bar_style(cast(AdwToolbarView*)this._cPtr, style);
  }

  /**
      Sets the content widget for self.
  
      Params:
        content = the content widget
  */
  void setContent(gtk.widget.Widget content = null)
  {
    adw_toolbar_view_set_content(cast(AdwToolbarView*)this._cPtr, content ? cast(GtkWidget*)content._cPtr(No.Dup) : null);
  }

  /**
      Sets whether the content widget can extend behind bottom bars.
      
      This can be used in combination with `propertyToolbarView:reveal-bottom-bars`
      to show and hide toolbars in fullscreen.
      
      See [adw.toolbar_view.ToolbarView.setExtendContentToTopEdge].
  
      Params:
        extend = whether content extends behind bottom bars
  */
  void setExtendContentToBottomEdge(bool extend)
  {
    adw_toolbar_view_set_extend_content_to_bottom_edge(cast(AdwToolbarView*)this._cPtr, extend);
  }

  /**
      Sets whether the content widget can extend behind top bars.
      
      This can be used in combination with `propertyToolbarView:reveal-top-bars`
      to show and hide toolbars in fullscreen.
      
      See [adw.toolbar_view.ToolbarView.setExtendContentToBottomEdge].
  
      Params:
        extend = whether content extends behind top bars
  */
  void setExtendContentToTopEdge(bool extend)
  {
    adw_toolbar_view_set_extend_content_to_top_edge(cast(AdwToolbarView*)this._cPtr, extend);
  }

  /**
      Sets whether bottom bars are revealed for self.
      
      The transition will be animated.
      
      This can be used in combination with
      `propertyToolbarView:extend-content-to-bottom-edge` to show and hide
      toolbars in fullscreen.
      
      See [adw.toolbar_view.ToolbarView.setRevealTopBars].
  
      Params:
        reveal = whether to reveal bottom bars
  */
  void setRevealBottomBars(bool reveal)
  {
    adw_toolbar_view_set_reveal_bottom_bars(cast(AdwToolbarView*)this._cPtr, reveal);
  }

  /**
      Sets whether top bars are revealed for self.
      
      The transition will be animated.
      
      This can be used in combination with
      `propertyToolbarView:extend-content-to-top-edge` to show and hide toolbars
      in fullscreen.
      
      See [adw.toolbar_view.ToolbarView.setRevealBottomBars].
  
      Params:
        reveal = whether to reveal top bars
  */
  void setRevealTopBars(bool reveal)
  {
    adw_toolbar_view_set_reveal_top_bars(cast(AdwToolbarView*)this._cPtr, reveal);
  }

  /**
      Sets appearance of the top bars for self.
      
      If set to [adw.types.ToolbarStyle.Flat], top bars are flat and scrolling content has a
      subtle undershoot shadow when touching them, same as the
      [`.undershoot-top`](style-classes.html#undershoot-indicators)
      style class. This works well for simple content, e.g. `classStatusPage` or
      `classPreferencesPage`, where the background at the top of the page is
      uniform. Additionally, windows with sidebars should always use this style.
      
      Undershoot shadow is only present if a top bar is actually present and
      visible. It is also never present if
      `propertyToolbarView:extend-content-to-top-edge` is set to `TRUE`.
      
      If set to [adw.types.ToolbarStyle.Raised], top bars have an opaque background and a
      persistent shadow, this is suitable for content such as
      [utility panes](https://developer.gnome.org/hig/patterns/containers/utility-panes.html),
      where some elements are directly adjacent to the top bars, or
      `classTabView`, where each page can have a different background.
      
      [adw.types.ToolbarStyle.RaisedBorder] is similar to [adw.types.ToolbarStyle.Raised], but the
      shadow is replaced with a more subtle border. This can be useful for
      applications like image viewers.
      
      See also [adw.toolbar_view.ToolbarView.setBottomBarStyle].
  
      Params:
        style = top bar style
  */
  void setTopBarStyle(adw.types.ToolbarStyle style)
  {
    adw_toolbar_view_set_top_bar_style(cast(AdwToolbarView*)this._cPtr, style);
  }
}
