/// Global functions for glibunix2 library
module glibunix.global;

import gid.gid;
import glib.error;
import glib.source;
import glib.types;
import glibunix.c.functions;
import glibunix.c.types;
import glibunix.types;


/**
    Close every file descriptor equal to or greater than lowfd.
    
    Typically lowfd will be 3, to leave standard input, standard output
    and standard error open.
    
    This is the same as Linux `close_range (lowfd, ~0U, 0)`,
    but portable to other OSs and to older versions of Linux.
    Equivalently, it is the same as BSD `closefrom (lowfd)`, but portable,
    and async-signal-safe on all OSs.
    
    This function is async-signal safe, making it safe to call from a
    signal handler or a [glib.types.SpawnChildSetupFunc], as long as lowfd is
    non-negative.
    See [`signal(7)`](man:signal(7)) and
    [`signal-safety(7)`](man:signal-safety(7)) for more details.

    Params:
      lowfd = Minimum fd to close, which must be non-negative
    Returns: 0 on success, -1 with errno set on error
*/
int closefrom(int lowfd) nothrow
{
  int _retval;
  _retval = g_closefrom(lowfd);
  return _retval;
}

/** */
glib.types.Quark errorQuark() nothrow
{
  glib.types.Quark _retval;
  _retval = g_unix_error_quark();
  return _retval;
}

