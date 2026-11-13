/// Module for [WindowControls] class
module gtk.window_controls;

public import gid.basictypes;
import gid.gid;
import gobject.gid_builder;
import gtk.accessible;
import gtk.accessible_mixin;
import gtk.buildable;
import gtk.buildable_mixin;
import gtk.c.functions;
import gtk.c.types;
import gtk.constraint_target;
import gtk.constraint_target_mixin;
import gtk.types;
import gtk.widget;

/**
    Shows window frame controls.
    
    Typical window frame controls are minimize, maximize and close buttons,
    and the window icon.
    
    <picture>
      <source srcset="windowcontrols-dark.png" media="(prefers-color-scheme: dark)">
      <img alt="An example GtkWindowControls" src="windowcontrols.png">
    </picture>
    
    [gtk.window_controls.WindowControls] only displays start or end side of the controls (see
    [gtk.window_controls.WindowControls.side]), so it's intended to be always used
    in pair with another [gtk.window_controls.WindowControls] for the opposite side, for example:
    
    ```xml
    <object class="GtkBox">
      <child>
        <object class="GtkWindowControls">
          <property name="side">start</property>
        </object>
      </child>
    
      ...
    
      <child>
        <object class="GtkWindowControls">
          <property name="side">end</property>
        </object>
      </child>
    </object>
    ```
    
    # CSS nodes
    
    ```
    windowcontrols
    ├── [image.icon]
    ├── [button.minimize]
    ├── [button.maximize]
    ╰── [button.close]
    ```
    
    A [gtk.window_controls.WindowControls]' CSS node is called windowcontrols. It contains
    subnodes corresponding to each title button. Which of the title buttons
    exist and where they are placed exactly depends on the desktop environment
    and [gtk.window_controls.WindowControls.decorationLayout] value.
    
    When [gtk.window_controls.WindowControls.empty] is true, it gets the .empty
    style class.
    
    # Accessibility
    
    [gtk.window_controls.WindowControls] uses the [gtk.types.AccessibleRole.Group] role.
*/
class WindowControls : gtk.widget.Widget
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
    return cast(void function())gtk_window_controls_get_type != &gidSymbolNotFound ? gtk_window_controls_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkWindowControls";
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowControls self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gtk.window_controls.WindowControls]
      Returns: New builder object
  */
  static WindowControlsGidBuilder builder() nothrow
  {
    return new WindowControlsGidBuilder;
  }

  /**
      Get `decorationLayout` property.
      Returns: The decoration layout for window buttons.
        
        If this property is not set, the
        [gtk.settings.Settings.gtkDecorationLayout] setting is used.
  */
  @property string decorationLayout() nothrow
  {
    return getDecorationLayout();
  }

  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for window buttons.
          
          If this property is not set, the
          [gtk.settings.Settings.gtkDecorationLayout] setting is used.
  */
  @property void decorationLayout(string propval) nothrow
  {
    setDecorationLayout(propval);
  }

  /**
      Get `empty` property.
      Returns: Whether the widget has any window buttons.
  */
  @property bool empty() nothrow
  {
    return getEmpty();
  }

  /**
      Get `side` property.
      Returns: Whether the widget shows start or end side of the decoration layout.
        
        See `property@Gtk.WindowControls:decoration_layout`.
  */
  @property gtk.types.PackType side() nothrow
  {
    return getSide();
  }

  /**
      Set `side` property.
      Params:
        propval = Whether the widget shows start or end side of the decoration layout.
          
          See `property@Gtk.WindowControls:decoration_layout`.
  */
  @property void side(gtk.types.PackType propval) nothrow
  {
    setSide(propval);
  }

  /**
      Get `useNativeControls` property.
      Returns: Whether to show platform native close/minimize/maximize buttons.
        
        For macOS, the [gtk.header_bar.HeaderBar.decorationLayout] property
        controls the use of native window controls.
        
        On other platforms, this option has no effect.
        
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
          
          For macOS, the [gtk.header_bar.HeaderBar.decorationLayout] property
          controls the use of native window controls.
          
          On other platforms, this option has no effect.
          
          See also [Using GTK on Apple macOS](osx.html?native-window-controls).
  */
  @property void useNativeControls(bool propval) nothrow
  {
    setUseNativeControls(propval);
  }

  /**
      Creates a new [gtk.window_controls.WindowControls].
  
      Params:
        side = the side
      Returns: a new [gtk.window_controls.WindowControls]
  */
  this(gtk.types.PackType side) nothrow
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_controls_new(side);
    this(_cretval, No.Take);
  }

  /**
      Gets the decoration layout of this window controls widget
      Returns: the decoration layout
  */
  string getDecorationLayout() nothrow
  {
    const(char)* _cretval;
    _cretval = gtk_window_controls_get_decoration_layout(cast(GtkWindowControls*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the widget has any window buttons.
      Returns: true if the widget has window buttons
  */
  bool getEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_controls_get_empty(cast(GtkWindowControls*)this._cPtr);
    return _retval;
  }

  /**
      Gets the side to which this window controls widget belongs.
      Returns: the side
  */
  gtk.types.PackType getSide() nothrow
  {
    GtkPackType _cretval;
    _cretval = gtk_window_controls_get_side(cast(GtkWindowControls*)this._cPtr);
    gtk.types.PackType _retval = cast(gtk.types.PackType)_cretval;
    return _retval;
  }

  /**
      Returns whether platform native window controls are shown.
      Returns: true if native window controls are shown
  */
  bool getUseNativeControls() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_window_controls_get_use_native_controls(cast(GtkWindowControls*)this._cPtr);
    return _retval;
  }

  /**
      Sets the decoration layout for the title buttons.
      
      This overrides the [gtk.settings.Settings.gtkDecorationLayout]
      setting.
      
      The format of the string is button names, separated by commas.
      A colon separates the buttons that should appear on the left
      from those on the right. Recognized button names are minimize,
      maximize, close and icon (the window icon).
      
      For example, “icon:minimize,maximize,close” specifies a icon
      on the left, and minimize, maximize and close buttons on the right.
      
      If [gtk.window_controls.WindowControls.side] value is [gtk.types.PackType.Start],
      self will display the part before the colon, otherwise after that.
  
      Params:
        layout = a decoration layout, or `NULL` to unset the layout
  */
  void setDecorationLayout(string layout = null) nothrow
  {
    const(char)* _layout = layout.toCString!(No.Malloc, Yes.Nullable);
    gtk_window_controls_set_decoration_layout(cast(GtkWindowControls*)this._cPtr, _layout);
  }

  /**
      Determines which part of decoration layout
      the window controls widget uses.
      
      See [gtk.window_controls.WindowControls.decorationLayout].
  
      Params:
        side = a side
  */
  void setSide(gtk.types.PackType side) nothrow
  {
    gtk_window_controls_set_side(cast(GtkWindowControls*)this._cPtr, side);
  }

  /**
      Sets whether platform native window controls are used.
      
      This option shows the "stoplight" buttons on macOS.
      For Linux, this option has no effect.
      
      See also [Using GTK on Apple macOS](osx.html?native-window-controls).
  
      Params:
        setting = true to show native window controls
  */
  void setUseNativeControls(bool setting) nothrow
  {
    gtk_window_controls_set_use_native_controls(cast(GtkWindowControls*)this._cPtr, setting);
  }
}

