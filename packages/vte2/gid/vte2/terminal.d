/// Module for [Terminal] class
module gid.vte2.terminal;

public import gid.core.basictypes;
import gid.atk1.implementor_iface;
import gid.atk1.implementor_iface_mixin;
import gid.cairo1.font_options;
import gid.cairo1.surface;
import gid.core.utils;
import gid.gdk3.cursor;
import gid.gdk3.event;
import gid.gdk3.rectangle;
import gid.gdk3.rgba;
import gid.gdk3.types;
import gid.gdkpixbuf2.pixbuf;
import gid.gio2.cancellable;
import gid.gio2.menu_model;
import gid.gio2.output_stream;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.glib2.regex;
import gid.glib2.types;
import gid.glib2.uri;
import gid.glib2.variant;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.types;
import gid.gobject2.value;
import gid.gtk3.buildable;
import gid.gtk3.buildable_mixin;
import gid.gtk3.menu;
import gid.gtk3.scrollable;
import gid.gtk3.scrollable_mixin;
import gid.gtk3.widget;
import gid.gtk3.window;
import gid.pango1.font_description;
import gid.vte2.c.functions;
import gid.vte2.c.types;
import gid.vte2.event_context;
import gid.vte2.pty;
import gid.vte2.regex;
import gid.vte2.types;
import gid.vte2.uuid;

