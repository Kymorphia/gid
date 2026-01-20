/// Module for [WindowControls] class
module gtk.window_controls;

import gid.gid;
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
    [gtk.window_controls.WindowControls] shows window frame controls.
    
    Typical window frame controls are minimize, maximize and close buttons,
    and the window icon.
    
    ![An example GtkWindowControls](windowcontrols.png)
    
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
    and `property@Gtk.WindowControls:decoration-layout` value.
    
    When [gtk.window_controls.WindowControls.empty] is true, it gets the .empty
    style class.
    
    # Accessibility
    
    [gtk.window_controls.WindowControls] uses the [gtk.types.AccessibleRole.Group] role.
*/
class WindowControls : gtk.widget.Widget
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
    return cast(void function())gtk_window_controls_get_type != &gidSymbolNotFound ? gtk_window_controls_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override WindowControls self()
  {
    return this;
  }

  /**
      Get `decorationLayout` property.
      Returns: The decoration layout for window buttons.
        
        If this property is not set, the
        `property@Gtk.Settings:gtk-decoration-layout` setting is used.
  */
  @property string decorationLayout()
  {
    return getDecorationLayout();
  }

  /**
      Set `decorationLayout` property.
      Params:
        propval = The decoration layout for window buttons.
          
          If this property is not set, the
          `property@Gtk.Settings:gtk-decoration-layout` setting is used.
  */
  @property void decorationLayout(string propval)
  {
    return setDecorationLayout(propval);
  }

  /**
      Get `empty` property.
      Returns: Whether the widget has any window buttons.
  */
  @property bool empty()
  {
    return getEmpty();
  }

  /**
      Get `side` property.
      Returns: Whether the widget shows start or end side of the decoration layout.
        
        See `property@Gtk.WindowControls:decoration_layout`.
  */
  @property gtk.types.PackType side()
  {
    return getSide();
  }

  /**
      Set `side` property.
      Params:
        propval = Whether the widget shows start or end side of the decoration layout.
          
          See `property@Gtk.WindowControls:decoration_layout`.
  */
  @property void side(gtk.types.PackType propval)
  {
    return setSide(propval);
  }

  /**
      Creates a new [gtk.window_controls.WindowControls].
  
      Params:
        side = the side
      Returns: a new [gtk.window_controls.WindowControls].
  */
  this(gtk.types.PackType side)
  {
    GtkWidget* _cretval;
    _cretval = gtk_window_controls_new(side);
    this(_cretval, No.Take);
  }

  /**
      Gets the decoration layout of this [gtk.window_controls.WindowControls].
      Returns: the decoration layout or null if it is unset
  */
  string getDecorationLayout()
  {
    const(char)* _cretval;
    _cretval = gtk_window_controls_get_decoration_layout(cast(GtkWindowControls*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets whether the widget has any window buttons.
      Returns: true if the widget has window buttons, otherwise false
  */
  bool getEmpty()
  {
    bool _retval;
    _retval = cast(bool)gtk_window_controls_get_empty(cast(GtkWindowControls*)this._cPtr);
    return _retval;
  }

  /**
      Gets the side to which this [gtk.window_controls.WindowControls] instance belongs.
      Returns: the side
  */
  gtk.types.PackType getSide()
  {
    GtkPackType _cretval;
    _cretval = gtk_window_controls_get_side(cast(GtkWindowControls*)this._cPtr);
    gtk.types.PackType _retval = cast(gtk.types.PackType)_cretval;
    return _retval;
  }

  /**
      Sets the decoration layout for the title buttons.
      
      This overrides the `propertyGtk.Settings:gtk-decoration-layout`
      setting.
      
      The format of the string is button names, separated by commas.
      A colon separates the buttons that should appear on the left
      from those on the right. Recognized button names are minimize,
      maximize, close and icon (the window icon).
      
      For example, “icon:minimize,maximize,close” specifies a icon
      on the left, and minimize, maximize and close buttons on the right.
      
      If [gtk.window_controls.WindowControls.side] value is GTK_PACK_START, self
      will display the part before the colon, otherwise after that.
  
      Params:
        layout = a decoration layout, or null to unset the layout
  */
  void setDecorationLayout(string layout = null)
  {
    const(char)* _layout = layout.toCString(No.Alloc);
    gtk_window_controls_set_decoration_layout(cast(GtkWindowControls*)this._cPtr, _layout);
  }

  /**
      Determines which part of decoration layout the [gtk.window_controls.WindowControls] uses.
      
      See `propertyGtk.WindowControls:decoration-layout`.
  
      Params:
        side = a side
  */
  void setSide(gtk.types.PackType side)
  {
    gtk_window_controls_set_side(cast(GtkWindowControls*)this._cPtr, side);
  }
}
