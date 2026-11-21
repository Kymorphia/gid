/// D types for vte2 library
module gid.vte2.types;

import gid.core.gid;
import gid.glib2.error;
import gid.glib2.types;
import gid.vte2.c.functions;
import gid.vte2.c.types;
import gid.vte2.terminal;


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
alias SelectionFunc = bool delegate(gid.vte2.terminal.Terminal terminal, glong column, glong row);

/**
    Callback for [gid.vte3.terminal.Terminal.spawnAsync].
    
    On success, pid contains the PID of the spawned process, and error
    is null.
    On failure, pid is -1 and error contains the error information.

    Params:
      terminal = the #VteTerminal
      pid = a #GPid
      error = a #GError, or null
*/
alias TerminalSpawnAsyncCallback = void delegate(gid.vte2.terminal.Terminal terminal, gid.glib2.types.Pid pid, gid.glib2.error.ErrorWrap error);

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
    [gid.vte3.pty.Pty.spawnAsync].
    
    Normally, the spawned process inherits the environment from the parent
    process; when this flag is used, only the environment variables passed
    to [gid.vte3.pty.Pty.spawnAsync] etc. are passed to the child process.
*/
enum SPAWN_NO_PARENT_ENVV = 33554432;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
    [gid.vte3.pty.Pty.spawnAsync].
    
    Prevents [gid.vte3.pty.Pty.spawnAsync] etc. from moving the newly created child
    process to a systemd user scope.
*/
enum SPAWN_NO_SYSTEMD_SCOPE = 67108864;

/**
    Use this as a spawn flag (together with flags from #GSpawnFlags) in
    [gid.vte3.pty.Pty.spawnAsync].
    
    Requires [gid.vte3.pty.Pty.spawnAsync] etc. to move the newly created child
    process to a systemd user scope; if that fails, the whole spawn fails.
    
    This is supported on Linux only.
*/
enum SPAWN_REQUIRE_SYSTEMD_SCOPE = 134217728;

/**
    A [gid.vte3.types.PropertyType.String] termprop that stores the name of the
    container.
*/
enum TERMPROP_CONTAINER_NAME = "vte.container.name";

/**
    A [gid.vte3.types.PropertyType.String] termprop that stores the runtime of the
    container.
*/
enum TERMPROP_CONTAINER_RUNTIME = "vte.container.runtime";

/**
    A [gid.vte3.types.PropertyType.Uint] termprop that stores the user ID of the
    container.
*/
enum TERMPROP_CONTAINER_UID = "vte.container.uid";

/**
    A [gid.vte3.types.PropertyType.Uri] termprop that stores the current directory
    URI as set by OSC 7.
    Use this with [gid.vte3.terminal.Terminal.refTermpropUri] instead of using
    [gid.vte3.terminal.Terminal.getCurrentDirectoryUri].
    
    Note that this termprop is not settable via the termprop OSC.
*/
enum TERMPROP_CURRENT_DIRECTORY_URI = "vte.cwd";

/**
    A [gid.vte3.types.PropertyType.Uri] termprop that stores the current file URI
    as set by OSC 6.
    Use this with [gid.vte3.terminal.Terminal.refTermpropUri] instead of using
    [gid.vte3.terminal.Terminal.getCurrentFileUri].
    
    Note that this termprop is not settable via the termprop OSC.
*/
enum TERMPROP_CURRENT_FILE_URI = "vte.cwf";

/** */
enum TERMPROP_ICON_COLOR = "vte.icon.color";

/**
    A [gid.vte3.types.PropertyType.Image] termprop to specify an image for use
    as a favicon.
    
    Applications should prefer to use this termprop, if set, over
    the [gid.vte3.types.TERMPROP_ICON_COLOR] color.
    
    Note that in this vte version, this termprop is always unset.
*/
enum TERMPROP_ICON_IMAGE = "vte.icon.image";

/**
    The string prefix that any termprop's name must start with to be installed
    by [gid.vte3.global.installTermprop].
*/
enum TERMPROP_NAME_PREFIX = "vte.ext.";

/**
    A [gid.vte3.types.PropertyType.Int] termprop that stores a hint how to interpret
    the [gid.vte3.types.TERMPROP_PROGRESS_VALUE] termprop value. If set, this
    termprop's value will be from the #VteProgressHint enumeration.
    An unset termprop should be treated as if it had value
    [gid.vte3.types.ProgressHint.Active] if the [gid.vte3.types.TERMPROP_PROGRESS_VALUE]
    termprop has a value
    
    Note that this termprop never will have the value
    [gid.vte3.types.ProgressHint.Inactive].
    
    The value of this termprop should be ignored unless the
    [gid.vte3.types.TERMPROP_PROGRESS_VALUE] termprop has a value.
    
    Note that before version 0.82, this termprop could not be set by
    the termprop OSC, but instead only by OSC 9 ; 4 (ConEmu progress).
*/
enum TERMPROP_PROGRESS_HINT = "vte.progress.hint";

/**
    A [gid.vte3.types.PropertyType.Uint] termprop that stores the progress of the running
    command as a value between 0 and 100.
    
    Note that before version 0.82, this termprop could not be set by
    the termprop OSC, but instead only by OSC 9 ; 4 (ConEmu progress).
*/
enum TERMPROP_PROGRESS_VALUE = "vte.progress.value";

/**
    An ephemeral [gid.vte3.types.PropertyType.Uint] termprop that signals that the shell
    has executed the commands entered at the prompt and these commands
    have returned. The termprop value is the exit code.
*/
enum TERMPROP_SHELL_POSTEXEC = "vte.shell.postexec";

/**
    A [gid.vte3.types.PropertyType.Valueless] termprop that signals that the shell
    is going to prompt.
*/
enum TERMPROP_SHELL_PRECMD = "vte.shell.precmd";

/**
    A [gid.vte3.types.PropertyType.Valueless] termprop that signals that the shell
    is preparing to execute the command entered at the prompt.
*/
enum TERMPROP_SHELL_PREEXEC = "vte.shell.preexec";

/**
    A [gid.vte3.types.PropertyType.String] termprop that stores the xterm window title
    as set by OSC 0 and OSC 2.
    Use this with [gid.vte3.terminal.Terminal.getTermpropString] instead of using
    [gid.vte3.terminal.Terminal.getWindowTitle].
    
    Note that this termprop is not settable via the termprop OSC.
*/
enum TERMPROP_XTERM_TITLE = "xterm.title";

/** */
enum TEST_FLAGS_ALL = 18446744073709551615;

/** */
enum TEST_FLAGS_NONE = 0;
