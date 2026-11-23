/// Module for [ThemingEngine] class
module gid.gtk3.theming_engine;

public import gid.core.basictypes;
import gid.cairo1.context;
import gid.cairo1.surface;
import gid.core.utils;
import gid.gdk3.rgba;
import gid.gdk3.screen;
import gid.gdkpixbuf2.pixbuf;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value;
import gid.gtk3.border;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.types;
import gid.gtk3.widget_path;
import gid.pango1.font_description;
import gid.pango1.layout;

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
class ThemingEngine : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gtk_theming_engine_get_type != &gidSymbolNotFound ? gtk_theming_engine_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkThemingEngine";
  }

  /** Returns `this`, for use in `with` statements. */
  override ThemingEngine self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.theming_engine.ThemingEngine]
      Returns: New builder object
  */
  static ThemingEngineGidBuilder builder() nothrow
  {
    return new ThemingEngineGidBuilder;
  }

  /**
      Get `name` property.
      Returns: The theming engine name, this name will be used when registering
        custom properties, for a theming engine named "Clearlooks" registering
        a "glossy" custom property, it could be referenced in the CSS file as
        
        ```
        -Clearlooks-glossy: true;
        ```
  */
  @property string name() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("name");
  }

  /**
      Loads and initializes a theming engine module from the
      standard directories.
  
      Params:
        name = Theme engine name to load
      Returns: A theming engine, or null if
        the engine name doesn’t exist.
  */
  static gid.gtk3.theming_engine.ThemingEngine load(string name) nothrow
  {
    GtkThemingEngine* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_theming_engine_load(_name);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.theming_engine.ThemingEngine)(cast(GtkThemingEngine*)_cretval, No.Take);
    return _retval;
  }

  /**
      Renders an area displaying activity, such as in #GtkSpinner,
                        or #GtkProgressBar.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderActivity` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderActivity(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderActivity)
      return;

    _klass.renderActivity(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders an arrow pointing to a certain direction.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        angle = 
        x = 
        y = 
        size = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderArrow` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderArrow(gid.cairo1.context.Context cr, double angle, double x, double y, double size)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderArrow)
      return;

    _klass.renderArrow(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, angle, x, y, size);
  }

  /**
      Renders the background area of a widget region.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderBackground` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderBackground(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderBackground)
      return;

    _klass.renderBackground(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders a checkmark, as in #GtkCheckButton.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderCheck` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderCheck(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderCheck)
      return;

    _klass.renderCheck(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders an element what will expose/expand part of
                        the UI, as in #GtkExpander.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderExpander` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderExpander(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderExpander)
      return;

    _klass.renderExpander(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders a extension to a box, usually a notebook tab.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
        gapSide = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderExtension` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderExtension(gid.cairo1.context.Context cr, double x, double y, double width, double height, gid.gtk3.types.PositionType gapSide)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderExtension)
      return;

    _klass.renderExtension(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height, gapSide);
  }

  /**
      Renders the focus indicator.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderFocus` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderFocus(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderFocus)
      return;

    _klass.renderFocus(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders the frame around a widget area.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderFrame` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderFrame(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderFrame)
      return;

    _klass.renderFrame(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders the frame around a widget area with a gap in it.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
        gapSide = 
        xy0Gap = 
        xy1Gap = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderFrameGap` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderFrameGap(gid.cairo1.context.Context cr, double x, double y, double width, double height, gid.gtk3.types.PositionType gapSide, double xy0Gap, double xy1Gap)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderFrameGap)
      return;

    _klass.renderFrameGap(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height, gapSide, xy0Gap, xy1Gap);
  }

  /**
      Renders a handle to drag UI elements, as in #GtkPaned.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderHandle` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderHandle(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderHandle)
      return;

    _klass.renderHandle(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders an icon given as a #GdkPixbuf.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        pixbuf = 
        x = 
        y = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderIcon` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderIcon(gid.cairo1.context.Context cr, gid.gdkpixbuf2.pixbuf.Pixbuf pixbuf, double x, double y)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderIcon)
      return;

    _klass.renderIcon(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, pixbuf ? cast(GdkPixbuf*)pixbuf._cPtr(No.Dup) : null, x, y);
  }

  /**
      Renders an icon given as a #cairo_surface_t.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        surface =  (modified in place, changes are seen by the caller)
        x = 
        y = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderIconSurface` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderIconSurface(gid.cairo1.context.Context cr, gid.cairo1.surface.Surface surface, double x, double y)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderIconSurface)
      return;

    _klass.renderIconSurface(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, surface ? cast(cairo_surface_t*)surface._cPtr(No.Dup) : null, x, y);
  }

  /**
      Renders a #PangoLayout
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        layout = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderLayout` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderLayout(gid.cairo1.context.Context cr, double x, double y, gid.pango1.layout.Layout layout)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderLayout)
      return;

    _klass.renderLayout(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, layout ? cast(PangoLayout*)layout._cPtr(No.Dup) : null);
  }

  /**
      Renders a line between two points.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x0 = 
        y0 = 
        x1 = 
        y1 = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderLine` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderLine(gid.cairo1.context.Context cr, double x0, double y0, double x1, double y1)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderLine)
      return;

    _klass.renderLine(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x0, y0, x1, y1);
  }

  /**
      Renders an option, as in #GtkRadioButton.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderOption` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderOption(gid.cairo1.context.Context cr, double x, double y, double width, double height)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderOption)
      return;

    _klass.renderOption(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height);
  }

  /**
      Renders a slider control, as in #GtkScale.
  
      Params:
        cr =  (modified in place, changes are seen by the caller)
        x = 
        y = 
        width = 
        height = 
        orientation = 
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncRenderSlider` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncRenderSlider(gid.cairo1.context.Context cr, double x, double y, double width, double height, gid.gtk3.types.Orientation orientation)
  {
    auto _klass = cast(GtkThemingEngineClass*)_vfuncClass;
    if (!_klass.renderSlider)
      return;

    _klass.renderSlider(cast(GtkThemingEngine*)this._cPtr, cr ? cast(cairo_t*)cr._cPtr(No.Dup) : null, x, y, width, height, orientation);
  }

  /**
      Gets the background color for a given state.
  
      Params:
        state = state to retrieve the color for
        color = return value for the background color
  */
  void getBackgroundColor(gid.gtk3.types.StateFlags state, out gid.gdk3.rgba.RGBA color) nothrow
  {
    gtk_theming_engine_get_background_color(cast(GtkThemingEngine*)this._cPtr, state, cast(GdkRGBA*)&color);
  }

  /**
      Gets the border for a given state as a #GtkBorder.
  
      Params:
        state = state to retrieve the border for
        border = return value for the border settings
  */
  void getBorder(gid.gtk3.types.StateFlags state, out gid.gtk3.border.Border border) nothrow
  {
    gtk_theming_engine_get_border(cast(GtkThemingEngine*)this._cPtr, state, cast(GtkBorder*)&border);
  }

  /**
      Gets the border color for a given state.
  
      Params:
        state = state to retrieve the color for
        color = return value for the border color
  */
  void getBorderColor(gid.gtk3.types.StateFlags state, out gid.gdk3.rgba.RGBA color) nothrow
  {
    gtk_theming_engine_get_border_color(cast(GtkThemingEngine*)this._cPtr, state, cast(GdkRGBA*)&color);
  }

  /**
      Gets the foreground color for a given state.
  
      Params:
        state = state to retrieve the color for
        color = return value for the foreground color
  */
  void getColor(gid.gtk3.types.StateFlags state, out gid.gdk3.rgba.RGBA color) nothrow
  {
    gtk_theming_engine_get_color(cast(GtkThemingEngine*)this._cPtr, state, cast(GdkRGBA*)&color);
  }

  /**
      Returns the widget direction used for rendering.
      Returns: the widget direction
  
      Deprecated: Use [gid.gtk3.theming_engine.ThemingEngine.getState] and
          check for #GTK_STATE_FLAG_DIR_LTR and
          #GTK_STATE_FLAG_DIR_RTL instead.
  */
  gid.gtk3.types.TextDirection getDirection() nothrow
  {
    GtkTextDirection _cretval;
    _cretval = gtk_theming_engine_get_direction(cast(GtkThemingEngine*)this._cPtr);
    gid.gtk3.types.TextDirection _retval = cast(gid.gtk3.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Returns the font description for a given state.
  
      Params:
        state = state to retrieve the font for
      Returns: the #PangoFontDescription for the given
                 state. This object is owned by GTK+ and should not be
                 freed.
  
      Deprecated: Use [gid.gtk3.theming_engine.ThemingEngine.get]
  */
  gid.pango1.font_description.FontDescription getFont(gid.gtk3.types.StateFlags state) nothrow
  {
    const(PangoFontDescription)* _cretval;
    _cretval = gtk_theming_engine_get_font(cast(GtkThemingEngine*)this._cPtr, state);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the widget direction used for rendering.
      Returns: the widget direction
  */
  gid.gtk3.types.JunctionSides getJunctionSides() nothrow
  {
    GtkJunctionSides _cretval;
    _cretval = gtk_theming_engine_get_junction_sides(cast(GtkThemingEngine*)this._cPtr);
    gid.gtk3.types.JunctionSides _retval = cast(gid.gtk3.types.JunctionSides)_cretval;
    return _retval;
  }

  /**
      Gets the margin for a given state as a #GtkBorder.
  
      Params:
        state = state to retrieve the border for
        margin = return value for the margin settings
  */
  void getMargin(gid.gtk3.types.StateFlags state, out gid.gtk3.border.Border margin) nothrow
  {
    gtk_theming_engine_get_margin(cast(GtkThemingEngine*)this._cPtr, state, cast(GtkBorder*)&margin);
  }

  /**
      Gets the padding for a given state as a #GtkBorder.
  
      Params:
        state = state to retrieve the padding for
        padding = return value for the padding settings
  */
  void getPadding(gid.gtk3.types.StateFlags state, out gid.gtk3.border.Border padding) nothrow
  {
    gtk_theming_engine_get_padding(cast(GtkThemingEngine*)this._cPtr, state, cast(GtkBorder*)&padding);
  }

  /**
      Returns the widget path used for style matching.
      Returns: A #GtkWidgetPath
  */
  gid.gtk3.widget_path.WidgetPath getPath() nothrow
  {
    const(GtkWidgetPath)* _cretval;
    _cretval = gtk_theming_engine_get_path(cast(GtkThemingEngine*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.widget_path.WidgetPath(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  alias getProperty = gid.gobject2.object.ObjectWrap.getProperty;

  /**
      Gets a property value as retrieved from the style settings that apply
      to the currently rendered element.
  
      Params:
        property = the property name
        state = state to retrieve the value for
        value = return location for the property value,
                  you must free this memory using [gid.gobject2.value.Value.unset] once you are
                  done with it.
  */
  void getProperty(string property, gid.gtk3.types.StateFlags state, out gid.gobject2.value.Value value) nothrow
  {
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    gtk_theming_engine_get_property(cast(GtkThemingEngine*)this._cPtr, _property, state, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Returns the #GdkScreen to which engine currently rendering to.
      Returns: a #GdkScreen, or null.
  */
  gid.gdk3.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gtk_theming_engine_get_screen(cast(GtkThemingEngine*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      returns the state used when rendering.
      Returns: the state flags
  */
  gid.gtk3.types.StateFlags getState() nothrow
  {
    GtkStateFlags _cretval;
    _cretval = gtk_theming_engine_get_state(cast(GtkThemingEngine*)this._cPtr);
    gid.gtk3.types.StateFlags _retval = cast(gid.gtk3.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Gets the value for a widget style property.
  
      Params:
        propertyName = the name of the widget style property
        value = Return location for the property value, free with
                  [gid.gobject2.value.Value.unset] after use.
  */
  void getStyleProperty(string propertyName, out gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    gtk_theming_engine_get_style_property(cast(GtkThemingEngine*)this._cPtr, _propertyName, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Returns true if the currently rendered contents have
      defined the given class name.
  
      Params:
        styleClass = class name to look up
      Returns: true if engine has class_name defined
  */
  bool hasClass(string styleClass) nothrow
  {
    bool _retval;
    const(char)* _styleClass = styleClass.toCString!(No.Malloc, No.Nullable);
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
  bool hasRegion(string styleRegion, out gid.gtk3.types.RegionFlags flags) nothrow
  {
    bool _retval;
    const(char)* _styleRegion = styleRegion.toCString!(No.Malloc, No.Nullable);
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
  bool lookupColor(string colorName, out gid.gdk3.rgba.RGBA color) nothrow
  {
    bool _retval;
    const(char)* _colorName = colorName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_theming_engine_lookup_color(cast(GtkThemingEngine*)this._cPtr, _colorName, cast(GdkRGBA*)&color);
    return _retval;
  }

  /**
      Returns true if there is a transition animation running for the
      current region (see [gid.gtk3.style_context.StyleContext.pushAnimatableRegion]).
      
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
  bool stateIsRunning(gid.gtk3.types.StateType state, out double progress) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_theming_engine_state_is_running(cast(GtkThemingEngine*)this._cPtr, state, cast(double*)&progress);
    return _retval;
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from ThemingEngine
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.theming_engine.ThemingEngine), T.stringof ~ " is not derived from gid.gtk3.theming_engine.ThemingEngine");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderActivity", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_activity");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderArrow", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_arrow");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderBackground", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_background");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderCheck", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_check");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderExpander", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_expander");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderExtension", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_extension");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderFocus", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_focus");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderFrame", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_frame");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderFrameGap", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_frame_gap");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderHandle", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_handle");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderIcon", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_icon");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderIconSurface", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_icon_surface");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderLayout", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_layout");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderLine", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_line");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderOption", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_option");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRenderSlider", true)[0]) == gid.gtk3.theming_engine.ThemingEngine))
      _installVfunc(klass, "render_slider");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkThemingEngineClass*)klass;

    switch (vfunc)
    {
      case "render_activity":
      {
        static extern(C) void _vfuncRenderActivityTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderActivity)
              return (cast(typeof(&_vfuncRenderActivityTramp))_klass.renderActivity)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderActivity(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderActivity");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderActivity = cast(typeof(_klass.renderActivity))&_vfuncRenderActivityTramp;
        break;
      }
      case "render_arrow":
      {
        static extern(C) void _vfuncRenderArrowTramp(GtkThemingEngine* engine, cairo_t* cr, double angle, double x, double y, double size) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderArrow)
              return (cast(typeof(&_vfuncRenderArrowTramp))_klass.renderArrow)(engine, cr, angle, x, y, size);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderArrow(_cr, angle, x, y, size);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderArrow");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderArrow = cast(typeof(_klass.renderArrow))&_vfuncRenderArrowTramp;
        break;
      }
      case "render_background":
      {
        static extern(C) void _vfuncRenderBackgroundTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderBackground)
              return (cast(typeof(&_vfuncRenderBackgroundTramp))_klass.renderBackground)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderBackground(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderBackground");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderBackground = cast(typeof(_klass.renderBackground))&_vfuncRenderBackgroundTramp;
        break;
      }
      case "render_check":
      {
        static extern(C) void _vfuncRenderCheckTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderCheck)
              return (cast(typeof(&_vfuncRenderCheckTramp))_klass.renderCheck)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderCheck(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderCheck");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderCheck = cast(typeof(_klass.renderCheck))&_vfuncRenderCheckTramp;
        break;
      }
      case "render_expander":
      {
        static extern(C) void _vfuncRenderExpanderTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderExpander)
              return (cast(typeof(&_vfuncRenderExpanderTramp))_klass.renderExpander)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderExpander(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderExpander");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderExpander = cast(typeof(_klass.renderExpander))&_vfuncRenderExpanderTramp;
        break;
      }
      case "render_extension":
      {
        static extern(C) void _vfuncRenderExtensionTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height, GtkPositionType gapSide) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderExtension)
              return (cast(typeof(&_vfuncRenderExtensionTramp))_klass.renderExtension)(engine, cr, x, y, width, height, gapSide);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderExtension(_cr, x, y, width, height, gapSide);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderExtension");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderExtension = cast(typeof(_klass.renderExtension))&_vfuncRenderExtensionTramp;
        break;
      }
      case "render_focus":
      {
        static extern(C) void _vfuncRenderFocusTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderFocus)
              return (cast(typeof(&_vfuncRenderFocusTramp))_klass.renderFocus)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderFocus(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderFocus");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderFocus = cast(typeof(_klass.renderFocus))&_vfuncRenderFocusTramp;
        break;
      }
      case "render_frame":
      {
        static extern(C) void _vfuncRenderFrameTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderFrame)
              return (cast(typeof(&_vfuncRenderFrameTramp))_klass.renderFrame)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderFrame(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderFrame");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderFrame = cast(typeof(_klass.renderFrame))&_vfuncRenderFrameTramp;
        break;
      }
      case "render_frame_gap":
      {
        static extern(C) void _vfuncRenderFrameGapTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height, GtkPositionType gapSide, double xy0Gap, double xy1Gap) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderFrameGap)
              return (cast(typeof(&_vfuncRenderFrameGapTramp))_klass.renderFrameGap)(engine, cr, x, y, width, height, gapSide, xy0Gap, xy1Gap);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderFrameGap(_cr, x, y, width, height, gapSide, xy0Gap, xy1Gap);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderFrameGap");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderFrameGap = cast(typeof(_klass.renderFrameGap))&_vfuncRenderFrameGapTramp;
        break;
      }
      case "render_handle":
      {
        static extern(C) void _vfuncRenderHandleTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderHandle)
              return (cast(typeof(&_vfuncRenderHandleTramp))_klass.renderHandle)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderHandle(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderHandle");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderHandle = cast(typeof(_klass.renderHandle))&_vfuncRenderHandleTramp;
        break;
      }
      case "render_icon":
      {
        static extern(C) void _vfuncRenderIconTramp(GtkThemingEngine* engine, cairo_t* cr, GdkPixbuf* pixbuf, double x, double y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderIcon)
              return (cast(typeof(&_vfuncRenderIconTramp))_klass.renderIcon)(engine, cr, pixbuf, x, y);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderIcon(_cr, gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(void*)pixbuf, No.Take), x, y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderIcon");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderIcon = cast(typeof(_klass.renderIcon))&_vfuncRenderIconTramp;
        break;
      }
      case "render_icon_surface":
      {
        static extern(C) void _vfuncRenderIconSurfaceTramp(GtkThemingEngine* engine, cairo_t* cr, cairo_surface_t* surface, double x, double y) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderIconSurface)
              return (cast(typeof(&_vfuncRenderIconSurfaceTramp))_klass.renderIconSurface)(engine, cr, surface, x, y);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;
          auto _surface = surface ? new gid.cairo1.surface.Surface(cast(void*)surface, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderIconSurface(_cr, _surface, x, y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderIconSurface");
          }
          if (_cr)
            _cr._cUnborrow;
          if (_surface)
            _surface._cUnborrow;

        }

        _klass.renderIconSurface = cast(typeof(_klass.renderIconSurface))&_vfuncRenderIconSurfaceTramp;
        break;
      }
      case "render_layout":
      {
        static extern(C) void _vfuncRenderLayoutTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, PangoLayout* layout) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderLayout)
              return (cast(typeof(&_vfuncRenderLayoutTramp))_klass.renderLayout)(engine, cr, x, y, layout);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderLayout(_cr, x, y, gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.layout.Layout)(cast(void*)layout, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderLayout");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderLayout = cast(typeof(_klass.renderLayout))&_vfuncRenderLayoutTramp;
        break;
      }
      case "render_line":
      {
        static extern(C) void _vfuncRenderLineTramp(GtkThemingEngine* engine, cairo_t* cr, double x0, double y0, double x1, double y1) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderLine)
              return (cast(typeof(&_vfuncRenderLineTramp))_klass.renderLine)(engine, cr, x0, y0, x1, y1);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderLine(_cr, x0, y0, x1, y1);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderLine");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderLine = cast(typeof(_klass.renderLine))&_vfuncRenderLineTramp;
        break;
      }
      case "render_option":
      {
        static extern(C) void _vfuncRenderOptionTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderOption)
              return (cast(typeof(&_vfuncRenderOptionTramp))_klass.renderOption)(engine, cr, x, y, width, height);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderOption(_cr, x, y, width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderOption");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderOption = cast(typeof(_klass.renderOption))&_vfuncRenderOptionTramp;
        break;
      }
      case "render_slider":
      {
        static extern(C) void _vfuncRenderSliderTramp(GtkThemingEngine* engine, cairo_t* cr, double x, double y, double width, double height, GtkOrientation orientation) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.gtk3.theming_engine.ThemingEngine)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)engine);
          if (!_obj)
          {
            auto _klass = cast(GtkThemingEngineClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)engine);
            if (_klass.renderSlider)
              return (cast(typeof(&_vfuncRenderSliderTramp))_klass.renderSlider)(engine, cr, x, y, width, height, orientation);
            return;
          }

          auto _cr = cr ? new gid.cairo1.context.Context(cast(void*)cr, Yes.Take)._cBorrow : null;

          try
          {
            _obj.vfuncRenderSlider(_cr, x, y, width, height, orientation);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.theming_engine.ThemingEngine.vfuncRenderSlider");
          }
          if (_cr)
            _cr._cUnborrow;

        }

        _klass.renderSlider = cast(typeof(_klass.renderSlider))&_vfuncRenderSliderTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.theming_engine.ThemingEngine]
class ThemingEngineGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `name` property.
      Params:
        propval = The theming engine name, this name will be used when registering
          custom properties, for a theming engine named "Clearlooks" registering
          a "glossy" custom property, it could be referenced in the CSS file as
          
          ```
          -Clearlooks-glossy: true;
          ```
      Returns: Builder instance for fluent chaining
  */
  T name(string propval) nothrow
  {
    return setProperty("name", propval);
  }
}

/// Fluent builder for [gid.gtk3.theming_engine.ThemingEngine]
final class ThemingEngineGidBuilder : ThemingEngineGidBuilderImpl!ThemingEngineGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThemingEngine build() nothrow
  {
    return new ThemingEngine(cast(void*)createGObject(ThemingEngine._getGType), Yes.Take);
  }
}