/** */
@gidGir("Terminal", "TerminalClass")
class Terminal : gid.gtk3.widget.Widget, gid.gtk3.scrollable.Scrollable
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
    return cast(void function())vte_terminal_get_type != &gidSymbolNotFound ? vte_terminal_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "VteTerminal";
  }

  /** Returns `this`, for use in `with` statements. */
  override Terminal self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.vte2.terminal.Terminal]
      Returns: New builder object
  */
  static TerminalGidBuilder builder() nothrow
  {
    return new TerminalGidBuilder;
  }

  /**
      Get `allowBold` property.
      Returns: Controls whether or not the terminal will attempt to draw bold text,
        by using a bold font variant.
  
      Deprecated: There's probably no reason for this feature to exist.
  */
  @property bool allowBold() nothrow
  {
    return getAllowBold();
  }

  /**
      Set `allowBold` property.
      Params:
        propval = Controls whether or not the terminal will attempt to draw bold text,
          by using a bold font variant.
  
      Deprecated: There's probably no reason for this feature to exist.
  */
  @property void allowBold(bool propval) nothrow
  {
    setAllowBold(propval);
  }

  /**
      Get `allowHyperlink` property.
      Returns: Controls whether or not hyperlinks (OSC 8 escape sequence) are recognized and displayed.
  */
  @property bool allowHyperlink() nothrow
  {
    return getAllowHyperlink();
  }

  /**
      Set `allowHyperlink` property.
      Params:
        propval = Controls whether or not hyperlinks (OSC 8 escape sequence) are recognized and displayed.
  */
  @property void allowHyperlink(bool propval) nothrow
  {
    setAllowHyperlink(propval);
  }

  /**
      Get `audibleBell` property.
      Returns: Controls whether or not the terminal will beep when the child outputs the
        "bl" sequence.
  */
  @property bool audibleBell() nothrow
  {
    return getAudibleBell();
  }

  /**
      Set `audibleBell` property.
      Params:
        propval = Controls whether or not the terminal will beep when the child outputs the
          "bl" sequence.
  */
  @property void audibleBell(bool propval) nothrow
  {
    setAudibleBell(propval);
  }

  /**
      Get `backspaceBinding` property.
      Returns: Controls what string or control sequence the terminal sends to its child
        when the user presses the backspace key.
  */
  @property gid.vte2.types.EraseBinding backspaceBinding() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.vte2.types.EraseBinding)("backspace-binding");
  }

  /**
      Set `backspaceBinding` property.
      Params:
        propval = Controls what string or control sequence the terminal sends to its child
          when the user presses the backspace key.
  */
  @property void backspaceBinding(gid.vte2.types.EraseBinding propval) nothrow
  {
    setBackspaceBinding(propval);
  }

  /**
      Get `boldIsBright` property.
      Returns: Whether the SGR 1 attribute also switches to the bright counterpart
        of the first 8 palette colors, in addition to making them bold (legacy behavior)
        or if SGR 1 only enables bold and leaves the color intact.
  */
  @property bool boldIsBright() nothrow
  {
    return getBoldIsBright();
  }

  /**
      Set `boldIsBright` property.
      Params:
        propval = Whether the SGR 1 attribute also switches to the bright counterpart
          of the first 8 palette colors, in addition to making them bold (legacy behavior)
          or if SGR 1 only enables bold and leaves the color intact.
  */
  @property void boldIsBright(bool propval) nothrow
  {
    setBoldIsBright(propval);
  }

  /**
      Get `cellHeightScale` property.
      Returns: Scale factor for the cell height, to increase line spacing. (The font's height is not affected.)
  */
  @property double cellHeightScale() nothrow
  {
    return getCellHeightScale();
  }

  /**
      Set `cellHeightScale` property.
      Params:
        propval = Scale factor for the cell height, to increase line spacing. (The font's height is not affected.)
  */
  @property void cellHeightScale(double propval) nothrow
  {
    setCellHeightScale(propval);
  }

  /**
      Get `cellWidthScale` property.
      Returns: Scale factor for the cell width, to increase letter spacing. (The font's width is not affected.)
  */
  @property double cellWidthScale() nothrow
  {
    return getCellWidthScale();
  }

  /**
      Set `cellWidthScale` property.
      Params:
        propval = Scale factor for the cell width, to increase letter spacing. (The font's width is not affected.)
  */
  @property void cellWidthScale(double propval) nothrow
  {
    setCellWidthScale(propval);
  }

  /**
      Get `cjkAmbiguousWidth` property.
      Returns: This setting controls whether ambiguous-width characters are narrow or wide.
        (Note that when using a non-UTF-8 encoding set via [gid.vte3.terminal.Terminal.setEncoding],
        the width of ambiguous-width characters is fixed and determined by the encoding
        itself.)
        
        This setting only takes effect the next time the terminal is reset, either
        via escape sequence or with [gid.vte3.terminal.Terminal.reset].
  */
  @property int cjkAmbiguousWidth() nothrow
  {
    return getCjkAmbiguousWidth();
  }

  /**
      Set `cjkAmbiguousWidth` property.
      Params:
        propval = This setting controls whether ambiguous-width characters are narrow or wide.
          (Note that when using a non-UTF-8 encoding set via [gid.vte3.terminal.Terminal.setEncoding],
          the width of ambiguous-width characters is fixed and determined by the encoding
          itself.)
          
          This setting only takes effect the next time the terminal is reset, either
          via escape sequence or with [gid.vte3.terminal.Terminal.reset].
  */
  @property void cjkAmbiguousWidth(int propval) nothrow
  {
    setCjkAmbiguousWidth(propval);
  }

  /**
      Get `contextMenu` property.
      Returns: The menu used for context menus. Note that context menu model set with the
        #VteTerminal::context-menu-model property or [gid.vte3.terminal.Terminal.setContextMenuModel]
        takes precedence over this.
  */
  @property gid.gtk3.menu.Menu contextMenu() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gtk3.menu.Menu)("context-menu");
  }

  /**
      Set `contextMenu` property.
      Params:
        propval = The menu used for context menus. Note that context menu model set with the
          #VteTerminal::context-menu-model property or [gid.vte3.terminal.Terminal.setContextMenuModel]
          takes precedence over this.
  */
  @property void contextMenu(gid.gtk3.menu.Menu propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gtk3.menu.Menu)("context-menu", propval);
  }

  /**
      Get `contextMenuModel` property.
      Returns: The menu model used for context menus. If non-null, the context menu is
        generated from this model, and overrides a context menu set with the
        #VteTerminal::context-menu property or [gid.vte3.terminal.Terminal.setContextMenu].
  */
  @property gid.gio2.menu_model.MenuModel contextMenuModel() nothrow
  {
    return getContextMenuModel();
  }

  /**
      Set `contextMenuModel` property.
      Params:
        propval = The menu model used for context menus. If non-null, the context menu is
          generated from this model, and overrides a context menu set with the
          #VteTerminal::context-menu property or [gid.vte3.terminal.Terminal.setContextMenu].
  */
  @property void contextMenuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    setContextMenuModel(propval);
  }

  /**
      Get `currentDirectoryUri` property.
      Returns: The current directory URI, or null if unset.
  
      Deprecated: Use the [gid.vte3.types.TERMPROP_CURRENT_DIRECTORY_URI] termprop.
  */
  @property string currentDirectoryUri() nothrow
  {
    return getCurrentDirectoryUri();
  }

  /**
      Get `currentFileUri` property.
      Returns: The current file URI, or null if unset.
  
      Deprecated: Use the [gid.vte3.types.TERMPROP_CURRENT_FILE_URI] termprop.
  */
  @property string currentFileUri() nothrow
  {
    return getCurrentFileUri();
  }

  /**
      Get `cursorBlinkMode` property.
      Returns: Sets whether or not the cursor will blink. Using [gid.vte3.types.CursorBlinkMode.System]
        will use the #GtkSettings:gtk-cursor-blink setting.
  */
  @property gid.vte2.types.CursorBlinkMode cursorBlinkMode() nothrow
  {
    return getCursorBlinkMode();
  }

  /**
      Set `cursorBlinkMode` property.
      Params:
        propval = Sets whether or not the cursor will blink. Using [gid.vte3.types.CursorBlinkMode.System]
          will use the #GtkSettings:gtk-cursor-blink setting.
  */
  @property void cursorBlinkMode(gid.vte2.types.CursorBlinkMode propval) nothrow
  {
    setCursorBlinkMode(propval);
  }

  /**
      Get `cursorShape` property.
      Returns: Controls the shape of the cursor.
  */
  @property gid.vte2.types.CursorShape cursorShape() nothrow
  {
    return getCursorShape();
  }

  /**
      Set `cursorShape` property.
      Params:
        propval = Controls the shape of the cursor.
  */
  @property void cursorShape(gid.vte2.types.CursorShape propval) nothrow
  {
    setCursorShape(propval);
  }

  /**
      Get `deleteBinding` property.
      Returns: Controls what string or control sequence the terminal sends to its child
        when the user presses the delete key.
  */
  @property gid.vte2.types.EraseBinding deleteBinding() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.vte2.types.EraseBinding)("delete-binding");
  }

  /**
      Set `deleteBinding` property.
      Params:
        propval = Controls what string or control sequence the terminal sends to its child
          when the user presses the delete key.
  */
  @property void deleteBinding(gid.vte2.types.EraseBinding propval) nothrow
  {
    setDeleteBinding(propval);
  }

  /**
      Get `enableA11y` property.
      Returns: Controls whether or not a11y is enabled for the widget.
  */
  @property bool enableA11y() nothrow
  {
    return getEnableA11y();
  }

  /**
      Set `enableA11y` property.
      Params:
        propval = Controls whether or not a11y is enabled for the widget.
  */
  @property void enableA11y(bool propval) nothrow
  {
    setEnableA11y(propval);
  }

  /**
      Get `enableBidi` property.
      Returns: Controls whether or not the terminal will perform bidirectional text rendering.
  */
  @property bool enableBidi() nothrow
  {
    return getEnableBidi();
  }

  /**
      Set `enableBidi` property.
      Params:
        propval = Controls whether or not the terminal will perform bidirectional text rendering.
  */
  @property void enableBidi(bool propval) nothrow
  {
    setEnableBidi(propval);
  }

  /** */
  @property bool enableFallbackScrolling() nothrow
  {
    return getEnableFallbackScrolling();
  }

  /** */
  @property void enableFallbackScrolling(bool propval) nothrow
  {
    setEnableFallbackScrolling(propval);
  }

  /**
      Get `enableLegacyOsc777` property.
      Returns: Whether legacy OSC 777 sequences are translated to
        their corresponding termprops.
  */
  @property bool enableLegacyOsc777() nothrow
  {
    return getEnableLegacyOsc777();
  }

  /**
      Set `enableLegacyOsc777` property.
      Params:
        propval = Whether legacy OSC 777 sequences are translated to
          their corresponding termprops.
  */
  @property void enableLegacyOsc777(bool propval) nothrow
  {
    setEnableLegacyOsc777(propval);
  }

  /**
      Get `enableShaping` property.
      Returns: Controls whether or not the terminal will shape Arabic text.
  */
  @property bool enableShaping() nothrow
  {
    return getEnableShaping();
  }

  /**
      Set `enableShaping` property.
      Params:
        propval = Controls whether or not the terminal will shape Arabic text.
  */
  @property void enableShaping(bool propval) nothrow
  {
    setEnableShaping(propval);
  }

  /**
      Get `enableSixel` property.
      Returns: Controls whether SIXEL image support is enabled.
  */
  @property bool enableSixel() nothrow
  {
    return getEnableSixel();
  }

  /**
      Set `enableSixel` property.
      Params:
        propval = Controls whether SIXEL image support is enabled.
  */
  @property void enableSixel(bool propval) nothrow
  {
    setEnableSixel(propval);
  }

  /**
      Get `encoding` property.
      Returns: Controls the encoding the terminal will expect data from the child to
        be encoded with.  For certain terminal types, applications executing in the
        terminal can change the encoding.  The default is defined by the
        application's locale settings.
  
      Deprecated: Instead of using this, you should use a tool like
          luit(1) when support for non-UTF-8 is required
  */
  @property string encoding() nothrow
  {
    return getEncoding();
  }

  /**
      Set `encoding` property.
      Params:
        propval = Controls the encoding the terminal will expect data from the child to
          be encoded with.  For certain terminal types, applications executing in the
          terminal can change the encoding.  The default is defined by the
          application's locale settings.
  
      Deprecated: Instead of using this, you should use a tool like
          luit(1) when support for non-UTF-8 is required
  */
  @property void encoding(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("encoding", propval);
  }

  /**
      Get `fontDesc` property.
      Returns: Specifies the font used for rendering all text displayed by the terminal,
        overriding any fonts set using [gid.gtk3.widget.Widget.modifyFont].  The terminal
        will immediately attempt to load the desired font, retrieve its
        metrics, and attempt to resize itself to keep the same number of rows
        and columns.
  */
  @property gid.pango1.font_description.FontDescription fontDesc() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.pango1.font_description.FontDescription)("font-desc");
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = Specifies the font used for rendering all text displayed by the terminal,
          overriding any fonts set using [gid.gtk3.widget.Widget.modifyFont].  The terminal
          will immediately attempt to load the desired font, retrieve its
          metrics, and attempt to resize itself to keep the same number of rows
          and columns.
  */
  @property void fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.pango1.font_description.FontDescription)("font-desc", propval);
  }

  /**
      Get `fontOptions` property.
      Returns: The terminal's font options, or null to use the default font options.
        
        Note that on GTK4, the terminal by default uses font options
        with [gid.cairo1.types.HintMetrics.On] set; to override that, use this
        function to set a #cairo_font_options_t that has
        [gid.cairo1.types.HintMetrics.Off] set.
  */
  @property gid.cairo1.font_options.FontOptions fontOptions() nothrow
  {
    return getFontOptions();
  }

  /**
      Set `fontOptions` property.
      Params:
        propval = The terminal's font options, or null to use the default font options.
          
          Note that on GTK4, the terminal by default uses font options
          with [gid.cairo1.types.HintMetrics.On] set; to override that, use this
          function to set a #cairo_font_options_t that has
          [gid.cairo1.types.HintMetrics.Off] set.
  */
  @property void fontOptions(gid.cairo1.font_options.FontOptions propval) nothrow
  {
    setFontOptions(propval);
  }

  /**
      Get `fontScale` property.
      Returns: The terminal's font scale.
  */
  @property double fontScale() nothrow
  {
    return getFontScale();
  }

  /**
      Set `fontScale` property.
      Params:
        propval = The terminal's font scale.
  */
  @property void fontScale(double propval) nothrow
  {
    setFontScale(propval);
  }

  /**
      Get `hyperlinkHoverUri` property.
      Returns: The currently hovered hyperlink URI, or null if unset.
  */
  @property string hyperlinkHoverUri() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("hyperlink-hover-uri");
  }

  /** */
  @property string iconTitle() nothrow
  {
    return getIconTitle();
  }

  /**
      Get `inputEnabled` property.
      Returns: Controls whether the terminal allows user input. When user input is disabled,
        key press and mouse button press and motion events are not sent to the
        terminal's child.
  */
  @property bool inputEnabled() nothrow
  {
    return getInputEnabled();
  }

  /**
      Set `inputEnabled` property.
      Params:
        propval = Controls whether the terminal allows user input. When user input is disabled,
          key press and mouse button press and motion events are not sent to the
          terminal's child.
  */
  @property void inputEnabled(bool propval) nothrow
  {
    setInputEnabled(propval);
  }

  /**
      Get `pointerAutohide` property.
      Returns: Controls the value of the terminal's mouse autohide setting.  When autohiding
        is enabled, the mouse cursor will be hidden when the user presses a key and
        shown when the user moves the mouse.
  */
  @property bool pointerAutohide() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(bool)("pointer-autohide");
  }

  /**
      Set `pointerAutohide` property.
      Params:
        propval = Controls the value of the terminal's mouse autohide setting.  When autohiding
          is enabled, the mouse cursor will be hidden when the user presses a key and
          shown when the user moves the mouse.
  */
  @property void pointerAutohide(bool propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(bool)("pointer-autohide", propval);
  }

  /**
      Get `pty` property.
      Returns: The PTY object for the terminal.
  */
  @property gid.vte2.pty.Pty pty() nothrow
  {
    return getPty();
  }

  /**
      Set `pty` property.
      Params:
        propval = The PTY object for the terminal.
  */
  @property void pty(gid.vte2.pty.Pty propval) nothrow
  {
    setPty(propval);
  }

  /**
      Get `rewrapOnResize` property.
      Returns: Controls whether or not the terminal will rewrap its contents, including
        the scrollback buffer, whenever the terminal's width changes.
  */
  @property bool rewrapOnResize() nothrow
  {
    return getRewrapOnResize();
  }

  /**
      Set `rewrapOnResize` property.
      Params:
        propval = Controls whether or not the terminal will rewrap its contents, including
          the scrollback buffer, whenever the terminal's width changes.
  */
  @property void rewrapOnResize(bool propval) nothrow
  {
    setRewrapOnResize(propval);
  }

  /**
      Get `scrollOnInsert` property.
      Returns: Controls whether or not the terminal will forcibly scroll to the bottom of
        the viewable history when the text is inserted (e.g. by a paste).
  */
  @property bool scrollOnInsert() nothrow
  {
    return getScrollOnInsert();
  }

  /**
      Set `scrollOnInsert` property.
      Params:
        propval = Controls whether or not the terminal will forcibly scroll to the bottom of
          the viewable history when the text is inserted (e.g. by a paste).
  */
  @property void scrollOnInsert(bool propval) nothrow
  {
    setScrollOnInsert(propval);
  }

  /**
      Get `scrollOnKeystroke` property.
      Returns: Controls whether or not the terminal will forcibly scroll to the bottom of
        the viewable history when the user presses a key.  Modifier keys do not
        trigger this behavior.
  */
  @property bool scrollOnKeystroke() nothrow
  {
    return getScrollOnKeystroke();
  }

  /**
      Set `scrollOnKeystroke` property.
      Params:
        propval = Controls whether or not the terminal will forcibly scroll to the bottom of
          the viewable history when the user presses a key.  Modifier keys do not
          trigger this behavior.
  */
  @property void scrollOnKeystroke(bool propval) nothrow
  {
    setScrollOnKeystroke(propval);
  }

  /**
      Get `scrollOnOutput` property.
      Returns: Controls whether or not the terminal will forcibly scroll to the bottom of
        the viewable history when the new data is received from the child.
  */
  @property bool scrollOnOutput() nothrow
  {
    return getScrollOnOutput();
  }

  /**
      Set `scrollOnOutput` property.
      Params:
        propval = Controls whether or not the terminal will forcibly scroll to the bottom of
          the viewable history when the new data is received from the child.
  */
  @property void scrollOnOutput(bool propval) nothrow
  {
    setScrollOnOutput(propval);
  }

  /**
      Get `scrollUnitIsPixels` property.
      Returns: Controls whether the terminal's GtkAdjustment values unit is lines
        or pixels. This can be enabled when the terminal is the child of a
        GtkScrolledWindow to fix some bugs with its kinetic scrolling.
  */
  @property bool scrollUnitIsPixels() nothrow
  {
    return getScrollUnitIsPixels();
  }

  /**
      Set `scrollUnitIsPixels` property.
      Params:
        propval = Controls whether the terminal's GtkAdjustment values unit is lines
          or pixels. This can be enabled when the terminal is the child of a
          GtkScrolledWindow to fix some bugs with its kinetic scrolling.
  */
  @property void scrollUnitIsPixels(bool propval) nothrow
  {
    setScrollUnitIsPixels(propval);
  }

  /**
      Get `scrollbackLines` property.
      Returns: The length of the scrollback buffer used by the terminal.  The size of
        the scrollback buffer will be set to the larger of this value and the number
        of visible rows the widget can display, so 0 can safely be used to disable
        scrollback.  Note that this setting only affects the normal screen buffer.
        For terminal types which have an alternate screen buffer, no scrollback is
        allowed on the alternate screen buffer.
        
        Note that any value greater or equal to `G_MAXINT` is interpreted as unlimited
        scrollback, i.e. like `-1` when passed to [gid.vte3.terminal.Terminal.setScrollbackLines],
        and the value of this property for unlimited scrollback is `G_MAXUINT`.
  */
  @property uint scrollbackLines() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("scrollback-lines");
  }

  /**
      Set `scrollbackLines` property.
      Params:
        propval = The length of the scrollback buffer used by the terminal.  The size of
          the scrollback buffer will be set to the larger of this value and the number
          of visible rows the widget can display, so 0 can safely be used to disable
          scrollback.  Note that this setting only affects the normal screen buffer.
          For terminal types which have an alternate screen buffer, no scrollback is
          allowed on the alternate screen buffer.
          
          Note that any value greater or equal to `G_MAXINT` is interpreted as unlimited
          scrollback, i.e. like `-1` when passed to [gid.vte3.terminal.Terminal.setScrollbackLines],
          and the value of this property for unlimited scrollback is `G_MAXUINT`.
  */
  @property void scrollbackLines(uint propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(uint)("scrollback-lines", propval);
  }

  /**
      Get `textBlinkMode` property.
      Returns: Controls whether or not the terminal will allow blinking text.
  */
  @property gid.vte2.types.TextBlinkMode textBlinkMode() nothrow
  {
    return getTextBlinkMode();
  }

  /**
      Set `textBlinkMode` property.
      Params:
        propval = Controls whether or not the terminal will allow blinking text.
  */
  @property void textBlinkMode(gid.vte2.types.TextBlinkMode propval) nothrow
  {
    setTextBlinkMode(propval);
  }

  /**
      Get `windowTitle` property.
      Returns: The terminal's title.
  
      Deprecated: Use the [gid.vte3.types.TERMPROP_XTERM_TITLE] termprop.
  */
  @property string windowTitle() nothrow
  {
    return getWindowTitle();
  }

  /**
      Get `wordCharExceptions` property.
      Returns: The set of characters which will be considered parts of a word
        when doing word-wise selection, in addition to the default which only
        considers alphanumeric characters part of a word.
        
        If null, a built-in set is used.
  */
  @property string wordCharExceptions() nothrow
  {
    return getWordCharExceptions();
  }

  /**
      Get `xalign` property.
      Returns: The horizontal alignment of @terminal within its allocation.
  */
  @property gid.vte2.types.Align xalign() nothrow
  {
    return getXalign();
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of @terminal within its allocation.
  */
  @property void xalign(gid.vte2.types.Align propval) nothrow
  {
    setXalign(propval);
  }

  /**
      Get `xfill` property.
      Returns: The horizontal fillment of @terminal within its allocation.
  */
  @property bool xfill() nothrow
  {
    return getXfill();
  }

  /**
      Set `xfill` property.
      Params:
        propval = The horizontal fillment of @terminal within its allocation.
  */
  @property void xfill(bool propval) nothrow
  {
    setXfill(propval);
  }

  /**
      Get `yalign` property.
      Returns: The vertical alignment of @terminal within its allocation
  */
  @property gid.vte2.types.Align yalign() nothrow
  {
    return getYalign();
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of @terminal within its allocation
  */
  @property void yalign(gid.vte2.types.Align propval) nothrow
  {
    setYalign(propval);
  }

  /**
      Get `yfill` property.
      Returns: The vertical fillment of @terminal within its allocation.
        Note that #VteTerminal:yfill=true is only supported with
        #VteTerminal:yalign=[gid.vte3.types.Align.Start], and is ignored for
        all other yalign values.
  */
  @property bool yfill() nothrow
  {
    return getYfill();
  }

  /**
      Set `yfill` property.
      Params:
        propval = The vertical fillment of @terminal within its allocation.
          Note that #VteTerminal:yfill=true is only supported with
          #VteTerminal:yalign=[gid.vte3.types.Align.Start], and is ignored for
          all other yalign values.
  */
  @property void yfill(bool propval) nothrow
  {
    setYfill(propval);
  }

  mixin ScrollableT!();

  /**
      Creates a new terminal widget.
      Returns: a new #VteTerminal object
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GtkWidget* _cretval;
      _cretval = vte_terminal_new();
      this(_cretval, No.Take);
    }
  }

  /** */
  protected void vfuncBell()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.bell)
      return;

    _klass.bell(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncCharSizeChanged(uint charWidth, uint charHeight)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.charSizeChanged)
      return;

    _klass.charSizeChanged(cast(VteTerminal*)this._cPtr, charWidth, charHeight);
  }

  /** */
  protected void vfuncChildExited(int status)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.childExited)
      return;

    _klass.childExited(cast(VteTerminal*)this._cPtr, status);
  }

  /** */
  protected void vfuncCommit(string text, uint size)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.commit)
      return;

    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    _klass.commit(cast(VteTerminal*)this._cPtr, _text, size);
  }

  /** */
  protected void vfuncContentsChanged()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.contentsChanged)
      return;

    _klass.contentsChanged(cast(VteTerminal*)this._cPtr);
  }

  /**
      Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
      selection.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncCopyClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  
      Deprecated: Use [gid.vte3.terminal.Terminal.copyClipboardFormat] with [gid.vte3.types.Format.Text]
          instead.
  */
  protected void vfuncCopyClipboard()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.copyClipboard)
      return;

    _klass.copyClipboard(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncCursorMoved()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.cursorMoved)
      return;

    _klass.cursorMoved(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncDecreaseFontSize()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.decreaseFontSize)
      return;

    _klass.decreaseFontSize(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncDeiconifyWindow()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.deiconifyWindow)
      return;

    _klass.deiconifyWindow(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncEncodingChanged()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.encodingChanged)
      return;

    _klass.encodingChanged(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncEof()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.eof)
      return;

    _klass.eof(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncIconTitleChanged()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.iconTitleChanged)
      return;

    _klass.iconTitleChanged(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncIconifyWindow()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.iconifyWindow)
      return;

    _klass.iconifyWindow(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncIncreaseFontSize()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.increaseFontSize)
      return;

    _klass.increaseFontSize(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncLowerWindow()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.lowerWindow)
      return;

    _klass.lowerWindow(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncMaximizeWindow()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.maximizeWindow)
      return;

    _klass.maximizeWindow(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncMoveWindow(uint x, uint y)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.moveWindow)
      return;

    _klass.moveWindow(cast(VteTerminal*)this._cPtr, x, y);
  }

  /**
      Sends the contents of the #GDK_SELECTION_CLIPBOARD selection to the
      terminal's child. It's called on paste menu item, or when
      user presses Shift+Insert.
  
      Virtual method: calls the C implementation of the object's class (or of the nearest C ancestor class of a
      D subclass type), use `super.vfuncPasteClipboard` to chain up from an override.
      Overrides are installed in the class structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  protected void vfuncPasteClipboard()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.pasteClipboard)
      return;

    _klass.pasteClipboard(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncRaiseWindow()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.raiseWindow)
      return;

    _klass.raiseWindow(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncRefreshWindow()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.refreshWindow)
      return;

    _klass.refreshWindow(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncResizeWindow(uint width, uint height)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.resizeWindow)
      return;

    _klass.resizeWindow(cast(VteTerminal*)this._cPtr, width, height);
  }

  /** */
  protected void vfuncRestoreWindow()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.restoreWindow)
      return;

    _klass.restoreWindow(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncSelectionChanged()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.selectionChanged)
      return;

    _klass.selectionChanged(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncSetupContextMenu(gid.vte2.event_context.EventContext context)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.setupContextMenu)
      return;

    _klass.setupContextMenu(cast(VteTerminal*)this._cPtr, context ? cast(const(VteEventContext)*)context._cPtr(No.Dup) : null);
  }

  /** */
  protected void vfuncTermpropChanged(string prop)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.termpropChanged)
      return;

    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _klass.termpropChanged(cast(VteTerminal*)this._cPtr, _prop);
  }

  /** */
  protected void vfuncTextDeleted()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.textDeleted)
      return;

    _klass.textDeleted(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncTextInserted()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.textInserted)
      return;

    _klass.textInserted(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncTextModified()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.textModified)
      return;

    _klass.textModified(cast(VteTerminal*)this._cPtr);
  }

  /** */
  protected void vfuncTextScrolled(int delta)
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.textScrolled)
      return;

    _klass.textScrolled(cast(VteTerminal*)this._cPtr, delta);
  }

  /** */
  protected void vfuncWindowTitleChanged()
  {
    auto _klass = cast(VteTerminalClass*)_vfuncClass;
    if (!_klass.windowTitleChanged)
      return;

    _klass.windowTitleChanged(cast(VteTerminal*)this._cPtr);
  }

  /**
      Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
      selection.
  
      Deprecated: Use [gid.vte3.terminal.Terminal.copyClipboardFormat] with [gid.vte3.types.Format.Text]
          instead.
  */
  void copyClipboard() nothrow
  {
    vte_terminal_copy_clipboard(cast(VteTerminal*)this._cPtr);
  }

  /**
      Places the selected text in the terminal in the #GDK_SELECTION_CLIPBOARD
      selection in the form specified by format.
      
      For all formats, the selection data (see #GtkSelectionData) will include the
      text targets (see [gid.gtk3.target_list.TargetList.addTextTargets] and
      gtk_selection_data_targets_includes_text()). For [gid.vte3.types.Format.Html],
      the selection will also include the "text/html" target, which when requested,
      returns the HTML data in UTF-16 with a U+FEFF BYTE ORDER MARK character at
      the start.
  
      Params:
        format = a #VteFormat
  */
  void copyClipboardFormat(gid.vte2.types.Format format) nothrow
  {
    vte_terminal_copy_clipboard_format(cast(VteTerminal*)this._cPtr, format);
  }

  /**
      Places the selected text in the terminal in the #GDK_SELECTION_PRIMARY
      selection.
  */
  void copyPrimary() nothrow
  {
    vte_terminal_copy_primary(cast(VteTerminal*)this._cPtr);
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.String] termprop, or null if
        prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
        size = a location to store the string length, or null
      Returns: the property's value, or null
  */
  string dupTermpropString(string prop, out size_t size) nothrow
  {
    char* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_dup_termprop_string(cast(VteTerminal*)this._cPtr, _prop, cast(size_t*)&size);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.dupTermpropString] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        size = a location to store the string length, or null
      Returns: the property's value, or null
  */
  string dupTermpropStringById(int prop, out size_t size) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_dup_termprop_string_by_id(cast(VteTerminal*)this._cPtr, prop, cast(size_t*)&size);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.Uuid] termprop as a #VteUuid, or null if
        prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
      Returns: the property's value as a #VteUuid, or null
  */
  gid.vte2.uuid.Uuid dupTermpropUuid(string prop) nothrow
  {
    VteUuid* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_dup_termprop_uuid(cast(VteTerminal*)this._cPtr, _prop);
    auto _retval = _cretval ? new gid.vte2.uuid.Uuid(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.dupTermpropUuid] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
      Returns: the property's value as a #VteUuid, or null
  */
  gid.vte2.uuid.Uuid dupTermpropUuidById(int prop) nothrow
  {
    VteUuid* _cretval;
    _cretval = vte_terminal_dup_termprop_uuid_by_id(cast(VteTerminal*)this._cPtr, prop);
    auto _retval = _cretval ? new gid.vte2.uuid.Uuid(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gid.vte2.terminal.Terminal.eventCheckRegexSimple], but returns an array of strings,
      containing the matching text (or null if no match) corresponding to each of the
      regexes in regexes.
      
      You must free each string and the array; but note that this is *not* a null-terminated
      string array, and so you must *not* use [gid.glib2.global.strfreev] on it.
  
      Params:
        event = a #GdkEvent
        regexes = an array of #VteRegex
        matchFlags = PCRE2 match flags, or 0
      Returns: a newly allocated array of strings,
          or null if none of the regexes matched
  */
  string[] eventCheckRegexSimple(gid.gdk3.event.Event event, gid.vte2.regex.Regex[] regexes, uint matchFlags) nothrow
  {
    char** _cretval;
    size_t _cretlength;
    size_t _nRegexes;
    if (regexes)
      _nRegexes = cast(size_t)regexes.length;

    auto _regexes_arr = new VteRegex*[](regexes.length);
    auto _regexes = _regexes_arr.ptr;
    foreach (i, obj; regexes) _regexes[i] = obj ? cast(VteRegex*)obj._cPtr(No.Dup) : null;
    _cretval = vte_terminal_event_check_regex_array(cast(VteTerminal*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, _regexes, _nRegexes, matchFlags, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Interprets data as if it were data received from a child process.
  
      Params:
        data = a string in the terminal's current encoding
  */
  void feed(ubyte[] data = null) nothrow
  {
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    vte_terminal_feed(cast(VteTerminal*)this._cPtr, _data, _length);
  }

  /**
      Sends a block of UTF-8 text to the child as if it were entered by the user
      at the keyboard.
  
      Params:
        text = data to send to the child
  */
  void feedChild(ubyte[] text = null) nothrow
  {
    ptrdiff_t _length;
    if (text)
      _length = cast(ptrdiff_t)text.length;

    auto _text = cast(ubyte*)text.ptr;
    vte_terminal_feed_child(cast(VteTerminal*)this._cPtr, _text, _length);
  }

  /**
      Sends a block of binary data to the child.
  
      Params:
        data = data to send to the child
  
      Deprecated: Don't send binary data. Use [gid.vte3.terminal.Terminal.feedChild] instead to send
          UTF-8 text
  */
  void feedChildBinary(ubyte[] data = null) nothrow
  {
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(ubyte*)data.ptr;
    vte_terminal_feed_child_binary(cast(VteTerminal*)this._cPtr, _data, _length);
  }

  /**
      Checks whether or not the terminal will attempt to draw bold text,
      by using a bold font variant.
      Returns: true if bolding is enabled, false if not
  
      Deprecated: There's probably no reason for this feature to exist.
  */
  bool getAllowBold() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_allow_bold(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether or not hyperlinks (OSC 8 escape sequence) are allowed.
      Returns: true if hyperlinks are enabled, false if not
  */
  bool getAllowHyperlink() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_allow_hyperlink(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether or not the terminal will beep when the child outputs the
      "bl" sequence.
      Returns: true if audible bell is enabled, false if not
  */
  bool getAudibleBell() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_audible_bell(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the SGR 1 attribute also switches to the bright counterpart
      of the first 8 palette colors, in addition to making them bold (legacy behavior)
      or if SGR 1 only enables bold and leaves the color intact.
      Returns: true if bold also enables bright, false if not
  */
  bool getBoldIsBright() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_bold_is_bright(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  double getCellHeightScale() nothrow
  {
    double _retval;
    _retval = vte_terminal_get_cell_height_scale(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  double getCellWidthScale() nothrow
  {
    double _retval;
    _retval = vte_terminal_get_cell_width_scale(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  glong getCharHeight() nothrow
  {
    glong _retval;
    _retval = vte_terminal_get_char_height(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  glong getCharWidth() nothrow
  {
    glong _retval;
    _retval = vte_terminal_get_char_width(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether ambiguous-width characters are narrow or wide.
      (Note that when using a non-UTF-8 encoding set via [gid.vte3.terminal.Terminal.setEncoding],
      the width of ambiguous-width characters is fixed and determined by the encoding
      itself.)
      Returns: 1 if ambiguous-width characters are narrow, or 2 if they are wide
  */
  int getCjkAmbiguousWidth() nothrow
  {
    int _retval;
    _retval = vte_terminal_get_cjk_ambiguous_width(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Returns the background colour, as used by terminal when
      drawing the background, which may be different from
      the color set by [gid.vte3.terminal.Terminal.setColorBackground].
      
      Note: you must only call this function while handling the
      GtkWidget::draw signal.
      
      This function is rarely useful. One use for it is if you disable
      drawing the background (see [gid.vte3.terminal.Terminal.setClearBackground])
      and then need to draw the background yourself.
  
      Params:
        color = a location to store a #GdkRGBA color
  */
  void getColorBackgroundForDraw(out gid.gdk3.rgba.RGBA color) nothrow
  {
    vte_terminal_get_color_background_for_draw(cast(VteTerminal*)this._cPtr, cast(GdkRGBA*)&color);
  }

  /** */
  glong getColumnCount() nothrow
  {
    glong _retval;
    _retval = vte_terminal_get_column_count(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  gid.gtk3.widget.Widget getContextMenu() nothrow
  {
    GtkWidget* _cretval;
    _cretval = vte_terminal_get_context_menu(cast(VteTerminal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk3.widget.Widget)(cast(GtkWidget*)_cretval, No.Take);
    return _retval;
  }

  /** */
  gid.gio2.menu_model.MenuModel getContextMenuModel() nothrow
  {
    GMenuModel* _cretval;
    _cretval = vte_terminal_get_context_menu_model(cast(VteTerminal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.menu_model.MenuModel)(cast(GMenuModel*)_cretval, No.Take);
    return _retval;
  }

  /** */
  string getCurrentDirectoryUri() nothrow
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_current_directory_uri(cast(VteTerminal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  string getCurrentFileUri() nothrow
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_current_file_uri(cast(VteTerminal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the currently set cursor blink mode.
      Returns: cursor blink mode.
  */
  gid.vte2.types.CursorBlinkMode getCursorBlinkMode() nothrow
  {
    VteCursorBlinkMode _cretval;
    _cretval = vte_terminal_get_cursor_blink_mode(cast(VteTerminal*)this._cPtr);
    gid.vte2.types.CursorBlinkMode _retval = cast(gid.vte2.types.CursorBlinkMode)_cretval;
    return _retval;
  }

  /**
      Reads the location of the insertion cursor and returns it.  The row
      coordinate is absolute.
      
      This method is unaware of BiDi. The returned column is logical column.
  
      Params:
        column = a location to store the column, or null
        row = a location to store the row, or null
  */
  void getCursorPosition(out glong column, out glong row) nothrow
  {
    vte_terminal_get_cursor_position(cast(VteTerminal*)this._cPtr, cast(glong*)&column, cast(glong*)&row);
  }

  /**
      Returns the currently set cursor shape.
      Returns: cursor shape.
  */
  gid.vte2.types.CursorShape getCursorShape() nothrow
  {
    VteCursorShape _cretval;
    _cretval = vte_terminal_get_cursor_shape(cast(VteTerminal*)this._cPtr);
    gid.vte2.types.CursorShape _retval = cast(gid.vte2.types.CursorShape)_cretval;
    return _retval;
  }

  /**
      Checks whether the terminal communicates with a11y backends
      Returns: true if a11y is enabled, false if not
  */
  bool getEnableA11y() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_enable_a11y(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the terminal performs bidirectional text rendering.
      Returns: true if BiDi is enabled, false if not
  */
  bool getEnableBidi() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_enable_bidi(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  bool getEnableFallbackScrolling() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_enable_fallback_scrolling(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  bool getEnableLegacyOsc777() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_enable_legacy_osc777(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Checks whether the terminal shapes Arabic text.
      Returns: true if Arabic shaping is enabled, false if not
  */
  bool getEnableShaping() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_enable_shaping(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  bool getEnableSixel() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_enable_sixel(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Determines the name of the encoding in which the terminal expects data to be
      encoded, or null if UTF-8 is in use.
      Returns: the current encoding for the terminal
  
      Deprecated: Support for non-UTF-8 is deprecated.
  */
  string getEncoding() nothrow
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_encoding(cast(VteTerminal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Queries the terminal for information about the fonts which will be
      used to draw text in the terminal.  The actual font takes the font scale
      into account, this is not reflected in the return value, the unscaled
      font is returned.
      Returns: a #PangoFontDescription describing the font the
        terminal uses to render text at the default font scale of 1.0.
  */
  gid.pango1.font_description.FontDescription getFont() nothrow
  {
    const(PangoFontDescription)* _cretval;
    _cretval = vte_terminal_get_font(cast(VteTerminal*)this._cPtr);
    auto _retval = _cretval ? new gid.pango1.font_description.FontDescription(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  override gid.cairo1.font_options.FontOptions getFontOptions() nothrow
  {
    const(cairo_font_options_t)* _cretval;
    _cretval = vte_terminal_get_font_options(cast(VteTerminal*)this._cPtr);
    auto _retval = _cretval ? new gid.cairo1.font_options.FontOptions(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  double getFontScale() nothrow
  {
    double _retval;
    _retval = vte_terminal_get_font_scale(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Fills in some hints from terminal's geometry. The hints
      filled are those covered by the [gid.gdk3.types.WindowHints.ResizeInc],
      [gid.gdk3.types.WindowHints.MinSize] and [gid.gdk3.types.WindowHints.BaseSize] flags.
      
      See [gid.gtk3.window.Window.setGeometryHints] for more information.
      
      terminal must be realized (see [gid.gtk4.widget.Widget.getRealized]).
  
      Params:
        hints = a #GdkGeometry to fill in
        minRows = the minimum number of rows to request
        minColumns = the minimum number of columns to request
  */
  void getGeometryHints(out gid.gdk3.types.Geometry hints, int minRows, int minColumns) nothrow
  {
    vte_terminal_get_geometry_hints(cast(VteTerminal*)this._cPtr, cast(GdkGeometry*)&hints, minRows, minColumns);
  }

  /**
      Checks if the terminal currently contains selected text.  Note that this
      is different from determining if the terminal is the owner of any
      #GtkClipboard items.
      Returns: true if part of the text in the terminal is selected.
  */
  bool getHasSelection() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_has_selection(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  string getIconTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_icon_title(cast(VteTerminal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns whether the terminal allow user input.
      Returns: 
  */
  bool getInputEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_input_enabled(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Determines the value of the terminal's mouse autohide setting.  When
      autohiding is enabled, the mouse cursor will be hidden when the user presses
      a key and shown when the user moves the mouse.  This setting can be changed
      using [gid.vte3.terminal.Terminal.setMouseAutohide].
      Returns: true if autohiding is enabled, false if not
  */
  bool getMouseAutohide() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_mouse_autohide(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Returns the #VtePty of terminal.
      Returns: a #VtePty, or null
  */
  gid.vte2.pty.Pty getPty() nothrow
  {
    VtePty* _cretval;
    _cretval = vte_terminal_get_pty(cast(VteTerminal*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.vte2.pty.Pty)(cast(VtePty*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks whether or not the terminal will rewrap its contents upon resize.
      Returns: true if rewrapping is enabled, false if not
  */
  bool getRewrapOnResize() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_rewrap_on_resize(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  glong getRowCount() nothrow
  {
    glong _retval;
    _retval = vte_terminal_get_row_count(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  bool getScrollOnInsert() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_scroll_on_insert(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  bool getScrollOnKeystroke() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_scroll_on_keystroke(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  bool getScrollOnOutput() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_scroll_on_output(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  bool getScrollUnitIsPixels() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_scroll_unit_is_pixels(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  glong getScrollbackLines() nothrow
  {
    glong _retval;
    _retval = vte_terminal_get_scrollback_lines(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      For a [gid.vte3.types.PropertyType.Bool] termprop, sets value to prop's value,
        or to false if prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropBool(string prop, out bool valuep) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    gboolean _valuep;
    _retval = cast(bool)vte_terminal_get_termprop_bool(cast(VteTerminal*)this._cPtr, _prop, &_valuep);
    valuep = cast(bool)_valuep;
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropBool] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropBoolById(int prop, out bool valuep) nothrow
  {
    bool _retval;
    gboolean _valuep;
    _retval = cast(bool)vte_terminal_get_termprop_bool_by_id(cast(VteTerminal*)this._cPtr, prop, &_valuep);
    valuep = cast(bool)_valuep;
    return _retval;
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.Data] termprop, or null if
        prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
      Returns: the property's value, or null
  */
  ubyte[] getTermpropData(string prop) nothrow
  {
    const(ubyte)* _cretval;
    size_t _cretlength;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_get_termprop_data(cast(VteTerminal*)this._cPtr, _prop, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropData] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
      Returns: the property's value, or null
  */
  ubyte[] getTermpropDataById(int prop) nothrow
  {
    const(ubyte)* _cretval;
    size_t _cretlength;
    _cretval = vte_terminal_get_termprop_data_by_id(cast(VteTerminal*)this._cPtr, prop, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    }
    return _retval;
  }

  /**
      For a [gid.vte3.types.PropertyType.Double] termprop, sets value to prop's value,
        which is finite; or to 0.0 if prop is unset, or prop is not a
        registered property.
  
      Params:
        prop = a termprop name
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropDouble(string prop, out double valuep) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)vte_terminal_get_termprop_double(cast(VteTerminal*)this._cPtr, _prop, cast(double*)&valuep);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropDouble] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropDoubleById(int prop, out double valuep) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_termprop_double_by_id(cast(VteTerminal*)this._cPtr, prop, cast(double*)&valuep);
    return _retval;
  }

  /**
      See vte_properties_get_property_enum() for more information.
  
      Params:
        prop = a property name of a [gid.vte3.types.PropertyType.String] property
        gtype = a #GType of an enum type
        valuep = a location to store the value, or null
      Returns: true iff the property was set and could be parsed a
          a value of the enumeration type
  */
  bool getTermpropEnum(string prop, gid.gobject2.types.GType gtype, out long valuep) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)vte_terminal_get_termprop_enum(cast(VteTerminal*)this._cPtr, _prop, gtype, cast(long*)&valuep);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropEnum] except that it takes the property
      by ID. See that function for more information.
  
      Params:
        prop = a property ID of a [gid.vte3.types.PropertyType.String] property
        gtype = a #GType of an enum type
        valuep = a location to store the value, or null
      Returns: true iff the property was set and could be parsed a
          a value of enumeration type type
  */
  bool getTermpropEnumById(int prop, gid.gobject2.types.GType gtype, out long valuep) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_termprop_enum_by_id(cast(VteTerminal*)this._cPtr, prop, gtype, cast(long*)&valuep);
    return _retval;
  }

  /**
      See vte_properties_get_property_flags() for more information.
  
      Params:
        prop = 
        gtype = a #GType of a flags type
        ignoreUnknownFlags = whether to ignore unknown flags
        valuep = a location to store the value, or null
      Returns: true iff the property was set and could be parsed a
          a value of the flags type
  */
  bool getTermpropFlags(string prop, gid.gobject2.types.GType gtype, bool ignoreUnknownFlags, out ulong valuep) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)vte_terminal_get_termprop_flags(cast(VteTerminal*)this._cPtr, _prop, gtype, ignoreUnknownFlags, cast(ulong*)&valuep);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropFlags] except that it takes the property
      by ID. See that function for more information.
  
      Params:
        prop = 
        gtype = a #GType of a flags type
        ignoreUnknownFlags = whether to ignore unknown flags
        valuep = a location to store the value, or null
      Returns: true iff the property was set and could be parsed a
          a value of flags type type
  */
  bool getTermpropFlagsById(int prop, gid.gobject2.types.GType gtype, bool ignoreUnknownFlags, out ulong valuep) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_termprop_flags_by_id(cast(VteTerminal*)this._cPtr, prop, gtype, ignoreUnknownFlags, cast(ulong*)&valuep);
    return _retval;
  }

  /**
      For a [gid.vte3.types.PropertyType.Int] termprop, sets value to prop's value,
      or to 0 if prop is unset, or if prop is not a registered property.
      
      If only a subset or range of values are acceptable for the given property,
      the caller must validate the returned value and treat any out-of-bounds
      value as if the termprop had no value; in particular it *must not* clamp
      the values to the expected range.
  
      Params:
        prop = a termprop name
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropInt(string prop, out long valuep) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)vte_terminal_get_termprop_int(cast(VteTerminal*)this._cPtr, _prop, cast(long*)&valuep);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropInt] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropIntById(int prop, out long valuep) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_termprop_int_by_id(cast(VteTerminal*)this._cPtr, prop, cast(long*)&valuep);
    return _retval;
  }

  /**
      Stores the value of a [gid.vte3.types.PropertyType.Rgb] or [gid.vte3.types.PropertyType.Rgba] termprop in color and
      returns true if the termprop is set, or stores rgb(0,0,0) or rgba(0,0,0,1) in color
      and returns false if the termprop is unset.
  
      Params:
        prop = a termprop name
        color = a #GdkRGBA to fill in
      Returns: true iff the termprop is set
  */
  bool getTermpropRgba(string prop, out gid.gdk3.rgba.RGBA color) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)vte_terminal_get_termprop_rgba(cast(VteTerminal*)this._cPtr, _prop, cast(GdkRGBA*)&color);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropRgba] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        color = a #GdkRGBA to fill in
      Returns: true iff the termprop is set
  */
  bool getTermpropRgbaById(int prop, out gid.gdk3.rgba.RGBA color) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_termprop_rgba_by_id(cast(VteTerminal*)this._cPtr, prop, cast(GdkRGBA*)&color);
    return _retval;
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.String] termprop, or null if
        prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
        size = a location to store the string length, or null
      Returns: the property's value, or null
  */
  string getTermpropString(string prop, out size_t size) nothrow
  {
    const(char)* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_get_termprop_string(cast(VteTerminal*)this._cPtr, _prop, cast(size_t*)&size);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropString] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        size = a location to store the string length, or null
      Returns: the property's value, or null
  */
  string getTermpropStringById(int prop, out size_t size) nothrow
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_termprop_string_by_id(cast(VteTerminal*)this._cPtr, prop, cast(size_t*)&size);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      For a [gid.vte3.types.PropertyType.Uint] termprop, sets value to prop's value,
      or to 0 if prop is unset, or prop is not a registered property.
      
      If only a subset or range of values are acceptable for the given property,
      the caller must validate the returned value and treat any out-of-bounds
      value as if the termprop had no value; in particular it *must not* clamp
      the values to the expected range.
  
      Params:
        prop = a termprop name
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropUint(string prop, out ulong valuep) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)vte_terminal_get_termprop_uint(cast(VteTerminal*)this._cPtr, _prop, cast(ulong*)&valuep);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropUint] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        valuep = a location to store the value, or null
      Returns: true iff the termprop is set
  */
  bool getTermpropUintById(int prop, out ulong valuep) nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_termprop_uint_by_id(cast(VteTerminal*)this._cPtr, prop, cast(ulong*)&valuep);
    return _retval;
  }

  /**
      Returns true with the value of prop stored in value (if not null) if,
        the termprop has a value, or false if prop is unset, or prop is not
        a registered property; in that case value will not be set.
      
      The value type returned depends on the termprop type:
      * A [gid.vte3.types.PropertyType.Valueless] termprop stores no value, and returns false
        from this function.
      * A [gid.vte3.types.PropertyType.Bool] termprop stores a `G_TYPE_BOOLEAN` value.
      * A [gid.vte3.types.PropertyType.Int] termprop stores a `G_TYPE_INT64` value.
      * A [gid.vte3.types.PropertyType.Uint] termprop stores a `G_TYPE_UINT64` value.
      * A [gid.vte3.types.PropertyType.Double] termprop stores a `G_TYPE_DOUBLE` value.
      * A [gid.vte3.types.PropertyType.Rgb] termprop stores a boxed #GdkRGBA value with alpha 1.0 on gtk3,
         and nothing on gtk4.
      * A [gid.vte3.types.PropertyType.Rgba] termprop stores a boxed #GdkRGBA value on gtk3,
         and nothing on gtk4.
      * A [gid.vte3.types.PropertyType.String] termprop stores a `G_TYPE_STRING` value.
      * A [gid.vte3.types.PropertyType.Data] termprop stores a boxed #GBytes value.
      * A [gid.vte3.types.PropertyType.Uuid] termprop stores a boxed #VteUuid value.
      * A [gid.vte3.types.PropertyType.Uri] termprop stores a boxed #GUri value.
      * A [gid.vte3.types.PropertyType.Image] termprop stores a boxed #cairo_surface_t value on gtk3,
          and a boxed #GdkTexture on gtk4
  
      Params:
        prop = a termprop name
        gvalue = a #GValue to be filled in, or null
      Returns: true iff the property has a value, with gvalue containig
          the property's value.
  */
  bool getTermpropValue(string prop, out gid.gobject2.value.Value gvalue) nothrow
  {
    bool _retval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    auto _gvalue = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _retval = cast(bool)vte_terminal_get_termprop_value(cast(VteTerminal*)this._cPtr, _prop, _gvalue);
    gvalue = new gid.gobject2.value.Value(cast(void*)_gvalue, Yes.Take);
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.getTermpropValue] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
        gvalue = a #GValue to be filled in
      Returns: true iff the property has a value, with gvalue containig
          the property's value.
  */
  bool getTermpropValueById(int prop, out gid.gobject2.value.Value gvalue) nothrow
  {
    bool _retval;
    auto _gvalue = boxedNew!GValue(gid.gobject2.value.Value._getGType);
    _retval = cast(bool)vte_terminal_get_termprop_value_by_id(cast(VteTerminal*)this._cPtr, prop, _gvalue);
    gvalue = new gid.gobject2.value.Value(cast(void*)_gvalue, Yes.Take);
    return _retval;
  }

  /**
      Checks whether or not the terminal will allow blinking text.
      Returns: the blinking setting
  */
  gid.vte2.types.TextBlinkMode getTextBlinkMode() nothrow
  {
    VteTextBlinkMode _cretval;
    _cretval = vte_terminal_get_text_blink_mode(cast(VteTerminal*)this._cPtr);
    gid.vte2.types.TextBlinkMode _retval = cast(gid.vte2.types.TextBlinkMode)_cretval;
    return _retval;
  }

  /**
      Returns text from the visible part of the terminal in the specified format.
      
      This method is unaware of BiDi. The columns returned in attributes are
      logical columns.
  
      Params:
        format = the #VteFormat to use
      Returns: a newly allocated text string, or null.
  */
  string getTextFormat(gid.vte2.types.Format format) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_format(cast(VteTerminal*)this._cPtr, format);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns the specified range of text in the specified format.
  
      Params:
        format = the #VteFormat to use
        startRow = the first row of the range
        startCol = the first column of the range
        endRow = the last row of the range
        endCol = the last column of the range
        length = a pointer to a #gsize to store the string length
      Returns: a newly allocated string, or null.
  */
  string getTextRangeFormat(gid.vte2.types.Format format, glong startRow, glong startCol, glong endRow, glong endCol, out size_t length) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_range_format(cast(VteTerminal*)this._cPtr, format, startRow, startCol, endRow, endCol, cast(size_t*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the currently selected text in the format specified by format.
      Since 0.72, this function also supports [gid.vte3.types.Format.Html] format.
  
      Params:
        format = the #VteFormat to use
      Returns: a newly allocated string containing the selected text, or null if there is no selection or the format is not supported
  */
  string getTextSelected(gid.vte2.types.Format format) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_selected(cast(VteTerminal*)this._cPtr, format);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the currently selected text in the format specified by format.
  
      Params:
        format = the #VteFormat to use
        length = a pointer to a #gsize to store the string length
      Returns: a newly allocated string containing the selected text, or null if there is no selection or the format is not supported
  */
  string getTextSelectedFull(gid.vte2.types.Format format, out size_t length) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_get_text_selected_full(cast(VteTerminal*)this._cPtr, format, cast(size_t*)&length);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /** */
  string getWindowTitle() nothrow
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_window_title(cast(VteTerminal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns the set of characters which will be considered parts of a word
      when doing word-wise selection, in addition to the default which only
      considers alphanumeric characters part of a word.
      
      If null, a built-in set is used.
      Returns: a string, or null
  */
  string getWordCharExceptions() nothrow
  {
    const(char)* _cretval;
    _cretval = vte_terminal_get_word_char_exceptions(cast(VteTerminal*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /** */
  gid.vte2.types.Align getXalign() nothrow
  {
    VteAlign _cretval;
    _cretval = vte_terminal_get_xalign(cast(VteTerminal*)this._cPtr);
    gid.vte2.types.Align _retval = cast(gid.vte2.types.Align)_cretval;
    return _retval;
  }

  /** */
  bool getXfill() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_xfill(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  gid.vte2.types.Align getYalign() nothrow
  {
    VteAlign _cretval;
    _cretval = vte_terminal_get_yalign(cast(VteTerminal*)this._cPtr);
    gid.vte2.types.Align _retval = cast(gid.vte2.types.Align)_cretval;
    return _retval;
  }

  /** */
  bool getYfill() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_get_yfill(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Returns a nonempty string: the target of the explicit hyperlink (printed using the OSC 8
      escape sequence) at the position of the event, or null.
      
      Proper use of the escape sequence should result in URI-encoded URIs with a proper scheme
      like "http://", "https://", "file://", "mailto:" etc. This is, however, not enforced by VTE.
      The caller must tolerate the returned string potentially not being a valid URI.
  
      Params:
        event = a #GdkEvent
      Returns: a newly allocated string containing the target of the hyperlink,
         or null
  */
  string hyperlinkCheckEvent(gid.gdk3.event.Event event) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_hyperlink_check_event(cast(VteTerminal*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      This function does nothing since version 0.60.
  
      Params:
        gregex = a #GRegex
        gflags = the #GRegexMatchFlags to use when matching the regex
      Returns: -1
  
      Deprecated: Use [gid.vte3.terminal.Terminal.matchAddRegex] instead.
  */
  int matchAddGregex(gid.glib2.regex.Regex gregex, gid.glib2.types.RegexMatchFlags gflags) nothrow
  {
    int _retval;
    _retval = vte_terminal_match_add_gregex(cast(VteTerminal*)this._cPtr, gregex ? cast(GRegex*)gregex._cPtr(No.Dup) : null, gflags);
    return _retval;
  }

  /**
      Adds the regular expression regex to the list of matching expressions.  When the
      user moves the mouse cursor over a section of displayed text which matches
      this expression, the text will be highlighted.
      
      Note that regex should have been created using the <literal>PCRE2_MULTILINE</literal>
      flag.
  
      Params:
        regex = a #VteRegex
        flags = PCRE2 match flags, or 0
      Returns: an integer associated with this expression
  */
  int matchAddRegex(gid.vte2.regex.Regex regex, uint flags) nothrow
  {
    int _retval;
    _retval = vte_terminal_match_add_regex(cast(VteTerminal*)this._cPtr, regex ? cast(VteRegex*)regex._cPtr(No.Dup) : null, flags);
    return _retval;
  }

  /**
      Checks if the text in and around the specified position matches any of the
      regular expressions previously set using vte_terminal_match_add().  If a
      match exists, the text string is returned and if tag is not null, the number
      associated with the matched regular expression will be stored in tag.
      
      If more than one regular expression has been set with
      vte_terminal_match_add(), then expressions are checked in the order in
      which they were added.
  
      Params:
        column = the text column
        row = the text row
        tag = a location to store the tag, or null
      Returns: a newly allocated string which matches one of the previously
          set regular expressions
  
      Deprecated: Use [gid.vte2.terminal.Terminal.matchCheckEvent] instead.
  */
  string matchCheck(glong column, glong row, out int tag) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_match_check(cast(VteTerminal*)this._cPtr, column, row, cast(int*)&tag);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Checks if the text in and around the position of the event matches any of the
      regular expressions previously set using vte_terminal_match_add().  If a
      match exists, the text string is returned and if tag is not null, the number
      associated with the matched regular expression will be stored in tag.
      
      If more than one regular expression has been set with
      vte_terminal_match_add(), then expressions are checked in the order in
      which they were added.
  
      Params:
        event = a #GdkEvent
        tag = a location to store the tag, or null
      Returns: a newly allocated string which matches one of the previously
          set regular expressions, or null if there is no match
  */
  string matchCheckEvent(gid.gdk3.event.Event event, out int tag) nothrow
  {
    char* _cretval;
    _cretval = vte_terminal_match_check_event(cast(VteTerminal*)this._cPtr, event ? cast(GdkEvent*)event._cPtr(No.Dup) : null, cast(int*)&tag);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Removes the regular expression which is associated with the given tag from
      the list of expressions which the terminal will highlight when the user
      moves the mouse cursor over matching text.
  
      Params:
        tag = the tag of the regex to remove
  */
  void matchRemove(int tag) nothrow
  {
    vte_terminal_match_remove(cast(VteTerminal*)this._cPtr, tag);
  }

  /**
      Clears the list of regular expressions the terminal uses to highlight text
      when the user moves the mouse cursor.
  */
  void matchRemoveAll() nothrow
  {
    vte_terminal_match_remove_all(cast(VteTerminal*)this._cPtr);
  }

  /**
      Sets which cursor the terminal will use if the pointer is over the pattern
      specified by tag.  The terminal keeps a reference to cursor.
  
      Params:
        tag = the tag of the regex which should use the specified cursor
        cursor = the #GdkCursor which the terminal should use when the pattern is
            highlighted, or null to use the standard cursor
  
      Deprecated: Use [gid.vte3.terminal.Terminal.matchSetCursorName] instead.
  */
  void matchSetCursor(int tag, gid.gdk3.cursor.Cursor cursor = null) nothrow
  {
    vte_terminal_match_set_cursor(cast(VteTerminal*)this._cPtr, tag, cursor ? cast(GdkCursor*)cursor._cPtr(No.Dup) : null);
  }

  /**
      Sets which cursor the terminal will use if the pointer is over the pattern
      specified by tag.
  
      Params:
        tag = the tag of the regex which should use the specified cursor
        cursorName = the name of the cursor
  */
  void matchSetCursorName(int tag, string cursorName) nothrow
  {
    const(char)* _cursorName = cursorName.toCString!(No.Malloc, No.Nullable);
    vte_terminal_match_set_cursor_name(cast(VteTerminal*)this._cPtr, tag, _cursorName);
  }

  /**
      Sets which cursor the terminal will use if the pointer is over the pattern
      specified by tag.
  
      Params:
        tag = the tag of the regex which should use the specified cursor
        cursorType = a #GdkCursorType
  
      Deprecated: Use [gid.vte3.terminal.Terminal.matchSetCursorName] instead.
  */
  void matchSetCursorType(int tag, gid.gdk3.types.CursorType cursorType) nothrow
  {
    vte_terminal_match_set_cursor_type(cast(VteTerminal*)this._cPtr, tag, cursorType);
  }

  /**
      Sends the contents of the #GDK_SELECTION_CLIPBOARD selection to the
      terminal's child. It's called on paste menu item, or when
      user presses Shift+Insert.
  */
  void pasteClipboard() nothrow
  {
    vte_terminal_paste_clipboard(cast(VteTerminal*)this._cPtr);
  }

  /**
      Sends the contents of the #GDK_SELECTION_PRIMARY selection to the terminal's
      child. The terminal will call also paste the
      #GDK_SELECTION_PRIMARY selection when the user clicks with the the second
      mouse button.
  */
  void pastePrimary() nothrow
  {
    vte_terminal_paste_primary(cast(VteTerminal*)this._cPtr);
  }

  /**
      Sends text to the terminal's child as if retrived from the clipboard,
      this differs from [gid.vte3.terminal.Terminal.feedChild] in that it may process
      text before passing it to the child (e.g. apply bracketed mode)
  
      Params:
        text = a string to paste
  */
  void pasteText(string text) nothrow
  {
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    vte_terminal_paste_text(cast(VteTerminal*)this._cPtr, _text);
  }

  /**
      Creates a new #VtePty, sets the emulation property
      from #VteTerminal:emulation, and sets the size using
      terminal's size.
      
      See vte_pty_new() for more information.
  
      Params:
        flags = flags from #VtePtyFlags
        cancellable = a #GCancellable, or null
      Returns: a new #VtePty
      Throws: [ErrorWrap]
  */
  gid.vte2.pty.Pty ptyNewSync(gid.vte2.types.PtyFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    VtePty* _cretval;
    GError *_err;
    _cretval = vte_terminal_pty_new_sync(cast(VteTerminal*)this._cPtr, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.vte2.pty.Pty)(cast(VtePty*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.Data] termprop as a #GBytes, or null if
        prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
      Returns: the property's value as a #GBytes, or null
  */
  gid.glib2.bytes.Bytes refTermpropDataBytes(string prop) nothrow
  {
    GBytes* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_ref_termprop_data_bytes(cast(VteTerminal*)this._cPtr, _prop);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.refTermpropDataBytes] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
      Returns: the property's value as a #GBytes, or null
  */
  gid.glib2.bytes.Bytes refTermpropDataBytesById(int prop) nothrow
  {
    GBytes* _cretval;
    _cretval = vte_terminal_ref_termprop_data_bytes_by_id(cast(VteTerminal*)this._cPtr, prop);
    auto _retval = _cretval ? new gid.glib2.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.Image] termprop as a #GdkPixbuf, or null if
        prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
      Returns: the property's value as a #GdkPixbuf, or null
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf refTermpropImagePixbuf(string prop) nothrow
  {
    GdkPixbuf* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_ref_termprop_image_pixbuf(cast(VteTerminal*)this._cPtr, _prop);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Like [gid.vte2.terminal.Terminal.refTermpropImagePixbuf] except that it takes the
      termprop by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
      Returns: the property's value as a #GdkPixbuf, or null
  */
  gid.gdkpixbuf2.pixbuf.Pixbuf refTermpropImagePixbufById(int prop) nothrow
  {
    GdkPixbuf* _cretval;
    _cretval = vte_terminal_ref_termprop_image_pixbuf_by_id(cast(VteTerminal*)this._cPtr, prop);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gdkpixbuf2.pixbuf.Pixbuf)(cast(GdkPixbuf*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.Image] termprop as a #cairo_surface_t,
        or null if prop is unset, or prop is not a registered property.
      
      The surface will be a [gid.cairo1.types.SurfaceType.Image] with format
      [gid.cairo1.types.Format.Argb32] or [gid.cairo1.types.Format.Rgb24].
      
      Note that the returned surface is owned by terminal and its contents
      must not be modified.
  
      Params:
        prop = a termprop name
      Returns: the property's value as a #cairo_surface_t, or null
  */
  gid.cairo1.surface.Surface refTermpropImageSurface(string prop) nothrow
  {
    cairo_surface_t* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_ref_termprop_image_surface(cast(VteTerminal*)this._cPtr, _prop);
    auto _retval = _cretval ? new gid.cairo1.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.refTermpropImageSurface] except that it takes the
      termprop by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
      Returns: the property's value as a #cairo_surface_t, or null
  */
  gid.cairo1.surface.Surface refTermpropImageSurfaceById(int prop) nothrow
  {
    cairo_surface_t* _cretval;
    _cretval = vte_terminal_ref_termprop_image_surface_by_id(cast(VteTerminal*)this._cPtr, prop);
    auto _retval = _cretval ? new gid.cairo1.surface.Surface(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the value of a [gid.vte3.types.PropertyType.Uri] termprop as a #GUri, or null if
        prop is unset, or prop is not a registered property.
  
      Params:
        prop = a termprop name
      Returns: the property's value as a #GUri, or null
  */
  gid.glib2.uri.Uri refTermpropUri(string prop) nothrow
  {
    GUri* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_ref_termprop_uri(cast(VteTerminal*)this._cPtr, _prop);
    auto _retval = _cretval ? new gid.glib2.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.refTermpropUri] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
      Returns: the property's value as a #GUri, or null
  */
  gid.glib2.uri.Uri refTermpropUriById(int prop) nothrow
  {
    GUri* _cretval;
    _cretval = vte_terminal_ref_termprop_uri_by_id(cast(VteTerminal*)this._cPtr, prop);
    auto _retval = _cretval ? new gid.glib2.uri.Uri(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the value of prop as a #GVariant, or null if
        prop unset, or prop is not a registered property.
      
      The #GVariantType of the returned #GVariant depends on the termprop type:
      * A [gid.vte3.types.PropertyType.Valueless] termprop returns a `G_VARIANT_TYPE_UNIT` variant.
      * A [gid.vte3.types.PropertyType.Bool] termprop returns a `G_VARIANT_TYPE_BOOLEAN` variant.
      * A [gid.vte3.types.PropertyType.Int] termprop returns a `G_VARIANT_TYPE_INT64` variant.
      * A [gid.vte3.types.PropertyType.Uint] termprop returns a `G_VARIANT_TYPE_UINT64` variant.
      * A [gid.vte3.types.PropertyType.Double] termprop returns a `G_VARIANT_TYPE_DOUBLE` variant.
      * A [gid.vte3.types.PropertyType.Rgb] or [gid.vte3.types.PropertyType.Rgba] termprop returns a "(ddddv)"
        tuple containing the red, green, blue, and alpha (1.0 for [gid.vte3.types.PropertyType.Rgb])
        components of the color and a variant of unspecified contents
      * A [gid.vte3.types.PropertyType.String] termprop returns a `G_VARIANT_TYPE_STRING` variant.
      * A [gid.vte3.types.PropertyType.Data] termprop returns a "ay" variant (which is *not* a bytestring!).
      * A [gid.vte3.types.PropertyType.Uuid] termprop returns a `G_VARIANT_TYPE_STRING` variant
        containing a string representation of the UUID in simple form.
      * A [gid.vte3.types.PropertyType.Uri] termprop returns a `G_VARIANT_TYPE_STRING` variant
        containing a string representation of the URI
      * A [gid.vte3.types.PropertyType.Image] termprop returns null since an image has no
        variant representation.
  
      Params:
        prop = a termprop name
      Returns: a floating #GVariant, or null
  */
  gid.glib2.variant.Variant refTermpropVariant(string prop) nothrow
  {
    GVariant* _cretval;
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    _cretval = vte_terminal_ref_termprop_variant(cast(VteTerminal*)this._cPtr, _prop);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Like [gid.vte3.terminal.Terminal.refTermpropVariant] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
      Returns: a floating #GVariant, or null
  */
  gid.glib2.variant.Variant refTermpropVariantById(int prop) nothrow
  {
    GVariant* _cretval;
    _cretval = vte_terminal_ref_termprop_variant_by_id(cast(VteTerminal*)this._cPtr, prop);
    auto _retval = _cretval ? new gid.glib2.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Resets as much of the terminal's internal state as possible, discarding any
      unprocessed input data, resetting character attributes, cursor state,
      national character set state, status line, terminal modes (insert/delete),
      selection state, and encoding.
  
      Params:
        clearTabstops = whether to reset tabstops
        clearHistory = whether to empty the terminal's scrollback buffer
  */
  void reset(bool clearTabstops, bool clearHistory) nothrow
  {
    vte_terminal_reset(cast(VteTerminal*)this._cPtr, clearTabstops, clearHistory);
  }

  /**
      Resets the termprop prop to its default value.
  
      Params:
        prop = a termprop name
  */
  void resetTermprop(string prop) nothrow
  {
    const(char)* _prop = prop.toCString!(No.Malloc, No.Nullable);
    vte_terminal_reset_termprop(cast(VteTerminal*)this._cPtr, _prop);
  }

  /**
      Like [gid.vte3.terminal.Terminal.resetTermprop] except that it takes the termprop
      by ID. See that function for more information.
  
      Params:
        prop = a termprop ID
  */
  void resetTermpropById(int prop) nothrow
  {
    vte_terminal_reset_termprop_by_id(cast(VteTerminal*)this._cPtr, prop);
  }

  /**
      Searches the next string matching the search regex set with
      [gid.vte3.terminal.Terminal.searchSetRegex].
      Returns: true if a match was found
  */
  bool searchFindNext() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_search_find_next(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      Searches the previous string matching the search regex set with
      [gid.vte3.terminal.Terminal.searchSetRegex].
      Returns: true if a match was found
  */
  bool searchFindPrevious() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_search_find_previous(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /** */
  gid.glib2.regex.Regex searchGetGregex() nothrow
  {
    GRegex* _cretval;
    _cretval = vte_terminal_search_get_gregex(cast(VteTerminal*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.regex.Regex(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  gid.vte2.regex.Regex searchGetRegex() nothrow
  {
    VteRegex* _cretval;
    _cretval = vte_terminal_search_get_regex(cast(VteTerminal*)this._cPtr);
    auto _retval = _cretval ? new gid.vte2.regex.Regex(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /** */
  bool searchGetWrapAround() nothrow
  {
    bool _retval;
    _retval = cast(bool)vte_terminal_search_get_wrap_around(cast(VteTerminal*)this._cPtr);
    return _retval;
  }

  /**
      This function does nothing since version 0.60.
  
      Params:
        gregex = a #GRegex, or null
        gflags = flags from #GRegexMatchFlags
  
      Deprecated: use [gid.vte3.terminal.Terminal.searchSetRegex] instead.
  */
  void searchSetGregex(gid.glib2.regex.Regex gregex, gid.glib2.types.RegexMatchFlags gflags) nothrow
  {
    vte_terminal_search_set_gregex(cast(VteTerminal*)this._cPtr, gregex ? cast(GRegex*)gregex._cPtr(No.Dup) : null, gflags);
  }

  /**
      Sets the regex to search for. Unsets the search regex when passed null.
      
      Note that regex should have been created using the
      <literal>PCRE2_MULTILINE</literal> flag.
  
      Params:
        regex = a #VteRegex, or null
        flags = PCRE2 match flags, or 0
  */
  void searchSetRegex(gid.vte2.regex.Regex regex, uint flags) nothrow
  {
    vte_terminal_search_set_regex(cast(VteTerminal*)this._cPtr, regex ? cast(VteRegex*)regex._cPtr(No.Dup) : null, flags);
  }

  /**
      Sets whether search should wrap around to the beginning of the
      terminal content when reaching its end.
  
      Params:
        wrapAround = whether search should wrap
  */
  void searchSetWrapAround(bool wrapAround) nothrow
  {
    vte_terminal_search_set_wrap_around(cast(VteTerminal*)this._cPtr, wrapAround);
  }

  /**
      Selects all text within the terminal (not including the scrollback buffer).
  */
  void selectAll() nothrow
  {
    vte_terminal_select_all(cast(VteTerminal*)this._cPtr);
  }

  /**
      Controls whether or not the terminal will attempt to draw bold text,
      by using a bold font variant.
  
      Params:
        allowBold = true if the terminal should attempt to draw bold text
  
      Deprecated: There's probably no reason for this feature to exist.
  */
  void setAllowBold(bool allowBold) nothrow
  {
    vte_terminal_set_allow_bold(cast(VteTerminal*)this._cPtr, allowBold);
  }

  /**
      Controls whether or not hyperlinks (OSC 8 escape sequence) are allowed.
  
      Params:
        allowHyperlink = true if the terminal should allow hyperlinks
  */
  void setAllowHyperlink(bool allowHyperlink) nothrow
  {
    vte_terminal_set_allow_hyperlink(cast(VteTerminal*)this._cPtr, allowHyperlink);
  }

  /**
      Controls whether or not the terminal will beep when the child outputs the
      "bl" sequence.
  
      Params:
        isAudible = true if the terminal should beep
  */
  void setAudibleBell(bool isAudible) nothrow
  {
    vte_terminal_set_audible_bell(cast(VteTerminal*)this._cPtr, isAudible);
  }

  /**
      Modifies the terminal's backspace key binding, which controls what
      string or control sequence the terminal sends to its child when the user
      presses the backspace key.
  
      Params:
        binding = a #VteEraseBinding for the backspace key
  */
  void setBackspaceBinding(gid.vte2.types.EraseBinding binding) nothrow
  {
    vte_terminal_set_backspace_binding(cast(VteTerminal*)this._cPtr, binding);
  }

  /**
      Sets whether the SGR 1 attribute also switches to the bright counterpart
      of the first 8 palette colors, in addition to making them bold (legacy behavior)
      or if SGR 1 only enables bold and leaves the color intact.
  
      Params:
        boldIsBright = true if bold should also enable bright
  */
  void setBoldIsBright(bool boldIsBright) nothrow
  {
    vte_terminal_set_bold_is_bright(cast(VteTerminal*)this._cPtr, boldIsBright);
  }

  /**
      Sets the terminal's cell height scale to scale.
      
      This can be used to increase the line spacing. (The font's height is not affected.)
      Valid values go from 1.0 (default) to 2.0 ("double spacing").
  
      Params:
        scale = the cell height scale
  */
  void setCellHeightScale(double scale) nothrow
  {
    vte_terminal_set_cell_height_scale(cast(VteTerminal*)this._cPtr, scale);
  }

  /**
      Sets the terminal's cell width scale to scale.
      
      This can be used to increase the letter spacing. (The font's width is not affected.)
      Valid values go from 1.0 (default) to 2.0.
  
      Params:
        scale = the cell width scale
  */
  void setCellWidthScale(double scale) nothrow
  {
    vte_terminal_set_cell_width_scale(cast(VteTerminal*)this._cPtr, scale);
  }

  /**
      This setting controls whether ambiguous-width characters are narrow or wide.
      (Note that when using a non-UTF-8 encoding set via [gid.vte3.terminal.Terminal.setEncoding],
      the width of ambiguous-width characters is fixed and determined by the encoding
      itself.)
  
      Params:
        width = either 1 (narrow) or 2 (wide)
  */
  void setCjkAmbiguousWidth(int width) nothrow
  {
    vte_terminal_set_cjk_ambiguous_width(cast(VteTerminal*)this._cPtr, width);
  }

  /**
      Sets whether to paint the background with the background colour.
      The default is true.
      
      This function is rarely useful. One use for it is to add a background
      image to the terminal.
  
      Params:
        setting = whether to clear the background
  */
  void setClearBackground(bool setting) nothrow
  {
    vte_terminal_set_clear_background(cast(VteTerminal*)this._cPtr, setting);
  }

  /**
      Sets the background color for text which does not have a specific background
      color assigned.  Only has effect when no background image is set and when
      the terminal is not transparent.
  
      Params:
        background = the new background color
  */
  void setColorBackground(gid.gdk3.rgba.RGBA background) nothrow
  {
    vte_terminal_set_color_background(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)&background);
  }

  /**
      Sets the color used to draw bold text in the default foreground color.
      If bold is null then the default color is used.
  
      Params:
        bold = the new bold color or null
  */
  void setColorBold(gid.gdk3.rgba.RGBA* bold = null) nothrow
  {
    vte_terminal_set_color_bold(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)bold);
  }

  /**
      Sets the background color for text which is under the cursor.  If null, text
      under the cursor will be drawn with foreground and background colors
      reversed.
  
      Params:
        cursorBackground = the new color to use for the text cursor, or null
  */
  void setColorCursor(gid.gdk3.rgba.RGBA* cursorBackground = null) nothrow
  {
    vte_terminal_set_color_cursor(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)cursorBackground);
  }

  /**
      Sets the foreground color for text which is under the cursor.  If null, text
      under the cursor will be drawn with foreground and background colors
      reversed.
  
      Params:
        cursorForeground = the new color to use for the text cursor, or null
  */
  void setColorCursorForeground(gid.gdk3.rgba.RGBA* cursorForeground = null) nothrow
  {
    vte_terminal_set_color_cursor_foreground(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)cursorForeground);
  }

  /**
      Sets the foreground color used to draw normal text.
  
      Params:
        foreground = the new foreground color
  */
  void setColorForeground(gid.gdk3.rgba.RGBA foreground) nothrow
  {
    vte_terminal_set_color_foreground(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)&foreground);
  }

  /**
      Sets the background color for text which is highlighted.  If null,
      it is unset.  If neither highlight background nor highlight foreground are set,
      highlighted text (which is usually highlighted because it is selected) will
      be drawn with foreground and background colors reversed.
  
      Params:
        highlightBackground = the new color to use for highlighted text, or null
  */
  void setColorHighlight(gid.gdk3.rgba.RGBA* highlightBackground = null) nothrow
  {
    vte_terminal_set_color_highlight(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)highlightBackground);
  }

  /**
      Sets the foreground color for text which is highlighted.  If null,
      it is unset.  If neither highlight background nor highlight foreground are set,
      highlighted text (which is usually highlighted because it is selected) will
      be drawn with foreground and background colors reversed.
  
      Params:
        highlightForeground = the new color to use for highlighted text, or null
  */
  void setColorHighlightForeground(gid.gdk3.rgba.RGBA* highlightForeground = null) nothrow
  {
    vte_terminal_set_color_highlight_foreground(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)highlightForeground);
  }

  /**
      palette specifies the new values for the 256 palette colors: 8 standard colors,
      their 8 bright counterparts, 6x6x6 color cube, and 24 grayscale colors.
      Omitted entries will default to a hardcoded value.
      
      palette_size must be 0, 8, 16, 232 or 256.
      
      If foreground is null and palette_size is greater than 0, the new foreground
      color is taken from palette[7].  If background is null and palette_size is
      greater than 0, the new background color is taken from palette[0].
  
      Params:
        foreground = the new foreground color, or null
        background = the new background color, or null
        palette = the color palette
  */
  void setColors(gid.gdk3.rgba.RGBA* foreground = null, gid.gdk3.rgba.RGBA* background = null, gid.gdk3.rgba.RGBA[] palette = null) nothrow
  {
    size_t _paletteSize;
    if (palette)
      _paletteSize = cast(size_t)palette.length;

    auto _palette = cast(GdkRGBA*)palette.ptr;
    vte_terminal_set_colors(cast(VteTerminal*)this._cPtr, cast(const(GdkRGBA)*)foreground, cast(const(GdkRGBA)*)background, _palette, _paletteSize);
  }

  /**
      Sets menu as the context menu in terminal.
      Use null to unset the current menu.
      
      Note that a menu model set with [gid.vte3.terminal.Terminal.setContextMenuModel]
      takes precedence over a menu set using this function.
  
      Params:
        menu = a menu
  */
  void setContextMenu(gid.gtk3.widget.Widget menu = null) nothrow
  {
    vte_terminal_set_context_menu(cast(VteTerminal*)this._cPtr, menu ? cast(GtkWidget*)menu._cPtr(No.Dup) : null);
  }

  /**
      Sets model as the context menu model in terminal.
      Use null to unset the current menu model.
  
      Params:
        model = a #GMenuModel
  */
  void setContextMenuModel(gid.gio2.menu_model.MenuModel model = null) nothrow
  {
    vte_terminal_set_context_menu_model(cast(VteTerminal*)this._cPtr, model ? cast(GMenuModel*)model._cPtr(No.Dup) : null);
  }

  /**
      Sets whether or not the cursor will blink. Using [gid.vte3.types.CursorBlinkMode.System]
      will use the #GtkSettings::gtk-cursor-blink setting.
  
      Params:
        mode = the #VteCursorBlinkMode to use
  */
  void setCursorBlinkMode(gid.vte2.types.CursorBlinkMode mode) nothrow
  {
    vte_terminal_set_cursor_blink_mode(cast(VteTerminal*)this._cPtr, mode);
  }

  /**
      Sets the shape of the cursor drawn.
  
      Params:
        shape = the #VteCursorShape to use
  */
  void setCursorShape(gid.vte2.types.CursorShape shape) nothrow
  {
    vte_terminal_set_cursor_shape(cast(VteTerminal*)this._cPtr, shape);
  }

  /**
      Reset the terminal palette to reasonable compiled-in default color.
  */
  void setDefaultColors() nothrow
  {
    vte_terminal_set_default_colors(cast(VteTerminal*)this._cPtr);
  }

  /**
      Modifies the terminal's delete key binding, which controls what
      string or control sequence the terminal sends to its child when the user
      presses the delete key.
  
      Params:
        binding = a #VteEraseBinding for the delete key
  */
  void setDeleteBinding(gid.vte2.types.EraseBinding binding) nothrow
  {
    vte_terminal_set_delete_binding(cast(VteTerminal*)this._cPtr, binding);
  }

  /**
      Controls whether or not the terminal will communicate with a11y backends.
  
      Params:
        enableA11y = true to enable a11y support
  */
  void setEnableA11y(bool enableA11y) nothrow
  {
    vte_terminal_set_enable_a11y(cast(VteTerminal*)this._cPtr, enableA11y);
  }

  /**
      Controls whether or not the terminal will perform bidirectional text rendering.
  
      Params:
        enableBidi = true to enable BiDi support
  */
  void setEnableBidi(bool enableBidi) nothrow
  {
    vte_terminal_set_enable_bidi(cast(VteTerminal*)this._cPtr, enableBidi);
  }

  /**
      Controls whether the terminal uses scroll events to scroll the history
      if the event was not otherwise consumed by it.
      
      This function is rarely useful, except when the terminal is added to a
      #GtkScrolledWindow, to perform kinetic scrolling (while vte itself does
      not, yet, implement kinetic scrolling by itself).
  
      Params:
        enable = whether to enable fallback scrolling
  */
  void setEnableFallbackScrolling(bool enable) nothrow
  {
    vte_terminal_set_enable_fallback_scrolling(cast(VteTerminal*)this._cPtr, enable);
  }

  /**
      Sets whether legacy OSC 777 sequences are translated to
      their corresponding termprops.
  
      Params:
        enable = whether to enable legacy OSC 777
  */
  void setEnableLegacyOsc777(bool enable) nothrow
  {
    vte_terminal_set_enable_legacy_osc777(cast(VteTerminal*)this._cPtr, enable);
  }

  /**
      Controls whether or not the terminal will shape Arabic text.
  
      Params:
        enableShaping = true to enable Arabic shaping
  */
  void setEnableShaping(bool enableShaping) nothrow
  {
    vte_terminal_set_enable_shaping(cast(VteTerminal*)this._cPtr, enableShaping);
  }

  /**
      Set whether to enable SIXEL images.
  
      Params:
        enabled = whether to enable SIXEL images
  */
  void setEnableSixel(bool enabled) nothrow
  {
    vte_terminal_set_enable_sixel(cast(VteTerminal*)this._cPtr, enabled);
  }

  /**
      Changes the encoding the terminal will expect data from the child to
      be encoded with.  For certain terminal types, applications executing in the
      terminal can change the encoding. If codeset is null, it uses "UTF-8".
      
      Note: Support for non-UTF-8 is deprecated and may get removed altogether.
      Instead of this function, you should use a wrapper like luit(1) when
      spawning the child process.
  
      Params:
        codeset = target charset, or null to use UTF-8
      Returns: true if the encoding could be changed to the specified one,
         or false with error set to [gid.glib2.types.ConvertError.NoConversion].
      Throws: [ErrorWrap]
  
      Deprecated: Support for non-UTF-8 is deprecated.
  */
  bool setEncoding(string codeset = null)
  {
    bool _retval;
    const(char)* _codeset = codeset.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _retval = cast(bool)vte_terminal_set_encoding(cast(VteTerminal*)this._cPtr, _codeset, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets the font used for rendering all text displayed by the terminal,
      overriding any fonts set using [gid.gtk3.widget.Widget.modifyFont].  The terminal
      will immediately attempt to load the desired font, retrieve its
      metrics, and attempt to resize itself to keep the same number of rows
      and columns.  The font scale is applied to the specified font.
  
      Params:
        fontDesc = a #PangoFontDescription for the desired font, or null
  */
  void setFont(gid.pango1.font_description.FontDescription fontDesc = null) nothrow
  {
    vte_terminal_set_font(cast(VteTerminal*)this._cPtr, fontDesc ? cast(const(PangoFontDescription)*)fontDesc._cPtr(No.Dup) : null);
  }

  /**
      Sets the terminal's font options to options.
      
      Note that on GTK4, the terminal by default uses font options
      with [gid.cairo1.types.HintMetrics.On] set; to override that, use this
      function to set a #cairo_font_options_t that has
      [gid.cairo1.types.HintMetrics.Off] set.
  
      Params:
        fontOptions = the font options, or null
  */
  override void setFontOptions(gid.cairo1.font_options.FontOptions fontOptions = null) nothrow
  {
    vte_terminal_set_font_options(cast(VteTerminal*)this._cPtr, fontOptions ? cast(const(cairo_font_options_t)*)fontOptions._cPtr(No.Dup) : null);
  }

  /**
      Sets the terminal's font scale to scale.
  
      Params:
        scale = the font scale
  */
  void setFontScale(double scale) nothrow
  {
    vte_terminal_set_font_scale(cast(VteTerminal*)this._cPtr, scale);
  }

  /**
      Sets terminal as window's geometry widget. See
      [gid.gtk3.window.Window.setGeometryHints] for more information.
      
      terminal must be realized (see [gid.gtk4.widget.Widget.getRealized]).
  
      Params:
        window = a #GtkWindow
  */
  void setGeometryHintsForWindow(gid.gtk3.window.Window window) nothrow
  {
    vte_terminal_set_geometry_hints_for_window(cast(VteTerminal*)this._cPtr, window ? cast(GtkWindow*)window._cPtr(No.Dup) : null);
  }

  /**
      Enables or disables user input. When user input is disabled,
      the terminal's child will not receive any key press, or mouse button
      press or motion events sent to it.
  
      Params:
        enabled = whether to enable user input
  */
  void setInputEnabled(bool enabled) nothrow
  {
    vte_terminal_set_input_enabled(cast(VteTerminal*)this._cPtr, enabled);
  }

  /**
      Changes the value of the terminal's mouse autohide setting.  When autohiding
      is enabled, the mouse cursor will be hidden when the user presses a key and
      shown when the user moves the mouse.  This setting can be read using
      [gid.vte3.terminal.Terminal.getMouseAutohide].
  
      Params:
        setting = whether the mouse pointer should autohide
  */
  void setMouseAutohide(bool setting) nothrow
  {
    vte_terminal_set_mouse_autohide(cast(VteTerminal*)this._cPtr, setting);
  }

  /**
      Sets pty as the PTY to use in terminal.
      Use null to unset the PTY.
  
      Params:
        pty = a #VtePty, or null
  */
  void setPty(gid.vte2.pty.Pty pty = null) nothrow
  {
    vte_terminal_set_pty(cast(VteTerminal*)this._cPtr, pty ? cast(VtePty*)pty._cPtr(No.Dup) : null);
  }

  /**
      Controls whether or not the terminal will rewrap its contents, including
      the scrollback history, whenever the terminal's width changes.
  
      Params:
        rewrap = true if the terminal should rewrap on resize
  */
  void setRewrapOnResize(bool rewrap) nothrow
  {
    vte_terminal_set_rewrap_on_resize(cast(VteTerminal*)this._cPtr, rewrap);
  }

  /**
      Controls whether or not the terminal will forcibly scroll to the bottom of
      the viewable history when text is inserted, e.g. by a paste.
  
      Params:
        scroll = whether the terminal should scroll on insert
  */
  void setScrollOnInsert(bool scroll) nothrow
  {
    vte_terminal_set_scroll_on_insert(cast(VteTerminal*)this._cPtr, scroll);
  }

  /**
      Controls whether or not the terminal will forcibly scroll to the bottom of
      the viewable history when the user presses a key.  Modifier keys do not
      trigger this behavior.
  
      Params:
        scroll = whether the terminal should scroll on keystrokes
  */
  void setScrollOnKeystroke(bool scroll) nothrow
  {
    vte_terminal_set_scroll_on_keystroke(cast(VteTerminal*)this._cPtr, scroll);
  }

  /**
      Controls whether or not the terminal will forcibly scroll to the bottom of
      the viewable history when the new data is received from the child.
  
      Params:
        scroll = whether the terminal should scroll on output
  */
  void setScrollOnOutput(bool scroll) nothrow
  {
    vte_terminal_set_scroll_on_output(cast(VteTerminal*)this._cPtr, scroll);
  }

  /**
      Controls whether the terminal's scroll unit is lines or pixels.
      
      This function is rarely useful, except when the terminal is added to a
      #GtkScrolledWindow.
  
      Params:
        enable = whether to use pixels as scroll unit
  */
  void setScrollUnitIsPixels(bool enable) nothrow
  {
    vte_terminal_set_scroll_unit_is_pixels(cast(VteTerminal*)this._cPtr, enable);
  }

  /**
      Sets the length of the scrollback buffer used by the terminal.  The size of
      the scrollback buffer will be set to the larger of this value and the number
      of visible rows the widget can display, so 0 can safely be used to disable
      scrollback.
      
      A negative value means "infinite scrollback".
      
      Using a large scrollback buffer (roughly 1M+ lines) may lead to performance
      degradation or exhaustion of system resources, and is therefore not recommended.
      
      Note that this setting only affects the normal screen buffer.
      No scrollback is allowed on the alternate screen buffer.
  
      Params:
        lines = the length of the history buffer
  */
  void setScrollbackLines(glong lines) nothrow
  {
    vte_terminal_set_scrollback_lines(cast(VteTerminal*)this._cPtr, lines);
  }

  /**
      Attempts to change the terminal's size in terms of rows and columns.  If
      the attempt succeeds, the widget will resize itself to the proper size.
  
      Params:
        columns = the desired number of columns
        rows = the desired number of rows
  */
  void setSize(glong columns, glong rows) nothrow
  {
    vte_terminal_set_size(cast(VteTerminal*)this._cPtr, columns, rows);
  }

  /**
      Suppress emissions of signals and property notifications
      that are deprecated.
  */
  void setSuppressLegacySignals() nothrow
  {
    vte_terminal_set_suppress_legacy_signals(cast(VteTerminal*)this._cPtr);
  }

  /**
      Controls whether or not the terminal will allow blinking text.
  
      Params:
        textBlinkMode = the #VteTextBlinkMode to use
  */
  void setTextBlinkMode(gid.vte2.types.TextBlinkMode textBlinkMode) nothrow
  {
    vte_terminal_set_text_blink_mode(cast(VteTerminal*)this._cPtr, textBlinkMode);
  }

  /**
      With this function you can provide a set of characters which will
      be considered parts of a word when doing word-wise selection, in
      addition to the default which only considers alphanumeric characters
      part of a word.
      
      The characters in exceptions must be non-alphanumeric, each character
      must occur only once, and if exceptions contains the character
      U+002D HYPHEN-MINUS, it must be at the start of the string.
      
      Use null to reset the set of exception characters to the default.
  
      Params:
        exceptions = a string of ASCII punctuation characters, or null
  */
  void setWordCharExceptions(string exceptions) nothrow
  {
    const(char)* _exceptions = exceptions.toCString!(No.Malloc, No.Nullable);
    vte_terminal_set_word_char_exceptions(cast(VteTerminal*)this._cPtr, _exceptions);
  }

  /**
      Sets the horizontal alignment of terminal within its allocation.
      
      Note: `VTE_ALIGN_START_FILL` is not supported, and will be treated
        like [gid.vte3.types.Align.Start].
  
      Params:
        align_ = alignment value from #VteAlign
  */
  void setXalign(gid.vte2.types.Align align_) nothrow
  {
    vte_terminal_set_xalign(cast(VteTerminal*)this._cPtr, align_);
  }

  /**
      Sets the horizontal fillment of terminal within its allocation.
      
      Note: `VTE_FILL_START_FILL` is not supported, and will be treated
        like `VTE_FILL_START`.
  
      Params:
        fill = fillment value from #VteFill
  */
  void setXfill(bool fill) nothrow
  {
    vte_terminal_set_xfill(cast(VteTerminal*)this._cPtr, fill);
  }

  /**
      Sets the vertical alignment of terminal within its allocation.
  
      Params:
        align_ = alignment value from #VteAlign
  */
  void setYalign(gid.vte2.types.Align align_) nothrow
  {
    vte_terminal_set_yalign(cast(VteTerminal*)this._cPtr, align_);
  }

  /**
      Sets the vertical fillment of terminal within its allocation.
      Note that yfill is only supported with yalign set to
      [gid.vte3.types.Align.Start], and is ignored for all other yalign values.
  
      Params:
        fill = fillment value from #VteFill
  */
  void setYfill(bool fill) nothrow
  {
    vte_terminal_set_yfill(cast(VteTerminal*)this._cPtr, fill);
  }

  /**
      A convenience function that wraps creating the #VtePty and spawning
      the child process on it. Like [gid.vte3.terminal.Terminal.spawnWithFdsAsync],
      except that this function does not allow passing file descriptors to
      the child process. See [gid.vte3.terminal.Terminal.spawnWithFdsAsync] for more
      information.
  
      Params:
        ptyFlags = flags from #VtePtyFlags
        workingDirectory = the name of a directory the command should start
            in, or null to use the current working directory
        argv = child's argument vector
        envv = a list of environment
            variables to be added to the environment before starting the process, or null
        spawnFlags = flags from #GSpawnFlags
        childSetup = an extra child setup function to run in the child just before exec(), or null
        timeout = a timeout value in ms, -1 for the default timeout, or G_MAXINT to wait indefinitely
        cancellable = a #GCancellable, or null
        callback = a #VteTerminalSpawnAsyncCallback, or null
  */
  void spawnAsync(gid.vte2.types.PtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, gid.glib2.types.SpawnFlags spawnFlags, gid.glib2.types.SpawnChildSetupFunc childSetup, int timeout, gid.gio2.cancellable.Cancellable cancellable = null, gid.vte2.types.TerminalSpawnAsyncCallback callback = null) nothrow
  {
    extern(C) void _childSetupCallback(void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.glib2.types.SpawnChildSetupFunc*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.SpawnChildSetupFunc");
      }
    }
    auto _childSetupCB = childSetup ? &_childSetupCallback : null;
    extern(C) void _callbackCallback(VteTerminal* terminal, GPid pid, GError* error, void* userData) nothrow
    {
      gidAttachThread();
      ptrThawGC(userData);
      auto _dlg = cast(gid.vte2.types.TerminalSpawnAsyncCallback*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal, No.Take), pid, error ? new gid.glib2.error.ErrorWrap(cast(void*)error, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.types.TerminalSpawnAsyncCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _workingDirectory = workingDirectory.toCString!(No.Malloc, Yes.Nullable);
    auto _argv_arr = new char*[](argv.length + 1);
    auto _argv = cast(char**)_argv_arr.ptr;
    foreach (i, s; argv) _argv[i] = s.toCString!(No.Malloc);
    auto _envv_arr = new char*[](envv.length + 1);
    auto _envv = cast(char**)_envv_arr.ptr;
    foreach (i, s; envv) _envv[i] = s.toCString!(No.Malloc);
    auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
    GDestroyNotify _childSetupDestroyCB = childSetup ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    vte_terminal_spawn_async(cast(VteTerminal*)this._cPtr, ptyFlags, _workingDirectory, _argv, _envv, spawnFlags, _childSetupCB, _childSetup, _childSetupDestroyCB, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Starts the specified command under a newly-allocated controlling
      pseudo-terminal.  The argv and envv lists should be null-terminated.
      The "TERM" environment variable is automatically set to a default value,
      but can be overridden from envv.
      pty_flags controls logging the session to the specified system log files.
      
      Note that [gid.glib2.types.SpawnFlags.DoNotReapChild] will always be added to spawn_flags.
      
      Note also that [gid.glib2.types.SpawnFlags.StdoutToDevNull], [gid.glib2.types.SpawnFlags.StderrToDevNull],
      and [gid.glib2.types.SpawnFlags.ChildInheritsStdin] are not supported in spawn_flags, since
      stdin, stdout and stderr of the child process will always be connected to
      the PTY.
      
      Note that all open file descriptors will be closed in the child. If you want
      to keep some file descriptor open for use in the child process, you need to
      use a child setup function that unsets the FD_CLOEXEC flag on that file
      descriptor.
      
      See vte_pty_new(), [gid.glib2.global.spawnAsync] and [gid.vte3.terminal.Terminal.watchChild] for more information.
      
      Beginning with 0.52, sets PWD to working_directory in order to preserve symlink components.
      The caller should also make sure that symlinks were preserved while constructing the value of working_directory,
      e.g. by using [gid.vte3.terminal.Terminal.getCurrentDirectoryUri], [gid.glib2.global.getCurrentDir] or get_current_dir_name().
  
      Params:
        ptyFlags = flags from #VtePtyFlags
        workingDirectory = the name of a directory the command should start
            in, or null to use the current working directory
        argv = child's argument vector
        envv = a list of environment
            variables to be added to the environment before starting the process, or null
        spawnFlags = flags from #GSpawnFlags
        childSetup = an extra child setup function to run in the child just before exec(), or null
        childPid = a location to store the child PID, or null
        cancellable = a #GCancellable, or null
      Returns: true on success, or false on error with error filled in
      Throws: [ErrorWrap]
  
      Deprecated: Use [gid.vte3.terminal.Terminal.spawnAsync] instead.
  */
  bool spawnSync(gid.vte2.types.PtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, gid.glib2.types.SpawnFlags spawnFlags, gid.glib2.types.SpawnChildSetupFunc childSetup, out gid.glib2.types.Pid childPid, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    extern(C) void _childSetupCallback(void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.glib2.types.SpawnChildSetupFunc*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.SpawnChildSetupFunc");
      }
    }
    auto _childSetupCB = childSetup ? &_childSetupCallback : null;
    bool _retval;
    const(char)* _workingDirectory = workingDirectory.toCString!(No.Malloc, Yes.Nullable);
    auto _argv_arr = new char*[](argv.length + 1);
    auto _argv = cast(char**)_argv_arr.ptr;
    foreach (i, s; argv) _argv[i] = s.toCString!(No.Malloc);
    auto _envv_arr = new char*[](envv.length + 1);
    auto _envv = cast(char**)_envv_arr.ptr;
    foreach (i, s; envv) _envv[i] = s.toCString!(No.Malloc);
    auto _childSetup = childSetup ? cast(void*)&(childSetup) : null;
    GError *_err;
    _retval = cast(bool)vte_terminal_spawn_sync(cast(VteTerminal*)this._cPtr, ptyFlags, _workingDirectory, _argv, _envv, spawnFlags, _childSetupCB, _childSetup, cast(GPid*)&childPid, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      A convenience function that wraps creating the #VtePty and spawning
      the child process on it. See [gid.vte3.pty.Pty.newSync], [gid.vte3.pty.Pty.spawnWithFdsAsync],
      and [gid.vte3.pty.Pty.spawnFinish] for more information.
      
      When the operation is finished successfully, callback will be called
      with the child #GPid, and a null #GError. The child PID will already be
      watched via [gid.vte3.terminal.Terminal.watchChild].
      
      When the operation fails, callback will be called with a -1 #GPid,
      and a non-null #GError containing the error information.
      
      Note that [gid.glib2.types.SpawnFlags.StdoutToDevNull], [gid.glib2.types.SpawnFlags.StderrToDevNull],
      and [gid.glib2.types.SpawnFlags.ChildInheritsStdin] are not supported in spawn_flags, since
      stdin, stdout and stderr of the child process will always be connected to
      the PTY.
      
      If fds is not null, the child process will map the file descriptors from
      fds according to map_fds; n_map_fds must be less or equal to n_fds.
      This function will take ownership of the file descriptors in fds;
      you must not use or close them after this call.
      
      Note that all  open file descriptors apart from those mapped as above
      will be closed in the child. (If you want to keep some other file descriptor
      open for use in the child process, you need to use a child setup function
      that unsets the FD_CLOEXEC flag on that file descriptor manually.)
      
      Beginning with 0.60, and on linux only, and unless [gid.vte3.types.SPAWN_NO_SYSTEMD_SCOPE] is
      passed in spawn_flags, the newly created child process will be moved to its own
      systemd user scope; and if [gid.vte3.types.SPAWN_REQUIRE_SYSTEMD_SCOPE] is passed, and creation
      of the systemd user scope fails, the whole spawn will fail.
      You can override the options used for the systemd user scope by
      providing a systemd override file for 'vte-spawn-.scope' unit. See man:systemd.unit(5)
      for further information.
      
      Note that if terminal has been destroyed before the operation is called,
      callback will be called with a null terminal; you must not do anything
      in the callback besides freeing any resources associated with user_data,
      but taking care not to access the now-destroyed #VteTerminal. Note that
      in this case, if spawning was successful, the child process will be aborted
      automatically.
      
      Beginning with 0.52, sets PWD to working_directory in order to preserve symlink components.
      The caller should also make sure that symlinks were preserved while constructing the value of working_directory,
      e.g. by using [gid.vte3.terminal.Terminal.getCurrentDirectoryUri], [gid.glib2.global.getCurrentDir] or get_current_dir_name().
  
      Params:
        ptyFlags = flags from #VtePtyFlags
        workingDirectory = the name of a directory the command should start
            in, or null to use the current working directory
        argv = child's argument vector
        envv = a list of environment
            variables to be added to the environment before starting the process, or null
        fds = an array of file descriptors, or null
        mapFds = an array of integers, or null
        spawnFlags = flags from #GSpawnFlags
        childSetup = an extra child setup function to run in the child just before exec(), or null
        timeout = a timeout value in ms, -1 for the default timeout, or G_MAXINT to wait indefinitely
        cancellable = a #GCancellable, or null
        callback = a #VteTerminalSpawnAsyncCallback, or null
  */
  void spawnWithFdsAsync(gid.vte2.types.PtyFlags ptyFlags, string workingDirectory, string[] argv, string[] envv, int[] fds, int[] mapFds, gid.glib2.types.SpawnFlags spawnFlags, gid.glib2.types.SpawnChildSetupFunc childSetup, int timeout, gid.gio2.cancellable.Cancellable cancellable = null, gid.vte2.types.TerminalSpawnAsyncCallback callback = null) nothrow
  {
    extern(C) void _childSetupCallback(void* data) nothrow
    {
      gidAttachThread();
      auto _dlg = cast(gid.glib2.types.SpawnChildSetupFunc*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.SpawnChildSetupFunc");
      }
    }
    auto _childSetupCB = childSetup ? &_childSetupCallback : null;
    extern(C) void _callbackCallback(VteTerminal* terminal, GPid pid, GError* error, void* userData) nothrow
    {
      gidAttachThread();
      ptrThawGC(userData);
      auto _dlg = cast(gid.vte2.types.TerminalSpawnAsyncCallback*)userData;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal, No.Take), pid, error ? new gid.glib2.error.ErrorWrap(cast(void*)error, No.Take) : null);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.types.TerminalSpawnAsyncCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _workingDirectory = workingDirectory.toCString!(No.Malloc, Yes.Nullable);
    auto _argv_arr = new char*[](argv.length + 1);
    auto _argv = cast(char**)_argv_arr.ptr;
    foreach (i, s; argv) _argv[i] = s.toCString!(No.Malloc);
    auto _envv_arr = new char*[](envv.length + 1);
    auto _envv = cast(char**)_envv_arr.ptr;
    foreach (i, s; envv) _envv[i] = s.toCString!(No.Malloc);
    int _nFds;
    if (fds)
      _nFds = cast(int)fds.length;

    auto _fds = cast(int*)fds.ptr;
    int _nMapFds;
    if (mapFds)
      _nMapFds = cast(int)mapFds.length;

    auto _mapFds = cast(int*)mapFds.ptr;
    auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
    GDestroyNotify _childSetupDestroyCB = childSetup ? &thawDelegate : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    vte_terminal_spawn_with_fds_async(cast(VteTerminal*)this._cPtr, ptyFlags, _workingDirectory, _argv, _envv, _fds, _nFds, _mapFds, _nMapFds, spawnFlags, _childSetupCB, _childSetup, _childSetupDestroyCB, timeout, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Clears the current selection.
  */
  void unselectAll() nothrow
  {
    vte_terminal_unselect_all(cast(VteTerminal*)this._cPtr);
  }

  /**
      Watches child_pid. When the process exists, the #VteTerminal::child-exited
      signal will be called with the child's exit status.
      
      Prior to calling this function, a #VtePty must have been set in terminal
      using [gid.vte3.terminal.Terminal.setPty].
      When the child exits, the terminal's #VtePty will be set to null.
      
      Note: [gid.glib2.global.childWatchAdd] or [gid.glib2.global.childWatchAddFull] must not have
      been called for child_pid, nor a #GSource for it been created with
      [gid.glib2.global.childWatchSourceNew].
      
      Note: when using the [gid.glib2.global.spawnAsync] family of functions,
      the [gid.glib2.types.SpawnFlags.DoNotReapChild] flag MUST have been passed.
  
      Params:
        childPid = a #GPid
  */
  void watchChild(gid.glib2.types.Pid childPid) nothrow
  {
    vte_terminal_watch_child(cast(VteTerminal*)this._cPtr, childPid);
  }

  /**
      Write contents of the current contents of terminal (including any
      scrollback history) to stream according to flags.
      
      If cancellable is not null, then the operation can be cancelled by triggering
      the cancellable object from another thread. If the operation was cancelled,
      the error [gid.gio2.types.IOErrorEnum.Cancelled] will be returned in error.
      
      This is a synchronous operation and will make the widget (and input
      processing) during the write operation, which may take a long time
      depending on scrollback history and stream availability for writing.
  
      Params:
        stream = a #GOutputStream to write to
        flags = a set of #VteWriteFlags
        cancellable = a #GCancellable object, or null
      Returns: true on success, false if there was an error
      Throws: [ErrorWrap]
  */
  bool writeContentsSync(gid.gio2.output_stream.OutputStream stream, gid.vte2.types.WriteFlags flags, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)vte_terminal_write_contents_sync(cast(VteTerminal*)this._cPtr, stream ? cast(GOutputStream*)stream._cPtr(No.Dup) : null, flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Connect to `Bell` signal.
  
      This signal is emitted when the a child sends a bell request to the
        terminal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectBell(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.bell");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("bell", closure, after);
  }

  /**
      Connect to `CharSizeChanged` signal.
  
      Emitted whenever the cell size changes, e.g. due to a change in
        font, font-scale or cell-width/height-scale.
        
        Note that this signal should rather be called "cell-size-changed".
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint width, uint height, gid.vte2.terminal.Terminal terminal)`
  
          `width` the new character cell width (optional)
  
          `height` the new character cell height (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCharSizeChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.charSizeChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("char-size-changed", closure, after);
  }

  /**
      Connect to `ChildExited` signal.
  
      This signal is emitted when the terminal detects that a child
        watched using [gid.vte3.terminal.Terminal.watchChild] has exited.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int status, gid.vte2.terminal.Terminal terminal)`
  
          `status` the child's exit status (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChildExited(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.childExited");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("child-exited", closure, after);
  }

  /**
      Connect to `Commit` signal.
  
      Emitted whenever the terminal receives input from the user and
        prepares to send it to the child process.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string text, gid.vte2.terminal.Terminal terminal)`
  
          `text` a string of text (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCommit(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      auto size = getVal!(uint)(&_paramVals[2]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getStringWithLength(&_paramVals[1], size);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.commit");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("commit", closure, after);
  }

  /**
      Connect to `ContentsChanged` signal.
  
      Emitted whenever the visible appearance of the terminal has changed.
        Used primarily by #VteTerminalAccessible.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectContentsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.contentsChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("contents-changed", closure, after);
  }

  /**
      Connect to `CopyClipboard` signal.
  
      Emitted whenever [gid.vte3.terminal.Terminal.copyClipboard] is called.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCopyClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.copyClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("copy-clipboard", closure, after);
  }

  /**
      Connect to `CurrentDirectoryUriChanged` signal.
  
      Emitted when the current directory URI is modified.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #VteTerminal:termprop-changed signal
          for the [gid.vte3.types.TERMPROP_CURRENT_DIRECTORY_URI] termprop.
  */
  gulong connectCurrentDirectoryUriChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.currentDirectoryUriChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("current-directory-uri-changed", closure, after);
  }

  /**
      Connect to `CurrentFileUriChanged` signal.
  
      Emitted when the current file URI is modified.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #VteTerminal:termprop-changed signal
          for the [gid.vte3.types.TERMPROP_CURRENT_FILE_URI] termprop.
  */
  gulong connectCurrentFileUriChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.currentFileUriChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("current-file-uri-changed", closure, after);
  }

  /**
      Connect to `CursorMoved` signal.
  
      Emitted whenever the cursor moves to a new character cell.  Used
        primarily by #VteTerminalAccessible.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectCursorMoved(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.cursorMoved");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cursor-moved", closure, after);
  }

  /**
      Connect to `DecreaseFontSize` signal.
  
      Emitted when the user hits the '-' key while holding the Control key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDecreaseFontSize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.decreaseFontSize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("decrease-font-size", closure, after);
  }

  /**
      Connect to `DeiconifyWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectDeiconifyWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.deiconifyWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("deiconify-window", closure, after);
  }

  /**
      Connect to `EncodingChanged` signal.
  
      Emitted whenever the terminal's current encoding has changed.
        
        Note: support for non-UTF-8 is deprecated.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEncodingChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.encodingChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("encoding-changed", closure, after);
  }

  /**
      Connect to `Eof` signal.
  
      Emitted when the terminal receives an end-of-file from a child which
        is running in the terminal.  This signal is frequently (but not
        always) emitted with a #VteTerminal::child-exited signal.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectEof(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.eof");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("eof", closure, after);
  }

  /**
      Connect to `HyperlinkHoverUriChanged` signal.
  
      Emitted when the hovered hyperlink changes.
        
        uri and bbox are owned by VTE, must not be modified, and might
        change after the signal handlers returns.
        
        The signal is not re-emitted when the bounding box changes for the
        same hyperlink. This might change in a future VTE version without notice.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(string object, gid.gdk3.rectangle.Rectangle p0, gid.vte2.terminal.Terminal terminal)`
  
          `object`  (optional)
  
          `p0`  (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectHyperlinkHoverUriChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == gid.gdk3.rectangle.Rectangle)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.hyperlinkHoverUriChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("hyperlink-hover-uri-changed", closure, after);
  }

  /**
      Connect to `IconTitleChanged` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This signal is never emitted.
  */
  gulong connectIconTitleChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.iconTitleChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("icon-title-changed", closure, after);
  }

  /**
      Connect to `IconifyWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectIconifyWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.iconifyWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("iconify-window", closure, after);
  }

  /**
      Connect to `IncreaseFontSize` signal.
  
      Emitted when the user hits the '+' key while holding the Control key.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectIncreaseFontSize(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.increaseFontSize");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("increase-font-size", closure, after);
  }

  /**
      Connect to `LowerWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectLowerWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.lowerWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("lower-window", closure, after);
  }

  /**
      Connect to `MaximizeWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMaximizeWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.maximizeWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("maximize-window", closure, after);
  }

  /**
      Connect to `MoveWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint x, uint y, gid.vte2.terminal.Terminal terminal)`
  
          `x` the terminal's desired location, X coordinate (optional)
  
          `y` the terminal's desired location, Y coordinate (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectMoveWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.moveWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("move-window", closure, after);
  }

  /**
      Connect to `PasteClipboard` signal.
  
      Emitted whenever [gid.vte3.terminal.Terminal.pasteClipboard] is called.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectPasteClipboard(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.pasteClipboard");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("paste-clipboard", closure, after);
  }

  /**
      Connect to `RaiseWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRaiseWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.raiseWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("raise-window", closure, after);
  }

  /**
      Connect to `RefreshWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRefreshWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.refreshWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("refresh-window", closure, after);
  }

  /**
      Connect to `ResizeWindow` signal.
  
      Emitted at the child application's request.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(uint width, uint height, gid.vte2.terminal.Terminal terminal)`
  
          `width` the desired number of columns (optional)
  
          `height` the desired number of rows (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectResizeWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == uint)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] == uint)))
  && (Parameters!T.length < 3 || (ParameterStorageClassTuple!T[2] == ParameterStorageClass.none && is(Parameters!T[2] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 4)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[2]);

      static if (Parameters!T.length > 2)
        _paramTuple[2] = getVal!(Parameters!T[2])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.resizeWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("resize-window", closure, after);
  }

  /**
      Connect to `RestoreWindow` signal.
  
      Never emitted.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectRestoreWindow(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.restoreWindow");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("restore-window", closure, after);
  }

  /**
      Connect to `SelectionChanged` signal.
  
      Emitted whenever the contents of terminal's selection changes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSelectionChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.selectionChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("selection-changed", closure, after);
  }

  /**
      Connect to `SetupContextMenu` signal.
  
      Emitted with non-null context before terminal shows a context menu.
        The handler may set either a menu model using
        [gid.vte3.terminal.Terminal.setContextMenuModel], or a menu using
        [gid.vte3.terminal.Terminal.setContextMenu], which will then be used as context
        menu, or keep a previously set context menu or context menu model,
        but update the menu and/or its #GAction:s visibility and sensitivity.
        If neither a menu model nor a menu are set, a context menu
        will not be shown.
        
        Note that context is only valid during the signal emission; you may
        not retain it to call methods on it afterwards.
        
        Also emitted with null context after the context menu has been dismissed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.event_context.EventContext context, gid.vte2.terminal.Terminal terminal)`
  
          `context` the context (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectSetupContextMenu(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == gid.vte2.event_context.EventContext)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.setupContextMenu");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("setup-context-menu", closure, after);
  }

  /**
      Connect to `TermpropChanged` signal.
  
      The "termprop-changed" signal is emitted when a termprop
        has changed or been reset.
        
        The handler may use the vte_terminal_get_termprop_*()
        functions (and their by-ID variants), to retrieve the value of
        any termprop (not just name); but it must *not* call *any*
        other API on terminal, including API of its parent classes.
        
        This signal supports detailed connections, so e.g. subscribing
        to "termprop-changed::name" only runs the callback when the
        termprop "name" has changed.
  
      Params:
        detail = Signal detail or null (default)
        callback = signal callback delegate or function to connect
  
          `void callback(string name, gid.vte2.terminal.Terminal terminal)`
  
          `name` the name of the changed property (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTermpropChanged(T)(string detail = null, T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == string)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.termpropChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("termprop-changed"~ (detail.length ? "::" ~ detail : ""), closure, after);
  }

  /**
      Connect to `TermpropsChanged` signal.
  
      Emitted when termprops have changed. props is an array containing
        the IDs of the terminal properties that may have changed since
        the last emission of this signal, in an undefined order.
        Note that emission of this signal is delayed from the receipt of the
        OSC sequences, and a termprop may have been changed more than once
        inbetween signal emissions, but only the value set last is retrievable.
        
        The default handler for this signal emits the "termprop-changed"
        signal for each changed property. Returning true from a handler
        running before the default will prevent this.
        
        The handler may use the vte_terminal_get_termprop_*()
        functions (and their by-ID variants), to retrieve the value of
        any termprop, as well as call [gid.vte3.terminal.Terminal.resetTermprop]
        (and its by-ID variant) to reset any termprop, or emit the
        VteTerminal::termprop-changed signal; but it must *not*
        call *any* other API on terminal, including API of its parent classes.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `bool callback(int[] props, gid.vte2.terminal.Terminal terminal)`
  
          `props` an array of termprop IDs (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
          `Returns` true to stop further handlers being invoked for this signal,
              or false to continue signal emission
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectTermpropsChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == bool)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int[])))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;
      bool _retval;
      auto nProps = getVal!(int)(&_paramVals[2]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      static if (Parameters!T.length > 0)
      {
        auto _cArray = getVal!(int*)(&_paramVals[1]);
        int[] _dArray;
        _dArray = cast(int[])_cArray[0 .. nProps];
        _paramTuple[0] = _dArray;
      }

      try
      {
        _retval = _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.termpropsChanged");
      }

      setVal!(bool)(_returnValue, _retval);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("termprops-changed", closure, after);
  }

  /**
      Connect to `TextDeleted` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This signal is never emitted.
  */
  gulong connectTextDeleted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.textDeleted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-deleted", closure, after);
  }

  /**
      Connect to `TextInserted` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This signal is never emitted.
  */
  gulong connectTextInserted(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.textInserted");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-inserted", closure, after);
  }

  /**
      Connect to `TextModified` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This signal is never emitted.
  */
  gulong connectTextModified(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.textModified");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-modified", closure, after);
  }

  /**
      Connect to `TextScrolled` signal.
  
      
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(int delta, gid.vte2.terminal.Terminal terminal)`
  
          `delta`  (optional)
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: This signal is never emitted.
  */
  gulong connectTextScrolled(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] == int)))
  && (Parameters!T.length < 2 || (ParameterStorageClassTuple!T[1] == ParameterStorageClass.none && is(Parameters!T[1] : gid.vte2.terminal.Terminal)))
  && Parameters!T.length < 3)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      gidAttachThread();
      assert(_nParams == 2, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[1]);

      static if (Parameters!T.length > 1)
        _paramTuple[1] = getVal!(Parameters!T[1])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.textScrolled");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("text-scrolled", closure, after);
  }

  /**
      Connect to `WindowTitleChanged` signal.
  
      Emitted when the #VteTerminal:window-title property is modified.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.vte2.terminal.Terminal terminal)`
  
          `terminal` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  
      Deprecated: Use the #VteTerminal:termprop-changed signal
          for the [gid.vte3.types.TERMPROP_XTERM_TITLE] termprop.
  */
  gulong connectWindowTitleChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.vte2.terminal.Terminal)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.windowTitleChanged");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("window-title-changed", closure, after);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Terminal
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.vte2.terminal.Terminal), T.stringof ~ " is not derived from gid.vte2.terminal.Terminal");

    gid.gtk3.widget.Widget._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncBell", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "bell");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCharSizeChanged", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "char_size_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncChildExited", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "child_exited");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCommit", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "commit");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncContentsChanged", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "contents_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCopyClipboard", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "copy_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncCursorMoved", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "cursor_moved");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDecreaseFontSize", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "decrease_font_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncDeiconifyWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "deiconify_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEncodingChanged", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "encoding_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncEof", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "eof");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIconTitleChanged", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "icon_title_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIconifyWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "iconify_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncIncreaseFontSize", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "increase_font_size");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncLowerWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "lower_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMaximizeWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "maximize_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncMoveWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "move_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncPasteClipboard", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "paste_clipboard");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRaiseWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "raise_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRefreshWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "refresh_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncResizeWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "resize_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncRestoreWindow", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "restore_window");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSelectionChanged", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "selection_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncSetupContextMenu", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "setup_context_menu");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTermpropChanged", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "termprop_changed");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTextDeleted", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "text_deleted");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTextInserted", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "text_inserted");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTextModified", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "text_modified");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncTextScrolled", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "text_scrolled");

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncWindowTitleChanged", true)[0]) == gid.vte2.terminal.Terminal))
      _installVfunc(klass, "window_title_changed");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(VteTerminalClass*)klass;

    switch (vfunc)
    {
      case "bell":
      {
        static extern(C) void _vfuncBellTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.bell)
              return (cast(typeof(&_vfuncBellTramp))_klass.bell)(terminal);
            return;
          }

          try
          {
            _obj.vfuncBell();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncBell");
          }
        }

        _klass.bell = cast(typeof(_klass.bell))&_vfuncBellTramp;
        break;
      }
      case "char_size_changed":
      {
        static extern(C) void _vfuncCharSizeChangedTramp(VteTerminal* terminal, uint charWidth, uint charHeight) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.charSizeChanged)
              return (cast(typeof(&_vfuncCharSizeChangedTramp))_klass.charSizeChanged)(terminal, charWidth, charHeight);
            return;
          }

          try
          {
            _obj.vfuncCharSizeChanged(charWidth, charHeight);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncCharSizeChanged");
          }
        }

        _klass.charSizeChanged = cast(typeof(_klass.charSizeChanged))&_vfuncCharSizeChangedTramp;
        break;
      }
      case "child_exited":
      {
        static extern(C) void _vfuncChildExitedTramp(VteTerminal* terminal, int status) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.childExited)
              return (cast(typeof(&_vfuncChildExitedTramp))_klass.childExited)(terminal, status);
            return;
          }

          try
          {
            _obj.vfuncChildExited(status);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncChildExited");
          }
        }

        _klass.childExited = cast(typeof(_klass.childExited))&_vfuncChildExitedTramp;
        break;
      }
      case "commit":
      {
        static extern(C) void _vfuncCommitTramp(VteTerminal* terminal, const(char)* text, uint size) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.commit)
              return (cast(typeof(&_vfuncCommitTramp))_klass.commit)(terminal, text, size);
            return;
          }

          string _text = text.fromCString!(No.Free);

          try
          {
            _obj.vfuncCommit(_text, size);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncCommit");
          }
        }

        _klass.commit = cast(typeof(_klass.commit))&_vfuncCommitTramp;
        break;
      }
      case "contents_changed":
      {
        static extern(C) void _vfuncContentsChangedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.contentsChanged)
              return (cast(typeof(&_vfuncContentsChangedTramp))_klass.contentsChanged)(terminal);
            return;
          }

          try
          {
            _obj.vfuncContentsChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncContentsChanged");
          }
        }

        _klass.contentsChanged = cast(typeof(_klass.contentsChanged))&_vfuncContentsChangedTramp;
        break;
      }
      case "copy_clipboard":
      {
        static extern(C) void _vfuncCopyClipboardTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.copyClipboard)
              return (cast(typeof(&_vfuncCopyClipboardTramp))_klass.copyClipboard)(terminal);
            return;
          }

          try
          {
            _obj.vfuncCopyClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncCopyClipboard");
          }
        }

        _klass.copyClipboard = cast(typeof(_klass.copyClipboard))&_vfuncCopyClipboardTramp;
        break;
      }
      case "cursor_moved":
      {
        static extern(C) void _vfuncCursorMovedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.cursorMoved)
              return (cast(typeof(&_vfuncCursorMovedTramp))_klass.cursorMoved)(terminal);
            return;
          }

          try
          {
            _obj.vfuncCursorMoved();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncCursorMoved");
          }
        }

        _klass.cursorMoved = cast(typeof(_klass.cursorMoved))&_vfuncCursorMovedTramp;
        break;
      }
      case "decrease_font_size":
      {
        static extern(C) void _vfuncDecreaseFontSizeTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.decreaseFontSize)
              return (cast(typeof(&_vfuncDecreaseFontSizeTramp))_klass.decreaseFontSize)(terminal);
            return;
          }

          try
          {
            _obj.vfuncDecreaseFontSize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncDecreaseFontSize");
          }
        }

        _klass.decreaseFontSize = cast(typeof(_klass.decreaseFontSize))&_vfuncDecreaseFontSizeTramp;
        break;
      }
      case "deiconify_window":
      {
        static extern(C) void _vfuncDeiconifyWindowTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.deiconifyWindow)
              return (cast(typeof(&_vfuncDeiconifyWindowTramp))_klass.deiconifyWindow)(terminal);
            return;
          }

          try
          {
            _obj.vfuncDeiconifyWindow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncDeiconifyWindow");
          }
        }

        _klass.deiconifyWindow = cast(typeof(_klass.deiconifyWindow))&_vfuncDeiconifyWindowTramp;
        break;
      }
      case "encoding_changed":
      {
        static extern(C) void _vfuncEncodingChangedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.encodingChanged)
              return (cast(typeof(&_vfuncEncodingChangedTramp))_klass.encodingChanged)(terminal);
            return;
          }

          try
          {
            _obj.vfuncEncodingChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncEncodingChanged");
          }
        }

        _klass.encodingChanged = cast(typeof(_klass.encodingChanged))&_vfuncEncodingChangedTramp;
        break;
      }
      case "eof":
      {
        static extern(C) void _vfuncEofTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.eof)
              return (cast(typeof(&_vfuncEofTramp))_klass.eof)(terminal);
            return;
          }

          try
          {
            _obj.vfuncEof();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncEof");
          }
        }

        _klass.eof = cast(typeof(_klass.eof))&_vfuncEofTramp;
        break;
      }
      case "icon_title_changed":
      {
        static extern(C) void _vfuncIconTitleChangedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.iconTitleChanged)
              return (cast(typeof(&_vfuncIconTitleChangedTramp))_klass.iconTitleChanged)(terminal);
            return;
          }

          try
          {
            _obj.vfuncIconTitleChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncIconTitleChanged");
          }
        }

        _klass.iconTitleChanged = cast(typeof(_klass.iconTitleChanged))&_vfuncIconTitleChangedTramp;
        break;
      }
      case "iconify_window":
      {
        static extern(C) void _vfuncIconifyWindowTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.iconifyWindow)
              return (cast(typeof(&_vfuncIconifyWindowTramp))_klass.iconifyWindow)(terminal);
            return;
          }

          try
          {
            _obj.vfuncIconifyWindow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncIconifyWindow");
          }
        }

        _klass.iconifyWindow = cast(typeof(_klass.iconifyWindow))&_vfuncIconifyWindowTramp;
        break;
      }
      case "increase_font_size":
      {
        static extern(C) void _vfuncIncreaseFontSizeTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.increaseFontSize)
              return (cast(typeof(&_vfuncIncreaseFontSizeTramp))_klass.increaseFontSize)(terminal);
            return;
          }

          try
          {
            _obj.vfuncIncreaseFontSize();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncIncreaseFontSize");
          }
        }

        _klass.increaseFontSize = cast(typeof(_klass.increaseFontSize))&_vfuncIncreaseFontSizeTramp;
        break;
      }
      case "lower_window":
      {
        static extern(C) void _vfuncLowerWindowTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.lowerWindow)
              return (cast(typeof(&_vfuncLowerWindowTramp))_klass.lowerWindow)(terminal);
            return;
          }

          try
          {
            _obj.vfuncLowerWindow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncLowerWindow");
          }
        }

        _klass.lowerWindow = cast(typeof(_klass.lowerWindow))&_vfuncLowerWindowTramp;
        break;
      }
      case "maximize_window":
      {
        static extern(C) void _vfuncMaximizeWindowTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.maximizeWindow)
              return (cast(typeof(&_vfuncMaximizeWindowTramp))_klass.maximizeWindow)(terminal);
            return;
          }

          try
          {
            _obj.vfuncMaximizeWindow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncMaximizeWindow");
          }
        }

        _klass.maximizeWindow = cast(typeof(_klass.maximizeWindow))&_vfuncMaximizeWindowTramp;
        break;
      }
      case "move_window":
      {
        static extern(C) void _vfuncMoveWindowTramp(VteTerminal* terminal, uint x, uint y) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.moveWindow)
              return (cast(typeof(&_vfuncMoveWindowTramp))_klass.moveWindow)(terminal, x, y);
            return;
          }

          try
          {
            _obj.vfuncMoveWindow(x, y);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncMoveWindow");
          }
        }

        _klass.moveWindow = cast(typeof(_klass.moveWindow))&_vfuncMoveWindowTramp;
        break;
      }
      case "paste_clipboard":
      {
        static extern(C) void _vfuncPasteClipboardTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.pasteClipboard)
              return (cast(typeof(&_vfuncPasteClipboardTramp))_klass.pasteClipboard)(terminal);
            return;
          }

          try
          {
            _obj.vfuncPasteClipboard();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncPasteClipboard");
          }
        }

        _klass.pasteClipboard = cast(typeof(_klass.pasteClipboard))&_vfuncPasteClipboardTramp;
        break;
      }
      case "raise_window":
      {
        static extern(C) void _vfuncRaiseWindowTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.raiseWindow)
              return (cast(typeof(&_vfuncRaiseWindowTramp))_klass.raiseWindow)(terminal);
            return;
          }

          try
          {
            _obj.vfuncRaiseWindow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncRaiseWindow");
          }
        }

        _klass.raiseWindow = cast(typeof(_klass.raiseWindow))&_vfuncRaiseWindowTramp;
        break;
      }
      case "refresh_window":
      {
        static extern(C) void _vfuncRefreshWindowTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.refreshWindow)
              return (cast(typeof(&_vfuncRefreshWindowTramp))_klass.refreshWindow)(terminal);
            return;
          }

          try
          {
            _obj.vfuncRefreshWindow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncRefreshWindow");
          }
        }

        _klass.refreshWindow = cast(typeof(_klass.refreshWindow))&_vfuncRefreshWindowTramp;
        break;
      }
      case "resize_window":
      {
        static extern(C) void _vfuncResizeWindowTramp(VteTerminal* terminal, uint width, uint height) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.resizeWindow)
              return (cast(typeof(&_vfuncResizeWindowTramp))_klass.resizeWindow)(terminal, width, height);
            return;
          }

          try
          {
            _obj.vfuncResizeWindow(width, height);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncResizeWindow");
          }
        }

        _klass.resizeWindow = cast(typeof(_klass.resizeWindow))&_vfuncResizeWindowTramp;
        break;
      }
      case "restore_window":
      {
        static extern(C) void _vfuncRestoreWindowTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.restoreWindow)
              return (cast(typeof(&_vfuncRestoreWindowTramp))_klass.restoreWindow)(terminal);
            return;
          }

          try
          {
            _obj.vfuncRestoreWindow();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncRestoreWindow");
          }
        }

        _klass.restoreWindow = cast(typeof(_klass.restoreWindow))&_vfuncRestoreWindowTramp;
        break;
      }
      case "selection_changed":
      {
        static extern(C) void _vfuncSelectionChangedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.selectionChanged)
              return (cast(typeof(&_vfuncSelectionChangedTramp))_klass.selectionChanged)(terminal);
            return;
          }

          try
          {
            _obj.vfuncSelectionChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncSelectionChanged");
          }
        }

        _klass.selectionChanged = cast(typeof(_klass.selectionChanged))&_vfuncSelectionChangedTramp;
        break;
      }
      case "setup_context_menu":
      {
        static extern(C) void _vfuncSetupContextMenuTramp(VteTerminal* terminal, const(VteEventContext)* context) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.setupContextMenu)
              return (cast(typeof(&_vfuncSetupContextMenuTramp))_klass.setupContextMenu)(terminal, context);
            return;
          }

          try
          {
            _obj.vfuncSetupContextMenu(context ? new gid.vte2.event_context.EventContext(cast(void*)context, No.Take) : null);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncSetupContextMenu");
          }
        }

        _klass.setupContextMenu = cast(typeof(_klass.setupContextMenu))&_vfuncSetupContextMenuTramp;
        break;
      }
      case "termprop_changed":
      {
        static extern(C) void _vfuncTermpropChangedTramp(VteTerminal* terminal, const(char)* prop) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.termpropChanged)
              return (cast(typeof(&_vfuncTermpropChangedTramp))_klass.termpropChanged)(terminal, prop);
            return;
          }

          string _prop = prop.fromCString!(No.Free);

          try
          {
            _obj.vfuncTermpropChanged(_prop);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncTermpropChanged");
          }
        }

        _klass.termpropChanged = cast(typeof(_klass.termpropChanged))&_vfuncTermpropChangedTramp;
        break;
      }
      case "text_deleted":
      {
        static extern(C) void _vfuncTextDeletedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.textDeleted)
              return (cast(typeof(&_vfuncTextDeletedTramp))_klass.textDeleted)(terminal);
            return;
          }

          try
          {
            _obj.vfuncTextDeleted();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncTextDeleted");
          }
        }

        _klass.textDeleted = cast(typeof(_klass.textDeleted))&_vfuncTextDeletedTramp;
        break;
      }
      case "text_inserted":
      {
        static extern(C) void _vfuncTextInsertedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.textInserted)
              return (cast(typeof(&_vfuncTextInsertedTramp))_klass.textInserted)(terminal);
            return;
          }

          try
          {
            _obj.vfuncTextInserted();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncTextInserted");
          }
        }

        _klass.textInserted = cast(typeof(_klass.textInserted))&_vfuncTextInsertedTramp;
        break;
      }
      case "text_modified":
      {
        static extern(C) void _vfuncTextModifiedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.textModified)
              return (cast(typeof(&_vfuncTextModifiedTramp))_klass.textModified)(terminal);
            return;
          }

          try
          {
            _obj.vfuncTextModified();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncTextModified");
          }
        }

        _klass.textModified = cast(typeof(_klass.textModified))&_vfuncTextModifiedTramp;
        break;
      }
      case "text_scrolled":
      {
        static extern(C) void _vfuncTextScrolledTramp(VteTerminal* terminal, int delta) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.textScrolled)
              return (cast(typeof(&_vfuncTextScrolledTramp))_klass.textScrolled)(terminal, delta);
            return;
          }

          try
          {
            _obj.vfuncTextScrolled(delta);
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncTextScrolled");
          }
        }

        _klass.textScrolled = cast(typeof(_klass.textScrolled))&_vfuncTextScrolledTramp;
        break;
      }
      case "window_title_changed":
      {
        static extern(C) void _vfuncWindowTitleChangedTramp(VteTerminal* terminal) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(gid.vte2.terminal.Terminal)(cast(void*)terminal);
          if (!_obj)
          {
            auto _klass = cast(VteTerminalClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)terminal);
            if (_klass.windowTitleChanged)
              return (cast(typeof(&_vfuncWindowTitleChangedTramp))_klass.windowTitleChanged)(terminal);
            return;
          }

          try
          {
            _obj.vfuncWindowTitleChanged();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.vte2.terminal.Terminal.vfuncWindowTitleChanged");
          }
        }

        _klass.windowTitleChanged = cast(typeof(_klass.windowTitleChanged))&_vfuncWindowTitleChangedTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.vte2.terminal.Terminal]
