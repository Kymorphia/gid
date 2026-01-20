/// Module for [Settings] class
module gtk.settings;

import gdk.screen;
import gid.gid;
import glib.string_;
import gobject.object;
import gobject.param_spec;
import gobject.value;
import gtk.c.functions;
import gtk.c.types;
import gtk.settings_value;
import gtk.style_provider;
import gtk.style_provider_mixin;
import gtk.types;

/**
    GtkSettings provide a mechanism to share global settings between
    applications.
    
    On the X window system, this sharing is realized by an
    [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
    manager that is usually part of the desktop environment, along with
    utilities that let the user change these settings. In the absence of
    an Xsettings manager, GTK+ reads default values for settings from
    `settings.ini` files in
    `/etc/gtk-3.0`, `$XDG_CONFIG_DIRS/gtk-3.0`
    and `$XDG_CONFIG_HOME/gtk-3.0`.
    These files must be valid key files (see #GKeyFile), and have
    a section called Settings. Themes can also provide default values
    for settings by installing a `settings.ini` file
    next to their `gtk.css` file.
    
    Applications can override system-wide settings by setting the property
    of the GtkSettings object with [gobject.object.ObjectWrap.set]. This should be restricted
    to special cases though; GtkSettings are not meant as an application
    configuration facility. When doing so, you need to be aware that settings
    that are specific to individual widgets may not be available before the
    widget type has been realized at least once. The following example
    demonstrates a way to do this:
    ```c
      gtk_init (&argc, &argv);
    
      // make sure the type is realized
      g_type_class_unref (g_type_class_ref (GTK_TYPE_IMAGE_MENU_ITEM));
    
      g_object_set (gtk_settings_get_default (), "gtk-enable-animations", FALSE, NULL);
    ```
    
    There is one GtkSettings instance per screen. It can be obtained with
    [gtk.settings.Settings.getForScreen], but in many cases, it is more convenient
    to use [gtk.widget.Widget.getSettings]. [gtk.settings.Settings.getDefault] returns the
    GtkSettings instance for the default screen.
*/
class Settings : gobject.object.ObjectWrap, gtk.style_provider.StyleProvider
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
    return cast(void function())gtk_settings_get_type != &gidSymbolNotFound ? gtk_settings_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Settings self()
  {
    return this;
  }

  /** */
  @property bool gtkAlternativeButtonOrder()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-alternative-button-order");
  }

  /** */
  @property void gtkAlternativeButtonOrder(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-alternative-button-order", propval);
  }

  /**
      Get `gtkAlternativeSortArrows` property.
      Returns: Controls the direction of the sort indicators in sorted list and tree
        views. By default an arrow pointing down means the column is sorted
        in ascending order. When set to true, this order will be inverted.
  */
  @property bool gtkAlternativeSortArrows()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-alternative-sort-arrows");
  }

  /**
      Set `gtkAlternativeSortArrows` property.
      Params:
        propval = Controls the direction of the sort indicators in sorted list and tree
          views. By default an arrow pointing down means the column is sorted
          in ascending order. When set to true, this order will be inverted.
  */
  @property void gtkAlternativeSortArrows(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-alternative-sort-arrows", propval);
  }

  /**
      Get `gtkApplicationPreferDarkTheme` property.
      Returns: Whether the application prefers to use a dark theme. If a GTK+ theme
        includes a dark variant, it will be used instead of the configured
        theme.
        
        Some applications benefit from minimizing the amount of light pollution that
        interferes with the content. Good candidates for dark themes are photo and
        video editors that make the actual content get all the attention and minimize
        the distraction of the chrome.
        
        Dark themes should not be used for documents, where large spaces are white/light
        and the dark chrome creates too much contrast (web browser, text editor...).
  */
  @property bool gtkApplicationPreferDarkTheme()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-application-prefer-dark-theme");
  }

  /**
      Set `gtkApplicationPreferDarkTheme` property.
      Params:
        propval = Whether the application prefers to use a dark theme. If a GTK+ theme
          includes a dark variant, it will be used instead of the configured
          theme.
          
          Some applications benefit from minimizing the amount of light pollution that
          interferes with the content. Good candidates for dark themes are photo and
          video editors that make the actual content get all the attention and minimize
          the distraction of the chrome.
          
          Dark themes should not be used for documents, where large spaces are white/light
          and the dark chrome creates too much contrast (web browser, text editor...).
  */
  @property void gtkApplicationPreferDarkTheme(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-application-prefer-dark-theme", propval);
  }

  /**
      Get `gtkAutoMnemonics` property.
      Returns: Whether mnemonics should be automatically shown and hidden when the user
        presses the mnemonic activator.
  
      Deprecated: This setting is ignored
  */
  @property bool gtkAutoMnemonics()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-auto-mnemonics");
  }

  /**
      Set `gtkAutoMnemonics` property.
      Params:
        propval = Whether mnemonics should be automatically shown and hidden when the user
          presses the mnemonic activator.
  
      Deprecated: This setting is ignored
  */
  @property void gtkAutoMnemonics(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-auto-mnemonics", propval);
  }

  /**
      Get `gtkButtonImages` property.
      Returns: Whether images should be shown on buttons
  
      Deprecated: This setting is deprecated. Application developers
          control whether a button should show an icon or not, on a
          per-button basis. If a #GtkButton should show an icon, use the
          #GtkButton:always-show-image property of #GtkButton, and pack a
          #GtkImage inside the #GtkButton
  */
  @property bool gtkButtonImages()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-button-images");
  }

  /**
      Set `gtkButtonImages` property.
      Params:
        propval = Whether images should be shown on buttons
  
      Deprecated: This setting is deprecated. Application developers
          control whether a button should show an icon or not, on a
          per-button basis. If a #GtkButton should show an icon, use the
          #GtkButton:always-show-image property of #GtkButton, and pack a
          #GtkImage inside the #GtkButton
  */
  @property void gtkButtonImages(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-button-images", propval);
  }

  /**
      Get `gtkCanChangeAccels` property.
      Returns: Whether menu accelerators can be changed by pressing a key over the menu item.
  
      Deprecated: This setting is ignored.
  */
  @property bool gtkCanChangeAccels()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-can-change-accels");
  }

  /**
      Set `gtkCanChangeAccels` property.
      Params:
        propval = Whether menu accelerators can be changed by pressing a key over the menu item.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkCanChangeAccels(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-can-change-accels", propval);
  }

  /**
      Get `gtkColorPalette` property.
      Returns: Palette to use in the deprecated color selector.
  
      Deprecated: Only used by the deprecated color selector widget.
  */
  @property string gtkColorPalette()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-color-palette");
  }

  /**
      Set `gtkColorPalette` property.
      Params:
        propval = Palette to use in the deprecated color selector.
  
      Deprecated: Only used by the deprecated color selector widget.
  */
  @property void gtkColorPalette(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-color-palette", propval);
  }

  /**
      Get `gtkColorScheme` property.
      Returns: A palette of named colors for use in themes. The format of the string is
        ```
        name1: color1
        name2: color2
        ...
        ```
        Color names must be acceptable as identifiers in the
        [gtkrc][gtk3-Resource-Files] syntax, and
        color specifications must be in the format accepted by
        [gdk.color.Color.parse].
        
        Note that due to the way the color tables from different sources are
        merged, color specifications will be converted to hexadecimal form
        when getting this property.
        
        Starting with GTK+ 2.12, the entries can alternatively be separated
        by ';' instead of newlines:
        ```
        name1: color1; name2: color2; ...
        ```
  
      Deprecated: Color scheme support was dropped and is no longer supported.
            You can still set this property, but it will be ignored.
  */
  @property string gtkColorScheme()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-color-scheme");
  }

  /**
      Set `gtkColorScheme` property.
      Params:
        propval = A palette of named colors for use in themes. The format of the string is
          ```
          name1: color1
          name2: color2
          ...
          ```
          Color names must be acceptable as identifiers in the
          [gtkrc][gtk3-Resource-Files] syntax, and
          color specifications must be in the format accepted by
          [gdk.color.Color.parse].
          
          Note that due to the way the color tables from different sources are
          merged, color specifications will be converted to hexadecimal form
          when getting this property.
          
          Starting with GTK+ 2.12, the entries can alternatively be separated
          by ';' instead of newlines:
          ```
          name1: color1; name2: color2; ...
          ```
  
      Deprecated: Color scheme support was dropped and is no longer supported.
            You can still set this property, but it will be ignored.
  */
  @property void gtkColorScheme(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-color-scheme", propval);
  }

  /** */
  @property float gtkCursorAspectRatio()
  {
    return gobject.object.ObjectWrap.getProperty!(float)("gtk-cursor-aspect-ratio");
  }

  /** */
  @property void gtkCursorAspectRatio(float propval)
  {
    gobject.object.ObjectWrap.setProperty!(float)("gtk-cursor-aspect-ratio", propval);
  }

  /**
      Get `gtkCursorBlink` property.
      Returns: Whether the cursor should blink.
        
        Also see the #GtkSettings:gtk-cursor-blink-timeout setting,
        which allows more flexible control over cursor blinking.
  */
  @property bool gtkCursorBlink()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-cursor-blink");
  }

  /**
      Set `gtkCursorBlink` property.
      Params:
        propval = Whether the cursor should blink.
          
          Also see the #GtkSettings:gtk-cursor-blink-timeout setting,
          which allows more flexible control over cursor blinking.
  */
  @property void gtkCursorBlink(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-cursor-blink", propval);
  }

  /** */
  @property int gtkCursorBlinkTime()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-cursor-blink-time");
  }

  /** */
  @property void gtkCursorBlinkTime(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-cursor-blink-time", propval);
  }

  /**
      Get `gtkCursorBlinkTimeout` property.
      Returns: Time after which the cursor stops blinking, in seconds.
        The timer is reset after each user interaction.
        
        Setting this to zero has the same effect as setting
        #GtkSettings:gtk-cursor-blink to false.
  */
  @property int gtkCursorBlinkTimeout()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-cursor-blink-timeout");
  }

  /**
      Set `gtkCursorBlinkTimeout` property.
      Params:
        propval = Time after which the cursor stops blinking, in seconds.
          The timer is reset after each user interaction.
          
          Setting this to zero has the same effect as setting
          #GtkSettings:gtk-cursor-blink to false.
  */
  @property void gtkCursorBlinkTimeout(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-cursor-blink-timeout", propval);
  }

  /** */
  @property string gtkCursorThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-cursor-theme-name");
  }

  /** */
  @property void gtkCursorThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-cursor-theme-name", propval);
  }

  /** */
  @property int gtkCursorThemeSize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-cursor-theme-size");
  }

  /** */
  @property void gtkCursorThemeSize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-cursor-theme-size", propval);
  }

  /**
      Get `gtkDecorationLayout` property.
      Returns: This setting determines which buttons should be put in the
        titlebar of client-side decorated windows, and whether they
        should be placed at the left of right.
        
        The format of the string is button names, separated by commas.
        A colon separates the buttons that should appear on the left
        from those on the right. Recognized button names are minimize,
        maximize, close, icon (the window icon) and menu (a menu button
        for the fallback app menu).
        
        For example, "menu:minimize,maximize,close" specifies a menu
        on the left, and minimize, maximize and close buttons on the right.
        
        Note that buttons will only be shown when they are meaningful.
        E.g. a menu button only appears when the desktop shell does not
        show the app menu, and a close button only appears on a window
        that can be closed.
        
        Also note that the setting can be overridden with the
        #GtkHeaderBar:decoration-layout property.
  */
  @property string gtkDecorationLayout()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-decoration-layout");
  }

  /**
      Set `gtkDecorationLayout` property.
      Params:
        propval = This setting determines which buttons should be put in the
          titlebar of client-side decorated windows, and whether they
          should be placed at the left of right.
          
          The format of the string is button names, separated by commas.
          A colon separates the buttons that should appear on the left
          from those on the right. Recognized button names are minimize,
          maximize, close, icon (the window icon) and menu (a menu button
          for the fallback app menu).
          
          For example, "menu:minimize,maximize,close" specifies a menu
          on the left, and minimize, maximize and close buttons on the right.
          
          Note that buttons will only be shown when they are meaningful.
          E.g. a menu button only appears when the desktop shell does not
          show the app menu, and a close button only appears on a window
          that can be closed.
          
          Also note that the setting can be overridden with the
          #GtkHeaderBar:decoration-layout property.
  */
  @property void gtkDecorationLayout(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-decoration-layout", propval);
  }

  /**
      Get `gtkDialogsUseHeader` property.
      Returns: Whether builtin GTK+ dialogs such as the file chooser, the
        color chooser or the font chooser will use a header bar at
        the top to show action widgets, or an action area at the bottom.
        
        This setting does not affect custom dialogs using GtkDialog
        directly, or message dialogs.
  */
  @property bool gtkDialogsUseHeader()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-dialogs-use-header");
  }

  /**
      Set `gtkDialogsUseHeader` property.
      Params:
        propval = Whether builtin GTK+ dialogs such as the file chooser, the
          color chooser or the font chooser will use a header bar at
          the top to show action widgets, or an action area at the bottom.
          
          This setting does not affect custom dialogs using GtkDialog
          directly, or message dialogs.
  */
  @property void gtkDialogsUseHeader(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-dialogs-use-header", propval);
  }

  /** */
  @property int gtkDndDragThreshold()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-dnd-drag-threshold");
  }

  /** */
  @property void gtkDndDragThreshold(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-dnd-drag-threshold", propval);
  }

  /** */
  @property int gtkDoubleClickDistance()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-double-click-distance");
  }

  /** */
  @property void gtkDoubleClickDistance(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-double-click-distance", propval);
  }

  /** */
  @property int gtkDoubleClickTime()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-double-click-time");
  }

  /** */
  @property void gtkDoubleClickTime(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-double-click-time", propval);
  }

  /**
      Get `gtkEnableAccels` property.
      Returns: Whether menu items should have visible accelerators which can be
        activated.
  */
  @property bool gtkEnableAccels()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-accels");
  }

  /**
      Set `gtkEnableAccels` property.
      Params:
        propval = Whether menu items should have visible accelerators which can be
          activated.
  */
  @property void gtkEnableAccels(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-accels", propval);
  }

  /** */
  @property bool gtkEnableAnimations()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-animations");
  }

  /** */
  @property void gtkEnableAnimations(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-animations", propval);
  }

  /**
      Get `gtkEnableEventSounds` property.
      Returns: Whether to play any event sounds at all.
        
        See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
        for more information on event sounds and sound themes.
        
        GTK+ itself does not support event sounds, you have to use a loadable
        module like the one that comes with libcanberra.
  */
  @property bool gtkEnableEventSounds()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-event-sounds");
  }

  /**
      Set `gtkEnableEventSounds` property.
      Params:
        propval = Whether to play any event sounds at all.
          
          See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
          for more information on event sounds and sound themes.
          
          GTK+ itself does not support event sounds, you have to use a loadable
          module like the one that comes with libcanberra.
  */
  @property void gtkEnableEventSounds(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-event-sounds", propval);
  }

  /**
      Get `gtkEnableInputFeedbackSounds` property.
      Returns: Whether to play event sounds as feedback to user input.
        
        See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
        for more information on event sounds and sound themes.
        
        GTK+ itself does not support event sounds, you have to use a loadable
        module like the one that comes with libcanberra.
  */
  @property bool gtkEnableInputFeedbackSounds()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-input-feedback-sounds");
  }

  /**
      Set `gtkEnableInputFeedbackSounds` property.
      Params:
        propval = Whether to play event sounds as feedback to user input.
          
          See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
          for more information on event sounds and sound themes.
          
          GTK+ itself does not support event sounds, you have to use a loadable
          module like the one that comes with libcanberra.
  */
  @property void gtkEnableInputFeedbackSounds(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-input-feedback-sounds", propval);
  }

  /**
      Get `gtkEnableMnemonics` property.
      Returns: Whether labels and menu items should have visible mnemonics which
        can be activated.
  
      Deprecated: This setting can still be used for application
             overrides, but will be ignored in the future
  */
  @property bool gtkEnableMnemonics()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-mnemonics");
  }

  /**
      Set `gtkEnableMnemonics` property.
      Params:
        propval = Whether labels and menu items should have visible mnemonics which
          can be activated.
  
      Deprecated: This setting can still be used for application
             overrides, but will be ignored in the future
  */
  @property void gtkEnableMnemonics(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-mnemonics", propval);
  }

  /**
      Get `gtkEnablePrimaryPaste` property.
      Returns: Whether a middle click on a mouse should paste the
        'PRIMARY' clipboard content at the cursor location.
  */
  @property bool gtkEnablePrimaryPaste()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-primary-paste");
  }

  /**
      Set `gtkEnablePrimaryPaste` property.
      Params:
        propval = Whether a middle click on a mouse should paste the
          'PRIMARY' clipboard content at the cursor location.
  */
  @property void gtkEnablePrimaryPaste(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-primary-paste", propval);
  }

  /**
      Get `gtkEnableTooltips` property.
      Returns: Whether tooltips should be shown on widgets.
  
      Deprecated: This setting is ignored.
  */
  @property bool gtkEnableTooltips()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-tooltips");
  }

  /**
      Set `gtkEnableTooltips` property.
      Params:
        propval = Whether tooltips should be shown on widgets.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkEnableTooltips(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-tooltips", propval);
  }

  /**
      Get `gtkEntryPasswordHintTimeout` property.
      Returns: How long to show the last input character in hidden
        entries. This value is in milliseconds. 0 disables showing the
        last char. 600 is a good value for enabling it.
  */
  @property uint gtkEntryPasswordHintTimeout()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("gtk-entry-password-hint-timeout");
  }

  /**
      Set `gtkEntryPasswordHintTimeout` property.
      Params:
        propval = How long to show the last input character in hidden
          entries. This value is in milliseconds. 0 disables showing the
          last char. 600 is a good value for enabling it.
  */
  @property void gtkEntryPasswordHintTimeout(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("gtk-entry-password-hint-timeout", propval);
  }

  /** */
  @property bool gtkEntrySelectOnFocus()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-entry-select-on-focus");
  }

  /** */
  @property void gtkEntrySelectOnFocus(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-entry-select-on-focus", propval);
  }

  /**
      Get `gtkErrorBell` property.
      Returns: When true, keyboard navigation and other input-related errors
        will cause a beep. Since the error bell is implemented using
        [gdk.window.Window.beep], the windowing system may offer ways to
        configure the error bell in many ways, such as flashing the
        window or similar visual effects.
  */
  @property bool gtkErrorBell()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-error-bell");
  }

  /**
      Set `gtkErrorBell` property.
      Params:
        propval = When true, keyboard navigation and other input-related errors
          will cause a beep. Since the error bell is implemented using
          [gdk.window.Window.beep], the windowing system may offer ways to
          configure the error bell in many ways, such as flashing the
          window or similar visual effects.
  */
  @property void gtkErrorBell(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-error-bell", propval);
  }

  /**
      Get `gtkFallbackIconTheme` property.
      Returns: Name of a icon theme to fall back to.
  
      Deprecated: This setting is ignored.
  */
  @property string gtkFallbackIconTheme()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-fallback-icon-theme");
  }

  /**
      Set `gtkFallbackIconTheme` property.
      Params:
        propval = Name of a icon theme to fall back to.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkFallbackIconTheme(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-fallback-icon-theme", propval);
  }

  /**
      Get `gtkFileChooserBackend` property.
      Returns: Name of the GtkFileChooser backend to use by default.
  
      Deprecated: This setting is ignored. #GtkFileChooser uses GIO by default.
  */
  @property string gtkFileChooserBackend()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-file-chooser-backend");
  }

  /**
      Set `gtkFileChooserBackend` property.
      Params:
        propval = Name of the GtkFileChooser backend to use by default.
  
      Deprecated: This setting is ignored. #GtkFileChooser uses GIO by default.
  */
  @property void gtkFileChooserBackend(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-file-chooser-backend", propval);
  }

  /**
      Get `gtkFontName` property.
      Returns: The default font to use. GTK+ uses the family name and size from this string.
  */
  @property string gtkFontName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-font-name");
  }

  /**
      Set `gtkFontName` property.
      Params:
        propval = The default font to use. GTK+ uses the family name and size from this string.
  */
  @property void gtkFontName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-font-name", propval);
  }

  /** */
  @property uint gtkFontconfigTimestamp()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("gtk-fontconfig-timestamp");
  }

  /** */
  @property void gtkFontconfigTimestamp(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("gtk-fontconfig-timestamp", propval);
  }

  /**
      Get `gtkIconSizes` property.
      Returns: A list of icon sizes. The list is separated by colons, and
        item has the form:
        
        `size-name` = `width` , `height`
        
        E.g. "gtk-menu=16,16:gtk-button=20,20:gtk-dialog=48,48".
        GTK+ itself use the following named icon sizes: gtk-menu,
        gtk-button, gtk-small-toolbar, gtk-large-toolbar, gtk-dnd,
        gtk-dialog. Applications can register their own named icon
        sizes with [gtk.global.iconSizeRegister].
  
      Deprecated: This setting is ignored.
  */
  @property string gtkIconSizes()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-icon-sizes");
  }

  /**
      Set `gtkIconSizes` property.
      Params:
        propval = A list of icon sizes. The list is separated by colons, and
          item has the form:
          
          `size-name` = `width` , `height`
          
          E.g. "gtk-menu=16,16:gtk-button=20,20:gtk-dialog=48,48".
          GTK+ itself use the following named icon sizes: gtk-menu,
          gtk-button, gtk-small-toolbar, gtk-large-toolbar, gtk-dnd,
          gtk-dialog. Applications can register their own named icon
          sizes with [gtk.global.iconSizeRegister].
  
      Deprecated: This setting is ignored.
  */
  @property void gtkIconSizes(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-icon-sizes", propval);
  }

  /** */
  @property string gtkIconThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-icon-theme-name");
  }

  /** */
  @property void gtkIconThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-icon-theme-name", propval);
  }

  /**
      Get `gtkImModule` property.
      Returns: Which IM (input method) module should be used by default. This is the
        input method that will be used if the user has not explicitly chosen
        another input method from the IM context menu.
        This also can be a colon-separated list of input methods, which GTK+
        will try in turn until it finds one available on the system.
        
        See #GtkIMContext.
  */
  @property string gtkImModule()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-im-module");
  }

  /**
      Set `gtkImModule` property.
      Params:
        propval = Which IM (input method) module should be used by default. This is the
          input method that will be used if the user has not explicitly chosen
          another input method from the IM context menu.
          This also can be a colon-separated list of input methods, which GTK+
          will try in turn until it finds one available on the system.
          
          See #GtkIMContext.
  */
  @property void gtkImModule(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-im-module", propval);
  }

  /**
      Get `gtkImPreeditStyle` property.
      Returns: How to draw the input method preedit string.
  
      Deprecated: This setting is ignored.
  */
  @property gtk.types.IMPreeditStyle gtkImPreeditStyle()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.IMPreeditStyle)("gtk-im-preedit-style");
  }

  /**
      Set `gtkImPreeditStyle` property.
      Params:
        propval = How to draw the input method preedit string.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkImPreeditStyle(gtk.types.IMPreeditStyle propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.IMPreeditStyle)("gtk-im-preedit-style", propval);
  }

  /**
      Get `gtkImStatusStyle` property.
      Returns: How to draw the input method statusbar.
  
      Deprecated: This setting is ignored.
  */
  @property gtk.types.IMStatusStyle gtkImStatusStyle()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.IMStatusStyle)("gtk-im-status-style");
  }

  /**
      Set `gtkImStatusStyle` property.
      Params:
        propval = How to draw the input method statusbar.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkImStatusStyle(gtk.types.IMStatusStyle propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.IMStatusStyle)("gtk-im-status-style", propval);
  }

  /** */
  @property string gtkKeyThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-key-theme-name");
  }

  /** */
  @property void gtkKeyThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-key-theme-name", propval);
  }

  /**
      Get `gtkKeynavCursorOnly` property.
      Returns: When true, keyboard navigation should be able to reach all widgets
        by using the cursor keys only. Tab, Shift etc. keys can't be expected
        to be present on the used input device.
  
      Deprecated: Generally, the behavior for touchscreen input should be
                    performed dynamically based on [gdk.event.Event.getSourceDevice].
  */
  @property bool gtkKeynavCursorOnly()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-keynav-cursor-only");
  }

  /**
      Set `gtkKeynavCursorOnly` property.
      Params:
        propval = When true, keyboard navigation should be able to reach all widgets
          by using the cursor keys only. Tab, Shift etc. keys can't be expected
          to be present on the used input device.
  
      Deprecated: Generally, the behavior for touchscreen input should be
                    performed dynamically based on [gdk.event.Event.getSourceDevice].
  */
  @property void gtkKeynavCursorOnly(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-keynav-cursor-only", propval);
  }

  /**
      Get `gtkKeynavUseCaret` property.
      Returns: Whether GTK+ should make sure that text can be navigated with
        a caret, even if it is not editable. This is useful when using
        a screen reader.
  */
  @property bool gtkKeynavUseCaret()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-keynav-use-caret");
  }

  /**
      Set `gtkKeynavUseCaret` property.
      Params:
        propval = Whether GTK+ should make sure that text can be navigated with
          a caret, even if it is not editable. This is useful when using
          a screen reader.
  */
  @property void gtkKeynavUseCaret(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-keynav-use-caret", propval);
  }

  /**
      Get `gtkKeynavWrapAround` property.
      Returns: When true, some widgets will wrap around when doing keyboard
        navigation, such as menus, menubars and notebooks.
  
      Deprecated: This setting is ignored.
  */
  @property bool gtkKeynavWrapAround()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-keynav-wrap-around");
  }

  /**
      Set `gtkKeynavWrapAround` property.
      Params:
        propval = When true, some widgets will wrap around when doing keyboard
          navigation, such as menus, menubars and notebooks.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkKeynavWrapAround(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-keynav-wrap-around", propval);
  }

  /** */
  @property bool gtkLabelSelectOnFocus()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-label-select-on-focus");
  }

  /** */
  @property void gtkLabelSelectOnFocus(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-label-select-on-focus", propval);
  }

  /**
      Get `gtkLongPressTime` property.
      Returns: The time for a button or touch press to be considered a "long press".
  */
  @property uint gtkLongPressTime()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("gtk-long-press-time");
  }

  /**
      Set `gtkLongPressTime` property.
      Params:
        propval = The time for a button or touch press to be considered a "long press".
  */
  @property void gtkLongPressTime(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("gtk-long-press-time", propval);
  }

  /**
      Get `gtkMenuBarAccel` property.
      Returns: Keybinding to activate the menu bar.
  
      Deprecated: This setting can still be used for application
             overrides, but will be ignored in the future
  */
  @property string gtkMenuBarAccel()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-menu-bar-accel");
  }

  /**
      Set `gtkMenuBarAccel` property.
      Params:
        propval = Keybinding to activate the menu bar.
  
      Deprecated: This setting can still be used for application
             overrides, but will be ignored in the future
  */
  @property void gtkMenuBarAccel(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-menu-bar-accel", propval);
  }

  /**
      Get `gtkMenuBarPopupDelay` property.
      Returns: Delay before the submenus of a menu bar appear.
  
      Deprecated: This setting is ignored.
  */
  @property int gtkMenuBarPopupDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-menu-bar-popup-delay");
  }

  /**
      Set `gtkMenuBarPopupDelay` property.
      Params:
        propval = Delay before the submenus of a menu bar appear.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkMenuBarPopupDelay(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-menu-bar-popup-delay", propval);
  }

  /**
      Get `gtkMenuImages` property.
      Returns: Whether images should be shown in menu items
  
      Deprecated: This setting is deprecated. Application developers
          control whether or not a #GtkMenuItem should have an icon or not,
          on a per widget basis. Either use a #GtkMenuItem with a #GtkBox
          containing a #GtkImage and a #GtkAccelLabel, or describe your menus
          using a #GMenu XML description
  */
  @property bool gtkMenuImages()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-menu-images");
  }

  /**
      Set `gtkMenuImages` property.
      Params:
        propval = Whether images should be shown in menu items
  
      Deprecated: This setting is deprecated. Application developers
          control whether or not a #GtkMenuItem should have an icon or not,
          on a per widget basis. Either use a #GtkMenuItem with a #GtkBox
          containing a #GtkImage and a #GtkAccelLabel, or describe your menus
          using a #GMenu XML description
  */
  @property void gtkMenuImages(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-menu-images", propval);
  }

  /**
      Get `gtkMenuPopdownDelay` property.
      Returns: The time before hiding a submenu when the pointer is moving towards the submenu.
  
      Deprecated: This setting is ignored.
  */
  @property int gtkMenuPopdownDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-menu-popdown-delay");
  }

  /**
      Set `gtkMenuPopdownDelay` property.
      Params:
        propval = The time before hiding a submenu when the pointer is moving towards the submenu.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkMenuPopdownDelay(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-menu-popdown-delay", propval);
  }

  /**
      Get `gtkMenuPopupDelay` property.
      Returns: Minimum time the pointer must stay over a menu item before the submenu appear.
  
      Deprecated: This setting is ignored.
  */
  @property int gtkMenuPopupDelay()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-menu-popup-delay");
  }

  /**
      Set `gtkMenuPopupDelay` property.
      Params:
        propval = Minimum time the pointer must stay over a menu item before the submenu appear.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkMenuPopupDelay(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-menu-popup-delay", propval);
  }

  /** */
  @property string gtkModules()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-modules");
  }

  /** */
  @property void gtkModules(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-modules", propval);
  }

  /**
      Get `gtkOverlayScrolling` property.
      Returns: Whether scrolled windows may use overlayed scrolling indicators.
        If this is set to false, scrolled windows will have permanent
        scrollbars.
  */
  @property bool gtkOverlayScrolling()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-overlay-scrolling");
  }

  /**
      Set `gtkOverlayScrolling` property.
      Params:
        propval = Whether scrolled windows may use overlayed scrolling indicators.
          If this is set to false, scrolled windows will have permanent
          scrollbars.
  */
  @property void gtkOverlayScrolling(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-overlay-scrolling", propval);
  }

  /**
      Get `gtkPrimaryButtonWarpsSlider` property.
      Returns: If the value of this setting is true, clicking the primary button in a
        #GtkRange trough will move the slider, and hence set the range’s value, to
        the point that you clicked. If it is false, a primary click will cause the
        slider/value to move by the range’s page-size towards the point clicked.
        
        Whichever action you choose for the primary button, the other action will
        be available by holding Shift and primary-clicking, or (since GTK+ 3.22.25)
        clicking the middle mouse button.
  */
  @property bool gtkPrimaryButtonWarpsSlider()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-primary-button-warps-slider");
  }

  /**
      Set `gtkPrimaryButtonWarpsSlider` property.
      Params:
        propval = If the value of this setting is true, clicking the primary button in a
          #GtkRange trough will move the slider, and hence set the range’s value, to
          the point that you clicked. If it is false, a primary click will cause the
          slider/value to move by the range’s page-size towards the point clicked.
          
          Whichever action you choose for the primary button, the other action will
          be available by holding Shift and primary-clicking, or (since GTK+ 3.22.25)
          clicking the middle mouse button.
  */
  @property void gtkPrimaryButtonWarpsSlider(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-primary-button-warps-slider", propval);
  }

  /**
      Get `gtkPrintBackends` property.
      Returns: A comma-separated list of print backends to use in the print
        dialog. Available print backends depend on the GTK+ installation,
        and may include "file", "cups", "lpr" or "papi".
  */
  @property string gtkPrintBackends()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-print-backends");
  }

  /**
      Set `gtkPrintBackends` property.
      Params:
        propval = A comma-separated list of print backends to use in the print
          dialog. Available print backends depend on the GTK+ installation,
          and may include "file", "cups", "lpr" or "papi".
  */
  @property void gtkPrintBackends(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-print-backends", propval);
  }

  /**
      Get `gtkPrintPreviewCommand` property.
      Returns: A command to run for displaying the print preview. The command
        should contain a ``f`` placeholder, which will get replaced by
        the path to the pdf file. The command may also contain a ``s``
        placeholder, which will get replaced by the path to a file
        containing the print settings in the format produced by
        [gtk.print_settings.PrintSettings.toFile].
        
        The preview application is responsible for removing the pdf file
        and the print settings file when it is done.
  */
  @property string gtkPrintPreviewCommand()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-print-preview-command");
  }

  /**
      Set `gtkPrintPreviewCommand` property.
      Params:
        propval = A command to run for displaying the print preview. The command
          should contain a ``f`` placeholder, which will get replaced by
          the path to the pdf file. The command may also contain a ``s``
          placeholder, which will get replaced by the path to a file
          containing the print settings in the format produced by
          [gtk.print_settings.PrintSettings.toFile].
          
          The preview application is responsible for removing the pdf file
          and the print settings file when it is done.
  */
  @property void gtkPrintPreviewCommand(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-print-preview-command", propval);
  }

  /**
      Get `gtkRecentFilesEnabled` property.
      Returns: Whether GTK+ should keep track of items inside the recently used
        resources list. If set to false, the list will always be empty.
  */
  @property bool gtkRecentFilesEnabled()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-recent-files-enabled");
  }

  /**
      Set `gtkRecentFilesEnabled` property.
      Params:
        propval = Whether GTK+ should keep track of items inside the recently used
          resources list. If set to false, the list will always be empty.
  */
  @property void gtkRecentFilesEnabled(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-recent-files-enabled", propval);
  }

  /**
      Get `gtkRecentFilesLimit` property.
      Returns: The number of recently used files that should be displayed by default by
        #GtkRecentChooser implementations and by the #GtkFileChooser. A value of
        -1 means every recently used file stored.
  
      Deprecated: This setting is ignored
  */
  @property int gtkRecentFilesLimit()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-recent-files-limit");
  }

  /**
      Set `gtkRecentFilesLimit` property.
      Params:
        propval = The number of recently used files that should be displayed by default by
          #GtkRecentChooser implementations and by the #GtkFileChooser. A value of
          -1 means every recently used file stored.
  
      Deprecated: This setting is ignored
  */
  @property void gtkRecentFilesLimit(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-recent-files-limit", propval);
  }

  /**
      Get `gtkRecentFilesMaxAge` property.
      Returns: The maximum age, in days, of the items inside the recently used
        resources list. Items older than this setting will be excised
        from the list. If set to 0, the list will always be empty; if
        set to -1, no item will be removed.
  */
  @property int gtkRecentFilesMaxAge()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-recent-files-max-age");
  }

  /**
      Set `gtkRecentFilesMaxAge` property.
      Params:
        propval = The maximum age, in days, of the items inside the recently used
          resources list. Items older than this setting will be excised
          from the list. If set to 0, the list will always be empty; if
          set to -1, no item will be removed.
  */
  @property void gtkRecentFilesMaxAge(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-recent-files-max-age", propval);
  }

  /**
      Get `gtkScrolledWindowPlacement` property.
      Returns: Where the contents of scrolled windows are located with respect to the
        scrollbars, if not overridden by the scrolled window's own placement.
  
      Deprecated: This setting is ignored.
  */
  @property gtk.types.CornerType gtkScrolledWindowPlacement()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.CornerType)("gtk-scrolled-window-placement");
  }

  /**
      Set `gtkScrolledWindowPlacement` property.
      Params:
        propval = Where the contents of scrolled windows are located with respect to the
          scrollbars, if not overridden by the scrolled window's own placement.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkScrolledWindowPlacement(gtk.types.CornerType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.CornerType)("gtk-scrolled-window-placement", propval);
  }

  /** */
  @property bool gtkShellShowsAppMenu()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-shell-shows-app-menu");
  }

  /** */
  @property void gtkShellShowsAppMenu(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-shell-shows-app-menu", propval);
  }

  /** */
  @property bool gtkShellShowsDesktop()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-shell-shows-desktop");
  }

  /** */
  @property void gtkShellShowsDesktop(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-shell-shows-desktop", propval);
  }

  /** */
  @property bool gtkShellShowsMenubar()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-shell-shows-menubar");
  }

  /** */
  @property void gtkShellShowsMenubar(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-shell-shows-menubar", propval);
  }

  /** */
  @property bool gtkShowInputMethodMenu()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-show-input-method-menu");
  }

  /** */
  @property void gtkShowInputMethodMenu(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-show-input-method-menu", propval);
  }

  /** */
  @property bool gtkShowUnicodeMenu()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-show-unicode-menu");
  }

  /** */
  @property void gtkShowUnicodeMenu(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-show-unicode-menu", propval);
  }

  /**
      Get `gtkSoundThemeName` property.
      Returns: The XDG sound theme to use for event sounds.
        
        See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
        for more information on event sounds and sound themes.
        
        GTK+ itself does not support event sounds, you have to use a loadable
        module like the one that comes with libcanberra.
  */
  @property string gtkSoundThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-sound-theme-name");
  }

  /**
      Set `gtkSoundThemeName` property.
      Params:
        propval = The XDG sound theme to use for event sounds.
          
          See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
          for more information on event sounds and sound themes.
          
          GTK+ itself does not support event sounds, you have to use a loadable
          module like the one that comes with libcanberra.
  */
  @property void gtkSoundThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-sound-theme-name", propval);
  }

  /** */
  @property bool gtkSplitCursor()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-split-cursor");
  }

  /** */
  @property void gtkSplitCursor(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-split-cursor", propval);
  }

  /** */
  @property string gtkThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-theme-name");
  }

  /** */
  @property void gtkThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-theme-name", propval);
  }

  /** */
  @property int gtkTimeoutExpand()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-timeout-expand");
  }

  /** */
  @property void gtkTimeoutExpand(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-timeout-expand", propval);
  }

  /** */
  @property int gtkTimeoutInitial()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-timeout-initial");
  }

  /** */
  @property void gtkTimeoutInitial(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-timeout-initial", propval);
  }

  /** */
  @property int gtkTimeoutRepeat()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-timeout-repeat");
  }

  /** */
  @property void gtkTimeoutRepeat(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-timeout-repeat", propval);
  }

  /**
      Get `gtkTitlebarDoubleClick` property.
      Returns: This setting determines the action to take when a double-click
        occurs on the titlebar of client-side decorated windows.
        
        Recognized actions are minimize, toggle-maximize, menu, lower
        or none.
  */
  @property string gtkTitlebarDoubleClick()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-titlebar-double-click");
  }

  /**
      Set `gtkTitlebarDoubleClick` property.
      Params:
        propval = This setting determines the action to take when a double-click
          occurs on the titlebar of client-side decorated windows.
          
          Recognized actions are minimize, toggle-maximize, menu, lower
          or none.
  */
  @property void gtkTitlebarDoubleClick(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-titlebar-double-click", propval);
  }

  /**
      Get `gtkTitlebarMiddleClick` property.
      Returns: This setting determines the action to take when a middle-click
        occurs on the titlebar of client-side decorated windows.
        
        Recognized actions are minimize, toggle-maximize, menu, lower
        or none.
  */
  @property string gtkTitlebarMiddleClick()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-titlebar-middle-click");
  }

  /**
      Set `gtkTitlebarMiddleClick` property.
      Params:
        propval = This setting determines the action to take when a middle-click
          occurs on the titlebar of client-side decorated windows.
          
          Recognized actions are minimize, toggle-maximize, menu, lower
          or none.
  */
  @property void gtkTitlebarMiddleClick(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-titlebar-middle-click", propval);
  }

  /**
      Get `gtkTitlebarRightClick` property.
      Returns: This setting determines the action to take when a right-click
        occurs on the titlebar of client-side decorated windows.
        
        Recognized actions are minimize, toggle-maximize, menu, lower
        or none.
  */
  @property string gtkTitlebarRightClick()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-titlebar-right-click");
  }

  /**
      Set `gtkTitlebarRightClick` property.
      Params:
        propval = This setting determines the action to take when a right-click
          occurs on the titlebar of client-side decorated windows.
          
          Recognized actions are minimize, toggle-maximize, menu, lower
          or none.
  */
  @property void gtkTitlebarRightClick(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-titlebar-right-click", propval);
  }

  /**
      Get `gtkToolbarIconSize` property.
      Returns: The size of icons in default toolbars.
  
      Deprecated: This setting is ignored.
  */
  @property gtk.types.IconSize gtkToolbarIconSize()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.IconSize)("gtk-toolbar-icon-size");
  }

  /**
      Set `gtkToolbarIconSize` property.
      Params:
        propval = The size of icons in default toolbars.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkToolbarIconSize(gtk.types.IconSize propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.IconSize)("gtk-toolbar-icon-size", propval);
  }

  /**
      Get `gtkToolbarStyle` property.
      Returns: The size of icons in default toolbars.
  
      Deprecated: This setting is ignored.
  */
  @property gtk.types.ToolbarStyle gtkToolbarStyle()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.ToolbarStyle)("gtk-toolbar-style");
  }

  /**
      Set `gtkToolbarStyle` property.
      Params:
        propval = The size of icons in default toolbars.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkToolbarStyle(gtk.types.ToolbarStyle propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.ToolbarStyle)("gtk-toolbar-style", propval);
  }

  /**
      Get `gtkTooltipBrowseModeTimeout` property.
      Returns: Amount of time, in milliseconds, after which the browse mode
        will be disabled.
        
        See #GtkSettings:gtk-tooltip-browse-timeout for more information
        about browse mode.
  
      Deprecated: This setting is ignored.
  */
  @property int gtkTooltipBrowseModeTimeout()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-tooltip-browse-mode-timeout");
  }

  /**
      Set `gtkTooltipBrowseModeTimeout` property.
      Params:
        propval = Amount of time, in milliseconds, after which the browse mode
          will be disabled.
          
          See #GtkSettings:gtk-tooltip-browse-timeout for more information
          about browse mode.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkTooltipBrowseModeTimeout(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-tooltip-browse-mode-timeout", propval);
  }

  /**
      Get `gtkTooltipBrowseTimeout` property.
      Returns: Controls the time after which tooltips will appear when
        browse mode is enabled, in milliseconds.
        
        Browse mode is enabled when the mouse pointer moves off an object
        where a tooltip was currently being displayed. If the mouse pointer
        hits another object before the browse mode timeout expires (see
        #GtkSettings:gtk-tooltip-browse-mode-timeout), it will take the
        amount of milliseconds specified by this setting to popup the tooltip
        for the new object.
  
      Deprecated: This setting is ignored.
  */
  @property int gtkTooltipBrowseTimeout()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-tooltip-browse-timeout");
  }

  /**
      Set `gtkTooltipBrowseTimeout` property.
      Params:
        propval = Controls the time after which tooltips will appear when
          browse mode is enabled, in milliseconds.
          
          Browse mode is enabled when the mouse pointer moves off an object
          where a tooltip was currently being displayed. If the mouse pointer
          hits another object before the browse mode timeout expires (see
          #GtkSettings:gtk-tooltip-browse-mode-timeout), it will take the
          amount of milliseconds specified by this setting to popup the tooltip
          for the new object.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkTooltipBrowseTimeout(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-tooltip-browse-timeout", propval);
  }

  /**
      Get `gtkTooltipTimeout` property.
      Returns: Time, in milliseconds, after which a tooltip could appear if the
        cursor is hovering on top of a widget.
  
      Deprecated: This setting is ignored.
  */
  @property int gtkTooltipTimeout()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-tooltip-timeout");
  }

  /**
      Set `gtkTooltipTimeout` property.
      Params:
        propval = Time, in milliseconds, after which a tooltip could appear if the
          cursor is hovering on top of a widget.
  
      Deprecated: This setting is ignored.
  */
  @property void gtkTooltipTimeout(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-tooltip-timeout", propval);
  }

  /**
      Get `gtkTouchscreenMode` property.
      Returns: When true, there are no motion notify events delivered on this screen,
        and widgets can't use the pointer hovering them for any essential
        functionality.
  
      Deprecated: Generally, the behavior for touchscreen input should be
                    performed dynamically based on [gdk.event.Event.getSourceDevice].
  */
  @property bool gtkTouchscreenMode()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-touchscreen-mode");
  }

  /**
      Set `gtkTouchscreenMode` property.
      Params:
        propval = When true, there are no motion notify events delivered on this screen,
          and widgets can't use the pointer hovering them for any essential
          functionality.
  
      Deprecated: Generally, the behavior for touchscreen input should be
                    performed dynamically based on [gdk.event.Event.getSourceDevice].
  */
  @property void gtkTouchscreenMode(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-touchscreen-mode", propval);
  }

  /**
      Get `gtkVisibleFocus` property.
      Returns: Whether 'focus rectangles' should be always visible, never visible,
        or hidden until the user starts to use the keyboard.
  
      Deprecated: This setting is ignored
  */
  @property gtk.types.PolicyType gtkVisibleFocus()
  {
    return gobject.object.ObjectWrap.getProperty!(gtk.types.PolicyType)("gtk-visible-focus");
  }

  /**
      Set `gtkVisibleFocus` property.
      Params:
        propval = Whether 'focus rectangles' should be always visible, never visible,
          or hidden until the user starts to use the keyboard.
  
      Deprecated: This setting is ignored
  */
  @property void gtkVisibleFocus(gtk.types.PolicyType propval)
  {
    gobject.object.ObjectWrap.setProperty!(gtk.types.PolicyType)("gtk-visible-focus", propval);
  }

  /** */
  @property int gtkXftAntialias()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-xft-antialias");
  }

  /** */
  @property void gtkXftAntialias(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-xft-antialias", propval);
  }

  /** */
  @property int gtkXftDpi()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-xft-dpi");
  }

  /** */
  @property void gtkXftDpi(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-xft-dpi", propval);
  }

  /** */
  @property int gtkXftHinting()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-xft-hinting");
  }

  /** */
  @property void gtkXftHinting(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-xft-hinting", propval);
  }

  /** */
  @property string gtkXftHintstyle()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-xft-hintstyle");
  }

  /** */
  @property void gtkXftHintstyle(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-xft-hintstyle", propval);
  }

  /** */
  @property string gtkXftRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-xft-rgba");
  }

  /** */
  @property void gtkXftRgba(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-xft-rgba", propval);
  }

  mixin StyleProviderT!();

  /**
      Gets the #GtkSettings object for the default GDK screen, creating
      it if necessary. See [gtk.settings.Settings.getForScreen].
      Returns: a #GtkSettings object. If there is
        no default screen, then returns null.
  */
  static gtk.settings.Settings getDefault()
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GtkSettings object for screen, creating it if necessary.
  
      Params:
        screen = a #GdkScreen.
      Returns: a #GtkSettings object.
  */
  static gtk.settings.Settings getForScreen(gdk.screen.Screen screen)
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_for_screen(screen ? cast(GdkScreen*)screen._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /** */
  static void installProperty(gobject.param_spec.ParamSpec pspec)
  {
    gtk_settings_install_property(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null);
  }

  /** */
  static void installPropertyParser(gobject.param_spec.ParamSpec pspec, gtk.types.RcPropertyParser parser)
  {
    static gtk.types.RcPropertyParser _static_parser;

    extern(C) gboolean _parserCallback(const(GParamSpec)* pspec, const(GString)* rcString, GValue* propertyValue)
    {
      bool _dretval;

      _dretval = _static_parser(pspec ? new gobject.param_spec.ParamSpec(cast(void*)pspec, No.Take) : null, rcString ? new glib.string_.String(cast(void*)rcString, No.Take) : null, propertyValue ? new gobject.value.Value(cast(void*)propertyValue, No.Take) : null);
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _parserCB = parser ? &_parserCallback : null;
    _static_parser = parser;
    gtk_settings_install_property_parser(pspec ? cast(GParamSpec*)pspec._cPtr(No.Dup) : null, _parserCB);
    _static_parser = null;
  }

  /**
      Undoes the effect of calling [gobject.object.ObjectWrap.set] to install an
      application-specific value for a setting. After this call,
      the setting will again follow the session-wide value for
      this setting.
  
      Params:
        name = the name of the setting to reset
  */
  void resetProperty(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_settings_reset_property(cast(GtkSettings*)this._cPtr, _name);
  }

  /** */
  void setDoubleProperty(string name, double vDouble, string origin)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    gtk_settings_set_double_property(cast(GtkSettings*)this._cPtr, _name, vDouble, _origin);
  }

  /** */
  void setLongProperty(string name, glong vLong, string origin)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    gtk_settings_set_long_property(cast(GtkSettings*)this._cPtr, _name, vLong, _origin);
  }

  /** */
  void setPropertyValue(string name, gtk.settings_value.SettingsValue svalue)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_settings_set_property_value(cast(GtkSettings*)this._cPtr, _name, svalue ? cast(const(GtkSettingsValue)*)svalue._cPtr : null);
  }

  /** */
  void setStringProperty(string name, string vString, string origin)
  {
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _vString = vString.toCString(No.Alloc);
    const(char)* _origin = origin.toCString(No.Alloc);
    gtk_settings_set_string_property(cast(GtkSettings*)this._cPtr, _name, _vString, _origin);
  }
}
