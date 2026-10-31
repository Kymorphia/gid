/// D types for vte2 library
module vte.types;

import gid.gid;
import glib.error;
import glib.types;
import vte.c.functions;
import vte.c.types;
import vte.terminal;


// Enums

/** */
alias Align = VteAlign;

/** */
alias CursorBlinkMode = VteCursorBlinkMode;

/** */
alias CursorShape = VteCursorShape;

/** */
alias EraseBinding = VteEraseBinding;

/** */
alias FeatureFlags = VteFeatureFlags;

/** */
alias Format = VteFormat;

/** */
alias ProgressHint = VteProgressHint;

/** */
alias PropertyFlags = VtePropertyFlags;

/** */
alias PropertyId = VtePropertyId;

/** */
alias PropertyType = VtePropertyType;

/** */
alias PtyError = VtePtyError;

/** */
alias PtyFlags = VtePtyFlags;

/** */
alias RegexError = VteRegexError;

/** */
alias TextBlinkMode = VteTextBlinkMode;

/** */
alias UuidFormat = VteUuidFormat;

/** */
alias WriteFlags = VteWriteFlags;

// Callbacks

/**
    Specifies the type of a selection function used to check whether
    a cell has to be selected or not.

    Params:
      terminal = terminal in which the cell is.
      column = column in which the cell is.
      row = row in which the cell is.
    Returns: true if cell has to be selected; false if otherwise.
*/
alias SelectionFunc = bool delegate(vte.terminal.Terminal terminal, glong column, glong row);

/**
    Callback for [vte.terminal.Terminal.spawnAsync].
    
    On success, pid contains the PID of the spawned process, and error
    is null.
    On failure, pid is -1 and error contains the error information.

    Params:
      terminal = the #VteTerminal
      pid = a #GPid
      error = a #GError, or null
*/
alias TerminalSpawnAsyncCallback = void delegate(vte.terminal.Terminal terminal, glib.types.Pid pid, glib.error.ErrorWrap error);

/**
    The major version number of the VTE library
    (e.g. in version 3.1.4 this is 3).
*/
enum MAJOR_VERSION = 0;

/**
    The micro version number of the VTE library
    (e.g. in version 3.1.4 this is 4).
*/
enum MICRO_VERSION = 0;

/**
    The minor version number of the VTE library
    (e.g. in version 3.1.4 this is 1).
*/
enum MINOR_VERSION = 84;

/** */
enum REGEX_FLAGS_DEFAULT = 1075314688;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
    [vte.pty.Pty.spawnAsync].
    
    Normally, the spawned process inherits the environment from the parent
    process; when this flag is used, only the environment variables passed
    to [vte.pty.Pty.spawnAsync] etc. are passed to the child process.
*/
enum SPAWN_NO_PARENT_ENVV = 33554432;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
    [vte.pty.Pty.spawnAsync].
    
    Prevents [vte.pty.Pty.spawnAsync] etc. from moving the newly created child
    process to a systemd user scope.
*/
enum SPAWN_NO_SYSTEMD_SCOPE = 67108864;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
    [vte.pty.Pty.spawnAsync].
    
    Requires [vte.pty.Pty.spawnAsync] etc. to move the newly created child
    process to a systemd user scope; if that fails, the whole spawn fails.
    
    This is supported on Linux only.
*/
enum SPAWN_REQUIRE_SYSTEMD_SCOPE = 134217728;

/**
    A [vte.types.PropertyType.String] termprop that stores the name of the
    container.
*/
enum TERMPROP_CONTAINER_NAME = "vte.container.name";

/**
    A [vte.types.PropertyType.String] termprop that stores the runtime of the
    container.
*/
enum TERMPROP_CONTAINER_RUNTIME = "vte.container.runtime";

/**
    A [vte.types.PropertyType.Uint] termprop that stores the user ID of the
    container.
*/
enum TERMPROP_CONTAINER_UID = "vte.container.uid";

