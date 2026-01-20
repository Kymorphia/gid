/// Module for [SnippetContext] class
module gtksource.snippet_context;

import gid.gid;
import gobject.dclosure;
import gobject.object;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    Context for expanding `class@SnippetChunk`.
    
    This class is currently used primary as a hashtable. However, the longer
    term goal is to have it hold onto a `GjsContext` as well as other languages
    so that `class@SnippetChunk` can expand themselves by executing
    script within the context.
    
    The `class@Snippet` will build the context and then expand each of the
    chunks during the insertion/edit phase.
*/
class SnippetContext : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_snippet_context_get_type != &gidSymbolNotFound ? gtk_source_snippet_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SnippetContext self()
  {
    return this;
  }

  /**
      Creates a new #GtkSourceSnippetContext.
      
      Generally, this isn't needed unless you are controlling the
      expansion of snippets manually.
      Returns: a #GtkSourceSnippetContext
  */
  this()
  {
    GtkSourceSnippetContext* _cretval;
    _cretval = gtk_source_snippet_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Removes all variables from the context.
  */
  void clearVariables()
  {
    gtk_source_snippet_context_clear_variables(cast(GtkSourceSnippetContext*)this._cPtr);
  }

  /** */
  string expand(string input)
  {
    char* _cretval;
    const(char)* _input = input.toCString(No.Alloc);
    _cretval = gtk_source_snippet_context_expand(cast(GtkSourceSnippetContext*)this._cPtr, _input);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Gets the current value for a variable named key.
  
      Params:
        key = the name of the variable
      Returns: the value for the variable, or null
  */
  string getVariable(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gtk_source_snippet_context_get_variable(cast(GtkSourceSnippetContext*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Sets a constatnt within the context.
      
      This is similar to a variable set with [gtksource.snippet_context.SnippetContext.setVariable]
      but is expected to not change during use of the snippet.
      
      Examples would be the date or users name.
  
      Params:
        key = the constant name
        value = the value of the constant
  */
  void setConstant(string key, string value)
  {
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    gtk_source_snippet_context_set_constant(cast(GtkSourceSnippetContext*)this._cPtr, _key, _value);
  }

  /** */
  void setLinePrefix(string linePrefix)
  {
    const(char)* _linePrefix = linePrefix.toCString(No.Alloc);
    gtk_source_snippet_context_set_line_prefix(cast(GtkSourceSnippetContext*)this._cPtr, _linePrefix);
  }

  /** */
  void setTabWidth(int tabWidth)
  {
    gtk_source_snippet_context_set_tab_width(cast(GtkSourceSnippetContext*)this._cPtr, tabWidth);
  }

  /** */
  void setUseSpaces(bool useSpaces)
  {
    gtk_source_snippet_context_set_use_spaces(cast(GtkSourceSnippetContext*)this._cPtr, useSpaces);
  }

  /**
      Sets a variable within the context.
      
      This variable may be overridden by future updates to the
      context.
  
      Params:
        key = the variable name
        value = the value for the variable
  */
  void setVariable(string key, string value)
  {
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    gtk_source_snippet_context_set_variable(cast(GtkSourceSnippetContext*)this._cPtr, _key, _value);
  }

  /**
      Connect to `Changed` signal.
  
      The signal is emitted when a change has been
        discovered in one of the chunks of the snippet which has
        caused a variable or other dynamic data within the context
        to have changed.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gtksource.snippet_context.SnippetContext snippetContext))
  
          `snippetContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectChanged(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gtksource.snippet_context.SnippetContext)))
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
    return connectSignalClosure("changed", closure, after);
  }
}
