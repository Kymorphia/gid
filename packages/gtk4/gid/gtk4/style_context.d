/// Module for [StyleContext] class
module gid.gtk4.style_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gdk4.display;
import gid.gdk4.rgba;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.border;
import gid.gtk4.c.functions;
import gid.gtk4.c.types;
import gid.gtk4.style_provider;
import gid.gtk4.types;

/**
    [gid.gtk4.style_context.StyleContext] stores styling information affecting a widget.
    
    In order to construct the final style information, [gid.gtk4.style_context.StyleContext]
    queries information from all attached `GtkStyleProviders`. Style
    providers can be either attached explicitly to the context through
    [gid.gtk4.style_context.StyleContext.addProvider], or to the display through
    [gid.gtk4.style_context.StyleContext.addProviderForDisplay]. The resulting
    style is a combination of all providers’ information in priority order.
    
    For GTK widgets, any [gid.gtk4.style_context.StyleContext] returned by
    [gid.gtk4.widget.Widget.getStyleContext] will already have a [gid.gdk4.display.Display]
    and RTL/LTR information set. The style context will also be updated
    automatically if any of these settings change on the widget.
    
    ## Style Classes
    
    Widgets can add style classes to their context, which can be used to associate
    different styles by class. The documentation for individual widgets lists
    which style classes it uses itself, and which style classes may be added by
    applications to affect their appearance.
    
    # Custom styling in UI libraries and applications
    
    If you are developing a library with custom widgets that render differently
    than standard components, you may need to add a [gid.gtk4.style_provider.StyleProvider] yourself
    with the [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_FALLBACK] priority, either a
    [gid.gtk4.css_provider.CssProvider] or a custom object implementing the [gid.gtk4.style_provider.StyleProvider]
    interface. This way themes may still attempt to style your UI elements in
    a different way if needed so.
    
    If you are using custom styling on an applications, you probably want then
    to make your style information prevail to the theme’s, so you must use
    a [gid.gtk4.style_provider.StyleProvider] with the [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_APPLICATION]
    priority, keep in mind that the user settings in
    `XDG_CONFIG_HOME/gtk-4.0/gtk.css` will
    still take precedence over your changes, as it uses the
    [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_USER] priority.

    Deprecated: The relevant API has been moved to [gid.gtk4.widget.Widget]
        where applicable; otherwise, there is no replacement for querying the
        style machinery. Stylable UI elements should use widgets.
*/
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
      Get builder for [gid.gtk4.style_context.StyleContext]
      Returns: New builder object
  */
  static StyleContextGidBuilder builder() nothrow
  {
    return new StyleContextGidBuilder;
  }

  /**
      Get `display` property.
      Returns: The display of the style context.
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Set `display` property.
      Params:
        propval = The display of the style context.
  */
  @property void display(gid.gdk4.display.Display propval) nothrow
  {
    setDisplay(propval);
  }

  /**
      Adds a global style provider to display, which will be used
      in style construction for all `GtkStyleContexts` under display.
      
      GTK uses this to make styling information from [gid.gtk4.settings.Settings]
      available.
      
      Note: If both priorities are the same, A [gid.gtk4.style_provider.StyleProvider]
      added through [gid.gtk4.style_context.StyleContext.addProvider] takes
      precedence over another added through this function.
  
      Params:
        display = a [gid.gdk4.display.Display]
        provider = a [gid.gtk4.style_provider.StyleProvider]
        priority = the priority of the style provider. The lower
            it is, the earlier it will be used in the style construction.
            Typically this will be in the range between
            [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_FALLBACK] and
            [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_USER]
  */
  static void addProviderForDisplay(gid.gdk4.display.Display display, gid.gtk4.style_provider.StyleProvider provider, uint priority) nothrow
  {
    gtk_style_context_add_provider_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, priority);
  }

  /**
      Removes provider from the global style providers list in display.
  
      Params:
        display = a [gid.gdk4.display.Display]
        provider = a [gid.gtk4.style_provider.StyleProvider]
  */
  static void removeProviderForDisplay(gid.gdk4.display.Display display, gid.gtk4.style_provider.StyleProvider provider) nothrow
  {
    gtk_style_context_remove_provider_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /**
      Adds a style class to context, so later uses of the
      style context will make use of this new class for styling.
      
      In the CSS file format, a [gid.gtk4.entry.Entry] defining a “search”
      class, would be matched by:
      
      ```css
      entry.search { ... }
      ```
      
      While any widget defining a “search” class would be
      matched by:
      ```css
      .search { ... }
      ```
  
      Params:
        className = class name to use in styling
  
      Deprecated: Use [gid.gtk4.widget.Widget.addCssClass] instead
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
      [gid.gtk4.style_context.StyleContext.addProviderForDisplay].
      
      Note: If both priorities are the same, a [gid.gtk4.style_provider.StyleProvider]
      added through this function takes precedence over another added
      through [gid.gtk4.style_context.StyleContext.addProviderForDisplay].
  
      Params:
        provider = a [gid.gtk4.style_provider.StyleProvider]
        priority = the priority of the style provider. The lower
            it is, the earlier it will be used in the style construction.
            Typically this will be in the range between
            [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_FALLBACK] and
            [gid.gtk4.types.STYLE_PROVIDER_PRIORITY_USER]
  
      Deprecated: Use style classes instead
  */
  void addProvider(gid.gtk4.style_provider.StyleProvider provider, uint priority) nothrow
  {
    gtk_style_context_add_provider(cast(GtkStyleContext*)this._cPtr, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null, priority);
  }

  /**
      Gets the border for a given state as a [gid.gtk4.border.Border].
  
      Params:
        border = return value for the border settings
  
      Deprecated: This api will be removed in GTK 5
  */
  void getBorder(out gid.gtk4.border.Border border) nothrow
  {
    gtk_style_context_get_border(cast(GtkStyleContext*)this._cPtr, cast(GtkBorder*)&border);
  }

  /**
      Gets the foreground color for a given state.
  
      Params:
        color = return value for the foreground color
  
      Deprecated: Use [gid.gtk4.widget.Widget.getColor] instead
  */
  void getColor(out gid.gdk4.rgba.RGBA color) nothrow
  {
    gtk_style_context_get_color(cast(GtkStyleContext*)this._cPtr, cast(GdkRGBA*)&color);
  }

  /**
      Returns the [gid.gdk4.display.Display] to which context is attached.
      Returns: a [gid.gdk4.display.Display].
  
      Deprecated: Use [gid.gtk4.widget.Widget.getDisplay] instead
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = gtk_style_context_get_display(cast(GtkStyleContext*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the margin for a given state as a [gid.gtk4.border.Border].
  
      Params:
        margin = return value for the margin settings
  
      Deprecated: This api will be removed in GTK 5
  */
  void getMargin(out gid.gtk4.border.Border margin) nothrow
  {
    gtk_style_context_get_margin(cast(GtkStyleContext*)this._cPtr, cast(GtkBorder*)&margin);
  }

  /**
      Gets the padding for a given state as a [gid.gtk4.border.Border].
  
      Params:
        padding = return value for the padding settings
  
      Deprecated: This api will be removed in GTK 5
  */
  void getPadding(out gid.gtk4.border.Border padding) nothrow
  {
    gtk_style_context_get_padding(cast(GtkStyleContext*)this._cPtr, cast(GtkBorder*)&padding);
  }

  /**
      Returns the scale used for assets.
      Returns: the scale
  
      Deprecated: Use [gid.gtk4.widget.Widget.getScaleFactor] instead
  */
  int getScale() nothrow
  {
    int _retval;
    _retval = gtk_style_context_get_scale(cast(GtkStyleContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns the state used for style matching.
      
      This method should only be used to retrieve the [gid.gtk4.types.StateFlags]
      to pass to [gid.gtk4.style_context.StyleContext] methods, like
      [gid.gtk4.style_context.StyleContext.getPadding].
      If you need to retrieve the current state of a [gid.gtk4.widget.Widget], use
      [gid.gtk4.widget.Widget.getStateFlags].
      Returns: the state flags
  
      Deprecated: Use [gid.gtk4.widget.Widget.getStateFlags] instead
  */
  gid.gtk4.types.StateFlags getState() nothrow
  {
    GtkStateFlags _cretval;
    _cretval = gtk_style_context_get_state(cast(GtkStyleContext*)this._cPtr);
    gid.gtk4.types.StateFlags _retval = cast(gid.gtk4.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Returns true if context currently has defined the
      given class name.
  
      Params:
        className = a class name
      Returns: true if context has class_name defined
  
      Deprecated: Use [gid.gtk4.widget.Widget.hasCssClass] instead
  */
  bool hasClass(string className) nothrow
  {
    bool _retval;
    const(char)* _className = className.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_style_context_has_class(cast(GtkStyleContext*)this._cPtr, _className);
    return _retval;
  }

  /**
      Looks up and resolves a color name in the context color map.
  
      Params:
        colorName = color name to lookup
        color = Return location for the looked up color
      Returns: true if color_name was found and resolved, false otherwise
  
      Deprecated: This api will be removed in GTK 5
  */
  bool lookupColor(string colorName, out gid.gdk4.rgba.RGBA color) nothrow
  {
    bool _retval;
    const(char)* _colorName = colorName.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)gtk_style_context_lookup_color(cast(GtkStyleContext*)this._cPtr, _colorName, cast(GdkRGBA*)&color);
    return _retval;
  }

  /**
      Removes class_name from context.
  
      Params:
        className = class name to remove
  
      Deprecated: Use [gid.gtk4.widget.Widget.removeCssClass] instead
  */
  void removeClass(string className) nothrow
  {
    const(char)* _className = className.toCString!(No.Malloc, No.Nullable);
    gtk_style_context_remove_class(cast(GtkStyleContext*)this._cPtr, _className);
  }

  /**
      Removes provider from the style providers list in context.
  
      Params:
        provider = a [gid.gtk4.style_provider.StyleProvider]
  */
  void removeProvider(gid.gtk4.style_provider.StyleProvider provider) nothrow
  {
    gtk_style_context_remove_provider(cast(GtkStyleContext*)this._cPtr, provider ? cast(GtkStyleProvider*)(cast(gid.gobject2.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /**
      Restores context state to a previous stage.
      
      See [gid.gtk4.style_context.StyleContext.save].
  
      Deprecated: This API will be removed in GTK 5
  */
  void restore() nothrow
  {
    gtk_style_context_restore(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Saves the context state.
      
      This allows temporary modifications done through
      [gid.gtk4.style_context.StyleContext.addClass],
      [gid.gtk4.style_context.StyleContext.removeClass],
      [gid.gtk4.style_context.StyleContext.setState] to be quickly
      reverted in one go through [gid.gtk4.style_context.StyleContext.restore].
      
      The matching call to [gid.gtk4.style_context.StyleContext.restore]
      must be done before GTK returns to the main loop.
  
      Deprecated: This API will be removed in GTK 5
  */
  void save() nothrow
  {
    gtk_style_context_save(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Attaches context to the given display.
      
      The display is used to add style information from “global”
      style providers, such as the display's [gid.gtk4.settings.Settings] instance.
      
      If you are using a [gid.gtk4.style_context.StyleContext] returned from
      [gid.gtk4.widget.Widget.getStyleContext], you do not need to
      call this yourself.
  
      Params:
        display = a [gid.gdk4.display.Display]
  
      Deprecated: You should not use this api
  */
  void setDisplay(gid.gdk4.display.Display display) nothrow
  {
    gtk_style_context_set_display(cast(GtkStyleContext*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Sets the scale to use when getting image assets for the style.
  
      Params:
        scale = scale
  
      Deprecated: You should not use this api
  */
  void setScale(int scale) nothrow
  {
    gtk_style_context_set_scale(cast(GtkStyleContext*)this._cPtr, scale);
  }

  /**
      Sets the state to be used for style matching.
  
      Params:
        flags = state to represent
  
      Deprecated: You should not use this api
  */
  void setState(gid.gtk4.types.StateFlags flags) nothrow
  {
    gtk_style_context_set_state(cast(GtkStyleContext*)this._cPtr, flags);
  }

  /**
      Converts the style context into a string representation.
      
      The string representation always includes information about
      the name, state, id, visibility and style classes of the CSS
      node that is backing context. Depending on the flags, more
      information may be included.
      
      This function is intended for testing and debugging of the
      CSS implementation in GTK. There are no guarantees about
      the format of the returned string, it may change.
  
      Params:
        flags = Flags that determine what to print
      Returns: a newly allocated string representing context
  
      Deprecated: This api will be removed in GTK 5
  */
  string toString_(gid.gtk4.types.StyleContextPrintFlags flags) nothrow
  {
    char* _cretval;
    _cretval = gtk_style_context_to_string(cast(GtkStyleContext*)this._cPtr, flags);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtk4.style_context.StyleContext]
class StyleContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `display` property.
      Params:
        propval = The display of the style context.
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }
}

/// Fluent builder for [gid.gtk4.style_context.StyleContext]
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
