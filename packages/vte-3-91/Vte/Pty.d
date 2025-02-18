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

  bool spawnFinish(AsyncResult result, out Pid childPid)
  {
    bool _retval;
    GError *_err;
    _retval = vte_pty_spawn_finish(cast(VtePty*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, cast(GPid*)&childPid, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
