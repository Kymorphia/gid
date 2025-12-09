/// Module for [ApplicationCommandLine] class
module gio.application_command_line;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.file;
import gio.input_stream;
import gio.types;
import glib.variant;
import glib.variant_dict;
import gobject.object;

/**
    [gio.application_command_line.ApplicationCommandLine] represents a command-line invocation of
    an application.
    
    It is created by [gio.application.Application] and emitted
    in the `signal@Gio.Application::command-line` signal and virtual function.
    
    The class contains the list of arguments that the program was invoked
    with. It is also possible to query if the commandline invocation was
    local (ie: the current process is running in direct response to the
    invocation) or remote (ie: some other process forwarded the
    commandline to this process).
    
    The [gio.application_command_line.ApplicationCommandLine] object can provide the @argc and @argv
    parameters for use with the [glib.option_context.OptionContext] command-line parsing API,
    with the [gio.application_command_line.ApplicationCommandLine.getArguments] function. See
    [gapplication-example-cmdline3.c][gapplication-example-cmdline3]
    for an example.
    
    The exit status of the originally-invoked process may be set and
    messages can be printed to stdout or stderr of that process.
    
    For remote invocation, the originally-invoked process exits when
    [gio.application_command_line.ApplicationCommandLine.done] method is called. This method is
    also automatically called when the object is disposed.
    
    The main use for [gio.application_command_line.ApplicationCommandLine] (and the
    `signal@Gio.Application::command-line` signal) is 'Emacs server' like use cases:
    You can set the `EDITOR` environment variable to have e.g. git use
    your favourite editor to edit commit messages, and if you already
    have an instance of the editor running, the editing will happen
    in the running instance, instead of opening a new one. An important
    aspect of this use case is that the process that gets started by git
    does not return until the editing is done.
    
    Normally, the commandline is completely handled in the
    `signal@Gio.Application::command-line` handler. The launching instance exits
    once the signal handler in the primary instance has returned, and
    the return value of the signal handler becomes the exit status
    of the launching instance.
    
    ```c
    static int
    command_line (GApplication            *application,
                  GApplicationCommandLine *cmdline)
    {
      gchar **argv;
      gint argc;
      gint i;
    
      argv = g_application_command_line_get_arguments (cmdline, &argc);
    
      g_application_command_line_print (cmdline,
                                        "This text is written back\n"
                                        "to stdout of the caller\n");
    
      for (i = 0; i < argc; i++)
        g_print ("argument %d: %s\n", i, argv[i]);
    
      g_strfreev (argv);
    
      return 0;
    }
    ```
    
    The complete example can be found here:
    [gapplication-example-cmdline.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline.c)
    
    In more complicated cases, the handling of the commandline can be
    split between the launcher and the primary instance.
    
    ```c
    static gboolean
     test_local_cmdline (GApplication   *application,
                         gchar        ***arguments,
                         gint           *exit_status)
    {
      gint i, j;
      gchar **argv;
    
      argv = *arguments;
    
      if (argv[0] == NULL)
        {
          *exit_status = 0;
          return FALSE;
        }
    
      i = 1;
      while (argv[i])
        {
          if (g_str_has_prefix (argv[i], "--local-"))
            {
              g_print ("handling argument %s locally\n", argv[i]);
              g_free (argv[i]);
              for (j = i; argv[j]; j++)
                argv[j] = argv[j + 1];
            }
          else
            {
              g_print ("not handling argument %s locally\n", argv[i]);
              i++;
            }
        }
    
      *exit_status = 0;
    
      return FALSE;
    }
    
    static void
    test_application_class_init (TestApplicationClass *class)
    {
      G_APPLICATION_CLASS (class)->local_command_line = test_local_cmdline;
    
      ...
    }
    ```
    
    In this example of split commandline handling, options that start
    with `--local-` are handled locally, all other options are passed
    to the `signal@Gio.Application::command-line` handler which runs in the primary
    instance.
    
    The complete example can be found here:
    [gapplication-example-cmdline2.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline2.c)
    
    If handling the commandline requires a lot of work, it may be better to defer it.
    
    ```c
    static gboolean
    my_cmdline_handler (gpointer data)
    {
      GApplicationCommandLine *cmdline = data;
    
      // do the heavy lifting in an idle
    
      g_application_command_line_set_exit_status (cmdline, 0);
      g_object_unref (cmdline); // this releases the application
    
      return G_SOURCE_REMOVE;
    }
    
    static int
    command_line (GApplication            *application,
                  GApplicationCommandLine *cmdline)
    {
      // keep the application running until we are done with this commandline
      g_application_hold (application);
    
      g_object_set_data_full (G_OBJECT (cmdline),
                              "application", application,
                              (GDestroyNotify)g_application_release);
    
      g_object_ref (cmdline);
      g_idle_add (my_cmdline_handler, cmdline);
    
      return 0;
    }
    ```
    
    In this example the commandline is not completely handled before
    the `signal@Gio.Application::command-line` handler returns. Instead, we keep
    a reference to the [gio.application_command_line.ApplicationCommandLine] object and handle it
    later (in this example, in an idle). Note that it is necessary to
    hold the application until you are done with the commandline.
    
    The complete example can be found here:
    [gapplication-example-cmdline3.c](https://gitlab.gnome.org/GNOME/glib/-/blob/HEAD/gio/tests/gapplication-example-cmdline3.c)
*/
class ApplicationCommandLine : gobject.object.ObjectWrap
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
    return cast(void function())g_application_command_line_get_type != &gidSymbolNotFound ? g_application_command_line_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ApplicationCommandLine self()
  {
    return this;
  }

  /**
      Get `isRemote` property.
      Returns: Whether this is a remote commandline.
  */
  @property bool isRemote()
  {
    return getIsRemote();
  }

  /**
      Creates a #GFile corresponding to a filename that was given as part
      of the invocation of cmdline.
      
      This differs from [gio.file.File.newForCommandlineArg] in that it
      resolves relative pathnames using the current working directory of
      the invoking process rather than the local process.
  
      Params:
        arg = an argument from cmdline
      Returns: a new #GFile
  */
  gio.file.File createFileForArg(string arg)
  {
    GFile* _cretval;
    const(char)* _arg = arg.toCString(No.Alloc);
    _cretval = g_application_command_line_create_file_for_arg(cast(GApplicationCommandLine*)this._cPtr, _arg);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.file.File)(cast(GFile*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Signals that command line processing is completed.
      
      For remote invocation, it causes the invoking process to terminate.
      
      For local invocation, it does nothing.
      
      This method should be called in the `signalGio.Application::command-line`
      handler, after the exit status is set and all messages are printed.
      
      After this call, [gio.application_command_line.ApplicationCommandLine.setExitStatus] has no effect.
      Subsequent calls to this method are no-ops.
      
      This method is automatically called when the #GApplicationCommandLine
      object is disposed — so you can omit the call in non-garbage collected
      languages.
  */
  void done()
  {
    g_application_command_line_done(cast(GApplicationCommandLine*)this._cPtr);
  }

  /**
      Gets the list of arguments that was passed on the command line.
      
      The strings in the array may contain non-UTF-8 data on UNIX (such as
      filenames or arguments given in the system locale) but are always in
      UTF-8 on Windows.
      
      If you wish to use the return value with #GOptionContext, you must
      use [glib.option_context.OptionContext.parseStrv].
      
      The return value is null-terminated and should be freed using
      [glib.global.strfreev].
      Returns: the string array containing the arguments (the argv)
  */
  string[] getArguments()
  {
    char** _cretval;
    int _cretlength;
    _cretval = g_application_command_line_get_arguments(cast(GApplicationCommandLine*)this._cPtr, &_cretlength);
    string[] _retval;

    if (_cretval)
    {
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Gets the working directory of the command line invocation.
      The string may contain non-utf8 data.
      
      It is possible that the remote application did not send a working
      directory, so this may be null.
      
      The return value should not be modified or freed and is valid for as
      long as cmdline exists.
      Returns: the current directory, or null
  */
  string getCwd()
  {
    const(char)* _cretval;
    _cretval = g_application_command_line_get_cwd(cast(GApplicationCommandLine*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the contents of the 'environ' variable of the command line
      invocation, as would be returned by [glib.global.getEnviron], ie as a
      null-terminated list of strings in the form 'NAME=VALUE'.
      The strings may contain non-utf8 data.
      
      The remote application usually does not send an environment.  Use
      [gio.types.ApplicationFlags.SendEnvironment] to affect that.  Even with this flag
      set it is possible that the environment is still not available (due
      to invocation messages from other applications).
      
      The return value should not be modified or freed and is valid for as
      long as cmdline exists.
      
      See [gio.application_command_line.ApplicationCommandLine.getenv] if you are only interested
      in the value of a single environment variable.
      Returns: the environment strings, or null if they were not sent
  */
  string[] getEnviron()
  {
    const(char*)* _cretval;
    _cretval = g_application_command_line_get_environ(cast(GApplicationCommandLine*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Gets the exit status of cmdline.  See
      [gio.application_command_line.ApplicationCommandLine.setExitStatus] for more information.
      Returns: the exit status
  */
  int getExitStatus()
  {
    int _retval;
    _retval = g_application_command_line_get_exit_status(cast(GApplicationCommandLine*)this._cPtr);
    return _retval;
  }

  /**
      Determines if cmdline represents a remote invocation.
      Returns: true if the invocation was remote
  */
  bool getIsRemote()
  {
    bool _retval;
    _retval = g_application_command_line_get_is_remote(cast(GApplicationCommandLine*)this._cPtr);
    return _retval;
  }

  /**
      Gets the options that were passed to g_application_command_line().
      
      If you did not override local_command_line() then these are the same
      options that were parsed according to the #GOptionEntrys added to the
      application with [gio.application.Application.addMainOptionEntries] and possibly
      modified from your GApplication::handle-local-options handler.
      
      If no options were sent then an empty dictionary is returned so that
      you don't need to check for null.
      
      The data has been passed via an untrusted external process, so the types of
      all values must be checked before being used.
      Returns: a #GVariantDict with the options
  */
  glib.variant_dict.VariantDict getOptionsDict()
  {
    GVariantDict* _cretval;
    _cretval = g_application_command_line_get_options_dict(cast(GApplicationCommandLine*)this._cPtr);
    auto _retval = _cretval ? new glib.variant_dict.VariantDict(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the platform data associated with the invocation of cmdline.
      
      This is a #GVariant dictionary containing information about the
      context in which the invocation occurred.  It typically contains
      information like the current working directory and the startup
      notification ID.
      
      It comes from an untrusted external process and hence the types of all
      values must be validated before being used.
      
      For local invocation, it will be null.
      Returns: the platform data, or null
  */
  glib.variant.Variant getPlatformData()
  {
    GVariant* _cretval;
    _cretval = g_application_command_line_get_platform_data(cast(GApplicationCommandLine*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the stdin of the invoking process.
      
      The #GInputStream can be used to read data passed to the standard
      input of the invoking process.
      This doesn't work on all platforms.  Presently, it is only available
      on UNIX when using a D-Bus daemon capable of passing file descriptors.
      If stdin is not available then null will be returned.  In the
      future, support may be expanded to other platforms.
      
      You must only call this function once per commandline invocation.
      Returns: a #GInputStream for stdin
  */
  gio.input_stream.InputStream getStdin()
  {
    GInputStream* _cretval;
    _cretval = g_application_command_line_get_stdin(cast(GApplicationCommandLine*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.input_stream.InputStream)(cast(GInputStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the value of a particular environment variable of the command
      line invocation, as would be returned by [glib.global.getenv].  The strings may
      contain non-utf8 data.
      
      The remote application usually does not send an environment.  Use
      [gio.types.ApplicationFlags.SendEnvironment] to affect that.  Even with this flag
      set it is possible that the environment is still not available (due
      to invocation messages from other applications).
      
      The return value should not be modified or freed and is valid for as
      long as cmdline exists.
  
      Params:
        name = the environment variable to get
      Returns: the value of the variable, or null if unset or unsent
  */
  string getenv(string name)
  {
    const(char)* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_application_command_line_getenv(cast(GApplicationCommandLine*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Prints a message using the stdout print handler in the invoking process.
      
      Unlike [gio.application_command_line.ApplicationCommandLine.print], message is not a `printf()`-style
      format string. Use this function if message contains text you don't have
      control over, that could include `printf()` escape sequences.
  
      Params:
        message = the message
  */
  void printLiteral(string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    g_application_command_line_print_literal(cast(GApplicationCommandLine*)this._cPtr, _message);
  }

  /**
      Prints a message using the stderr print handler in the invoking process.
      
      Unlike [gio.application_command_line.ApplicationCommandLine.printerr], message is not
      a `printf()`-style format string. Use this function if message contains text
      you don't have control over, that could include `printf()` escape sequences.
  
      Params:
        message = the message
  */
  void printerrLiteral(string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    g_application_command_line_printerr_literal(cast(GApplicationCommandLine*)this._cPtr, _message);
  }

  /**
      Sets the exit status that will be used when the invoking process
      exits.
      
      The return value of the #GApplication::command-line signal is
      passed to this function when the handler returns.  This is the usual
      way of setting the exit status.
      
      In the event that you want the remote invocation to continue running
      and want to decide on the exit status in the future, you can use this
      call.  For the case of a remote invocation, the remote process will
      typically exit when the last reference is dropped on cmdline.  The
      exit status of the remote process will be equal to the last value
      that was set with this function.
      
      In the case that the commandline invocation is local, the situation
      is slightly more complicated.  If the commandline invocation results
      in the mainloop running (ie: because the use-count of the application
      increased to a non-zero value) then the application is considered to
      have been 'successful' in a certain sense, and the exit status is
      always zero.  If the application use count is zero, though, the exit
      status of the local #GApplicationCommandLine is used.
      
      This method is a no-op if [gio.application_command_line.ApplicationCommandLine.done] has
      been called.
  
      Params:
        exitStatus = the exit status
  */
  void setExitStatus(int exitStatus)
  {
    g_application_command_line_set_exit_status(cast(GApplicationCommandLine*)this._cPtr, exitStatus);
  }
}
