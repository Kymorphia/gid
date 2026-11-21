/// Module for [HeaderBar] class
module gid.adw1.header_bar;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
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
import gid.gtk4.widget;

/**
    A title bar widget.
    
    <picture>
      <source srcset="header-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="header-bar.png" alt="header-bar">
    </picture>
    
    [gid.adw1.header_bar.HeaderBar] is similar to [gid.gtk4.header_bar.HeaderBar], but provides additional
    features compared to it. Refer to [gid.gtk4.header_bar.HeaderBar] for details. It is typically
    used as a top bar within [gid.adw1.toolbar_view.ToolbarView].
    
    ## Dialog Integration
    
    When placed inside an [gid.adw1.dialog.Dialog], [gid.adw1.header_bar.HeaderBar] will display the dialog
    title instead of window title. It will also adjust the decoration layout to
    ensure it always has a close button and nothing else. Set
    [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] and
    [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] to `FALSE` to remove it if it's
    unwanted.
    
    ## Navigation View Integration
    
    When placed inside an [gid.adw1.navigation_page.NavigationPage], [gid.adw1.header_bar.HeaderBar] will display the
    page title instead of window title.
    
    When used together with [gid.adw1.navigation_view.NavigationView] or [gid.adw1.navigation_split_view.NavigationSplitView],
    it will also display a back button that can be used to go back to the previous
    page. The button also has a context menu, allowing to pop multiple pages at
    once, potentially across multiple navigation views.
    
    Set [gid.adw1.header_bar.HeaderBar.showBackButton] to `FALSE` to disable this behavior
    in rare scenarios where it's unwanted.
    
    ## Split View Integration
    
    When placed inside [gid.adw1.navigation_split_view.NavigationSplitView] or [gid.adw1.overlay_split_view.OverlaySplitView],
    [gid.adw1.header_bar.HeaderBar] will automatically hide the title buttons other than at the
    edges of the window.
    
    ## Bottom Sheet Integration
    
    When played inside [gid.adw1.bottom_sheet.BottomSheet], [gid.adw1.header_bar.HeaderBar] will not show the title
    unless [gid.adw1.bottom_sheet.BottomSheet.showDragHandle] is set to `FALSE`, regardless
    of [gid.adw1.header_bar.HeaderBar.showTitle]. This only applies to the default title,
    titles set with [gid.adw1.header_bar.HeaderBar.titleWidget] will still be shown.
    
    ## Centering Policy
    
    [gid.adw1.header_bar.HeaderBar.centeringPolicy] allows to enforce strict centering of
    the title widget. This can be useful for entries inside [gid.adw1.clamp.Clamp].
    
    ## Title Buttons
    
    Unlike [gid.gtk4.header_bar.HeaderBar], [gid.adw1.header_bar.HeaderBar] allows to toggle title button
    visibility for each side individually, using the
    [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] and
    [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] properties.
    
    ## CSS nodes
    
    ```
    headerbar
    ╰── windowhandle
        ╰── box
            ├── widget
            │   ╰── box.start
            │       ├── windowcontrols.start
            │       ├── widget
            │       │   ╰── [button.back]
            │       ╰── [other children]
            ├── widget
            │   ╰── [Title Widget]
            ╰── widget
                ╰── box.end
                    ├── [other children]
                    ╰── windowcontrols.end
    ```
    
    [gid.adw1.header_bar.HeaderBar]'s CSS node is called `headerbar`. It contains a `windowhandle`
    subnode, which contains a `box` subnode, which contains three `widget`
    subnodes at the start, center and end of the header bar. The start and end
    subnodes contain a `box` subnode with the `.start` and `.end` style classes
    respectively, and the center node contains a node that represents the title.
    
    Each of the boxes contains a `windowcontrols` subnode, see
    [gid.gtk4.window_controls.WindowControls] for details, as well as other children.
    
    When [gid.adw1.header_bar.HeaderBar.showBackButton] is `TRUE`, the start box also
    contains a node with the name `widget` that contains a node with the name
    `button` and `.back` style class.
    
    ## Accessibility
    
    [gid.adw1.header_bar.HeaderBar] uses the [gid.gtk4.types.AccessibleRole.Group] role.
*/
class HeaderBar : gid.gtk4.widget.Widget
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
    return cast(void function())adw_header_bar_get_type != &gidSymbolNotFound ? adw_header_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwHeaderBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override HeaderBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.header_bar.HeaderBar]
      Returns: New builder object
  */
  static HeaderBarGidBuilder builder() nothrow
  {
    return new HeaderBarGidBuilder;
  }

  /**
      Get `centeringPolicy` property.
      Returns: The policy for aligning the center widget.
  */
  @property gid.adw1.types.CenteringPolicy centeringPolicy() nothrow
  {
    return getCenteringPolicy();
  }

  /**
      Set `centeringPolicy` property.
      Params:
        propval = The policy for aligning the center widget.
  */
  @property void centeringPolicy(gid.adw1.types.CenteringPolicy propval) nothrow
  {
    setCenteringPolicy(propval);
  }

  /**
      Get `decorationLayout` property.
      Returns: The decoration layout for buttons.
        
        If this property is not set, the
        [gid.gtk4.settings.Settings.gtkDecorationLayout] setting is used.
        
        The format of the string is button names, separated by commas. A colon
        separates the buttons that should appear at the start from those at the
        end. Recognized button names are minimize, maximize, close and icon (the
        window icon).
        
        For example, “icon:minimize,maximize,close” specifies an icon at the start,
        and minimize, maximize and close buttons at the end.
  */
  @property string decorationLayout() nothrow
  {
    return getDecorationLayout();
  }

  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for buttons.
          
          If this property is not set, the
          [gid.gtk4.settings.Settings.gtkDecorationLayout] setting is used.
          
          The format of the string is button names, separated by commas. A colon
          separates the buttons that should appear at the start from those at the
          end. Recognized button names are minimize, maximize, close and icon (the
          window icon).
          
          For example, “icon:minimize,maximize,close” specifies an icon at the start,
          and minimize, maximize and close buttons at the end.
  */
  @property void decorationLayout(string propval) nothrow
  {
    setDecorationLayout(propval);
  }

  /**
      Get `showBackButton` property.
      Returns: Whether the header bar can show the back button.
        
        The back button will never be shown unless the header bar is placed inside an
        [gid.adw1.navigation_view.NavigationView]. Usually, there is no reason to set this to `FALSE`.
  */
  @property bool showBackButton() nothrow
  {
    return getShowBackButton();
  }

  /**
      Set `showBackButton` property.
      Params:
        propval = Whether the header bar can show the back button.
          
          The back button will never be shown unless the header bar is placed inside an
          [gid.adw1.navigation_view.NavigationView]. Usually, there is no reason to set this to `FALSE`.
  */
  @property void showBackButton(bool propval) nothrow
  {
    setShowBackButton(propval);
  }

  /**
      Get `showEndTitleButtons` property.
      Returns: Whether to show title buttons at the end of the header bar.
        
        See [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] for the other side.
        
        Which buttons are actually shown and where is determined by the
        [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
        window (e.g. a close button will not be shown if the window can't be
        closed).
  */
  @property bool showEndTitleButtons() nothrow
  {
    return getShowEndTitleButtons();
  }

  /**
      Set `showEndTitleButtons` property.
      Params:
        propval = Whether to show title buttons at the end of the header bar.
          
          See [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] for the other side.
          
          Which buttons are actually shown and where is determined by the
          [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
          window (e.g. a close button will not be shown if the window can't be
          closed).
  */
  @property void showEndTitleButtons(bool propval) nothrow
  {
    setShowEndTitleButtons(propval);
  }

  /**
      Get `showStartTitleButtons` property.
      Returns: Whether to show title buttons at the start of the header bar.
        
        See [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] for the other side.
        
        Which buttons are actually shown and where is determined by the
        [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
        window (e.g. a close button will not be shown if the window can't be
        closed).
  */
  @property bool showStartTitleButtons() nothrow
  {
    return getShowStartTitleButtons();
  }

  /**
      Set `showStartTitleButtons` property.
      Params:
        propval = Whether to show title buttons at the start of the header bar.
          
          See [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] for the other side.
          
          Which buttons are actually shown and where is determined by the
          [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
          window (e.g. a close button will not be shown if the window can't be
          closed).
  */
  @property void showStartTitleButtons(bool propval) nothrow
  {
    setShowStartTitleButtons(propval);
  }

  /**
      Get `showTitle` property.
      Returns: Whether the title widget should be shown.
  */
  @property bool showTitle() nothrow
  {
    return getShowTitle();
  }

  /**
      Set `showTitle` property.
      Params:
        propval = Whether the title widget should be shown.
  */
  @property void showTitle(bool propval) nothrow
  {
    setShowTitle(propval);
  }

  /**
      Get `titleWidget` property.
      Returns: The title widget to display.
        
        When set to `NULL`, the header bar will display the title of the window it
        is contained in.
        
        To use a different title, use [gid.adw1.window_title.WindowTitle]:
        
        ```xml
        <object class="AdwHeaderBar">
          <property name="title-widget">
            <object class="AdwWindowTitle">
              <property name="title" translatable="yes">Title</property>
            </object>
          </property>
        </object>
        ```
  */
  @property gid.gtk4.widget.Widget titleWidget() nothrow
  {
    return getTitleWidget();
  }

  /**
      Set `titleWidget` property.
      Params:
        propval = The title widget to display.
          
          When set to `NULL`, the header bar will display the title of the window it
          is contained in.
          
          To use a different title, use [gid.adw1.window_title.WindowTitle]:
          
          ```xml
          <object class="AdwHeaderBar">
            <property name="title-widget">
              <object class="AdwWindowTitle">
                <property name="title" translatable="yes">Title</property>
              </object>
            </property>
          </object>
          ```
  */
  @property void titleWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setTitleWidget(propval);
  }

  /**
      Creates a new [gid.adw1.header_bar.HeaderBar].
      Returns: the newly created [gid.adw1.header_bar.HeaderBar].
  */
  this() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_header_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the policy for aligning the center widget.
      Returns: the centering policy
  */
  gid.adw1.types.CenteringPolicy getCenteringPolicy() nothrow
  {
    AdwCenteringPolicy _cretval;
    _cretval = adw_header_bar_get_centering_policy(cast(AdwHeaderBar*)this._cPtr);
    gid.adw1.types.CenteringPolicy _retval = cast(gid.adw1.types.CenteringPolicy)_cretval;
    return _retval;
  }

  /**
      Gets the decoration layout for self.
      Returns: the decoration layout
  */
  string getDecorationLayout() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_header_bar_get_decoration_layout(cast(AdwHeaderBar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether self can show the back button.
      Returns: whether to show the back button
  */
  bool getShowBackButton() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_back_button(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to show title buttons at the end of self.
      Returns: `TRUE` if title buttons at the end are shown
  */
  bool getShowEndTitleButtons() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_end_title_buttons(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to show title buttons at the start of self.
      Returns: `TRUE` if title buttons at the start are shown
  */
  bool getShowStartTitleButtons() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_start_title_buttons(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the title widget should be shown.
      Returns: whether the title widget should be shown.
  */
  bool getShowTitle() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_title(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the title widget widget of self.
      Returns: the title widget
  */
  gid.gtk4.widget.Widget getTitleWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = adw_header_bar_get_title_widget(cast(AdwHeaderBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds child to self, packed with reference to the end of self.
  
      Params:
        child = the widget to be added to self
  */
  void packEnd(gid.gtk4.widget.Widget child) nothrow
  {
    adw_header_bar_pack_end(cast(AdwHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds child to self, packed with reference to the start of the self.
  
      Params:
        child = the widget to be added to self
  */
  void packStart(gid.gtk4.widget.Widget child) nothrow
  {
    adw_header_bar_pack_start(cast(AdwHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child from self.
      
      The child must have been added with [gid.adw1.header_bar.HeaderBar.packStart],
      [gid.adw1.header_bar.HeaderBar.packEnd] or [gid.adw1.header_bar.HeaderBar.titleWidget].
  
      Params:
        child = the child to remove
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    adw_header_bar_remove(cast(AdwHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the policy for aligning the center widget.
  
      Params:
        centeringPolicy = the centering policy
  */
  void setCenteringPolicy(gid.adw1.types.CenteringPolicy centeringPolicy) nothrow
  {
    adw_header_bar_set_centering_policy(cast(AdwHeaderBar*)this._cPtr, centeringPolicy);
  }

  /**
      Sets the decoration layout for self.
      
      If this property is not set, the
      [gid.gtk4.settings.Settings.gtkDecorationLayout] setting is used.
      
      The format of the string is button names, separated by commas. A colon
      separates the buttons that should appear at the start from those at the end.
      Recognized button names are minimize, maximize, close and icon (the window
      icon).
      
      For example, “icon:minimize,maximize,close” specifies an icon at the start,
      and minimize, maximize and close buttons at the end.
  
      Params:
        layout = a decoration layout
  */
  void setDecorationLayout(string layout = null) nothrow
  {
    const(char)* _layout = layout.toCString!(No.Malloc, Yes.Nullable);
    adw_header_bar_set_decoration_layout(cast(AdwHeaderBar*)this._cPtr, _layout);
  }

  /**
      Sets whether self can show the back button.
      
      The back button will never be shown unless the header bar is placed inside an
      [gid.adw1.navigation_view.NavigationView]. Usually, there is no reason to set it to `FALSE`.
  
      Params:
        showBackButton = whether to show the back button
  */
  void setShowBackButton(bool showBackButton) nothrow
  {
    adw_header_bar_set_show_back_button(cast(AdwHeaderBar*)this._cPtr, showBackButton);
  }

  /**
      Sets whether to show title buttons at the end of self.
      
      See [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] for the other side.
      
      Which buttons are actually shown and where is determined by the
      [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
      window (e.g. a close button will not be shown if the window can't be closed).
  
      Params:
        setting = `TRUE` to show standard title buttons
  */
  void setShowEndTitleButtons(bool setting) nothrow
  {
    adw_header_bar_set_show_end_title_buttons(cast(AdwHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets whether to show title buttons at the start of self.
      
      See [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] for the other side.
      
      Which buttons are actually shown and where is determined by the
      [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
      window (e.g. a close button will not be shown if the window can't be closed).
  
      Params:
        setting = `TRUE` to show standard title buttons
  */
  void setShowStartTitleButtons(bool setting) nothrow
  {
    adw_header_bar_set_show_start_title_buttons(cast(AdwHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets whether the title widget should be shown.
  
      Params:
        showTitle = whether the title widget is visible
  */
  void setShowTitle(bool showTitle) nothrow
  {
    adw_header_bar_set_show_title(cast(AdwHeaderBar*)this._cPtr, showTitle);
  }

  /**
      Sets the title widget for self.
      
      When set to `NULL`, the header bar will display the title of the window it
      is contained in.
      
      To use a different title, use [gid.adw1.window_title.WindowTitle]:
      
      ```xml
      <object class="AdwHeaderBar">
        <property name="title-widget">
          <object class="AdwWindowTitle">
            <property name="title" translatable="yes">Title</property>
          </object>
        </property>
      </object>
      ```
  
      Params:
        titleWidget = a widget to use for a title
  */
  void setTitleWidget(gid.gtk4.widget.Widget titleWidget = null) nothrow
  {
    adw_header_bar_set_title_widget(cast(AdwHeaderBar*)this._cPtr, titleWidget ? cast(GtkWidget*)titleWidget._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.adw1.header_bar.HeaderBar]
class HeaderBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `centeringPolicy` property.
      Params:
        propval = The policy for aligning the center widget.
      Returns: Builder instance for fluent chaining
  */
  T centeringPolicy(gid.adw1.types.CenteringPolicy propval) nothrow
  {
    return setProperty("centering-policy", propval);
  }

  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for buttons.
          
          If this property is not set, the
          [gid.gtk4.settings.Settings.gtkDecorationLayout] setting is used.
          
          The format of the string is button names, separated by commas. A colon
          separates the buttons that should appear at the start from those at the
          end. Recognized button names are minimize, maximize, close and icon (the
          window icon).
          
          For example, “icon:minimize,maximize,close” specifies an icon at the start,
          and minimize, maximize and close buttons at the end.
      Returns: Builder instance for fluent chaining
  */
  T decorationLayout(string propval) nothrow
  {
    return setProperty("decoration-layout", propval);
  }

  /**
      Set `showBackButton` property.
      Params:
        propval = Whether the header bar can show the back button.
          
          The back button will never be shown unless the header bar is placed inside an
          [gid.adw1.navigation_view.NavigationView]. Usually, there is no reason to set this to `FALSE`.
      Returns: Builder instance for fluent chaining
  */
  T showBackButton(bool propval) nothrow
  {
    return setProperty("show-back-button", propval);
  }

  /**
      Set `showEndTitleButtons` property.
      Params:
        propval = Whether to show title buttons at the end of the header bar.
          
          See [gid.adw1.header_bar.HeaderBar.showStartTitleButtons] for the other side.
          
          Which buttons are actually shown and where is determined by the
          [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
          window (e.g. a close button will not be shown if the window can't be
          closed).
      Returns: Builder instance for fluent chaining
  */
  T showEndTitleButtons(bool propval) nothrow
  {
    return setProperty("show-end-title-buttons", propval);
  }

  /**
      Set `showStartTitleButtons` property.
      Params:
        propval = Whether to show title buttons at the start of the header bar.
          
          See [gid.adw1.header_bar.HeaderBar.showEndTitleButtons] for the other side.
          
          Which buttons are actually shown and where is determined by the
          [gid.adw1.header_bar.HeaderBar.decorationLayout] property, and by the state of the
          window (e.g. a close button will not be shown if the window can't be
          closed).
      Returns: Builder instance for fluent chaining
  */
  T showStartTitleButtons(bool propval) nothrow
  {
    return setProperty("show-start-title-buttons", propval);
  }

  /**
      Set `showTitle` property.
      Params:
        propval = Whether the title widget should be shown.
      Returns: Builder instance for fluent chaining
  */
  T showTitle(bool propval) nothrow
  {
    return setProperty("show-title", propval);
  }

  /**
      Set `titleWidget` property.
      Params:
        propval = The title widget to display.
          
          When set to `NULL`, the header bar will display the title of the window it
          is contained in.
          
          To use a different title, use [gid.adw1.window_title.WindowTitle]:
          
          ```xml
          <object class="AdwHeaderBar">
            <property name="title-widget">
              <object class="AdwWindowTitle">
                <property name="title" translatable="yes">Title</property>
              </object>
            </property>
          </object>
          ```
      Returns: Builder instance for fluent chaining
  */
  T titleWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("title-widget", propval);
  }
}

/// Fluent builder for [gid.adw1.header_bar.HeaderBar]
final class HeaderBarGidBuilder : HeaderBarGidBuilderImpl!HeaderBarGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  HeaderBar build() nothrow
  {
    return new HeaderBar(cast(void*)createGObject(HeaderBar._getGType), Yes.Take);
  }
}
