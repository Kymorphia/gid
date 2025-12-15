/// C types for vte3 library
module vte.c.types;

public import gid.basictypes;
public import gdk.c.types;
public import graphene.c.types;
public import gsk.c.types;
public import gtk.c.types;
public import pango.c.types;
public import cairo.c.types;

/**
    An enumeration type that can be used to specify how the terminal
    uses extra allocated space.
*/
enum VteAlign
{
  /**
      align to left/top
  */
  Start = 0,

  /**
      align to centre
  */
  Center = 1,

  /**
      align to right/bottom
  */
  End = 2,
}

/**
    An enumerated type which can be used to indicate the cursor blink mode
    for the terminal.
*/
enum VteCursorBlinkMode
{
  /**
      Follow GTK+ settings for cursor blinking.
  */
  System = 0,

  /**
      Cursor blinks.
  */
  On = 1,

  /**
      Cursor does not blink.
  */
  Off = 2,
}

/**
    An enumerated type which can be used to indicate what should the terminal
    draw at the cursor position.
*/
enum VteCursorShape
{
  /**
      Draw a block cursor.  This is the default.
  */
  Block = 0,

  /**
      Draw a vertical bar on the left side of character.
      This is similar to the default cursor for other GTK+ widgets.
  */
  Ibeam = 1,

  /**
      Draw a horizontal bar below the character.
  */
  Underline = 2,
}

/**
    An enumerated type which can be used to indicate which string the terminal
    should send to an application when the user presses the Delete or Backspace
    keys.
*/
enum VteEraseBinding
{
  /**
      For backspace, attempt to determine the right value from the terminal's IO settings.  For delete, use the control sequence.
  */
  Auto = 0,

  /**
      Send an ASCII backspace character (0x08).
  */
  AsciiBackspace = 1,

  /**
      Send an ASCII delete character (0x7F).
  */
  AsciiDelete = 2,

  /**
      Send the "@@7" control sequence.
  */
  DeleteSequence = 3,

  /**
      Send terminal's "erase" setting.
  */
  Tty = 4,
}

/**
    An enumeration type for features.
*/
enum VteFeatureFlags : uint
{
  /**
      whether VTE was built with bidirectional text support
  */
  FlagBidi = 1,

  /**
      whether VTE was built with ICU support
  */
  FlagIcu = 2,

  /**
      whether VTE was built with systemd support
  */
  FlagSystemd = 4,

  /**
      whether VTE was built with SIXEL support
  */
  FlagSixel = 8,

  /**
      mask of all feature flags
  */
  FlagsMask = -1,
}

/**
    An enumeration type that can be used to specify the format the selection
    should be copied to the clipboard in.
*/
enum VteFormat
{
  /**
      Export as plain text
  */
  Text = 1,

  /**
      Export as HTML formatted text
  */
  Html = 2,
}

/** */
enum VtePtyError
{
  /**
      Obsolete. Deprecated: 0.42
  */
  PtyHelperFailed = 0,

  /**
      failure when using PTY98 to allocate the PTY
  */
  Pty98Failed = 1,
}

/** */
enum VtePtyFlags : uint
{
  /**
      Unused. Deprecated: 0.38
  */
  NoLastlog = 1,

  /**
      Unused. Deprecated: 0.38
  */
  NoUtmp = 2,

  /**
      Unused. Deprecated: 0.38
  */
  NoWtmp = 4,

  /**
      Unused. Deprecated: 0.38
  */
  NoHelper = 8,

  /**
      Unused. Deprecated: 0.38
  */
  NoFallback = 16,

  /**
      Do not start a new session for the child in
        [vte.pty.Pty.childSetup]. See man:setsid(2) for more information. Since: 0.58
  */
  NoSession = 32,

  /**
      Do not set the PTY as the controlling TTY for the child
        in [vte.pty.Pty.childSetup]. See man:tty_ioctl(4) for more information. Since: 0.58
  */
  NoCtty = 64,

  /**
      the default flags
  */
  Default = 0,
}

/**
    An enum type for regex errors. In addition to the values listed above,
    any PCRE2 error values may occur.
*/
enum VteRegexError
{
  /**
      The PCRE2 library was built without
        Unicode support which is required for VTE
  */
  Incompatible = 2147483646,

  /**
      Regexes are not supported because VTE was
        built without PCRE2 support
  */
  NotSupported = 2147483647,
}

/**
    An enumerated type which can be used to indicate whether the terminal allows
    the text contents to be blinked.
*/
enum VteTextBlinkMode
{
  /**
      Do not blink the text.
  */
  Never = 0,

  /**
      Allow blinking text only if the terminal is focused.
  */
  Focused = 1,

  /**
      Allow blinking text only if the terminal is unfocused.
  */
  Unfocused = 2,

  /**
      Allow blinking text. This is the default.
  */
  Always = 3,
}

/**
    A flag type to determine how terminal contents should be written
    to an output stream.
*/
enum VteWriteFlags
{
  /**
      Write contents as UTF-8 text.  This is the default.
  */
  Default = 0,
}

/** */
struct VteCharAttributes
{
  /** */
  long row;

  /** */
  long column;

  /** */
  PangoColor fore;

  /** */
  PangoColor back;

  /** */
  uint underline;

  /** */
  uint strikethrough;

  /** */
  uint columns;
}

/**
    Provides context information for a context menu event.
*/
struct VteEventContext;

/** */
struct VtePty;

/** */
struct VtePtyClass;

/** */
struct VteRegex;

/** */
struct VteTerminal
{
  /** */
  GtkWidget widget;
}

/**
    All of these fields should be considered read-only, except for derived classes.
*/
struct VteTerminalClass
{
  /** */
  GtkWidgetClass parentClass;

  /** */
  extern(C) void function(VteTerminal* terminal) eof;

  /** */
  extern(C) void function(VteTerminal* terminal, int status) childExited;

  /** */
  extern(C) void function(VteTerminal* terminal) encodingChanged;

  /** */
  extern(C) void function(VteTerminal* terminal, uint charWidth, uint charHeight) charSizeChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) windowTitleChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) iconTitleChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) selectionChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) contentsChanged;

  /** */
  extern(C) void function(VteTerminal* terminal) cursorMoved;

  /** */
  extern(C) void function(VteTerminal* terminal, const(char)* text, uint size) commit;

  /** */
  extern(C) void function(VteTerminal* terminal) deiconifyWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) iconifyWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) raiseWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) lowerWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) refreshWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) restoreWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) maximizeWindow;

  /** */
  extern(C) void function(VteTerminal* terminal, uint width, uint height) resizeWindow;

  /** */
  extern(C) void function(VteTerminal* terminal, uint x, uint y) moveWindow;

  /** */
  extern(C) void function(VteTerminal* terminal) increaseFontSize;

  /** */
  extern(C) void function(VteTerminal* terminal) decreaseFontSize;

  /** */
  extern(C) void function(VteTerminal* terminal) copyClipboard;

  /** */
  extern(C) void function(VteTerminal* terminal) pasteClipboard;

  /** */
  extern(C) void function(VteTerminal* terminal) bell;

  /** */
  extern(C) void function(VteTerminal* terminal, const(VteEventContext)* context) setupContextMenu;

  /** */
  void*[15] Padding;

  /** */
  VteTerminalClassPrivate* priv;
}

/** */
struct VteTerminalClassPrivate;

alias extern(C) gboolean function(VteTerminal* terminal, glong column, glong row, void* data) VteSelectionFunc;

alias extern(C) void function(VteTerminal* terminal, GPid pid, GError* error, void* userData) VteTerminalSpawnAsyncCallback;

