/// Module for [StyleContext] class
module gtk.style_context;

import gdk.display;
import gdk.rgba;
import gid.gid;
import gobject.object;
import gtk.border;
import gtk.c.functions;
import gtk.c.types;
import gtk.style_provider;
import gtk.types;

/**
    [gtk.style_context.StyleContext] stores styling information affecting a widget.
    
    In order to construct the final style information, [gtk.style_context.StyleContext]
    queries information from all attached `GtkStyleProviders`. Style
    providers can be either attached explicitly to the context through
    [gtk.style_context.StyleContext.addProvider], or to the display through
    [gtk.style_context.StyleContext.addProviderForDisplay]. The resulting
    style is a combination of all providers’ information in priority order.
    
    For GTK widgets, any [gtk.style_context.StyleContext] returned by
    [gtk.widget.Widget.getStyleContext] will already have a [gdk.display.Display]
    and RTL/LTR information set. The style context will also be updated
    automatically if any of these settings change on the widget.
    
    ## Style Classes
    
    Widgets can add style classes to their context, which can be used to associate
    different styles by class. The documentation for individual widgets lists
    which style classes it uses itself, and which style classes may be added by
    applications to affect their appearance.
    
    # Custom styling in UI libraries and applications
    
    If you are developing a library with custom widgets that render differently
    than standard components, you may need to add a [gtk.style_provider.StyleProvider] yourself
    with the `GTK_STYLE_PROVIDER_PRIORITY_FALLBACK` priority, either a
    [gtk.css_provider.CssProvider] or a custom object implementing the [gtk.style_provider.StyleProvider]
    interface. This way themes may still attempt to style your UI elements in
    a different way if needed so.
    
    If you are using custom styling on an applications, you probably want then
    to make your style information prevail to the theme’s, so you must use
    a [gtk.style_provider.StyleProvider] with the `GTK_STYLE_PROVIDER_PRIORITY_APPLICATION`
    priority, keep in mind that the user settings in
    `XDG_CONFIG_HOME/gtk-4.0/gtk.css` will
    still take precedence over your changes, as it uses the
    `GTK_STYLE_PROVIDER_PRIORITY_USER` priority.

    Deprecated: The relevant API has been moved to [gtk.widget.Widget]
        where applicable; otherwise, there is no replacement for querying the
        style machinery. Stylable UI elements should use widgets.
*/
class StyleContext : gobject.object.ObjectWrap
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
    return cast(void function())gtk_style_context_get_type != &gidSymbolNotFound ? gtk_style_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleContext self()
  {
    return this;
  }

  /** */
  @property gdk.display.Display display()
  {
    return getDisplay();
  }

  /** */
  @property void display(gdk.display.Display propval)
  {
    return setDisplay(propval);
  }

  /**
      Adds a global style provider to display, which will be used
      in style construction for all `GtkStyleContexts` under display.
      
      GTK uses this to make styling information from [gtk.settings.Settings]
      available.
      
      Note: If both priorities are the same, A [gtk.style_provider.StyleProvider]
      added through [gtk.style_context.StyleContext.addProvider] takes
      precedence over another added through this function.
  
      Params:
        display = a [gdk.display.Display]
        provider = a [gtk.style_provider.StyleProvider]
        priority = the priority of the style provider. The lower
            it is, the earlier it will be used in the style construction.
            Typically this will be in the range between
            `GTK_STYLE_PROVIDER_PRIORITY_FALLBACK` and
            `GTK_STYLE_PROVIDER_PRIORITY_USER`
  */
  static void addProviderForDisplay(gdk.display.Display display, gtk.style_provider.StyleProvider provider, uint priority)
  {
    gtk_style_context_add_provider_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, provider ? cast(GtkStyleProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null, priority);
  }

  /**
      Removes provider from the global style providers list in display.
  
      Params:
        display = a [gdk.display.Display]
        provider = a [gtk.style_provider.StyleProvider]
  */
  static void removeProviderForDisplay(gdk.display.Display display, gtk.style_provider.StyleProvider provider)
  {
    gtk_style_context_remove_provider_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null, provider ? cast(GtkStyleProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /**
      Adds a style class to context, so later uses of the
      style context will make use of this new class for styling.
      
      In the CSS file format, a [gtk.entry.Entry] defining a “search”
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
  
      Deprecated: Use [gtk.widget.Widget.addCssClass] instead
  */
  void addClass(string className)
  {
    const(char)* _className = className.toCString(No.Alloc);
    gtk_style_context_add_class(cast(GtkStyleContext*)this._cPtr, _className);
  }

  /**
      Adds a style provider to context, to be used in style construction.
      
      Note that a style provider added by this function only affects
      the style of the widget to which context belongs. If you want
      to affect the style of all widgets, use
      [gtk.style_context.StyleContext.addProviderForDisplay].
      
      Note: If both priorities are the same, a [gtk.style_provider.StyleProvider]
      added through this function takes precedence over another added
      through [gtk.style_context.StyleContext.addProviderForDisplay].
  
      Params:
        provider = a [gtk.style_provider.StyleProvider]
        priority = the priority of the style provider. The lower
            it is, the earlier it will be used in the style construction.
            Typically this will be in the range between
            `GTK_STYLE_PROVIDER_PRIORITY_FALLBACK` and
            `GTK_STYLE_PROVIDER_PRIORITY_USER`
  
      Deprecated: Use style classes instead
  */
  void addProvider(gtk.style_provider.StyleProvider provider, uint priority)
  {
    gtk_style_context_add_provider(cast(GtkStyleContext*)this._cPtr, provider ? cast(GtkStyleProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null, priority);
  }

  /**
      Gets the border for a given state as a [gtk.border.Border].
  
      Params:
        border = return value for the border settings
  
      Deprecated: This api will be removed in GTK 5
  */
  void getBorder(out gtk.border.Border border)
  {
    GtkBorder _border;
    gtk_style_context_get_border(cast(GtkStyleContext*)this._cPtr, &_border);
    border = new gtk.border.Border(cast(void*)&_border, No.Take);
  }

  /**
      Gets the foreground color for a given state.
  
      Params:
        color = return value for the foreground color
  
      Deprecated: Use [gtk.widget.Widget.getColor] instead
  */
  void getColor(out gdk.rgba.RGBA color)
  {
    GdkRGBA _color;
    gtk_style_context_get_color(cast(GtkStyleContext*)this._cPtr, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
  }

  /**
      Returns the [gdk.display.Display] to which context is attached.
      Returns: a [gdk.display.Display].
  
      Deprecated: Use [gtk.widget.Widget.getDisplay] instead
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_style_context_get_display(cast(GtkStyleContext*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the margin for a given state as a [gtk.border.Border].
  
      Params:
        margin = return value for the margin settings
  
      Deprecated: This api will be removed in GTK 5
  */
  void getMargin(out gtk.border.Border margin)
  {
    GtkBorder _margin;
    gtk_style_context_get_margin(cast(GtkStyleContext*)this._cPtr, &_margin);
    margin = new gtk.border.Border(cast(void*)&_margin, No.Take);
  }

  /**
      Gets the padding for a given state as a [gtk.border.Border].
  
      Params:
        padding = return value for the padding settings
  
      Deprecated: This api will be removed in GTK 5
  */
  void getPadding(out gtk.border.Border padding)
  {
    GtkBorder _padding;
    gtk_style_context_get_padding(cast(GtkStyleContext*)this._cPtr, &_padding);
    padding = new gtk.border.Border(cast(void*)&_padding, No.Take);
  }

  /**
      Returns the scale used for assets.
      Returns: the scale
  
      Deprecated: Use [gtk.widget.Widget.getScaleFactor] instead
  */
  int getScale()
  {
    int _retval;
    _retval = gtk_style_context_get_scale(cast(GtkStyleContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns the state used for style matching.
      
      This method should only be used to retrieve the [gtk.types.StateFlags]
      to pass to [gtk.style_context.StyleContext] methods, like
      [gtk.style_context.StyleContext.getPadding].
      If you need to retrieve the current state of a [gtk.widget.Widget], use
      [gtk.widget.Widget.getStateFlags].
      Returns: the state flags
  
      Deprecated: Use [gtk.widget.Widget.getStateFlags] instead
  */
  gtk.types.StateFlags getState()
  {
    GtkStateFlags _cretval;
    _cretval = gtk_style_context_get_state(cast(GtkStyleContext*)this._cPtr);
    gtk.types.StateFlags _retval = cast(gtk.types.StateFlags)_cretval;
    return _retval;
  }

  /**
      Returns true if context currently has defined the
      given class name.
  
      Params:
        className = a class name
      Returns: true if context has class_name defined
  
      Deprecated: Use [gtk.widget.Widget.hasCssClass] instead
  */
  bool hasClass(string className)
  {
    bool _retval;
    const(char)* _className = className.toCString(No.Alloc);
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
  bool lookupColor(string colorName, out gdk.rgba.RGBA color)
  {
    bool _retval;
    const(char)* _colorName = colorName.toCString(No.Alloc);
    GdkRGBA _color;
    _retval = cast(bool)gtk_style_context_lookup_color(cast(GtkStyleContext*)this._cPtr, _colorName, &_color);
    color = new gdk.rgba.RGBA(cast(void*)&_color, No.Take);
    return _retval;
  }

  /**
      Removes class_name from context.
  
      Params:
        className = class name to remove
  
      Deprecated: Use [gtk.widget.Widget.removeCssClass] instead
  */
  void removeClass(string className)
  {
    const(char)* _className = className.toCString(No.Alloc);
    gtk_style_context_remove_class(cast(GtkStyleContext*)this._cPtr, _className);
  }

  /**
      Removes provider from the style providers list in context.
  
      Params:
        provider = a [gtk.style_provider.StyleProvider]
  */
  void removeProvider(gtk.style_provider.StyleProvider provider)
  {
    gtk_style_context_remove_provider(cast(GtkStyleContext*)this._cPtr, provider ? cast(GtkStyleProvider*)(cast(gobject.object.ObjectWrap)provider)._cPtr(No.Dup) : null);
  }

  /**
      Restores context state to a previous stage.
      
      See [gtk.style_context.StyleContext.save].
  
      Deprecated: This API will be removed in GTK 5
  */
  void restore()
  {
    gtk_style_context_restore(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Saves the context state.
      
      This allows temporary modifications done through
      [gtk.style_context.StyleContext.addClass],
      [gtk.style_context.StyleContext.removeClass],
      [gtk.style_context.StyleContext.setState] to be quickly
      reverted in one go through [gtk.style_context.StyleContext.restore].
      
      The matching call to [gtk.style_context.StyleContext.restore]
      must be done before GTK returns to the main loop.
  
      Deprecated: This API will be removed in GTK 5
  */
  void save()
  {
    gtk_style_context_save(cast(GtkStyleContext*)this._cPtr);
  }

  /**
      Attaches context to the given display.
      
      The display is used to add style information from “global”
      style providers, such as the display's [gtk.settings.Settings] instance.
      
      If you are using a [gtk.style_context.StyleContext] returned from
      [gtk.widget.Widget.getStyleContext], you do not need to
      call this yourself.
  
      Params:
        display = a [gdk.display.Display]
  
      Deprecated: You should not use this api
  */
  void setDisplay(gdk.display.Display display)
  {
    gtk_style_context_set_display(cast(GtkStyleContext*)this._cPtr, display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
  }

  /**
      Sets the scale to use when getting image assets for the style.
  
      Params:
        scale = scale
  
      Deprecated: You should not use this api
  */
  void setScale(int scale)
  {
    gtk_style_context_set_scale(cast(GtkStyleContext*)this._cPtr, scale);
  }

  /**
      Sets the state to be used for style matching.
  
      Params:
        flags = state to represent
  
      Deprecated: You should not use this api
  */
  void setState(gtk.types.StateFlags flags)
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
  string toString_(gtk.types.StyleContextPrintFlags flags)
  {
    char* _cretval;
    _cretval = gtk_style_context_to_string(cast(GtkStyleContext*)this._cPtr, flags);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
