module Vte.Pty;

import GLib.ErrorG;
import GLib.Types;
import GObject.ObjectG;
import Gid.gid;
import Gio.AsyncResult;
import Gio.AsyncResultT;
import Gio.Cancellable;
import Gio.Initable;
import Gio.InitableT;
import Gio.Types;
import Vte.Types;
import Vte.c.functions;
import Vte.c.types;

class Pty : ObjectG, Initable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())vte_pty_get_type != &gidSymbolNotFound ? vte_pty_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin InitableT!();

  /**
   * Creates a new #VtePty for the PTY master fd.
   * No entry will be made in the lastlog, utmp or wtmp system files.
   * Note that the newly created #VtePty will take ownership of fd
   * and close it on finalize.
   * Params:
   *   fd = a file descriptor to the PTY
   *   cancellable = a #GCancellable, or %NULL
   * Returns: a new #VtePty for fd, or %NULL on error with error filled in
   */
  static Pty newForeignSync(int fd, Cancellable cancellable)
  {
    VtePty* _cretval;
    GError *_err;
    _cretval = vte_pty_new_foreign_sync(fd, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Pty(cast(VtePty*)_cretval, Yes.Take);
    return _retval;
  }

  /**
   * Allocates a new pseudo-terminal.
   * You can later use fork$(LPAREN)$(RPAREN) or the [GLib.Global.spawnAsync] family of functions
   * to start a process on the PTY.
   * If using fork$(LPAREN)$(RPAREN), you MUST call [Vte.Pty.childSetup] in the child.
   * If using [GLib.Global.spawnAsync] and friends, you MUST either use
   * [Vte.Pty.childSetup] directly as the child setup function, or call
   * [Vte.Pty.childSetup] from your own child setup function supplied.
   * When using [Vte.Terminal.spawnSync] with a custom child setup
   * function, [Vte.Pty.childSetup] will be called before the supplied
   * function; you must not call it again.
   * Also, you MUST pass the %G_SPAWN_DO_NOT_REAP_CHILD flag.
   * Note also that %G_SPAWN_STDOUT_TO_DEV_NULL, %G_SPAWN_STDERR_TO_DEV_NULL,
   * and %G_SPAWN_CHILD_INHERITS_STDIN are not supported, since stdin, stdout
   * and stderr of the child process will always be connected to the PTY.
   * Note that you should set the PTY's size using [Vte.Pty.setSize] before
   * spawning the child process, so that the child process has the correct
   * size from the start instead of starting with a default size and then
   * shortly afterwards receiving a <literal>SIGWINCH</literal> signal. You
   * should prefer using [Vte.Terminal.ptyNewSync] which does this
   * automatically.
   * Params:
   *   flags = flags from #VtePtyFlags
   *   cancellable = a #GCancellable, or %NULL
   * Returns: a new #VtePty, or %NULL on error with error filled in
   */
  static Pty newSync(PtyFlags flags, Cancellable cancellable)
  {
    VtePty* _cretval;
    GError *_err;
    _cretval = vte_pty_new_sync(flags, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = ObjectG.getDObject!Pty(cast(VtePty*)_cretval, Yes.Take);
    return _retval;
  }

  void childSetup()
  {
    vte_pty_child_setup(cast(VtePty*)cPtr);
  }

  /**
   * Since 0.42 this is a no-op.
   */
  void close()
  {
    vte_pty_close(cast(VtePty*)cPtr);
  }

  int getFd()
  {
    int _retval;
    _retval = vte_pty_get_fd(cast(VtePty*)cPtr);
    return _retval;
  }

  /**
   * Reads the pseudo terminal's window size.
   * If getting the window size failed, error will be set to a #GIOError.
   * Params:
   *   rows = a location to store the number of rows, or %NULL
   *   columns = a location to store the number of columns, or %NULL
   * Returns: %TRUE on success, %FALSE on failure with error filled in
   */
  bool getSize(out int rows, out int columns)
  {
    bool _retval;
    GError *_err;
    _retval = vte_pty_get_size(cast(VtePty*)cPtr, cast(int*)&rows, cast(int*)&columns, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Attempts to resize the pseudo terminal's window size.  If successful, the
   * OS kernel will send <literal>SIGWINCH</literal> to the child process group.
   * If setting the window size failed, error will be set to a #GIOError.
   * Params:
   *   rows = the desired number of rows
   *   columns = the desired number of columns
   * Returns: %TRUE on success, %FALSE on failure with error filled in
   */
  bool setSize(int rows, int columns)
  {
    bool _retval;
    GError *_err;
    _retval = vte_pty_set_size(cast(VtePty*)cPtr, rows, columns, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Tells the kernel whether the terminal is UTF-8 or not, in case it can make
   * use of the info.  Linux 2.6.5 or so defines IUTF8 to make the line
   * discipline do multibyte backspace correctly.
   * Params:
   *   utf8 = whether or not the pty is in UTF-8 mode
   * Returns: %TRUE on success, %FALSE on failure with error filled in
   */
  bool setUtf8(bool utf8)
  {
    bool _retval;
    GError *_err;
    _retval = vte_pty_set_utf8(cast(VtePty*)cPtr, utf8, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Like [Vte.Pty.spawnWithFdsAsync], except that this function does not
   * allow passing file descriptors to the child process. See [Vte.Pty.spawnWithFdsAsync]
   * for more information.
   * Params:
   *   workingDirectory = the name of a directory the command should start
   *     in, or %NULL to use the current working directory
   *   argv = child's argument vector
   *   envv = a list of environment
   *     variables to be added to the environment before starting the process, or %NULL
   *   spawnFlags = flags from #GSpawnFlags
   *   childSetup = an extra child setup function to run in the child just before exec$(LPAREN)$(RPAREN), or %NULL
   *   timeout = a timeout value in ms, -1 for the default timeout, or G_MAXINT to wait indefinitely
   *   cancellable = a #GCancellable, or %NULL
   *   callback = a #GAsyncReadyCallback, or %NULL
   */
  void spawnAsync(string workingDirectory, string[] argv, string[] envv, SpawnFlags spawnFlags, SpawnChildSetupFunc childSetup, int timeout, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _childSetupCallback(void* data)
    {
      auto _dlg = cast(SpawnChildSetupFunc*)data;

      (*_dlg)();
    }

    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }

    const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
    char*[] _tmpargv;
    foreach (s; argv)
      _tmpargv ~= s.toCString(No.Alloc);
    _tmpargv ~= null;
    char** _argv = _tmpargv.ptr;

    char*[] _tmpenvv;
    foreach (s; envv)
      _tmpenvv ~= s.toCString(No.Alloc);
    _tmpenvv ~= null;
    char** _envv = _tmpenvv.ptr;

    auto _childSetup = freezeDelegate(cast(void*)&childSetup);
    auto _callback = freezeDelegate(cast(void*)&callback);
    vte_pty_spawn_async(cast(VtePty*)cPtr, _workingDirectory, _argv, _envv, spawnFlags, &_childSetupCallback, _childSetup, &thawDelegate, timeout, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_callbackCallback, _callback);
  }

  bool spawnFinish(AsyncResult result, out Pid childPid)
  {
    bool _retval;
    GError *_err;
    _retval = vte_pty_spawn_finish(cast(VtePty*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, cast(GPid*)&childPid, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * Starts the specified command under the pseudo-terminal pty.
   * The argv and envv lists should be %NULL-terminated.
   * The "TERM" environment variable is automatically set to a default value,
   * but can be overridden from envv.
   * pty_flags controls logging the session to the specified system log files.
   * Note also that %G_SPAWN_STDOUT_TO_DEV_NULL, %G_SPAWN_STDERR_TO_DEV_NULL,
   * and %G_SPAWN_CHILD_INHERITS_STDIN are not supported in spawn_flags, since
   * stdin, stdout and stderr of the child process will always be connected to
   * the PTY. Also %G_SPAWN_LEAVE_DESCRIPTORS_OPEN is not supported; and
   * %G_SPAWN_DO_NOT_REAP_CHILD will always be added to spawn_flags.
   * If fds is not %NULL, the child process will map the file descriptors from
   * fds according to map_fds; n_map_fds must be less or equal to n_fds.
   * This function will take ownership of the file descriptors in fds;
   * you must not use or close them after this call. All file descriptors in fds
   * must have the FD_CLOEXEC flag set on them; it will be unset in the child process
   * before calling man:execve$(LPAREN)2$(RPAREN). Note also that no file descriptor may be mapped
   * to stdin, stdout, or stderr $(LPAREN)file descriptors 0, 1, or 2$(RPAREN), since these will be
   * assigned to the PTY. All open file descriptors apart from those mapped as above
   * will be closed when execve$(LPAREN)$(RPAREN) is called.
   * Beginning with 0.60, and on linux only, and unless %VTE_SPAWN_NO_SYSTEMD_SCOPE is
   * passed in spawn_flags, the newly created child process will be moved to its own
   * systemd user scope; and if %VTE_SPAWN_REQUIRE_SYSTEMD_SCOPE is passed, and creation
   * of the systemd user scope fails, the whole spawn will fail.
   * You can override the options used for the systemd user scope by
   * providing a systemd override file for 'vte-spawn-.scope' unit. See man:systemd.unit$(LPAREN)5$(RPAREN)
   * for further information.
   * See vte_pty_new$(LPAREN)$(RPAREN), and [Vte.Terminal.watchChild] for more information.
   * Params:
   *   workingDirectory = the name of a directory the command should start
   *     in, or %NULL to use the current working directory
   *   argv = child's argument vector
   *   envv = a list of environment
   *     variables to be added to the environment before starting the process, or %NULL
   *   fds = an array of file descriptors, or %NULL
   *   mapFds = an array of integers, or %NULL
   *   spawnFlags = flags from #GSpawnFlags
   *   childSetup = an extra child setup function to run in the child just before exec$(LPAREN)$(RPAREN), or %NULL
   *   timeout = a timeout value in ms, -1 for the default timeout, or G_MAXINT to wait indefinitely
   *   cancellable = a #GCancellable, or %NULL
   *   callback = a #GAsyncReadyCallback, or %NULL
   */
  void spawnWithFdsAsync(string workingDirectory, string[] argv, string[] envv, int[] fds, int[] mapFds, SpawnFlags spawnFlags, SpawnChildSetupFunc childSetup, int timeout, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _childSetupCallback(void* data)
    {
      auto _dlg = cast(SpawnChildSetupFunc*)data;

      (*_dlg)();
    }

    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }

    const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
    const(char)*[] _tmpargv;
    foreach (s; argv)
      _tmpargv ~= s.toCString(No.Alloc);
    _tmpargv ~= null;
    const(char*)* _argv = _tmpargv.ptr;

    const(char)*[] _tmpenvv;
    foreach (s; envv)
      _tmpenvv ~= s.toCString(No.Alloc);
    _tmpenvv ~= null;
    const(char*)* _envv = _tmpenvv.ptr;

    int _nFds;
    if (fds)
      _nFds = cast(int)fds.length;

    auto _fds = cast(const(int)*)fds.ptr;
    int _nMapFds;
    if (mapFds)
      _nMapFds = cast(int)mapFds.length;

    auto _mapFds = cast(const(int)*)mapFds.ptr;
    auto _childSetup = freezeDelegate(cast(void*)&childSetup);
    auto _callback = freezeDelegate(cast(void*)&callback);
    vte_pty_spawn_with_fds_async(cast(VtePty*)cPtr, _workingDirectory, _argv, _envv, _fds, _nFds, _mapFds, _nMapFds, spawnFlags, &_childSetupCallback, _childSetup, &thawDelegate, timeout, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_callbackCallback, _callback);
  }
}
