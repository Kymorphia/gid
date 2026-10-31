/// Module for [OptionContext] class
module glib.option_context;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.option_group;
import glib.types;

/**
    A [glib.option_context.OptionContext] struct defines which options
    are accepted by the commandline option parser. The struct has only private
    fields and should not be directly accessed.
*/
class OptionContext
{
  GOptionContext* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstancePtr = cast(GOptionContext*)ptr;

    owned = take;
  }

  ~this() nothrow
  {
    if (owned && _cInstancePtr)
      cValueFreeInMainContext(cast(void*)_cInstancePtr, cast(GDestroyNotify)cFuncPtr!(g_option_context_free)());
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Adds a #GOptionGroup to the context, so that parsing with context
      will recognize the options in the group. Note that this will take
      ownership of the group and thus the group should not be freed.
  
      Params:
        group = the group to add
  */
  void addGroup(glib.option_group.OptionGroup group) nothrow
  {
    g_option_context_add_group(cast(GOptionContext*)this._cPtr, group ? cast(GOptionGroup*)group._cPtr(Yes.Dup) : null);
  }

  /**
      A convenience function which creates a main group if it doesn't
      exist, adds the entries to it and sets the translation domain.
  
      Params:
        entries = a null-terminated array of #GOptionEntrys
        translationDomain = a translation domain to use for translating
             the `--help` output for the options in entries
             with gettext(), or null
  */
  void addMainEntries(glib.types.OptionEntry[] entries, string translationDomain = null) nothrow
  {
    auto _entries_arr = entries ~ GOptionEntry.init;
    auto _entries = _entries_arr.ptr;
    const(char)* _translationDomain = translationDomain.toCString!(No.Malloc, Yes.Nullable);
    g_option_context_add_main_entries(cast(GOptionContext*)this._cPtr, _entries, _translationDomain);
  }

  /**
      Returns the description. See [glib.option_context.OptionContext.setDescription].
      Returns: the description
  */
  string getDescription() nothrow
  {
    const(char)* _cretval;
    _cretval = g_option_context_get_description(cast(GOptionContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Returns a formatted, translated help text for the given context.
      To obtain the text produced by `--help`, call
      `g_option_context_get_help (context, TRUE, NULL)`.
      To obtain the text produced by `--help-all`, call
      `g_option_context_get_help (context, FALSE, NULL)`.
      To obtain the help text for an option group, call
      `g_option_context_get_help (context, FALSE, group)`.
  
      Params:
        mainHelp = if true, only include the main group
        group = the #GOptionGroup to create help for, or null
      Returns: A newly allocated string containing the help text
  */
  string getHelp(bool mainHelp, glib.option_group.OptionGroup group = null) nothrow
  {
    char* _cretval;
    _cretval = g_option_context_get_help(cast(GOptionContext*)this._cPtr, mainHelp, group ? cast(GOptionGroup*)group._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Returns whether automatic `--help` generation
      is turned on for context. See [glib.option_context.OptionContext.setHelpEnabled].
      Returns: true if automatic help generation is turned on.
  */
  bool getHelpEnabled() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_option_context_get_help_enabled(cast(GOptionContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether unknown options are ignored or not. See
      [glib.option_context.OptionContext.setIgnoreUnknownOptions].
      Returns: true if unknown options are ignored.
  */
  bool getIgnoreUnknownOptions() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_option_context_get_ignore_unknown_options(cast(GOptionContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns a pointer to the main group of context.
      Returns: the main group of context, or null if
         context doesn't have a main group. Note that group belongs to
         context and should not be modified or freed.
  */
  glib.option_group.OptionGroup getMainGroup() nothrow
  {
    GOptionGroup* _cretval;
    _cretval = g_option_context_get_main_group(cast(GOptionContext*)this._cPtr);
    auto _retval = _cretval ? new glib.option_group.OptionGroup(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns whether strict POSIX code is enabled.
      
      See [glib.option_context.OptionContext.setStrictPosix] for more information.
      Returns: true if strict POSIX is enabled, false otherwise.
  */
  bool getStrictPosix() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_option_context_get_strict_posix(cast(GOptionContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns the summary. See [glib.option_context.OptionContext.setSummary].
      Returns: the summary
  */
  string getSummary() nothrow
  {
    const(char)* _cretval;
    _cretval = g_option_context_get_summary(cast(GOptionContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Parses the command line arguments, recognizing options
      which have been added to context. A side-effect of
      calling this function is that [glib.global.setPrgname] will be
      called.
      
      If the parsing is successful, any parsed arguments are
      removed from the array and argc and argv are updated
      accordingly. A '--' option is stripped from argv
      unless there are unparsed options before and after it,
      or some of the options after it start with '-'. In case
      of an error, argc and argv are left unmodified.
      
      If automatic `--help` support is enabled
      (see [glib.option_context.OptionContext.setHelpEnabled]), and the
      argv array contains one of the recognized help options,
      this function will produce help output to stdout and
      call `exit (0)`.
      
      Note that function depends on the [current locale][setlocale] for
      automatic character set conversion of string and filename
      arguments.
  
      Params:
        argv = a pointer to the array of command line arguments
      Returns: true if the parsing was successful,
                      false if an error occurred
      Throws: [ErrorWrap]
  */
  bool parse(ref string[] argv)
  {
    bool _retval;
    int _argc;
    if (argv)
      _argc = cast(int)argv.length;

    auto _argv = cast(char**)gMalloc((argv.length) * (char*).sizeof);
    foreach (i, s; argv) _argv[i] = s.toCString!(Yes.Malloc);
    GError *_err;
    _retval = cast(bool)g_option_context_parse(cast(GOptionContext*)this._cPtr, &_argc, &_argv, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    argv.length = _argc;
    foreach (i; 0 .. _argc)
      argv[i] = _argv[i].fromCString!(Yes.Free);
    gFree(cast(void*)_argv);
    return _retval;
  }

  /**
      Parses the command line arguments.
      
      This function is similar to [glib.option_context.OptionContext.parse] except that it
      respects the normal memory rules when dealing with a strv instead of
      assuming that the passed-in array is the argv of the main function.
      
      In particular, strings that are removed from the arguments list will
      be freed using [glib.global.gfree].
      
      On Windows, the strings are expected to be in UTF-8.  This is in
      contrast to [glib.option_context.OptionContext.parse] which expects them to be in the
      system codepage, which is how they are passed as argv to main().
      See g_win32_get_command_line() for a solution.
      
      This function is useful if you are trying to use #GOptionContext with
      #GApplication.
  
      Params:
        arguments = a pointer
             to the command line arguments (which must be in UTF-8 on Windows).
             Starting with GLib 2.62, arguments can be null, which matches
             [glib.option_context.OptionContext.parse].
      Returns: true if the parsing was successful,
                 false if an error occurred
      Throws: [ErrorWrap]
  */
  bool parseStrv(ref string[] arguments)
  {
    bool _retval;
    auto _arguments = cast(char**)gMalloc((arguments.length + 1) * (char*).sizeof);
    foreach (i, s; arguments) _arguments[i] = s.toCString!(Yes.Malloc);
    GError *_err;
    _retval = cast(bool)g_option_context_parse_strv(cast(GOptionContext*)this._cPtr, &_arguments, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    uint _lenarguments;
    if (_arguments)
    {
      for (; _arguments[_lenarguments] !is null; _lenarguments++)
      {
      }
    }

    arguments.length = _lenarguments;
    foreach (i; 0 .. _lenarguments)
      arguments[i] = _arguments[i].fromCString!(Yes.Free);
    gFree(cast(void*)_arguments);
    return _retval;
  }

  /**
      Adds a string to be displayed in `--help` output after the list
      of options. This text often includes a bug reporting address.
      
      Note that the summary is translated (see
      [glib.option_context.OptionContext.setTranslateFunc]).
  
      Params:
        description = a string to be shown in `--help` output
            after the list of options, or null
  */
  void setDescription(string description = null) nothrow
  {
    const(char)* _description = description.toCString!(No.Malloc, Yes.Nullable);
    g_option_context_set_description(cast(GOptionContext*)this._cPtr, _description);
  }

  /**
      Enables or disables automatic generation of `--help` output.
      By default, [glib.option_context.OptionContext.parse] recognizes `--help`, `-h`,
      `-?`, `--help-all` and `--help-groupname` and creates suitable
      output to stdout.
  
      Params:
        helpEnabled = true to enable `--help`, false to disable it
  */
  void setHelpEnabled(bool helpEnabled) nothrow
  {
    g_option_context_set_help_enabled(cast(GOptionContext*)this._cPtr, helpEnabled);
  }

  /**
      Sets whether to ignore unknown options or not. If an argument is
      ignored, it is left in the argv array after parsing. By default,
      [glib.option_context.OptionContext.parse] treats unknown options as error.
      
      This setting does not affect non-option arguments (i.e. arguments
      which don't start with a dash). But note that GOption cannot reliably
      determine whether a non-option belongs to a preceding unknown option.
  
      Params:
        ignoreUnknown = true to ignore unknown options, false to produce
             an error when unknown options are met
  */
  void setIgnoreUnknownOptions(bool ignoreUnknown) nothrow
  {
    g_option_context_set_ignore_unknown_options(cast(GOptionContext*)this._cPtr, ignoreUnknown);
  }

  /**
      Sets a #GOptionGroup as main group of the context.
      This has the same effect as calling [glib.option_context.OptionContext.addGroup],
      the only difference is that the options in the main group are
      treated differently when generating `--help` output.
  
      Params:
        group = the group to set as main group
  */
  void setMainGroup(glib.option_group.OptionGroup group) nothrow
  {
    g_option_context_set_main_group(cast(GOptionContext*)this._cPtr, group ? cast(GOptionGroup*)group._cPtr(Yes.Dup) : null);
  }

  /**
      Sets strict POSIX mode.
      
      By default, this mode is disabled.
      
      In strict POSIX mode, the first non-argument parameter encountered
      (eg: filename) terminates argument processing.  Remaining arguments
      are treated as non-options and are not attempted to be parsed.
      
      If strict POSIX mode is disabled then parsing is done in the GNU way
      where option arguments can be freely mixed with non-options.
      
      As an example, consider "ls foo -l".  With GNU style parsing, this
      will list "foo" in long mode.  In strict POSIX style, this will list
      the files named "foo" and "-l".
      
      It may be useful to force strict POSIX mode when creating "verb
      style" command line tools.  For example, the "gsettings" command line
      tool supports the global option "--schemadir" as well as many
      subcommands ("get", "set", etc.) which each have their own set of
      arguments.  Using strict POSIX mode will allow parsing the global
      options up to the verb name while leaving the remaining options to be
      parsed by the relevant subcommand (which can be determined by
      examining the verb name, which should be present in argv[1] after
      parsing).
  
      Params:
        strictPosix = the new value
  */
  void setStrictPosix(bool strictPosix) nothrow
  {
    g_option_context_set_strict_posix(cast(GOptionContext*)this._cPtr, strictPosix);
  }

  /**
      Adds a string to be displayed in `--help` output before the list
      of options. This is typically a summary of the program functionality.
      
      Note that the summary is translated (see
      [glib.option_context.OptionContext.setTranslateFunc] and
      [glib.option_context.OptionContext.setTranslationDomain]).
  
      Params:
        summary = a string to be shown in `--help` output
           before the list of options, or null
  */
  void setSummary(string summary = null) nothrow
  {
    const(char)* _summary = summary.toCString!(No.Malloc, Yes.Nullable);
    g_option_context_set_summary(cast(GOptionContext*)this._cPtr, _summary);
  }

  /**
      A convenience function to use gettext() for translating
      user-visible strings.
  
      Params:
        domain = the domain to use
  */
  void setTranslationDomain(string domain) nothrow
  {
    const(char)* _domain = domain.toCString!(No.Malloc, No.Nullable);
    g_option_context_set_translation_domain(cast(GOptionContext*)this._cPtr, _domain);
  }
}