class TerminalGidBuilderImpl(T) : gid.gtk3.widget.WidgetGidBuilderImpl!T, gid.gtk3.scrollable.ScrollableGidBuilderImpl!T
{

  mixin ScrollableGidBuilderT!();

  /**
      Set `allowBold` property.
      Params:
        propval = Controls whether or not the terminal will attempt to draw bold text,
          by using a bold font variant.
      Returns: Builder instance for fluent chaining
  
      Deprecated: There's probably no reason for this feature to exist.
  */
  T allowBold(bool propval) nothrow
  {
    return setProperty("allow-bold", propval);
  }

  /**
      Set `allowHyperlink` property.
      Params:
        propval = Controls whether or not hyperlinks (OSC 8 escape sequence) are recognized and displayed.
      Returns: Builder instance for fluent chaining
  */
  T allowHyperlink(bool propval) nothrow
  {
    return setProperty("allow-hyperlink", propval);
  }

  /**
      Set `audibleBell` property.
      Params:
        propval = Controls whether or not the terminal will beep when the child outputs the
          "bl" sequence.
      Returns: Builder instance for fluent chaining
  */
  T audibleBell(bool propval) nothrow
  {
    return setProperty("audible-bell", propval);
  }

  /**
      Set `backspaceBinding` property.
      Params:
        propval = Controls what string or control sequence the terminal sends to its child
          when the user presses the backspace key.
      Returns: Builder instance for fluent chaining
  */
  T backspaceBinding(gid.vte2.types.EraseBinding propval) nothrow
  {
    return setProperty("backspace-binding", propval);
  }

