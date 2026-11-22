/// Module for [Subprocess] class
module gid.gio2.subprocess;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.initable;
import gid.gio2.initable_mixin;
import gid.gio2.input_stream;
import gid.gio2.output_stream;
import gid.gio2.types;
import gid.glib2.bytes;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.subprocess.Subprocess] allows the creation of and interaction with child
    processes.
    
    Processes can be communicated with using standard GIO-style APIs (ie:
    [gid.gio2.input_stream.InputStream], [gid.gio2.output_stream.OutputStream]). There are GIO-style APIs
    to wait for process termination (ie: cancellable and with an asynchronous
    variant).
    
    There is an API to force a process to terminate, as well as a
    race-free API for sending UNIX signals to a subprocess.
    
    One major advantage that GIO brings over the core GLib library is
    comprehensive API for asynchronous I/O, such
    [gid.gio2.output_stream.OutputStream.spliceAsync].  This makes [gid.gio2.subprocess.Subprocess]
    significantly more powerful and flexible than equivalent APIs in
    some other languages such as the `subprocess.py`
    included with Python.  For example, using [gid.gio2.subprocess.Subprocess] one could
    create two child processes, reading standard output from the first,
    processing it, and writing to the input stream of the second, all
    without blocking the main loop.
    
    A powerful [gid.gio2.subprocess.Subprocess.communicate] API is provided similar to the
    `communicate()` method of `subprocess.py`. This enables very easy
    interaction with a subprocess that has been opened with pipes.
    
    [gid.gio2.subprocess.Subprocess] defaults to tight control over the file descriptors open
    in the child process, avoiding dangling-FD issues that are caused by
    a simple `fork()`/`exec()`.  The only open file descriptors in the
    spawned process are ones that were explicitly specified by the
    [gid.gio2.subprocess.Subprocess] API (unless [gid.gio2.types.SubprocessFlags.InheritFds] was
    specified).
    
    [gid.gio2.subprocess.Subprocess] will quickly reap all child processes as they exit,
    avoiding ‘zombie processes’ remaining around for long periods of
    time.  [gid.gio2.subprocess.Subprocess.wait] can be used to wait for this to happen,
    but it will happen even without the call being explicitly made.
    
    As a matter of principle, [gid.gio2.subprocess.Subprocess] has no API that accepts
    shell-style space-separated strings.  It will, however, match the
    typical shell behaviour of searching the `PATH` for executables that do
    not contain a directory separator in their name. By default, the `PATH`
    of the current process is used.  You can specify
    [gid.gio2.types.SubprocessFlags.SearchPathFromEnvp] to use the `PATH` of the
    launcher environment instead.
    
    [gid.gio2.subprocess.Subprocess] attempts to have a very simple API for most uses (ie:
    spawning a subprocess with arguments and support for most typical
    kinds of input and output redirection).  See [gid.gio2.subprocess.Subprocess.new_]. The
    [gid.gio2.subprocess_launcher.SubprocessLauncher] API is provided for more complicated cases
    (advanced types of redirection, environment variable manipulation,
    change of working directory, child setup functions, etc).
    
    A typical use of [gid.gio2.subprocess.Subprocess] will involve calling
    [gid.gio2.subprocess.Subprocess.new_], followed by [gid.gio2.subprocess.Subprocess.waitAsync] or
    [gid.gio2.subprocess.Subprocess.wait].  After the process exits, the status can be
    checked using functions such as [gid.gio2.subprocess.Subprocess.getIfExited] (which
    are similar to the familiar `WIFEXITED`-style POSIX macros).
    
    Note that as of GLib 2.82, creating a [gid.gio2.subprocess.Subprocess] causes the signal
    `SIGPIPE` to be ignored for the remainder of the program. If you are writing
    a command-line utility that uses [gid.gio2.subprocess.Subprocess], you may need to take into
    account the fact that your program will not automatically be killed
    if it tries to write to `stdout` after it has been closed.
