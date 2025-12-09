/// Module for [FilenameCompleter] class
module gio.filename_completer;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import gobject.dclosure;
import gobject.object;

/**
    Completes partial file and directory names given a partial string by
    looking in the file system for clues. Can return a list of possible
    completion strings for widget implementations.
*/
class FilenameCompleter : gobject.object.ObjectWrap
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
    return cast(void function())g_filename_completer_get_type != &gidSymbolNotFound ? g_filename_completer_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilenameCompleter self()
  {
    return this;
  }

  /**
      Creates a new filename completer.
      Returns: a #GFilenameCompleter.
  */
  this()
  {
    GFilenameCompleter* _cretval;
    _cretval = g_filename_completer_new();
    this(_cretval, Yes.Take);
  }

  /**
      Obtains a completion for initial_text from completer.
  
      Params:
        initialText = text to be completed.
      Returns: a completed string, or null if no
            completion exists. This string is not owned by GIO, so remember to [glib.global.gfree]
            it when finished.
  */
  string getCompletionSuffix(string initialText)
  {
    char* _cretval;
    const(char)* _initialText = initialText.toCString(No.Alloc);
    _cretval = g_filename_completer_get_completion_suffix(cast(GFilenameCompleter*)this._cPtr, _initialText);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets an array of completion strings for a given initial text.
  
      Params:
        initialText = text to be completed.
      Returns: array of strings with possible completions for initial_text.
        This array must be freed by [glib.global.strfreev] when finished.
  */
  string[] getCompletions(string initialText)
  {
    char** _cretval;
    const(char)* _initialText = initialText.toCString(No.Alloc);
    _cretval = g_filename_completer_get_completions(cast(GFilenameCompleter*)this._cPtr, _initialText);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      If dirs_only is true, completer will only
      complete directory names, and not file names.
  
      Params:
        dirsOnly = a #gboolean.
  */
  void setDirsOnly(bool dirsOnly)
  {
    g_filename_completer_set_dirs_only(cast(GFilenameCompleter*)this._cPtr, dirsOnly);
  }

  /**
      Connect to `GotCompletionData` signal.
  
      Emitted when the file name completion information comes available.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.filename_completer.FilenameCompleter filenameCompleter))
  
          `filenameCompleter` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectGotCompletionData(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.filename_completer.FilenameCompleter)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("got-completion-data", closure, after);
  }
}
