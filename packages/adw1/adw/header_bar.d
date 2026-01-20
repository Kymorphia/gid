/// Module for [HeaderBar] class
module adw.header_bar;

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
    A title bar widget.
    
    <picture>
      <source srcset="header-bar-dark.png" media="(prefers-color-scheme: dark)">
      <img src="header-bar.png" alt="header-bar">
    </picture>
    
    [adw.header_bar.HeaderBar] is similar to [gtk.header_bar.HeaderBar], but provides additional
    features compared to it. Refer to [gtk.header_bar.HeaderBar] for details. It is typically
    used as a top bar within `class@ToolbarView`.
    
    ## Dialog Integration
    
    When placed inside an `class@Dialog`, [adw.header_bar.HeaderBar] will display the dialog
    title intead of window title. It will also adjust the decoration layout to
    ensure it always has a close button and nothing else. Set
    `property@HeaderBar:show-start-title-buttons` and
    `property@HeaderBar:show-end-title-buttons` to `FALSE` to remove it if it's
    unwanted.
    
    ## Navigation View Integration
    
    When placed inside an `class@NavigationPage`, [adw.header_bar.HeaderBar] will display the
    page title instead of window title.
    
    When used together with `class@NavigationView` or `class@NavigationSplitView`,
    it will also display a back button that can be used to go back to the previous
    page. The button also has a context menu, allowing to pop multiple pages at
    once, potentially across multiple navigation views.
    
    Set `property@HeaderBar:show-back-button` to `FALSE` to disable this behavior
    in rare scenarios where it's unwanted.
    
    ## Split View Integration
    
    When placed inside `class@NavigationSplitView` or `class@OverlaySplitView`,
    [adw.header_bar.HeaderBar] will automatically hide the title buttons other than at the
    edges of the window.
    
    ## Centering Policy
    
    `property@HeaderBar:centering-policy` allows to enforce strict centering of
    the title widget. This can be useful for entries inside `class@Clamp`.
    
    ## Title Buttons
    
    Unlike [gtk.header_bar.HeaderBar], [adw.header_bar.HeaderBar] allows to toggle title button
    visibility for each side individually, using the
    `property@HeaderBar:show-start-title-buttons` and
    `property@HeaderBar:show-end-title-buttons` properties.
    
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
    
    [adw.header_bar.HeaderBar]'s CSS node is called `headerbar`. It contains a `windowhandle`
    subnode, which contains a `box` subnode, which contains three `widget`
    subnodes at the start, center and end of the header bar. The start and end
    subnotes contain a `box` subnode with the `.start` and `.end` style classes
    respectively, and the center node contains a node that represents the title.
    
    Each of the boxes contains a `windowcontrols` subnode, see
    [gtk.window_controls.WindowControls] for details, as well as other children.
    
    When `property@HeaderBar:show-back-button` is `TRUE`, the start box also
    contains a node with the name `widget` that contains a node with the name
    `button` and `.back` style class.
    
    ## Accessibility
    
    [adw.header_bar.HeaderBar] uses the [gtk.types.AccessibleRole.Group] role.
