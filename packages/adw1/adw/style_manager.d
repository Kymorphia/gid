/// Module for [StyleManager] class
module adw.style_manager;

import adw.c.functions;
import adw.c.types;
import adw.types;
import gdk.display;
import gid.gid;
import gobject.object;

/**
    A class for managing application-wide styling.
    
    [adw.style_manager.StyleManager] provides a way to query and influence the application
    styles, such as whether to use dark or high contrast appearance.
    
    It allows to set the color scheme via the
    `property@StyleManager:color-scheme` property, and to query the current
    appearance, as well as whether a system-wide color scheme preference exists.
*/
class StyleManager : gobject.object.ObjectWrap
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
    return cast(void function())adw_style_manager_get_type != &gidSymbolNotFound ? adw_style_manager_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override StyleManager self()
  {
    return this;
  }

  /**
      Get `colorScheme` property.
      Returns: The requested application color scheme.
        
        The effective appearance will be decided based on the application color
        scheme and the system preferred color scheme. The
        `property@StyleManager:dark` property can be used to query the current
        effective appearance.
        
        The [adw.types.ColorScheme.PreferLight] color scheme results in the application
        using light appearance unless the system prefers dark colors. This is the
        default value.
        
        The [adw.types.ColorScheme.PreferDark] color scheme results in the application
        using dark appearance, but can still switch to the light appearance if the
        system can prefers it, for example, when the high contrast preference is
        enabled.
        
        The [adw.types.ColorScheme.ForceLight] and [adw.types.ColorScheme.ForceDark] values
        ignore the system preference entirely. They are useful if the application
        wants to match its UI to its content or to provide a separate color scheme
        switcher.
        
        If a per-[gdk.display.Display] style manager has its color scheme set to
        [adw.types.ColorScheme.Default], it will inherit the color scheme from the
        default style manager.
        
        For the default style manager, [adw.types.ColorScheme.Default] is equivalent to
        [adw.types.ColorScheme.PreferLight].
        
        The `property@StyleManager:system-supports-color-schemes` property can be
        used to check if the current environment provides a color scheme
        preference.
  */
  @property adw.types.ColorScheme colorScheme()
  {
    return getColorScheme();
  }

  /**
      Set `colorScheme` property.
      Params:
        propval = The requested application color scheme.
          
          The effective appearance will be decided based on the application color
          scheme and the system preferred color scheme. The
          `property@StyleManager:dark` property can be used to query the current
          effective appearance.
          
          The [adw.types.ColorScheme.PreferLight] color scheme results in the application
          using light appearance unless the system prefers dark colors. This is the
          default value.
          
          The [adw.types.ColorScheme.PreferDark] color scheme results in the application
          using dark appearance, but can still switch to the light appearance if the
          system can prefers it, for example, when the high contrast preference is
          enabled.
          
          The [adw.types.ColorScheme.ForceLight] and [adw.types.ColorScheme.ForceDark] values
          ignore the system preference entirely. They are useful if the application
          wants to match its UI to its content or to provide a separate color scheme
          switcher.
          
          If a per-[gdk.display.Display] style manager has its color scheme set to
          [adw.types.ColorScheme.Default], it will inherit the color scheme from the
          default style manager.
          
          For the default style manager, [adw.types.ColorScheme.Default] is equivalent to
          [adw.types.ColorScheme.PreferLight].
          
          The `property@StyleManager:system-supports-color-schemes` property can be
          used to check if the current environment provides a color scheme
          preference.
  */
  @property void colorScheme(adw.types.ColorScheme propval)
  {
    return setColorScheme(propval);
  }

  /**
      Get `dark` property.
      Returns: Whether the application is using dark appearance.
        
        This property can be used to query the current appearance, as requested via
        `property@StyleManager:color-scheme`.
  */
  @property bool dark()
  {
    return getDark();
  }

  /**
      Get `highContrast` property.
      Returns: Whether the application is using high contrast appearance.
        
        This cannot be overridden by applications.
  */
  @property bool highContrast()
  {
    return getHighContrast();
  }

  /**
      Get `systemSupportsColorSchemes` property.
      Returns: Whether the system supports color schemes.
        
        This property can be used to check if the current environment provides a
        color scheme preference. For example, applications might want to show a
        separate appearance switcher if it's set to `FALSE`.
        
        See `property@StyleManager:color-scheme`.
  */
  @property bool systemSupportsColorSchemes()
  {
    return getSystemSupportsColorSchemes();
  }

  /**
      Gets the default [adw.style_manager.StyleManager] instance.
      
      It manages all [gdk.display.Display] instances unless the style manager for
      that display has an override.
      
      See [adw.style_manager.StyleManager.getForDisplay].
      Returns: the default style manager
  */
  static adw.style_manager.StyleManager getDefault()
  {
    AdwStyleManager* _cretval;
    _cretval = adw_style_manager_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.style_manager.StyleManager)(cast(AdwStyleManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [adw.style_manager.StyleManager] instance managing display.
      
      It can be used to override styles for that specific display instead of the
      whole application.
      
      Most applications should use [adw.style_manager.StyleManager.getDefault] instead.
  
      Params:
        display = a [gdk.display.Display]
      Returns: the style manager for display
  */
  static adw.style_manager.StyleManager getForDisplay(gdk.display.Display display)
  {
    AdwStyleManager* _cretval;
    _cretval = adw_style_manager_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(adw.style_manager.StyleManager)(cast(AdwStyleManager*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the requested application color scheme.
      Returns: the color scheme
  */
  adw.types.ColorScheme getColorScheme()
  {
    AdwColorScheme _cretval;
    _cretval = adw_style_manager_get_color_scheme(cast(AdwStyleManager*)this._cPtr);
    adw.types.ColorScheme _retval = cast(adw.types.ColorScheme)_cretval;
    return _retval;
  }

  /**
      Gets whether the application is using dark appearance.
      
      This can be used to query the current appearance, as requested via
      `propertyStyleManager:color-scheme`.
      Returns: whether the application is using dark appearance
  */
  bool getDark()
  {
    bool _retval;
    _retval = cast(bool)adw_style_manager_get_dark(cast(AdwStyleManager*)this._cPtr);
    return _retval;
  }

  /**
      Gets the display the style manager is associated with.
      
      The display will be `NULL` for the style manager returned by
      [adw.style_manager.StyleManager.getDefault].
      Returns: the display
  */
  gdk.display.Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = adw_style_manager_get_display(cast(AdwStyleManager*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gdk.display.Display)(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets whether the application is using high contrast appearance.
      
      This cannot be overridden by applications.
      Returns: whether the application is using high contrast appearance
  */
  bool getHighContrast()
  {
    bool _retval;
    _retval = cast(bool)adw_style_manager_get_high_contrast(cast(AdwStyleManager*)this._cPtr);
    return _retval;
  }

  /**
      Gets whether the system supports color schemes.
      
      This can be used to check if the current environment provides a color scheme
      preference. For example, applications might want to show a separate
      appearance switcher if it's set to `FALSE`.
      Returns: whether the system supports color schemes
  */
  bool getSystemSupportsColorSchemes()
  {
    bool _retval;
    _retval = cast(bool)adw_style_manager_get_system_supports_color_schemes(cast(AdwStyleManager*)this._cPtr);
    return _retval;
  }

  /**
      Sets the requested application color scheme.
      
      The effective appearance will be decided based on the application color
      scheme and the system preferred color scheme. The
      `propertyStyleManager:dark` property can be used to query the current
      effective appearance.
      
      The [adw.types.ColorScheme.PreferLight] color scheme results in the application
      using light appearance unless the system prefers dark colors. This is the
      default value.
      
      The [adw.types.ColorScheme.PreferDark] color scheme results in the application
      using dark appearance, but can still switch to the light appearance if the
      system can prefers it, for example, when the high contrast preference is
      enabled.
      
      The [adw.types.ColorScheme.ForceLight] and [adw.types.ColorScheme.ForceDark] values
      ignore the system preference entirely. They are useful if the application
      wants to match its UI to its content or to provide a separate color scheme
      switcher.
      
      If a per-[gdk.display.Display] style manager has its color scheme set to
      [adw.types.ColorScheme.Default], it will inherit the color scheme from the
      default style manager.
      
      For the default style manager, [adw.types.ColorScheme.Default] is equivalent to
      [adw.types.ColorScheme.PreferLight].
      
      The `propertyStyleManager:system-supports-color-schemes` property can be
      used to check if the current environment provides a color scheme
      preference.
  
      Params:
        colorScheme = the color scheme
  */
  void setColorScheme(adw.types.ColorScheme colorScheme)
  {
    adw_style_manager_set_color_scheme(cast(AdwStyleManager*)this._cPtr, colorScheme);
  }
}
