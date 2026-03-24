/// Module for [ExceptionWrap] class
module javascriptcore.exception;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import javascriptcore.c.functions;
import javascriptcore.c.types;
import javascriptcore.context;
import javascriptcore.types;

/**
    JSCException represents a JavaScript exception.
*/
class ExceptionWrap : gobject.object.ObjectWrap
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
    return cast(void function())jsc_exception_get_type != &gidSymbolNotFound ? jsc_exception_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExceptionWrap self()
  {
    return this;
  }

  /**
  Get builder for [javascriptcore.exception.ExceptionWrap]
  Returns: New builder object
  */
  static ExceptionWrapGidBuilder builder()
  {
    return new ExceptionWrapGidBuilder;
  }

  /**
      Create a new #JSCException in context with message.
  
      Params:
        context = a #JSCContext
        message = the error message
      Returns: a new #JSCException.
  */
  this(javascriptcore.context.Context context, string message)
  {
    JSCException* _cretval;
    const(char)* _message = message.toCString(No.Alloc);
    _cretval = jsc_exception_new(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, _message);
    this(_cretval, Yes.Take);
  }

  /**
      Create a new #JSCException in context with name and message.
  
      Params:
        context = a #JSCContext
        name = the error name
        message = the error message
      Returns: a new #JSCException.
  */
  static javascriptcore.exception.ExceptionWrap newWithName(javascriptcore.context.Context context, string name, string message)
  {
    JSCException* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    const(char)* _message = message.toCString(No.Alloc);
    _cretval = jsc_exception_new_with_name(context ? cast(JSCContext*)context._cPtr(No.Dup) : null, _name, _message);
    auto _retval = gobject.object.ObjectWrap._getDObject!(javascriptcore.exception.ExceptionWrap)(cast(JSCException*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get a string with the exception backtrace.
      Returns: the exception backtrace string or null.
  */
  string getBacktraceString()
  {
    const(char)* _cretval;
    _cretval = jsc_exception_get_backtrace_string(cast(JSCException*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the column number at which exception happened.
      Returns: the column number of exception.
  */
  uint getColumnNumber()
  {
    uint _retval;
    _retval = jsc_exception_get_column_number(cast(JSCException*)this._cPtr);
    return _retval;
  }

  /**
      Get the line number at which exception happened.
      Returns: the line number of exception.
  */
  uint getLineNumber()
  {
    uint _retval;
    _retval = jsc_exception_get_line_number(cast(JSCException*)this._cPtr);
    return _retval;
  }

  /**
      Get the error message of exception.
      Returns: the exception error message.
  */
  string getMessage()
  {
    const(char)* _cretval;
    _cretval = jsc_exception_get_message(cast(JSCException*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the error name of exception
      Returns: the exception error name.
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = jsc_exception_get_name(cast(JSCException*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the source URI of exception.
      Returns: the the source URI of exception, or null.
  */
  string getSourceUri()
  {
    const(char)* _cretval;
    _cretval = jsc_exception_get_source_uri(cast(JSCException*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Return a report message of exception, containing all the possible details such us
      source URI, line, column and backtrace, and formatted to be printed.
      Returns: a new string with the exception report
  */
  string report()
  {
    char* _cretval;
    _cretval = jsc_exception_report(cast(JSCException*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the string representation of exception error.
      Returns: the string representation of exception.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = jsc_exception_to_string(cast(JSCException*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}

class ExceptionWrapGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [javascriptcore.exception.ExceptionWrap]
final class ExceptionWrapGidBuilder : ExceptionWrapGidBuilderImpl!ExceptionWrapGidBuilder
{
  ExceptionWrap build()
  {
    return new ExceptionWrap(cast(void*)createGObject(ExceptionWrap._getGType), Yes.Take);
  }
}
