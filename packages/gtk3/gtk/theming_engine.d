/// Module for [ThemingEngine] class
module gtk.theming_engine;

import gdk.rgba;
import gdk.screen;
import gid.gid;
import gobject.object;
import gobject.value;
import gtk.border;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;
import gtk.widget_path;
import pango.font_description;

/**
    #GtkThemingEngine was the object used for rendering themed content
    in GTK+ widgets. It used to allow overriding GTK+'s default
    implementation of rendering functions by allowing engines to be
    loaded as modules.
    
    #GtkThemingEngine has been deprecated in GTK+ 3.14 and will be
    ignored for rendering. The advancements in CSS theming are good
    enough to allow themers to achieve their goals without the need
    to modify source code.
*/
class ThemingEngine : gobject.object.ObjectWrap
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
    return cast(void function())gtk_theming_engine_get_type != &gidSymbolNotFound ? gtk_theming_engine_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ThemingEngine self()
  {
    return this;
  }

  /**
      Loads and initializes a theming engine module from the
      standard directories.
  
      Params:
        name = Theme engine name to load
      Returns: A theming engine, or null if
        the engine name doesn’t exist.
  */
  static gtk.theming_engine.ThemingEngine load(string name)
  {
    GtkThemingEngine* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = gtk_theming_engine_load(_name);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.theming_engine.ThemingEngine)(cast(GtkThemingEngine*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the background color for a given state.
  
      Params:
        state = state to retrieve the color for
        color = return value for the background color
  */
  void getBackgroundColor(gtk.types.StateFlags state, out gdk.rgba.RGBA color)
  {
    GdkRGBA _color;
    gtk_theming_engine_get_background_color(cast(GtkThemingEngine*)this._cPtr, state, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
  }

  /**
      Gets the border for a given state as a #GtkBorder.
  
      Params:
        state = state to retrieve the border for
        border = return value for the border settings
  */
  void getBorder(gtk.types.StateFlags state, out gtk.border.Border border)
  {
    GtkBorder _border;
    gtk_theming_engine_get_border(cast(GtkThemingEngine*)this._cPtr, state, &_border);
    border = new gtk.border.Border(cast(void*)&_border, No.Take);
  }

  /**
      Gets the border color for a given state.
  
      Params:
        state = state to retrieve the color for
        color = return value for the border color
  */
  void getBorderColor(gtk.types.StateFlags state, out gdk.rgba.RGBA color)
  {
    GdkRGBA _color;
    gtk_theming_engine_get_border_color(cast(GtkThemingEngine*)this._cPtr, state, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
  }

  /**
      Gets the foreground color for a given state.
  
      Params:
        state = state to retrieve the color for
        color = return value for the foreground color
  */
  void getColor(gtk.types.StateFlags state, out gdk.rgba.RGBA color)
  {
    GdkRGBA _color;
    gtk_theming_engine_get_color(cast(GtkThemingEngine*)this._cPtr, state, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
  }

  /**
      Returns the widget direction used for rendering.
      Returns: the widget direction
  
      Deprecated: Use [gtk.theming_engine.ThemingEngine.getState] and
          check for #GTK_STATE_FLAG_DIR_LTR and
          #GTK_STATE_FLAG_DIR_RTL instead.
  */
  gtk.types.TextDirection getDirection()
  {
    GtkTextDirection _cretval;
    _cretval = gtk_theming_engine_get_direction(cast(GtkThemingEngine*)this._cPtr);
    gtk.types.TextDirection _retval = cast(gtk.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Returns the font description for a given state.
  
      Params:
        state = state to retrieve the font for
      Returns: the #PangoFontDescription for the given
                 state. This object is owned by GTK+ and should not be
                 freed.
  
      Deprecated: Use [gtk.theming_engine.ThemingEngine.get]
  */
  pango.font_description.FontDescription getFont(gtk.types.StateFlags state)
  {
    const(PangoFontDescription)* _cretval;
    _cretval = gtk_theming_engine_get_font(cast(GtkThemingEngine*)this._cPtr, state);
    auto _retval = _cretval ? new pango.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the widget direction used for rendering.
      Returns: the widget direction
  */
  gtk.types.JunctionSides getJunctionSides()
  {
    GtkJunctionSides _cretval;
    _cretval = gtk_theming_engine_get_junction_sides(cast(GtkThemingEngine*)this._cPtr);
    gtk.types.JunctionSides _retval = cast(gtk.types.JunctionSides)_cretval;
    return _retval;
  }

  /**
      Gets the margin for a given state as a #GtkBorder.
  
      Params:
        state = state to retrieve the border for
        margin = return value for the margin settings
  */
  void getMargin(gtk.types.StateFlags state, out gtk.border.Border margin)
  {
    GtkBorder _margin;
    gtk_theming_engine_get_margin(cast(GtkThemingEngine*)this._cPtr, state, &_margin);
    margin = new gtk.border.Border(cast(void*)&_margin, No.Take);
  }

  /**
      Gets the padding for a given state as a #GtkBorder.
  
      Params:
        state = state to retrieve the padding for
        padding = return value for the padding settings
  */
  void getPadding(gtk.types.StateFlags state, out gtk.border.Border padding)
  {
    GtkBorder _padding;
    gtk_theming_engine_get_padding(cast(GtkThemingEngine*)this._cPtr, state, &_padding);
    padding = new gtk.border.Border(cast(void*)&_padding, No.Take);
  }

  /**
      Returns the widget path used for style matching.
      Returns: A #GtkWidgetPath
  */
  gtk.widget_path.WidgetPath getPath()
  {
    const(GtkWidgetPath)* _cretval;
    _cretval = gtk_theming_engine_get_path(cast(GtkThemingEngine*)this._cPtr);
    auto _retval = _cretval ? new gtk.widget_path.WidgetPath(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  alias getProperty = gobject.object.ObjectWrap.getProperty;

  /**
      Gets a property value as retrieved from the style settings that apply
      to the currently rendered element.
  
      Params:
        property = the property name
        state = state to retrieve the value for
        value = return location for the property value,
                  you must free this memory using [gobject.value.Value.unset] once you are
                  done with it.
  */
  void getProperty(string property, gtk.types.StateFlags state, out gobject.value.Value value)
  {
    const(char)* _property = property.toCString(No.Alloc);
    GValue _value;
    gtk_theming_engine_get_property(cast(GtkThemingEngine*)this._cPtr, _property, state, &_value);
    value = new gobject.value.Value(cast(void*)&_value, Yes.Take);
  }

  /**
      Returns the #GdkScreen to which engine currently rendering to.
      Returns: a #GdkScreen, or null.
  */
  gdk.screen.Screen getScreen()
  {
    GdkScreen* _cretval;
    _cretval = gtk_theming_engine_get_screen(cast(GtkThemingEngine*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      returns the state used when rendering.
      Returns: the state flags
  */
  gtk.types.StateFlags getState()
  {
    GtkStateFlags _cretval;
    _cretval = gtk_theming_engine_get_state(cast(GtkThemingEngine*)this._cPtr);
    gtk.types.StateFlags _retval = cast(gtk.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Gets the value for a widget style property.
  
      Params:
        propertyName = the name of the widget style property
        value = Return location for the property value, free with
                  [gobject.value.Value.unset] after use.
  */
  void getStyleProperty(string propertyName, out gobject.value.Value value)
  {
    const(char)* _propertyName = propertyName.toCString(No.Alloc);
    GValue _value;
    gtk_theming_engine_get_style_property(cast(GtkThemingEngine*)this._cPtr, _propertyName, &_value);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
  }

  /**
      Returns true if the currently rendered contents have
      defined the given class name.
  
      Params:
        styleClass = class name to look up
      Returns: true if engine has class_name defined
  */
  bool hasClass(string styleClass)
  {
    bool _retval;
    const(char)* _styleClass = styleClass.toCString(No.Alloc);
    _retval = cast(bool)gtk_theming_engine_has_class(cast(GtkThemingEngine*)this._cPtr, _styleClass);
    return _retval;
  }

  /**
      Returns true if the currently rendered contents have the
      region defined. If flags_return is not null, it is set
      to the flags affecting the region.
  
      Params:
        styleRegion = a region name
        flags = return location for region flags
      Returns: true if region is defined
  */
  bool hasRegion(string styleRegion, out gtk.types.RegionFlags flags)
  {
    bool _retval;
    const(char)* _styleRegion = styleRegion.toCString(No.Alloc);
    _retval = cast(bool)gtk_theming_engine_has_region(cast(GtkThemingEngine*)this._cPtr, _styleRegion, &flags);
    return _retval;
  }

  /**
      Looks up and resolves a color name in the current style’s color map.
  
      Params:
        colorName = color name to lookup
        color = Return location for the looked up color
      Returns: true if color_name was found and resolved, false otherwise
  */
  bool lookupColor(string colorName, out gdk.rgba.RGBA color)
  {
    bool _retval;
    const(char)* _colorName = colorName.toCString(No.Alloc);
    GdkRGBA _color;
    _retval = cast(bool)gtk_theming_engine_lookup_color(cast(GtkThemingEngine*)this._cPtr, _colorName, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
    return _retval;
  }

  /**
      Returns true if there is a transition animation running for the
      current region (see [gtk.style_context.StyleContext.pushAnimatableRegion]).
      
      If progress is not null, the animation progress will be returned
      there, 0.0 means the state is closest to being false, while 1.0 means
      it’s closest to being true. This means transition animations will
      run from 0 to 1 when state is being set to true and from 1 to 0 when
      it’s being set to false.
  
      Params:
        state = a widget state
        progress = return location for the transition progress
      Returns: true if there is a running transition animation for state.
  
      Deprecated: Always returns false
  */
  bool stateIsRunning(gtk.types.StateType state, out double progress)
  {
    bool _retval;
    _retval = cast(bool)gtk_theming_engine_state_is_running(cast(GtkThemingEngine*)this._cPtr, state, cast(double*)&progress);
    return _retval;
  }
}