*/
class Subprocess : gid.gobject2.object.ObjectWrap, gid.gio2.initable.Initable
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
    return cast(void function())g_subprocess_get_type != &gidSymbolNotFound ? g_subprocess_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSubprocess";
  }

  /** Returns `this`, for use in `with` statements. */
  override Subprocess self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.subprocess.Subprocess]
      Returns: New builder object
  */
  static SubprocessGidBuilder builder() nothrow
  {
    return new SubprocessGidBuilder;
  }

  mixin InitableT!();

  /**
      Create a new process with the given flags and argument list.
      
      The argument list is expected to be null-terminated.
  
      Params:
        argv = commandline arguments for the subprocess
        flags = flags that define the behaviour of the subprocess
      Returns: A newly created #GSubprocess, or null on error (and error
          will be set)
      Throws: [ErrorWrap]
  */
  static gid.gio2.subprocess.Subprocess new_(string[] argv, gid.gio2.types.SubprocessFlags flags)
  {
    GSubprocess* _cretval;
    auto _argv_arr = new char*[](argv.length + 1);
    auto _argv = cast(char**)_argv_arr.ptr;
    foreach (i, s; argv) _argv[i] = s.toCString!(No.Malloc);
    GError *_err;
    _cretval = g_subprocess_newv(_argv, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.subprocess.Subprocess)(cast(GSubprocess*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Communicate with the subprocess until it terminates, and all input
      and output has been completed.
      
      If stdin_buf is given, the subprocess must have been created with
      [gid.gio2.types.SubprocessFlags.StdinPipe].  The given data is fed to the
      stdin of the subprocess and the pipe is closed (ie: EOF).
      
      At the same time (as not to cause blocking when dealing with large
      amounts of data), if [gid.gio2.types.SubprocessFlags.StdoutPipe] or
      [gid.gio2.types.SubprocessFlags.StderrPipe] were used, reads from those
      streams.  The data that was read is returned in stdout and/or
      the stderr.
      
      If the subprocess was created with [gid.gio2.types.SubprocessFlags.StdoutPipe],
      stdout_buf will contain the data read from stdout.  Otherwise, for
      subprocesses not created with [gid.gio2.types.SubprocessFlags.StdoutPipe],
      stdout_buf will be set to null.  Similar provisions apply to
      stderr_buf and [gid.gio2.types.SubprocessFlags.StderrPipe].
      
      As usual, any output variable may be given as null to ignore it.
      
      If you desire the stdout and stderr data to be interleaved, create
      the subprocess with [gid.gio2.types.SubprocessFlags.StdoutPipe] and
      [gid.gio2.types.SubprocessFlags.StderrMerge].  The merged result will be returned
      in stdout_buf and stderr_buf will be set to null.
      
      In case of any error (including cancellation), false will be
      returned with error set.  Some or all of the stdin data may have
      been written.  Any stdout or stderr data that has been read will be
      discarded. None of the out variables (aside from error) will have
      been set to anything in particular and should not be inspected.
      
      In the case that true is returned, the subprocess has exited and the
      exit status inspection APIs (eg: [gid.gio2.subprocess.Subprocess.getIfExited],
      [gid.gio2.subprocess.Subprocess.getExitStatus]) may be used.
      
      You should not attempt to use any of the subprocess pipes after
      starting this function, since they may be left in strange states,
      even if the operation was cancelled.  You should especially not
      attempt to interact with the pipes while the operation is in progress
      (either from another thread or if using the asynchronous version).
  
      Params:
        stdinBuf = data to send to the stdin of the subprocess, or null
        cancellable = a #GCancellable
        stdoutBuf = data read from the subprocess stdout
        stderrBuf = data read from the subprocess stderr
      Returns: true if successful
      Throws: [ErrorWrap]
  */
  bool communicate(gid.glib2.bytes.Bytes stdinBuf, gid.gio2.cancellable.Cancellable cancellable, out gid.glib2.bytes.Bytes stdoutBuf, out gid.glib2.bytes.Bytes stderrBuf)
  {
    bool _retval;
    GBytes* _stdoutBuf;
    GBytes* _stderrBuf;
    GError *_err;
    _retval = cast(bool)g_subprocess_communicate(cast(GSubprocess*)this._cPtr, stdinBuf ? cast(GBytes*)stdinBuf._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_stdoutBuf, &_stderrBuf, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    if (_stdoutBuf)
      stdoutBuf = new gid.glib2.bytes.Bytes(cast(void*)_stdoutBuf, Yes.Take);
    if (_stderrBuf)
      stderrBuf = new gid.glib2.bytes.Bytes(cast(void*)_stderrBuf, Yes.Take);
    return _retval;
  }

  /**
      Asynchronous version of [gid.gio2.subprocess.Subprocess.communicate].  Complete
      invocation with [gid.gio2.subprocess.Subprocess.communicateFinish].
  
      Params:
        stdinBuf = Input data, or null
        cancellable = Cancellable
        callback = Callback
  */
  void communicateAsync(gid.glib2.bytes.Bytes stdinBuf = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_subprocess_communicate_async(cast(GSubprocess*)this._cPtr, stdinBuf ? cast(GBytes*)stdinBuf._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an invocation of [gid.gio2.subprocess.Subprocess.communicateAsync].
  
      Params:
        result = Result
        stdoutBuf = Return location for stdout data
        stderrBuf = Return location for stderr data
      Returns: 
      Throws: [ErrorWrap]
  */
  bool communicateFinish(gid.gio2.async_result.AsyncResult result, out gid.glib2.bytes.Bytes stdoutBuf, out gid.glib2.bytes.Bytes stderrBuf)
  {
    bool _retval;
    GBytes* _stdoutBuf;
    GBytes* _stderrBuf;
    GError *_err;
    _retval = cast(bool)g_subprocess_communicate_finish(cast(GSubprocess*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_stdoutBuf, &_stderrBuf, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    if (_stdoutBuf)
      stdoutBuf = new gid.glib2.bytes.Bytes(cast(void*)_stdoutBuf, Yes.Take);
    if (_stderrBuf)
      stderrBuf = new gid.glib2.bytes.Bytes(cast(void*)_stderrBuf, Yes.Take);
    return _retval;
  }

  /**
      Like [gid.gio2.subprocess.Subprocess.communicate], but validates the output of the
      process as UTF-8, and returns it as a regular NUL terminated string.
      
      On error, stdout_buf and stderr_buf will be set to undefined values and
      should not be used.
  
      Params:
        stdinBuf = data to send to the stdin of the subprocess, or null
        cancellable = a #GCancellable
        stdoutBuf = data read from the subprocess stdout
        stderrBuf = data read from the subprocess stderr
      Returns: 
      Throws: [ErrorWrap]
  */
  bool communicateUtf8(string stdinBuf, gid.gio2.cancellable.Cancellable cancellable, out string stdoutBuf, out string stderrBuf)
  {
    bool _retval;
    const(char)* _stdinBuf = stdinBuf.toCString!(No.Malloc, Yes.Nullable);
    char* _stdoutBuf;
    char* _stderrBuf;
    GError *_err;
    _retval = cast(bool)g_subprocess_communicate_utf8(cast(GSubprocess*)this._cPtr, _stdinBuf, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_stdoutBuf, &_stderrBuf, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    stdoutBuf = _stdoutBuf.fromCString!(Yes.Free);
    stderrBuf = _stderrBuf.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Asynchronous version of [gid.gio2.subprocess.Subprocess.communicateUtf8].  Complete
      invocation with [gid.gio2.subprocess.Subprocess.communicateUtf8Finish].
  
      Params:
        stdinBuf = Input data, or null
        cancellable = Cancellable
        callback = Callback
  */
  void communicateUtf8Async(string stdinBuf = null, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _stdinBuf = stdinBuf.toCString!(No.Malloc, Yes.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_subprocess_communicate_utf8_async(cast(GSubprocess*)this._cPtr, _stdinBuf, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an invocation of [gid.gio2.subprocess.Subprocess.communicateUtf8Async].
  
      Params:
        result = Result
        stdoutBuf = Return location for stdout data
        stderrBuf = Return location for stderr data
      Returns: 
      Throws: [ErrorWrap]
  */
  bool communicateUtf8Finish(gid.gio2.async_result.AsyncResult result, out string stdoutBuf, out string stderrBuf)
  {
    bool _retval;
    char* _stdoutBuf;
    char* _stderrBuf;
    GError *_err;
    _retval = cast(bool)g_subprocess_communicate_utf8_finish(cast(GSubprocess*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_stdoutBuf, &_stderrBuf, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    stdoutBuf = _stdoutBuf.fromCString!(Yes.Free);
    stderrBuf = _stderrBuf.fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Use an operating-system specific method to attempt an immediate,
      forceful termination of the process.  There is no mechanism to
      determine whether or not the request itself was successful;
      however, you can use [gid.gio2.subprocess.Subprocess.wait] to monitor the status of
      the process after calling this function.
      
      On Unix, this function sends `SIGKILL`.
  */
  void forceExit() nothrow
  {
    g_subprocess_force_exit(cast(GSubprocess*)this._cPtr);
  }

  /**
      Check the exit status of the subprocess, given that it exited
      normally.  This is the value passed to the exit() system call or the
      return value from main.
      
      This is equivalent to the system WEXITSTATUS macro.
      
      It is an error to call this function before [gid.gio2.subprocess.Subprocess.wait] and
      unless [gid.gio2.subprocess.Subprocess.getIfExited] returned true.
      Returns: the exit status
  */
  int getExitStatus() nothrow
  {
    int _retval;
    _retval = g_subprocess_get_exit_status(cast(GSubprocess*)this._cPtr);
    return _retval;
  }

  /**
      On UNIX, returns the process ID as a decimal string.
      On Windows, returns the result of GetProcessId() also as a string.
      If the subprocess has terminated, this will return null.
      Returns: the subprocess identifier, or null if the subprocess
           has terminated
  */
  string getIdentifier() nothrow
  {
    const(char)* _cretval;
    _cretval = g_subprocess_get_identifier(cast(GSubprocess*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Check if the given subprocess exited normally (ie: by way of exit()
      or return from main()).
      
      This is equivalent to the system WIFEXITED macro.
      
      It is an error to call this function before [gid.gio2.subprocess.Subprocess.wait] has
      returned.
      Returns: true if the case of a normal exit
  */
  bool getIfExited() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_subprocess_get_if_exited(cast(GSubprocess*)this._cPtr);
    return _retval;
  }

  /**
      Check if the given subprocess terminated in response to a signal.
      
      This is equivalent to the system WIFSIGNALED macro.
      
      It is an error to call this function before [gid.gio2.subprocess.Subprocess.wait] has
      returned.
      Returns: true if the case of termination due to a signal
  */
  bool getIfSignaled() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_subprocess_get_if_signaled(cast(GSubprocess*)this._cPtr);
    return _retval;
  }

  /**
      Gets the raw status code of the process, as from waitpid().
      
      This value has no particular meaning, but it can be used with the
      macros defined by the system headers such as WIFEXITED.  It can also
      be used with [gid.glib2.global.spawnCheckWaitStatus].
      
      It is more likely that you want to use [gid.gio2.subprocess.Subprocess.getIfExited]
      followed by [gid.gio2.subprocess.Subprocess.getExitStatus].
      
      It is an error to call this function before [gid.gio2.subprocess.Subprocess.wait] has
      returned.
      Returns: the (meaningless) waitpid() exit status from the kernel
  */
  int getStatus() nothrow
  {
    int _retval;
    _retval = g_subprocess_get_status(cast(GSubprocess*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GInputStream from which to read the stderr output of
      subprocess.
      
      The process must have been created with [gid.gio2.types.SubprocessFlags.StderrPipe],
      otherwise null will be returned.
      Returns: the stderr pipe
  */
  gid.gio2.input_stream.InputStream getStderrPipe() nothrow
  {
    GInputStream* _cretval;
    _cretval = g_subprocess_get_stderr_pipe(cast(GSubprocess*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GOutputStream that you can write to in order to give data
      to the stdin of subprocess.
      
      The process must have been created with [gid.gio2.types.SubprocessFlags.StdinPipe] and
      not [gid.gio2.types.SubprocessFlags.StdinInherit], otherwise null will be returned.
      Returns: the stdout pipe
  */
  gid.gio2.output_stream.OutputStream getStdinPipe() nothrow
  {
    GOutputStream* _cretval;
    _cretval = g_subprocess_get_stdin_pipe(cast(GSubprocess*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.output_stream.OutputStream)(cast(GOutputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets the #GInputStream from which to read the stdout output of
      subprocess.
      
      The process must have been created with [gid.gio2.types.SubprocessFlags.StdoutPipe],
      otherwise null will be returned.
      Returns: the stdout pipe
  */
  gid.gio2.input_stream.InputStream getStdoutPipe() nothrow
  {
    GInputStream* _cretval;
    _cretval = g_subprocess_get_stdout_pipe(cast(GSubprocess*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.input_stream.InputStream)(cast(GInputStream*)_cretval, No.Take);
    return _retval;
  }

  /**
      Checks if the process was "successful".  A process is considered
      successful if it exited cleanly with an exit status of 0, either by
      way of the exit() system call or return from main().
      
      It is an error to call this function before [gid.gio2.subprocess.Subprocess.wait] has
      returned.
      Returns: true if the process exited cleanly with a exit status of 0
  */
  bool getSuccessful() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_subprocess_get_successful(cast(GSubprocess*)this._cPtr);
    return _retval;
  }

  /**
      Get the signal number that caused the subprocess to terminate, given
      that it terminated due to a signal.
      
      This is equivalent to the system WTERMSIG macro.
      
      It is an error to call this function before [gid.gio2.subprocess.Subprocess.wait] and
      unless [gid.gio2.subprocess.Subprocess.getIfSignaled] returned true.
      Returns: the signal causing termination
  */
  int getTermSig() nothrow
  {
    int _retval;
    _retval = g_subprocess_get_term_sig(cast(GSubprocess*)this._cPtr);
    return _retval;
  }

  /**
      Sends the UNIX signal signal_num to the subprocess, if it is still
      running.
      
      This API is race-free.  If the subprocess has terminated, it will not
      be signalled.
      
      This API is not available on Windows.
  
      Params:
        signalNum = the signal number to send
  */
  void sendSignal(int signalNum) nothrow
  {
    g_subprocess_send_signal(cast(GSubprocess*)this._cPtr, signalNum);
  }

  /**
      Synchronously wait for the subprocess to terminate.
      
      After the process terminates you can query its exit status with
      functions such as [gid.gio2.subprocess.Subprocess.getIfExited] and
      [gid.gio2.subprocess.Subprocess.getExitStatus].
      
      This function does not fail in the case of the subprocess having
      abnormal termination.  See [gid.gio2.subprocess.Subprocess.waitCheck] for that.
      
      Cancelling cancellable doesn't kill the subprocess.  Call
      [gid.gio2.subprocess.Subprocess.forceExit] if it is desirable.
  
      Params:
        cancellable = a #GCancellable
      Returns: true on success, false if cancellable was cancelled
      Throws: [ErrorWrap]
  */
  bool wait(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_subprocess_wait(cast(GSubprocess*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Wait for the subprocess to terminate.
      
      This is the asynchronous version of [gid.gio2.subprocess.Subprocess.wait].
  
      Params:
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback to call when the operation is complete
  */
  void waitAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_subprocess_wait_async(cast(GSubprocess*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Combines [gid.gio2.subprocess.Subprocess.wait] with [gid.glib2.global.spawnCheckWaitStatus].
  
      Params:
        cancellable = a #GCancellable
      Returns: true on success, false if process exited abnormally, or
        cancellable was cancelled
      Throws: [ErrorWrap]
  */
  bool waitCheck(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_subprocess_wait_check(cast(GSubprocess*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Combines [gid.gio2.subprocess.Subprocess.waitAsync] with [gid.glib2.global.spawnCheckWaitStatus].
      
      This is the asynchronous version of [gid.gio2.subprocess.Subprocess.waitCheck].
  
      Params:
        cancellable = a #GCancellable, or null
        callback = a #GAsyncReadyCallback to call when the operation is complete
  */
  void waitCheckAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_subprocess_wait_check_async(cast(GSubprocess*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Collects the result of a previous call to
      [gid.gio2.subprocess.Subprocess.waitCheckAsync].
  
      Params:
        result = the #GAsyncResult passed to your #GAsyncReadyCallback
      Returns: true if successful, or false with error set
      Throws: [ErrorWrap]
  */
  bool waitCheckFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_subprocess_wait_check_finish(cast(GSubprocess*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Collects the result of a previous call to
      [gid.gio2.subprocess.Subprocess.waitAsync].
  
      Params:
        result = the #GAsyncResult passed to your #GAsyncReadyCallback
      Returns: true if successful, or false with error set
      Throws: [ErrorWrap]
  */
  bool waitFinish(gid.gio2.async_result.AsyncResult result)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_subprocess_wait_finish(cast(GSubprocess*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.subprocess.Subprocess]
class SubprocessGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.initable.InitableGidBuilderImpl!T
{

  mixin InitableGidBuilderT!();

  /**
      Set `argv` property.
      Params:
        propval = Argument vector.
      Returns: Builder instance for fluent chaining
  */
  T argv(string[] propval) nothrow
  {
    return setProperty("argv", propval);
  }

  /**
      Set `flags` property.
      Params:
        propval = Subprocess flags.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.gio2.types.SubprocessFlags propval) nothrow
  {
    return setProperty("flags", propval);
  }
}

/// Fluent builder for [gid.gio2.subprocess.Subprocess]
final class SubprocessGidBuilder : SubprocessGidBuilderImpl!SubprocessGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Subprocess build() nothrow
  {
    return new Subprocess(cast(void*)createGObject(Subprocess._getGType), Yes.Take);
  }
}