  /**
      Set `boldIsBright` property.
      Params:
        propval = Whether the SGR 1 attribute also switches to the bright counterpart
          of the first 8 palette colors, in addition to making them bold (legacy behavior)
          or if SGR 1 only enables bold and leaves the color intact.
      Returns: Builder instance for fluent chaining
  */
  T boldIsBright(bool propval) nothrow
  {
    return setProperty("bold-is-bright", propval);
  }

  /**
      Set `cellHeightScale` property.
      Params:
        propval = Scale factor for the cell height, to increase line spacing. (The font's height is not affected.)
      Returns: Builder instance for fluent chaining
  */
  T cellHeightScale(double propval) nothrow
  {
    return setProperty("cell-height-scale", propval);
  }

  /**
      Set `cellWidthScale` property.
      Params:
        propval = Scale factor for the cell width, to increase letter spacing. (The font's width is not affected.)
      Returns: Builder instance for fluent chaining
  */
  T cellWidthScale(double propval) nothrow
  {
    return setProperty("cell-width-scale", propval);
  }

  /**
      Set `cjkAmbiguousWidth` property.
      Params:
        propval = This setting controls whether ambiguous-width characters are narrow or wide.
          (Note that when using a non-UTF-8 encoding set via [gid.vte3.terminal.Terminal.setEncoding],
          the width of ambiguous-width characters is fixed and determined by the encoding
          itself.)
          
          This setting only takes effect the next time the terminal is reset, either
          via escape sequence or with [gid.vte3.terminal.Terminal.reset].
      Returns: Builder instance for fluent chaining
  */
  T cjkAmbiguousWidth(int propval) nothrow
  {
    return setProperty("cjk-ambiguous-width", propval);
  }

