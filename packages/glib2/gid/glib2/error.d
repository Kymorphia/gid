/// Module for [ErrorWrap] class
module gid.glib2.error;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.types;


public import std.typecons : Flag, No, Yes;

import gid.glib2.types;

/**
    The [gid.glib2.error.ErrorWrap] structure contains information about
    an error that has occurred.
*/
class ErrorWrap : Exception
{
  private GError* _cInstancePtr;

  /** */
  this(void* err, Flag!"Take" take) nothrow
  {
    assert(err !is null);

    if (take)
      _cInstancePtr = cast(GError*)err;
    else
      _cInstancePtr = g_error_copy(cast(GError*)err);

    super(_cInstancePtr.message.fromCString);
  }

  /** */
  this(Quark domain, int code, string message) nothrow
  {
    this(g_error_new_literal(domain, code, message.toCString), Yes.Take);
  }

  ~this() nothrow
  {
    if (_cInstancePtr)
      g_error_free(_cInstancePtr);
  }

  /**
  * Get wrapped C GError pointer.
  * Params:
  *   dup = Yes.Dup to duplicate the GError, No.Dup to get it directly (default)
  */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow @nogc
  {
    auto copyFn = cast(GError* function(const(GError)*) @nogc nothrow)g_error_copy;
    return cast(void*)((dup && _cInstancePtr) ? copyFn(_cInstancePtr) : _cInstancePtr);
  }

  /**
  * Steal the wrapped C GError, transferring ownership to the caller (see gid.core.wrap.GidWrap._cSteal). The exception
  * is left without a GError, so it must not be used afterwards.
  * Returns: The C GError pointer, owned by the caller
  */
  void* _cSteal() nothrow @nogc
  {
    auto ptr = cast(void*)_cInstancePtr;
    _cInstancePtr = null;
    return ptr;
  }

  /**
  * Get error domain quark.
  * Returns: Error domain string quark
  */
  @property Quark domain() nothrow @nogc
  {
    return _cInstancePtr.domain;
  }

  /**
  * Set error domain quark.
  * Params:
  *   propval = Quark value to assign
  */
  @property void domain(Quark propval) nothrow @nogc
  {
    _cInstancePtr.domain = propval;
  }

  /**
  * Get error code.
  * Returns: Error code
  */
  @property int code() nothrow @nogc
  {
    return _cInstancePtr.code;
  }

  /**
  * Set error code.
  * Params:
  *   propval = Error code to assign
  */
  @property void code(int propval) nothrow @nogc
  {
    _cInstancePtr.code = propval;
  }

  /**
  * Get Error message.
  * Returns: Error message string
  */
  @property string message() nothrow
  {
    return _cInstancePtr.message.fromCString;
  }

  /**
  * Set error message.
  * Params:
  *   propval = Error message to assign
  */
  @property void message(string propval) nothrow
  {
    g_free(cast(void*)_cInstancePtr.message);
    _cInstancePtr.message = toCString!(Yes.Malloc)(propval);
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
    return new ErrorWrap(cast(void*)_cInstancePtr, No.Take);
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
    _retval = cast(bool)g_error_matches(_cInstancePtr, domain, code);
    return _retval;
  }
}