/**
    A [vte.types.PropertyType.Uri] termprop that stores the current directory
    URI as set by OSC 7.
    Use this with [vte.terminal.Terminal.refTermpropUri] instead of using
    [vte.terminal.Terminal.getCurrentDirectoryUri].
    
    Note that this termprop is not settable via the termprop OSC.
*/
enum TERMPROP_CURRENT_DIRECTORY_URI = "vte.cwd";

/**
    A [vte.types.PropertyType.Uri] termprop that stores the current file URI
    as set by OSC 6.
    Use this with [vte.terminal.Terminal.refTermpropUri] instead of using
    [vte.terminal.Terminal.getCurrentFileUri].
    
    Note that this termprop is not settable via the termprop OSC.
*/
enum TERMPROP_CURRENT_FILE_URI = "vte.cwf";

/** */
enum TERMPROP_ICON_COLOR = "vte.icon.color";

/**
    A [vte.types.PropertyType.Image] termprop to specify an image for use
    as a favicon.
    
    Applications should prefer to use this termprop, if set, over
    the [vte.types.TERMPROP_ICON_COLOR] color.
    
    Note that in this vte version, this termprop is always unset.
*/
enum TERMPROP_ICON_IMAGE = "vte.icon.image";

/**
    The string prefix that any termprop's name must start with to be installed
    by [vte.global.installTermprop].
*/
enum TERMPROP_NAME_PREFIX = "vte.ext.";

/**
    A [vte.types.PropertyType.Int] termprop that stores a hint how to interpret
    the [vte.types.TERMPROP_PROGRESS_VALUE] termprop value. If set, this
    termprop's value will be from the #VteProgressHint enumeration.
    An unset termprop should be treated as if it had value
    [vte.types.ProgressHint.Active] if the [vte.types.TERMPROP_PROGRESS_VALUE]
    termprop has a value
    
    Note that this termprop never will have the value
    [vte.types.ProgressHint.Inactive].
    
    The value of this termprop should be ignored unless the
    [vte.types.TERMPROP_PROGRESS_VALUE] termprop has a value.
    
    Note that before version 0.82, this termprop could not be set by
    the termprop OSC, but instead only by OSC 9 ; 4 (ConEmu progress).
*/
enum TERMPROP_PROGRESS_HINT = "vte.progress.hint";

/**
    A [vte.types.PropertyType.Uint] termprop that stores the progress of the running
    command as a value between 0 and 100.
    
    Note that before version 0.82, this termprop could not be set by
    the termprop OSC, but instead only by OSC 9 ; 4 (ConEmu progress).
*/
enum TERMPROP_PROGRESS_VALUE = "vte.progress.value";

/**
    An ephemeral [vte.types.PropertyType.Uint] termprop that signals that the shell
    has executed the commands entered at the prompt and these commands
    have returned. The termprop value is the exit code.
*/
enum TERMPROP_SHELL_POSTEXEC = "vte.shell.postexec";

/**
    A [vte.types.PropertyType.Valueless] termprop that signals that the shell
    is going to prompt.
*/
enum TERMPROP_SHELL_PRECMD = "vte.shell.precmd";

/**
    A [vte.types.PropertyType.Valueless] termprop that signals that the shell
    is preparing to execute the command entered at the prompt.
*/
enum TERMPROP_SHELL_PREEXEC = "vte.shell.preexec";

/**
    A [vte.types.PropertyType.String] termprop that stores the xterm window title
    as set by OSC 0 and OSC 2.
    Use this with [vte.terminal.Terminal.getTermpropString] instead of using
    [vte.terminal.Terminal.getWindowTitle].
    
    Note that this termprop is not settable via the termprop OSC.
*/
enum TERMPROP_XTERM_TITLE = "xterm.title";

/** */
enum TEST_FLAGS_ALL = 18446744073709551615;

/** */
enum TEST_FLAGS_NONE = 0;