  /**
      Set `contextMenu` property.
      Params:
        propval = The menu used for context menus. Note that context menu model set with the
          #VteTerminal::context-menu-model property or [gid.vte3.terminal.Terminal.setContextMenuModel]
          takes precedence over this.
      Returns: Builder instance for fluent chaining
  */
  T contextMenu(gid.gtk3.menu.Menu propval) nothrow
  {
    return setProperty("context-menu", propval);
  }

  /**
      Set `contextMenuModel` property.
      Params:
        propval = The menu model used for context menus. If non-null, the context menu is
          generated from this model, and overrides a context menu set with the
          #VteTerminal::context-menu property or [gid.vte3.terminal.Terminal.setContextMenu].
      Returns: Builder instance for fluent chaining
  */
  T contextMenuModel(gid.gio2.menu_model.MenuModel propval) nothrow
  {
    return setProperty("context-menu-model", propval);
  }

  /**
      Set `cursorBlinkMode` property.
      Params:
        propval = Sets whether or not the cursor will blink. Using [gid.vte3.types.CursorBlinkMode.System]
          will use the #GtkSettings:gtk-cursor-blink setting.
      Returns: Builder instance for fluent chaining
  */
  T cursorBlinkMode(gid.vte2.types.CursorBlinkMode propval) nothrow
  {
    return setProperty("cursor-blink-mode", propval);
  }

