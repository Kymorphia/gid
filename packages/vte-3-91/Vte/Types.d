module Vte.Types;

import GLib.ErrorG;
import GLib.Types;
import Gid.gid;
import Vte.Terminal;
import Vte.c.functions;
import Vte.c.types;


// Enums
alias Align = VteAlign;
alias CursorBlinkMode = VteCursorBlinkMode;
alias CursorShape = VteCursorShape;
alias EraseBinding = VteEraseBinding;
alias FeatureFlags = VteFeatureFlags;
alias Format = VteFormat;
alias PtyError = VtePtyError;
alias PtyFlags = VtePtyFlags;
alias RegexError = VteRegexError;
alias TextBlinkMode = VteTextBlinkMode;
alias WriteFlags = VteWriteFlags;

// Structs
alias TerminalClassPrivate = VteTerminalClassPrivate*;

// Callbacks
alias SelectionFunc = bool delegate(Terminal terminal, glong column, glong row);
alias TerminalSpawnAsyncCallback = void delegate(Terminal terminal, Pid pid, ErrorG error);

/**
 * The major version number of the VTE library
 * $(LPAREN)e.g. in version 3.1.4 this is 3$(RPAREN).
 */
enum MAJOR_VERSION = 0;


/**
 * The micro version number of the VTE library
 * $(LPAREN)e.g. in version 3.1.4 this is 4$(RPAREN).
 */
enum MICRO_VERSION = 0;


/**
 * The minor version number of the VTE library
 * $(LPAREN)e.g. in version 3.1.4 this is 1$(RPAREN).
 */
enum MINOR_VERSION = 76;


enum REGEX_FLAGS_DEFAULT = 1075314688;


/**
 * Use this as a spawn flag $(LPAREN)together with flags from #GSpawnFlags$(RPAREN) in
 * [Vte.Pty.spawnAsync].
 * Normally, the spawned process inherits the environment from the parent
 * process; when this flag is used, only the environment variables passed
 * to [Vte.Pty.spawnAsync] etc. are passed to the child process.
 */
enum SPAWN_NO_PARENT_ENVV = 33554432;


/**
 * Use this as a spawn flag $(LPAREN)together with flags from #GSpawnFlags$(RPAREN) in
 * [Vte.Pty.spawnAsync].
 * Prevents [Vte.Pty.spawnAsync] etc. from moving the newly created child
 * process to a systemd user scope.
 */
enum SPAWN_NO_SYSTEMD_SCOPE = 67108864;


/**
 * Use this as a spawn flag $(LPAREN)together with flags from #GSpawnFlags$(RPAREN) in
 * [Vte.Pty.spawnAsync].
 * Requires [Vte.Pty.spawnAsync] etc. to move the newly created child
 * process to a systemd user scope; if that fails, the whole spawn fails.
 * This is supported on Linux only.
 */
enum SPAWN_REQUIRE_SYSTEMD_SCOPE = 134217728;


enum TEST_FLAGS_ALL = 18446744073709551615;


enum TEST_FLAGS_NONE = 0;

