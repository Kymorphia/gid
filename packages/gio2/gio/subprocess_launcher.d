/// Module for [SubprocessLauncher] class
module gio.subprocess_launcher;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.subprocess;
import gio.types;
import glib.error;
import gobject.object;

/**
    This class contains a set of options for launching child processes,
    such as where its standard input and output will be directed, the
    argument list, the environment, and more.
    
    While the [gio.subprocess.Subprocess] class has high level functions covering
    popular cases, use of this class allows access to more advanced
    options.  It can also be used to launch multiple subprocesses with
    a similar configuration.
*/
class SubprocessLauncher : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_subprocess_launcher_get_type != &gidSymbolNotFound ? g_subprocess_launcher_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SubprocessLauncher self()
  {
    return this;
  }

  /**
      Creates a new #GSubprocessLauncher.
      
      The launcher is created with the default options.  A copy of the
      environment of the calling process is made at the time of this call
      and will be used as the environment that the process is launched in.
  
      Params:
        flags = #GSubprocessFlags
      Returns: 
  */
  this(gio.types.SubprocessFlags flags)
  {
    GSubprocessLauncher* _cretval;
    _cretval = g_subprocess_launcher_new(flags);
    this(_cretval, Yes.Take);
  }

  /**
      Closes all the file descriptors previously passed to the object with
      [gio.subprocess_launcher.SubprocessLauncher.takeFd], [gio.subprocess_launcher.SubprocessLauncher.takeStderrFd], etc.
      
      After calling this method, any subsequent calls to [gio.subprocess_launcher.SubprocessLauncher.spawn] or [gio.subprocess_launcher.SubprocessLauncher.spawnv] will
      return [gio.types.IOErrorEnum.Closed]. This method is idempotent if
      called more than once.
      
      This function is called automatically when the #GSubprocessLauncher
      is disposed, but is provided separately so that garbage collected
      language bindings can call it earlier to guarantee when FDs are closed.
  */
  void close()
  {
    g_subprocess_launcher_close(cast(GSubprocessLauncher*)this._cPtr);
  }

  /**
      Returns the value of the environment variable variable in the
      environment of processes launched from this launcher.
      
      On UNIX, the returned string can be an arbitrary byte string.
      On Windows, it will be UTF-8.
  
      Params:
        variable = the environment variable to get
      Returns: the value of the environment variable,
            null if unset
  */
  string getenv(string variable)
  {
    const(char)* _cretval;
    const(char)* _variable = variable.toCString(No.Alloc);
    _cretval = g_subprocess_launcher_getenv(cast(GSubprocessLauncher*)this._cPtr, _variable);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets the current working directory that processes will be launched
      with.
      
      By default processes are launched with the current working directory
      of the launching process at the time of launch.
  
      Params:
        cwd = the cwd for launched processes
  */
  void setCwd(string cwd)
  {
    const(char)* _cwd = cwd.toCString(No.Alloc);
    g_subprocess_launcher_set_cwd(cast(GSubprocessLauncher*)this._cPtr, _cwd);
  }

  /**
      Replace the entire environment of processes launched from this
      launcher with the given 'environ' variable.
      
      Typically you will build this variable by using [glib.global.listenv] to copy
      the process 'environ' and using the functions [glib.global.environSetenv],
      [glib.global.environUnsetenv], etc.
      
      As an alternative, you can use [gio.subprocess_launcher.SubprocessLauncher.setenv],
      [gio.subprocess_launcher.SubprocessLauncher.unsetenv], etc.
      
      Pass an empty array to set an empty environment. Pass null to inherit the
      parent process’ environment. As of GLib 2.54, the parent process’ environment
      will be copied when [gio.subprocess_launcher.SubprocessLauncher.setEnviron] is called.
      Previously, it was copied when the subprocess was executed. This means the
      copied environment may now be modified (using [gio.subprocess_launcher.SubprocessLauncher.setenv],
      etc.) before launching the subprocess.
      
      On UNIX, all strings in this array can be arbitrary byte strings.
      On Windows, they should be in UTF-8.
  
      Params:
        env = the replacement environment
  */
  void setEnviron(string[] env)
  {
    char*[] _tmpenv;
    foreach (s; env)
      _tmpenv ~= s.toCString(No.Alloc);
    _tmpenv ~= null;
    char** _env = _tmpenv.ptr;

    g_subprocess_launcher_set_environ(cast(GSubprocessLauncher*)this._cPtr, _env);
  }

  /**
      Sets the flags on the launcher.
      
      The default flags are [gio.types.SubprocessFlags.None].
      
      You may not set flags that specify conflicting options for how to
      handle a particular stdio stream (eg: specifying both
      [gio.types.SubprocessFlags.StdinPipe] and
      [gio.types.SubprocessFlags.StdinInherit]).
      
      You may also not set a flag that conflicts with a previous call to a
      function like [gio.subprocess_launcher.SubprocessLauncher.setStdinFilePath] or
      [gio.subprocess_launcher.SubprocessLauncher.takeStdoutFd].
  
      Params:
        flags = #GSubprocessFlags
  */
  void setFlags(gio.types.SubprocessFlags flags)
  {
    g_subprocess_launcher_set_flags(cast(GSubprocessLauncher*)this._cPtr, flags);
  }

  /**
      Sets the file path to use as the stderr for spawned processes.
      
      If path is null then any previously given path is unset.
      
      The file will be created or truncated when the process is spawned, as
      would be the case if using '2>' at the shell.
      
      If you want to send both stdout and stderr to the same file then use
      [gio.types.SubprocessFlags.StderrMerge].
      
      You may not set a stderr file path if a stderr fd is already set or
      if the launcher flags contain any flags directing stderr elsewhere.
      
      This feature is only available on UNIX.
  
      Params:
        path = a filename or null
  */
  void setStderrFilePath(string path = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
    g_subprocess_launcher_set_stderr_file_path(cast(GSubprocessLauncher*)this._cPtr, _path);
  }

  /**
      Sets the file path to use as the stdin for spawned processes.
      
      If path is null then any previously given path is unset.
      
      The file must exist or spawning the process will fail.
      
      You may not set a stdin file path if a stdin fd is already set or if
      the launcher flags contain any flags directing stdin elsewhere.
      
      This feature is only available on UNIX.
  
      Params:
        path = a filename or null
  */
  void setStdinFilePath(string path = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
    g_subprocess_launcher_set_stdin_file_path(cast(GSubprocessLauncher*)this._cPtr, _path);
  }

  /**
      Sets the file path to use as the stdout for spawned processes.
      
      If path is null then any previously given path is unset.
      
      The file will be created or truncated when the process is spawned, as
      would be the case if using '>' at the shell.
      
      You may not set a stdout file path if a stdout fd is already set or
      if the launcher flags contain any flags directing stdout elsewhere.
      
      This feature is only available on UNIX.
  
      Params:
        path = a filename or null
  */
  void setStdoutFilePath(string path = null)
  {
    const(char)* _path = path.toCString(No.Alloc);
    g_subprocess_launcher_set_stdout_file_path(cast(GSubprocessLauncher*)this._cPtr, _path);
  }

  /**
      Sets the environment variable variable in the environment of
      processes launched from this launcher.
      
      On UNIX, both the variable's name and value can be arbitrary byte
      strings, except that the variable's name cannot contain '='.
      On Windows, they should be in UTF-8.
  
      Params:
        variable = the environment variable to set,
              must not contain '='
        value = the new value for the variable
        overwrite = whether to change the variable if it already exists
  */
  void setenv(string variable, string value, bool overwrite)
  {
    const(char)* _variable = variable.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    g_subprocess_launcher_setenv(cast(GSubprocessLauncher*)this._cPtr, _variable, _value, overwrite);
  }

  /**
      Creates a #GSubprocess given a provided array of arguments.
  
      Params:
        argv = Command line arguments
      Returns: A new #GSubprocess, or null on error (and error will be set)
      Throws: [ErrorWrap]
  */
  gio.subprocess.Subprocess spawnv(string[] argv)
  {
    GSubprocess* _cretval;
    const(char)*[] _tmpargv;
    foreach (s; argv)
      _tmpargv ~= s.toCString(No.Alloc);
    _tmpargv ~= null;
    const(char*)* _argv = _tmpargv.ptr;

    GError *_err;
    _cretval = g_subprocess_launcher_spawnv(cast(GSubprocessLauncher*)this._cPtr, _argv, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.subprocess.Subprocess)(cast(GSubprocess*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Transfer an arbitrary file descriptor from parent process to the
      child.  This function takes ownership of the source_fd; it will be closed
      in the parent when self is freed.
      
      By default, all file descriptors from the parent will be closed.
      This function allows you to create (for example) a custom `pipe()` or
      `socketpair()` before launching the process, and choose the target
      descriptor in the child.
      
      An example use case is GNUPG, which has a command line argument
      `--passphrase-fd` providing a file descriptor number where it expects
      the passphrase to be written.
  
      Params:
        sourceFd = File descriptor in parent process
        targetFd = Target descriptor for child process
  */
  void takeFd(int sourceFd, int targetFd)
  {
    g_subprocess_launcher_take_fd(cast(GSubprocessLauncher*)this._cPtr, sourceFd, targetFd);
  }

  /**
      Sets the file descriptor to use as the stderr for spawned processes.
      
      If fd is -1 then any previously given fd is unset.
      
      Note that the default behaviour is to pass stderr through to the
      stderr of the parent process.
      
      The passed fd belongs to the #GSubprocessLauncher.  It will be
      automatically closed when the launcher is finalized.  The file
      descriptor will also be closed on the child side when executing the
      spawned process.
      
      You may not set a stderr fd if a stderr file path is already set or
      if the launcher flags contain any flags directing stderr elsewhere.
      
      This feature is only available on UNIX.
  
      Params:
        fd = a file descriptor, or -1
  */
  void takeStderrFd(int fd)
  {
    g_subprocess_launcher_take_stderr_fd(cast(GSubprocessLauncher*)this._cPtr, fd);
  }

  /**
      Sets the file descriptor to use as the stdin for spawned processes.
      
      If fd is -1 then any previously given fd is unset.
      
      Note that if your intention is to have the stdin of the calling
      process inherited by the child then [gio.types.SubprocessFlags.StdinInherit]
      is a better way to go about doing that.
      
      The passed fd is noted but will not be touched in the current
      process.  It is therefore necessary that it be kept open by the
      caller until the subprocess is spawned.  The file descriptor will
      also not be explicitly closed on the child side, so it must be marked
      O_CLOEXEC if that's what you want.
      
      You may not set a stdin fd if a stdin file path is already set or if
      the launcher flags contain any flags directing stdin elsewhere.
      
      This feature is only available on UNIX.
  
      Params:
        fd = a file descriptor, or -1
  */
  void takeStdinFd(int fd)
  {
    g_subprocess_launcher_take_stdin_fd(cast(GSubprocessLauncher*)this._cPtr, fd);
  }

  /**
      Sets the file descriptor to use as the stdout for spawned processes.
      
      If fd is -1 then any previously given fd is unset.
      
      Note that the default behaviour is to pass stdout through to the
      stdout of the parent process.
      
      The passed fd is noted but will not be touched in the current
      process.  It is therefore necessary that it be kept open by the
      caller until the subprocess is spawned.  The file descriptor will
      also not be explicitly closed on the child side, so it must be marked
      O_CLOEXEC if that's what you want.
      
      You may not set a stdout fd if a stdout file path is already set or
      if the launcher flags contain any flags directing stdout elsewhere.
      
      This feature is only available on UNIX.
  
      Params:
        fd = a file descriptor, or -1
  */
  void takeStdoutFd(int fd)
  {
    g_subprocess_launcher_take_stdout_fd(cast(GSubprocessLauncher*)this._cPtr, fd);
  }

  /**
      Removes the environment variable variable from the environment of
      processes launched from this launcher.
      
      On UNIX, the variable's name can be an arbitrary byte string not
      containing '='. On Windows, it should be in UTF-8.
  
      Params:
        variable = the environment variable to unset,
              must not contain '='
  */
  void unsetenv(string variable)
  {
    const(char)* _variable = variable.toCString(No.Alloc);
    g_subprocess_launcher_unsetenv(cast(GSubprocessLauncher*)this._cPtr, _variable);
  }
}