  /**
      Set `cursorShape` property.
      Params:
        propval = Controls the shape of the cursor.
      Returns: Builder instance for fluent chaining
  */
  T cursorShape(gid.vte2.types.CursorShape propval) nothrow
  {
    return setProperty("cursor-shape", propval);
  }

  /**
      Set `deleteBinding` property.
      Params:
        propval = Controls what string or control sequence the terminal sends to its child
          when the user presses the delete key.
      Returns: Builder instance for fluent chaining
  */
  T deleteBinding(gid.vte2.types.EraseBinding propval) nothrow
  {
    return setProperty("delete-binding", propval);
  }

  /**
      Set `enableA11y` property.
      Params:
        propval = Controls whether or not a11y is enabled for the widget.
      Returns: Builder instance for fluent chaining
  */
  T enableA11y(bool propval) nothrow
  {
    return setProperty("enable-a11y", propval);
  }

  /**
      Set `enableBidi` property.
      Params:
        propval = Controls whether or not the terminal will perform bidirectional text rendering.
      Returns: Builder instance for fluent chaining
  */
  T enableBidi(bool propval) nothrow
  {
    return setProperty("enable-bidi", propval);
  }

  /** */
  T enableFallbackScrolling(bool propval) nothrow
  {
    return setProperty("enable-fallback-scrolling", propval);
  }

