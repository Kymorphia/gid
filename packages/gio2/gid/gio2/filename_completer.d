/// Module for [FilenameCompleter] class
module gid.gio2.filename_completer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    Completes partial file and directory names given a partial string by
    looking in the file system for clues. Can return a list of possible
    completion strings for widget implementations.
*/
class FilenameCompleter : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_filename_completer_get_type != &gidSymbolNotFound ? g_filename_completer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GFilenameCompleter";
  }

  /** Returns `this`, for use in `with` statements. */
  override FilenameCompleter self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.filename_completer.FilenameCompleter]
      Returns: New builder object
  */
  static FilenameCompleterGidBuilder builder() nothrow
  {
    return new FilenameCompleterGidBuilder;
  }

  /**
      Creates a new filename completer.
      Returns: a #GFilenameCompleter.
  */
  this() nothrow
  {
    GFilenameCompleter* _cretval;
    _cretval = g_filename_completer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Obtains a suffix completion for initial_text from completer.
      
      Suffix will be an empty string if there's no shared suffix among matching
      completions. If there's no matching completions anyway, `NULL` is returned.
  
      Params:
        initialText = text to be completed.
      Returns: a suffix completion string, or `NULL` if no
            completion exists.
  */
  string getCompletionSuffix(string initialText) nothrow
  {
    char* _cretval;
    const(char)* _initialText = initialText.toCString!(No.Malloc, No.Nullable);
    _cretval = g_filename_completer_get_completion_suffix(cast(GFilenameCompleter*)this._cPtr, _initialText);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets an array of completion strings for a given initial text.
  
      Params:
        initialText = text to be completed.
      Returns: array of strings with possible completions for initial_text.
        This array must be freed by [gid.glib2.global.strfreev] when finished.
  */
  string[] getCompletions(string initialText) nothrow
  {
    char** _cretval;
    const(char)* _initialText = initialText.toCString!(No.Malloc, No.Nullable);
    _cretval = g_filename_completer_get_completions(cast(GFilenameCompleter*)this._cPtr, _initialText);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      If dirs_only is true, completer will only
      complete directory names, and not file names.
      
      This function needs to be called before waiting for results from the
      completer to be populated.
  
      Params:
        dirsOnly = a #gboolean.
  */
  void setDirsOnly(bool dirsOnly) nothrow
  {
    g_filename_completer_set_dirs_only(cast(GFilenameCompleter*)this._cPtr, dirsOnly);
  }

  /**
      Connect to `GotCompletionData` signal.
  
      Emitted when the file name completion information comes available.
  
      Params:
        callback = signal callback delegate or function to connect
  
          `void callback(gid.gio2.filename_completer.FilenameCompleter filenameCompleter)`
  
          `filenameCompleter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectGotCompletionData(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gio2.filename_completer.FilenameCompleter)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData) nothrow
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      try
      {
        _dClosure.cb(_paramTuple[]);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.filename_completer.FilenameCompleter.gotCompletionData");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-completion-data", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gio2.filename_completer.FilenameCompleter]
class FilenameCompleterGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.filename_completer.FilenameCompleter]
final class FilenameCompleterGidBuilder : FilenameCompleterGidBuilderImpl!FilenameCompleterGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilenameCompleter build() nothrow
  {
    return new FilenameCompleter(cast(void*)createGObject(FilenameCompleter._getGType), Yes.Take);
  }
}
