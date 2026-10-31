/// C types for vte2 library
module vte.c.types;

public import gid.basictypes;
public import gdk.c.types;
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

/**
    An enum describing how to interpret progress state, for the
    [vte.types.TERMPROP_PROGRESS_HINT] termprop.
*/
enum VteProgressHint
{
  /**
      no progress current
  */
  Inactive = 0,

  /**
      progress is normal
  */
  Active = 1,

  /**
      progress is aborted by an error
  */
  Error = 2,

  /**
      progress is indeterminate
  */
  Indeterminate = 3,

  /**
      progress is paused
  */
  Paused = 4,
}

/**
    A flags type.
*/
enum VtePropertyFlags : uint
{
  /**
      no flags, default
  */
  None = 0,

  /**
      denotes an ephemeral termprop
  */
  Ephemeral = 1,
}

/**
    An enum containing the IDs of the always-installed termprops.
*/
enum VtePropertyId
{
  /**
      the ID of the [vte.types.TERMPROP_CURRENT_DIRECTORY_URI] termprop
  */
  CurrentDirectoryUri = 0,

  /**
      the ID of the [vte.types.TERMPROP_CURRENT_FILE_URI] termprop
  */
  CurrentFileUri = 1,

  /**
      the ID of the [vte.types.TERMPROP_XTERM_TITLE] termprop
  */
  XtermTitle = 2,

  /**
      the ID of the [vte.types.TERMPROP_CONTAINER_NAME] termprop
  */
  ContainerName = 3,

  /**
      the ID of the [vte.types.TERMPROP_CONTAINER_RUNTIME] termprop
  */
  ContainerRuntime = 4,

  /**
      the ID of the [vte.types.TERMPROP_CONTAINER_UID] termprop
  */
  ContainerUid = 5,

  /**
      the ID of the [vte.types.TERMPROP_SHELL_PRECMD] termprop
  */
  ShellPrecmd = 6,

  /**
      the ID of the [vte.types.TERMPROP_SHELL_PREEXEC] termprop
  */
  ShellPreexec = 7,

  /**
      the ID of the [vte.types.TERMPROP_SHELL_POSTEXEC] termprop
  */
  ShellPostexec = 8,

  /**
      the ID of the [vte.types.TERMPROP_PROGRESS_HINT] termprop. Since: 0.80
  */
  ProgressHint = 9,

  /**
      the ID of the [vte.types.TERMPROP_PROGRESS_VALUE] termprop. Since: 0.80
  */
  ProgressValue = 10,

  /**
      the ID of the [vte.types.TERMPROP_ICON_COLOR] termprop. Since: 0.80
  */
  IconColor = 11,

  /**
      the ID of the [vte.types.TERMPROP_ICON_IMAGE] termprop. Since: 0.80
  */
  IconImage = 12,
}

/**
    An enumeration type describing types of properties.
*/
enum VtePropertyType
{
  /**
      no value, use for signalling
  */
  Valueless = 0,

  /**
      a bool
  */
  Bool = 1,

  /**
      a signed 64-bit integer
  */
  Int = 2,

  /**
      an unsigned 64-bit integer
  */
  Uint = 3,

  /**
      a finite double-precision floating point number
  */
  Double = 4,

  /**
      a color
  */
  Rgb = 5,

  /**
      a color with alpha
  */
  Rgba = 6,

  /**
      a string
  */
  String = 7,

  /**
      binary data
  */
  Data = 8,

  /**
      a UUID
  */
  Uuid = 9,

  /**
      a URI
  */
  Uri = 10,

  /**
      an image. Since: 0.80
  */
  Image = 11,
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

/** */
enum VteUuidFormat : uint
{
  /** */
  Simple = 1,

  /** */
  Braced = 2,

  /** */
  Urn = 4,

  /** */
  Any = 7,
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

  mixin(bitfields!(
  uint, "underline", 1,
  uint, "strikethrough", 1,
  uint, "columns", 4,
  uint, "", 26));

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

  /** */
  void**[1] UnusedPadding;
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
  extern(C) void function(VteTerminal* terminal) textModified;

  /** */
  extern(C) void function(VteTerminal* terminal) textInserted;

  /** */
  extern(C) void function(VteTerminal* terminal) textDeleted;

  /** */
  extern(C) void function(VteTerminal* terminal, int delta) textScrolled;

  /** */
  extern(C) void function(VteTerminal* terminal) copyClipboard;

  /** */
  extern(C) void function(VteTerminal* terminal) pasteClipboard;

  /** */
  extern(C) void function(VteTerminal* terminal) bell;

  /** */
  void*[3] ExtraPadding;

  /** */
  extern(C) void function(VteTerminal* terminal, const(VteEventContext)* context) setupContextMenu;

  /** */
  extern(C) gboolean function(VteTerminal* terminal, const(int)* props, int nProps) termpropsChanged;

  /** */
  extern(C) void function(VteTerminal* terminal, const(char)* prop) termpropChanged;

  /** */
  void*[10] Padding;

  /** */
  VteTerminalClassPrivate* priv;
}

/** */
struct VteTerminalClassPrivate;

/**
    An object representing an UUID.
*/
struct VteUuid;

alias extern(C) gboolean function(VteTerminal* terminal, glong column, glong row, void* data) VteSelectionFunc;

alias extern(C) void function(VteTerminal* terminal, GPid pid, GError* error, void* userData) VteTerminalSpawnAsyncCallback;

