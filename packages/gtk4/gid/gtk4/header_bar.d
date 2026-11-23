/// Module for [HeaderBar] class
module gid.gtk4.header_bar;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.accessible;
import gid.gtk4.accessible_mixin;
import gid.gtk4.buildable;
import gid.gtk4.buildable_mixin;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.constraint_target;
import gid.gtk4.constraint_target_mixin;
import gid.gtk4.types;
import gid.gtk4.widget;

/**
    Creates a custom titlebar for a window.
    
    <picture>
      <source srcset="headerbar-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkHeaderBar" src="headerbar.png">
    </picture>
    
    [gid.gtk4.header_bar.HeaderBar] is similar to a horizontal [gid.gtk4.center_box.CenterBox]. It allows
    children to be placed at the start or the end. In addition, it allows
    the window title to be displayed. The title will be centered with respect
    to the width of the box, even if the children at either side take up
    different amounts of space.
    
    [gid.gtk4.header_bar.HeaderBar] can add typical window frame controls, such as minimize,
    maximize and close buttons, or the window icon.
    
    For these reasons, [gid.gtk4.header_bar.HeaderBar] is the natural choice for use as the
    custom titlebar widget of a [gid.gtk4.window.Window] (see [gid.gtk4.window.Window.setTitlebar]),
    as it gives features typical of titlebars while allowing the addition of
    child widgets.
    
    ## GtkHeaderBar as GtkBuildable
    
    The [gid.gtk4.header_bar.HeaderBar] implementation of the [gid.gtk4.buildable.Buildable] interface supports
    adding children at the start or end sides by specifying “start” or “end” as
    the “type” attribute of a `<child>` element, or setting the title widget by
    specifying “title” value.
    
    By default the [gid.gtk4.header_bar.HeaderBar] uses a [gid.gtk4.label.Label] displaying the title of the
    window it is contained in as the title widget, equivalent to the following
    UI definition:
    
    ```xml
    <object class="GtkHeaderBar">
      <property name="title-widget">
        <object class="GtkLabel">
          <property name="label" translatable="yes">Label</property>
          <property name="single-line-mode">True</property>
          <property name="ellipsize">end</property>
          <property name="width-chars">5</property>
          <style>
            <class name="title"/>
          </style>
        </object>
      </property>
    </object>
    ```
    
    # CSS nodes
    
    ```
    headerbar
    ╰── windowhandle
        ╰── box
            ├── box.start
            │   ├── windowcontrols.start
            │   ╰── [other children]
            ├── [Title Widget]
            ╰── box.end
                ├── [other children]
                ╰── windowcontrols.end
    ```
    
    A [gid.gtk4.header_bar.HeaderBar]'s CSS node is called `headerbar`. It contains a `windowhandle`
    subnode, which contains a `box` subnode, which contains two `box` subnodes at
    the start and end of the header bar, as well as a center node that represents
    the title.
    
    Each of the boxes contains a `windowcontrols` subnode, see
    [gid.gtk4.window_controls.WindowControls] for details, as well as other children.
    
    # Accessibility
    
    [gid.gtk4.header_bar.HeaderBar] uses the [gid.gtk4.types.AccessibleRole.Group] role.
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
    return cast(void function())gtk_header_bar_get_type != &gidSymbolNotFound ? gtk_header_bar_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkHeaderBar";
  }

  /** Returns `this`, for use in `with` statements. */
  override HeaderBar self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk4.header_bar.HeaderBar]
      Returns: New builder object
  */
  static HeaderBarGidBuilder builder() nothrow
  {
    return new HeaderBarGidBuilder;
  }

  /**
      Get `decorationLayout` property.
      Returns: The decoration layout for buttons.
        
        If this property is not set, the
        [gid.gtk4.settings.Settings.gtkDecorationLayout] setting is used.
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
  */
  @property void decorationLayout(string propval) nothrow
  {
    setDecorationLayout(propval);
  }

  /**
      Get `showTitleButtons` property.
      Returns: Whether to show title buttons like close, minimize, maximize.
        
        Which buttons are actually shown and where is determined
        by the [gid.gtk4.header_bar.HeaderBar.decorationLayout] property,
        and by the state of the window (e.g. a close button will not
        be shown if the window can't be closed).
  */
  @property bool showTitleButtons() nothrow
  {
    return getShowTitleButtons();
  }

  /**
      Set `showTitleButtons` property.
      Params:
        propval = Whether to show title buttons like close, minimize, maximize.
          
          Which buttons are actually shown and where is determined
          by the [gid.gtk4.header_bar.HeaderBar.decorationLayout] property,
          and by the state of the window (e.g. a close button will not
          be shown if the window can't be closed).
  */
  @property void showTitleButtons(bool propval) nothrow
  {
    setShowTitleButtons(propval);
  }

  /**
      Get `titleWidget` property.
      Returns: The title widget to display.
  */
  @property gid.gtk4.widget.Widget titleWidget() nothrow
  {
    return getTitleWidget();
  }

  /**
      Set `titleWidget` property.
      Params:
        propval = The title widget to display.
  */
  @property void titleWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    setTitleWidget(propval);
  }

  /**
      Get `useNativeControls` property.
      Returns: Whether to show platform native close/minimize/maximize buttons.
        
        For macOS, the [gid.gtk4.header_bar.HeaderBar.decorationLayout] property
        can be used to enable/disable controls.
        
        On Linux, this option has no effect.
        
        See also [Using GTK on Apple macOS](osx.html?native-window-controls).
  */
  @property bool useNativeControls() nothrow
  {
    return getUseNativeControls();
  }

  /**
      Set `useNativeControls` property.
      Params:
        propval = Whether to show platform native close/minimize/maximize buttons.
          
          For macOS, the [gid.gtk4.header_bar.HeaderBar.decorationLayout] property
          can be used to enable/disable controls.
          
          On Linux, this option has no effect.
          
          See also [Using GTK on Apple macOS](osx.html?native-window-controls).
  */
  @property void useNativeControls(bool propval) nothrow
  {
    setUseNativeControls(propval);
  }

  /**
      Creates a new [gid.gtk4.header_bar.HeaderBar] widget.
      Returns: a new [gid.gtk4.header_bar.HeaderBar]
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = gtk_header_bar_new();
      this(_cretval, No.Take);
    }
  }

  /**
      Gets the decoration layout of the header bar.
      Returns: the decoration layout
  */
  string getDecorationLayout() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_header_bar_get_decoration_layout(cast(GtkHeaderBar*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether this header bar shows the standard window
      title buttons.
      Returns: true if title buttons are shown
  */
  bool getShowTitleButtons() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_header_bar_get_show_title_buttons(cast(GtkHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Retrieves the title widget of the header bar.
      
      See [gid.gtk4.header_bar.HeaderBar.setTitleWidget].
      Returns: the title widget
  */
  gid.gtk4.widget.Widget getTitleWidget() nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_header_bar_get_title_widget(cast(GtkHeaderBar*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns whether this header bar shows platform
      native window controls.
      Returns: true if native window controls are shown
  */
  bool getUseNativeControls() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_header_bar_get_use_native_controls(cast(GtkHeaderBar*)this._cPtr);
    return _retval;
  }

  /**
      Adds a child to the header bar, packed with reference to the end.
  
      Params:
        child = the widget to be added to bar
  */
  void packEnd(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_header_bar_pack_end(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Adds a child to the header bar, packed with reference to the start.
  
      Params:
        child = the widget to be added to bar
  */
  void packStart(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_header_bar_pack_start(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Removes a child from the header bar.
      
      The child must have been added with
      [gid.gtk4.header_bar.HeaderBar.packStart],
      [gid.gtk4.header_bar.HeaderBar.packEnd] or
      [gid.gtk4.header_bar.HeaderBar.setTitleWidget].
  
      Params:
        child = the child to remove
  */
  void remove(gid.gtk4.widget.Widget child) nothrow
  {
    gtk_header_bar_remove(cast(GtkHeaderBar*)this._cPtr, child ? cast(GtkWidget*)child._cPtr(No.Dup) : null);
  }

  /**
      Sets the decoration layout for this header bar.
      
      This property overrides the
      [gid.gtk4.settings.Settings.gtkDecorationLayout] setting.
      
      There can be valid reasons for overriding the setting, such
      as a header bar design that does not allow for buttons to take
      room on the right, or only offers room for a single close button.
      Split header bars are another example for overriding the setting.
      
      The format of the string is button names, separated by commas.
      A colon separates the buttons that should appear on the left
      from those on the right. Recognized button names are minimize,
      maximize, close and icon (the window icon).
      
      For example, “icon:minimize,maximize,close” specifies an icon
      on the left, and minimize, maximize and close buttons on the right.
  
      Params:
        layout = a decoration layout
  */
  void setDecorationLayout(string layout = null) nothrow
  {
    const(char)* _layout = layout.toCString!(No.Malloc, Yes.Nullable);
    gtk_header_bar_set_decoration_layout(cast(GtkHeaderBar*)this._cPtr, _layout);
  }

  /**
      Sets whether this header bar shows the standard window
      title buttons.
  
      Params:
        setting = true to show standard title buttons
  */
  void setShowTitleButtons(bool setting) nothrow
  {
    gtk_header_bar_set_show_title_buttons(cast(GtkHeaderBar*)this._cPtr, setting);
  }

  /**
      Sets the title for the header bar.
      
      When set to `NULL`, the headerbar will display the title of
      the window it is contained in.
      
      The title should help a user identify the current view.
      To achieve the same style as the builtin title, use the
      “title” style class.
      
      You should set the title widget to `NULL`, for the window
      title label to be visible again.
  
      Params:
        titleWidget = a widget to use for a title
  */
  void setTitleWidget(gid.gtk4.widget.Widget titleWidget = null) nothrow
  {
    gtk_header_bar_set_title_widget(cast(GtkHeaderBar*)this._cPtr, titleWidget ? cast(GtkWidget*)titleWidget._cPtr(No.Dup) : null);
  }

  /**
      Sets whether this header bar shows native window controls.
      
      This option shows the "stoplight" buttons on macOS.
      For Linux, this option has no effect.
      
      See also [Using GTK on Apple macOS](osx.html?native-window-controls).
  
      Params:
        setting = true to show native window controls
  */
  void setUseNativeControls(bool setting) nothrow
  {
    gtk_header_bar_set_use_native_controls(cast(GtkHeaderBar*)this._cPtr, setting);
  }
}

/// Fluent builder implementation template for [gid.gtk4.header_bar.HeaderBar]
class HeaderBarGidBuilderImpl(T) : gid.gtk4.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for buttons.
          
          If this property is not set, the
          [gid.gtk4.settings.Settings.gtkDecorationLayout] setting is used.
      Returns: Builder instance for fluent chaining
  */
  T decorationLayout(string propval) nothrow
  {
    return setProperty("decoration-layout", propval);
  }

  /**
      Set `showTitleButtons` property.
      Params:
        propval = Whether to show title buttons like close, minimize, maximize.
          
          Which buttons are actually shown and where is determined
          by the [gid.gtk4.header_bar.HeaderBar.decorationLayout] property,
          and by the state of the window (e.g. a close button will not
          be shown if the window can't be closed).
      Returns: Builder instance for fluent chaining
  */
  T showTitleButtons(bool propval) nothrow
  {
    return setProperty("show-title-buttons", propval);
  }

  /**
      Set `titleWidget` property.
      Params:
        propval = The title widget to display.
      Returns: Builder instance for fluent chaining
  */
  T titleWidget(gid.gtk4.widget.Widget propval) nothrow
  {
    return setProperty("title-widget", propval);
  }

  /**
      Set `useNativeControls` property.
      Params:
        propval = Whether to show platform native close/minimize/maximize buttons.
          
          For macOS, the [gid.gtk4.header_bar.HeaderBar.decorationLayout] property
          can be used to enable/disable controls.
          
          On Linux, this option has no effect.
          
          See also [Using GTK on Apple macOS](osx.html?native-window-controls).
      Returns: Builder instance for fluent chaining
  */
  T useNativeControls(bool propval) nothrow
  {
    return setProperty("use-native-controls", propval);
  }
}

/// Fluent builder for [gid.gtk4.header_bar.HeaderBar]
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
