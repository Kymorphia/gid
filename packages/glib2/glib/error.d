/// Module for [ErrorWrap] class
module glib.error;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;


import glib.types;

/**
    The [glib.error.ErrorWrap] structure contains information about
    an error that has occurred.
*/
class ErrorWrap : Exception
{
  private GError* errPtr;

  /** */
  this(void* err, bool unused=false) nothrow
  {
    errPtr = cast(GError*)err;
    super(errPtr.message.fromCString);
  }

  /** */
  this(Quark domain, int code, string message) nothrow
  {
    this(g_error_new_literal(domain, code, message.toCString));
  }

  /** */
  this() nothrow
  {
    super("");
  }

  ~this() nothrow
  {
    g_error_free(errPtr);
  }

  /**
  * Get wrapped C GError pointer.
  */
  void* _cPtr() nothrow @nogc
  {
    return cast(void*)errPtr;
  }

  /**
  * Get error domain quark.
  * Returns: Error domain string quark
  */
  @property Quark domain() nothrow @nogc
  {
    return errPtr.domain;
  }

  /**
  * Set error domain quark.
  * Params:
  *   propval = Quark value to assign
  */
  @property void domain(Quark propval) nothrow @nogc
  {
    errPtr.domain = propval;
  }

  /**
  * Get error code.
  * Returns: Error code
  */
  @property int code() nothrow @nogc
  {
    return errPtr.code;
  }

  /**
  * Set error code.
  * Params:
  *   propval = Error code to assign
  */
  @property void code(int propval) nothrow @nogc
  {
    errPtr.code = propval;
  }

  /**
  * Get Error message.
  * Returns: Error message string
  */
  @property string message() nothrow
  {
    return errPtr.message.fromCString;
  }

  /**
  * Set error message.
  * Params:
  *   propval = Error message to assign
  */
  @property void message(string propval) nothrow
  {
    g_free(cast(void*)errPtr.message);
    errPtr.message = toCString!(Yes.Malloc)(propval);
  }

  /**
  * Create a new `ErrorWrap`` object.
  * Params:
  *   domain = Error domain string quark
  *   code = Error code
  *   message = The error message
  * Returns: New `ErrorWrap` object
  */
  static ErrorWrap newLiteral(Quark domain, int code, string message) nothrow
  {
    GError* _cretval;
    const(char)* _message = message.toCString;
    _cretval = g_error_new_literal(domain, code, _message);
    ErrorWrap _retval = new ErrorWrap(cast(GError*)_cretval);
    return _retval;
  }

  /**
  * Copy a an `ErrorWrap` object.
  */
  ErrorWrap copy() nothrow
  {
    GError* _cretval;
    _cretval = g_error_copy(errPtr);
    ErrorWrap _retval = new ErrorWrap(cast(GError*)_cretval);
    return _retval;
  }

  /**
  * Check whether @error has `domain` and `code`.
  * Params:
  *   domain = Error domain string quark
  *   code = Error code
  * Returns: true if error matches criteria, false otherwise
  */
  bool matches(Quark domain, int code) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_error_matches(errPtr, domain, code);
    return _retval;
  }
}
