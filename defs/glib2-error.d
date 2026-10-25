//!class ErrorWrap pre
//!kind ErrorWrap Wrap
//!inhibit init funcs

public import std.typecons : Flag, No, Yes;

import glib.types;

class ErrorWrap : Exception
{
  private GError* errPtr;

  /** */
  this(void* err, Flag!"Take" take) nothrow
  {
    assert(err !is null);

    if (take)
      errPtr = cast(GError*)err;
    else
      errPtr = g_error_copy(cast(GError*)err);

    super(errPtr.message.fromCString);
  }

  /** */
  this(Quark domain, int code, string message) nothrow
  {
    this(g_error_new_literal(domain, code, message.toCString), Yes.Take);
  }

  ~this() nothrow
  {
    if (errPtr)
      g_error_free(errPtr);
  }

  /**
   * Get wrapped C GError pointer.
   * Params:
   *   dup = Yes.Dup to duplicate the GError, No.Dup to get it directly (default)
   */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow @nogc
  {
    auto copyFn = cast(GError* function(const(GError)*) @nogc nothrow)&g_error_copy;
    return cast(void*)((dup && errPtr) ? copyFn(errPtr) : errPtr);
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
    return new ErrorWrap(domain, code, message);
  }

  /**
   * Copy an `ErrorWrap` object.
   */
  ErrorWrap copy() nothrow
  {
    return new ErrorWrap(cast(void*)errPtr, No.Take);
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