*/
class HeaderBar : gtk.widget.Widget
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
    return cast(void function())adw_header_bar_get_type != &gidSymbolNotFound ? adw_header_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override HeaderBar self()
  {
    return this;
  }

  /**
      Get `centeringPolicy` property.
      Returns: The policy for aligning the center widget.
  */
  @property adw.types.CenteringPolicy centeringPolicy()
  {
    return getCenteringPolicy();
  }

  /**
      Set `centeringPolicy` property.
      Params:
        propval = The policy for aligning the center widget.
  */
  @property void centeringPolicy(adw.types.CenteringPolicy propval)
  {
    return setCenteringPolicy(propval);
  }

  /**
      Get `decorationLayout` property.
      Returns: The decoration layout for buttons.
        
        If this property is not set, the
        `property@Gtk.Settings:gtk-decoration-layout` setting is used.
        
        The format of the string is button names, separated by commas. A colon
        separates the buttons that should appear at the start from those at the
        end. Recognized button names are minimize, maximize, close and icon (the
        window icon).
        
        For example, “icon:minimize,maximize,close” specifies an icon at the start,
        and minimize, maximize and close buttons at the end.
  */
  @property string decorationLayout()
  {
    return getDecorationLayout();
  }

  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for buttons.
          
          If this property is not set, the
          `property@Gtk.Settings:gtk-decoration-layout` setting is used.
          
          The format of the string is button names, separated by commas. A colon
          separates the buttons that should appear at the start from those at the
          end. Recognized button names are minimize, maximize, close and icon (the
          window icon).
          
          For example, “icon:minimize,maximize,close” specifies an icon at the start,
          and minimize, maximize and close buttons at the end.
  */
  @property void decorationLayout(string propval)
  {
    return setDecorationLayout(propval);
  }

  /**
      Get `showBackButton` property.
      Returns: Whether the header bar can show the back button.
        
        The back button will never be shown unless the header bar is placed inside an
        `class@NavigationView`. Usually, there is no reason to set this to `FALSE`.
  */
  @property bool showBackButton()
  {
    return getShowBackButton();
  }

  /**
      Set `showBackButton` property.
      Params:
        propval = Whether the header bar can show the back button.
          
          The back button will never be shown unless the header bar is placed inside an
          `class@NavigationView`. Usually, there is no reason to set this to `FALSE`.
  */
  @property void showBackButton(bool propval)
  {
    return setShowBackButton(propval);
  }

  /**
      Get `showEndTitleButtons` property.
      Returns: Whether to show title buttons at the end of the header bar.
        
        See `property@HeaderBar:show-start-title-buttons` for the other side.
        
        Which buttons are actually shown and where is determined by the
        `property@HeaderBar:decoration-layout` property, and by the state of the
        window (e.g. a close button will not be shown if the window can't be
        closed).
  */
  @property bool showEndTitleButtons()
  {
    return getShowEndTitleButtons();
  }

  /**
      Set `showEndTitleButtons` property.
      Params:
        propval = Whether to show title buttons at the end of the header bar.
          
          See `property@HeaderBar:show-start-title-buttons` for the other side.
          
          Which buttons are actually shown and where is determined by the
          `property@HeaderBar:decoration-layout` property, and by the state of the
          window (e.g. a close button will not be shown if the window can't be
          closed).
  */
  @property void showEndTitleButtons(bool propval)
  {
    return setShowEndTitleButtons(propval);
  }

  /**
      Get `showStartTitleButtons` property.
      Returns: Whether to show title buttons at the start of the header bar.
        
        See `property@HeaderBar:show-end-title-buttons` for the other side.
        
        Which buttons are actually shown and where is determined by the
        `property@HeaderBar:decoration-layout` property, and by the state of the
        window (e.g. a close button will not be shown if the window can't be
        closed).
  */
  @property bool showStartTitleButtons()
  {
    return getShowStartTitleButtons();
  }

  /**
      Set `showStartTitleButtons` property.
      Params:
        propval = Whether to show title buttons at the start of the header bar.
          
          See `property@HeaderBar:show-end-title-buttons` for the other side.
          
          Which buttons are actually shown and where is determined by the
          `property@HeaderBar:decoration-layout` property, and by the state of the
          window (e.g. a close button will not be shown if the window can't be
          closed).
  */
  @property void showStartTitleButtons(bool propval)
  {
    return setShowStartTitleButtons(propval);
  }

  /**
      Get `showTitle` property.
      Returns: Whether the title widget should be shown.
  */
  @property bool showTitle()
  {
    return getShowTitle();
  }

  /**
      Set `showTitle` property.
      Params:
        propval = Whether the title widget should be shown.
  */
  @property void showTitle(bool propval)
  {
    return setShowTitle(propval);
  }

  /**
      Get `titleWidget` property.
      Returns: The title widget to display.
        
        When set to `NULL`, the header bar will display the title of the window it
        is contained in.
        
        To use a different title, use `class@WindowTitle`:
        
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
  @property gtk.widget.Widget titleWidget()
  {
    return getTitleWidget();
  }

  /**
      Set `titleWidget` property.
      Params:
        propval = The title widget to display.
          
          When set to `NULL`, the header bar will display the title of the window it
          is contained in.
          
          To use a different title, use `class@WindowTitle`:
          
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
  @property void titleWidget(gtk.widget.Widget propval)
  {
    return setTitleWidget(propval);
  }

  /**
      Creates a new [adw.header_bar.HeaderBar].
      Returns: the newly created [adw.header_bar.HeaderBar].
  */
  this()
  {
    GtkWidget* _cretval;
    _cretval = adw_header_bar_new();
    this(_cretval, No.Take);
  }

  /**
      Gets the policy for aligning the center widget.
      Returns: the centering policy
  */
  adw.types.CenteringPolicy getCenteringPolicy()
  {
    AdwCenteringPolicy _cretval;
    _cretval = adw_header_bar_get_centering_policy(cast(AdwHeaderBar*)this._cPtr);
    adw.types.CenteringPolicy _retval = cast(adw.types.CenteringPolicy)_cretval;
    return _retval;
  }

  /**
      Gets the decoration layout for self.
      Returns: the decoration layout
  */
  string getDecorationLayout()
  {
    const(char)* _cretval;
    _cretval = adw_header_bar_get_decoration_layout(cast(AdwHeaderBar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether self can show the back button.
      Returns: whether to show the back button
  */
  bool getShowBackButton()
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_back_button(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to show title buttons at the end of self.
      Returns: `TRUE` if title buttons at the end are shown
  */
  bool getShowEndTitleButtons()
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_end_title_buttons(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether to show title buttons at the start of self.
      Returns: `TRUE` if title buttons at the start are shown
  */
  bool getShowStartTitleButtons()
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_start_title_buttons(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the title widget should be shown.
      Returns: whether the title widget should be shown.
  */
  bool getShowTitle()
  {
    bool _retval;
    _retval = cast(bool)adw_header_bar_get_show_title(cast(AdwHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Gets the title widget widget of self.
      Returns: the title widget
  */
  gtk.widget.Widget getTitleWidget()
  {
    GtkWidget* _cretval;
    _cretval = adw_header_bar_get_title_widget(cast(AdwHeaderBar*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Adds child to self, packed with reference to the end of self.
  
      Params:
        child = the widget to be added to self
  */
  void packEnd(gtk.widget.Widget child)
  {
    adw_header_bar_pack_end(cast(AdwHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds child to self, packed with reference to the start of the self.
  
      Params:
        child = the widget to be added to self
  */
  void packStart(gtk.widget.Widget child)
  {
    adw_header_bar_pack_start(cast(AdwHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child from self.
      
      The child must have been added with [adw.header_bar.HeaderBar.packStart],
      [adw.header_bar.HeaderBar.packEnd] or `propertyHeaderBar:title-widget`.
  
      Params:
        child = the child to remove
  */
  void remove(gtk.widget.Widget child)
  {
    adw_header_bar_remove(cast(AdwHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the policy for aligning the center widget.
  
      Params:
        centeringPolicy = the centering policy
  */
  void setCenteringPolicy(adw.types.CenteringPolicy centeringPolicy)
  {
    adw_header_bar_set_centering_policy(cast(AdwHeaderBar*)this._cPtr, centeringPolicy);
  }

  /**
      Sets the decoration layout for self.
      
      If this property is not set, the
      `propertyGtk.Settings:gtk-decoration-layout` setting is used.
      
      The format of the string is button names, separated by commas. A colon
      separates the buttons that should appear at the start from those at the end.
      Recognized button names are minimize, maximize, close and icon (the window
      icon).
      
      For example, “icon:minimize,maximize,close” specifies an icon at the start,
      and minimize, maximize and close buttons at the end.
  
      Params:
        layout = a decoration layout
  */
  void setDecorationLayout(string layout = null)
  {
    const(char)* _layout = layout.toCString(No.Alloc);
    adw_header_bar_set_decoration_layout(cast(AdwHeaderBar*)this._cPtr, _layout);
  }

  /**
      Sets whether self can show the back button.
      
      The back button will never be shown unless the header bar is placed inside an
      `classNavigationView`. Usually, there is no reason to set it to `FALSE`.
  
      Params:
        showBackButton = whether to show the back button
  */
  void setShowBackButton(bool showBackButton)
  {
    adw_header_bar_set_show_back_button(cast(AdwHeaderBar*)this._cPtr, showBackButton);
  }

  /**
      Sets whether to show title buttons at the end of self.
      
      See `propertyHeaderBar:show-start-title-buttons` for the other side.
      
      Which buttons are actually shown and where is determined by the
      `propertyHeaderBar:decoration-layout` property, and by the state of the
      window (e.g. a close button will not be shown if the window can't be closed).
  
      Params:
        setting = `TRUE` to show standard title buttons
  */
  void setShowEndTitleButtons(bool setting)
  {
    adw_header_bar_set_show_end_title_buttons(cast(AdwHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets whether to show title buttons at the start of self.
      
      See `propertyHeaderBar:show-end-title-buttons` for the other side.
      
      Which buttons are actually shown and where is determined by the
      `propertyHeaderBar:decoration-layout` property, and by the state of the
      window (e.g. a close button will not be shown if the window can't be closed).
  
      Params:
        setting = `TRUE` to show standard title buttons
  */
  void setShowStartTitleButtons(bool setting)
  {
    adw_header_bar_set_show_start_title_buttons(cast(AdwHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets whether the title widget should be shown.
  
      Params:
        showTitle = whether the title widget is visible
  */
  void setShowTitle(bool showTitle)
  {
    adw_header_bar_set_show_title(cast(AdwHeaderBar*)this._cPtr, showTitle);
  }

  /**
      Sets the title widget for self.
      
      When set to `NULL`, the header bar will display the title of the window it
      is contained in.
      
      To use a different title, use `classWindowTitle`:
      
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
  void setTitleWidget(gtk.widget.Widget titleWidget = null)
  {
    adw_header_bar_set_title_widget(cast(AdwHeaderBar*)this._cPtr, titleWidget ? cast(GtkWidget*)titleWidget._cPtr(No.Dup) : null);
  }
}