/**
    Sets a function to be called when the IO condition, as specified by
    condition becomes true for fd.
    
    This is the same as [glibunix.global.fdAdd], except that it allows you to
    specify a non-default priority and a provide a #GDestroyNotify for
    user_data.

    Params:
      priority = the priority of the source
      fd = a file descriptor
      condition = IO conditions to watch for on fd
      function_ = a #GUnixFDSourceFunc
    Returns: the ID (greater than 0) of the event source
*/
uint fdAddFull(int priority, int fd, glib.types.IOCondition condition, glibunix.types.FDSourceFunc function_) nothrow
{
  extern(C) gboolean _function_Callback(int fd, GIOCondition condition, void* userData) nothrow
  {
    bool _dretval;
    auto _dlg = cast(glibunix.types.FDSourceFunc*)userData;

    try
    {
      _dretval = (*_dlg)(fd, condition);
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "glibunix.types.FDSourceFunc");
    }
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = g_unix_fd_add_full(priority, fd, condition, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    Queries the file path for the given FD opened by the current process.

    Params:
      fd = The file descriptor to query.
    Returns: The file path, or `NULL` on error
    Throws: [ErrorWrap]
*/
string fdQueryPath(int fd)
{
  char* _cretval;
  GError *_err;
  _cretval = g_unix_fd_query_path(fd, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
  return _retval;
}

/**
    Creates a #GSource to watch for a particular I/O condition on a file
    descriptor.
    
    The source will never close the fd — you must do it yourself.
    
    Any callback attached to the returned #GSource must have type
    #GUnixFDSourceFunc.

    Params:
      fd = a file descriptor
      condition = I/O conditions to watch for on fd
    Returns: the newly created #GSource
*/
glib.source.Source fdSourceNew(int fd, glib.types.IOCondition condition) nothrow
{
  GSource* _cretval;
  _cretval = g_unix_fd_source_new(fd, condition);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Mark every file descriptor equal to or greater than lowfd to be closed
    at the next `execve()` or similar, as if via the `FD_CLOEXEC` flag.
    
    Typically lowfd will be 3, to leave standard input, standard output
    and standard error open after exec.
    
    This is the same as Linux `close_range (lowfd, ~0U, CLOSE_RANGE_CLOEXEC)`,
    but portable to other OSs and to older versions of Linux.
    
    This function is async-signal safe, making it safe to call from a
    signal handler or a [glib.types.SpawnChildSetupFunc], as long as lowfd is
    non-negative.
    See [`signal(7)`](man:signal(7)) and
    [`signal-safety(7)`](man:signal-safety(7)) for more details.

    Params:
      lowfd = Minimum fd to act on, which must be non-negative
    Returns: 0 on success, -1 with errno set on error
*/
int fdwalkSetCloexec(int lowfd) nothrow
{
  int _retval;
  _retval = g_fdwalk_set_cloexec(lowfd);
  return _retval;
}

/**
    Get the `passwd` file entry for the given user_name using `getpwnam_r()`.
    This can fail if the given user_name doesn’t exist.
    
    The returned `struct passwd` has been allocated using [glib.global.gmalloc] and should
    be freed using [glib.global.gfree]. The strings referenced by the returned struct are
    included in the same allocation, so are valid until the `struct passwd` is
    freed.
    
    This function is safe to call from multiple threads concurrently.
    
    You will need to include `pwd.h` to get the definition of `struct passwd`.

    Params:
      userName = the username to get the passwd file entry for
    Returns: passwd entry, or null on error; free the returned
         value with [glib.global.gfree]
    Throws: [ErrorWrap]
*/
void* getPasswdEntry(string userName)
{
  const(char)* _userName = userName.toCString!(No.Malloc, No.Nullable);
  GError *_err;
  auto _retval = g_unix_get_passwd_entry(_userName, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Similar to the UNIX pipe() call, but on modern systems like Linux
    uses the pipe2() system call, which atomically creates a pipe with
    the configured flags.
    
    As of GLib 2.78, the supported flags are `O_CLOEXEC`/`FD_CLOEXEC` (see below)
    and `O_NONBLOCK`. Prior to GLib 2.78, only `FD_CLOEXEC` was supported — if
    you wanted to configure `O_NONBLOCK` then that had to be done separately with
    `fcntl()`.
    
    Since GLib 2.80, the constants [glibunix.types.PipeEnd.Read] and
    [glibunix.types.PipeEnd.Write] can be used as mnemonic indexes in fds.
    
    It is a programmer error to call this function with unsupported flags, and a
    critical warning will be raised.
    
    As of GLib 2.78, it is preferred to pass `O_CLOEXEC` in, rather than
    `FD_CLOEXEC`, as that matches the underlying `pipe()` API more closely. Prior
    to 2.78, only `FD_CLOEXEC` was supported. Support for `FD_CLOEXEC` may be
    deprecated and removed in future.

    Params:
      fds = Array of two integers
      flags = Bitfield of file descriptor flags, as for fcntl()
    Returns: true on success, false if not (and errno will be set).
    Throws: [ErrorWrap]
*/
bool openPipe(out int[] fds, int flags)
{
  bool _retval;
  fds.length = 2;
  GError *_err;
  _retval = cast(bool)g_unix_open_pipe(fds.ptr, flags, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    Control the non-blocking state of the given file descriptor,
    according to nonblock. On most systems this uses `O_NONBLOCK`, but
    on some older ones may use `O_NDELAY`.

    Params:
      fd = A file descriptor
      nonblock = If true, set the descriptor to be non-blocking
    Returns: true if successful
    Throws: [ErrorWrap]
*/
bool setFdNonblocking(int fd, bool nonblock)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)g_unix_set_fd_nonblocking(fd, nonblock, &_err);
  if (_err)
    throw new ErrorWrap(_err, Yes.Take);
  return _retval;
}

/**
    A convenience function for [glibunix.global.signalSourceNew], which
    attaches to the default #GMainContext.  You can remove the watch
    using [glib.source.Source.remove].

    Params:
      priority = the priority of the signal source. Typically this will be in
                   the range between [glib.types.PRIORITY_DEFAULT] and [glib.types.PRIORITY_HIGH].
      signum = Signal number
      handler = Callback
    Returns: An ID (greater than 0) for the event source
*/
uint signalAdd(int priority, int signum, glib.types.SourceFunc handler) nothrow
{
  extern(C) gboolean _handlerCallback(void* userData) nothrow
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    try
    {
      _dretval = (*_dlg)();
    }
    catch (Exception e)
    {
      gidInvokeCallbackExceptionHandler(e, "glib.types.SourceFunc");
    }
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _handlerCB = handler ? &_handlerCallback : null;
  uint _retval;
  auto _handler = handler ? freezeDelegate(cast(void*)&handler) : null;
  GDestroyNotify _handlerDestroyCB = handler ? &thawDelegate : null;
  _retval = g_unix_signal_add_full(priority, signum, _handlerCB, _handler, _handlerDestroyCB);
  return _retval;
}

/**
    Create a #GSource that will be dispatched upon delivery of the UNIX
    signal signum.  In GLib versions before 2.36, only `SIGHUP`, `SIGINT`,
    `SIGTERM` can be monitored.  In GLib 2.36, `SIGUSR1` and `SIGUSR2`
    were added. In GLib 2.54, `SIGWINCH` was added.
    
    Note that unlike the UNIX default, all sources which have created a
    watch will be dispatched, regardless of which underlying thread
    invoked [glibunix.global.signalSourceNew].
    
    For example, an effective use of this function is to handle `SIGTERM`
    cleanly; flushing any outstanding files, and then calling
    [glib.main_loop.MainLoop.quit].  It is not safe to do any of this from a regular
    UNIX signal handler; such a handler may be invoked while malloc() or
    another library function is running, causing reentrancy issues if the
    handler attempts to use those functions.  None of the GLib/GObject
    API is safe against this kind of reentrancy.
    
    The interaction of this source when combined with native UNIX
    functions like sigprocmask() is not defined.
    
    The source will not initially be associated with any #GMainContext
    and must be added to one with [glib.source.Source.attach] before it will be
    executed.

    Params:
      signum = A signal number
    Returns: A newly created #GSource
*/
glib.source.Source signalSourceNew(int signum) nothrow
{
  GSource* _cretval;
  _cretval = g_unix_signal_source_new(signum);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}