  /**
      Set `enableLegacyOsc777` property.
      Params:
        propval = Whether legacy OSC 777 sequences are translated to
          their corresponding termprops.
      Returns: Builder instance for fluent chaining
  */
  T enableLegacyOsc777(bool propval) nothrow
  {
    return setProperty("enable-legacy-osc777", propval);
  }

  /**
      Set `enableShaping` property.
      Params:
        propval = Controls whether or not the terminal will shape Arabic text.
      Returns: Builder instance for fluent chaining
  */
  T enableShaping(bool propval) nothrow
  {
    return setProperty("enable-shaping", propval);
  }

  /**
      Set `enableSixel` property.
      Params:
        propval = Controls whether SIXEL image support is enabled.
      Returns: Builder instance for fluent chaining
  */
  T enableSixel(bool propval) nothrow
  {
    return setProperty("enable-sixel", propval);
  }

  /**
      Set `encoding` property.
      Params:
        propval = Controls the encoding the terminal will expect data from the child to
          be encoded with.  For certain terminal types, applications executing in the
          terminal can change the encoding.  The default is defined by the
          application's locale settings.
      Returns: Builder instance for fluent chaining
  
      Deprecated: Instead of using this, you should use a tool like
          luit(1) when support for non-UTF-8 is required
  */
  T encoding(string propval) nothrow
  {
    return setProperty("encoding", propval);
  }

