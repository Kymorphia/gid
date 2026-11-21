/// Module for [SnippetContext] class
module gid.gtksource5.snippet_context;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.dclosure;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    Context for expanding [gid.gtksource5.snippet_chunk.SnippetChunk].
    
    This class is currently used primary as a hashtable. However, the longer
    term goal is to have it hold onto a `GjsContext` as well as other languages
    so that [gid.gtksource5.snippet_chunk.SnippetChunk] can expand themselves by executing
    script within the context.
    
    The [gid.gtksource5.snippet.Snippet] will build the context and then expand each of the
    chunks during the insertion/edit phase.
*/
class SnippetContext : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_snippet_context_get_type != &gidSymbolNotFound ? gtk_source_snippet_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceSnippetContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override SnippetContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.snippet_context.SnippetContext]
      Returns: New builder object
  */
  static SnippetContextGidBuilder builder() nothrow
  {
    return new SnippetContextGidBuilder;
  }

  /**
      Creates a new #GtkSourceSnippetContext.
      
      Generally, this isn't needed unless you are controlling the
      expansion of snippets manually.
      Returns: a #GtkSourceSnippetContext
  */
  this() nothrow
  {
    GtkSourceSnippetContext* _cretval;
    _cretval = gtk_source_snippet_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Removes all variables from the context.
  */
  void clearVariables() nothrow
  {
    gtk_source_snippet_context_clear_variables(cast(GtkSourceSnippetContext*)this._cPtr);
  }

  /** */
  string expand(string input) nothrow
  {
    char* _cretval;
    const(char)* _input = input.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_snippet_context_expand(cast(GtkSourceSnippetContext*)this._cPtr, _input);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Gets the current value for a variable named key.
  
      Params:
        key = the name of the variable
      Returns: the value for the variable, or null
  */
  string getVariable(string key) nothrow
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = gtk_source_snippet_context_get_variable(cast(GtkSourceSnippetContext*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Sets a constatnt within the context.
      
      This is similar to a variable set with [gid.gtksource5.snippet_context.SnippetContext.setVariable]
      but is expected to not change during use of the snippet.
      
      Examples would be the date or users name.
  
      Params:
        key = the constant name
        value = the value of the constant
  */
  void setConstant(string key, string value) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
    gtk_source_snippet_context_set_constant(cast(GtkSourceSnippetContext*)this._cPtr, _key, _value);
  }

  /** */
  void setLinePrefix(string linePrefix) nothrow
  {
    const(char)* _linePrefix = linePrefix.toCString!(No.Malloc, No.Nullable);
    gtk_source_snippet_context_set_line_prefix(cast(GtkSourceSnippetContext*)this._cPtr, _linePrefix);
  }

  /** */
  void setTabWidth(int tabWidth) nothrow
  {
    gtk_source_snippet_context_set_tab_width(cast(GtkSourceSnippetContext*)this._cPtr, tabWidth);
  }

  /** */
  void setUseSpaces(bool useSpaces) nothrow
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
  void setVariable(string key, string value) nothrow
  {
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, No.Nullable);
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
  
          `void callback(gid.gtksource5.snippet_context.SnippetContext snippetContext)`
  
          `snippetContext` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  gulong connectChanged(T)(T callback, Flag!"After" after = No.After) nothrow
  if (isCallable!T
  && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gid.gtksource5.snippet_context.SnippetContext)))
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
        gidInvokeCallbackExceptionHandler(e, "gid.gtksource5.snippet_context.SnippetContext.changed");
      }
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("changed", closure, after);
  }
}

/// Fluent builder implementation template for [gid.gtksource5.snippet_context.SnippetContext]
class SnippetContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gtksource5.snippet_context.SnippetContext]
final class SnippetContextGidBuilder : SnippetContextGidBuilderImpl!SnippetContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SnippetContext build() nothrow
  {
    return new SnippetContext(cast(void*)createGObject(SnippetContext._getGType), Yes.Take);
  }
}
