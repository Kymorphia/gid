/// Module for [OptionContext] class
module glib.option_context;

import gid.gid;
import glib.c.functions;
import glib.c.types;
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
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.option_context.OptionContext");

    _cInstancePtr = cast(GOptionContext*)ptr;

    owned = take;
  }

  ~this()
  {
    if (owned)
      g_option_context_free(_cInstancePtr);
  }

  /** */
  void* _cPtr()
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
  void addGroup(glib.option_group.OptionGroup group)
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
  void addMainEntries(glib.types.OptionEntry[] entries, string translationDomain = null)
  {
    auto _entries = cast(const(GOptionEntry)*)(entries ~ GOptionEntry.init).ptr;
    const(char)* _translationDomain = translationDomain.toCString(No.Alloc);
    g_option_context_add_main_entries(cast(GOptionContext*)this._cPtr, _entries, _translationDomain);
  }

  /**
      Returns the description. See [glib.option_context.OptionContext.setDescription].
      Returns: the description
  */
  string getDescription()
  {
    const(char)* _cretval;
    _cretval = g_option_context_get_description(cast(GOptionContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  string getHelp(bool mainHelp, glib.option_group.OptionGroup group = null)
  {
    char* _cretval;
    _cretval = g_option_context_get_help(cast(GOptionContext*)this._cPtr, mainHelp, group ? cast(GOptionGroup*)group._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns whether automatic `--help` generation
      is turned on for context. See [glib.option_context.OptionContext.setHelpEnabled].
      Returns: true if automatic help generation is turned on.
  */
  bool getHelpEnabled()
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
  bool getIgnoreUnknownOptions()
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
  glib.option_group.OptionGroup getMainGroup()
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
  bool getStrictPosix()
  {
    bool _retval;
    _retval = cast(bool)g_option_context_get_strict_posix(cast(GOptionContext*)this._cPtr);
    return _retval;
  }

  /**
      Returns the summary. See [glib.option_context.OptionContext.setSummary].
      Returns: the summary
  */
  string getSummary()
  {
    const(char)* _cretval;
    _cretval = g_option_context_get_summary(cast(GOptionContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  void setDescription(string description = null)
  {
    const(char)* _description = description.toCString(No.Alloc);
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
  void setHelpEnabled(bool helpEnabled)
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
  void setIgnoreUnknownOptions(bool ignoreUnknown)
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
  void setMainGroup(glib.option_group.OptionGroup group)
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
  void setStrictPosix(bool strictPosix)
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
  void setSummary(string summary = null)
  {
    const(char)* _summary = summary.toCString(No.Alloc);
    g_option_context_set_summary(cast(GOptionContext*)this._cPtr, _summary);
  }

  /**
      Sets the function which is used to translate the contexts
      user-visible strings, for `--help` output. If func is null,
      strings are not translated.
      
      Note that option groups have their own translation functions,
      this function only affects the parameter_string (see [glib.option_context.OptionContext.new_]),
      the summary (see [glib.option_context.OptionContext.setSummary]) and the description
      (see [glib.option_context.OptionContext.setDescription]).
      
      If you are using gettext(), you only need to set the translation
      domain, see [glib.option_context.OptionContext.setTranslationDomain].
  
      Params:
        func = the #GTranslateFunc, or null
  */
  void setTranslateFunc(glib.types.TranslateFunc func = null)
  {
    extern(C) const(char)* _funcCallback(const(char)* str, void* data)
    {
      string _dretval;
      auto _dlg = cast(glib.types.TranslateFunc*)data;
      string _str = str.fromCString(No.Free);

      _dretval = (*_dlg)(_str);
      auto _retval = _dretval.toCString(Yes.Alloc);

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    g_option_context_set_translate_func(cast(GOptionContext*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      A convenience function to use gettext() for translating
      user-visible strings.
  
      Params:
        domain = the domain to use
  */
  void setTranslationDomain(string domain)
  {
    const(char)* _domain = domain.toCString(No.Alloc);
    g_option_context_set_translation_domain(cast(GOptionContext*)this._cPtr, _domain);
  }
}