/// Fluent builder implementation template for [gtk.window_controls.WindowControls]
class WindowControlsGidBuilderImpl(T) : gtk.widget.WidgetGidBuilderImpl!T
{


  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for window buttons.
          
          If this property is not set, the
          [gtk.settings.Settings.gtkDecorationLayout] setting is used.
      Returns: Builder instance for fluent chaining
  */
  T decorationLayout(string propval) nothrow
  {
    return setProperty("decoration-layout", propval);
  }

  /**
      Set `side` property.
      Params:
        propval = Whether the widget shows start or end side of the decoration layout.
          
          See `property@Gtk.WindowControls:decoration_layout`.
      Returns: Builder instance for fluent chaining
  */
  T side(gtk.types.PackType propval) nothrow
  {
    return setProperty("side", propval);
  }

  /**
      Set `useNativeControls` property.
      Params:
        propval = Whether to show platform native close/minimize/maximize buttons.
          
          For macOS, the [gtk.header_bar.HeaderBar.decorationLayout] property
          controls the use of native window controls.
          
          On other platforms, this option has no effect.
          
          See also [Using GTK on Apple macOS](osx.html?native-window-controls).
      Returns: Builder instance for fluent chaining
  */
  T useNativeControls(bool propval) nothrow
  {
    return setProperty("use-native-controls", propval);
  }
}

/// Fluent builder for [gtk.window_controls.WindowControls]
final class WindowControlsGidBuilder : WindowControlsGidBuilderImpl!WindowControlsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  WindowControls build() nothrow
  {
    return new WindowControls(cast(void*)createGObject(WindowControls._getGType), Yes.Take);
  }
}
