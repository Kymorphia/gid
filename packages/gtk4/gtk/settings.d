/// Module for [Settings] class
module gtk.settings;

import gdk.display;
import gid.gid;
import gobject.object;
import gtk.c.functions;
import gtk.c.types;
import gtk.style_provider;
import gtk.style_provider_mixin;
import gtk.types;

/**
    [gtk.settings.Settings] provides a mechanism to share global settings between
    applications.
    
    On the X window system, this sharing is realized by an
    [XSettings](http://www.freedesktop.org/wiki/Specifications/xsettings-spec)
    manager that is usually part of the desktop environment, along with
    utilities that let the user change these settings.
    
    On Wayland, the settings are obtained either via a settings portal,
    or by reading desktop settings from DConf.
    
    On macOS, the settings are obtained from `NSUserDefaults`.
    
    In the absence of these sharing mechanisms, GTK reads default values for
    settings from `settings.ini` files in `/etc/gtk-4.0`, `$XDG_CONFIG_DIRS/gtk-4.0`
    and `$XDG_CONFIG_HOME/gtk-4.0`. These files must be valid key files (see
    [glib.key_file.KeyFile]), and have a section called Settings. Themes can also provide
    default values for settings by installing a `settings.ini` file
    next to their `gtk.css` file.
    
    Applications can override system-wide settings by setting the property
    of the [gtk.settings.Settings] object with [gobject.object.ObjectWrap.set]. This should be restricted
    to special cases though; [gtk.settings.Settings] are not meant as an application
    configuration facility.
    
    There is one [gtk.settings.Settings] instance per display. It can be obtained with
    [gtk.settings.Settings.getForDisplay], but in many cases, it is more
    convenient to use [gtk.widget.Widget.getSettings].
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

  /**
      Get `gtkAlternativeButtonOrder` property.
      Returns: Whether buttons in dialogs should use the alternative button order.
  */
  @property bool gtkAlternativeButtonOrder()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-alternative-button-order");
  }

  /**
      Set `gtkAlternativeButtonOrder` property.
      Params:
        propval = Whether buttons in dialogs should use the alternative button order.
  */
  @property void gtkAlternativeButtonOrder(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-alternative-button-order", propval);
  }

  /**
      Get `gtkAlternativeSortArrows` property.
      Returns: Controls the direction of the sort indicators in sorted list and tree
        views.
        
        By default an arrow pointing down means the column is sorted
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
          views.
          
          By default an arrow pointing down means the column is sorted
          in ascending order. When set to true, this order will be inverted.
  */
  @property void gtkAlternativeSortArrows(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-alternative-sort-arrows", propval);
  }

  /**
      Get `gtkApplicationPreferDarkTheme` property.
      Returns: Whether the application prefers to use a dark theme.
        
        If a GTK theme includes a dark variant, it will be used
        instead of the configured theme.
        
        Some applications benefit from minimizing the amount of light
        pollution that interferes with the content. Good candidates for
        dark themes are photo and video editors that make the actual
        content get all the attention and minimize the distraction of
        the chrome.
        
        Dark themes should not be used for documents, where large spaces
        are white/light and the dark chrome creates too much contrast
        (web browser, text editor...).
  */
  @property bool gtkApplicationPreferDarkTheme()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-application-prefer-dark-theme");
  }

  /**
      Set `gtkApplicationPreferDarkTheme` property.
      Params:
        propval = Whether the application prefers to use a dark theme.
          
          If a GTK theme includes a dark variant, it will be used
          instead of the configured theme.
          
          Some applications benefit from minimizing the amount of light
          pollution that interferes with the content. Good candidates for
          dark themes are photo and video editors that make the actual
          content get all the attention and minimize the distraction of
          the chrome.
          
          Dark themes should not be used for documents, where large spaces
          are white/light and the dark chrome creates too much contrast
          (web browser, text editor...).
  */
  @property void gtkApplicationPreferDarkTheme(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-application-prefer-dark-theme", propval);
  }

  /**
      Get `gtkCursorAspectRatio` property.
      Returns: The aspect ratio of the text caret.
  */
  @property double gtkCursorAspectRatio()
  {
    return gobject.object.ObjectWrap.getProperty!(double)("gtk-cursor-aspect-ratio");
  }

  /**
      Set `gtkCursorAspectRatio` property.
      Params:
        propval = The aspect ratio of the text caret.
  */
  @property void gtkCursorAspectRatio(double propval)
  {
    gobject.object.ObjectWrap.setProperty!(double)("gtk-cursor-aspect-ratio", propval);
  }

  /**
      Get `gtkCursorBlink` property.
      Returns: Whether the cursor should blink.
        
        Also see the `property@Gtk.Settings:gtk-cursor-blink-timeout` setting,
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
          
          Also see the `property@Gtk.Settings:gtk-cursor-blink-timeout` setting,
          which allows more flexible control over cursor blinking.
  */
  @property void gtkCursorBlink(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-cursor-blink", propval);
  }

  /**
      Get `gtkCursorBlinkTime` property.
      Returns: Length of the cursor blink cycle, in milliseconds.
  */
  @property int gtkCursorBlinkTime()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-cursor-blink-time");
  }

  /**
      Set `gtkCursorBlinkTime` property.
      Params:
        propval = Length of the cursor blink cycle, in milliseconds.
  */
  @property void gtkCursorBlinkTime(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-cursor-blink-time", propval);
  }

  /**
      Get `gtkCursorBlinkTimeout` property.
      Returns: Time after which the cursor stops blinking, in seconds.
        
        The timer is reset after each user interaction.
        
        Setting this to zero has the same effect as setting
        `property@Gtk.Settings:gtk-cursor-blink` to false.
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
          `property@Gtk.Settings:gtk-cursor-blink` to false.
  */
  @property void gtkCursorBlinkTimeout(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-cursor-blink-timeout", propval);
  }

  /**
      Get `gtkCursorThemeName` property.
      Returns: Name of the cursor theme to use.
        
        Use null to use the default theme.
  */
  @property string gtkCursorThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-cursor-theme-name");
  }

  /**
      Set `gtkCursorThemeName` property.
      Params:
        propval = Name of the cursor theme to use.
          
          Use null to use the default theme.
  */
  @property void gtkCursorThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-cursor-theme-name", propval);
  }

  /**
      Get `gtkCursorThemeSize` property.
      Returns: The size to use for cursors.
        
        0 means to use the default size.
  */
  @property int gtkCursorThemeSize()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-cursor-theme-size");
  }

  /**
      Set `gtkCursorThemeSize` property.
      Params:
        propval = The size to use for cursors.
          
          0 means to use the default size.
  */
  @property void gtkCursorThemeSize(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-cursor-theme-size", propval);
  }

  /**
      Get `gtkDecorationLayout` property.
      Returns: Determines which buttons should be put in the
        titlebar of client-side decorated windows, and whether they
        should be placed on the left or right.
        
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
        `property@Gtk.HeaderBar:decoration-layout` property.
  */
  @property string gtkDecorationLayout()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-decoration-layout");
  }

  /**
      Set `gtkDecorationLayout` property.
      Params:
        propval = Determines which buttons should be put in the
          titlebar of client-side decorated windows, and whether they
          should be placed on the left or right.
          
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
          `property@Gtk.HeaderBar:decoration-layout` property.
  */
  @property void gtkDecorationLayout(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-decoration-layout", propval);
  }

  /**
      Get `gtkDialogsUseHeader` property.
      Returns: Whether builtin GTK dialogs such as the file chooser, the
        color chooser or the font chooser will use a header bar at
        the top to show action widgets, or an action area at the bottom.
        
        This setting does not affect custom dialogs using [gtk.dialog.Dialog]
        directly, or message dialogs.
  */
  @property bool gtkDialogsUseHeader()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-dialogs-use-header");
  }

  /**
      Set `gtkDialogsUseHeader` property.
      Params:
        propval = Whether builtin GTK dialogs such as the file chooser, the
          color chooser or the font chooser will use a header bar at
          the top to show action widgets, or an action area at the bottom.
          
          This setting does not affect custom dialogs using [gtk.dialog.Dialog]
          directly, or message dialogs.
  */
  @property void gtkDialogsUseHeader(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-dialogs-use-header", propval);
  }

  /**
      Get `gtkDndDragThreshold` property.
      Returns: The number of pixels the cursor can move before dragging.
  */
  @property int gtkDndDragThreshold()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-dnd-drag-threshold");
  }

  /**
      Set `gtkDndDragThreshold` property.
      Params:
        propval = The number of pixels the cursor can move before dragging.
  */
  @property void gtkDndDragThreshold(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-dnd-drag-threshold", propval);
  }

  /**
      Get `gtkDoubleClickDistance` property.
      Returns: The maximum distance allowed between two clicks for them to be considered
        a double click, in pixels.
  */
  @property int gtkDoubleClickDistance()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-double-click-distance");
  }

  /**
      Set `gtkDoubleClickDistance` property.
      Params:
        propval = The maximum distance allowed between two clicks for them to be considered
          a double click, in pixels.
  */
  @property void gtkDoubleClickDistance(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-double-click-distance", propval);
  }

  /**
      Get `gtkDoubleClickTime` property.
      Returns: The maximum time to allow between two clicks for them to be considered
        a double click, in milliseconds.
  */
  @property int gtkDoubleClickTime()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-double-click-time");
  }

  /**
      Set `gtkDoubleClickTime` property.
      Params:
        propval = The maximum time to allow between two clicks for them to be considered
          a double click, in milliseconds.
  */
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

  /**
      Get `gtkEnableAnimations` property.
      Returns: Whether to enable toolkit-wide animations.
  */
  @property bool gtkEnableAnimations()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-enable-animations");
  }

  /**
      Set `gtkEnableAnimations` property.
      Params:
        propval = Whether to enable toolkit-wide animations.
  */
  @property void gtkEnableAnimations(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-animations", propval);
  }

  /**
      Get `gtkEnableEventSounds` property.
      Returns: Whether to play any event sounds at all.
        
        See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
        for more information on event sounds and sound themes.
        
        GTK itself does not support event sounds, you have to use a loadable
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
          
          GTK itself does not support event sounds, you have to use a loadable
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
        
        GTK itself does not support event sounds, you have to use a loadable
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
          
          GTK itself does not support event sounds, you have to use a loadable
          module like the one that comes with libcanberra.
  */
  @property void gtkEnableInputFeedbackSounds(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-enable-input-feedback-sounds", propval);
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
      Get `gtkEntryPasswordHintTimeout` property.
      Returns: How long to show the last input character in hidden
        entries.
        
        This value is in milliseconds. 0 disables showing the
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
          entries.
          
          This value is in milliseconds. 0 disables showing the
          last char. 600 is a good value for enabling it.
  */
  @property void gtkEntryPasswordHintTimeout(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("gtk-entry-password-hint-timeout", propval);
  }

  /**
      Get `gtkEntrySelectOnFocus` property.
      Returns: Whether to select the contents of an entry when it is focused.
  */
  @property bool gtkEntrySelectOnFocus()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-entry-select-on-focus");
  }

  /**
      Set `gtkEntrySelectOnFocus` property.
      Params:
        propval = Whether to select the contents of an entry when it is focused.
  */
  @property void gtkEntrySelectOnFocus(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-entry-select-on-focus", propval);
  }

  /**
      Get `gtkErrorBell` property.
      Returns: When true, keyboard navigation and other input-related errors
        will cause a beep.
        
        Since the error bell is implemented using [gdk.surface.Surface.beep], the
        windowing system may offer ways to configure the error bell in many
        ways, such as flashing the window or similar visual effects.
  */
  @property bool gtkErrorBell()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-error-bell");
  }

  /**
      Set `gtkErrorBell` property.
      Params:
        propval = When true, keyboard navigation and other input-related errors
          will cause a beep.
          
          Since the error bell is implemented using [gdk.surface.Surface.beep], the
          windowing system may offer ways to configure the error bell in many
          ways, such as flashing the window or similar visual effects.
  */
  @property void gtkErrorBell(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-error-bell", propval);
  }

  /**
      Get `gtkFontName` property.
      Returns: The default font to use.
        
        GTK uses the family name and size from this string.
  */
  @property string gtkFontName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-font-name");
  }

  /**
      Set `gtkFontName` property.
      Params:
        propval = The default font to use.
          
          GTK uses the family name and size from this string.
  */
  @property void gtkFontName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-font-name", propval);
  }

  /**
      Get `gtkFontconfigTimestamp` property.
      Returns: Timestamp of the current fontconfig configuration.
  */
  @property uint gtkFontconfigTimestamp()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("gtk-fontconfig-timestamp");
  }

  /**
      Set `gtkFontconfigTimestamp` property.
      Params:
        propval = Timestamp of the current fontconfig configuration.
  */
  @property void gtkFontconfigTimestamp(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("gtk-fontconfig-timestamp", propval);
  }

  /**
      Get `gtkHintFontMetrics` property.
      Returns: Whether hinting should be applied to font metrics.
        
        Note that this also turns off subpixel positioning of glyphs,
        since it conflicts with metrics hinting.
  */
  @property bool gtkHintFontMetrics()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-hint-font-metrics");
  }

  /**
      Set `gtkHintFontMetrics` property.
      Params:
        propval = Whether hinting should be applied to font metrics.
          
          Note that this also turns off subpixel positioning of glyphs,
          since it conflicts with metrics hinting.
  */
  @property void gtkHintFontMetrics(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-hint-font-metrics", propval);
  }

  /**
      Get `gtkIconThemeName` property.
      Returns: Name of the icon theme to use.
        
        See [gtk.icon_theme.IconTheme] for details about how
        GTK handles icon themes.
  */
  @property string gtkIconThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-icon-theme-name");
  }

  /**
      Set `gtkIconThemeName` property.
      Params:
        propval = Name of the icon theme to use.
          
          See [gtk.icon_theme.IconTheme] for details about how
          GTK handles icon themes.
  */
  @property void gtkIconThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-icon-theme-name", propval);
  }

  /**
      Get `gtkImModule` property.
      Returns: Which IM (input method) module should be used by default.
        
        This is the input method that will be used if the user has not
        explicitly chosen another input method from the IM context menu.
        This also can be a colon-separated list of input methods, which GTK
        will try in turn until it finds one available on the system.
        
        See [gtk.imcontext.IMContext].
  */
  @property string gtkImModule()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-im-module");
  }

  /**
      Set `gtkImModule` property.
      Params:
        propval = Which IM (input method) module should be used by default.
          
          This is the input method that will be used if the user has not
          explicitly chosen another input method from the IM context menu.
          This also can be a colon-separated list of input methods, which GTK
          will try in turn until it finds one available on the system.
          
          See [gtk.imcontext.IMContext].
  */
  @property void gtkImModule(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-im-module", propval);
  }

  /**
      Get `gtkKeynavUseCaret` property.
      Returns: Whether GTK should make sure that text can be navigated with
        a caret, even if it is not editable.
        
        This is useful when using a screen reader.
  */
  @property bool gtkKeynavUseCaret()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-keynav-use-caret");
  }

  /**
      Set `gtkKeynavUseCaret` property.
      Params:
        propval = Whether GTK should make sure that text can be navigated with
          a caret, even if it is not editable.
          
          This is useful when using a screen reader.
  */
  @property void gtkKeynavUseCaret(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-keynav-use-caret", propval);
  }

  /**
      Get `gtkLabelSelectOnFocus` property.
      Returns: Whether to select the contents of a selectable
        label when it is focused.
  */
  @property bool gtkLabelSelectOnFocus()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-label-select-on-focus");
  }

  /**
      Set `gtkLabelSelectOnFocus` property.
      Params:
        propval = Whether to select the contents of a selectable
          label when it is focused.
  */
  @property void gtkLabelSelectOnFocus(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-label-select-on-focus", propval);
  }

  /**
      Get `gtkLongPressTime` property.
      Returns: The time for a button or touch press to be considered a “long press”.
        
        See [gtk.gesture_long_press.GestureLongPress].
  */
  @property uint gtkLongPressTime()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("gtk-long-press-time");
  }

  /**
      Set `gtkLongPressTime` property.
      Params:
        propval = The time for a button or touch press to be considered a “long press”.
          
          See [gtk.gesture_long_press.GestureLongPress].
  */
  @property void gtkLongPressTime(uint propval)
  {
    gobject.object.ObjectWrap.setProperty!(uint)("gtk-long-press-time", propval);
  }

  /**
      Get `gtkOverlayScrolling` property.
      Returns: Whether scrolled windows may use overlaid scrolling indicators.
        
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
        propval = Whether scrolled windows may use overlaid scrolling indicators.
          
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
        [gtk.range.Range] trough will move the slider, and hence set the range’s value, to
        the point that you clicked.
        
        If it is false, a primary click will cause the slider/value to move
        by the range’s page-size towards the point clicked.
        
        Whichever action you choose for the primary button, the other action will
        be available by holding Shift and primary-clicking, or clicking the middle
        mouse button.
  */
  @property bool gtkPrimaryButtonWarpsSlider()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-primary-button-warps-slider");
  }

  /**
      Set `gtkPrimaryButtonWarpsSlider` property.
      Params:
        propval = If the value of this setting is true, clicking the primary button in a
          [gtk.range.Range] trough will move the slider, and hence set the range’s value, to
          the point that you clicked.
          
          If it is false, a primary click will cause the slider/value to move
          by the range’s page-size towards the point clicked.
          
          Whichever action you choose for the primary button, the other action will
          be available by holding Shift and primary-clicking, or clicking the middle
          mouse button.
  */
  @property void gtkPrimaryButtonWarpsSlider(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-primary-button-warps-slider", propval);
  }

  /**
      Get `gtkPrintBackends` property.
      Returns: A comma-separated list of print backends to use in the print
        dialog.
        
        Available print backends depend on the GTK installation,
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
          dialog.
          
          Available print backends depend on the GTK installation,
          and may include "file", "cups", "lpr" or "papi".
  */
  @property void gtkPrintBackends(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-print-backends", propval);
  }

  /**
      Get `gtkPrintPreviewCommand` property.
      Returns: A command to run for displaying the print preview.
        
        The command should contain a ``f`` placeholder, which will get
        replaced by the path to the pdf file. The command may also
        contain a ``s`` placeholder, which will get replaced by the
        path to a file containing the print settings in the format
        produced by [gtk.print_settings.PrintSettings.toFile].
        
        The preview application is responsible for removing the pdf
        file and the print settings file when it is done.
  */
  @property string gtkPrintPreviewCommand()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-print-preview-command");
  }

  /**
      Set `gtkPrintPreviewCommand` property.
      Params:
        propval = A command to run for displaying the print preview.
          
          The command should contain a ``f`` placeholder, which will get
          replaced by the path to the pdf file. The command may also
          contain a ``s`` placeholder, which will get replaced by the
          path to a file containing the print settings in the format
          produced by [gtk.print_settings.PrintSettings.toFile].
          
          The preview application is responsible for removing the pdf
          file and the print settings file when it is done.
  */
  @property void gtkPrintPreviewCommand(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-print-preview-command", propval);
  }

  /**
      Get `gtkRecentFilesEnabled` property.
      Returns: Whether GTK should keep track of items inside the recently used
        resources list.
        
        If set to false, the list will always be empty.
  */
  @property bool gtkRecentFilesEnabled()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-recent-files-enabled");
  }

  /**
      Set `gtkRecentFilesEnabled` property.
      Params:
        propval = Whether GTK should keep track of items inside the recently used
          resources list.
          
          If set to false, the list will always be empty.
  */
  @property void gtkRecentFilesEnabled(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-recent-files-enabled", propval);
  }

  /**
      Get `gtkRecentFilesMaxAge` property.
      Returns: The maximum age, in days, of the items inside the recently used
        resources list.
        
        Items older than this setting will be excised from the list.
        If set to 0, the list will always be empty; if set to -1, no
        item will be removed.
  */
  @property int gtkRecentFilesMaxAge()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-recent-files-max-age");
  }

  /**
      Set `gtkRecentFilesMaxAge` property.
      Params:
        propval = The maximum age, in days, of the items inside the recently used
          resources list.
          
          Items older than this setting will be excised from the list.
          If set to 0, the list will always be empty; if set to -1, no
          item will be removed.
  */
  @property void gtkRecentFilesMaxAge(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-recent-files-max-age", propval);
  }

  /**
      Get `gtkShellShowsAppMenu` property.
      Returns: Set to true if the desktop environment is displaying
        the app menu, false if the app should display it itself.
  */
  @property bool gtkShellShowsAppMenu()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-shell-shows-app-menu");
  }

  /**
      Set `gtkShellShowsAppMenu` property.
      Params:
        propval = Set to true if the desktop environment is displaying
          the app menu, false if the app should display it itself.
  */
  @property void gtkShellShowsAppMenu(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-shell-shows-app-menu", propval);
  }

  /**
      Get `gtkShellShowsDesktop` property.
      Returns: Set to true if the desktop environment is displaying
        the desktop folder, false if not.
  */
  @property bool gtkShellShowsDesktop()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-shell-shows-desktop");
  }

  /**
      Set `gtkShellShowsDesktop` property.
      Params:
        propval = Set to true if the desktop environment is displaying
          the desktop folder, false if not.
  */
  @property void gtkShellShowsDesktop(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-shell-shows-desktop", propval);
  }

  /**
      Get `gtkShellShowsMenubar` property.
      Returns: Set to true if the desktop environment is displaying
        the menubar, false if the app should display it itself.
  */
  @property bool gtkShellShowsMenubar()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-shell-shows-menubar");
  }

  /**
      Set `gtkShellShowsMenubar` property.
      Params:
        propval = Set to true if the desktop environment is displaying
          the menubar, false if the app should display it itself.
  */
  @property void gtkShellShowsMenubar(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-shell-shows-menubar", propval);
  }

  /**
      Get `gtkShowStatusShapes` property.
      Returns: When true, widgets like switches include shapes to indicate their on/off state.
  */
  @property bool gtkShowStatusShapes()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-show-status-shapes");
  }

  /**
      Set `gtkShowStatusShapes` property.
      Params:
        propval = When true, widgets like switches include shapes to indicate their on/off state.
  */
  @property void gtkShowStatusShapes(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-show-status-shapes", propval);
  }

  /**
      Get `gtkSoundThemeName` property.
      Returns: The XDG sound theme to use for event sounds.
        
        See the [Sound Theme Specifications](http://www.freedesktop.org/wiki/Specifications/sound-theme-spec)
        for more information on event sounds and sound themes.
        
        GTK itself does not support event sounds, you have to use
        a loadable module like the one that comes with libcanberra.
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
          
          GTK itself does not support event sounds, you have to use
          a loadable module like the one that comes with libcanberra.
  */
  @property void gtkSoundThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-sound-theme-name", propval);
  }

  /**
      Get `gtkSplitCursor` property.
      Returns: Whether two cursors should be displayed for mixed left-to-right and
        right-to-left text.
  */
  @property bool gtkSplitCursor()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("gtk-split-cursor");
  }

  /**
      Set `gtkSplitCursor` property.
      Params:
        propval = Whether two cursors should be displayed for mixed left-to-right and
          right-to-left text.
  */
  @property void gtkSplitCursor(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("gtk-split-cursor", propval);
  }

  /**
      Get `gtkThemeName` property.
      Returns: Name of the theme to load.
        
        See [gtk.css_provider.CssProvider] for details about how
        GTK finds the CSS stylesheet for a theme.
  */
  @property string gtkThemeName()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-theme-name");
  }

  /**
      Set `gtkThemeName` property.
      Params:
        propval = Name of the theme to load.
          
          See [gtk.css_provider.CssProvider] for details about how
          GTK finds the CSS stylesheet for a theme.
  */
  @property void gtkThemeName(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-theme-name", propval);
  }

  /**
      Get `gtkTitlebarDoubleClick` property.
      Returns: Determines the action to take when a double-click
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
        propval = Determines the action to take when a double-click
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
      Returns: Determines the action to take when a middle-click
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
        propval = Determines the action to take when a middle-click
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
      Returns: Determines the action to take when a right-click
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
        propval = Determines the action to take when a right-click
          occurs on the titlebar of client-side decorated windows.
          
          Recognized actions are minimize, toggle-maximize, menu, lower
          or none.
  */
  @property void gtkTitlebarRightClick(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-titlebar-right-click", propval);
  }

  /**
      Get `gtkXftAntialias` property.
      Returns: Whether to antialias fonts.
        
        The values are 0 for no, 1 for yes, or -1 for the system default.
  */
  @property int gtkXftAntialias()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-xft-antialias");
  }

  /**
      Set `gtkXftAntialias` property.
      Params:
        propval = Whether to antialias fonts.
          
          The values are 0 for no, 1 for yes, or -1 for the system default.
  */
  @property void gtkXftAntialias(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-xft-antialias", propval);
  }

  /**
      Get `gtkXftDpi` property.
      Returns: The font resolution, in 1024 * dots/inch.
        
        -1 to use the default value.
  */
  @property int gtkXftDpi()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-xft-dpi");
  }

  /**
      Set `gtkXftDpi` property.
      Params:
        propval = The font resolution, in 1024 * dots/inch.
          
          -1 to use the default value.
  */
  @property void gtkXftDpi(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-xft-dpi", propval);
  }

  /**
      Get `gtkXftHinting` property.
      Returns: Whether to enable font hinting.
        
        The values are 0 for no, 1 for yes, or -1 for the system default.
  */
  @property int gtkXftHinting()
  {
    return gobject.object.ObjectWrap.getProperty!(int)("gtk-xft-hinting");
  }

  /**
      Set `gtkXftHinting` property.
      Params:
        propval = Whether to enable font hinting.
          
          The values are 0 for no, 1 for yes, or -1 for the system default.
  */
  @property void gtkXftHinting(int propval)
  {
    gobject.object.ObjectWrap.setProperty!(int)("gtk-xft-hinting", propval);
  }

  /**
      Get `gtkXftHintstyle` property.
      Returns: What degree of font hinting to use.
        
        The possible vaues are hintnone, hintslight,
        hintmedium, hintfull.
  */
  @property string gtkXftHintstyle()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-xft-hintstyle");
  }

  /**
      Set `gtkXftHintstyle` property.
      Params:
        propval = What degree of font hinting to use.
          
          The possible vaues are hintnone, hintslight,
          hintmedium, hintfull.
  */
  @property void gtkXftHintstyle(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-xft-hintstyle", propval);
  }

  /**
      Get `gtkXftRgba` property.
      Returns: The type of subpixel antialiasing to use.
        
        The possible values are none, rgb, bgr, vrgb, vbgr.
        
        Note that GSK does not support subpixel antialiasing, and this
        setting has no effect on font rendering in GTK.
  */
  @property string gtkXftRgba()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("gtk-xft-rgba");
  }

  /**
      Set `gtkXftRgba` property.
      Params:
        propval = The type of subpixel antialiasing to use.
          
          The possible values are none, rgb, bgr, vrgb, vbgr.
          
          Note that GSK does not support subpixel antialiasing, and this
          setting has no effect on font rendering in GTK.
  */
  @property void gtkXftRgba(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("gtk-xft-rgba", propval);
  }

  mixin StyleProviderT!();

  /**
      Gets the [gtk.settings.Settings] object for the default display, creating
      it if necessary.
      
      See [gtk.settings.Settings.getForDisplay].
      Returns: a [gtk.settings.Settings] object. If there is
          no default display, then returns null.
  */
  static gtk.settings.Settings getDefault()
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_default();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the [gtk.settings.Settings] object for display, creating it if necessary.
  
      Params:
        display = a [gdk.display.Display]
      Returns: a [gtk.settings.Settings] object
  */
  static gtk.settings.Settings getForDisplay(gdk.display.Display display)
  {
    GtkSettings* _cretval;
    _cretval = gtk_settings_get_for_display(display ? cast(GdkDisplay*)display._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.settings.Settings)(cast(GtkSettings*)_cretval, No.Take);
    return _retval;
  }

  /**
      Undoes the effect of calling [gobject.object.ObjectWrap.set] to install an
      application-specific value for a setting.
      
      After this call, the setting will again follow the session-wide
      value for this setting.
  
      Params:
        name = the name of the setting to reset
  */
  void resetProperty(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gtk_settings_reset_property(cast(GtkSettings*)this._cPtr, _name);
  }
}