  /**
      Set `fontDesc` property.
      Params:
        propval = Specifies the font used for rendering all text displayed by the terminal,
          overriding any fonts set using [gid.gtk3.widget.Widget.modifyFont].  The terminal
          will immediately attempt to load the desired font, retrieve its
          metrics, and attempt to resize itself to keep the same number of rows
          and columns.
      Returns: Builder instance for fluent chaining
  */
  T fontDesc(gid.pango1.font_description.FontDescription propval) nothrow
  {
    return setProperty("font-desc", propval);
  }

  /**
      Set `fontOptions` property.
      Params:
        propval = The terminal's font options, or null to use the default font options.
          
          Note that on GTK4, the terminal by default uses font options
          with [gid.cairo1.types.HintMetrics.On] set; to override that, use this
          function to set a #cairo_font_options_t that has
          [gid.cairo1.types.HintMetrics.Off] set.
      Returns: Builder instance for fluent chaining
  */
  T fontOptions(gid.cairo1.font_options.FontOptions propval) nothrow
  {
    return setProperty("font-options", propval);
  }

  /**
      Set `fontScale` property.
      Params:
        propval = The terminal's font scale.
      Returns: Builder instance for fluent chaining
  */
  T fontScale(double propval) nothrow
  {
    return setProperty("font-scale", propval);
  }

  /**
      Set `inputEnabled` property.
      Params:
        propval = Controls whether the terminal allows user input. When user input is disabled,
          key press and mouse button press and motion events are not sent to the
          terminal's child.
      Returns: Builder instance for fluent chaining
  */
  T inputEnabled(bool propval) nothrow
  {
    return setProperty("input-enabled", propval);
  }

  /**
      Set `pointerAutohide` property.
      Params:
        propval = Controls the value of the terminal's mouse autohide setting.  When autohiding
          is enabled, the mouse cursor will be hidden when the user presses a key and
          shown when the user moves the mouse.
      Returns: Builder instance for fluent chaining
  */
  T pointerAutohide(bool propval) nothrow
  {
    return setProperty("pointer-autohide", propval);
  }

  /**
      Set `pty` property.
      Params:
        propval = The PTY object for the terminal.
      Returns: Builder instance for fluent chaining
  */
  T pty(gid.vte2.pty.Pty propval) nothrow
  {
    return setProperty("pty", propval);
  }

  /**
      Set `rewrapOnResize` property.
      Params:
        propval = Controls whether or not the terminal will rewrap its contents, including
          the scrollback buffer, whenever the terminal's width changes.
      Returns: Builder instance for fluent chaining
  */
  T rewrapOnResize(bool propval) nothrow
  {
    return setProperty("rewrap-on-resize", propval);
  }

  /**
      Set `scrollOnInsert` property.
      Params:
        propval = Controls whether or not the terminal will forcibly scroll to the bottom of
          the viewable history when the text is inserted (e.g. by a paste).
      Returns: Builder instance for fluent chaining
  */
  T scrollOnInsert(bool propval) nothrow
  {
    return setProperty("scroll-on-insert", propval);
  }

  /**
      Set `scrollOnKeystroke` property.
      Params:
        propval = Controls whether or not the terminal will forcibly scroll to the bottom of
          the viewable history when the user presses a key.  Modifier keys do not
          trigger this behavior.
      Returns: Builder instance for fluent chaining
  */
  T scrollOnKeystroke(bool propval) nothrow
  {
    return setProperty("scroll-on-keystroke", propval);
  }

  /**
      Set `scrollOnOutput` property.
      Params:
        propval = Controls whether or not the terminal will forcibly scroll to the bottom of
          the viewable history when the new data is received from the child.
      Returns: Builder instance for fluent chaining
  */
  T scrollOnOutput(bool propval) nothrow
  {
    return setProperty("scroll-on-output", propval);
  }

  /**
      Set `scrollUnitIsPixels` property.
      Params:
        propval = Controls whether the terminal's GtkAdjustment values unit is lines
          or pixels. This can be enabled when the terminal is the child of a
          GtkScrolledWindow to fix some bugs with its kinetic scrolling.
      Returns: Builder instance for fluent chaining
  */
  T scrollUnitIsPixels(bool propval) nothrow
  {
    return setProperty("scroll-unit-is-pixels", propval);
  }

  /**
      Set `scrollbackLines` property.
      Params:
        propval = The length of the scrollback buffer used by the terminal.  The size of
          the scrollback buffer will be set to the larger of this value and the number
          of visible rows the widget can display, so 0 can safely be used to disable
          scrollback.  Note that this setting only affects the normal screen buffer.
          For terminal types which have an alternate screen buffer, no scrollback is
          allowed on the alternate screen buffer.
          
          Note that any value greater or equal to `G_MAXINT` is interpreted as unlimited
          scrollback, i.e. like `-1` when passed to [gid.vte3.terminal.Terminal.setScrollbackLines],
          and the value of this property for unlimited scrollback is `G_MAXUINT`.
      Returns: Builder instance for fluent chaining
  */
  T scrollbackLines(uint propval) nothrow
  {
    return setProperty("scrollback-lines", propval);
  }

  /**
      Set `textBlinkMode` property.
      Params:
        propval = Controls whether or not the terminal will allow blinking text.
      Returns: Builder instance for fluent chaining
  */
  T textBlinkMode(gid.vte2.types.TextBlinkMode propval) nothrow
  {
    return setProperty("text-blink-mode", propval);
  }

  /**
      Set `xalign` property.
      Params:
        propval = The horizontal alignment of @terminal within its allocation.
      Returns: Builder instance for fluent chaining
  */
  T xalign(gid.vte2.types.Align propval) nothrow
  {
    return setProperty("xalign", propval);
  }

  /**
      Set `xfill` property.
      Params:
        propval = The horizontal fillment of @terminal within its allocation.
      Returns: Builder instance for fluent chaining
  */
  T xfill(bool propval) nothrow
  {
    return setProperty("xfill", propval);
  }

  /**
      Set `yalign` property.
      Params:
        propval = The vertical alignment of @terminal within its allocation
      Returns: Builder instance for fluent chaining
  */
  T yalign(gid.vte2.types.Align propval) nothrow
  {
    return setProperty("yalign", propval);
  }

  /**
      Set `yfill` property.
      Params:
        propval = The vertical fillment of @terminal within its allocation.
          Note that #VteTerminal:yfill=true is only supported with
          #VteTerminal:yalign=[gid.vte3.types.Align.Start], and is ignored for
          all other yalign values.
      Returns: Builder instance for fluent chaining
  */
  T yfill(bool propval) nothrow
  {
    return setProperty("yfill", propval);
  }
}

/// Fluent builder for [gid.vte2.terminal.Terminal]
final class TerminalGidBuilder : TerminalGidBuilderImpl!TerminalGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Terminal build() nothrow
  {
    return new Terminal(cast(void*)createGObject(Terminal._getGType), Yes.Take);
  }
}
