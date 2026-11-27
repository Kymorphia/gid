/// Module for [StyleContext] class
module gid.gtk3.style_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk3.frame_clock;
import gid.gdk3.rgba;
import gid.gdk3.screen;
import gid.gdk3.window;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.value;
import gid.gtk3.border;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.css_section;
import gid.gtk3.icon_set;
import gid.gtk3.style_provider;
import gid.gtk3.types;
import gid.gtk3.widget_path;
import gid.pango1.font_description;

/**
    #GtkStyleContext is an object that stores styling information affecting
    a widget defined by #GtkWidgetPath.
    
    In order to construct the final style information, #GtkStyleContext
    queries information from all attached #GtkStyleProviders. Style providers
    can be either attached explicitly to the context through
    [gid.gtk4.style_context.StyleContext.addProvider], or to the screen through
    [gid.gtk3.style_context.StyleContext.addProviderForScreen]. The resulting style is a
    combination of all providers’ information in priority order.
    
    For GTK+ widgets, any #GtkStyleContext returned by
    [gid.gtk4.widget.Widget.getStyleContext] will already have a #GtkWidgetPath, a
    #GdkScreen and RTL/LTR information set. The style context will also be
    updated automatically if any of these settings change on the widget.
    
    If you are using the theming layer standalone, you will need to set a
    widget path and a screen yourself to the created style context through
    [gid.gtk3.style_context.StyleContext.setPath] and possibly [gid.gtk3.style_context.StyleContext.setScreen]. See
    the “Foreign drawing“ example in gtk3-demo.
    
    # Style Classes # {#gtkstylecontext-classes}
    
    Widgets can add style classes to their context, which can be used to associate
    different styles by class. The documentation for individual widgets lists
    which style classes it uses itself, and which style classes may be added by
    applications to affect their appearance.
    
    GTK+ defines macros for a number of style classes.
    
    # Style Regions
    
    Widgets can also add regions with flags to their context. This feature is
    deprecated and will be removed in a future GTK+ update. Please use style
    classes instead.
    
    GTK+ defines macros for a number of style regions.
    
    # Custom styling in UI libraries and applications
    
    If you are developing a library with custom #GtkWidgets that
    render differently than standard components, you may need to add a
    #GtkStyleProvider yourself with the [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_FALLBACK]
    priority, either a #GtkCssProvider or a custom object implementing the
    #GtkStyleProvider interface. This way themes may still attempt
    to style your UI elements in a different way if needed so.
    
    If you are using custom styling on an applications, you probably want then
    to make your style information prevail to the theme’s, so you must use
    a #GtkStyleProvider with the [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_APPLICATION]
    priority, keep in mind that the user settings in
    `XDG_CONFIG_HOME/gtk-3.0/gtk.css` will
    still take precedence over your changes, as it uses the
    [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_USER] priority.
*/
@gidGir("StyleContext", "StyleContextClass")
class StyleContext : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_style_context_get_type != &gidSymbolNotFound ? gtk_style_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkStyleContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtk3.style_context.StyleContext]
      Returns: New builder object
  */
  static StyleContextGidBuilder builder() nothrow
  {
    return new StyleContextGidBuilder;
  }

  /** */
  @property gid.gtk3.types.TextDirection direction() nothrow
  {
    return getDirection();
  }

  /** */
  @property void direction(gid.gtk3.types.TextDirection propval) nothrow
  {
    setDirection(propval);
  }

  /** */
  @property gid.gdk3.frame_clock.FrameClock paintClock() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gdk3.frame_clock.FrameClock)("paint-clock");
  }

  /** */
  @property void paintClock(gid.gdk3.frame_clock.FrameClock propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gdk3.frame_clock.FrameClock)("paint-clock", propval);
  }

  /**
      Get `parent` property.
      Returns: Sets or gets the style context’s parent. See [gid.gtk3.style_context.StyleContext.setParent]
        for details.
  */
  @property gid.gtk3.style_context.StyleContext parent() nothrow
  {
    return getParent();
  }

  /**
      Set `parent` property.
      Params:
        propval = Sets or gets the style context’s parent. See [gid.gtk3.style_context.StyleContext.setParent]
          for details.
  */
  @property void parent(gid.gtk3.style_context.StyleContext propval) nothrow
  {
    setParent(propval);
  }

  /** */
  @property gid.gdk3.screen.Screen screen() nothrow
  {
    return getScreen();
  }

  /** */
  @property void screen(gid.gdk3.screen.Screen propval) nothrow
  {
    setScreen(propval);
  }

  /**
      Creates a standalone #GtkStyleContext, this style context
      won’t be attached to any widget, so you may want
      to call [gid.gtk3.style_context.StyleContext.setPath] yourself.
      
      This function is only useful when using the theming layer
      separated from GTK+, if you are using #GtkStyleContext to
      theme #GtkWidgets, use [gid.gtk4.widget.Widget.getStyleContext]
      in order to get a style context ready to theme the widget.
      Returns: A newly created #GtkStyleContext.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkStyleContext* _cretval;
      _cretval = gtk_style_context_new();
      this(_cretval, Yes.Take);
    }
  }

  /**
      Adds a global style provider to screen, which will be used
      in style construction for all #GtkStyleContexts under screen.
      
      GTK+ uses this to make styling information from #GtkSettings
      available.
      
      Note: If both priorities are the same, A #GtkStyleProvider
      added through [gid.gtk4.style_context.StyleContext.addProvider] takes precedence
      over another added through this function.
  
      Params:
        screen = a #GdkScreen
        provider = a #GtkStyleProvider
        priority = the priority of the style provider. The lower
                     it is, the earlier it will be used in the style
                     construction. Typically this will be in the range
                     between [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_FALLBACK] and
                     [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_USER]
  */
  static void addProviderForScreen(gid.gdk3.screen.Screen screen, gid.gtk3.style_provider.StyleProvider provider, uint priority) nothrow
  {
    gtk_style_context_add_provider_for_screen(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, priority);
  }

  /**
      Removes provider from the global style providers list in screen.
  
      Params:
        screen = a #GdkScreen
        provider = a #GtkStyleProvider
  */
  static void removeProviderForScreen(gid.gdk3.screen.Screen screen, gid.gtk3.style_provider.StyleProvider provider) nothrow
  {
    gtk_style_context_remove_provider_for_screen(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /**
      This function recomputes the styles for all widgets under a particular
      #GdkScreen. This is useful when some global parameter has changed that
      affects the appearance of all widgets, because when a widget gets a new
      style, it will both redraw and recompute any cached information about
      its appearance. As an example, it is used when the color scheme changes
      in the related #GtkSettings object.
  
      Params:
        screen = a #GdkScreen
  */
  static void resetWidgets(gid.gdk3.screen.Screen screen) nothrow
  {
    gtk_style_context_reset_widgets(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncChanged()
  {
    auto _klass = cast(GtkStyleContextClass*)_vfuncClass;
    if (!_klass.changed)
      return;

    _klass.changed(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Adds a style class to context, so posterior calls to
      [gid.gtk3.style_context.StyleContext.get] or any of the gtk_render_*()
      functions will make use of this new class for styling.
      
      In the CSS file format, a #GtkEntry defining a “search”
      class, would be matched by:
      
      ``` <!-- language="CSS" -->
      entry.search { ... }
      ```
      
      While any widget defining a “search” class would be
      matched by:
      ``` <!-- language="CSS" -->
      .search { ... }
      ```
  
      Params:
        className = class name to use in styling
  */
  void addClass(string className) nothrow
  {
    const(char)* _className = className.toCString!(No.Malloc, No.Nullable);
    gtk_style_context_add_class(cast(GtkStyleContext*)this._cPtr, _className);
  }

  /**
      Adds a style provider to context, to be used in style construction.
      Note that a style provider added by this function only affects
      the style of the widget to which context belongs. If you want
      to affect the style of all widgets, use
      [gid.gtk3.style_context.StyleContext.addProviderForScreen].
      
      Note: If both priorities are the same, a #GtkStyleProvider
      added through this function takes precedence over another added
      through [gid.gtk3.style_context.StyleContext.addProviderForScreen].
  
      Params:
        provider = a #GtkStyleProvider
        priority = the priority of the style provider. The lower
                     it is, the earlier it will be used in the style
                     construction. Typically this will be in the range
                     between [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_FALLBACK] and
                     [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_USER]
  */
  void addProvider(gid.gtk3.style_provider.StyleProvider provider, uint priority) nothrow
  {
    gtk_style_context_add_provider(cast(GtkStyleContext*)this._cPtr, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, priority);
  }

  /**
      Adds a region to context, so posterior calls to
      [gid.gtk3.style_context.StyleContext.get] or any of the gtk_render_*()
      functions will make use of this new region for styling.
      
      In the CSS file format, a #GtkTreeView defining a “row”
      region, would be matched by:
      
      ``` <!-- language="CSS" -->
      treeview row { ... }
      ```
      
      Pseudo-classes are used for matching flags, so the two
      following rules:
      ``` <!-- language="CSS" -->
      treeview row:nth-child(even) { ... }
      treeview row:nth-child(odd) { ... }
      ```
      
      would apply to even and odd rows, respectively.
      
      Region names must only contain lowercase letters
      and “-”, starting always with a lowercase letter.
  
      Params:
        regionName = region name to use in styling
        flags = flags that apply to the region
  */
  void addRegion(string regionName, gid.gtk3.types.RegionFlags flags) nothrow
  {
    const(char)* _regionName = regionName.toCString!(No.Malloc, No.Nullable);
    gtk_style_context_add_region(cast(GtkStyleContext*)this._cPtr, _regionName, flags);
  }

  /**
      Stops all running animations for region_id and all animatable
      regions underneath.
      
      A null region_id will stop all ongoing animations in context,
      when dealing with a #GtkStyleContext obtained through
      [gid.gtk4.widget.Widget.getStyleContext], this is normally done for you
      in all circumstances you would expect all widget to be stopped,
      so this should be only used in complex widgets with different
      animatable regions.
  
      Params:
        regionId = animatable region to stop, or null.
              See [gid.gtk3.style_context.StyleContext.pushAnimatableRegion]
  
      Deprecated: This function does nothing.
  */
  void cancelAnimations(void* regionId = null) nothrow
  {
    gtk_style_context_cancel_animations(cast(GtkStyleContext*)this._cPtr, regionId);
  }

  /**
      Gets the background color for a given state.
      
      This function is far less useful than it seems, and it should not be used in
      newly written code. CSS has no concept of "background color", as a background
      can be an image, or a gradient, or any other pattern including solid colors.
      
      The only reason why you would call [gid.gtk3.style_context.StyleContext.getBackgroundColor] is
      to use the returned value to draw the background with it; the correct way to
      achieve this result is to use [gid.gtk4.global.renderBackground] instead, along with CSS
      style classes to modify the color to be rendered.
  
      Params:
        state = state to retrieve the color for
        color = return value for the background color
  
      Deprecated: Use [gid.gtk4.global.renderBackground] instead.
  */
  void getBackgroundColor(gid.gtk3.types.StateFlags state, out gid.gdk3.rgba.RGBA color) nothrow
  {
    gtk_style_context_get_background_color(cast(GtkStyleContext*)this._cPtr, state, cast(GdkRGBA*)&color);
  }

  /**
      Gets the border for a given state as a #GtkBorder.
      
      See [gid.gtk3.style_context.StyleContext.getProperty] and
      #GTK_STYLE_PROPERTY_BORDER_WIDTH for details.
  
      Params:
        state = state to retrieve the border for
        border = return value for the border settings
  */
  void getBorder(gid.gtk3.types.StateFlags state, out gid.gtk3.border.Border border) nothrow
  {
    gtk_style_context_get_border(cast(GtkStyleContext*)this._cPtr, state, cast(GtkBorder*)&border);
  }

  /**
      Gets the border color for a given state.
  
      Params:
        state = state to retrieve the color for
        color = return value for the border color
  
      Deprecated: Use [gid.gtk4.global.renderFrame] instead.
  */
  void getBorderColor(gid.gtk3.types.StateFlags state, out gid.gdk3.rgba.RGBA color) nothrow
  {
    gtk_style_context_get_border_color(cast(GtkStyleContext*)this._cPtr, state, cast(GdkRGBA*)&color);
  }

  /**
      Gets the foreground color for a given state.
      
      See [gid.gtk3.style_context.StyleContext.getProperty] and
      #GTK_STYLE_PROPERTY_COLOR for details.
  
      Params:
        state = state to retrieve the color for
        color = return value for the foreground color
  */
  void getColor(gid.gtk3.types.StateFlags state, out gid.gdk3.rgba.RGBA color) nothrow
  {
    gtk_style_context_get_color(cast(GtkStyleContext*)this._cPtr, state, cast(GdkRGBA*)&color);
  }

  /**
      Returns the widget direction used for rendering.
      Returns: the widget direction
  
      Deprecated: Use [gid.gtk4.style_context.StyleContext.getState] and
          check for #GTK_STATE_FLAG_DIR_LTR and
          #GTK_STATE_FLAG_DIR_RTL instead.
  */
  gid.gtk3.types.TextDirection getDirection() nothrow
  {
    GtkTextDirection _cretval;
    _cretval = gtk_style_context_get_direction(cast(GtkStyleContext*)this._cPtr);
    gid.gtk3.types.TextDirection _retval = cast(gid.gtk3.types.TextDirection)_cretval;
    return _retval;
  }

  /**
      Returns the font description for a given state. The returned
      object is const and will remain valid until the
      #GtkStyleContext::changed signal happens.
  
      Params:
        state = state to retrieve the font for
      Returns: the #PangoFontDescription for the given
                 state.  This object is owned by GTK+ and should not be
                 freed.
  
      Deprecated: Use [gid.gtk3.style_context.StyleContext.get] for "font" or
            subproperties instead.
  */
  gid.pango1.font_description.FontDescription getFont(gid.gtk3.types.StateFlags state) nothrow
  {
    const(PangoFontDescription)* _cretval;
    _cretval = gtk_style_context_get_font(cast(GtkStyleContext*)this._cPtr, state);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the #GdkFrameClock to which context is attached.
      Returns: a #GdkFrameClock, or null
         if context does not have an attached frame clock.
  */
  gid.gdk3.frame_clock.FrameClock getFrameClock() nothrow
  {
    GdkFrameClock* _cretval;
    _cretval = gtk_style_context_get_frame_clock(cast(GtkStyleContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.frame_clock.FrameClock)(cast(GdkFrameClock*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the sides where rendered elements connect visually with others.
      Returns: the junction sides
  */
  gid.gtk3.types.JunctionSides getJunctionSides() nothrow
  {
    GtkJunctionSides _cretval;
    _cretval = gtk_style_context_get_junction_sides(cast(GtkStyleContext*)this._cPtr);
    gid.gtk3.types.JunctionSides _retval = cast(gid.gtk3.types.JunctionSides)_cretval;
    return _retval;
  }

  /**
      Gets the margin for a given state as a #GtkBorder.
      See gtk_style_property_get() and #GTK_STYLE_PROPERTY_MARGIN
      for details.
  
      Params:
        state = state to retrieve the border for
        margin = return value for the margin settings
  */
  void getMargin(gid.gtk3.types.StateFlags state, out gid.gtk3.border.Border margin) nothrow
  {
    gtk_style_context_get_margin(cast(GtkStyleContext*)this._cPtr, state, cast(GtkBorder*)&margin);
  }

  /**
      Gets the padding for a given state as a #GtkBorder.
      See [gid.gtk3.style_context.StyleContext.get] and #GTK_STYLE_PROPERTY_PADDING
      for details.
  
      Params:
        state = state to retrieve the padding for
        padding = return value for the padding settings
  */
  void getPadding(gid.gtk3.types.StateFlags state, out gid.gtk3.border.Border padding) nothrow
  {
    gtk_style_context_get_padding(cast(GtkStyleContext*)this._cPtr, state, cast(GtkBorder*)&padding);
  }

  /**
      Gets the parent context set via [gid.gtk3.style_context.StyleContext.setParent].
      See that function for details.
      Returns: the parent context or null
  */
  gid.gtk3.style_context.StyleContext getParent() nothrow
  {
    GtkStyleContext* _cretval;
    _cretval = gtk_style_context_get_parent(cast(GtkStyleContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.style_context.StyleContext)(cast(GtkStyleContext*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the widget path used for style matching.
      Returns: A #GtkWidgetPath
  */
  gid.gtk3.widget_path.WidgetPath getPath() nothrow
  {
    const(GtkWidgetPath)* _cretval;
    _cretval = gtk_style_context_get_path(cast(GtkStyleContext*)this._cPtr);
    auto _retval = _cretval ? new gid.gtk3.widget_path.WidgetPath(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  alias getProperty = gid.gobject2.object.ObjectWrap.getProperty;

  /**
      Gets a style property from context for the given state.
      
      Note that not all CSS properties that are supported by GTK+ can be
      retrieved in this way, since they may not be representable as #GValue.
      GTK+ defines macros for a number of properties that can be used
      with this function.
      
      Note that passing a state other than the current state of context
      is not recommended unless the style context has been saved with
      [gid.gtk4.style_context.StyleContext.save].
      
      When value is no longer needed, [gid.gobject2.value.Value.unset] must be called
      to free any allocated memory.
  
      Params:
        property = style property name
        state = state to retrieve the property value for
        value = return location for the style property value
  */
  void getProperty(string property, gid.gtk3.types.StateFlags state, out gid.gobject2.value.Value value) nothrow
  {
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    auto _value = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    gtk_style_context_get_property(cast(GtkStyleContext*)this._cPtr, _property, state, _value);
    value = new gid.gobject2.value.Value(cast(void*)_value, Yes.Take);
  }

  /**
      Returns the scale used for assets.
      Returns: the scale
  */
  int getScale() nothrow
  {
    int _retval;
    _retval = gtk_style_context_get_scale(cast(GtkStyleContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #GdkScreen to which context is attached.
      Returns: a #GdkScreen.
  */
  gid.gdk3.screen.Screen getScreen() nothrow
  {
    GdkScreen* _cretval;
    _cretval = gtk_style_context_get_screen(cast(GtkStyleContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk3.screen.Screen)(cast(GdkScreen*)_cretval, No.Take);
    return _retval;
  }

  /**
      Queries the location in the CSS where property was defined for the
      current context. Note that the state to be queried is taken from
      [gid.gtk4.style_context.StyleContext.getState].
      
      If the location is not available, null will be returned. The
      location might not be available for various reasons, such as the
      property being overridden, property not naming a supported CSS
      property or tracking of definitions being disabled for performance
      reasons.
      
      Shorthand CSS properties cannot be queried for a location and will
      always return null.
  
      Params:
        property = style property name
      Returns: null or the section where a value
        for property was defined
  */
  gid.gtk3.css_section.CssSection getSection(string property) nothrow
  {
    GtkCssSection* _cretval;
    const(char)* _property = property.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_style_context_get_section(cast(GtkStyleContext*)this._cPtr, _property);
    auto _retval = _cretval ? new gid.gtk3.css_section.CssSection(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the state used for style matching.
      
      This method should only be used to retrieve the #GtkStateFlags
      to pass to #GtkStyleContext methods, like [gid.gtk4.style_context.StyleContext.getPadding].
      If you need to retrieve the current state of a #GtkWidget, use
      [gid.gtk4.widget.Widget.getStateFlags].
      Returns: the state flags
  */
  gid.gtk3.types.StateFlags getState() nothrow
  {
    GtkStateFlags _cretval;
    _cretval = gtk_style_context_get_state(cast(GtkStyleContext*)this._cPtr);
    gid.gtk3.types.StateFlags _retval = cast(gid.gtk3.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Gets the value for a widget style property.
      
      When value is no longer needed, [gid.gobject2.value.Value.unset] must be called
      to free any allocated memory.
  
      Params:
        propertyName = the name of the widget style property
        value = Return location for the property value
  */
  void getStyleProperty(string propertyName, gid.gobject2.value.Value value) nothrow
  {
    const(char)* _propertyName = propertyName.toCString!(No.Malloc, No.Nullable);
    gtk_style_context_get_style_property(cast(GtkStyleContext*)this._cPtr, _propertyName, value ? cast(GValue*)value._cPtr(No.Dup) : null);
  }

  /**
      Returns true if context currently has defined the
      given class name.
  
      Params:
        className = a class name
      Returns: true if context has class_name defined
  */
  bool hasClass(string className) nothrow
  {
    bool _retval;
    const(char)* _className = className.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_style_context_has_class(cast(GtkStyleContext*)this._cPtr, _className);
    return _retval;
  }

  /**
      Returns true if context has the region defined.
      If flags_return is not null, it is set to the flags
      affecting the region.
  
      Params:
        regionName = a region name
        flagsReturn = return location for region flags
      Returns: true if region is defined
  */
  bool hasRegion(string regionName, out gid.gtk3.types.RegionFlags flagsReturn) nothrow
  {
    bool _retval;
    const(char)* _regionName = regionName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_style_context_has_region(cast(GtkStyleContext*)this._cPtr, _regionName, &flagsReturn);
    return _retval;
  }

  /**
      Invalidates context style information, so it will be reconstructed
      again. It is useful if you modify the context and need the new
      information immediately.
  
      Deprecated: Style contexts are invalidated automatically.
  */
  void invalidate() nothrow
  {
    gtk_style_context_invalidate(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Returns the list of classes currently defined in context.
      Returns: a #GList of
                 strings with the currently defined classes. The contents
                 of the list are owned by GTK+, but you must free the list
                 itself with [gid.glib2.list.List.free] when you are done with it.
  */
  string[] listClasses() nothrow
  {
    GList* _cretval;
    _cretval = gtk_style_context_list_classes(cast(GtkStyleContext*)this._cPtr);
    auto _retval = gListToD!(string, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Returns the list of regions currently defined in context.
      Returns: a #GList of
                 strings with the currently defined regions. The contents
                 of the list are owned by GTK+, but you must free the list
                 itself with [gid.glib2.list.List.free] when you are done with it.
  */
  string[] listRegions() nothrow
  {
    GList* _cretval;
    _cretval = gtk_style_context_list_regions(cast(GtkStyleContext*)this._cPtr);
    auto _retval = gListToD!(string, GidOwnership.Container)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Looks up and resolves a color name in the context color map.
  
      Params:
        colorName = color name to lookup
        color = Return location for the looked up color
      Returns: true if color_name was found and resolved, false otherwise
  */
  bool lookupColor(string colorName, out gid.gdk3.rgba.RGBA color) nothrow
  {
    bool _retval;
    const(char)* _colorName = colorName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_style_context_lookup_color(cast(GtkStyleContext*)this._cPtr, _colorName, cast(GdkRGBA*)&color);
    return _retval;
  }

  /**
      Looks up stock_id in the icon factories associated to context and
      the default icon factory, returning an icon set if found, otherwise
      null.
  
      Params:
        stockId = an icon name
      Returns: The looked up [gid.gtk3.icon_set.IconSet], or null
  
      Deprecated: Use [gid.gtk4.icon_theme.IconTheme.lookupIcon] instead.
  */
  gid.gtk3.icon_set.IconSet lookupIconSet(string stockId) nothrow
  {
    GtkIconSet* _cretval;
    const(char)* _stockId = stockId.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_style_context_lookup_icon_set(cast(GtkStyleContext*)this._cPtr, _stockId);
    auto _retval = _cretval ? new gid.gtk3.icon_set.IconSet(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Notifies a state change on context, so if the current style makes use
      of transition animations, one will be started so all rendered elements
      under region_id are animated for state state being set to value
      state_value.
      
      The window parameter is used in order to invalidate the rendered area
      as the animation runs, so make sure it is the same window that is being
      rendered on by the gtk_render_*() functions.
      
      If region_id is null, all rendered elements using context will be
      affected by this state transition.
      
      As a practical example, a #GtkButton notifying a state transition on
      the prelight state:
      ``` <!-- language="C" -->
      gtk_style_context_notify_state_change (context,
                                             gtk_widget_get_window (widget),
                                             NULL,
                                             GTK_STATE_PRELIGHT,
                                             button->in_button);
      ```
      
      Can be handled in the CSS file like this:
      ``` <!-- language="CSS" -->
      button {
          background-color: #f00
      }
      
      button:hover {
          background-color: #fff;
          transition: 200ms linear
      }
      ```
      
      This combination will animate the button background from red to white
      if a pointer enters the button, and back to red if the pointer leaves
      the button.
      
      Note that state is used when finding the transition parameters, which
      is why the style places the transition under the :hover pseudo-class.
  
      Params:
        window = a #GdkWindow
        regionId = animatable region to notify on, or null.
              See [gid.gtk3.style_context.StyleContext.pushAnimatableRegion]
        state = state to trigger transition for
        stateValue = true if state is the state we are changing to,
              false if we are changing away from it
  
      Deprecated: This function does nothing.
  */
  void notifyStateChange(gid.gdk3.window.Window window, void* regionId, gid.gtk3.types.StateType state, bool stateValue) nothrow
  {
    gtk_style_context_notify_state_change(cast(GtkStyleContext*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, regionId, state, stateValue);
  }

  /**
      Pops an animatable region from context.
      See [gid.gtk3.style_context.StyleContext.pushAnimatableRegion].
  
      Deprecated: This function does nothing.
  */
  void popAnimatableRegion() nothrow
  {
    gtk_style_context_pop_animatable_region(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Pushes an animatable region, so all further gtk_render_*() calls between
      this call and the following [gid.gtk3.style_context.StyleContext.popAnimatableRegion]
      will potentially show transition animations for this region if
      [gid.gtk3.style_context.StyleContext.notifyStateChange] is called for a given state,
      and the current theme/style defines transition animations for state
      changes.
      
      The region_id used must be unique in context so the themes
      can uniquely identify rendered elements subject to a state transition.
  
      Params:
        regionId = unique identifier for the animatable region
  
      Deprecated: This function does nothing.
  */
  void pushAnimatableRegion(void* regionId = null) nothrow
  {
    gtk_style_context_push_animatable_region(cast(GtkStyleContext*)this._cPtr, regionId);
  }

  /**
      Removes class_name from context.
  
      Params:
        className = class name to remove
  */
  void removeClass(string className) nothrow
  {
    const(char)* _className = className.toCString!(No.Malloc, No.Nullable);
    gtk_style_context_remove_class(cast(GtkStyleContext*)this._cPtr, _className);
  }

  /**
      Removes provider from the style providers list in context.
  
      Params:
        provider = a #GtkStyleProvider
  */
  void removeProvider(gid.gtk3.style_provider.StyleProvider provider) nothrow
  {
    gtk_style_context_remove_provider(cast(GtkStyleContext*)this._cPtr, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /**
      Removes a region from context.
  
      Params:
        regionName = region name to unset
  */
  void removeRegion(string regionName) nothrow
  {
    const(char)* _regionName = regionName.toCString!(No.Malloc, No.Nullable);
    gtk_style_context_remove_region(cast(GtkStyleContext*)this._cPtr, _regionName);
  }

  /**
      Restores context state to a previous stage.
      See [gid.gtk4.style_context.StyleContext.save].
  */
  void restore() nothrow
  {
    gtk_style_context_restore(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Saves the context state, so temporary modifications done through
      [gid.gtk4.style_context.StyleContext.addClass], [gid.gtk4.style_context.StyleContext.removeClass],
      [gid.gtk4.style_context.StyleContext.setState], etc. can quickly be reverted
      in one go through [gid.gtk4.style_context.StyleContext.restore].
      
      The matching call to [gid.gtk4.style_context.StyleContext.restore] must be done
      before GTK returns to the main loop.
  */
  void save() nothrow
  {
    gtk_style_context_save(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      This function is analogous to [gid.gdk3.window.Window.scroll], and
      should be called together with it so the invalidation
      areas for any ongoing animation are scrolled together
      with it.
  
      Params:
        window = a #GdkWindow used previously in
                   [gid.gtk3.style_context.StyleContext.notifyStateChange]
        dx = Amount to scroll in the X axis
        dy = Amount to scroll in the Y axis
  
      Deprecated: This function does nothing.
  */
  void scrollAnimations(gid.gdk3.window.Window window, int dx, int dy) nothrow
  {
    gtk_style_context_scroll_animations(cast(GtkStyleContext*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null, dx, dy);
  }

  /**
      Sets the background of window to the background pattern or
      color specified in context for its current state.
  
      Params:
        window = a #GdkWindow
  
      Deprecated: Use [gid.gtk4.global.renderBackground] instead.
          Note that clients still using this function are now responsible
          for calling this function again whenever context is invalidated.
  */
  void setBackground(gid.gdk3.window.Window window) nothrow
  {
    gtk_style_context_set_background(cast(GtkStyleContext*)this._cPtr, window ? cast(GdkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Sets the reading direction for rendering purposes.
      
      If you are using a #GtkStyleContext returned from
      [gid.gtk4.widget.Widget.getStyleContext], you do not need to
      call this yourself.
  
      Params:
        direction = the new direction.
  
      Deprecated: Use [gid.gtk4.style_context.StyleContext.setState] with
          #GTK_STATE_FLAG_DIR_LTR and #GTK_STATE_FLAG_DIR_RTL
          instead.
  */
  void setDirection(gid.gtk3.types.TextDirection direction) nothrow
  {
    gtk_style_context_set_direction(cast(GtkStyleContext*)this._cPtr, direction);
  }

  /**
      Attaches context to the given frame clock.
      
      The frame clock is used for the timing of animations.
      
      If you are using a #GtkStyleContext returned from
      [gid.gtk4.widget.Widget.getStyleContext], you do not need to
      call this yourself.
  
      Params:
        frameClock = a #GdkFrameClock
  */
  void setFrameClock(gid.gdk3.frame_clock.FrameClock frameClock) nothrow
  {
    gtk_style_context_set_frame_clock(cast(GtkStyleContext*)this._cPtr, frameClock ? cast(GdkFrameClock*)frameClock._cPtr(No.Dup) : null);
  }

  /**
      Sets the sides where rendered elements (mostly through
      [gid.gtk4.global.renderFrame]) will visually connect with other visual elements.
      
      This is merely a hint that may or may not be honored
      by themes.
      
      Container widgets are expected to set junction hints as appropriate
      for their children, so it should not normally be necessary to call
      this function manually.
  
      Params:
        sides = sides where rendered elements are visually connected to
              other elements
  */
  void setJunctionSides(gid.gtk3.types.JunctionSides sides) nothrow
  {
    gtk_style_context_set_junction_sides(cast(GtkStyleContext*)this._cPtr, sides);
  }

  /**
      Sets the parent style context for context. The parent style
      context is used to implement
      [inheritance](http://www.w3.org/TR/css3-cascade/#inheritance)
      of properties.
      
      If you are using a #GtkStyleContext returned from
      [gid.gtk4.widget.Widget.getStyleContext], the parent will be set for you.
  
      Params:
        parent = the new parent or null
  */
  void setParent(gid.gtk3.style_context.StyleContext parent = null) nothrow
  {
    gtk_style_context_set_parent(cast(GtkStyleContext*)this._cPtr, parent ? cast(GtkStyleContext*)parent._cPtr(No.Dup) : null);
  }

  /**
      Sets the #GtkWidgetPath used for style matching. As a
      consequence, the style will be regenerated to match
      the new given path.
      
      If you are using a #GtkStyleContext returned from
      [gid.gtk4.widget.Widget.getStyleContext], you do not need to call
      this yourself.
  
      Params:
        path = a #GtkWidgetPath
  */
  void setPath(gid.gtk3.widget_path.WidgetPath path) nothrow
  {
    gtk_style_context_set_path(cast(GtkStyleContext*)this._cPtr, path ? cast(GtkWidgetPath*)path._cPtr(No.Dup) : null);
  }

  /**
      Sets the scale to use when getting image assets for the style.
  
      Params:
        scale = scale
  */
  void setScale(int scale) nothrow
  {
    gtk_style_context_set_scale(cast(GtkStyleContext*)this._cPtr, scale);
  }

  /**
      Attaches context to the given screen.
      
      The screen is used to add style information from “global” style
      providers, such as the screen’s #GtkSettings instance.
      
      If you are using a #GtkStyleContext returned from
      [gid.gtk4.widget.Widget.getStyleContext], you do not need to
      call this yourself.
  
      Params:
        screen = a #GdkScreen
  */
  void setScreen(gid.gdk3.screen.Screen screen) nothrow
  {
    gtk_style_context_set_screen(cast(GtkStyleContext*)this._cPtr, screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
  }

  /**
      Sets the state to be used for style matching.
  
      Params:
        flags = state to represent
  */
  void setState(gid.gtk3.types.StateFlags flags) nothrow
  {
    gtk_style_context_set_state(cast(GtkStyleContext*)this._cPtr, flags);
  }

  /**
      Returns true if there is a transition animation running for the
      current region (see [gid.gtk3.style_context.StyleContext.pushAnimatableRegion]).
      
      If progress is not null, the animation progress will be returned
      there, 0.0 means the state is closest to being unset, while 1.0 means
      it’s closest to being set. This means transition animation will
      run from 0 to 1 when state is being set and from 1 to 0 when
      it’s being unset.
  
      Params:
        state = a widget state
        progress = return location for the transition progress
      Returns: true if there is a running transition animation for state.
  
      Deprecated: This function always returns false
  */
  bool stateIsRunning(gid.gtk3.types.StateType state, out double progress) nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_style_context_state_is_running(cast(GtkStyleContext*)this._cPtr, state, cast(double*)&progress);
    return _retval;
  }

  /**
      Converts the style context into a string representation.
      
      The string representation always includes information about
      the name, state, id, visibility and style classes of the CSS
      node that is backing context. Depending on the flags, more
      information may be included.
      
      This function is intended for testing and debugging of the
      CSS implementation in GTK+. There are no guarantees about
      the format of the returned string, it may change.
  
      Params:
        flags = Flags that determine what to print
      Returns: a newly allocated string representing context
  */
  string toString_(gid.gtk3.types.StyleContextPrintFlags flags) nothrow
  {
    char* _cretval;
    _cretval = gtk_style_context_to_string(cast(GtkStyleContext*)this._cPtr, flags);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Connect to `Changed` signal.
  
      The ::changed signal is emitted when there is a change in the
        #GtkStyleContext.
        
        For a #GtkStyleContext returned by [gid.gtk4.widget.Widget.getStyleContext], the
        #GtkWidget::style-updated signal/vfunc might be more convenient to use.
        
        This signal is useful when using the theming layer standalone.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gtk3.style_context.StyleContext styleContext)`
  
          `styleContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtk3.style_context.StyleContext)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style_context.StyleContext.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from StyleContext
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.gtk3.style_context.StyleContext), T.stringof ~ " is not derived from gid.gtk3.style_context.StyleContext");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChanged", true)[0]) == gid.gtk3.style_context.StyleContext))
      _installVfunc(klass, "changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(GtkStyleContextClass*)klass;

    switch (vfunc)
    {
      case "changed":
      {
        static extern(C) void _vfuncChangedTramp(GtkStyleContext* context) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.gtk3.style_context.StyleContext)(cast(void*)context);
          if (!_obj)
          {
            auto _klass = cast(GtkStyleContextClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)context);
            if (_klass.changed)
              return (cast(typeof(&_vfuncChangedTramp))_klass.changed)(context);
            return;
          }

          try
          {
            _obj.vfuncChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gtk3.style_context.StyleContext.vfuncChanged");
          }
        }

        _klass.changed = cast(typeof(_klass.changed))&_vfuncChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gtk3.style_context.StyleContext]
class StyleContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T direction(gid.gtk3.types.TextDirection propval) nothrow
  {
    return setProperty("direction", propval);
  }

  /** */
  T paintClock(gid.gdk3.frame_clock.FrameClock propval) nothrow
  {
    return setProperty("paint-clock", propval);
  }

  /**
      Set `parent` property.
      Params:
        propval = Sets or gets the style context’s parent. See [gid.gtk3.style_context.StyleContext.setParent]
          for details.
      Returns: Builder instance for fluent chaining
  */
  T parent(gid.gtk3.style_context.StyleContext propval) nothrow
  {
    return setProperty("parent", propval);
  }

  /** */
  T screen(gid.gdk3.screen.Screen propval) nothrow
  {
    return setProperty("screen", propval);
  }
}

/// Fluent builder for [gid.gtk3.style_context.StyleContext]
final class StyleContextGidBuilder : StyleContextGidBuilderImpl!StyleContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleContext build() nothrow
  {
    return new StyleContext(cast(void*)createGObject(StyleContext._getGType), Yes.Take);
  }
}
