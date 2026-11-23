/// Module for [StyleManager] class
module gid.adw1.style_manager;

public import gid.core.basictypes;
import gid.adw1.c.functions;
import gid.adw1.c.types;
import gid.adw1.types;
import gid.core.utils;
import gid.gdk4.display;
import gid.gdk4.rgba;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A class for managing application-wide styling.
    
    [gid.adw1.style_manager.StyleManager] provides a way to query and influence the application
    styles, such as whether to use dark style, the system accent color or high
    contrast appearance.
    
    It allows to set the color scheme via the
    [gid.adw1.style_manager.StyleManager.colorScheme] property, and to query the current
    appearance, as well as whether a system-wide color scheme and accent color
    preferences exists.
*/
class StyleManager : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gobject.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())adw_style_manager_get_type != &gidSymbolNotFound ? adw_style_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "AdwStyleManager";
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleManager self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.adw1.style_manager.StyleManager]
      Returns: New builder object
  */
  static StyleManagerGidBuilder builder() nothrow
  {
    return new StyleManagerGidBuilder;
  }

  /**
      Get `accentColor` property.
      Returns: The current system accent color.
        
        See also [gid.adw1.style_manager.StyleManager.accentColorRgba].
  */
  @property gid.adw1.types.AccentColor accentColor() nothrow
  {
    return getAccentColor();
  }

  /**
      Get `accentColorRgba` property.
      Returns: The current system accent color as a [gid.gdk4.rgba.RGBA].
        
        Equivalent to calling `func@AccentColor.to_rgba` on the value of
        [gid.adw1.style_manager.StyleManager.accentColor].
        
        This is a background color. The matching foreground color is white.
  */
  @property gid.gdk4.rgba.RGBA accentColorRgba() nothrow
  {
    return getAccentColorRgba();
  }

  /**
      Get `colorScheme` property.
      Returns: The requested application color scheme.
        
        The effective appearance will be decided based on the application color
        scheme and the system preferred color scheme. The
        [gid.adw1.style_manager.StyleManager.dark] property can be used to query the current
        effective appearance.
        
        The `enum@Adw.ColorScheme.prefer-light` color scheme results in the
        application using light appearance unless the system prefers dark colors.
        This is the default value.
        
        The `enum@Adw.ColorScheme.prefer-dark` color scheme results in the
        application using dark appearance, but can still switch to the light
        appearance if the system can prefers it, for example, when the high
        contrast preference is
        enabled.
        
        The `enum@Adw.ColorScheme.force-light` and `enum@Adw.ColorScheme.force-dark`
        values ignore the system preference entirely. They are useful if the
        application wants to match its UI to its content or to provide a separate
        color scheme switcher.
        
        If a per-[gid.gdk4.display.Display] style manager has its color scheme set to
        [gid.adw1.types.ColorScheme.Default], it will inherit the color scheme from the
        default style manager.
        
        For the default style manager, [gid.adw1.types.ColorScheme.Default] is equivalent
        to `enum@Adw.ColorScheme.prefer-light`.
        
        The [gid.adw1.style_manager.StyleManager.systemSupportsColorSchemes] property can be
        used to check if the current environment provides a color scheme
        preference.
  */
  @property gid.adw1.types.ColorScheme colorScheme() nothrow
  {
    return getColorScheme();
  }

  /**
      Set `colorScheme` property.
      Params:
        propval = The requested application color scheme.
          
          The effective appearance will be decided based on the application color
          scheme and the system preferred color scheme. The
          [gid.adw1.style_manager.StyleManager.dark] property can be used to query the current
          effective appearance.
          
          The `enum@Adw.ColorScheme.prefer-light` color scheme results in the
          application using light appearance unless the system prefers dark colors.
          This is the default value.
          
          The `enum@Adw.ColorScheme.prefer-dark` color scheme results in the
          application using dark appearance, but can still switch to the light
          appearance if the system can prefers it, for example, when the high
          contrast preference is
          enabled.
          
          The `enum@Adw.ColorScheme.force-light` and `enum@Adw.ColorScheme.force-dark`
          values ignore the system preference entirely. They are useful if the
          application wants to match its UI to its content or to provide a separate
          color scheme switcher.
          
          If a per-[gid.gdk4.display.Display] style manager has its color scheme set to
          [gid.adw1.types.ColorScheme.Default], it will inherit the color scheme from the
          default style manager.
          
          For the default style manager, [gid.adw1.types.ColorScheme.Default] is equivalent
          to `enum@Adw.ColorScheme.prefer-light`.
          
          The [gid.adw1.style_manager.StyleManager.systemSupportsColorSchemes] property can be
          used to check if the current environment provides a color scheme
          preference.
  */
  @property void colorScheme(gid.adw1.types.ColorScheme propval) nothrow
  {
    setColorScheme(propval);
  }

  /**
      Get `dark` property.
      Returns: Whether the application is using dark appearance.
        
        This property can be used to query the current appearance, as requested via
        [gid.adw1.style_manager.StyleManager.colorScheme].
  */
  @property bool dark() nothrow
  {
    return getDark();
  }

  /**
      Get `display` property.
      Returns: The display the style manager is associated with.
        
        The display will be `NULL` for the style manager returned by
        [gid.adw1.style_manager.StyleManager.getDefault].
  */
  @property gid.gdk4.display.Display display() nothrow
  {
    return getDisplay();
  }

  /**
      Get `documentFontName` property.
      Returns: The system document font.
        
        The font is in the same format as [gid.gtk4.settings.Settings.gtkFontName],
        e.g. "Adwaita Sans 12".
        
        Use [gid.pango1.font_description.FontDescription.fromString] to parse it.
  */
  @property string documentFontName() nothrow
  {
    return getDocumentFontName();
  }

  /**
      Get `highContrast` property.
      Returns: Whether the application is using high contrast appearance.
        
        This cannot be overridden by applications.
  */
  @property bool highContrast() nothrow
  {
    return getHighContrast();
  }

  /**
      Get `monospaceFontName` property.
      Returns: The system monospace font.
        
        The font is in the same format as [gid.gtk4.settings.Settings.gtkFontName],
        e.g. "Adwaita Mono 11".
        
        Use [gid.pango1.font_description.FontDescription.fromString] to parse it.
  */
  @property string monospaceFontName() nothrow
  {
    return getMonospaceFontName();
  }

  /**
      Get `systemSupportsAccentColors` property.
      Returns: Whether the system supports accent colors.
        
        This property can be used to check if the current environment provides an
        accent color preference. For example, applications might want to show a
        preference for choosing accent color if it's set to `FALSE`.
        
        See [gid.adw1.style_manager.StyleManager.accentColor].
  */
  @property bool systemSupportsAccentColors() nothrow
  {
    return getSystemSupportsAccentColors();
  }

  /**
      Get `systemSupportsColorSchemes` property.
      Returns: Whether the system supports color schemes.
        
        This property can be used to check if the current environment provides a
        color scheme preference. For example, applications might want to show a
        separate appearance switcher if it's set to `FALSE`.
        
        See [gid.adw1.style_manager.StyleManager.colorScheme].
  */
  @property bool systemSupportsColorSchemes() nothrow
  {
    return getSystemSupportsColorSchemes();
  }

  /**
      Get `yaruAccent` property.
      Returns: The Yaru accent color used by the application, if any.
        This is only available in ubuntu.
        
        This cannot be overridden by applications.
  */
  @property string yaruAccent() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("yaru-accent");
  }

  /**
      Gets the default [gid.adw1.style_manager.StyleManager] instance.
      
      It manages all [gid.gdk4.display.Display] instances unless the style manager for
      that display has an override.
      
      See [gid.adw1.style_manager.StyleManager.getForDisplay].
      Returns: the default style manager
  */
  static gid.adw1.style_manager.StyleManager getDefault() nothrow
  {
    AdwStyleManager* _cretval;
    _cretval = adw_style_manager_get_default();
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.style_manager.StyleManager)(cast(AdwStyleManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gid.adw1.style_manager.StyleManager] instance managing display.
      
      It can be used to override styles for that specific display instead of the
      whole application.
      
      Most applications should use [gid.adw1.style_manager.StyleManager.getDefault] instead.
  
      Params:
        display = a [gid.gdk4.display.Display]
      Returns: the style manager for display
  */
  static gid.adw1.style_manager.StyleManager getForDisplay(gid.gdk4.display.Display display) nothrow
  {
    AdwStyleManager* _cretval;
    _cretval = adw_style_manager_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.adw1.style_manager.StyleManager)(cast(AdwStyleManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the current system accent color.
      
      See also [gid.adw1.style_manager.StyleManager.accentColorRgba].
      Returns: the current system accent color
  */
  gid.adw1.types.AccentColor getAccentColor() nothrow
  {
    AdwAccentColor _cretval;
    _cretval = adw_style_manager_get_accent_color(cast(AdwStyleManager*)this._cPtr);
    gid.adw1.types.AccentColor _retval = cast(gid.adw1.types.AccentColor)_cretval;
    return _retval;
  }

  /**
      Gets the current system accent color as a [gid.gdk4.rgba.RGBA].
      
      Equivalent to calling `funcAccentColor.to_rgba` on the value of
      [gid.adw1.style_manager.StyleManager.accentColor].
      
      This is a background color. The matching foreground color is white.
      Returns: the current system accent color
  */
  gid.gdk4.rgba.RGBA getAccentColorRgba() nothrow
  {
    GdkRGBA* _cretval;
    _cretval = adw_style_manager_get_accent_color_rgba(cast(AdwStyleManager*)this._cPtr);
    gid.gdk4.rgba.RGBA _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gdk4.rgba.RGBA*)_cretval;
      cValueFree!(gid.gdk4.rgba.RGBA)(_cretval);
    }
    return _retval;
  }

  /**
      Gets the requested application color scheme.
      Returns: the color scheme
  */
  gid.adw1.types.ColorScheme getColorScheme() nothrow
  {
    AdwColorScheme _cretval;
    _cretval = adw_style_manager_get_color_scheme(cast(AdwStyleManager*)this._cPtr);
    gid.adw1.types.ColorScheme _retval = cast(gid.adw1.types.ColorScheme)_cretval;
    return _retval;
  }

  /**
      Gets whether the application is using dark appearance.
      
      This can be used to query the current appearance, as requested via
      [gid.adw1.style_manager.StyleManager.colorScheme].
      Returns: whether the application is using dark appearance
  */
  bool getDark() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_style_manager_get_dark(cast(AdwStyleManager*)this._cPtr);
    return _retval;
  }

  /**
      Gets the display the style manager is associated with.
      
      The display will be `NULL` for the style manager returned by
      [gid.adw1.style_manager.StyleManager.getDefault].
      Returns: the display
  */
  gid.gdk4.display.Display getDisplay() nothrow
  {
    GdkDisplay* _cretval;
    _cretval = adw_style_manager_get_display(cast(AdwStyleManager*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdk4.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the system document font.
      
      The font is in the same format as [gid.gtk4.settings.Settings.gtkFontName],
      e.g. "Adwaita Sans 12".
      
      Use [gid.pango1.font_description.FontDescription.fromString] to parse it.
      Returns: the system document font
  */
  string getDocumentFontName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_style_manager_get_document_font_name(cast(AdwStyleManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the application is using high contrast appearance.
      
      This cannot be overridden by applications.
      Returns: whether the application is using high contrast appearance
  */
  bool getHighContrast() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_style_manager_get_high_contrast(cast(AdwStyleManager*)this._cPtr);
    return _retval;
  }

  /**
      Gets the system monospace font.
      
      The font is in the same format as [gid.gtk4.settings.Settings.gtkFontName],
      e.g. "Adwaita Mono 11".
      
      Use [gid.pango1.font_description.FontDescription.fromString] to parse it.
      Returns: the system monospace font
  */
  string getMonospaceFontName() nothrow
  {
    const(char)* _cretval;
    _cretval = adw_style_manager_get_monospace_font_name(cast(AdwStyleManager*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets whether the system supports accent colors.
      
      This can be used to check if the current environment provides an accent color
      preference. For example, applications might want to show a preference for
      choosing accent color if it's set to `FALSE`.
      
      See [gid.adw1.style_manager.StyleManager.accentColor].
      Returns: whether the system supports accent colors
  */
  bool getSystemSupportsAccentColors() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_style_manager_get_system_supports_accent_colors(cast(AdwStyleManager*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the system supports color schemes.
      
      This can be used to check if the current environment provides a color scheme
      preference. For example, applications might want to show a separate
      appearance switcher if it's set to `FALSE`.
      Returns: whether the system supports color schemes
  */
  bool getSystemSupportsColorSchemes() nothrow
  {
    bool _retval;
    _retval = cast(bool)adw_style_manager_get_system_supports_color_schemes(cast(AdwStyleManager*)this._cPtr);
    return _retval;
  }

  /**
      Sets the requested application color scheme.
      
      The effective appearance will be decided based on the application color
      scheme and the system preferred color scheme. The
      [gid.adw1.style_manager.StyleManager.dark] property can be used to query the current
      effective appearance.
      
      The `enumAdw.ColorScheme.prefer-light` color scheme results in the
      application using light appearance unless the system prefers dark colors.
      This is the default value.
      
      The `enumAdw.ColorScheme.prefer-dark` color scheme results in the
      application using dark appearance, but can still switch to the light
      appearance if the system can prefers it, for example, when the high contrast
      preference is enabled.
      
      The `enumAdw.ColorScheme.force-light` and `enumAdw.ColorScheme.force-dark`
      values ignore the system preference entirely. They are useful if the
      application wants to match its UI to its content or to provide a separate
      color scheme switcher.
      
      If a per-[gid.gdk4.display.Display] style manager has its color scheme set to
      [gid.adw1.types.ColorScheme.Default], it will inherit the color scheme from the
      default style manager.
      
      For the default style manager, [gid.adw1.types.ColorScheme.Default] is equivalent
      to `enumAdw.ColorScheme.prefer-light`.
      
      The [gid.adw1.style_manager.StyleManager.systemSupportsColorSchemes] property can be
      used to check if the current environment provides a color scheme
      preference.
  
      Params:
        colorScheme = the color scheme
  */
  void setColorScheme(gid.adw1.types.ColorScheme colorScheme) nothrow
  {
    adw_style_manager_set_color_scheme(cast(AdwStyleManager*)this._cPtr, colorScheme);
  }
}

/// Fluent builder implementation template for [gid.adw1.style_manager.StyleManager]
class StyleManagerGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `colorScheme` property.
      Params:
        propval = The requested application color scheme.
          
          The effective appearance will be decided based on the application color
          scheme and the system preferred color scheme. The
          [gid.adw1.style_manager.StyleManager.dark] property can be used to query the current
          effective appearance.
          
          The `enum@Adw.ColorScheme.prefer-light` color scheme results in the
          application using light appearance unless the system prefers dark colors.
          This is the default value.
          
          The `enum@Adw.ColorScheme.prefer-dark` color scheme results in the
          application using dark appearance, but can still switch to the light
          appearance if the system can prefers it, for example, when the high
          contrast preference is
          enabled.
          
          The `enum@Adw.ColorScheme.force-light` and `enum@Adw.ColorScheme.force-dark`
          values ignore the system preference entirely. They are useful if the
          application wants to match its UI to its content or to provide a separate
          color scheme switcher.
          
          If a per-[gid.gdk4.display.Display] style manager has its color scheme set to
          [gid.adw1.types.ColorScheme.Default], it will inherit the color scheme from the
          default style manager.
          
          For the default style manager, [gid.adw1.types.ColorScheme.Default] is equivalent
          to `enum@Adw.ColorScheme.prefer-light`.
          
          The [gid.adw1.style_manager.StyleManager.systemSupportsColorSchemes] property can be
          used to check if the current environment provides a color scheme
          preference.
      Returns: Builder instance for fluent chaining
  */
  T colorScheme(gid.adw1.types.ColorScheme propval) nothrow
  {
    return setProperty("color-scheme", propval);
  }

  /**
      Set `display` property.
      Params:
        propval = The display the style manager is associated with.
          
          The display will be `NULL` for the style manager returned by
          [gid.adw1.style_manager.StyleManager.getDefault].
      Returns: Builder instance for fluent chaining
  */
  T display(gid.gdk4.display.Display propval) nothrow
  {
    return setProperty("display", propval);
  }
}

/// Fluent builder for [gid.adw1.style_manager.StyleManager]
final class StyleManagerGidBuilder : StyleManagerGidBuilderImpl!StyleManagerGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  StyleManager build() nothrow
  {
    return new StyleManager(cast(void*)createGObject(StyleManager._getGType), Yes.Take);
  }
}
