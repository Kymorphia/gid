/// Global functions for glib2 library
module glib.global;

import gid.gid;
import glib.bytes;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.iochannel;
import glib.source;
import glib.test_suite;
import glib.time_val;
import glib.types;
import glib.variant;
import gobject.types;


/**
    A wrapper for the POSIX access() function. This function is used to
    test a pathname for one or several of read, write or execute
    permissions, or just existence.
    
    On Windows, the file protection mechanism is not at all POSIX-like,
    and the underlying function in the C library only checks the
    FAT-style READONLY attribute, and does not look at the ACL of a
    file at all. This function is this in practise almost useless on
    Windows. Software that needs to handle file permissions on Windows
    more exactly should use the Win32 API.
    
    See your C library manual for more details about access().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      mode = as in access()
    Returns: zero if the pathname refers to an existing file system
          object that has all the tested permissions, or -1 otherwise
          or on error.
*/
int access(string filename, int mode)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_access(_filename, mode);
  return _retval;
}

/**
    This function is similar to [glib.global.gmalloc], allocating (n_blocks * n_block_bytes)
    bytes, but care is taken to align the allocated memory to with the given
    alignment value. Additionally, it will detect possible overflow during
    multiplication.
    
    If the allocation fails (because the system is out of memory),
    the program is terminated.
    
    Aligned memory allocations returned by this function can only be
    freed using [glib.global.alignedFreeSized] or [glib.global.alignedFree].

    Params:
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
      alignment = the alignment to be enforced, which must be a positive power of 2
          and a multiple of `sizeof(void*)`
    Returns: the allocated memory
*/
void* alignedAlloc(size_t nBlocks, size_t nBlockBytes, size_t alignment)
{
  auto _retval = g_aligned_alloc(nBlocks, nBlockBytes, alignment);
  return _retval;
}

/**
    This function is similar to [glib.global.alignedAlloc], but it will
    also clear the allocated memory before returning it.

    Params:
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
      alignment = the alignment to be enforced, which must be a positive power of 2
          and a multiple of `sizeof(void*)`
    Returns: the allocated, cleared memory
*/
void* alignedAlloc0(size_t nBlocks, size_t nBlockBytes, size_t alignment)
{
  auto _retval = g_aligned_alloc0(nBlocks, nBlockBytes, alignment);
  return _retval;
}

/**
    Frees the memory allocated by [glib.global.alignedAlloc].

    Params:
      mem = the memory to deallocate
*/
void alignedFree(void* mem = null)
{
  g_aligned_free(mem);
}

/**
    Frees the memory pointed to by mem, assuming it is has the given size and
    alignment.
    
    If mem is null this is a no-op (and size is ignored).
    
    It is an error if size doesn’t match the size, or alignment doesn’t match
    the alignment, passed when mem was allocated. size and alignment are
    passed to this function to allow optimizations in the allocator. If you
    don’t know either of them, use [glib.global.alignedFree] instead.

    Params:
      mem = the memory to free
      alignment = alignment of mem
      size = size of mem, in bytes
*/
void alignedFreeSized(void* mem, size_t alignment, size_t size)
{
  g_aligned_free_sized(mem, alignment, size);
}

/**
    Determines the numeric value of a character as a decimal digit. If the
    character is not a decimal digit according to `funcGLib.ascii_isdigit`,
    `-1` is returned.
    
    Differs from `funcGLib.unichar_digit_value` because it takes a char, so
    there's no worry about sign extension if characters are signed.

    Params:
      c = an ASCII character
    Returns: the numerical value of `c` if it is a decimal digit, `-1` otherwise
*/
int asciiDigitValue(char c)
{
  int _retval;
  _retval = g_ascii_digit_value(c);
  return _retval;
}

/**
    Converts a `gdouble` to a string, using the '.' as
    decimal point.
    
    This function generates enough precision that converting
    the string back using `funcGLib.ascii_strtod` gives the same machine-number
    (on machines with IEEE compatible 64bit doubles). It is
    guaranteed that the size of the resulting string will never
    be larger than [glib.types.ASCII_DTOSTR_BUF_SIZE] bytes, including the terminating
    nul character, which is always added.

    Params:
      buffer = a buffer to place the resulting string in
      d = the value to convert
*/
void asciiDtostr(ref char[] buffer, double d)
{
  int _bufLen;
  _bufLen = cast(int)buffer.length;
  g_ascii_dtostr(buffer.ptr, _bufLen, d);
}

/**
    Converts a `gdouble` to a string, using the '.' as
    decimal point. To format the number you pass in
    a `printf()`-style format string. Allowed conversion
    specifiers are 'e', 'E', 'f', 'F', 'g' and 'G'.
    
    The format must just be a single format specifier
    starting with `%`, expecting a `gdouble` argument.
    
    The returned buffer is guaranteed to be nul-terminated.
    
    If you just want to want to serialize the value into a
    string, use `funcGLib.ascii_dtostr`.

    Params:
      buffer = a buffer to place the resulting string in
      format = the `printf()`-style format to use for the
          code to use for converting
      d = the value to convert
*/
void asciiFormatd(ref char[] buffer, string format, double d)
{
  int _bufLen;
  _bufLen = cast(int)buffer.length;
  const(char)* _format = format.toCString(No.Alloc);
  g_ascii_formatd(buffer.ptr, _bufLen, _format, d);
}

/**
    Compare two strings, ignoring the case of ASCII characters.
    
    Unlike the BSD `strcasecmp()` function, this only recognizes standard
    ASCII letters and ignores the locale, treating all non-ASCII
    bytes as if they are not letters.
    
    This function should be used only on strings that are known to be
    in encodings where the bytes corresponding to ASCII letters always
    represent themselves. This includes UTF-8 and the ISO-8859-*
    charsets, but not for instance double-byte encodings like the
    Windows Codepage 932, where the trailing bytes of double-byte
    characters include all ASCII letters. If you compare two CP932
    strings using this function, you will get false matches.
    
    Both s1 and s2 must be non-`NULL`.

    Params:
      s1 = string to compare with s2
      s2 = string to compare with s1
    Returns: 0 if the strings match, a negative value if s1 < s2,
        or a positive value if s1 > s2
*/
int asciiStrcasecmp(string s1, string s2)
{
  int _retval;
  const(char)* _s1 = s1.toCString(No.Alloc);
  const(char)* _s2 = s2.toCString(No.Alloc);
  _retval = g_ascii_strcasecmp(_s1, _s2);
  return _retval;
}

/**
    Converts all upper case ASCII letters to lower case ASCII letters, with
    semantics that exactly match `funcGLib.ascii_tolower`.

    Params:
      str = a string
    Returns: a newly-allocated string, with all the upper case characters in
        str converted to lower case. (Note that this is unlike the old
        `funcGLib.strdown`, which modified the string in place.)
*/
string asciiStrdown(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_ascii_strdown(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    A convenience function for converting a string to a signed number.
    
    This function assumes that str contains only a number of the given
    base that is within inclusive bounds limited by min and max. If
    this is true, then the converted number is stored in out_num. An
    empty string is not a valid input. A string with leading or
    trailing whitespace is also an invalid input.
    
    base can be between 2 and 36 inclusive. Hexadecimal numbers must
    not be prefixed with "0x" or "0X". Such a problem does not exist
    for octal numbers, since they were usually prefixed with a zero
    which does not change the value of the parsed number.
    
    Parsing failures result in an error with the `G_NUMBER_PARSER_ERROR`
    domain. If the input is invalid, the error code will be
    `errorGLib.NumberParserError.INVALID`. If the parsed number is out of
    bounds - `errorGLib.NumberParserError.OUT_OF_BOUNDS`.
    
    See `funcGLib.ascii_strtoll` if you have more complex needs such as
    parsing a string which starts with a number, but then has other
    characters.

    Params:
      str = a string to convert
      base = base of a parsed number
      min = a lower bound (inclusive)
      max = an upper bound (inclusive)
      outNum = a return location for a number
    Returns: true if str was a number, false otherwise
    Throws: [ErrorWrap]
*/
bool asciiStringToSigned(string str, uint base, long min, long max, out long outNum)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)g_ascii_string_to_signed(_str, base, min, max, cast(long*)&outNum, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    A convenience function for converting a string to an unsigned number.
    
    This function assumes that str contains only a number of the given
    base that is within inclusive bounds limited by min and max. If
    this is true, then the converted number is stored in out_num. An
    empty string is not a valid input. A string with leading or
    trailing whitespace is also an invalid input. A string with a leading sign
    (`-` or `+`) is not a valid input for the unsigned parser.
    
    base can be between 2 and 36 inclusive. Hexadecimal numbers must
    not be prefixed with "0x" or "0X". Such a problem does not exist
    for octal numbers, since they were usually prefixed with a zero
    which does not change the value of the parsed number.
    
    Parsing failures result in an error with the `G_NUMBER_PARSER_ERROR`
    domain. If the input is invalid, the error code will be
    `errorGLib.NumberParserError.INVALID`. If the parsed number is out of
    bounds - `errorGLib.NumberParserError.OUT_OF_BOUNDS`.
    
    See `funcGLib.ascii_strtoull` if you have more complex needs such as
    parsing a string which starts with a number, but then has other
    characters.

    Params:
      str = a string
      base = base of a parsed number
      min = a lower bound (inclusive)
      max = an upper bound (inclusive)
      outNum = a return location for a number
    Returns: true if str was a number, false otherwise
    Throws: [ErrorWrap]
*/
bool asciiStringToUnsigned(string str, uint base, ulong min, ulong max, out ulong outNum)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)g_ascii_string_to_unsigned(_str, base, min, max, cast(ulong*)&outNum, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Compare s1 and s2, ignoring the case of ASCII characters and any
    characters after the first `n` in each string. If either string is
    less than `n` bytes long, comparison will stop at the first nul byte
    encountered.
    
    Unlike the BSD `strncasecmp()` function, this only recognizes standard
    ASCII letters and ignores the locale, treating all non-ASCII
    characters as if they are not letters.
    
    The same warning as in `funcGLib.ascii_strcasecmp` applies: Use this
    function only on strings known to be in encodings where bytes
    corresponding to ASCII letters always represent themselves.

    Params:
      s1 = string to compare with s2
      s2 = string to compare with s1
      n = number of characters to compare
    Returns: 0 if the strings match, a negative value if s1 < s2,
        or a positive value if s1 > s2
*/
int asciiStrncasecmp(string s1, string s2, size_t n)
{
  int _retval;
  const(char)* _s1 = s1.toCString(No.Alloc);
  const(char)* _s2 = s2.toCString(No.Alloc);
  _retval = g_ascii_strncasecmp(_s1, _s2, n);
  return _retval;
}

/**
    Converts a string to a floating point value.
    
    This function behaves like the standard `strtod()` function
    does in the C locale. It does this without actually changing
    the current locale, since that would not be thread-safe.
    A limitation of the implementation is that this function
    will still accept localized versions of infinities and NANs.
    
    This function is typically used when reading configuration
    files or other non-user input that should be locale independent.
    To handle input from the user you should normally use the
    locale-sensitive system `strtod()` function.
    
    To convert from a gdouble to a string in a locale-insensitive
    way, use `funcGLib.ascii_dtostr`.
    
    If the correct value would cause overflow, plus or minus `HUGE_VAL`
    is returned (according to the sign of the value), and `ERANGE` is
    stored in `errno`. If the correct value would cause underflow,
    zero is returned and `ERANGE` is stored in `errno`.
    
    This function resets `errno` before calling `strtod()` so that
    you can reliably detect overflow and underflow.

    Params:
      nptr = the string to convert to a numeric value
      endptr = if non-`NULL`, it returns the
          character after the last character used in the conversion
    Returns: the converted value
*/
double asciiStrtod(string nptr, out string endptr)
{
  double _retval;
  const(char)* _nptr = nptr.toCString(No.Alloc);
  char* _endptr;
  _retval = g_ascii_strtod(_nptr, &_endptr);
  endptr = _endptr.fromCString(No.Free);
  return _retval;
}

/**
    Converts a string to a [gst.types.long] value.
    
    This function behaves like the standard `strtoll()` function
    does in the C locale. It does this without actually
    changing the current locale, since that would not be
    thread-safe.
    
    This function is typically used when reading configuration
    files or other non-user input that should be locale independent.
    To handle input from the user you should normally use the
    locale-sensitive system `strtoll()` function.
    
    If the correct value would cause overflow, [glib.types.MAXINT64] or
    [glib.types.MININT64] is returned, and `ERANGE` is stored in `errno`.
    If the base is outside the valid range, zero is returned, and
    `EINVAL` is stored in `errno`. If the
    string conversion fails, zero is returned, and endptr returns nptr
    (if endptr is non-`NULL`).

    Params:
      nptr = the string to convert to a numeric value
      endptr = if non-`NULL`, it returns the
          character after the last character used in the conversion
      base = to be used for the conversion, 2..36 or 0
    Returns: the converted value, or zero on error
*/
long asciiStrtoll(string nptr, out string endptr, uint base)
{
  long _retval;
  const(char)* _nptr = nptr.toCString(No.Alloc);
  char* _endptr;
  _retval = g_ascii_strtoll(_nptr, &_endptr, base);
  endptr = _endptr.fromCString(No.Free);
  return _retval;
}

/**
    Converts a string to a [gst.types.ulong] value.
    
    This function behaves like the standard `strtoull()` function
    does in the C locale. It does this without actually
    changing the current locale, since that would not be
    thread-safe.
    
    Note that input with a leading minus sign (`-`) is accepted, and will return
    the negation of the parsed number, unless that would overflow a [gst.types.ulong].
    Critically, this means you cannot assume that a short fixed length input will
    result in a low return value, as the input could have a leading `-`.
    
    This function is typically used when reading configuration
    files or other non-user input that should be locale independent.
    To handle input from the user you should normally use the
    locale-sensitive system `strtoull()` function.
    
    If the correct value would cause overflow, [glib.types.MAXUINT64]
    is returned, and `ERANGE` is stored in `errno`.
    If the base is outside the valid range, zero is returned, and
    `EINVAL` is stored in `errno`.
    If the string conversion fails, zero is returned, and endptr returns
    nptr (if endptr is non-`NULL`).

    Params:
      nptr = the string to convert to a numeric value
      endptr = if non-`NULL`, it returns the
          character after the last character used in the conversion
      base = to be used for the conversion, 2..36 or 0
    Returns: the converted value, or zero on error
*/
ulong asciiStrtoull(string nptr, out string endptr, uint base)
{
  ulong _retval;
  const(char)* _nptr = nptr.toCString(No.Alloc);
  char* _endptr;
  _retval = g_ascii_strtoull(_nptr, &_endptr, base);
  endptr = _endptr.fromCString(No.Free);
  return _retval;
}

/**
    Converts all lower case ASCII letters to upper case ASCII letters, with
    semantics that exactly match `funcGLib.ascii_toupper`.

    Params:
      str = a string
    Returns: a newly-allocated string, with all the lower case characters
        in str converted to upper case. (Note that this is unlike the old
        `funcGLib.strup`, which modified the string in place.)
*/
string asciiStrup(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_ascii_strup(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Convert a character to ASCII lower case. If the character is not an
    ASCII upper case letter, it is returned unchanged.
    
    Unlike the standard C library `tolower()` function, this only
    recognizes standard ASCII letters and ignores the locale, returning
    all non-ASCII characters unchanged, even if they are lower case
    letters in a particular character set. Also unlike the standard
    library function, this takes and returns a char, not an int, so
    don't call it on `EOF` but no need to worry about casting to `guchar`
    before passing a possibly non-ASCII character in.

    Params:
      c = any character
    Returns: the result of the conversion
*/
char asciiTolower(char c)
{
  char _retval;
  _retval = g_ascii_tolower(c);
  return _retval;
}

/**
    Convert a character to ASCII upper case. If the character is not an
    ASCII lower case letter, it is returned unchanged.
    
    Unlike the standard C library `toupper()` function, this only
    recognizes standard ASCII letters and ignores the locale, returning
    all non-ASCII characters unchanged, even if they are upper case
    letters in a particular character set. Also unlike the standard
    library function, this takes and returns a char, not an int, so
    don't call it on `EOF` but no need to worry about casting to `guchar`
    before passing a possibly non-ASCII character in.

    Params:
      c = any character
    Returns: the result of the conversion
*/
char asciiToupper(char c)
{
  char _retval;
  _retval = g_ascii_toupper(c);
  return _retval;
}

/**
    Determines the numeric value of a character as a hexadecimal digit. If the
    character is not a hex digit according to `funcGLib.ascii_isxdigit`,
    `-1` is returned.
    
    Differs from `funcGLib.unichar_xdigit_value` because it takes a char, so
    there's no worry about sign extension if characters are signed.
    
    Differs from `funcGLib.unichar_xdigit_value` because it takes a char, so
    there's no worry about sign extension if characters are signed.

    Params:
      c = an ASCII character
    Returns: the numerical value of `c` if it is a hex digit, `-1` otherwise
*/
int asciiXdigitValue(char c)
{
  int _retval;
  _retval = g_ascii_xdigit_value(c);
  return _retval;
}

/** */
void assertWarning(string logDomain, string file, int line, string prettyFunction, string expression)
{
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _prettyFunction = prettyFunction.toCString(No.Alloc);
  const(char)* _expression = expression.toCString(No.Alloc);
  g_assert_warning(_logDomain, _file, line, _prettyFunction, _expression);
}

/** */
void assertionMessage(string domain, string file, int line, string func, string message)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  const(char)* _message = message.toCString(No.Alloc);
  g_assertion_message(_domain, _file, line, _func, _message);
}

/** */
void assertionMessageCmpint(string domain, string file, int line, string func, string expr, ulong arg1, string cmp, ulong arg2, char numtype)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  const(char)* _expr = expr.toCString(No.Alloc);
  const(char)* _cmp = cmp.toCString(No.Alloc);
  g_assertion_message_cmpint(_domain, _file, line, _func, _expr, arg1, _cmp, arg2, numtype);
}

/** */
void assertionMessageCmpstr(string domain, string file, int line, string func, string expr, string arg1, string cmp, string arg2)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  const(char)* _expr = expr.toCString(No.Alloc);
  const(char)* _arg1 = arg1.toCString(No.Alloc);
  const(char)* _cmp = cmp.toCString(No.Alloc);
  const(char)* _arg2 = arg2.toCString(No.Alloc);
  g_assertion_message_cmpstr(_domain, _file, line, _func, _expr, _arg1, _cmp, _arg2);
}

/** */
void assertionMessageCmpstrv(string domain, string file, int line, string func, string expr, string[] arg1, string[] arg2, size_t firstWrongIdx)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  const(char)* _expr = expr.toCString(No.Alloc);
  const(char)*[] _tmparg1;
  foreach (s; arg1)
    _tmparg1 ~= s.toCString(No.Alloc);
  _tmparg1 ~= null;
  const(char*)* _arg1 = _tmparg1.ptr;

  const(char)*[] _tmparg2;
  foreach (s; arg2)
    _tmparg2 ~= s.toCString(No.Alloc);
  _tmparg2 ~= null;
  const(char*)* _arg2 = _tmparg2.ptr;

  g_assertion_message_cmpstrv(_domain, _file, line, _func, _expr, _arg1, _arg2, firstWrongIdx);
}

/** */
void assertionMessageError(string domain, string file, int line, string func, string expr, glib.error.ErrorWrap error, glib.types.Quark errorDomain, int errorCode)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  const(char)* _expr = expr.toCString(No.Alloc);
  g_assertion_message_error(_domain, _file, line, _func, _expr, error ? cast(const(GError)*)error._cPtr : null, errorDomain, errorCode);
}

/**
    Atomically adds val to the value of atomic.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic += val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    Before version 2.30, this function did not return a value
    (but [glib.global.atomicIntExchangeAndAdd] did, and had the same meaning).
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
      val = the value to add
    Returns: the value of atomic before the add, signed
*/
int atomicIntAdd(ref int atomic, int val)
{
  int _retval;
  _retval = g_atomic_int_add(cast(int*)&atomic, val);
  return _retval;
}

/**
    Performs an atomic bitwise 'and' of the value of atomic and val,
    storing the result back in atomic.
    
    This call acts as a full compiler and hardware memory barrier.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic &= val; return tmp; }`.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
      val = the value to 'and'
    Returns: the value of atomic before the operation, unsigned
*/
uint atomicIntAnd(ref uint atomic, uint val)
{
  uint _retval;
  _retval = g_atomic_int_and(cast(uint*)&atomic, val);
  return _retval;
}

/**
    Compares atomic to oldval and, if equal, sets it to newval.
    If atomic was not equal to oldval then no change occurs.
    
    This compare and exchange is done atomically.
    
    Think of this operation as an atomic version of
    `{ if (*atomic == oldval) { *atomic = newval; return TRUE; } else return FALSE; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
      oldval = the value to compare with
      newval = the value to conditionally replace with
    Returns: true if the exchange took place
*/
bool atomicIntCompareAndExchange(ref int atomic, int oldval, int newval)
{
  bool _retval;
  _retval = cast(bool)g_atomic_int_compare_and_exchange(cast(int*)&atomic, oldval, newval);
  return _retval;
}

/**
    Compares atomic to oldval and, if equal, sets it to newval.
    If atomic was not equal to oldval then no change occurs.
    In any case the value of atomic before this operation is stored in preval.
    
    This compare and exchange is done atomically.
    
    Think of this operation as an atomic version of
    `{ *preval = *atomic; if (*atomic == oldval) { *atomic = newval; return TRUE; } else return FALSE; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    See also [glib.global.atomicIntCompareAndExchange]

    Params:
      atomic = a pointer to a #gint or #guint
      oldval = the value to compare with
      newval = the value to conditionally replace with
      preval = the contents of atomic before this operation
    Returns: true if the exchange took place
*/
bool atomicIntCompareAndExchangeFull(ref int atomic, int oldval, int newval, out int preval)
{
  bool _retval;
  _retval = cast(bool)g_atomic_int_compare_and_exchange_full(cast(int*)&atomic, oldval, newval, cast(int*)&preval);
  return _retval;
}

/**
    Decrements the value of atomic by 1.
    
    Think of this operation as an atomic version of
    `{ *atomic -= 1; return (*atomic == 0); }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
    Returns: true if the resultant value is zero
*/
bool atomicIntDecAndTest(ref int atomic)
{
  bool _retval;
  _retval = cast(bool)g_atomic_int_dec_and_test(cast(int*)&atomic);
  return _retval;
}

/**
    Sets the atomic to newval and returns the old value from atomic.
    
    This exchange is done atomically.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic = val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.

    Params:
      atomic = a pointer to a #gint or #guint
      newval = the value to replace with
    Returns: the value of atomic before the exchange, signed
*/
int atomicIntExchange(ref int atomic, int newval)
{
  int _retval;
  _retval = g_atomic_int_exchange(cast(int*)&atomic, newval);
  return _retval;
}

/**
    This function existed before [glib.global.atomicIntAdd] returned the prior
    value of the integer (which it now does).  It is retained only for
    compatibility reasons.  Don't use this function in new code.

    Params:
      atomic = a pointer to a #gint
      val = the value to add
    Returns: the value of atomic before the add, signed

    Deprecated: Use [glib.global.atomicIntAdd] instead.
*/
int atomicIntExchangeAndAdd(ref int atomic, int val)
{
  int _retval;
  _retval = g_atomic_int_exchange_and_add(cast(int*)&atomic, val);
  return _retval;
}

/**
    Gets the current value of atomic.
    
    This call acts as a full compiler and hardware
    memory barrier (before the get).
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
    Returns: the value of the integer
*/
int atomicIntGet(out int atomic)
{
  int _retval;
  _retval = g_atomic_int_get(cast(const(int)*)&atomic);
  return _retval;
}

/**
    Increments the value of atomic by 1.
    
    Think of this operation as an atomic version of `{ *atomic += 1; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
*/
void atomicIntInc(ref int atomic)
{
  g_atomic_int_inc(cast(int*)&atomic);
}

/**
    Performs an atomic bitwise 'or' of the value of atomic and val,
    storing the result back in atomic.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic |= val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
      val = the value to 'or'
    Returns: the value of atomic before the operation, unsigned
*/
uint atomicIntOr(ref uint atomic, uint val)
{
  uint _retval;
  _retval = g_atomic_int_or(cast(uint*)&atomic, val);
  return _retval;
}

/**
    Sets the value of atomic to newval.
    
    This call acts as a full compiler and hardware
    memory barrier (after the set).
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
      newval = a new value to store
*/
void atomicIntSet(ref int atomic, int newval)
{
  g_atomic_int_set(cast(int*)&atomic, newval);
}

/**
    Performs an atomic bitwise 'xor' of the value of atomic and val,
    storing the result back in atomic.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic ^= val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gint or #guint
      val = the value to 'xor'
    Returns: the value of atomic before the operation, unsigned
*/
uint atomicIntXor(ref uint atomic, uint val)
{
  uint _retval;
  _retval = g_atomic_int_xor(cast(uint*)&atomic, val);
  return _retval;
}

/**
    Atomically adds val to the value of atomic.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic += val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.
    
    In GLib 2.80, the return type was changed from #gssize to #gintptr to add
    support for platforms with 128-bit pointers. This should not affect existing
    code.

    Params:
      atomic = a pointer to a #gpointer-sized value
      val = the value to add
    Returns: the value of atomic before the add, signed
*/
ptrdiff_t atomicPointerAdd(void* atomic, ptrdiff_t val)
{
  ptrdiff_t _retval;
  _retval = g_atomic_pointer_add(atomic, val);
  return _retval;
}

/**
    Performs an atomic bitwise 'and' of the value of atomic and val,
    storing the result back in atomic.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic &= val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.
    
    In GLib 2.80, the return type was changed from #gsize to #guintptr to add
    support for platforms with 128-bit pointers. This should not affect existing
    code.

    Params:
      atomic = a pointer to a #gpointer-sized value
      val = the value to 'and'
    Returns: the value of atomic before the operation, unsigned
*/
size_t atomicPointerAnd(void* atomic, size_t val)
{
  size_t _retval;
  _retval = g_atomic_pointer_and(atomic, val);
  return _retval;
}

/**
    Compares atomic to oldval and, if equal, sets it to newval.
    If atomic was not equal to oldval then no change occurs.
    
    This compare and exchange is done atomically.
    
    Think of this operation as an atomic version of
    `{ if (*atomic == oldval) { *atomic = newval; return TRUE; } else return FALSE; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gpointer-sized value
      oldval = the value to compare with
      newval = the value to conditionally replace with
    Returns: true if the exchange took place
*/
bool atomicPointerCompareAndExchange(void* atomic, void* oldval = null, void* newval = null)
{
  bool _retval;
  _retval = cast(bool)g_atomic_pointer_compare_and_exchange(atomic, oldval, newval);
  return _retval;
}

/**
    Compares atomic to oldval and, if equal, sets it to newval.
    If atomic was not equal to oldval then no change occurs.
    In any case the value of atomic before this operation is stored in preval.
    
    This compare and exchange is done atomically.
    
    Think of this operation as an atomic version of
    `{ *preval = *atomic; if (*atomic == oldval) { *atomic = newval; return TRUE; } else return FALSE; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    See also [glib.global.atomicPointerCompareAndExchange]

    Params:
      atomic = a pointer to a #gpointer-sized value
      oldval = the value to compare with
      newval = the value to conditionally replace with
      preval = the contents of atomic before this operation
    Returns: true if the exchange took place
*/
bool atomicPointerCompareAndExchangeFull(void* atomic, void* oldval, void* newval, out void* preval)
{
  bool _retval;
  _retval = cast(bool)g_atomic_pointer_compare_and_exchange_full(atomic, oldval, newval, cast(void*)&preval);
  return _retval;
}

/**
    Sets the atomic to newval and returns the old value from atomic.
    
    This exchange is done atomically.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic = val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.

    Params:
      atomic = a pointer to a #gpointer-sized value
      newval = the value to replace with
    Returns: the value of atomic before the exchange
*/
void* atomicPointerExchange(void* atomic = null, void* newval = null)
{
  auto _retval = g_atomic_pointer_exchange(atomic, newval);
  return _retval;
}

/**
    Gets the current value of atomic.
    
    This call acts as a full compiler and hardware
    memory barrier (before the get).
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gpointer-sized value
    Returns: the value of the pointer
*/
void* atomicPointerGet(void* atomic)
{
  auto _retval = g_atomic_pointer_get(atomic);
  return _retval;
}

/**
    Performs an atomic bitwise 'or' of the value of atomic and val,
    storing the result back in atomic.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic |= val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.
    
    In GLib 2.80, the return type was changed from #gsize to #guintptr to add
    support for platforms with 128-bit pointers. This should not affect existing
    code.

    Params:
      atomic = a pointer to a #gpointer-sized value
      val = the value to 'or'
    Returns: the value of atomic before the operation, unsigned
*/
size_t atomicPointerOr(void* atomic, size_t val)
{
  size_t _retval;
  _retval = g_atomic_pointer_or(atomic, val);
  return _retval;
}

/**
    Sets the value of atomic to newval.
    
    This call acts as a full compiler and hardware
    memory barrier (after the set).
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.

    Params:
      atomic = a pointer to a #gpointer-sized value
      newval = a new value to store
*/
void atomicPointerSet(void* atomic, void* newval = null)
{
  g_atomic_pointer_set(atomic, newval);
}

/**
    Performs an atomic bitwise 'xor' of the value of atomic and val,
    storing the result back in atomic.
    
    Think of this operation as an atomic version of
    `{ tmp = *atomic; *atomic ^= val; return tmp; }`.
    
    This call acts as a full compiler and hardware memory barrier.
    
    While atomic has a `volatile` qualifier, this is a historical artifact and
    the pointer passed to it should not be `volatile`.
    
    In GLib 2.80, the return type was changed from #gsize to #guintptr to add
    support for platforms with 128-bit pointers. This should not affect existing
    code.

    Params:
      atomic = a pointer to a #gpointer-sized value
      val = the value to 'xor'
    Returns: the value of atomic before the operation, unsigned
*/
size_t atomicPointerXor(void* atomic, size_t val)
{
  size_t _retval;
  _retval = g_atomic_pointer_xor(atomic, val);
  return _retval;
}

/**
    Atomically acquires a reference on the data pointed by mem_block.

    Params:
      memBlock = a pointer to reference counted data
    Returns: a pointer to the data,
        with its reference count increased
*/
void* atomicRcBoxAcquire(void* memBlock)
{
  auto _retval = g_atomic_rc_box_acquire(memBlock);
  return _retval;
}

/**
    Allocates block_size bytes of memory, and adds atomic
    reference counting semantics to it.
    
    The data will be freed when its reference count drops to
    zero.
    
    The allocated data is guaranteed to be suitably aligned for any
    built-in type.

    Params:
      blockSize = the size of the allocation, must be greater than 0
    Returns: a pointer to the allocated memory
*/
void* atomicRcBoxAlloc(size_t blockSize)
{
  auto _retval = g_atomic_rc_box_alloc(blockSize);
  return _retval;
}

/**
    Allocates block_size bytes of memory, and adds atomic
    reference counting semantics to it.
    
    The contents of the returned data is set to zero.
    
    The data will be freed when its reference count drops to
    zero.
    
    The allocated data is guaranteed to be suitably aligned for any
    built-in type.

    Params:
      blockSize = the size of the allocation, must be greater than 0
    Returns: a pointer to the allocated memory
*/
void* atomicRcBoxAlloc0(size_t blockSize)
{
  auto _retval = g_atomic_rc_box_alloc0(blockSize);
  return _retval;
}

/**
    Allocates a new block of data with atomic reference counting
    semantics, and copies block_size bytes of mem_block
    into it.

    Params:
      blockSize = the number of bytes to copy, must be greater than 0
      memBlock = the memory to copy
    Returns: a pointer to the allocated
        memory
*/
void* atomicRcBoxDup(size_t blockSize, const(void)* memBlock)
{
  auto _retval = g_atomic_rc_box_dup(blockSize, memBlock);
  return _retval;
}

/**
    Retrieves the size of the reference counted data pointed by mem_block.

    Params:
      memBlock = a pointer to reference counted data
    Returns: the size of the data, in bytes
*/
size_t atomicRcBoxGetSize(void* memBlock)
{
  size_t _retval;
  _retval = g_atomic_rc_box_get_size(memBlock);
  return _retval;
}

/**
    Atomically releases a reference on the data pointed by mem_block.
    
    If the reference was the last one, it will free the
    resources allocated for mem_block.

    Params:
      memBlock = a pointer to reference counted data
*/
void atomicRcBoxRelease(void* memBlock)
{
  g_atomic_rc_box_release(memBlock);
}

/**
    Atomically releases a reference on the data pointed by mem_block.
    
    If the reference was the last one, it will call clear_func
    to clear the contents of mem_block, and then will free the
    resources allocated for mem_block.

    Params:
      memBlock = a pointer to reference counted data
      clearFunc = a function to call when clearing the data
*/
void atomicRcBoxReleaseFull(void* memBlock, glib.types.DestroyNotify clearFunc)
{
  extern(C) void _clearFuncCallback(void* data)
  {
    auto _dlg = cast(glib.types.DestroyNotify*)data;

    (*_dlg)();
  }
  auto _clearFuncCB = clearFunc ? &_clearFuncCallback : null;
  g_atomic_rc_box_release_full(memBlock, _clearFuncCB);
}

/**
    Atomically compares the current value of arc with val.

    Params:
      arc = the address of an atomic reference count variable
      val = the value to compare
    Returns: true if the reference count is the same
        as the given value
*/
bool atomicRefCountCompare(ref int arc, int val)
{
  bool _retval;
  _retval = cast(bool)g_atomic_ref_count_compare(cast(int*)&arc, val);
  return _retval;
}

/**
    Atomically decreases the reference count.
    
    If true is returned, the reference count reached 0. After this point, arc
    is an undefined state and must be reinitialized with
    [glib.global.atomicRefCountInit] to be used again.

    Params:
      arc = the address of an atomic reference count variable
    Returns: true if the reference count reached 0, and false otherwise
*/
bool atomicRefCountDec(ref int arc)
{
  bool _retval;
  _retval = cast(bool)g_atomic_ref_count_dec(cast(int*)&arc);
  return _retval;
}

/**
    Atomically increases the reference count.

    Params:
      arc = the address of an atomic reference count variable
*/
void atomicRefCountInc(ref int arc)
{
  g_atomic_ref_count_inc(cast(int*)&arc);
}

/**
    Initializes a reference count variable to 1.

    Params:
      arc = the address of an atomic reference count variable
*/
void atomicRefCountInit(ref int arc)
{
  g_atomic_ref_count_init(cast(int*)&arc);
}

/**
    Decode a sequence of Base-64 encoded text into binary data.  Note
    that the returned binary data is not necessarily zero-terminated,
    so it should not be used as a character string.

    Params:
      text = zero-terminated string with base64 text to decode
    Returns: newly allocated buffer containing the binary data
                    that text represents. The returned buffer must
                    be freed with [glib.global.gfree].
*/
ubyte[] base64Decode(string text)
{
  ubyte* _cretval;
  size_t _cretlength;
  const(char)* _text = text.toCString(No.Alloc);
  _cretval = g_base64_decode(_text, &_cretlength);
  ubyte[] _retval;

  if (_cretval)
  {
    _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Encode a sequence of binary data into its Base-64 stringified
    representation.

    Params:
      data = the binary data to encode
    Returns: a newly allocated, zero-terminated Base-64
                    encoded string representing data. The returned string must
                    be freed with [glib.global.gfree].
*/
string base64Encode(ubyte[] data = null)
{
  char* _cretval;
  size_t _len;
  if (data)
    _len = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  _cretval = g_base64_encode(_data, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the name of the file without any leading directory
    components. It returns a pointer into the given file name
    string.

    Params:
      fileName = the name of the file
    Returns: the name of the file without any leading
        directory components

    Deprecated: Use [glib.global.pathGetBasename] instead, but notice
        that [glib.global.pathGetBasename] allocates new memory for the
        returned string, unlike this function which returns a pointer
        into the argument.
*/
string basename(string fileName)
{
  const(char)* _cretval;
  const(char)* _fileName = fileName.toCString(No.Alloc);
  _cretval = g_basename(_fileName);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Sets the indicated lock_bit in address.  If the bit is already
    set, this call will block until [glib.global.bitUnlock] unsets the
    corresponding bit.
    
    Attempting to lock on two different bits within the same integer is
    not supported and will very probably cause deadlocks.
    
    The value of the bit that is set is (1u << bit).  If bit is not
    between 0 and 31 then the result is undefined.
    
    This function accesses address atomically.  All other accesses to
    address must be atomic in order for this function to work
    reliably. While address has a `volatile` qualifier, this is a historical
    artifact and the argument passed to it should not be `volatile`.

    Params:
      address = a pointer to an integer
      lockBit = a bit value between 0 and 31
*/
void bitLock(ref int address, int lockBit)
{
  g_bit_lock(cast(int*)&address, lockBit);
}

/**
    Find the position of the first bit set in mask, searching
    from (but not including) nth_bit upwards. Bits are numbered
    from 0 (least significant) to sizeof(#gulong) * 8 - 1 (31 or 63,
    usually). To start searching from the 0th bit, set nth_bit to -1.

    Params:
      mask = a #gulong containing flags
      nthBit = the index of the bit to start the search from
    Returns: the index of the first bit set which is higher than nth_bit, or -1
         if no higher bits are set
*/
int bitNthLsf(gulong mask, int nthBit)
{
  int _retval;
  _retval = g_bit_nth_lsf(mask, nthBit);
  return _retval;
}

/**
    Find the position of the first bit set in mask, searching
    from (but not including) nth_bit downwards. Bits are numbered
    from 0 (least significant) to sizeof(#gulong) * 8 - 1 (31 or 63,
    usually). To start searching from the last bit, set nth_bit to
    -1 or GLIB_SIZEOF_LONG * 8.

    Params:
      mask = a #gulong containing flags
      nthBit = the index of the bit to start the search from
    Returns: the index of the first bit set which is lower than nth_bit, or -1
         if no lower bits are set
*/
int bitNthMsf(gulong mask, int nthBit)
{
  int _retval;
  _retval = g_bit_nth_msf(mask, nthBit);
  return _retval;
}

/**
    Gets the number of bits used to hold number,
    e.g. if number is 4, 3 bits are needed.

    Params:
      number = a #guint
    Returns: the number of bits used to hold number
*/
uint bitStorage(gulong number)
{
  uint _retval;
  _retval = g_bit_storage(number);
  return _retval;
}

/**
    Sets the indicated lock_bit in address, returning true if
    successful.  If the bit is already set, returns false immediately.
    
    Attempting to lock on two different bits within the same integer is
    not supported.
    
    The value of the bit that is set is (1u << bit).  If bit is not
    between 0 and 31 then the result is undefined.
    
    This function accesses address atomically.  All other accesses to
    address must be atomic in order for this function to work
    reliably. While address has a `volatile` qualifier, this is a historical
    artifact and the argument passed to it should not be `volatile`.

    Params:
      address = a pointer to an integer
      lockBit = a bit value between 0 and 31
    Returns: true if the lock was acquired
*/
bool bitTrylock(ref int address, int lockBit)
{
  bool _retval;
  _retval = cast(bool)g_bit_trylock(cast(int*)&address, lockBit);
  return _retval;
}

/**
    Clears the indicated lock_bit in address.  If another thread is
    currently blocked in [glib.global.bitLock] on this same bit then it will be
    woken up.
    
    This function accesses address atomically.  All other accesses to
    address must be atomic in order for this function to work
    reliably. While address has a `volatile` qualifier, this is a historical
    artifact and the argument passed to it should not be `volatile`.

    Params:
      address = a pointer to an integer
      lockBit = a bit value between 0 and 31
*/
void bitUnlock(ref int address, int lockBit)
{
  g_bit_unlock(cast(int*)&address, lockBit);
}

/** */
void blowChunks()
{
  g_blow_chunks();
}

/**
    Creates a filename from a vector of elements using the correct
    separator for the current platform.
    
    This function behaves exactly like [glib.global.buildFilename], but takes the path
    elements as a string array, instead of varargs. This function is mainly
    meant for language bindings.
    
    If you are building a path programmatically you may want to use
    #GPathBuf instead.

    Params:
      args = null-terminated
          array of strings containing the path elements.
    Returns: the newly allocated path
*/
string buildFilenamev(string[] args)
{
  char* _cretval;
  char*[] _tmpargs;
  foreach (s; args)
    _tmpargs ~= s.toCString(No.Alloc);
  _tmpargs ~= null;
  char** _args = _tmpargs.ptr;

  _cretval = g_build_filenamev(_args);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Behaves exactly like [glib.global.buildPath], but takes the path elements
    as a string array, instead of variadic arguments.
    
    This function is mainly meant for language bindings.

    Params:
      separator = a string used to separator the elements of the path.
      args = null-terminated
          array of strings containing the path elements.
    Returns: a newly-allocated string that
          must be freed with [glib.global.gfree].
*/
string buildPathv(string separator, string[] args)
{
  char* _cretval;
  const(char)* _separator = separator.toCString(No.Alloc);
  char*[] _tmpargs;
  foreach (s; args)
    _tmpargs ~= s.toCString(No.Alloc);
  _tmpargs ~= null;
  char** _args = _tmpargs.ptr;

  _cretval = g_build_pathv(_separator, _args);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the canonical file name from filename. All triple slashes are turned into
    single slashes, and all `..` and `.`s resolved against relative_to.
    
    Symlinks are not followed, and the returned path is guaranteed to be absolute.
    
    If filename is an absolute path, relative_to is ignored. Otherwise,
    relative_to will be prepended to filename to make it absolute. relative_to
    must be an absolute path, or null. If relative_to is null, it'll fallback
    to [glib.global.getCurrentDir].
    
    This function never fails, and will canonicalize file paths even if they don't
    exist.
    
    No file system I/O is done.

    Params:
      filename = the name of the file
      relativeTo = the relative directory, or null
        to use the current working directory
    Returns: a newly allocated string with the
        canonical file path
*/
string canonicalizeFilename(string filename, string relativeTo = null)
{
  char* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  const(char)* _relativeTo = relativeTo.toCString(No.Alloc);
  _cretval = g_canonicalize_filename(_filename, _relativeTo);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    A wrapper for the POSIX chdir() function. The function changes the
    current directory of the process to path.
    
    See your C library manual for more details about chdir().

    Params:
      path = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
    Returns: 0 on success, -1 if an error occurred.
*/
int chdir(string path)
{
  int _retval;
  const(char)* _path = path.toCString(No.Alloc);
  _retval = g_chdir(_path);
  return _retval;
}

/**
    Checks that the GLib library in use is compatible with the
    given version.
    
    Generally you would pass in the constants [glib.types.MAJOR_VERSION],
    [glib.types.MINOR_VERSION], [glib.types.MICRO_VERSION] as the three arguments
    to this function; that produces a check that the library in use
    is compatible with the version of GLib the application or module
    was compiled against.
    
    Compatibility is defined by two things: first the version
    of the running library is newer than the version
    `required_major.required_minor.required_micro`. Second
    the running library must be binary compatible with the
    version `required_major.required_minor.required_micro`
    (same major version.)

    Params:
      requiredMajor = the required major version
      requiredMinor = the required minor version
      requiredMicro = the required micro version
    Returns: null if the GLib library is
        compatible with the given version, or a string describing the
        version mismatch. The returned string is owned by GLib and must
        not be modified or freed.
*/
string checkVersion(uint requiredMajor, uint requiredMinor, uint requiredMicro)
{
  const(char)* _cretval;
  _cretval = glib_check_version(requiredMajor, requiredMinor, requiredMicro);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Sets a function to be called when the child indicated by pid
    exits, at the priority priority.
    
    If you obtain pid from [glib.global.spawnAsync] or [glib.global.spawnAsyncWithPipes]
    you will need to pass `G_SPAWN_DO_NOT_REAP_CHILD` as flag to
    the spawn function for the child watching to work.
    
    In many programs, you will want to call [glib.global.spawnCheckWaitStatus]
    in the callback to determine whether or not the child exited
    successfully.
    
    Also, note that on platforms where #GPid must be explicitly closed
    (see [glib.global.spawnClosePid]) pid must not be closed while the source
    is still active.  Typically, you should invoke [glib.global.spawnClosePid]
    in the callback function for the source.
    
    GLib supports only a single callback per process id.
    On POSIX platforms, the same restrictions mentioned for
    [glib.global.childWatchSourceNew] apply to this function.
    
    This internally creates a main loop source using
    [glib.global.childWatchSourceNew] and attaches it to the main loop context
    using [glib.source.Source.attach]. You can do these steps manually if you
    need greater control.

    Params:
      priority = the priority of the idle source. Typically this will be in the
          range between [glib.types.PRIORITY_DEFAULT_IDLE] and [glib.types.PRIORITY_HIGH_IDLE].
      pid = process to watch. On POSIX the positive pid of a child process. On
        Windows a handle for a process (which doesn't have to be a child).
      function_ = function to call
    Returns: the ID (greater than 0) of the event source.
*/
uint childWatchAdd(int priority, glib.types.Pid pid, glib.types.ChildWatchFunc function_)
{
  extern(C) void _function_Callback(GPid pid, int waitStatus, void* userData)
  {
    auto _dlg = cast(glib.types.ChildWatchFunc*)userData;

    (*_dlg)(pid, waitStatus);
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = g_child_watch_add_full(priority, pid, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    Creates a new child_watch source.
    
    The source will not initially be associated with any #GMainContext
    and must be added to one with [glib.source.Source.attach] before it will be
    executed.
    
    Note that child watch sources can only be used in conjunction with
    `g_spawn...` when the `G_SPAWN_DO_NOT_REAP_CHILD` flag is used.
    
    Note that on platforms where #GPid must be explicitly closed
    (see [glib.global.spawnClosePid]) pid must not be closed while the
    source is still active. Typically, you will want to call
    [glib.global.spawnClosePid] in the callback function for the source.
    
    On POSIX platforms, the following restrictions apply to this API
    due to limitations in POSIX process interfaces:
    
    $(LIST
      * pid must be a child of this process
      * pid must be positive
      * the application must not call `waitpid` with a non-positive
        first argument, for instance in another thread
      * the application must not wait for pid to exit by any other
        mechanism, including `waitpid(pid, ...)` or a second child-watch
        source for the same pid
      * the application must not ignore `SIGCHLD`
      * Before 2.78, the application could not send a signal (`kill()`) to the
        watched pid in a race free manner. Since 2.78, you can do that while the
        associated #GMainContext is acquired.
      * Before 2.78, even after destroying the #GSource, you could not
        be sure that pid wasn't already reaped. Hence, it was also not
        safe to `kill()` or `waitpid()` on the process ID after the child watch
        source was gone. Destroying the source before it fired made it
        impossible to reliably reap the process.
    )
      
    If any of those conditions are not met, this and related APIs will
    not work correctly. This can often be diagnosed via a GLib warning
    stating that `ECHILD` was received by `waitpid`.
    
    Calling `waitpid` for specific processes other than pid remains a
    valid thing to do.

    Params:
      pid = process to watch. On POSIX the positive pid of a child process. On
        Windows a handle for a process (which doesn't have to be a child).
    Returns: the newly-created child watch source
*/
glib.source.Source childWatchSourceNew(glib.types.Pid pid)
{
  GSource* _cretval;
  _cretval = g_child_watch_source_new(pid);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    A wrapper for the POSIX chmod() function. The chmod() function is
    used to set the permissions of a file system object.
    
    On Windows the file protection mechanism is not at all POSIX-like,
    and the underlying chmod() function in the C library just sets or
    clears the FAT-style READONLY attribute. It does not touch any
    ACL. Software that needs to manage file permissions on Windows
    exactly should use the Win32 API.
    
    See your C library manual for more details about chmod().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      mode = as in chmod()
    Returns: 0 if the operation succeeded, -1 on error
*/
int chmod(string filename, int mode)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_chmod(_filename, mode);
  return _retval;
}

/**
    If err or *err is null, does nothing. Otherwise,
    calls [glib.error.ErrorWrap.free] on *err and sets *err to null.
    Throws: [ErrorWrap]
*/
void clearError()
{
  GError *_err;
  g_clear_error(&_err);
  if (_err)
    throw new ErrorWrap(_err);
}

/**
    This wraps the close() call. In case of error, `errno` will be
    preserved, but the error will also be stored as a #GError in error.
    In case of success, `errno` is undefined.
    
    Besides using #GError, there is another major reason to prefer this
    function over the call provided by the system; on Unix, it will
    attempt to correctly handle `EINTR`, which has platform-specific
    semantics.
    
    It is a bug to call this function with an invalid file descriptor.
    
    On POSIX platforms since GLib 2.76, this function is async-signal safe
    if (and only if) error is null and fd is a valid open file descriptor.
    This makes it safe to call from a signal handler or a #GSpawnChildSetupFunc
    under those conditions.
    See [`signal(7)`](man:signal(7)) and
    [`signal-safety(7)`](man:signal-safety(7)) for more details.

    Params:
      fd = A file descriptor
    Returns: true on success, false if there was an error.
    Throws: [ErrorWrap]
*/
bool close(int fd)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)g_close(fd, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Close every file descriptor equal to or greater than lowfd.
    
    Typically lowfd will be 3, to leave standard input, standard output
    and standard error open.
    
    This is the same as Linux `close_range (lowfd, ~0U, 0)`,
    but portable to other OSs and to older versions of Linux.
    Equivalently, it is the same as BSD `closefrom (lowfd)`, but portable,
    and async-signal-safe on all OSs.
    
    This function is async-signal safe, making it safe to call from a
    signal handler or a [glib.types.SpawnChildSetupFunc], as long as lowfd is
    non-negative.
    See [`signal(7)`](man:signal(7)) and
    [`signal-safety(7)`](man:signal-safety(7)) for more details.

    Params:
      lowfd = Minimum fd to close, which must be non-negative
    Returns: 0 on success, -1 with errno set on error
*/
int closefrom(int lowfd)
{
  int _retval;
  _retval = g_closefrom(lowfd);
  return _retval;
}

/**
    Computes the checksum for a binary data. This is a
    convenience wrapper for [glib.checksum.Checksum.new_], [glib.checksum.Checksum.getString]
    and [glib.checksum.Checksum.free].
    
    The hexadecimal string returned will be in lower case.

    Params:
      checksumType = a #GChecksumType
      data = binary blob to compute the digest of
    Returns: the digest of the binary data as a
        string in hexadecimal, or null if [glib.checksum.Checksum.new_] fails for
        checksum_type. The returned string should be freed with [glib.global.gfree] when
        done using it.
*/
string computeChecksumForBytes(glib.types.ChecksumType checksumType, glib.bytes.Bytes data)
{
  char* _cretval;
  _cretval = g_compute_checksum_for_bytes(checksumType, data ? cast(GBytes*)data._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Computes the checksum for a binary data of length. This is a
    convenience wrapper for [glib.checksum.Checksum.new_], [glib.checksum.Checksum.getString]
    and [glib.checksum.Checksum.free].
    
    The hexadecimal string returned will be in lower case.

    Params:
      checksumType = a #GChecksumType
      data = binary blob to compute the digest of
    Returns: the digest of the binary data as a
        string in hexadecimal, or null if [glib.checksum.Checksum.new_] fails for
        checksum_type. The returned string should be freed with [glib.global.gfree] when
        done using it.
*/
string computeChecksumForData(glib.types.ChecksumType checksumType, ubyte[] data)
{
  char* _cretval;
  size_t _length;
  if (data)
    _length = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  _cretval = g_compute_checksum_for_data(checksumType, _data, _length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Computes the checksum of a string.
    
    The hexadecimal string returned will be in lower case.

    Params:
      checksumType = a #GChecksumType
      str = the string to compute the checksum of
    Returns: the checksum as a hexadecimal string,
        or null if [glib.checksum.Checksum.new_] fails for checksum_type. The returned string
        should be freed with [glib.global.gfree] when done using it.
*/
string computeChecksumForString(glib.types.ChecksumType checksumType, string str)
{
  char* _cretval;
  ptrdiff_t _length;
  if (str)
    _length = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_compute_checksum_for_string(checksumType, _str, _length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Computes the HMAC for a binary data. This is a
    convenience wrapper for [glib.hmac.Hmac.new_], [glib.hmac.Hmac.getString]
    and [glib.hmac.Hmac.unref].
    
    The hexadecimal string returned will be in lower case.

    Params:
      digestType = a #GChecksumType to use for the HMAC
      key = the key to use in the HMAC
      data = binary blob to compute the HMAC of
    Returns: the HMAC of the binary data as a string in hexadecimal.
        The returned string should be freed with [glib.global.gfree] when done using it.
*/
string computeHmacForBytes(glib.types.ChecksumType digestType, glib.bytes.Bytes key, glib.bytes.Bytes data)
{
  char* _cretval;
  _cretval = g_compute_hmac_for_bytes(digestType, key ? cast(GBytes*)key._cPtr(No.Dup) : null, data ? cast(GBytes*)data._cPtr(No.Dup) : null);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Computes the HMAC for a binary data of length. This is a
    convenience wrapper for [glib.hmac.Hmac.new_], [glib.hmac.Hmac.getString]
    and [glib.hmac.Hmac.unref].
    
    The hexadecimal string returned will be in lower case.

    Params:
      digestType = a #GChecksumType to use for the HMAC
      key = the key to use in the HMAC
      data = binary blob to compute the HMAC of
    Returns: the HMAC of the binary data as a string in hexadecimal.
        The returned string should be freed with [glib.global.gfree] when done using it.
*/
string computeHmacForData(glib.types.ChecksumType digestType, ubyte[] key, ubyte[] data)
{
  char* _cretval;
  size_t _keyLen;
  if (key)
    _keyLen = cast(size_t)key.length;

  auto _key = cast(const(ubyte)*)key.ptr;
  size_t _length;
  if (data)
    _length = cast(size_t)data.length;

  auto _data = cast(const(ubyte)*)data.ptr;
  _cretval = g_compute_hmac_for_data(digestType, _key, _keyLen, _data, _length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Computes the HMAC for a string.
    
    The hexadecimal string returned will be in lower case.

    Params:
      digestType = a #GChecksumType to use for the HMAC
      key = the key to use in the HMAC
      str = the string to compute the HMAC for
    Returns: the HMAC as a hexadecimal string.
          The returned string should be freed with [glib.global.gfree]
          when done using it.
*/
string computeHmacForString(glib.types.ChecksumType digestType, ubyte[] key, string str)
{
  char* _cretval;
  size_t _keyLen;
  if (key)
    _keyLen = cast(size_t)key.length;

  auto _key = cast(const(ubyte)*)key.ptr;
  ptrdiff_t _length;
  if (str)
    _length = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_compute_hmac_for_string(digestType, _key, _keyLen, _str, _length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a string from one character set to another.
    
    Note that you should use [glib.global.iconv] for streaming conversions.
    Despite the fact that bytes_read can return information about partial
    characters, the g_convert_... functions are not generally suitable
    for streaming. If the underlying converter maintains internal state,
    then this won't be preserved across successive calls to [glib.global.convert],
    [glib.global.convertWithIconv] or [glib.global.convertWithFallback]. (An example of
    this is the GNU C converter for CP1255 which does not emit a base
    character until it knows that the next character is not a mark that
    could combine with the base character.)
    
    Using extensions such as "//TRANSLIT" may not work (or may not work
    well) on many platforms.  Consider using [glib.global.strToAscii] instead.

    Params:
      str = the string to convert.
      toCodeset = name of character set into which to convert str
      fromCodeset = character set of str.
      bytesRead = location to store the number of bytes in
                        the input string that were successfully converted, or null.
                        Even if the conversion was successful, this may be
                        less than len if there were partial characters
                        at the end of the input. If the error
                        `G_CONVERT_ERROR_ILLEGAL_SEQUENCE` occurs, the value
                        stored will be the byte offset after the last valid
                        input sequence.
    Returns: If the conversion was successful, a newly allocated buffer
               containing the converted string, which must be freed with [glib.global.gfree].
               Otherwise null and error will be set.
    Throws: [ErrorWrap]
*/
ubyte[] convert(ubyte[] str, string toCodeset, string fromCodeset, out size_t bytesRead)
{
  ubyte* _cretval;
  size_t _cretlength;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  const(char)* _toCodeset = toCodeset.toCString(No.Alloc);
  const(char)* _fromCodeset = fromCodeset.toCString(No.Alloc);
  GError *_err;
  _cretval = g_convert(_str, _len, _toCodeset, _fromCodeset, cast(size_t*)&bytesRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  ubyte[] _retval;

  if (_cretval)
  {
    _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/** */
glib.types.Quark convertErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_convert_error_quark();
  return _retval;
}

/**
    Converts a string from one character set to another, possibly
    including fallback sequences for characters not representable
    in the output. Note that it is not guaranteed that the specification
    for the fallback sequences in fallback will be honored. Some
    systems may do an approximate conversion from from_codeset
    to to_codeset in their iconv() functions,
    in which case GLib will simply return that approximate conversion.
    
    Note that you should use [glib.global.iconv] for streaming conversions.
    Despite the fact that bytes_read can return information about partial
    characters, the g_convert_... functions are not generally suitable
    for streaming. If the underlying converter maintains internal state,
    then this won't be preserved across successive calls to [glib.global.convert],
    [glib.global.convertWithIconv] or [glib.global.convertWithFallback]. (An example of
    this is the GNU C converter for CP1255 which does not emit a base
    character until it knows that the next character is not a mark that
    could combine with the base character.)

    Params:
      str = the string to convert.
      toCodeset = name of character set into which to convert str
      fromCodeset = character set of str.
      fallback = UTF-8 string to use in place of characters not
                       present in the target encoding. (The string must be
                       representable in the target encoding).
                       If null, characters not in the target encoding will
                       be represented as Unicode escapes \uxxxx or \Uxxxxyyyy.
      bytesRead = location to store the number of bytes in
                       the input string that were successfully converted, or null.
                       Even if the conversion was successful, this may be
                       less than len if there were partial characters
                       at the end of the input.
    Returns: If the conversion was successful, a newly allocated buffer
               containing the converted string, which must be freed with [glib.global.gfree].
               Otherwise null and error will be set.
    Throws: [ErrorWrap]
*/
ubyte[] convertWithFallback(ubyte[] str, string toCodeset, string fromCodeset, string fallback, out size_t bytesRead)
{
  ubyte* _cretval;
  size_t _cretlength;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  const(char)* _toCodeset = toCodeset.toCString(No.Alloc);
  const(char)* _fromCodeset = fromCodeset.toCString(No.Alloc);
  const(char)* _fallback = fallback.toCString(No.Alloc);
  GError *_err;
  _cretval = g_convert_with_fallback(_str, _len, _toCodeset, _fromCodeset, _fallback, cast(size_t*)&bytesRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  ubyte[] _retval;

  if (_cretval)
  {
    _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    A wrapper for the POSIX creat() function. The creat() function is
    used to convert a pathname into a file descriptor, creating a file
    if necessary.
    
    On POSIX systems file descriptors are implemented by the operating
    system. On Windows, it's the C library that implements creat() and
    file descriptors. The actual Windows API for opening files is
    different, see MSDN documentation for CreateFile(). The Win32 API
    uses file handles, which are more randomish integers, not small
    integers like file descriptors.
    
    Because file descriptors are specific to the C library on Windows,
    the file descriptor returned by this function makes sense only to
    functions in the same C library. Thus if the GLib-using code uses a
    different C library than GLib does, the file descriptor returned by
    this function cannot be passed to C library functions like write()
    or read().
    
    See your C library manual for more details about creat().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      mode = as in creat()
    Returns: a new file descriptor, or -1 if an error occurred.
          The return value can be used exactly like the return value
          from creat().
*/
int creat(string filename, int mode)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_creat(_filename, mode);
  return _retval;
}

/**
    Destroys the dataset, freeing all memory allocated, and calling any
    destroy functions set for data elements.

    Params:
      datasetLocation = the location identifying the dataset.
*/
void datasetDestroy(const(void)* datasetLocation)
{
  g_dataset_destroy(datasetLocation);
}

/**
    Calls the given function for each data element which is associated
    with the given location. Note that this function is NOT thread-safe.
    So unless dataset_location can be protected from any modifications
    during invocation of this function, it should not be called.
    
    func can make changes to the dataset, but the iteration will not
    reflect changes made during the [glib.global.datasetForeach] call, other
    than skipping over elements that are removed.

    Params:
      datasetLocation = the location identifying the dataset.
      func = the function to call for each data element.
*/
void datasetForeach(const(void)* datasetLocation, glib.types.DataForeachFunc func)
{
  extern(C) void _funcCallback(GQuark keyId, void* data, void* userData)
  {
    auto _dlg = cast(glib.types.DataForeachFunc*)userData;

    (*_dlg)(keyId, data);
  }
  auto _funcCB = func ? &_funcCallback : null;
  auto _func = func ? cast(void*)&(func) : null;
  g_dataset_foreach(datasetLocation, _funcCB, _func);
}

/**
    Gets the data element corresponding to a #GQuark.

    Params:
      datasetLocation = the location identifying the dataset.
      keyId = the #GQuark id to identify the data element.
    Returns: the data element corresponding to
               the #GQuark, or null if it is not found.
*/
void* datasetIdGetData(const(void)* datasetLocation, glib.types.Quark keyId)
{
  auto _retval = g_dataset_id_get_data(datasetLocation, keyId);
  return _retval;
}

/**
    This is a variant of [glib.global.dgettext] that allows specifying a locale
    category instead of always using `LC_MESSAGES`. See [glib.global.dgettext] for
    more information about how this functions differs from calling
    dcgettext() directly.

    Params:
      domain = the translation domain to use, or null to use
          the domain set with textdomain()
      msgid = message to translate
      category = a locale category
    Returns: the translated string for the given locale category
*/
string dcgettext(string domain, string msgid, int category)
{
  const(char)* _cretval;
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _msgid = msgid.toCString(No.Alloc);
  _cretval = g_dcgettext(_domain, _msgid, category);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    This function is a wrapper of dgettext() which does not translate
    the message if the default domain as set with textdomain() has no
    translations for the current locale.
    
    The advantage of using this function over dgettext() proper is that
    libraries using this function (like GTK) will not use translations
    if the application using the library does not have translations for
    the current locale.  This results in a consistent English-only
    interface instead of one having partial translations.  For this
    feature to work, the call to textdomain() and setlocale() should
    precede any [glib.global.dgettext] invocations.  For GTK, it means calling
    textdomain() before gtk_init or its variants.
    
    This function disables translations if and only if upon its first
    call all the following conditions hold:
    
    $(LIST
      * domain is not null
      
      * textdomain() has been called to set a default text domain
      
      * there is no translations available for the default text domain
        and the current locale
      
      * current locale is not "C" or any English locales (those
        starting with "en_")
    )
      
    Note that this behavior may not be desired for example if an application
    has its untranslated messages in a language other than English. In those
    cases the application should call textdomain() after initializing GTK.
    
    Applications should normally not use this function directly,
    but use the _() macro for translations.

    Params:
      domain = the translation domain to use, or null to use
          the domain set with textdomain()
      msgid = message to translate
    Returns: The translated string
*/
string dgettext(string domain, string msgid)
{
  const(char)* _cretval;
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _msgid = msgid.toCString(No.Alloc);
  _cretval = g_dgettext(_domain, _msgid);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Compares two #gpointer arguments and returns true if they are equal.
    It can be passed to [glib.hash_table.HashTable.new_] as the key_equal_func
    parameter, when using opaque pointers compared by pointer value as
    keys in a #GHashTable.
    
    This equality function is also appropriate for keys that are integers
    stored in pointers, such as `GINT_TO_POINTER (n)`.

    Params:
      v1 = a key
      v2 = a key to compare with v1
    Returns: true if the two keys match.
*/
bool directEqual(const(void)* v1 = null, const(void)* v2 = null)
{
  bool _retval;
  _retval = cast(bool)g_direct_equal(v1, v2);
  return _retval;
}

/**
    Converts a gpointer to a hash value.
    It can be passed to [glib.hash_table.HashTable.new_] as the hash_func parameter,
    when using opaque pointers compared by pointer value as keys in a
    #GHashTable.
    
    This hash function is also appropriate for keys that are integers
    stored in pointers, such as `GINT_TO_POINTER (n)`.

    Params:
      v = a #gpointer key
    Returns: a hash value corresponding to the key.
*/
uint directHash(const(void)* v = null)
{
  uint _retval;
  _retval = g_direct_hash(v);
  return _retval;
}

/**
    This function is a wrapper of dngettext() which does not translate
    the message if the default domain as set with textdomain() has no
    translations for the current locale.
    
    See [glib.global.dgettext] for details of how this differs from dngettext()
    proper.

    Params:
      domain = the translation domain to use, or null to use
          the domain set with textdomain()
      msgid = message to translate
      msgidPlural = plural form of the message
      n = the quantity for which translation is needed
    Returns: The translated string
*/
string dngettext(string domain, string msgid, string msgidPlural, gulong n)
{
  const(char)* _cretval;
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _msgid = msgid.toCString(No.Alloc);
  const(char)* _msgidPlural = msgidPlural.toCString(No.Alloc);
  _cretval = g_dngettext(_domain, _msgid, _msgidPlural, n);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Compares the two #gdouble values being pointed to and returns
    true if they are equal.
    It can be passed to [glib.hash_table.HashTable.new_] as the key_equal_func
    parameter, when using non-null pointers to doubles as keys in a
    #GHashTable.

    Params:
      v1 = a pointer to a #gdouble key
      v2 = a pointer to a #gdouble key to compare with v1
    Returns: true if the two keys match.
*/
bool doubleEqual(const(void)* v1, const(void)* v2)
{
  bool _retval;
  _retval = cast(bool)g_double_equal(v1, v2);
  return _retval;
}

/**
    Converts a pointer to a #gdouble to a hash value.
    It can be passed to [glib.hash_table.HashTable.new_] as the hash_func parameter,
    It can be passed to [glib.hash_table.HashTable.new_] as the hash_func parameter,
    when using non-null pointers to doubles as keys in a #GHashTable.

    Params:
      v = a pointer to a #gdouble key
    Returns: a hash value corresponding to the key.
*/
uint doubleHash(const(void)* v)
{
  uint _retval;
  _retval = g_double_hash(v);
  return _retval;
}

/**
    This function is a variant of [glib.global.dgettext] which supports
    a disambiguating message context. GNU gettext uses the
    '\004' character to separate the message context and
    message id in msgctxtid.
    If 0 is passed as msgidoffset, this function will fall back to
    trying to use the deprecated convention of using "|" as a separation
    character.
    
    This uses [glib.global.dgettext] internally. See that functions for differences
    with dgettext() proper.
    
    Applications should normally not use this function directly,
    but use the C_() macro for translations with context.

    Params:
      domain = the translation domain to use, or null to use
          the domain set with textdomain()
      msgctxtid = a combined message context and message id, separated
          by a \004 character
      msgidoffset = the offset of the message id in msgctxid
    Returns: The translated string
*/
string dpgettext(string domain, string msgctxtid, size_t msgidoffset)
{
  const(char)* _cretval;
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _msgctxtid = msgctxtid.toCString(No.Alloc);
  _cretval = g_dpgettext(_domain, _msgctxtid, msgidoffset);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    This function is a variant of [glib.global.dgettext] which supports
    a disambiguating message context. GNU gettext uses the
    '\004' character to separate the message context and
    message id in msgctxtid.
    
    This uses [glib.global.dgettext] internally. See that functions for differences
    with dgettext() proper.
    
    This function differs from C_() in that it is not a macro and
    thus you may use non-string-literals as context and msgid arguments.

    Params:
      domain = the translation domain to use, or null to use
          the domain set with textdomain()
      context = the message context
      msgid = the message
    Returns: The translated string
*/
string dpgettext2(string domain, string context, string msgid)
{
  const(char)* _cretval;
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _context = context.toCString(No.Alloc);
  const(char)* _msgid = msgid.toCString(No.Alloc);
  _cretval = g_dpgettext2(_domain, _context, _msgid);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns the value of the environment variable variable in the
    provided list envp.

    Params:
      envp = an environment list (eg, as returned from [glib.global.getEnviron]), or null
            for an empty environment list
      variable = the environment variable to get
    Returns: the value of the environment variable, or null if
          the environment variable is not set in envp. The returned
          string is owned by envp, and will be freed if variable is
          set or unset again.
*/
string environGetenv(string[] envp, string variable)
{
  const(char)* _cretval;
  char*[] _tmpenvp;
  foreach (s; envp)
    _tmpenvp ~= s.toCString(No.Alloc);
  _tmpenvp ~= null;
  char** _envp = _tmpenvp.ptr;

  const(char)* _variable = variable.toCString(No.Alloc);
  _cretval = g_environ_getenv(_envp, _variable);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Mark every file descriptor equal to or greater than lowfd to be closed
    at the next `execve()` or similar, as if via the `FD_CLOEXEC` flag.
    
    Typically lowfd will be 3, to leave standard input, standard output
    and standard error open after exec.
    
    This is the same as Linux `close_range (lowfd, ~0U, CLOSE_RANGE_CLOEXEC)`,
    but portable to other OSs and to older versions of Linux.
    
    This function is async-signal safe, making it safe to call from a
    signal handler or a [glib.types.SpawnChildSetupFunc], as long as lowfd is
    non-negative.
    See [`signal(7)`](man:signal(7)) and
    [`signal-safety(7)`](man:signal-safety(7)) for more details.

    Params:
      lowfd = Minimum fd to act on, which must be non-negative
    Returns: 0 on success, -1 with errno set on error
*/
int fdwalkSetCloexec(int lowfd)
{
  int _retval;
  _retval = g_fdwalk_set_cloexec(lowfd);
  return _retval;
}

/**
    Gets a #GFileError constant based on the passed-in err_no.
    
    For example, if you pass in `EEXIST` this function returns
    `G_FILE_ERROR_EXIST`. Unlike `errno` values, you can portably
    assume that all #GFileError values will exist.
    
    Normally a #GFileError value goes into a #GError returned
    from a function that manipulates files. So you would use
    [glib.global.fileErrorFromErrno] when constructing a #GError.

    Params:
      errNo = an "errno" value
    Returns: #GFileError corresponding to the given err_no
*/
glib.types.FileError fileErrorFromErrno(int errNo)
{
  GFileError _cretval;
  _cretval = g_file_error_from_errno(errNo);
  glib.types.FileError _retval = cast(glib.types.FileError)_cretval;
  return _retval;
}

/** */
glib.types.Quark fileErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_file_error_quark();
  return _retval;
}

/**
    Reads an entire file into allocated memory, with good error
    checking.
    
    If the call was successful, it returns true and sets contents to the file
    contents and length to the length of the file contents in bytes. The string
    stored in contents will be nul-terminated, so for text files you can pass
    null for the length argument. If the call was not successful, it returns
    false and sets error. The error domain is `G_FILE_ERROR`. Possible error
    codes are those in the #GFileError enumeration. In the error case,
    contents is set to null and length is set to zero.

    Params:
      filename = name of a file to read contents from, in the GLib file name encoding
      contents = location to store an allocated string, use [glib.global.gfree] to free
            the returned string
    Returns: true on success, false if an error occurred
    Throws: [ErrorWrap]
*/
bool fileGetContents(string filename, out ubyte[] contents)
{
  bool _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  size_t _length;
  ubyte* _contents;
  GError *_err;
  _retval = cast(bool)g_file_get_contents(_filename, &_contents, &_length, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  contents.length = _length;
  contents[0 .. $] = (cast(ubyte*)_contents)[0 .. _length];
  gFree(cast(void*)_contents);
  return _retval;
}

/**
    Opens a file for writing in the preferred directory for temporary
    files (as returned by [glib.global.getTmpDir]).
    
    tmpl should be a string in the GLib file name encoding containing
    a sequence of six 'X' characters, as the parameter to [glib.global.mkstemp].
    However, unlike these functions, the template should only be a
    basename, no directory components are allowed. If template is
    null, a default template is used.
    
    Note that in contrast to [glib.global.mkstemp] (and mkstemp()) tmpl is not
    modified, and might thus be a read-only literal string.
    
    Upon success, and if name_used is non-null, the actual name used
    is returned in name_used. This string should be freed with [glib.global.gfree]
    when not needed any longer. The returned name is in the GLib file
    name encoding.

    Params:
      tmpl = Template for file name, as in
          [glib.global.mkstemp], basename only, or null for a default template
      nameUsed = location to store actual name used,
          or null
    Returns: A file handle (as from open()) to the file opened for
        reading and writing. The file is opened in binary mode on platforms
        where there is a difference. The file handle should be closed with
        close(). In case of errors, -1 is returned and error will be set.
    Throws: [ErrorWrap]
*/
int fileOpenTmp(string tmpl, out string nameUsed)
{
  int _retval;
  const(char)* _tmpl = tmpl.toCString(No.Alloc);
  char* _nameUsed;
  GError *_err;
  _retval = g_file_open_tmp(_tmpl, &_nameUsed, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  nameUsed = _nameUsed.fromCString(Yes.Free);
  return _retval;
}

/**
    Reads the contents of the symbolic link filename like the POSIX
    `readlink()` function.
    
    The returned string is in the encoding used for filenames. Use
    [glib.global.filenameToUtf8] to convert it to UTF-8.
    
    The returned string may also be a relative path. Use [glib.global.buildFilename]
    to convert it to an absolute path:
    
    ```c
    g_autoptr(GError) local_error = NULL;
    g_autofree gchar *link_target = g_file_read_link ("/etc/localtime", &local_error);
    
    if (local_error != NULL)
      g_error ("Error reading link: %s", local_error->message);
    
    if (!g_path_is_absolute (link_target))
      {
        g_autofree gchar *absolute_link_target = g_build_filename ("/etc", link_target, NULL);
        g_free (link_target);
        link_target = g_steal_pointer (&absolute_link_target);
      }
    ```

    Params:
      filename = the symbolic link
    Returns: A newly-allocated string with
        the contents of the symbolic link, or null if an error occurred.
    Throws: [ErrorWrap]
*/
string fileReadLink(string filename)
{
  char* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  GError *_err;
  _cretval = g_file_read_link(_filename, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Writes all of contents to a file named filename. This is a convenience
    wrapper around calling [glib.global.fileSetContentsFull] with `flags` set to
    `G_FILE_SET_CONTENTS_CONSISTENT | G_FILE_SET_CONTENTS_ONLY_EXISTING` and
    `mode` set to `0666`.

    Params:
      filename = name of a file to write contents to, in the GLib file name
          encoding
      contents = string to write to the file
    Returns: true on success, false if an error occurred
    Throws: [ErrorWrap]
*/
bool fileSetContents(string filename, ubyte[] contents)
{
  bool _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  ptrdiff_t _length;
  if (contents)
    _length = cast(ptrdiff_t)contents.length;

  auto _contents = cast(const(ubyte)*)contents.ptr;
  GError *_err;
  _retval = cast(bool)g_file_set_contents(_filename, _contents, _length, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Writes all of contents to a file named filename, with good error checking.
    If a file called filename already exists it will be overwritten.
    
    flags control the properties of the write operation: whether it’s atomic,
    and what the tradeoff is between returning quickly or being resilient to
    system crashes.
    
    As this function performs file I/O, it is recommended to not call it anywhere
    where blocking would cause problems, such as in the main loop of a graphical
    application. In particular, if flags has any value other than
    `G_FILE_SET_CONTENTS_NONE` then this function may call `fsync()`.
    
    If `G_FILE_SET_CONTENTS_CONSISTENT` is set in flags, the operation is atomic
    in the sense that it is first written to a temporary file which is then
    renamed to the final name.
    
    Notes:
    
    $(LIST
      * On UNIX, if filename already exists hard links to filename will break.
        Also since the file is recreated, existing permissions, access control
        lists, metadata etc. may be lost. If filename is a symbolic link,
        the link itself will be replaced, not the linked file.
      
      * On UNIX, if filename already exists and is non-empty, and if the system
        supports it (via a journalling filesystem or equivalent), and if
        `G_FILE_SET_CONTENTS_CONSISTENT` is set in flags, the `fsync()` call (or
        equivalent) will be used to ensure atomic replacement: filename
        will contain either its old contents or contents, even in the face of
        system power loss, the disk being unsafely removed, etc.
      
      * On UNIX, if filename does not already exist or is empty, there is a
        possibility that system power loss etc. after calling this function will
        leave filename empty or full of NUL bytes, depending on the underlying
        filesystem, unless `G_FILE_SET_CONTENTS_DURABLE` and
        `G_FILE_SET_CONTENTS_CONSISTENT` are set in flags.
      
      * On Windows renaming a file will not remove an existing file with the
        new name, so on Windows there is a race condition between the existing
        file being removed and the temporary file being renamed.
      
      * On Windows there is no way to remove a file that is open to some
        process, or mapped into memory. Thus, this function will fail if
        filename already exists and is open.
    )
      
    If the call was successful, it returns true. If the call was not successful,
    it returns false and sets error. The error domain is `G_FILE_ERROR`.
    Possible error codes are those in the #GFileError enumeration.
    
    Note that the name for the temporary file is constructed by appending up
    to 7 characters to filename.
    
    If the file didn’t exist before and is created, it will be given the
    permissions from mode. Otherwise, the permissions of the existing file may
    be changed to mode depending on flags, or they may remain unchanged.

    Params:
      filename = name of a file to write contents to, in the GLib file name
          encoding
      contents = string to write to the file
      flags = flags controlling the safety vs speed of the operation
      mode = file mode, as passed to `open()`; typically this will be `0666`
    Returns: true on success, false if an error occurred
    Throws: [ErrorWrap]
*/
bool fileSetContentsFull(string filename, ubyte[] contents, glib.types.FileSetContentsFlags flags, int mode)
{
  bool _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  ptrdiff_t _length;
  if (contents)
    _length = cast(ptrdiff_t)contents.length;

  auto _contents = cast(const(ubyte)*)contents.ptr;
  GError *_err;
  _retval = cast(bool)g_file_set_contents_full(_filename, _contents, _length, flags, mode, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Returns true if any of the tests in the bitfield test are
    true. For example, `(G_FILE_TEST_EXISTS | G_FILE_TEST_IS_DIR)`
    will return true if the file exists; the check whether it's a
    directory doesn't matter since the existence test is true. With
    the current set of available tests, there's no point passing in
    more than one test at a time.
    
    Apart from `G_FILE_TEST_IS_SYMLINK` all tests follow symbolic links,
    so for a symbolic link to a regular file [glib.global.fileTest] will return
    true for both `G_FILE_TEST_IS_SYMLINK` and `G_FILE_TEST_IS_REGULAR`.
    
    Note, that for a dangling symbolic link [glib.global.fileTest] will return
    true for `G_FILE_TEST_IS_SYMLINK` and false for all other flags.
    
    You should never use [glib.global.fileTest] to test whether it is safe
    to perform an operation, because there is always the possibility
    of the condition changing before you actually perform the operation,
    see [TOCTOU](https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use).
    
    For example, you might think you could use `G_FILE_TEST_IS_SYMLINK`
    to know whether it is safe to write to a file without being
    tricked into writing into a different location. It doesn't work!
    
    ```c
     // DON'T DO THIS
     if (!g_file_test (filename, G_FILE_TEST_IS_SYMLINK))
       {
         fd = g_open (filename, O_WRONLY);
         // write to fd
       }
    
     // DO THIS INSTEAD
     fd = g_open (filename, O_WRONLY | O_NOFOLLOW | O_CLOEXEC);
     if (fd == -1)
       {
         // check error
         if (errno == ELOOP)
           // file is a symlink and can be ignored
         else
           // handle errors as before
       }
     else
       {
         // write to fd
       }
    ```
    
    Another thing to note is that `G_FILE_TEST_EXISTS` and
    `G_FILE_TEST_IS_EXECUTABLE` are implemented using the access()
    system call. This usually doesn't matter, but if your program
    is setuid or setgid it means that these tests will give you
    the answer for the real user ID and group ID, rather than the
    effective user ID and group ID.
    
    On Windows, there are no symlinks, so testing for
    `G_FILE_TEST_IS_SYMLINK` will always return false. Testing for
    `G_FILE_TEST_IS_EXECUTABLE` will just check that the file exists and
    its name indicates that it is executable, checking for well-known
    extensions and those listed in the `PATHEXT` environment variable.

    Params:
      filename = a filename to test in the
            GLib file name encoding
      test = bitfield of #GFileTest flags
    Returns: whether a test was true
*/
bool fileTest(string filename, glib.types.FileTest test)
{
  bool _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = cast(bool)g_file_test(_filename, test);
  return _retval;
}

/**
    Returns the display basename for the particular filename, guaranteed
    to be valid UTF-8. The display name might not be identical to the filename,
    for instance there might be problems converting it to UTF-8, and some files
    can be translated in the display.
    
    If GLib cannot make sense of the encoding of filename, as a last resort it
    replaces unknown characters with U+FFFD, the Unicode replacement character.
    You can search the result for the UTF-8 encoding of this character (which is
    "\357\277\275" in octal notation) to find out if filename was in an invalid
    encoding.
    
    You must pass the whole absolute pathname to this functions so that
    translation of well known locations can be done.
    
    This function is preferred over [glib.global.filenameDisplayName] if you know the
    whole path, as it allows translation.

    Params:
      filename = an absolute pathname in the
            GLib file name encoding
    Returns: a newly allocated string containing
        a rendition of the basename of the filename in valid UTF-8
*/
string filenameDisplayBasename(string filename)
{
  char* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _cretval = g_filename_display_basename(_filename);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a filename into a valid UTF-8 string. The conversion is
    not necessarily reversible, so you should keep the original around
    and use the return value of this function only for display purposes.
    Unlike [glib.global.filenameToUtf8], the result is guaranteed to be non-null
    even if the filename actually isn't in the GLib file name encoding.
    
    If GLib cannot make sense of the encoding of filename, as a last resort it
    replaces unknown characters with U+FFFD, the Unicode replacement character.
    You can search the result for the UTF-8 encoding of this character (which is
    "\357\277\275" in octal notation) to find out if filename was in an invalid
    encoding.
    
    If you know the whole pathname of the file you should use
    [glib.global.filenameDisplayBasename], since that allows location-based
    translation of filenames.

    Params:
      filename = a pathname hopefully in the
            GLib file name encoding
    Returns: a newly allocated string containing
        a rendition of the filename in valid UTF-8
*/
string filenameDisplayName(string filename)
{
  char* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _cretval = g_filename_display_name(_filename);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts an escaped ASCII-encoded URI to a local filename in the
    encoding used for filenames.
    
    Since GLib 2.78, the query string and fragment can be present in the URI,
    but are not part of the resulting filename.
    We take inspiration from https://url.spec.whatwg.org/#file-state,
    but we don't support the entire standard.

    Params:
      uri = a uri describing a filename (escaped, encoded in ASCII).
      hostname = Location to store hostname for the URI.
                   If there is no hostname in the URI, null will be
                   stored in this location.
    Returns: a newly-allocated string holding
                    the resulting filename, or null on an error.
    Throws: [ErrorWrap]
*/
string filenameFromUri(string uri, out string hostname)
{
  char* _cretval;
  const(char)* _uri = uri.toCString(No.Alloc);
  char* _hostname;
  GError *_err;
  _cretval = g_filename_from_uri(_uri, &_hostname, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  hostname = _hostname.fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a string from UTF-8 to the encoding GLib uses for
    filenames. Note that on Windows GLib uses UTF-8 for filenames;
    on other platforms, this function indirectly depends on the
    [current locale][setlocale].
    
    The input string shall not contain nul characters even if the len
    argument is positive. A nul character found inside the string will result
    in error `G_CONVERT_ERROR_ILLEGAL_SEQUENCE`. If the filename encoding is
    not UTF-8 and the conversion output contains a nul character, the error
    `G_CONVERT_ERROR_EMBEDDED_NUL` is set and the function returns null.

    Params:
      utf8string = a UTF-8 encoded string.
      bytesRead = location to store the number of bytes in
                        the input string that were successfully converted, or null.
                        Even if the conversion was successful, this may be
                        less than len if there were partial characters
                        at the end of the input. If the error
                        `G_CONVERT_ERROR_ILLEGAL_SEQUENCE` occurs, the value
                        stored will be the byte offset after the last valid
                        input sequence.
    Returns: The converted string, or null on an error.
    Throws: [ErrorWrap]
*/
ubyte[] filenameFromUtf8(ubyte[] utf8string, out size_t bytesRead)
{
  ubyte* _cretval;
  size_t _cretlength;
  ptrdiff_t _len;
  if (utf8string)
    _len = cast(ptrdiff_t)utf8string.length;

  auto _utf8string = cast(const(ubyte)*)utf8string.ptr;
  GError *_err;
  _cretval = g_filename_from_utf8(_utf8string, _len, cast(size_t*)&bytesRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  ubyte[] _retval;

  if (_cretval)
  {
    _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Converts an absolute filename to an escaped ASCII-encoded URI, with the path
    component following Section 3.3. of RFC 2396.

    Params:
      filename = an absolute filename specified in the GLib file
            name encoding, which is the on-disk file name bytes on Unix, and UTF-8
            on Windows
      hostname = A UTF-8 encoded hostname, or null for none.
    Returns: a newly-allocated string holding the resulting
                    URI, or null on an error.
    Throws: [ErrorWrap]
*/
string filenameToUri(string filename, string hostname = null)
{
  char* _cretval;
  const(char)* _filename = filename.toCString(No.Alloc);
  const(char)* _hostname = hostname.toCString(No.Alloc);
  GError *_err;
  _cretval = g_filename_to_uri(_filename, _hostname, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a string which is in the encoding used by GLib for
    filenames into a UTF-8 string. Note that on Windows GLib uses UTF-8
    for filenames; on other platforms, this function indirectly depends on
    the [current locale][setlocale].
    
    The input string shall not contain nul characters even if the len
    argument is positive. A nul character found inside the string will result
    in error `G_CONVERT_ERROR_ILLEGAL_SEQUENCE`.
    If the source encoding is not UTF-8 and the conversion output contains a
    nul character, the error `G_CONVERT_ERROR_EMBEDDED_NUL` is set and the
    function returns null. Use [glib.global.convert] to produce output that
    may contain embedded nul characters.

    Params:
      opsysstring = a string in the encoding for filenames
      bytesRead = location to store the number of bytes in the
                        input string that were successfully converted, or null.
                        Even if the conversion was successful, this may be
                        less than len if there were partial characters
                        at the end of the input. If the error
                        `G_CONVERT_ERROR_ILLEGAL_SEQUENCE` occurs, the value
                        stored will be the byte offset after the last valid
                        input sequence.
    Returns: The converted string, or null on an error.
    Throws: [ErrorWrap]
*/
string filenameToUtf8(ubyte[] opsysstring, out size_t bytesRead)
{
  char* _cretval;
  size_t _cretlength;
  ptrdiff_t _len;
  if (opsysstring)
    _len = cast(ptrdiff_t)opsysstring.length;

  auto _opsysstring = cast(const(ubyte)*)opsysstring.ptr;
  GError *_err;
  _cretval = g_filename_to_utf8(_opsysstring, _len, cast(size_t*)&bytesRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval;

  if (_cretval)
  {
    _retval = cast(string)_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Locates the first executable named program in the user's path, in the
    same way that execvp() would locate it. Returns an allocated string
    with the absolute path name, or null if the program is not found in
    the path. If program is already an absolute path, returns a copy of
    program if program exists and is executable, and null otherwise.
     
    On Windows, if program does not have a file type suffix, tries
    with the suffixes .exe, .cmd, .bat and .com, and the suffixes in
    the `PATHEXT` environment variable.
    
    On Windows, it looks for the file in the same way as CreateProcess()
    would. This means first in the directory where the executing
    program was loaded from, then in the current directory, then in the
    Windows 32-bit system directory, then in the Windows directory, and
    finally in the directories in the `PATH` environment variable. If
    the program is found, the return value contains the full name
    including the type suffix.

    Params:
      program = a program name in the GLib file name encoding
    Returns: a newly-allocated
        string with the absolute path, or null
*/
string findProgramInPath(string program)
{
  char* _cretval;
  const(char)* _program = program.toCString(No.Alloc);
  _cretval = g_find_program_in_path(_program);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    A wrapper for the stdio `fopen()` function. The `fopen()` function
    opens a file and associates a new stream with it.
    
    Because file descriptors are specific to the C library on Windows,
    and a file descriptor is part of the `FILE` struct, the `FILE*` returned
    by this function makes sense only to functions in the same C library.
    Thus if the GLib-using code uses a different C library than GLib does,
    the FILE* returned by this function cannot be passed to C library
    functions like `fprintf()` or `fread()`.
    
    See your C library manual for more details about `fopen()`.
    
    As `close()` and `fclose()` are part of the C library, this implies that it is
    currently impossible to close a file if the application C library and the C library
    used by GLib are different. Convenience functions like [glib.global.fileSetContentsFull]
    avoid this problem.

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      mode = a string describing the mode in which the file should be opened
    Returns: A `FILE*` if the file was successfully opened, or null if
          an error occurred
*/
void* fopen(string filename, string mode)
{
  const(char)* _filename = filename.toCString(No.Alloc);
  const(char)* _mode = mode.toCString(No.Alloc);
  auto _retval = g_fopen(_filename, _mode);
  return _retval;
}

/**
    Formats a size (for example the size of a file) into a human readable
    string.  Sizes are rounded to the nearest size prefix (kB, MB, GB)
    and are displayed rounded to the nearest tenth. E.g. the file size
    3292528 bytes will be converted into the string "3.2 MB". The returned string
    is UTF-8, and may use a non-breaking space to separate the number and units,
    to ensure they aren’t separated when line wrapped.
    
    The prefix units base is 1000 (i.e. 1 kB is 1000 bytes).
    
    This string should be freed with [glib.global.gfree] when not needed any longer.
    
    See [glib.global.formatSizeFull] for more options about how the size might be
    formatted.

    Params:
      size = a size in bytes
    Returns: a newly-allocated formatted string containing
        a human readable file size
*/
string formatSize(ulong size)
{
  char* _cretval;
  _cretval = g_format_size(size);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Formats a size (for example the size of a file) into a human
    readable string. Sizes are rounded to the nearest size prefix
    (KB, MB, GB) and are displayed rounded to the nearest tenth.
    E.g. the file size 3292528 bytes will be converted into the
    string "3.1 MB".
    
    The prefix units base is 1024 (i.e. 1 KB is 1024 bytes).
    
    This string should be freed with [glib.global.gfree] when not needed any longer.

    Params:
      size = a size in bytes
    Returns: a newly-allocated formatted string
        containing a human readable file size

    Deprecated: This function is broken due to its use of SI
          suffixes to denote IEC units. Use [glib.global.formatSize] instead.
*/
string formatSizeForDisplay(long size)
{
  char* _cretval;
  _cretval = g_format_size_for_display(size);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Formats a size.
    
    This function is similar to [glib.global.formatSize] but allows for flags
    that modify the output. See #GFormatSizeFlags.

    Params:
      size = a size in bytes
      flags = #GFormatSizeFlags to modify the output
    Returns: a newly-allocated formatted string
        containing a human readable file size
*/
string formatSizeFull(ulong size, glib.types.FormatSizeFlags flags)
{
  char* _cretval;
  _cretval = g_format_size_full(size, flags);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Frees the memory pointed to by mem.
    
    If you know the allocated size of mem, calling [glib.global.freeSized] may be faster,
    depending on the libc implementation in use.
    
    Starting from GLib 2.78, this may happen automatically in case a GCC
    compatible compiler is used with some optimization level and the allocated
    size is known at compile time (see [documentation of
    `__builtin_object_size()`](https://gcc.gnu.org/onlinedocs/gcc/Object-Size-Checking.html)
    to understand its caveats).
    
    If mem is null it simply returns, so there is no need to check mem
    against null before calling this function.

    Params:
      mem = the memory to free
*/
void gfree(void* mem = null)
{
  g_free(mem);
}

/**
    Frees the memory pointed to by mem, assuming it is has the given size.
    
    If mem is null this is a no-op (and size is ignored).
    
    It is an error if size doesn’t match the size passed when mem was
    allocated. size is passed to this function to allow optimizations in the
    allocator. If you don’t know the allocation size, use [glib.global.gfree] instead.
    
    In case a GCC compatible compiler is used, this function may be used
    automatically via [glib.global.gfree] if the allocated size is known at compile time,
    since GLib 2.78.

    Params:
      mem = the memory to free
      size = size of mem, in bytes
*/
void freeSized(void* mem, size_t size)
{
  g_free_sized(mem, size);
}

/**
    A wrapper for the POSIX freopen() function. The freopen() function
    opens a file and associates it with an existing stream.
    
    See your C library manual for more details about freopen().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      mode = a string describing the mode in which the file should be  opened
      stream = an existing stream which will be reused, or null
    Returns: A FILE* if the file was successfully opened, or null if
          an error occurred.
*/
void* freopen(string filename, string mode, void* stream = null)
{
  const(char)* _filename = filename.toCString(No.Alloc);
  const(char)* _mode = mode.toCString(No.Alloc);
  auto _retval = g_freopen(_filename, _mode, stream);
  return _retval;
}

/**
    A wrapper for the POSIX `fsync()` function. On Windows, `_commit()` will be
    used. On macOS, `fcntl(F_FULLFSYNC)` will be used.
    The `fsync()` function is used to synchronize a file's in-core
    state with that of the disk.
    
    This wrapper will handle retrying on `EINTR`.
    
    See the C library manual for more details about fsync().

    Params:
      fd = a file descriptor
    Returns: 0 on success, or -1 if an error occurred.
      The return value can be used exactly like the return value from fsync().
*/
int fsync(int fd)
{
  int _retval;
  _retval = g_fsync(fd);
  return _retval;
}

/**
    Gets a human-readable name for the application, as set by
    [glib.global.setApplicationName]. This name should be localized if
    possible, and is intended for display to the user.  Contrast with
    [glib.global.getPrgname], which gets a non-localized name. If
    [glib.global.setApplicationName] has not been called, returns the result of
    [glib.global.getPrgname] (which may be null if [glib.global.setPrgname] has also not
    been called).
    Returns: human-readable application
        name. May return null
*/
string getApplicationName()
{
  const(char)* _cretval;
  _cretval = g_get_application_name();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Obtains the character set for the [current locale][setlocale]; you
    might use this character set as an argument to [glib.global.convert], to convert
    from the current locale's encoding to some other encoding. (Frequently
    [glib.global.localeToUtf8] and [glib.global.localeFromUtf8] are nice shortcuts, though.)
    
    On Windows the character set returned by this function is the
    so-called system default ANSI code-page. That is the character set
    used by the "narrow" versions of C library and Win32 functions that
    handle file names. It might be different from the character set
    used by the C library's current locale.
    
    On Linux, the character set is found by consulting nl_langinfo() if
    available. If not, the environment variables `LC_ALL`, `LC_CTYPE`, `LANG`
    and `CHARSET` are queried in order. nl_langinfo() returns the C locale if
    no locale has been loaded by setlocale().
    
    The return value is true if the locale's encoding is UTF-8, in that
    case you can perhaps avoid calling [glib.global.convert].
    
    The string returned in charset is not allocated, and should not be
    freed.

    Params:
      charset = return location for character set
          name, or null.
    Returns: true if the returned charset is UTF-8
*/
bool getCharset(out string charset)
{
  bool _retval;
  char* _charset;
  _retval = cast(bool)g_get_charset(&_charset);
  charset = _charset.fromCString(No.Free);
  return _retval;
}

/**
    Gets the character set for the current locale.
    Returns: a newly allocated string containing the name
          of the character set. This string must be freed with [glib.global.gfree].
*/
string getCodeset()
{
  char* _cretval;
  _cretval = g_get_codeset();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Obtains the character set used by the console attached to the process,
    which is suitable for printing output to the terminal.
    
    Usually this matches the result returned by [glib.global.getCharset], but in
    environments where the locale's character set does not match the encoding
    of the console this function tries to guess a more suitable value instead.
    
    On Windows the character set returned by this function is the
    output code page used by the console associated with the calling process.
    If the codepage can't be determined (for example because there is no
    console attached) UTF-8 is assumed.
    
    The return value is true if the locale's encoding is UTF-8, in that
    case you can perhaps avoid calling [glib.global.convert].
    
    The string returned in charset is not allocated, and should not be
    freed.

    Params:
      charset = return location for character set
          name, or null.
    Returns: true if the returned charset is UTF-8
*/
bool getConsoleCharset(out string charset)
{
  bool _retval;
  char* _charset;
  _retval = cast(bool)g_get_console_charset(&_charset);
  charset = _charset.fromCString(No.Free);
  return _retval;
}

/**
    Gets the current directory.
    
    The returned string should be freed when no longer needed.
    The encoding of the returned string is system defined.
    On Windows, it is always UTF-8.
    
    Since GLib 2.40, this function will return the value of the "PWD"
    environment variable if it is set and it happens to be the same as
    the current directory.  This can make a difference in the case that
    the current directory is the target of a symbolic link.
    Returns: the current directory
*/
string getCurrentDir()
{
  char* _cretval;
  _cretval = g_get_current_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Equivalent to the UNIX gettimeofday() function, but portable.
    
    You may find [glib.global.getRealTime] to be more convenient.

    Params:
      result = #GTimeVal structure in which to store current time.

    Deprecated: #GTimeVal is not year-2038-safe. Use [glib.global.getRealTime]
         instead.
*/
void getCurrentTime(out glib.time_val.TimeVal result)
{
  g_get_current_time(cast(GTimeVal*)&result);
}

/**
    Gets the list of environment variables for the current process.
    
    The list is null terminated and each item in the list is of the
    form 'NAME=VALUE'.
    
    This is equivalent to direct access to the 'environ' global variable,
    except portable.
    
    The return value is freshly allocated and it should be freed with
    [glib.global.strfreev] when it is no longer needed.
    Returns: the list of environment variables
*/
string[] getEnviron()
{
  char** _cretval;
  _cretval = g_get_environ();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Determines the preferred character sets used for filenames.
    The first character set from the charsets is the filename encoding, the
    subsequent character sets are used when trying to generate a displayable
    representation of a filename, see [glib.global.filenameDisplayName].
    
    On Unix, the character sets are determined by consulting the
    environment variables `G_FILENAME_ENCODING` and `G_BROKEN_FILENAMES`.
    On Windows, the character set used in the GLib API is always UTF-8
    and said environment variables have no effect.
    
    `G_FILENAME_ENCODING` may be set to a comma-separated list of
    character set names. The special token "\locale" is taken
    to  mean the character set for the [current locale][setlocale].
    If `G_FILENAME_ENCODING` is not set, but `G_BROKEN_FILENAMES` is,
    the character set of the current locale is taken as the filename
    encoding. If neither environment variable  is set, UTF-8 is taken
    as the filename encoding, but the character set of the current locale
    is also put in the list of encodings.
    
    The returned charsets belong to GLib and must not be freed.
    
    Note that on Unix, regardless of the locale character set or
    `G_FILENAME_ENCODING` value, the actual file names present
    on a system might be in any random encoding or just gibberish.

    Params:
      filenameCharsets = return location for the null-terminated list of encoding names
    Returns: true if the filename encoding is UTF-8.
*/
bool getFilenameCharsets(out string[] filenameCharsets)
{
  bool _retval;
  const(char*)* _filenameCharsets;
  _retval = cast(bool)g_get_filename_charsets(&_filenameCharsets);
  uint _lenfilenameCharsets;
  if (_filenameCharsets)
  {
    for (; _filenameCharsets[_lenfilenameCharsets] !is null; _lenfilenameCharsets++)
    {
    }
  }

  filenameCharsets.length = _lenfilenameCharsets;
  foreach (i; 0 .. _lenfilenameCharsets)
    filenameCharsets[i] = _filenameCharsets[i].fromCString(No.Free);
  return _retval;
}

/**
    Gets the current user's home directory.
    
    As with most UNIX tools, this function will return the value of the
    `HOME` environment variable if it is set to an existing absolute path
    name, falling back to the `passwd` file in the case that it is unset.
    
    If the path given in `HOME` is non-absolute, does not exist, or is
    not a directory, the result is undefined.
    
    Before version 2.36 this function would ignore the `HOME` environment
    variable, taking the value from the `passwd` database instead. This was
    changed to increase the compatibility of GLib with other programs (and
    the XDG basedir specification) and to increase testability of programs
    based on GLib (by making it easier to run them from test frameworks).
    
    If your program has a strong requirement for either the new or the
    old behaviour (and if you don't wish to increase your GLib
    dependency to ensure that the new behaviour is in effect) then you
    should either directly check the `HOME` environment variable yourself
    or unset it before calling any functions in GLib.
    Returns: the current user's home directory
*/
string getHomeDir()
{
  const(char)* _cretval;
  _cretval = g_get_home_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Return a name for the machine.
    
    The returned name is not necessarily a fully-qualified domain name,
    or even present in DNS or some other name service at all. It need
    not even be unique on your local network or site, but usually it
    is. Callers should not rely on the return value having any specific
    properties like uniqueness for security purposes. Even if the name
    of the machine is changed while an application is running, the
    return value from this function does not change. The returned
    string is owned by GLib and should not be modified or freed. If no
    name can be determined, a default fixed string "localhost" is
    returned.
    
    The encoding of the returned string is UTF-8.
    Returns: the host name of the machine.
*/
string getHostName()
{
  const(char)* _cretval;
  _cretval = g_get_host_name();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Computes a list of applicable locale names, which can be used to
    e.g. construct locale-dependent filenames or search paths. The returned
    list is sorted from most desirable to least desirable and always contains
    the default locale "C".
    
    For example, if LANGUAGE=de:en_US, then the returned list is
    "de", "en_US", "en", "C".
    
    This function consults the environment variables `LANGUAGE`, `LC_ALL`,
    `LC_MESSAGES` and `LANG` to find the list of locales specified by the
    user.
    Returns: a null-terminated array of strings owned by GLib
         that must not be modified or freed.
*/
string[] getLanguageNames()
{
  const(char*)* _cretval;
  _cretval = g_get_language_names();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Computes a list of applicable locale names with a locale category name,
    which can be used to construct the fallback locale-dependent filenames
    or search paths. The returned list is sorted from most desirable to
    least desirable and always contains the default locale "C".
    
    This function consults the environment variables `LANGUAGE`, `LC_ALL`,
    category_name, and `LANG` to find the list of locales specified by the
    user.
    
    [glib.global.getLanguageNames] returns g_get_language_names_with_category("LC_MESSAGES").

    Params:
      categoryName = a locale category name
    Returns: a null-terminated array of strings owned by
         the thread g_get_language_names_with_category was called from.
         It must not be modified or freed. It must be copied if planned to be used in another thread.
*/
string[] getLanguageNamesWithCategory(string categoryName)
{
  const(char*)* _cretval;
  const(char)* _categoryName = categoryName.toCString(No.Alloc);
  _cretval = g_get_language_names_with_category(_categoryName);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Returns a list of derived variants of locale, which can be used to
    e.g. construct locale-dependent filenames or search paths. The returned
    list is sorted from most desirable to least desirable.
    This function handles territory, charset and extra locale modifiers. See
    [`setlocale(3)`](man:setlocale) for information about locales and their format.
    
    locale itself is guaranteed to be returned in the output.
    
    For example, if locale is `fr_BE`, then the returned list
    is `fr_BE`, `fr`. If locale is `en_GB.UTF-8euro`, then the returned list
    is `en_GB.UTF-8euro`, `en_GB.UTF-8`, `en_GBeuro`, `en_GB`, `en.UTF-8euro`,
    `en.UTF-8`, `eneuro`, `en`.
    
    If you need the list of variants for the current locale,
    use [glib.global.getLanguageNames].

    Params:
      locale = a locale identifier
    Returns: a newly
        allocated array of newly allocated strings with the locale variants. Free with
        [glib.global.strfreev].
*/
string[] getLocaleVariants(string locale)
{
  char** _cretval;
  const(char)* _locale = locale.toCString(No.Alloc);
  _cretval = g_get_locale_variants(_locale);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Queries the system monotonic time.
    
    The monotonic clock will always increase and doesn't suffer
    discontinuities when the user (or NTP) changes the system time.  It
    may or may not continue to tick during times where the machine is
    suspended.
    
    We try to use the clock that corresponds as closely as possible to
    the passage of time as measured by system calls such as poll() but it
    may not always be possible to do this.
    Returns: the monotonic time, in microseconds
*/
long getMonotonicTime()
{
  long _retval;
  _retval = g_get_monotonic_time();
  return _retval;
}

/**
    Determine the approximate number of threads that the system will
    schedule simultaneously for this process.  This is intended to be
    used as a parameter to [glib.thread_pool.ThreadPool.new_] for CPU bound tasks and
    similar cases.
    Returns: Number of schedulable threads, always greater than 0
*/
uint getNumProcessors()
{
  uint _retval;
  _retval = g_get_num_processors();
  return _retval;
}

/**
    Get information about the operating system.
    
    On Linux this comes from the `/etc/os-release` file. On other systems, it may
    come from a variety of sources. You can either use the standard key names
    like `G_OS_INFO_KEY_NAME` or pass any UTF-8 string key name. For example,
    `/etc/os-release` provides a number of other less commonly used values that may
    be useful. No key is guaranteed to be provided, so the caller should always
    check if the result is null.

    Params:
      keyName = a key for the OS info being requested, for example `G_OS_INFO_KEY_NAME`.
    Returns: The associated value for the requested key or null if
        this information is not provided.
*/
string getOsInfo(string keyName)
{
  char* _cretval;
  const(char)* _keyName = keyName.toCString(No.Alloc);
  _cretval = g_get_os_info(_keyName);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the name of the program. This name should not be localized,
    in contrast to [glib.global.getApplicationName].
    
    If you are using #GApplication the program name is set in
    [gio.application.Application.run]. In case of GDK or GTK it is set in
    [gdk.global.init_], which is called by [gtk.global.init_] and the
    #GtkApplication::startup handler. The program name is found by
    taking the last component of argv[0].
    Returns: the name of the program,
        or null if it has not been set yet. The returned string belongs
        to GLib and must not be modified or freed.
*/
string getPrgname()
{
  const(char)* _cretval;
  _cretval = g_get_prgname();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the real name of the user. This usually comes from the user's
    entry in the `passwd` file. The encoding of the returned string is
    system-defined. (On Windows, it is, however, always UTF-8.) If the
    real user name cannot be determined, the string "Unknown" is
    returned.
    Returns: the user's real name.
*/
string getRealName()
{
  const(char)* _cretval;
  _cretval = g_get_real_name();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Queries the system wall-clock time.
    
    This call is functionally equivalent to [glib.global.getCurrentTime] except
    that the return value is often more convenient than dealing with a
    #GTimeVal.
    
    You should only use this call if you are actually interested in the real
    wall-clock time.  [glib.global.getMonotonicTime] is probably more useful for
    measuring intervals.
    Returns: the number of microseconds since January 1, 1970 UTC.
*/
long getRealTime()
{
  long _retval;
  _retval = g_get_real_time();
  return _retval;
}

/**
    Returns an ordered list of base directories in which to access
    system-wide configuration information.
    
    On UNIX platforms this is determined using the mechanisms described
    in the
    [XDG Base Directory Specification](http://www.freedesktop.org/Standards/basedir-spec).
    In this case the list of directories retrieved will be `XDG_CONFIG_DIRS`.
    
    On Windows it follows XDG Base Directory Specification if `XDG_CONFIG_DIRS` is defined.
    If `XDG_CONFIG_DIRS` is undefined, the directory that contains application
    data for all users is used instead. A typical path is
    `C:\Documents and Settings\All Users\Application Data`.
    This folder is used for application data
    that is not user specific. For example, an application can store
    a spell-check dictionary, a database of clip art, or a log file in the
    FOLDERID_ProgramData folder. This information will not roam and is available
    to anyone using the computer.
    
    The return value is cached and modifying it at runtime is not supported, as
    it’s not thread-safe to modify environment variables at runtime.
    Returns: a null-terminated array of strings owned by GLib that must not be
          modified or freed.
*/
string[] getSystemConfigDirs()
{
  const(char*)* _cretval;
  _cretval = g_get_system_config_dirs();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Returns an ordered list of base directories in which to access
    system-wide application data.
    
    On UNIX platforms this is determined using the mechanisms described
    in the
    [XDG Base Directory Specification](http://www.freedesktop.org/Standards/basedir-spec)
    In this case the list of directories retrieved will be `XDG_DATA_DIRS`.
    
    On Windows it follows XDG Base Directory Specification if `XDG_DATA_DIRS` is defined.
    If `XDG_DATA_DIRS` is undefined,
    the first elements in the list are the Application Data
    and Documents folders for All Users. (These can be determined only
    on Windows 2000 or later and are not present in the list on other
    Windows versions.) See documentation for FOLDERID_ProgramData and
    FOLDERID_PublicDocuments.
    
    Then follows the "share" subfolder in the installation folder for
    the package containing the DLL that calls this function, if it can
    be determined.
    
    Finally the list contains the "share" subfolder in the installation
    folder for GLib, and in the installation folder for the package the
    application's .exe file belongs to.
    
    The installation folders above are determined by looking up the
    folder where the module (DLL or EXE) in question is located. If the
    folder's name is "bin", its parent is used, otherwise the folder
    itself.
    
    Note that on Windows the returned list can vary depending on where
    this function is called.
    
    The return value is cached and modifying it at runtime is not supported, as
    it’s not thread-safe to modify environment variables at runtime.
    Returns: a null-terminated array of strings owned by GLib that must not be
          modified or freed.
*/
string[] getSystemDataDirs()
{
  const(char*)* _cretval;
  _cretval = g_get_system_data_dirs();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(No.Free);
  }
  return _retval;
}

/**
    Gets the directory to use for temporary files.
    
    On UNIX, this is taken from the `TMPDIR` environment variable.
    If the variable is not set, `P_tmpdir` is
    used, as defined by the system C library. Failing that, a
    hard-coded default of "/tmp" is returned.
    
    On Windows, the `TEMP` environment variable is used, with the
    root directory of the Windows installation (eg: "C:\") used
    as a default.
    
    The encoding of the returned string is system-defined. On Windows,
    it is always UTF-8. The return value is never null or the empty
    string.
    Returns: the directory to use for temporary files.
*/
string getTmpDir()
{
  const(char)* _cretval;
  _cretval = g_get_tmp_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a base directory in which to store non-essential, cached
    data specific to particular user.
    
    On UNIX platforms this is determined using the mechanisms described
    in the
    [XDG Base Directory Specification](http://www.freedesktop.org/Standards/basedir-spec).
    In this case the directory retrieved will be `XDG_CACHE_HOME`.
    
    On Windows it follows XDG Base Directory Specification if `XDG_CACHE_HOME` is defined.
    If `XDG_CACHE_HOME` is undefined, the directory that serves as a common
    repository for temporary Internet files is used instead. A typical path is
    `C:\Documents and Settings\username\Local Settings\Temporary Internet Files`.
    See the [documentation for `FOLDERID_InternetCache`](https://docs.microsoft.com/en-us/windows/win32/shell/knownfolderid).
    
    The return value is cached and modifying it at runtime is not supported, as
    it’s not thread-safe to modify environment variables at runtime.
    Returns: a string owned by GLib that
        must not be modified or freed.
*/
string getUserCacheDir()
{
  const(char)* _cretval;
  _cretval = g_get_user_cache_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a base directory in which to store user-specific application
    configuration information such as user preferences and settings.
    
    On UNIX platforms this is determined using the mechanisms described
    in the
    [XDG Base Directory Specification](http://www.freedesktop.org/Standards/basedir-spec).
    In this case the directory retrieved will be `XDG_CONFIG_HOME`.
    
    On Windows it follows XDG Base Directory Specification if `XDG_CONFIG_HOME` is defined.
    If `XDG_CONFIG_HOME` is undefined, the folder to use for local (as opposed
    to roaming) application data is used instead. See the
    [documentation for `FOLDERID_LocalAppData`](https://docs.microsoft.com/en-us/windows/win32/shell/knownfolderid).
    Note that in this case on Windows it will be  the same
    as what [glib.global.getUserDataDir] returns.
    
    The return value is cached and modifying it at runtime is not supported, as
    it’s not thread-safe to modify environment variables at runtime.
    Returns: a string owned by GLib that
        must not be modified or freed.
*/
string getUserConfigDir()
{
  const(char)* _cretval;
  _cretval = g_get_user_config_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a base directory in which to access application data such
    as icons that is customized for a particular user.
    
    On UNIX platforms this is determined using the mechanisms described
    in the
    [XDG Base Directory Specification](http://www.freedesktop.org/Standards/basedir-spec).
    In this case the directory retrieved will be `XDG_DATA_HOME`.
    
    On Windows it follows XDG Base Directory Specification if `XDG_DATA_HOME`
    is defined. If `XDG_DATA_HOME` is undefined, the folder to use for local (as
    opposed to roaming) application data is used instead. See the
    [documentation for `FOLDERID_LocalAppData`](https://docs.microsoft.com/en-us/windows/win32/shell/knownfolderid).
    Note that in this case on Windows it will be the same
    as what [glib.global.getUserConfigDir] returns.
    
    The return value is cached and modifying it at runtime is not supported, as
    it’s not thread-safe to modify environment variables at runtime.
    Returns: a string owned by GLib that must
        not be modified or freed.
*/
string getUserDataDir()
{
  const(char)* _cretval;
  _cretval = g_get_user_data_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the user name of the current user. The encoding of the returned
    string is system-defined. On UNIX, it might be the preferred file name
    encoding, or something else, and there is no guarantee that it is even
    consistent on a machine. On Windows, it is always UTF-8.
    Returns: the user name of the current user.
*/
string getUserName()
{
  const(char)* _cretval;
  _cretval = g_get_user_name();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a directory that is unique to the current user on the local
    system.
    
    This is determined using the mechanisms described
    in the
    [XDG Base Directory Specification](http://www.freedesktop.org/Standards/basedir-spec).
    This is the directory
    specified in the `XDG_RUNTIME_DIR` environment variable.
    In the case that this variable is not set, we return the value of
    [glib.global.getUserCacheDir], after verifying that it exists.
    
    The return value is cached and modifying it at runtime is not supported, as
    it’s not thread-safe to modify environment variables at runtime.
    Returns: a string owned by GLib that must not be
          modified or freed.
*/
string getUserRuntimeDir()
{
  const(char)* _cretval;
  _cretval = g_get_user_runtime_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns the full path of a special directory using its logical id.
    
    On UNIX this is done using the XDG special user directories.
    For compatibility with existing practise, `G_USER_DIRECTORY_DESKTOP`
    falls back to `$HOME/Desktop` when XDG special user directories have
    not been set up.
    
    Depending on the platform, the user might be able to change the path
    of the special directory without requiring the session to restart; GLib
    will not reflect any change once the special directories are loaded.

    Params:
      directory = the logical id of special directory
    Returns: the path to the specified special
        directory, or null if the logical id was not found. The returned string is
        owned by GLib and should not be modified or freed.
*/
string getUserSpecialDir(glib.types.UserDirectory directory)
{
  const(char)* _cretval;
  _cretval = g_get_user_special_dir(directory);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a base directory in which to store state files specific to
    particular user.
    
    On UNIX platforms this is determined using the mechanisms described
    in the
    [XDG Base Directory Specification](http://www.freedesktop.org/Standards/basedir-spec).
    In this case the directory retrieved will be `XDG_STATE_HOME`.
    
    On Windows it follows XDG Base Directory Specification if `XDG_STATE_HOME` is defined.
    If `XDG_STATE_HOME` is undefined, the folder to use for local (as opposed
    to roaming) application data is used instead. See the
    [documentation for `FOLDERID_LocalAppData`](https://docs.microsoft.com/en-us/windows/win32/shell/knownfolderid).
    Note that in this case on Windows it will be the same
    as what [glib.global.getUserDataDir] returns.
    
    The return value is cached and modifying it at runtime is not supported, as
    it’s not thread-safe to modify environment variables at runtime.
    Returns: a string owned by GLib that
        must not be modified or freed.
*/
string getUserStateDir()
{
  const(char)* _cretval;
  _cretval = g_get_user_state_dir();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns the value of an environment variable.
    
    On UNIX, the name and value are byte strings which might or might not
    be in some consistent character set and encoding. On Windows, they are
    in UTF-8.
    On Windows, in case the environment variable's value contains
    references to other environment variables, they are expanded.

    Params:
      variable = the environment variable to get
    Returns: the value of the environment variable, or null if
          the environment variable is not found. The returned string
          may be overwritten by the next call to [glib.global.getenv], [glib.global.setenv]
          or [glib.global.unsetenv].
*/
string getenv(string variable)
{
  const(char)* _cretval;
  const(char)* _variable = variable.toCString(No.Alloc);
  _cretval = g_getenv(_variable);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Tests if hostname contains segments with an ASCII-compatible
    encoding of an Internationalized Domain Name. If this returns
    true, you should decode the hostname with [glib.global.hostnameToUnicode]
    before displaying it to the user.
    
    Note that a hostname might contain a mix of encoded and unencoded
    segments, and so it is possible for [glib.global.hostnameIsNonAscii] and
    [glib.global.hostnameIsAsciiEncoded] to both return true for a name.

    Params:
      hostname = a hostname
    Returns: true if hostname contains any ASCII-encoded
      segments.
*/
bool hostnameIsAsciiEncoded(string hostname)
{
  bool _retval;
  const(char)* _hostname = hostname.toCString(No.Alloc);
  _retval = cast(bool)g_hostname_is_ascii_encoded(_hostname);
  return _retval;
}

/**
    Tests if hostname is the string form of an IPv4 or IPv6 address.
    (Eg, "192.168.0.1".)
    
    Since 2.66, IPv6 addresses with a zone-id are accepted (RFC6874).

    Params:
      hostname = a hostname (or IP address in string form)
    Returns: true if hostname is an IP address
*/
bool hostnameIsIpAddress(string hostname)
{
  bool _retval;
  const(char)* _hostname = hostname.toCString(No.Alloc);
  _retval = cast(bool)g_hostname_is_ip_address(_hostname);
  return _retval;
}

/**
    Tests if hostname contains Unicode characters. If this returns
    true, you need to encode the hostname with [glib.global.hostnameToAscii]
    before using it in non-IDN-aware contexts.
    
    Note that a hostname might contain a mix of encoded and unencoded
    segments, and so it is possible for [glib.global.hostnameIsNonAscii] and
    [glib.global.hostnameIsAsciiEncoded] to both return true for a name.

    Params:
      hostname = a hostname
    Returns: true if hostname contains any non-ASCII characters
*/
bool hostnameIsNonAscii(string hostname)
{
  bool _retval;
  const(char)* _hostname = hostname.toCString(No.Alloc);
  _retval = cast(bool)g_hostname_is_non_ascii(_hostname);
  return _retval;
}

/**
    Converts hostname to its canonical ASCII form; an ASCII-only
    string containing no uppercase letters and not ending with a
    trailing dot.

    Params:
      hostname = a valid UTF-8 or ASCII hostname
    Returns: an ASCII hostname, which must be freed,
         or null if hostname is in some way invalid.
*/
string hostnameToAscii(string hostname)
{
  char* _cretval;
  const(char)* _hostname = hostname.toCString(No.Alloc);
  _cretval = g_hostname_to_ascii(_hostname);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts hostname to its canonical presentation form; a UTF-8
    string in Unicode normalization form C, containing no uppercase
    letters, no forbidden characters, and no ASCII-encoded segments,
    and not ending with a trailing dot.
    
    Of course if hostname is not an internationalized hostname, then
    the canonical presentation form will be entirely ASCII.

    Params:
      hostname = a valid UTF-8 or ASCII hostname
    Returns: a UTF-8 hostname, which must be freed,
         or null if hostname is in some way invalid.
*/
string hostnameToUnicode(string hostname)
{
  char* _cretval;
  const(char)* _hostname = hostname.toCString(No.Alloc);
  _cretval = g_hostname_to_unicode(_hostname);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Adds a function to be called whenever there are no higher priority
    events pending.
    
    If the function returns [glib.types.SOURCE_REMOVE] or false it is automatically
    removed from the list of event sources and will not be called again.
    
    See [memory management of sources][mainloop-memory-management] for details
    on how to handle the return value and memory management of data.
    
    This internally creates a main loop source using [glib.global.idleSourceNew]
    and attaches it to the global #GMainContext using [glib.source.Source.attach], so
    the callback will be invoked in whichever thread is running that main
    context. You can do these steps manually if you need greater control or to
    use a custom main context.

    Params:
      priority = the priority of the idle source. Typically this will be in the
          range between [glib.types.PRIORITY_DEFAULT_IDLE] and [glib.types.PRIORITY_HIGH_IDLE].
      function_ = function to call
    Returns: the ID (greater than 0) of the event source.
*/
uint idleAdd(int priority, glib.types.SourceFunc function_)
{
  extern(C) gboolean _function_Callback(void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    _dretval = (*_dlg)();
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = g_idle_add_full(priority, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    Removes the idle function with the given data.

    Params:
      data = the data for the idle source's callback.
    Returns: true if an idle source was found and removed.
*/
bool idleRemoveByData(void* data = null)
{
  bool _retval;
  _retval = cast(bool)g_idle_remove_by_data(data);
  return _retval;
}

/**
    Creates a new idle source.
    
    The source will not initially be associated with any #GMainContext
    and must be added to one with [glib.source.Source.attach] before it will be
    executed. Note that the default priority for idle sources is
    [glib.types.PRIORITY_DEFAULT_IDLE], as compared to other sources which
    have a default priority of [glib.types.PRIORITY_DEFAULT].
    Returns: the newly-created idle source
*/
glib.source.Source idleSourceNew()
{
  GSource* _cretval;
  _cretval = g_idle_source_new();
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Compares the two #gint64 values being pointed to and returns
    true if they are equal.
    It can be passed to [glib.hash_table.HashTable.new_] as the key_equal_func
    parameter, when using non-null pointers to 64-bit integers as keys in a
    #GHashTable.

    Params:
      v1 = a pointer to a #gint64 key
      v2 = a pointer to a #gint64 key to compare with v1
    Returns: true if the two keys match.
*/
bool int64Equal(const(void)* v1, const(void)* v2)
{
  bool _retval;
  _retval = cast(bool)g_int64_equal(v1, v2);
  return _retval;
}

/**
    Converts a pointer to a #gint64 to a hash value.
    
    It can be passed to [glib.hash_table.HashTable.new_] as the hash_func parameter,
    when using non-null pointers to 64-bit integer values as keys in a
    #GHashTable.

    Params:
      v = a pointer to a #gint64 key
    Returns: a hash value corresponding to the key.
*/
uint int64Hash(const(void)* v)
{
  uint _retval;
  _retval = g_int64_hash(v);
  return _retval;
}

/**
    Compares the two #gint values being pointed to and returns
    true if they are equal.
    It can be passed to [glib.hash_table.HashTable.new_] as the key_equal_func
    parameter, when using non-null pointers to integers as keys in a
    #GHashTable.
    
    Note that this function acts on pointers to #gint, not on #gint
    directly: if your hash table's keys are of the form
    `GINT_TO_POINTER (n)`, use [glib.global.directEqual] instead.

    Params:
      v1 = a pointer to a #gint key
      v2 = a pointer to a #gint key to compare with v1
    Returns: true if the two keys match.
*/
bool intEqual(const(void)* v1, const(void)* v2)
{
  bool _retval;
  _retval = cast(bool)g_int_equal(v1, v2);
  return _retval;
}

/**
    Converts a pointer to a #gint to a hash value.
    It can be passed to [glib.hash_table.HashTable.new_] as the hash_func parameter,
    when using non-null pointers to integer values as keys in a #GHashTable.
    
    Note that this function acts on pointers to #gint, not on #gint
    directly: if your hash table's keys are of the form
    `GINT_TO_POINTER (n)`, use [glib.global.directHash] instead.

    Params:
      v = a pointer to a #gint key
    Returns: a hash value corresponding to the key.
*/
uint intHash(const(void)* v)
{
  uint _retval;
  _retval = g_int_hash(v);
  return _retval;
}

/**
    Returns a canonical representation for string. Interned strings
    can be compared for equality by comparing the pointers, instead of
    using strcmp(). [glib.global.internStaticString] does not copy the string,
    therefore string must not be freed or modified.
    
    This function must not be used before library constructors have finished
    running. In particular, this means it cannot be used to initialize global
    variables in C++.

    Params:
      string_ = a static string
    Returns: a canonical representation for the string
*/
string internStaticString(string string_ = null)
{
  const(char)* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = g_intern_static_string(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Returns a canonical representation for string. Interned strings
    can be compared for equality by comparing the pointers, instead of
    using strcmp().
    
    This function must not be used before library constructors have finished
    running. In particular, this means it cannot be used to initialize global
    variables in C++.

    Params:
      string_ = a string
    Returns: a canonical representation for the string
*/
string internString(string string_ = null)
{
  const(char)* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = g_intern_string(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Adds the #GIOChannel into the default main loop context
    with the given priority.
    
    This internally creates a main loop source using [glib.global.ioCreateWatch]
    and attaches it to the main loop context with [glib.source.Source.attach].
    You can do these steps manually if you need greater control.

    Params:
      channel = a #GIOChannel
      priority = the priority of the #GIOChannel source
      condition = the condition to watch for
      func = the function to call when the condition is satisfied
    Returns: the event source id
*/
uint ioAddWatch(glib.iochannel.IOChannel channel, int priority, glib.types.IOCondition condition, glib.types.IOFunc func)
{
  extern(C) gboolean _funcCallback(GIOChannel* source, GIOCondition condition, void* data)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.IOFunc*)data;

    _dretval = (*_dlg)(source ? new glib.iochannel.IOChannel(cast(void*)source, No.Take) : null, condition);
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _funcCB = func ? &_funcCallback : null;
  uint _retval;
  auto _func = func ? freezeDelegate(cast(void*)&func) : null;
  GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
  _retval = g_io_add_watch_full(channel ? cast(GIOChannel*)channel._cPtr(No.Dup) : null, priority, condition, _funcCB, _func, _funcDestroyCB);
  return _retval;
}

/**
    Creates a #GSource that's dispatched when condition is met for the
    given channel. For example, if condition is [glib.types.IOCondition.In], the source will
    be dispatched when there's data available for reading.
    
    The callback function invoked by the #GSource should be added with
    [glib.source.Source.setCallback], but it has type #GIOFunc (not #GSourceFunc).
    
    [glib.global.ioAddWatch] is a simpler interface to this same functionality, for
    the case where you want to add the source to the default main loop context
    at the default priority.
    
    On Windows, polling a #GSource created to watch a channel for a socket
    puts the socket in non-blocking mode. This is a side-effect of the
    implementation and unavoidable.

    Params:
      channel = a #GIOChannel to watch
      condition = conditions to watch for
    Returns: a new #GSource
*/
glib.source.Source ioCreateWatch(glib.iochannel.IOChannel channel, glib.types.IOCondition condition)
{
  GSource* _cretval;
  _cretval = g_io_create_watch(channel ? cast(GIOChannel*)channel._cPtr(No.Dup) : null, condition);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Gets the names of all variables set in the environment.
    
    Programs that want to be portable to Windows should typically use
    this function and [glib.global.getenv] instead of using the environ array
    from the C library directly. On Windows, the strings in the environ
    array are in system codepage encoding, while in most of the typical
    use cases for environment variables in GLib-using programs you want
    the UTF-8 encoding that this function and [glib.global.getenv] provide.
    Returns: a null-terminated list of strings which must be freed with
          [glib.global.strfreev].
*/
string[] listenv()
{
  char** _cretval;
  _cretval = g_listenv();
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Converts a string from UTF-8 to the encoding used for strings by
    the C runtime (usually the same as that used by the operating
    system) in the [current locale][setlocale]. On Windows this means
    the system codepage.
    
    The input string shall not contain nul characters even if the len
    argument is positive. A nul character found inside the string will result
    in error `G_CONVERT_ERROR_ILLEGAL_SEQUENCE`. Use [glib.global.convert] to convert
    input that may contain embedded nul characters.

    Params:
      utf8string = a UTF-8 encoded string
      bytesRead = location to store the number of bytes in the
                        input string that were successfully converted, or null.
                        Even if the conversion was successful, this may be
                        less than len if there were partial characters
                        at the end of the input. If the error
                        `G_CONVERT_ERROR_ILLEGAL_SEQUENCE` occurs, the value
                        stored will be the byte offset after the last valid
                        input sequence.
    Returns: A newly-allocated buffer containing the converted string,
               or null on an error, and error will be set.
    Throws: [ErrorWrap]
*/
ubyte[] localeFromUtf8(ubyte[] utf8string, out size_t bytesRead)
{
  ubyte* _cretval;
  size_t _cretlength;
  ptrdiff_t _len;
  if (utf8string)
    _len = cast(ptrdiff_t)utf8string.length;

  auto _utf8string = cast(const(ubyte)*)utf8string.ptr;
  GError *_err;
  _cretval = g_locale_from_utf8(_utf8string, _len, cast(size_t*)&bytesRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  ubyte[] _retval;

  if (_cretval)
  {
    _retval = cast(ubyte[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Converts a string which is in the encoding used for strings by
    the C runtime (usually the same as that used by the operating
    system) in the [current locale][setlocale] into a UTF-8 string.
    
    If the source encoding is not UTF-8 and the conversion output contains a
    nul character, the error `G_CONVERT_ERROR_EMBEDDED_NUL` is set and the
    function returns null.
    If the source encoding is UTF-8, an embedded nul character is treated with
    the `G_CONVERT_ERROR_ILLEGAL_SEQUENCE` error for backward compatibility with
    earlier versions of this library. Use [glib.global.convert] to produce output that
    may contain embedded nul characters.

    Params:
      opsysstring = a string in the
                        encoding of the current locale. On Windows
                        this means the system codepage.
      bytesRead = location to store the number of bytes in the
                        input string that were successfully converted, or null.
                        Even if the conversion was successful, this may be
                        less than len if there were partial characters
                        at the end of the input. If the error
                        `G_CONVERT_ERROR_ILLEGAL_SEQUENCE` occurs, the value
                        stored will be the byte offset after the last valid
                        input sequence.
    Returns: The converted string, or null on an error.
    Throws: [ErrorWrap]
*/
string localeToUtf8(ubyte[] opsysstring, out size_t bytesRead)
{
  char* _cretval;
  size_t _cretlength;
  ptrdiff_t _len;
  if (opsysstring)
    _len = cast(ptrdiff_t)opsysstring.length;

  auto _opsysstring = cast(const(ubyte)*)opsysstring.ptr;
  GError *_err;
  _cretval = g_locale_to_utf8(_opsysstring, _len, cast(size_t*)&bytesRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval;

  if (_cretval)
  {
    _retval = cast(string)_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    The default log handler set up by GLib; `funcGLib.log_set_default_handler`
    allows to install an alternate default log handler.
    
    This is used if no log handler has been set for the particular log
    domain and log level combination. It outputs the message to `stderr`
    or `stdout` and if the log level is fatal it calls `funcGLib.BREAKPOINT`. It automatically
    prints a new-line character after the message, so one does not need to be
    manually included in message.
    
    The behavior of this log handler can be influenced by a number of
    environment variables:
    
      $(LIST
          * `G_MESSAGES_PREFIXED`: A `:`-separated list of log levels for which
            messages should be prefixed by the program name and PID of the
            application.
          * `G_MESSAGES_DEBUG`: A space-separated list of log domains for
            which debug and informational messages are printed. By default
            these messages are not printed. If you need to set the allowed
            domains at runtime, use `funcGLib.log_writer_default_set_debug_domains`.
      )
        
    `stderr` is used for levels `flagsGLib.LogLevelFlags.LEVEL_ERROR`,
    `flagsGLib.LogLevelFlags.LEVEL_CRITICAL`, `flagsGLib.LogLevelFlags.LEVEL_WARNING` and
    `flagsGLib.LogLevelFlags.LEVEL_MESSAGE`. `stdout` is used for
    the rest, unless `stderr` was requested by
    `funcGLib.log_writer_default_set_use_stderr`.
    
    This has no effect if structured logging is enabled; see
    [Using Structured Logging](logging.html#using-structured-logging).

    Params:
      logDomain = the log domain of the message, or `NULL` for the
          default `""` application domain
      logLevel = the level of the message
      message = the message
      unusedData = data passed from `funcGLib.log` which is unused
*/
void logDefaultHandler(string logDomain, glib.types.LogLevelFlags logLevel, string message = null, void* unusedData = null)
{
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  const(char)* _message = message.toCString(No.Alloc);
  g_log_default_handler(_logDomain, logLevel, _message, unusedData);
}

/**
    Return whether debug output from the GLib logging system is enabled.
    
    Note that this should not be used to conditionalise calls to `funcGLib.debug` or
    other logging functions; it should only be used from [glib.types.LogWriterFunc]
    implementations.
    
    Note also that the value of this does not depend on `G_MESSAGES_DEBUG`, nor
    `funcGLib.log_writer_default_set_debug_domains`; see the docs for `funcGLib.log_set_debug_enabled`.
    Returns: `TRUE` if debug output is enabled, `FALSE` otherwise
*/
bool logGetDebugEnabled()
{
  bool _retval;
  _retval = cast(bool)g_log_get_debug_enabled();
  return _retval;
}

/**
    Removes the log handler.
    
    This has no effect if structured logging is enabled; see
    [Using Structured Logging](logging.html#using-structured-logging).

    Params:
      logDomain = the log domain
      handlerId = the ID of the handler, which was returned
          in `funcGLib.log_set_handler`
*/
void logRemoveHandler(string logDomain, uint handlerId)
{
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  g_log_remove_handler(_logDomain, handlerId);
}

/**
    Sets the message levels which are always fatal, in any log domain.
    
    When a message with any of these levels is logged the program terminates.
    You can only set the levels defined by GLib to be fatal.
    `flagsGLib.LogLevelFlags.LEVEL_ERROR` is always fatal.
    
    You can also make some message levels fatal at runtime by setting
    the `G_DEBUG` environment variable (see
    [Running GLib Applications](glib-running.html)).
    
    Libraries should not call this function, as it affects all messages logged
    by a process, including those from other libraries.
    
    Structured log messages (using `funcGLib.log_structured` and
    `funcGLib.log_structured_array`) are fatal only if the default log writer is used;
    otherwise it is up to the writer function to determine which log messages
    are fatal. See [Using Structured Logging](logging.html#using-structured-logging).

    Params:
      fatalMask = the mask containing bits set for each level of error which is
          to be fatal
    Returns: the old fatal mask
*/
glib.types.LogLevelFlags logSetAlwaysFatal(glib.types.LogLevelFlags fatalMask)
{
  GLogLevelFlags _cretval;
  _cretval = g_log_set_always_fatal(fatalMask);
  glib.types.LogLevelFlags _retval = cast(glib.types.LogLevelFlags)_cretval;
  return _retval;
}

/**
    Enable or disable debug output from the GLib logging system for all domains.
    
    This value interacts disjunctively with `G_MESSAGES_DEBUG` and
    `funcGLib.log_writer_default_set_debug_domains` — if any of them would allow
    a debug message to be outputted, it will be.
    
    Note that this should not be used from within library code to enable debug
    output — it is intended for external use.

    Params:
      enabled = `TRUE` to enable debug output, `FALSE` otherwise
*/
void logSetDebugEnabled(bool enabled)
{
  g_log_set_debug_enabled(enabled);
}

/**
    Sets the log levels which are fatal in the given domain.
    
    `flagsGLib.LogLevelFlags.LEVEL_ERROR` is always fatal.
    
    This has no effect on structured log messages (using `funcGLib.log_structured` or
    `funcGLib.log_structured_array`). To change the fatal behaviour for specific log
    messages, programs must install a custom log writer function using
    `funcGLib.log_set_writer_func`. See
    [Using Structured Logging](logging.html#using-structured-logging).
    
    This function is mostly intended to be used with
    `flagsGLib.LogLevelFlags.LEVEL_CRITICAL`.  You should typically not set
    `flagsGLib.LogLevelFlags.LEVEL_WARNING`, `flagsGLib.LogLevelFlags.LEVEL_MESSAGE`, `flagsGLib.LogLevelFlags.LEVEL_INFO` or
    `flagsGLib.LogLevelFlags.LEVEL_DEBUG` as fatal except inside of test programs.

    Params:
      logDomain = the log domain
      fatalMask = the new fatal mask
    Returns: the old fatal mask for the log domain
*/
glib.types.LogLevelFlags logSetFatalMask(string logDomain, glib.types.LogLevelFlags fatalMask)
{
  GLogLevelFlags _cretval;
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  _cretval = g_log_set_fatal_mask(_logDomain, fatalMask);
  glib.types.LogLevelFlags _retval = cast(glib.types.LogLevelFlags)_cretval;
  return _retval;
}

/**
    Like `funcGLib.log_set_handler`, but takes a destroy notify for the user_data.
    
    This has no effect if structured logging is enabled; see
    [Using Structured Logging](logging.html#using-structured-logging).

    Params:
      logDomain = the log domain, or `NULL` for the default `""`
          application domain
      logLevels = the log levels to apply the log handler for.
          To handle fatal and recursive messages as well, combine
          the log levels with the `flagsGLib.LogLevelFlags.FLAG_FATAL` and
          `flagsGLib.LogLevelFlags.FLAG_RECURSION` bit flags.
      logFunc = the log handler function
    Returns: the ID of the new handler
*/
uint logSetHandler(string logDomain, glib.types.LogLevelFlags logLevels, glib.types.LogFunc logFunc)
{
  extern(C) void _logFuncCallback(const(char)* logDomain, GLogLevelFlags logLevel, const(char)* message, void* userData)
  {
    auto _dlg = cast(glib.types.LogFunc*)userData;
    string _logDomain = logDomain.fromCString(No.Free);
    string _message = message.fromCString(No.Free);

    (*_dlg)(_logDomain, logLevel, _message);
  }
  auto _logFuncCB = logFunc ? &_logFuncCallback : null;
  uint _retval;
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  auto _logFunc = logFunc ? freezeDelegate(cast(void*)&logFunc) : null;
  GDestroyNotify _logFuncDestroyCB = logFunc ? &thawDelegate : null;
  _retval = g_log_set_handler_full(_logDomain, logLevels, _logFuncCB, _logFunc, _logFuncDestroyCB);
  return _retval;
}

/**
    Log a message with structured data, accepting the data within a [glib.variant.Variant].
    
    This version is especially useful for use in other languages, via introspection.
    
    The only mandatory item in the fields dictionary is the `"MESSAGE"` which must
    contain the text shown to the user.
    
    The values in the fields dictionary are likely to be of type `G_VARIANT_TYPE_STRING`.
    Array of bytes (`G_VARIANT_TYPE_BYTESTRING`) is also
    supported. In this case the message is handled as binary and will be forwarded
    to the log writer as such. The size of the array should not be higher than
    `G_MAXSSIZE`. Otherwise it will be truncated to this size. For other types
    [glib.variant.Variant.print] will be used to convert the value into a string.
    
    For more details on its usage and about the parameters, see `funcGLib.log_structured`.

    Params:
      logDomain = log domain, usually [glib.types.LOG_DOMAIN]
      logLevel = log level, either from [glib.types.LogLevelFlags], or a user-defined
           level
      fields = a dictionary ([glib.variant.Variant] of the type `G_VARIANT_TYPE_VARDICT`)
        containing the key-value pairs of message data.
*/
void logVariant(string logDomain, glib.types.LogLevelFlags logLevel, glib.variant.Variant fields)
{
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  g_log_variant(_logDomain, logLevel, fields ? cast(GVariant*)fields._cPtr(No.Dup) : null);
}

/**
    Reset the list of domains to be logged, that might be initially set by the
    `G_MESSAGES_DEBUG` environment variable.
    
    This function is thread-safe.

    Params:
      domains = `NULL`-terminated array with domains to be printed.
          `NULL` or an array with no values means none. Array with a single value `"all"` means all.
*/
void logWriterDefaultSetDebugDomains(string[] domains = null)
{
  const(char)*[] _tmpdomains;
  foreach (s; domains)
    _tmpdomains ~= s.toCString(No.Alloc);
  _tmpdomains ~= null;
  const(char*)* _domains = _tmpdomains.ptr;

  g_log_writer_default_set_debug_domains(_domains);
}

/**
    Configure whether the built-in log functions will output all log messages to
    `stderr`.
    
    The built-in log functions are `funcGLib.log_default_handler` for the
    old-style API, and both `funcGLib.log_writer_default` and
    `funcGLib.log_writer_standard_streams` for the structured API.
    
    By default, log messages of levels `flagsGLib.LogLevelFlags.LEVEL_INFO` and
    `flagsGLib.LogLevelFlags.LEVEL_DEBUG` are sent to `stdout`, and other log messages are
    sent to `stderr`. This is problematic for applications that intend
    to reserve `stdout` for structured output such as JSON or XML.
    
    This function sets global state. It is not thread-aware, and should be
    called at the very start of a program, before creating any other threads
    or creating objects that could create worker threads of their own.

    Params:
      useStderr = If `TRUE`, use `stderr` for log messages that would
         normally have appeared on `stdout`
*/
void logWriterDefaultSetUseStderr(bool useStderr)
{
  g_log_writer_default_set_use_stderr(useStderr);
}

/**
    Check whether `funcGLib.log_writer_default` and `funcGLib.log_default_handler` would
    ignore a message with the given domain and level.
    
    As with `funcGLib.log_default_handler`, this function drops debug and informational
    messages unless their log domain (or `all`) is listed in the space-separated
    `G_MESSAGES_DEBUG` environment variable, or by `funcGLib.log_writer_default_set_debug_domains`.
    
    This can be used when implementing log writers with the same filtering
    behaviour as the default, but a different destination or output format:
    
    ```c
    if (g_log_writer_default_would_drop (log_level, log_domain))
      return G_LOG_WRITER_HANDLED;
    ]|
    
    or to skip an expensive computation if it is only needed for a debugging
    message, and `G_MESSAGES_DEBUG` is not set:
    
    ```c
    if (!g_log_writer_default_would_drop (G_LOG_LEVEL_DEBUG, G_LOG_DOMAIN))
      {
        g_autofree gchar *result = expensive_computation (my_object);
    
        g_debug ("my_object result: `s`", result);
      }
    ```

    Params:
      logLevel = log level, either from [glib.types.LogLevelFlags], or a user-defined
           level
      logDomain = log domain
    Returns: `TRUE` if the log message would be dropped by GLib’s
        default log handlers
*/
bool logWriterDefaultWouldDrop(glib.types.LogLevelFlags logLevel, string logDomain = null)
{
  bool _retval;
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  _retval = cast(bool)g_log_writer_default_would_drop(logLevel, _logDomain);
  return _retval;
}

/**
    Check whether the given output_fd file descriptor is a connection to the
    systemd journal, or something else (like a log file or `stdout` or
    `stderr`).
    
    Invalid file descriptors are accepted and return `FALSE`, which allows for
    the following construct without needing any additional error handling:
    ```c
    is_journald = g_log_writer_is_journald (fileno (stderr));
    ```

    Params:
      outputFd = output file descriptor to check
    Returns: `TRUE` if output_fd points to the journal, `FALSE` otherwise
*/
bool logWriterIsJournald(int outputFd)
{
  bool _retval;
  _retval = cast(bool)g_log_writer_is_journald(outputFd);
  return _retval;
}

/**
    Check whether the given output_fd file descriptor supports
    [ANSI color escape sequences](https://en.wikipedia.org/wiki/ANSI_escape_code).
    
    If so, they can safely be used when formatting log messages.

    Params:
      outputFd = output file descriptor to check
    Returns: `TRUE` if ANSI color escapes are supported, `FALSE` otherwise
*/
bool logWriterSupportsColor(int outputFd)
{
  bool _retval;
  _retval = cast(bool)g_log_writer_supports_color(outputFd);
  return _retval;
}

/**
    A wrapper for the POSIX lstat() function. The lstat() function is
    like stat() except that in the case of symbolic links, it returns
    information about the symbolic link itself and not the file that it
    refers to. If the system does not support symbolic links [glib.global.lstat]
    is identical to [glib.global.stat].
    
    See your C library manual for more details about lstat().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      buf = a pointer to a stat struct, which will be filled with the file
            information
    Returns: 0 if the information was successfully retrieved,
          -1 if an error occurred
*/
int lstat(string filename, glib.types.StatBuf buf)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_lstat(_filename, buf);
  return _retval;
}

/**
    Returns the currently firing source for this thread.
    Returns: The currently firing source or null.
*/
glib.source.Source mainCurrentSource()
{
  GSource* _cretval;
  _cretval = g_main_current_source();
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, No.Take) : null;
  return _retval;
}

/**
    Returns the depth of the stack of calls to
    [glib.main_context.MainContext.dispatch] on any #GMainContext in the current thread.
    That is, when called from the toplevel, it gives 0. When
    called from within a callback from [glib.main_context.MainContext.iteration]
    (or [glib.main_loop.MainLoop.run], etc.) it returns 1. When called from within
    a callback to a recursive call to [glib.main_context.MainContext.iteration],
    it returns 2. And so forth.
    
    This function is useful in a situation like the following:
    Imagine an extremely simple "garbage collected" system.
    
    ```c
    static GList *free_list;
    
    gpointer
    allocate_memory (gsize size)
    {
      gpointer result = g_malloc (size);
      free_list = g_list_prepend (free_list, result);
      return result;
    }
    
    void
    free_allocated_memory (void)
    {
      GList *l;
      for (l = free_list; l; l = l->next);
        g_free (l->data);
      g_list_free (free_list);
      free_list = NULL;
     }
    
    [...]
    
    while (TRUE);
     {
       g_main_context_iteration (NULL, TRUE);
       free_allocated_memory();
      }
    ```
    
    This works from an application, however, if you want to do the same
    thing from a library, it gets more difficult, since you no longer
    control the main loop. You might think you can simply use an idle
    function to make the call to free_allocated_memory(), but that
    doesn't work, since the idle function could be called from a
    recursive callback. This can be fixed by using [glib.global.mainDepth]
    
    ```c
    gpointer
    allocate_memory (gsize size)
    {
      FreeListBlock *block = g_new (FreeListBlock, 1);
      block->mem = g_malloc (size);
      block->depth = g_main_depth ();
      free_list = g_list_prepend (free_list, block);
      return block->mem;
    }
    
    void
    free_allocated_memory (void)
    {
      GList *l;
      
      int depth = g_main_depth ();
      for (l = free_list; l; );
        {
          GList *next = l->next;
          FreeListBlock *block = l->data;
          if (block->depth > depth)
            {
              g_free (block->mem);
              g_free (block);
              free_list = g_list_delete_link (free_list, l);
            }
                  
          l = next;
        }
      }
    ```
    
    There is a temptation to use [glib.global.mainDepth] to solve
    problems with reentrancy. For instance, while waiting for data
    to be received from the network in response to a menu item,
    the menu item might be selected again. It might seem that
    one could make the menu item's callback return immediately
    and do nothing if [glib.global.mainDepth] returns a value greater than 1.
    However, this should be avoided since the user then sees selecting
    the menu item do nothing. Furthermore, you'll find yourself adding
    these checks all over your code, since there are doubtless many,
    many things that the user could do. Instead, you can use the
    following techniques:
    
    1. Use [gtk.widget.Widget.setSensitive] or modal dialogs to prevent
       the user from interacting with elements while the main
       loop is recursing.
    
    2. Avoid main loop recursion in situations where you can't handle
       arbitrary  callbacks. Instead, structure your code so that you
       simply return to the main loop and then get called again when
       there is more work to do.
    Returns: The main loop recursion level in the current thread
*/
int mainDepth()
{
  int _retval;
  _retval = g_main_depth();
  return _retval;
}

/**
    Allocates n_bytes bytes of memory.
    If n_bytes is 0 it returns null.
    
    If the allocation fails (because the system is out of memory),
    the program is terminated.

    Params:
      nBytes = the number of bytes to allocate
    Returns: a pointer to the allocated memory
*/
void* gmalloc(size_t nBytes)
{
  auto _retval = g_malloc(nBytes);
  return _retval;
}

/**
    Allocates n_bytes bytes of memory, initialized to 0's.
    If n_bytes is 0 it returns null.
    
    If the allocation fails (because the system is out of memory),
    the program is terminated.

    Params:
      nBytes = the number of bytes to allocate
    Returns: a pointer to the allocated memory
*/
void* malloc0(size_t nBytes)
{
  auto _retval = g_malloc0(nBytes);
  return _retval;
}

/**
    This function is similar to [glib.global.malloc0], allocating (n_blocks * n_block_bytes) bytes,
    but care is taken to detect possible overflow during multiplication.
    
    If the allocation fails (because the system is out of memory),
    the program is terminated.

    Params:
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
    Returns: a pointer to the allocated memory
*/
void* malloc0N(size_t nBlocks, size_t nBlockBytes)
{
  auto _retval = g_malloc0_n(nBlocks, nBlockBytes);
  return _retval;
}

/**
    This function is similar to [glib.global.gmalloc], allocating (n_blocks * n_block_bytes) bytes,
    but care is taken to detect possible overflow during multiplication.
    
    If the allocation fails (because the system is out of memory),
    the program is terminated.

    Params:
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
    Returns: a pointer to the allocated memory
*/
void* mallocN(size_t nBlocks, size_t nBlockBytes)
{
  auto _retval = g_malloc_n(nBlocks, nBlockBytes);
  return _retval;
}

/** */
glib.types.Quark markupErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_markup_error_quark();
  return _retval;
}

/**
    Escapes text so that the markup parser will parse it verbatim.
    Less than, greater than, ampersand, etc. are replaced with the
    corresponding entities. This function would typically be used
    when writing out a file to be parsed with the markup parser.
    
    Note that this function doesn't protect whitespace and line endings
    from being processed according to the XML rules for normalization
    of line endings and attribute values.
    
    Note also that this function will produce character references in
    the range of &#x1; ... &#x1f; for all control sequences
    except for tabstop, newline and carriage return.  The character
    references in this range are not valid XML 1.0, but they are
    valid XML 1.1 and will be accepted by the GMarkup parser.

    Params:
      text = some valid UTF-8 text
    Returns: a newly allocated string with the escaped text
*/
string markupEscapeText(string text)
{
  char* _cretval;
  ptrdiff_t _length;
  if (text)
    _length = cast(ptrdiff_t)text.length;

  auto _text = cast(const(char)*)text.ptr;
  _cretval = g_markup_escape_text(_text, _length);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Checks whether the allocator used by [glib.global.gmalloc] is the system's
    malloc implementation. If it returns true memory allocated with
    malloc() can be used interchangeably with memory allocated using [glib.global.gmalloc].
    This function is useful for avoiding an extra copy of allocated memory returned
    by a non-GLib-based API.
    Returns: if true, malloc() and [glib.global.gmalloc] can be mixed.

    Deprecated: GLib always uses the system malloc, so this function always
      returns true.
*/
bool memIsSystemMalloc()
{
  bool _retval;
  _retval = cast(bool)g_mem_is_system_malloc();
  return _retval;
}

/**
    GLib used to support some tools for memory profiling, but this
    no longer works. There are many other useful tools for memory
    profiling these days which can be used instead.

    Deprecated: Use other memory profiling tools instead
*/
void memProfile()
{
  g_mem_profile();
}

/**
    This function used to let you override the memory allocation function.
    However, its use was incompatible with the use of global constructors
    in GLib and GIO, because those use the GLib allocators before main is
    reached. Therefore this function is now deprecated and is just a stub.

    Params:
      vtable = table of memory allocation routines.

    Deprecated: This function now does nothing. Use other memory
      profiling tools instead
*/
void memSetVtable(glib.types.MemVTable vtable)
{
  g_mem_set_vtable(&vtable);
}

/**
    Allocates byte_size bytes of memory, and copies byte_size bytes into it
    from mem. If mem is `NULL` it returns `NULL`.

    Params:
      mem = the memory to copy
      byteSize = the number of bytes to copy
    Returns: a pointer to the newly-allocated copy of the memory

    Deprecated: Use `funcGLib.memdup2` instead, as it accepts a gsize argument
        for byte_size, avoiding the possibility of overflow in a [gobject.types.size_t] → [gda.types.uint]
        conversion
*/
void* memdup(const(void)* mem, uint byteSize)
{
  auto _retval = g_memdup(mem, byteSize);
  return _retval;
}

/**
    Allocates byte_size bytes of memory, and copies byte_size bytes into it
    from mem. If mem is `NULL` it returns `NULL`.
    
    This replaces `funcGLib.memdup`, which was prone to integer overflows when
    converting the argument from a [gobject.types.size_t] to a [gda.types.uint].

    Params:
      mem = the memory to copy
      byteSize = the number of bytes to copy
    Returns: a pointer to the newly-allocated copy of the memory
*/
void* memdup2(const(void)* mem, size_t byteSize)
{
  auto _retval = g_memdup2(mem, byteSize);
  return _retval;
}

/**
    A wrapper for the POSIX mkdir() function. The mkdir() function
    attempts to create a directory with the given name and permissions.
    The mode argument is ignored on Windows.
    
    See your C library manual for more details about mkdir().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      mode = permissions to use for the newly created directory
    Returns: 0 if the directory was successfully created, -1 if an error
         occurred
*/
int mkdir(string filename, int mode)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_mkdir(_filename, mode);
  return _retval;
}

/**
    Create a directory if it doesn't already exist. Create intermediate
    parent directories as needed, too.

    Params:
      pathname = a pathname in the GLib file name encoding
      mode = permissions to use for newly created directories
    Returns: 0 if the directory already exists, or was successfully
      created. Returns -1 if an error occurred, with errno set.
*/
int mkdirWithParents(string pathname, int mode)
{
  int _retval;
  const(char)* _pathname = pathname.toCString(No.Alloc);
  _retval = g_mkdir_with_parents(_pathname, mode);
  return _retval;
}

/**
    Set the pointer at the specified location to null.

    Params:
      nullifyLocation = the memory address of the pointer.
*/
void nullifyPointer(out void* nullifyLocation)
{
  g_nullify_pointer(cast(void**)&nullifyLocation);
}

/** */
glib.types.Quark numberParserErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_number_parser_error_quark();
  return _retval;
}

/**
    Prompts the user with
    `[E]xit, [H]alt, show [S]tack trace or [P]roceed`.
    This function is intended to be used for debugging use only.
    The following example shows how it can be used together with
    the [glib.global.log] functions.
    
    ```c
    #include <glib.h>
    
    static void
    log_handler (const gchar   *log_domain,
                 GLogLevelFlags log_level,
                 const gchar   *message,
                 gpointer       user_data)
    {
      g_log_default_handler (log_domain, log_level, message, user_data);
    
      g_on_error_query (MY_PROGRAM_NAME);
    }
    
    int
    main (int argc, char *argv[])
    {
      g_log_set_handler (MY_LOG_DOMAIN,
                         G_LOG_LEVEL_WARNING |
                         G_LOG_LEVEL_ERROR |
                         G_LOG_LEVEL_CRITICAL,
                         log_handler,
                         NULL);
      ...
    ```
    
    If "[E]xit" is selected, the application terminates with a call
    to _exit(0).
    
    If "[S]tack" trace is selected, [glib.global.onErrorStackTrace] is called.
    This invokes gdb, which attaches to the current process and shows
    a stack trace. The prompt is then shown again.
    
    If "[P]roceed" is selected, the function returns.
    
    This function may cause different actions on non-UNIX platforms.
    
    On Windows consider using the `G_DEBUGGER` environment
    variable (see [Running GLib Applications](glib-running.html)) and
    calling [glib.global.onErrorStackTrace] instead.

    Params:
      prgName = the program name, needed by gdb for the "[S]tack trace"
            option. If prg_name is null, [glib.global.getPrgname] is called to get
            the program name (which will work correctly if [gdk.global.init_] or
            [gtk.global.init_] has been called)
*/
void onErrorQuery(string prgName)
{
  const(char)* _prgName = prgName.toCString(No.Alloc);
  g_on_error_query(_prgName);
}

/**
    Invokes gdb, which attaches to the current process and shows a
    stack trace. Called by [glib.global.onErrorQuery] when the "[S]tack trace"
    option is selected. You can get the current process's program name
    with [glib.global.getPrgname], assuming that you have called [gtk.global.init_] or
    [gdk.global.init_].
    
    This function may cause different actions on non-UNIX platforms.
    
    When running on Windows, this function is *not* called by
    [glib.global.onErrorQuery]. If called directly, it will raise an
    exception, which will crash the program. If the `G_DEBUGGER` environment
    variable is set, a debugger will be invoked to attach and
    handle that exception (see [Running GLib Applications](glib-running.html)).

    Params:
      prgName = the program name, needed by gdb for the "[S]tack trace"
            option
*/
void onErrorStackTrace(string prgName)
{
  const(char)* _prgName = prgName.toCString(No.Alloc);
  g_on_error_stack_trace(_prgName);
}

/**
    A wrapper for the POSIX open() function. The open() function is
    used to convert a pathname into a file descriptor.
    
    On POSIX systems file descriptors are implemented by the operating
    system. On Windows, it's the C library that implements open() and
    file descriptors. The actual Win32 API for opening files is quite
    different, see MSDN documentation for CreateFile(). The Win32 API
    uses file handles, which are more randomish integers, not small
    integers like file descriptors.
    
    Because file descriptors are specific to the C library on Windows,
    the file descriptor returned by this function makes sense only to
    functions in the same C library. Thus if the GLib-using code uses a
    different C library than GLib does, the file descriptor returned by
    this function cannot be passed to C library functions like write()
    or read().
    
    See your C library manual for more details about open().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      flags = as in open()
      mode = as in open()
    Returns: a new file descriptor, or -1 if an error occurred.
          The return value can be used exactly like the return value
          from open().
*/
int open(string filename, int flags, int mode)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_open(_filename, flags, mode);
  return _retval;
}

/** */
glib.types.Quark optionErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_option_error_quark();
  return _retval;
}

/**
    Gets the last component of the filename.
    
    If file_name ends with a directory separator it gets the component
    before the last slash. If file_name consists only of directory
    separators (and on Windows, possibly a drive letter), a single
    separator is returned. If file_name is empty, it gets ".".

    Params:
      fileName = the name of the file
    Returns: a newly allocated string
        containing the last component of the filename
*/
string pathGetBasename(string fileName)
{
  char* _cretval;
  const(char)* _fileName = fileName.toCString(No.Alloc);
  _cretval = g_path_get_basename(_fileName);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Gets the directory components of a file name. For example, the directory
    component of `/usr/bin/test` is `/usr/bin`. The directory component of `/`
    is `/`.
    
    If the file name has no directory components "." is returned.
    The returned string should be freed when no longer needed.

    Params:
      fileName = the name of the file
    Returns: the directory components of the file
*/
string pathGetDirname(string fileName)
{
  char* _cretval;
  const(char)* _fileName = fileName.toCString(No.Alloc);
  _cretval = g_path_get_dirname(_fileName);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns true if the given file_name is an absolute file name.
    Note that this is a somewhat vague concept on Windows.
    
    On POSIX systems, an absolute file name is well-defined. It always
    starts from the single root directory. For example "/usr/local".
    
    On Windows, the concepts of current drive and drive-specific
    current directory introduce vagueness. This function interprets as
    an absolute file name one that either begins with a directory
    separator such as "\Users\tml" or begins with the root on a drive,
    for example "C:\Windows". The first case also includes UNC paths
    such as "\\\\myserver\docs\foo". In all cases, either slashes or
    backslashes are accepted.
    
    Note that a file name relative to the current drive root does not
    truly specify a file uniquely over time and across processes, as
    the current drive is a per-process value and can be changed.
    
    File names relative the current directory on some specific drive,
    such as "D:foo/bar", are not interpreted as absolute by this
    function, but they obviously are not relative to the normal current
    directory as returned by getcwd() or [glib.global.getCurrentDir]
    either. Such paths should be avoided, or need to be handled using
    Windows-specific code.

    Params:
      fileName = a file name
    Returns: true if file_name is absolute
*/
bool pathIsAbsolute(string fileName)
{
  bool _retval;
  const(char)* _fileName = fileName.toCString(No.Alloc);
  _retval = cast(bool)g_path_is_absolute(_fileName);
  return _retval;
}

/**
    Returns a pointer into file_name after the root component,
    i.e. after the "/" in UNIX or "C:\" under Windows. If file_name
    is not an absolute path it returns null.

    Params:
      fileName = a file name
    Returns: a pointer into file_name after the
          root component
*/
string pathSkipRoot(string fileName)
{
  const(char)* _cretval;
  const(char)* _fileName = fileName.toCString(No.Alloc);
  _cretval = g_path_skip_root(_fileName);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Matches a string against a pattern given as a string. If this
    function is to be called in a loop, it's more efficient to compile
    the pattern once with [glib.pattern_spec.PatternSpec.new_] and call
    [glib.global.patternMatchString] repeatedly.

    Params:
      pattern = the UTF-8 encoded pattern
      string_ = the UTF-8 encoded string to match
    Returns: true if string matches pspec
*/
bool patternMatchSimple(string pattern, string string_)
{
  bool _retval;
  const(char)* _pattern = pattern.toCString(No.Alloc);
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = cast(bool)g_pattern_match_simple(_pattern, _string_);
  return _retval;
}

/**
    This is equivalent to g_bit_lock, but working on pointers (or other
    pointer-sized values).
    
    For portability reasons, you may only lock on the bottom 32 bits of
    the pointer.
    
    While address has a `volatile` qualifier, this is a historical
    artifact and the argument passed to it should not be `volatile`.

    Params:
      address = a pointer to a #gpointer-sized value
      lockBit = a bit value between 0 and 31
*/
void pointerBitLock(void* address, int lockBit)
{
  g_pointer_bit_lock(address, lockBit);
}

/**
    This is equivalent to g_bit_lock, but working on pointers (or other
    pointer-sized values).
    
    For portability reasons, you may only lock on the bottom 32 bits of
    the pointer.

    Params:
      address = a pointer to a #gpointer-sized value
      lockBit = a bit value between 0 and 31
      outPtr = returns the set pointer atomically.
          This is the value after setting the lock, it thus always has the
          lock bit set, while previously address had the lockbit unset.
          You may also use [glib.global.pointerBitLockMaskPtr] to clear the lock bit.
*/
void pointerBitLockAndGet(void* address, uint lockBit, out size_t outPtr)
{
  g_pointer_bit_lock_and_get(address, lockBit, cast(size_t*)&outPtr);
}

/**
    This mangles ptr as [glib.global.pointerBitLock] and [glib.global.pointerBitUnlock]
    do.

    Params:
      ptr = the pointer to mask
      lockBit = the bit to set/clear. If set to `G_MAXUINT`, the
          lockbit is taken from preserve_ptr or ptr (depending on preserve_mask).
      set = whether to set (lock) the bit or unset (unlock). This
          has no effect, if lock_bit is set to `G_MAXUINT`.
      preserveMask = if non-zero, a bit-mask for preserve_ptr. The
          preserve_mask bits from preserve_ptr are set in the result.
          Note that the lock_bit bit will be always set according to set,
          regardless of preserve_mask and preserve_ptr (unless lock_bit is
          `G_MAXUINT`).
      preservePtr = if preserve_mask is non-zero, the bits
          from this pointer are set in the result.
    Returns: the mangled pointer.
*/
void* pointerBitLockMaskPtr(void* ptr, uint lockBit, bool set, size_t preserveMask, void* preservePtr = null)
{
  auto _retval = g_pointer_bit_lock_mask_ptr(ptr, lockBit, set, preserveMask, preservePtr);
  return _retval;
}

/**
    This is equivalent to [glib.global.bitTrylock], but working on pointers (or
    other pointer-sized values).
    
    For portability reasons, you may only lock on the bottom 32 bits of
    the pointer.
    
    While address has a `volatile` qualifier, this is a historical
    artifact and the argument passed to it should not be `volatile`.

    Params:
      address = a pointer to a #gpointer-sized value
      lockBit = a bit value between 0 and 31
    Returns: true if the lock was acquired
*/
bool pointerBitTrylock(void* address, int lockBit)
{
  bool _retval;
  _retval = cast(bool)g_pointer_bit_trylock(address, lockBit);
  return _retval;
}

/**
    This is equivalent to g_bit_unlock, but working on pointers (or other
    pointer-sized values).
    
    For portability reasons, you may only lock on the bottom 32 bits of
    the pointer.
    
    While address has a `volatile` qualifier, this is a historical
    artifact and the argument passed to it should not be `volatile`.

    Params:
      address = a pointer to a #gpointer-sized value
      lockBit = a bit value between 0 and 31
*/
void pointerBitUnlock(void* address, int lockBit)
{
  g_pointer_bit_unlock(address, lockBit);
}

/**
    This is equivalent to [glib.global.pointerBitUnlock] and atomically setting
    the pointer value.
    
    Note that the lock bit will be cleared from the pointer. If the unlocked
    pointer that was set is not identical to ptr, an assertion fails. In other
    words, ptr must have lock_bit unset. This also means, you usually can
    only use this on the lowest bits.

    Params:
      address = a pointer to a #gpointer-sized value
      lockBit = a bit value between 0 and 31
      ptr = the new pointer value to set
      preserveMask = if non-zero, those bits of the current pointer in address
          are preserved.
          Note that the lock_bit bit will be always set according to set,
          regardless of preserve_mask and the currently set value in address.
*/
void pointerBitUnlockAndSet(void* address, uint lockBit, void* ptr, size_t preserveMask)
{
  g_pointer_bit_unlock_and_set(address, lockBit, ptr, preserveMask);
}

/**
    Polls fds, as with the poll() system call, but portably. (On
    systems that don't have poll(), it is emulated using select().)
    This is used internally by #GMainContext, but it can be called
    directly if you need to block until a file descriptor is ready, but
    don't want to run the full main loop.
    
    Each element of fds is a #GPollFD describing a single file
    descriptor to poll. The fd field indicates the file descriptor,
    and the events field indicates the events to poll for. On return,
    the revents fields will be filled with the events that actually
    occurred.
    
    On POSIX systems, the file descriptors in fds can be any sort of
    file descriptor, but the situation is much more complicated on
    Windows. If you need to use [glib.global.poll] in code that has to run on
    Windows, the easiest solution is to construct all of your
    #GPollFDs with g_io_channel_win32_make_pollfd().

    Params:
      fds = file descriptors to poll
      nfds = the number of file descriptors in fds
      timeout = amount of time to wait, in milliseconds, or -1 to wait forever
    Returns: the number of entries in fds whose revents fields
      were filled in, or 0 if the operation timed out, or -1 on error or
      if the call was interrupted.
*/
int poll(glib.types.PollFD fds, uint nfds, int timeout)
{
  int _retval;
  _retval = g_poll(&fds, nfds, timeout);
  return _retval;
}

/**
    If dest is null, free src; otherwise, moves src into *dest.
    The error variable dest points to must be null.
    
    src must be non-null.
    
    Note that src is no longer valid after this call. If you want
    to keep using the same GError*, you need to set it to null
    after calling this function on it.

    Params:
      dest = error return location
      src = error to move into the return location
*/
void propagateError(out glib.error.ErrorWrap dest, glib.error.ErrorWrap src)
{
  GError* _dest;
  g_propagate_error(&_dest, src ? cast(GError*)src._cPtr : null);
  dest = new glib.error.ErrorWrap(cast(void*)_dest, Yes.Take);
}

/**
    This is just like the standard C qsort() function, but
    the comparison routine accepts a user data argument.
    
    This is guaranteed to be a stable sort since version 2.32.

    Params:
      pbase = start of array to sort
      totalElems = elements in the array
      size = size of each element
      compareFunc = function to compare elements
*/
void qsortWithData(const(void)* pbase, int totalElems, size_t size, glib.types.CompareDataFunc compareFunc)
{
  extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData)
  {
    auto _dlg = cast(glib.types.CompareDataFunc*)userData;

    int _retval = (*_dlg)(a, b);
    return _retval;
  }
  auto _compareFuncCB = compareFunc ? &_compareFuncCallback : null;
  auto _compareFunc = compareFunc ? cast(void*)&(compareFunc) : null;
  g_qsort_with_data(pbase, totalElems, size, _compareFuncCB, _compareFunc);
}

/**
    Gets the #GQuark identifying the given (static) string. If the
    string does not currently have an associated #GQuark, a new #GQuark
    is created, linked to the given string.
    
    Note that this function is identical to [glib.global.quarkFromString] except
    that if a new #GQuark is created the string itself is used rather
    than a copy. This saves memory, but can only be used if the string
    will continue to exist until the program terminates. It can be used
    with statically allocated strings in the main program, but not with
    statically allocated memory in dynamically loaded modules, if you
    expect to ever unload the module again (e.g. do not use this
    function in GTK theme engines).
    
    This function must not be used before library constructors have finished
    running. In particular, this means it cannot be used to initialize global
    variables in C++.

    Params:
      string_ = a string
    Returns: the #GQuark identifying the string, or 0 if string is null
*/
glib.types.Quark quarkFromStaticString(string string_ = null)
{
  glib.types.Quark _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = g_quark_from_static_string(_string_);
  return _retval;
}

/**
    Gets the #GQuark identifying the given string. If the string does
    not currently have an associated #GQuark, a new #GQuark is created,
    using a copy of the string.
    
    This function must not be used before library constructors have finished
    running. In particular, this means it cannot be used to initialize global
    variables in C++.

    Params:
      string_ = a string
    Returns: the #GQuark identifying the string, or 0 if string is null
*/
glib.types.Quark quarkFromString(string string_ = null)
{
  glib.types.Quark _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = g_quark_from_string(_string_);
  return _retval;
}

/**
    Gets the string associated with the given #GQuark.

    Params:
      quark = a #GQuark.
    Returns: the string associated with the #GQuark
*/
string quarkToString(glib.types.Quark quark)
{
  const(char)* _cretval;
  _cretval = g_quark_to_string(quark);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the #GQuark associated with the given string, or 0 if string is
    null or it has no associated #GQuark.
    
    If you want the GQuark to be created if it doesn't already exist,
    use [glib.global.quarkFromString] or [glib.global.quarkFromStaticString].
    
    This function must not be used before library constructors have finished
    running.

    Params:
      string_ = a string
    Returns: the #GQuark associated with the string, or 0 if string is
          null or there is no #GQuark associated with it
*/
glib.types.Quark quarkTryString(string string_ = null)
{
  glib.types.Quark _retval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _retval = g_quark_try_string(_string_);
  return _retval;
}

/**
    Returns a random #gdouble equally distributed over the range [0..1).
    Returns: a random number
*/
double randomDouble()
{
  double _retval;
  _retval = g_random_double();
  return _retval;
}

/**
    Returns a random #gdouble equally distributed over the range
    [begin..end).

    Params:
      begin = lower closed bound of the interval
      end = upper open bound of the interval
    Returns: a random number
*/
double randomDoubleRange(double begin, double end)
{
  double _retval;
  _retval = g_random_double_range(begin, end);
  return _retval;
}

/**
    Return a random #guint32 equally distributed over the range
    [0..2^32-1].
    Returns: a random number
*/
uint randomInt()
{
  uint _retval;
  _retval = g_random_int();
  return _retval;
}

/**
    Returns a random #gint32 equally distributed over the range
    [begin..end-1].

    Params:
      begin = lower closed bound of the interval
      end = upper open bound of the interval
    Returns: a random number
*/
int randomIntRange(int begin, int end)
{
  int _retval;
  _retval = g_random_int_range(begin, end);
  return _retval;
}

/**
    Sets the seed for the global random number generator, which is used
    by the g_random_* functions, to seed.

    Params:
      seed = a value to reinitialize the global random number generator
*/
void randomSetSeed(uint seed)
{
  g_random_set_seed(seed);
}

/**
    Acquires a reference on the data pointed by mem_block.

    Params:
      memBlock = a pointer to reference counted data
    Returns: a pointer to the data,
        with its reference count increased
*/
void* rcBoxAcquire(void* memBlock)
{
  auto _retval = g_rc_box_acquire(memBlock);
  return _retval;
}

/**
    Allocates block_size bytes of memory, and adds reference
    counting semantics to it.
    
    The data will be freed when its reference count drops to
    zero.
    
    The allocated data is guaranteed to be suitably aligned for any
    built-in type.

    Params:
      blockSize = the size of the allocation, must be greater than 0
    Returns: a pointer to the allocated memory
*/
void* rcBoxAlloc(size_t blockSize)
{
  auto _retval = g_rc_box_alloc(blockSize);
  return _retval;
}

/**
    Allocates block_size bytes of memory, and adds reference
    counting semantics to it.
    
    The contents of the returned data is set to zero.
    
    The data will be freed when its reference count drops to
    zero.
    
    The allocated data is guaranteed to be suitably aligned for any
    built-in type.

    Params:
      blockSize = the size of the allocation, must be greater than 0
    Returns: a pointer to the allocated memory
*/
void* rcBoxAlloc0(size_t blockSize)
{
  auto _retval = g_rc_box_alloc0(blockSize);
  return _retval;
}

/**
    Allocates a new block of data with reference counting
    semantics, and copies block_size bytes of mem_block
    into it.

    Params:
      blockSize = the number of bytes to copy, must be greater than 0
      memBlock = the memory to copy
    Returns: a pointer to the allocated
        memory
*/
void* rcBoxDup(size_t blockSize, const(void)* memBlock)
{
  auto _retval = g_rc_box_dup(blockSize, memBlock);
  return _retval;
}

/**
    Retrieves the size of the reference counted data pointed by mem_block.

    Params:
      memBlock = a pointer to reference counted data
    Returns: the size of the data, in bytes
*/
size_t rcBoxGetSize(void* memBlock)
{
  size_t _retval;
  _retval = g_rc_box_get_size(memBlock);
  return _retval;
}

/**
    Releases a reference on the data pointed by mem_block.
    
    If the reference was the last one, it will free the
    resources allocated for mem_block.

    Params:
      memBlock = a pointer to reference counted data
*/
void rcBoxRelease(void* memBlock)
{
  g_rc_box_release(memBlock);
}

/**
    Releases a reference on the data pointed by mem_block.
    
    If the reference was the last one, it will call clear_func
    to clear the contents of mem_block, and then will free the
    resources allocated for mem_block.

    Params:
      memBlock = a pointer to reference counted data
      clearFunc = a function to call when clearing the data
*/
void rcBoxReleaseFull(void* memBlock, glib.types.DestroyNotify clearFunc)
{
  extern(C) void _clearFuncCallback(void* data)
  {
    auto _dlg = cast(glib.types.DestroyNotify*)data;

    (*_dlg)();
  }
  auto _clearFuncCB = clearFunc ? &_clearFuncCallback : null;
  g_rc_box_release_full(memBlock, _clearFuncCB);
}

/**
    Reallocates the memory pointed to by mem, so that it now has space for
    n_bytes bytes of memory. It returns the new address of the memory, which may
    have been moved. mem may be null, in which case it's considered to
    have zero-length. n_bytes may be 0, in which case null will be returned
    and mem will be freed unless it is null.
    
    If the allocation fails (because the system is out of memory),
    the program is terminated.

    Params:
      mem = the memory to reallocate
      nBytes = new size of the memory in bytes
    Returns: the new address of the allocated memory
*/
void* realloc(void* mem, size_t nBytes)
{
  auto _retval = g_realloc(mem, nBytes);
  return _retval;
}

/**
    This function is similar to [glib.global.realloc], allocating (n_blocks * n_block_bytes) bytes,
    but care is taken to detect possible overflow during multiplication.
    
    If the allocation fails (because the system is out of memory),
    the program is terminated.

    Params:
      mem = the memory to reallocate
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
    Returns: the new address of the allocated memory
*/
void* reallocN(void* mem, size_t nBlocks, size_t nBlockBytes)
{
  auto _retval = g_realloc_n(mem, nBlocks, nBlockBytes);
  return _retval;
}

/**
    Compares the current value of rc with val.

    Params:
      rc = the address of a reference count variable
      val = the value to compare
    Returns: true if the reference count is the same
        as the given value
*/
bool refCountCompare(ref int rc, int val)
{
  bool _retval;
  _retval = cast(bool)g_ref_count_compare(cast(int*)&rc, val);
  return _retval;
}

/**
    Decreases the reference count.
    
    If true is returned, the reference count reached 0. After this point, rc
    is an undefined state and must be reinitialized with
    [glib.global.refCountInit] to be used again.

    Params:
      rc = the address of a reference count variable
    Returns: true if the reference count reached 0, and false otherwise
*/
bool refCountDec(ref int rc)
{
  bool _retval;
  _retval = cast(bool)g_ref_count_dec(cast(int*)&rc);
  return _retval;
}

/**
    Increases the reference count.

    Params:
      rc = the address of a reference count variable
*/
void refCountInc(ref int rc)
{
  g_ref_count_inc(cast(int*)&rc);
}

/**
    Initializes a reference count variable to 1.

    Params:
      rc = the address of a reference count variable
*/
void refCountInit(ref int rc)
{
  g_ref_count_init(cast(int*)&rc);
}

/**
    Acquires a reference on a string.

    Params:
      str = a reference counted string
    Returns: the given string, with its reference count increased
*/
string refStringAcquire(string str)
{
  char* _cretval;
  char* _str = str.toCString(No.Alloc);
  _cretval = g_ref_string_acquire(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Retrieves the length of str.

    Params:
      str = a reference counted string
    Returns: the length of the given string, in bytes
*/
size_t refStringLength(string str)
{
  size_t _retval;
  char* _str = str.toCString(No.Alloc);
  _retval = g_ref_string_length(_str);
  return _retval;
}

/**
    Creates a new reference counted string and copies the contents of str
    into it.

    Params:
      str = a NUL-terminated string
    Returns: the newly created reference counted string
*/
string refStringNew(string str)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_ref_string_new(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a new reference counted string and copies the content of str
    into it.
    
    If you call this function multiple times with the same str, or with
    the same contents of str, it will return a new reference, instead of
    creating a new string.

    Params:
      str = a NUL-terminated string
    Returns: the newly created reference
        counted string, or a new reference to an existing string
*/
string refStringNewIntern(string str)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_ref_string_new_intern(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a new reference counted string and copies the contents of str
    into it, up to len bytes.
    
    Since this function does not stop at nul bytes, it is the caller's
    responsibility to ensure that str has at least len addressable bytes.

    Params:
      str = a string
      len = length of str to use, or -1 if str is nul-terminated
    Returns: the newly created reference counted string
*/
string refStringNewLen(string str, ptrdiff_t len)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_ref_string_new_len(_str, len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Releases a reference on a string; if it was the last reference, the
    resources allocated by the string are freed as well.

    Params:
      str = a reference counted string
*/
void refStringRelease(string str)
{
  char* _str = str.toCString(No.Alloc);
  g_ref_string_release(_str);
}

/**
    Resets the cache used for [glib.global.getUserSpecialDir], so
    that the latest on-disk version is used. Call this only
    if you just changed the data on disk yourself.
    
    Due to thread safety issues this may cause leaking of strings
    that were previously returned from [glib.global.getUserSpecialDir]
    that can't be freed. We ensure to only leak the data for
    the directories that actually changed value though.
*/
void reloadUserSpecialDirsCache()
{
  g_reload_user_special_dirs_cache();
}

/**
    A wrapper for the POSIX remove() function. The remove() function
    deletes a name from the filesystem.
    
    See your C library manual for more details about how remove() works
    on your system. On Unix, remove() removes also directories, as it
    calls unlink() for files and rmdir() for directories. On Windows,
    although remove() in the C library only works for files, this
    function tries first remove() and then if that fails rmdir(), and
    thus works for both files and directories. Note however, that on
    Windows, it is in general not possible to remove a file that is
    open to some process, or mapped into memory.
    
    If this function fails on Windows you can't infer too much from the
    errno value. rmdir() is tried regardless of what caused remove() to
    fail. Any errno value set by remove() will be overwritten by that
    set by rmdir().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
    Returns: 0 if the file was successfully removed, -1 if an error
         occurred
*/
int remove(string filename)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_remove(_filename);
  return _retval;
}

/**
    A wrapper for the POSIX rename() function. The rename() function
    renames a file, moving it between directories if required.
    
    See your C library manual for more details about how rename() works
    on your system. It is not possible in general on Windows to rename
    a file that is open to some process.

    Params:
      oldfilename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      newfilename = a pathname in the GLib file name encoding
    Returns: 0 if the renaming succeeded, -1 if an error occurred
*/
int rename(string oldfilename, string newfilename)
{
  int _retval;
  const(char)* _oldfilename = oldfilename.toCString(No.Alloc);
  const(char)* _newfilename = newfilename.toCString(No.Alloc);
  _retval = g_rename(_oldfilename, _newfilename);
  return _retval;
}

/**
    A wrapper for the POSIX rmdir() function. The rmdir() function
    deletes a directory from the filesystem.
    
    See your C library manual for more details about how rmdir() works
    on your system.

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
    Returns: 0 if the directory was successfully removed, -1 if an error
         occurred
*/
int rmdir(string filename)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_rmdir(_filename);
  return _retval;
}

/**
    Sets a human-readable name for the application. This name should be
    localized if possible, and is intended for display to the user.
    Contrast with [glib.global.setPrgname], which sets a non-localized name.
    [glib.global.setPrgname] will be called automatically by [gtk.global.init_],
    but [glib.global.setApplicationName] will not.
    
    Note that for thread safety reasons, this function can only
    be called once.
    
    The application name will be used in contexts such as error messages,
    or when displaying an application's name in the task list.

    Params:
      applicationName = localized name of the application
*/
void setApplicationName(string applicationName)
{
  const(char)* _applicationName = applicationName.toCString(No.Alloc);
  g_set_application_name(_applicationName);
}

/**
    Does nothing if err is null; if err is non-null, then *err
    must be null. A new #GError is created and assigned to *err.
    Unlike [glib.global.setError], message is not a printf()-style format string.
    Use this function if message contains text you don't have control over,
    that could include printf() escape sequences.

    Params:
      err = a return location for a #GError
      domain = error domain
      code = error code
      message = error message
*/
void setErrorLiteral(out glib.error.ErrorWrap err, glib.types.Quark domain, int code, string message)
{
  GError* _err;
  const(char)* _message = message.toCString(No.Alloc);
  g_set_error_literal(&_err, domain, code, _message);
  err = new glib.error.ErrorWrap(cast(void*)_err, Yes.Take);
}

/**
    Sets the name of the program. This name should not be localized,
    in contrast to [glib.global.setApplicationName].
    
    If you are using #GApplication the program name is set in
    [gio.application.Application.run]. In case of GDK or GTK it is set in
    [gdk.global.init_], which is called by [gtk.global.init_] and the
    #GtkApplication::startup handler. The program name is found by
    taking the last component of argv[0].
    
    Since GLib 2.72, this function can be called multiple times
    and is fully thread safe. Prior to GLib 2.72, this function
    could only be called once per process.

    Params:
      prgname = the name of the program.
*/
void setPrgname(string prgname)
{
  const(char)* _prgname = prgname.toCString(No.Alloc);
  g_set_prgname(_prgname);
}

/**
    Sets an environment variable. On UNIX, both the variable's name and
    value can be arbitrary byte strings, except that the variable's name
    cannot contain '='. On Windows, they should be in UTF-8.
    
    Note that on some systems, when variables are overwritten, the memory
    used for the previous variables and its value isn't reclaimed.
    
    You should be mindful of the fact that environment variable handling
    in UNIX is not thread-safe, and your program may crash if one thread
    calls [glib.global.setenv] while another thread is calling getenv(). (And note
    that many functions, such as gettext(), call getenv() internally.)
    This function is only safe to use at the very start of your program,
    before creating any other threads (or creating objects that create
    worker threads of their own).
    
    If you need to set up the environment for a child process, you can
    use [glib.global.getEnviron] to get an environment array, modify that with
    [glib.global.environSetenv] and [glib.global.environUnsetenv], and then pass that
    array directly to execvpe(), [glib.global.spawnAsync], or the like.

    Params:
      variable = the environment variable to set, must not
            contain '='.
      value = the value for to set the variable to.
      overwrite = whether to change the variable if it already exists.
    Returns: false if the environment variable couldn't be set.
*/
bool setenv(string variable, string value, bool overwrite)
{
  bool _retval;
  const(char)* _variable = variable.toCString(No.Alloc);
  const(char)* _value = value.toCString(No.Alloc);
  _retval = cast(bool)g_setenv(_variable, _value, overwrite);
  return _retval;
}

/** */
glib.types.Quark shellErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_shell_error_quark();
  return _retval;
}

/**
    Parses a command line into an argument vector, in much the same way
    the shell would, but without many of the expansions the shell would
    perform (variable expansion, globs, operators, filename expansion,
    etc. are not supported).
    
    The results are defined to be the same as those you would get from
    a UNIX98 `/bin/sh`, as long as the input contains none of the
    unsupported shell expansions. If the input does contain such expansions,
    they are passed through literally.
    
    Possible errors are those from the `G_SHELL_ERROR` domain.
    
    In particular, if command_line is an empty string (or a string containing
    only whitespace), `G_SHELL_ERROR_EMPTY_STRING` will be returned. It’s
    guaranteed that argvp will be a non-empty array if this function returns
    successfully.
    
    Free the returned vector with [glib.global.strfreev].

    Params:
      commandLine = command line to parse
      argvp = return location for array of args
    Returns: true on success, false if error set
    Throws: [ErrorWrap]
*/
bool shellParseArgv(string commandLine, out string[] argvp)
{
  bool _retval;
  const(char)* _commandLine = commandLine.toCString(No.Alloc);
  int _argcp;
  char** _argvp;
  GError *_err;
  _retval = cast(bool)g_shell_parse_argv(_commandLine, &_argcp, &_argvp, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  argvp.length = _argcp;
  foreach (i; 0 .. _argcp)
    argvp[i] = _argvp[i].fromCString(Yes.Free);
  gFree(cast(void*)_argvp);
  return _retval;
}

/**
    Quotes a string so that the shell (/bin/sh) will interpret the
    quoted string to mean unquoted_string.
    
    If you pass a filename to the shell, for example, you should first
    quote it with this function.
    
    The return value must be freed with [glib.global.gfree].
    
    The quoting style used is undefined (single or double quotes may be
    used).

    Params:
      unquotedString = a literal string
    Returns: quoted string
*/
string shellQuote(string unquotedString)
{
  char* _cretval;
  const(char)* _unquotedString = unquotedString.toCString(No.Alloc);
  _cretval = g_shell_quote(_unquotedString);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Unquotes a string as the shell (/bin/sh) would.
    
    This function only handles quotes; if a string contains file globs,
    arithmetic operators, variables, backticks, redirections, or other
    special-to-the-shell features, the result will be different from the
    result a real shell would produce (the variables, backticks, etc.
    will be passed through literally instead of being expanded).
    
    This function is guaranteed to succeed if applied to the result of
    [glib.global.shellQuote]. If it fails, it returns null and sets the
    error.
    
    The quoted_string need not actually contain quoted or escaped text;
    [glib.global.shellUnquote] simply goes through the string and unquotes/unescapes
    anything that the shell would. Both single and double quotes are
    handled, as are escapes including escaped newlines.
    
    The return value must be freed with [glib.global.gfree].
    
    Possible errors are in the `G_SHELL_ERROR` domain.
    
    Shell quoting rules are a bit strange. Single quotes preserve the
    literal string exactly. escape sequences are not allowed; not even
    `\'` - if you want a `'` in the quoted text, you have to do something
    like `'foo'\''bar'`. Double quotes allow `$`, ```, `"`, `\`, and
    newline to be escaped with backslash. Otherwise double quotes
    preserve things literally.

    Params:
      quotedString = shell-quoted string
    Returns: an unquoted string
    Throws: [ErrorWrap]
*/
string shellUnquote(string quotedString)
{
  char* _cretval;
  const(char)* _quotedString = quotedString.toCString(No.Alloc);
  GError *_err;
  _cretval = g_shell_unquote(_quotedString, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Allocates a block of memory from the libc allocator.
    
    The block address handed out can be expected to be aligned
    to at least `1 * sizeof (void*)`.
    
    Since GLib 2.76 this always uses the system malloc() implementation
    internally.

    Params:
      blockSize = the number of bytes to allocate
    Returns: a pointer to the allocated memory block, which will
        be null if and only if mem_size is 0
*/
void* sliceAlloc(size_t blockSize)
{
  auto _retval = g_slice_alloc(blockSize);
  return _retval;
}

/**
    Allocates a block of memory via [glib.global.sliceAlloc] and initializes
    the returned memory to 0.
    
    Since GLib 2.76 this always uses the system malloc() implementation
    internally.

    Params:
      blockSize = the number of bytes to allocate
    Returns: a pointer to the allocated block, which will be null
         if and only if mem_size is 0
*/
void* sliceAlloc0(size_t blockSize)
{
  auto _retval = g_slice_alloc0(blockSize);
  return _retval;
}

/**
    Allocates a block of memory from the slice allocator
    and copies block_size bytes into it from mem_block.
    
    mem_block must be non-null if block_size is non-zero.
    
    Since GLib 2.76 this always uses the system malloc() implementation
    internally.

    Params:
      blockSize = the number of bytes to allocate
      memBlock = the memory to copy
    Returns: a pointer to the allocated memory block,
         which will be null if and only if mem_size is 0
*/
void* sliceCopy(size_t blockSize, const(void)* memBlock = null)
{
  auto _retval = g_slice_copy(blockSize, memBlock);
  return _retval;
}

/**
    Frees a block of memory.
    
    The memory must have been allocated via [glib.global.sliceAlloc] or
    [glib.global.sliceAlloc0] and the block_size has to match the size
    specified upon allocation. Note that the exact release behaviour
    can be changed with the [`G_DEBUG=gc-friendly`][G_DEBUG] environment
    variable.
    
    If mem_block is null, this function does nothing.
    
    Since GLib 2.76 this always uses the system free_sized() implementation
    internally.

    Params:
      blockSize = the size of the block
      memBlock = a pointer to the block to free
*/
void sliceFree1(size_t blockSize, void* memBlock = null)
{
  g_slice_free1(blockSize, memBlock);
}

/**
    Frees a linked list of memory blocks of structure type type.
    
    The memory blocks must be equal-sized, allocated via
    [glib.global.sliceAlloc] or [glib.global.sliceAlloc0] and linked together by a
    next pointer (similar to #GSList). The offset of the next
    field in each block is passed as third argument.
    Note that the exact release behaviour can be changed with the
    [`G_DEBUG=gc-friendly`][G_DEBUG] environment variable.
    
    If mem_chain is null, this function does nothing.
    
    Since GLib 2.76 this always uses the system free_sized() implementation
    internally.

    Params:
      blockSize = the size of the blocks
      memChain = a pointer to the first block of the chain
      nextOffset = the offset of the next field in the blocks
*/
void sliceFreeChainWithOffset(size_t blockSize, void* memChain, size_t nextOffset)
{
  g_slice_free_chain_with_offset(blockSize, memChain, nextOffset);
}

/** */
long sliceGetConfig(glib.types.SliceConfig ckey)
{
  long _retval;
  _retval = g_slice_get_config(ckey);
  return _retval;
}

/** */
long[] sliceGetConfigState(glib.types.SliceConfig ckey, long address)
{
  const(long)* _cretval;
  uint _cretlength;
  _cretval = g_slice_get_config_state(ckey, address, &_cretlength);
  long[] _retval;

  if (_cretval)
  {
    _retval = cast(long[])_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/** */
void sliceSetConfig(glib.types.SliceConfig ckey, long value)
{
  g_slice_set_config(ckey, value);
}

/**
    Gets the smallest prime number from a built-in array of primes which
    is larger than num. This is used within GLib to calculate the optimum
    size of a #GHashTable.
    
    The built-in array of primes ranges from 11 to 13845163 such that
    each prime is approximately 1.5-2 times the previous prime.

    Params:
      num = a #guint
    Returns: the smallest prime number from a built-in array of primes
          which is larger than num
*/
uint spacedPrimesClosest(uint num)
{
  uint _retval;
  _retval = g_spaced_primes_closest(num);
  return _retval;
}

/**
    Executes a child program asynchronously.
    
    See [glib.global.spawnAsyncWithPipes] for a full description; this function
    simply calls the [glib.global.spawnAsyncWithPipes] without any pipes.
    
    You should call [glib.global.spawnClosePid] on the returned child process
    reference when you don't need it any more.
    
    If you are writing a GTK application, and the program you are spawning is a
    graphical application too, then to ensure that the spawned program opens its
    windows on the right screen, you may want to use #GdkAppLaunchContext,
    #GAppLaunchContext, or set the `DISPLAY` environment variable.
    
    Note that the returned child_pid on Windows is a handle to the child
    process and not its identifier. Process handles and process identifiers
    are different concepts on Windows.

    Params:
      workingDirectory = child's current working
            directory, or null to inherit parent's
      argv = child's argument vector
      envp = child's environment, or null to inherit parent's
      flags = flags from #GSpawnFlags
      childSetup = function to run
            in the child just before `exec()`
      childPid = return location for child process reference, or null
    Returns: true on success, false if error is set
    Throws: [ErrorWrap]
*/
bool spawnAsync(string workingDirectory, string[] argv, string[] envp, glib.types.SpawnFlags flags, glib.types.SpawnChildSetupFunc childSetup, out glib.types.Pid childPid)
{
  extern(C) void _childSetupCallback(void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

    (*_dlg)();
  }
  auto _childSetupCB = childSetup ? &_childSetupCallback : null;
  bool _retval;
  const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
  char*[] _tmpargv;
  foreach (s; argv)
    _tmpargv ~= s.toCString(No.Alloc);
  _tmpargv ~= null;
  char** _argv = _tmpargv.ptr;

  char*[] _tmpenvp;
  foreach (s; envp)
    _tmpenvp ~= s.toCString(No.Alloc);
  _tmpenvp ~= null;
  char** _envp = _tmpenvp.ptr;

  auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
  GError *_err;
  _retval = cast(bool)g_spawn_async(_workingDirectory, _argv, _envp, flags, _childSetupCB, _childSetup, cast(GPid*)&childPid, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Executes a child program asynchronously.
    
    Identical to [glib.global.spawnAsyncWithPipesAndFds] but with `n_fds` set to zero,
    so no FD assignments are used.

    Params:
      workingDirectory = child's current working directory, or null to inherit parent's, in the GLib file name encoding
      argv = child's argument vector, in the GLib file name encoding;
          it must be non-empty and null-terminated
      envp = child's environment, or null to inherit parent's, in the GLib file name encoding
      flags = flags from #GSpawnFlags
      childSetup = function to run
          in the child just before `exec()`
      childPid = return location for child process ID, or null
      stdinFd = file descriptor to use for child's stdin, or `-1`
      stdoutFd = file descriptor to use for child's stdout, or `-1`
      stderrFd = file descriptor to use for child's stderr, or `-1`
    Returns: true on success, false if an error was set
    Throws: [ErrorWrap]
*/
bool spawnAsyncWithFds(string workingDirectory, string[] argv, string[] envp, glib.types.SpawnFlags flags, glib.types.SpawnChildSetupFunc childSetup, out glib.types.Pid childPid, int stdinFd, int stdoutFd, int stderrFd)
{
  extern(C) void _childSetupCallback(void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

    (*_dlg)();
  }
  auto _childSetupCB = childSetup ? &_childSetupCallback : null;
  bool _retval;
  const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
  char*[] _tmpargv;
  foreach (s; argv)
    _tmpargv ~= s.toCString(No.Alloc);
  _tmpargv ~= null;
  char** _argv = _tmpargv.ptr;

  char*[] _tmpenvp;
  foreach (s; envp)
    _tmpenvp ~= s.toCString(No.Alloc);
  _tmpenvp ~= null;
  char** _envp = _tmpenvp.ptr;

  auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
  GError *_err;
  _retval = cast(bool)g_spawn_async_with_fds(_workingDirectory, _argv, _envp, flags, _childSetupCB, _childSetup, cast(GPid*)&childPid, stdinFd, stdoutFd, stderrFd, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Identical to [glib.global.spawnAsyncWithPipesAndFds] but with `n_fds` set to zero,
    so no FD assignments are used.

    Params:
      workingDirectory = child's current working
            directory, or null to inherit parent's, in the GLib file name encoding
      argv = child's argument
            vector, in the GLib file name encoding; it must be non-empty and null-terminated
      envp = child's environment, or null to inherit parent's, in the GLib file
            name encoding
      flags = flags from #GSpawnFlags
      childSetup = function to run
            in the child just before `exec()`
      childPid = return location for child process ID, or null
      standardInput = return location for file descriptor to write to child's stdin, or null
      standardOutput = return location for file descriptor to read child's stdout, or null
      standardError = return location for file descriptor to read child's stderr, or null
    Returns: true on success, false if an error was set
    Throws: [ErrorWrap]
*/
bool spawnAsyncWithPipes(string workingDirectory, string[] argv, string[] envp, glib.types.SpawnFlags flags, glib.types.SpawnChildSetupFunc childSetup, out glib.types.Pid childPid, out int standardInput, out int standardOutput, out int standardError)
{
  extern(C) void _childSetupCallback(void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

    (*_dlg)();
  }
  auto _childSetupCB = childSetup ? &_childSetupCallback : null;
  bool _retval;
  const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
  char*[] _tmpargv;
  foreach (s; argv)
    _tmpargv ~= s.toCString(No.Alloc);
  _tmpargv ~= null;
  char** _argv = _tmpargv.ptr;

  char*[] _tmpenvp;
  foreach (s; envp)
    _tmpenvp ~= s.toCString(No.Alloc);
  _tmpenvp ~= null;
  char** _envp = _tmpenvp.ptr;

  auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
  GError *_err;
  _retval = cast(bool)g_spawn_async_with_pipes(_workingDirectory, _argv, _envp, flags, _childSetupCB, _childSetup, cast(GPid*)&childPid, cast(int*)&standardInput, cast(int*)&standardOutput, cast(int*)&standardError, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Executes a child program asynchronously (your program will not
    block waiting for the child to exit).
    
    The child program is specified by the only argument that must be
    provided, argv. argv should be a null-terminated array of strings,
    to be passed as the argument vector for the child. The first string
    in argv is of course the name of the program to execute. By default,
    the name of the program must be a full path. If flags contains the
    `G_SPAWN_SEARCH_PATH` flag, the `PATH` environment variable is used to
    search for the executable. If flags contains the
    `G_SPAWN_SEARCH_PATH_FROM_ENVP` flag, the `PATH` variable from envp
    is used to search for the executable. If both the
    `G_SPAWN_SEARCH_PATH` and `G_SPAWN_SEARCH_PATH_FROM_ENVP` flags are
    set, the `PATH` variable from envp takes precedence over the
    environment variable.
    
    If the program name is not a full path and `G_SPAWN_SEARCH_PATH` flag
    is not used, then the program will be run from the current directory
    (or working_directory, if specified); this might be unexpected or even
    dangerous in some cases when the current directory is world-writable.
    
    On Windows, note that all the string or string vector arguments to
    this function and the other `g_spawn*()` functions are in UTF-8, the
    GLib file name encoding. Unicode characters that are not part of
    the system codepage passed in these arguments will be correctly
    available in the spawned program only if it uses wide character API
    to retrieve its command line. For C programs built with Microsoft's
    tools it is enough to make the program have a `wmain()` instead of
    `main()`. `wmain()` has a wide character argument vector as parameter.
    
    At least currently, mingw doesn't support `wmain()`, so if you use
    mingw to develop the spawned program, it should call
    g_win32_get_command_line() to get arguments in UTF-8.
    
    On Windows the low-level child process creation API `CreateProcess()`
    doesn't use argument vectors, but a command line. The C runtime
    library's `spawn*()` family of functions (which [glib.global.spawnAsyncWithPipes]
    eventually calls) paste the argument vector elements together into
    a command line, and the C runtime startup code does a corresponding
    reconstruction of an argument vector from the command line, to be
    passed to `main()`. Complications arise when you have argument vector
    elements that contain spaces or double quotes. The `spawn*()` functions
    don't do any quoting or escaping, but on the other hand the startup
    code does do unquoting and unescaping in order to enable receiving
    arguments with embedded spaces or double quotes. To work around this
    asymmetry, [glib.global.spawnAsyncWithPipes] will do quoting and escaping on
    argument vector elements that need it before calling the C runtime
    `spawn()` function.
    
    The returned child_pid on Windows is a handle to the child
    process, not its identifier. Process handles and process
    identifiers are different concepts on Windows.
    
    envp is a null-terminated array of strings, where each string
    has the form `KEY=VALUE`. This will become the child's environment.
    If envp is null, the child inherits its parent's environment.
    
    flags should be the bitwise OR of any flags you want to affect the
    function's behaviour. The `G_SPAWN_DO_NOT_REAP_CHILD` means that the
    child will not automatically be reaped; you must use a child watch
    ([glib.global.childWatchAdd]) to be notified about the death of the child process,
    otherwise it will stay around as a zombie process until this process exits.
    Eventually you must call [glib.global.spawnClosePid] on the child_pid, in order to
    free resources which may be associated with the child process. (On Unix,
    using a child watch is equivalent to calling waitpid() or handling
    the `SIGCHLD` signal manually. On Windows, calling [glib.global.spawnClosePid]
    is equivalent to calling `CloseHandle()` on the process handle returned
    in child_pid). See [glib.global.childWatchAdd].
    
    Open UNIX file descriptors marked as `FD_CLOEXEC` will be automatically
    closed in the child process. `G_SPAWN_LEAVE_DESCRIPTORS_OPEN` means that
    other open file descriptors will be inherited by the child; otherwise all
    descriptors except stdin/stdout/stderr will be closed before calling `exec()`
    in the child. `G_SPAWN_SEARCH_PATH` means that argv[0] need not be an
    absolute path, it will be looked for in the `PATH` environment
    variable. `G_SPAWN_SEARCH_PATH_FROM_ENVP` means need not be an
    absolute path, it will be looked for in the `PATH` variable from
    envp. If both `G_SPAWN_SEARCH_PATH` and `G_SPAWN_SEARCH_PATH_FROM_ENVP`
    are used, the value from envp takes precedence over the environment.
    
    `G_SPAWN_CHILD_INHERITS_STDIN` means that the child will inherit the parent's
    standard input (by default, the child's standard input is attached to
    `/dev/null`). `G_SPAWN_STDIN_FROM_DEV_NULL` explicitly imposes the default
    behavior. Both flags cannot be enabled at the same time and, in both cases,
    the stdin_pipe_out argument is ignored.
    
    `G_SPAWN_STDOUT_TO_DEV_NULL` means that the child's standard output
    will be discarded (by default, it goes to the same location as the parent's
    standard output). `G_SPAWN_CHILD_INHERITS_STDOUT` explicitly imposes the
    default behavior. Both flags cannot be enabled at the same time and, in
    both cases, the stdout_pipe_out argument is ignored.
    
    `G_SPAWN_STDERR_TO_DEV_NULL` means that the child's standard error
    will be discarded (by default, it goes to the same location as the parent's
    standard error). `G_SPAWN_CHILD_INHERITS_STDERR` explicitly imposes the
    default behavior. Both flags cannot be enabled at the same time and, in
    both cases, the stderr_pipe_out argument is ignored.
    
    It is valid to pass the same FD in multiple parameters (e.g. you can pass
    a single FD for both stdout_fd and stderr_fd, and include it in
    source_fds too).
    
    source_fds and target_fds allow zero or more FDs from this process to be
    remapped to different FDs in the spawned process. If n_fds is greater than
    zero, source_fds and target_fds must both be non-null and the same length.
    Each FD in source_fds is remapped to the FD number at the same index in
    target_fds. The source and target FD may be equal to simply propagate an FD
    to the spawned process. FD remappings are processed after standard FDs, so
    any target FDs which equal stdin_fd, stdout_fd or stderr_fd will overwrite
    them in the spawned process.
    
    source_fds is supported on Windows since 2.72.
    
    `G_SPAWN_FILE_AND_ARGV_ZERO` means that the first element of argv is
    the file to execute, while the remaining elements are the actual
    argument vector to pass to the file. Normally [glib.global.spawnAsyncWithPipes]
    uses argv[0] as the file to execute, and passes all of argv to the child.
    
    child_setup and user_data are a function and user data. On POSIX
    platforms, the function is called in the child after GLib has
    performed all the setup it plans to perform (including creating
    pipes, closing file descriptors, etc.) but before calling `exec()`.
    That is, child_setup is called just before calling `exec()` in the
    child. Obviously actions taken in this function will only affect
    the child, not the parent.
    
    On Windows, there is no separate `fork()` and `exec()` functionality.
    Child processes are created and run with a single API call,
    `CreateProcess()`. There is no sensible thing child_setup
    could be used for on Windows so it is ignored and not called.
    
    If non-null, child_pid will on Unix be filled with the child's
    process ID. You can use the process ID to send signals to the child,
    or to use [glib.global.childWatchAdd] (or `waitpid()`) if you specified the
    `G_SPAWN_DO_NOT_REAP_CHILD` flag. On Windows, child_pid will be
    filled with a handle to the child process only if you specified the
    `G_SPAWN_DO_NOT_REAP_CHILD` flag. You can then access the child
    process using the Win32 API, for example wait for its termination
    with the `WaitFor*()` functions, or examine its exit code with
    `GetExitCodeProcess()`. You should close the handle with `CloseHandle()`
    or [glib.global.spawnClosePid] when you no longer need it.
    
    If non-null, the stdin_pipe_out, stdout_pipe_out, stderr_pipe_out
    locations will be filled with file descriptors for writing to the child's
    standard input or reading from its standard output or standard error.
    The caller of [glib.global.spawnAsyncWithPipes] must close these file descriptors
    when they are no longer in use. If these parameters are null, the
    corresponding pipe won't be created.
    
    If stdin_pipe_out is null, the child's standard input is attached to
    `/dev/null` unless `G_SPAWN_CHILD_INHERITS_STDIN` is set.
    
    If stderr_pipe_out is NULL, the child's standard error goes to the same
    location as the parent's standard error unless `G_SPAWN_STDERR_TO_DEV_NULL`
    is set.
    
    If stdout_pipe_out is NULL, the child's standard output goes to the same
    location as the parent's standard output unless `G_SPAWN_STDOUT_TO_DEV_NULL`
    is set.
    
    error can be null to ignore errors, or non-null to report errors.
    If an error is set, the function returns false. Errors are reported
    even if they occur in the child (for example if the executable in
    `argv[0]` is not found). Typically the `message` field of returned
    errors should be displayed to users. Possible errors are those from
    the `G_SPAWN_ERROR` domain.
    
    If an error occurs, child_pid, stdin_pipe_out, stdout_pipe_out,
    and stderr_pipe_out will not be filled with valid values.
    
    If child_pid is not null and an error does not occur then the returned
    process reference must be closed using [glib.global.spawnClosePid].
    
    On modern UNIX platforms, GLib can use an efficient process launching
    codepath driven internally by `posix_spawn()`. This has the advantage of
    avoiding the fork-time performance costs of cloning the parent process
    address space, and avoiding associated memory overcommit checks that are
    not relevant in the context of immediately executing a distinct process.
    This optimized codepath will be used provided that the following conditions
    are met:
    
    1. `G_SPAWN_DO_NOT_REAP_CHILD` is set
    2. `G_SPAWN_LEAVE_DESCRIPTORS_OPEN` is set
    3. `G_SPAWN_SEARCH_PATH_FROM_ENVP` is not set
    4. working_directory is null
    5. child_setup is null
    6. The program is of a recognised binary format, or has a shebang.
       Otherwise, GLib will have to execute the program through the
       shell, which is not done using the optimized codepath.
    
    If you are writing a GTK application, and the program you are spawning is a
    graphical application too, then to ensure that the spawned program opens its
    windows on the right screen, you may want to use #GdkAppLaunchContext,
    #GAppLaunchContext, or set the `DISPLAY` environment variable.

    Params:
      workingDirectory = child's current working
            directory, or null to inherit parent's, in the GLib file name encoding
      argv = child's argument
            vector, in the GLib file name encoding; it must be non-empty and null-terminated
      envp = child's environment, or null to inherit parent's, in the GLib file
            name encoding
      flags = flags from #GSpawnFlags
      childSetup = function to run
            in the child just before `exec()`
      stdinFd = file descriptor to use for child's stdin, or `-1`
      stdoutFd = file descriptor to use for child's stdout, or `-1`
      stderrFd = file descriptor to use for child's stderr, or `-1`
      sourceFds = array of FDs from the parent
           process to make available in the child process
      targetFds = array of FDs to remap
           source_fds to in the child process
      childPidOut = return location for child process ID, or null
      stdinPipeOut = return location for file descriptor to write to child's stdin, or null
      stdoutPipeOut = return location for file descriptor to read child's stdout, or null
      stderrPipeOut = return location for file descriptor to read child's stderr, or null
    Returns: true on success, false if an error was set
    Throws: [ErrorWrap]
*/
bool spawnAsyncWithPipesAndFds(string workingDirectory, string[] argv, string[] envp, glib.types.SpawnFlags flags, glib.types.SpawnChildSetupFunc childSetup, int stdinFd, int stdoutFd, int stderrFd, int[] sourceFds, int[] targetFds, out glib.types.Pid childPidOut, out int stdinPipeOut, out int stdoutPipeOut, out int stderrPipeOut)
{
  extern(C) void _childSetupCallback(void* data)
  {
    ptrThawGC(data);
    auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

    (*_dlg)();
  }
  auto _childSetupCB = childSetup ? &_childSetupCallback : null;
  bool _retval;
  const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
  const(char)*[] _tmpargv;
  foreach (s; argv)
    _tmpargv ~= s.toCString(No.Alloc);
  _tmpargv ~= null;
  const(char*)* _argv = _tmpargv.ptr;

  const(char)*[] _tmpenvp;
  foreach (s; envp)
    _tmpenvp ~= s.toCString(No.Alloc);
  _tmpenvp ~= null;
  const(char*)* _envp = _tmpenvp.ptr;

  auto _childSetup = childSetup ? freezeDelegate(cast(void*)&childSetup) : null;
  size_t _nFds;
  if (sourceFds)
    _nFds = cast(size_t)sourceFds.length;

  auto _sourceFds = cast(const(int)*)sourceFds.ptr;
  if (targetFds)
    _nFds = cast(size_t)targetFds.length;

  auto _targetFds = cast(const(int)*)targetFds.ptr;
  GError *_err;
  _retval = cast(bool)g_spawn_async_with_pipes_and_fds(_workingDirectory, _argv, _envp, flags, _childSetupCB, _childSetup, stdinFd, stdoutFd, stderrFd, _sourceFds, _targetFds, _nFds, cast(GPid*)&childPidOut, cast(int*)&stdinPipeOut, cast(int*)&stdoutPipeOut, cast(int*)&stderrPipeOut, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    An old name for [glib.global.spawnCheckWaitStatus], deprecated because its
    name is misleading.
    
    Despite the name of the function, wait_status must be the wait status
    as returned by [glib.global.spawnSync], [gio.subprocess.Subprocess.getStatus], `waitpid()`,
    etc. On Unix platforms, it is incorrect for it to be the exit status
    as passed to `exit()` or returned by [gio.subprocess.Subprocess.getExitStatus] or
    `WEXITSTATUS()`.

    Params:
      waitStatus = A status as returned from [glib.global.spawnSync]
    Returns: true if child exited successfully, false otherwise (and
          error will be set)
    Throws: [ErrorWrap]

    Deprecated: Use [glib.global.spawnCheckWaitStatus] instead, and check whether your code is conflating wait and exit statuses.
*/
bool spawnCheckExitStatus(int waitStatus)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)g_spawn_check_exit_status(waitStatus, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Set error if wait_status indicates the child exited abnormally
    (e.g. with a nonzero exit code, or via a fatal signal).
    
    The [glib.global.spawnSync] and [glib.global.childWatchAdd] family of APIs return the
    status of subprocesses encoded in a platform-specific way.
    On Unix, this is guaranteed to be in the same format waitpid() returns,
    and on Windows it is guaranteed to be the result of GetExitCodeProcess().
    
    Prior to the introduction of this function in GLib 2.34, interpreting
    wait_status required use of platform-specific APIs, which is problematic
    for software using GLib as a cross-platform layer.
    
    Additionally, many programs simply want to determine whether or not
    the child exited successfully, and either propagate a #GError or
    print a message to standard error. In that common case, this function
    can be used. Note that the error message in error will contain
    human-readable information about the wait status.
    
    The domain and code of error have special semantics in the case
    where the process has an "exit code", as opposed to being killed by
    a signal. On Unix, this happens if WIFEXITED() would be true of
    wait_status. On Windows, it is always the case.
    
    The special semantics are that the actual exit code will be the
    code set in error, and the domain will be `G_SPAWN_EXIT_ERROR`.
    This allows you to differentiate between different exit codes.
    
    If the process was terminated by some means other than an exit
    status (for example if it was killed by a signal), the domain will be
    `G_SPAWN_ERROR` and the code will be `G_SPAWN_ERROR_FAILED`.
    
    This function just offers convenience; you can of course also check
    the available platform via a macro such as `G_OS_UNIX`, and use
    WIFEXITED() and WEXITSTATUS() on wait_status directly. Do not attempt
    to scan or parse the error message string; it may be translated and/or
    change in future versions of GLib.
    
    Prior to version 2.70, [glib.global.spawnCheckExitStatus] provides the same
    functionality, although under a misleading name.

    Params:
      waitStatus = A platform-specific wait status as returned from [glib.global.spawnSync]
    Returns: true if child exited successfully, false otherwise (and
        error will be set)
    Throws: [ErrorWrap]
*/
bool spawnCheckWaitStatus(int waitStatus)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)g_spawn_check_wait_status(waitStatus, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    On some platforms, notably Windows, the #GPid type represents a resource
    which must be closed to prevent resource leaking. [glib.global.spawnClosePid]
    is provided for this purpose. It should be used on all platforms, even
    though it doesn't do anything under UNIX.

    Params:
      pid = The process reference to close
*/
void spawnClosePid(glib.types.Pid pid)
{
  g_spawn_close_pid(pid);
}

/**
    A simple version of [glib.global.spawnAsync] that parses a command line with
    [glib.global.shellParseArgv] and passes it to [glib.global.spawnAsync].
    
    Runs a command line in the background. Unlike [glib.global.spawnAsync], the
    `G_SPAWN_SEARCH_PATH` flag is enabled, other flags are not. Note
    that `G_SPAWN_SEARCH_PATH` can have security implications, so
    consider using [glib.global.spawnAsync] directly if appropriate. Possible
    errors are those from [glib.global.shellParseArgv] and [glib.global.spawnAsync].
    
    The same concerns on Windows apply as for [glib.global.spawnCommandLineSync].

    Params:
      commandLine = a command line
    Returns: true on success, false if error is set
    Throws: [ErrorWrap]
*/
bool spawnCommandLineAsync(string commandLine)
{
  bool _retval;
  const(char)* _commandLine = commandLine.toCString(No.Alloc);
  GError *_err;
  _retval = cast(bool)g_spawn_command_line_async(_commandLine, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    A simple version of [glib.global.spawnSync] with little-used parameters
    removed, taking a command line instead of an argument vector.
    
    See [glib.global.spawnSync] for full details.
    
    The command_line argument will be parsed by [glib.global.shellParseArgv].
    
    Unlike [glib.global.spawnSync], the `G_SPAWN_SEARCH_PATH` flag is enabled.
    Note that `G_SPAWN_SEARCH_PATH` can have security implications, so
    consider using [glib.global.spawnSync] directly if appropriate.
    
    Possible errors are those from [glib.global.spawnSync] and those
    from [glib.global.shellParseArgv].
    
    If wait_status is non-null, the platform-specific status of
    the child is stored there; see the documentation of
    [glib.global.spawnCheckWaitStatus] for how to use and interpret this.
    On Unix platforms, note that it is usually not equal
    to the integer passed to `exit()` or returned from `main()`.
    
    On Windows, please note the implications of [glib.global.shellParseArgv]
    parsing command_line. Parsing is done according to Unix shell rules, not
    Windows command interpreter rules.
    Space is a separator, and backslashes are
    special. Thus you cannot simply pass a command_line containing
    canonical Windows paths, like "c:\\program files\\app\\app.exe", as
    the backslashes will be eaten, and the space will act as a
    separator. You need to enclose such paths with single quotes, like
    "'c:\\program files\\app\\app.exe' 'e:\\folder\\argument.txt'".

    Params:
      commandLine = a command line
      standardOutput = return location for child output
      standardError = return location for child errors
      waitStatus = return location for child wait status, as returned by waitpid()
    Returns: true on success, false if an error was set
    Throws: [ErrorWrap]
*/
bool spawnCommandLineSync(string commandLine, out string standardOutput, out string standardError, out int waitStatus)
{
  bool _retval;
  const(char)* _commandLine = commandLine.toCString(No.Alloc);
  char* _standardOutput;
  char* _standardError;
  GError *_err;
  _retval = cast(bool)g_spawn_command_line_sync(_commandLine, &_standardOutput, &_standardError, cast(int*)&waitStatus, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  standardOutput = _standardOutput.fromCString(Yes.Free);
  standardError = _standardError.fromCString(Yes.Free);
  return _retval;
}

/** */
glib.types.Quark spawnErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_spawn_error_quark();
  return _retval;
}

/** */
glib.types.Quark spawnExitErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_spawn_exit_error_quark();
  return _retval;
}

/**
    Executes a child synchronously (waits for the child to exit before returning).
    
    All output from the child is stored in standard_output and standard_error,
    if those parameters are non-null. Note that you must set the
    `G_SPAWN_STDOUT_TO_DEV_NULL` and `G_SPAWN_STDERR_TO_DEV_NULL` flags when
    passing null for standard_output and standard_error.
    
    If wait_status is non-null, the platform-specific status of
    the child is stored there; see the documentation of
    [glib.global.spawnCheckWaitStatus] for how to use and interpret this.
    On Unix platforms, note that it is usually not equal
    to the integer passed to `exit()` or returned from `main()`.
    
    Note that it is invalid to pass `G_SPAWN_DO_NOT_REAP_CHILD` in
    flags, and on POSIX platforms, the same restrictions as for
    [glib.global.childWatchSourceNew] apply.
    
    If an error occurs, no data is returned in standard_output,
    standard_error, or wait_status.
    
    This function calls [glib.global.spawnAsyncWithPipes] internally; see that
    function for full details on the other parameters and details on
    how these functions work on Windows.

    Params:
      workingDirectory = child's current working
            directory, or null to inherit parent's
      argv = child's argument vector, which must be non-empty and null-terminated
      envp = child's environment, or null to inherit parent's
      flags = flags from #GSpawnFlags
      childSetup = function to run
            in the child just before `exec()`
      standardOutput = return location for child output, or null
      standardError = return location for child error messages, or null
      waitStatus = return location for child wait status, as returned by waitpid(), or null
    Returns: true on success, false if an error was set
    Throws: [ErrorWrap]
*/
bool spawnSync(string workingDirectory, string[] argv, string[] envp, glib.types.SpawnFlags flags, glib.types.SpawnChildSetupFunc childSetup, out string standardOutput, out string standardError, out int waitStatus)
{
  extern(C) void _childSetupCallback(void* data)
  {
    auto _dlg = cast(glib.types.SpawnChildSetupFunc*)data;

    (*_dlg)();
  }
  auto _childSetupCB = childSetup ? &_childSetupCallback : null;
  bool _retval;
  const(char)* _workingDirectory = workingDirectory.toCString(No.Alloc);
  char*[] _tmpargv;
  foreach (s; argv)
    _tmpargv ~= s.toCString(No.Alloc);
  _tmpargv ~= null;
  char** _argv = _tmpargv.ptr;

  char*[] _tmpenvp;
  foreach (s; envp)
    _tmpenvp ~= s.toCString(No.Alloc);
  _tmpenvp ~= null;
  char** _envp = _tmpenvp.ptr;

  auto _childSetup = childSetup ? cast(void*)&(childSetup) : null;
  char* _standardOutput;
  char* _standardError;
  GError *_err;
  _retval = cast(bool)g_spawn_sync(_workingDirectory, _argv, _envp, flags, _childSetupCB, _childSetup, &_standardOutput, &_standardError, cast(int*)&waitStatus, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  standardOutput = _standardOutput.fromCString(Yes.Free);
  standardError = _standardError.fromCString(Yes.Free);
  return _retval;
}

/**
    A wrapper for the POSIX stat() function. The stat() function
    returns information about a file. On Windows the stat() function in
    the C library checks only the FAT-style READONLY attribute and does
    not look at the ACL at all. Thus on Windows the protection bits in
    the st_mode field are a fabrication of little use.
    
    On Windows the Microsoft C libraries have several variants of the
    stat struct and stat() function with names like _stat(), _stat32(),
    _stat32i64() and _stat64i32(). The one used here is for 32-bit code
    the one with 32-bit size and time fields, specifically called _stat32().
    
    In Microsoft's compiler, by default struct stat means one with
    64-bit time fields while in MinGW struct stat is the legacy one
    with 32-bit fields. To hopefully clear up this messs, the gstdio.h
    header defines a type #GStatBuf which is the appropriate struct type
    depending on the platform and/or compiler being used. On POSIX it
    is just struct stat, but note that even on POSIX platforms, stat()
    might be a macro.
    
    See your C library manual for more details about stat().

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
      buf = a pointer to a stat struct, which will be filled with the file
            information
    Returns: 0 if the information was successfully retrieved,
          -1 if an error occurred
*/
int stat(string filename, glib.types.StatBuf buf)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_stat(_filename, buf);
  return _retval;
}

/**
    Copies a nul-terminated string into the destination buffer, including
    the trailing nul byte, and returns a pointer to the trailing nul byte
    in `dest`.  The return value is useful for concatenating multiple
    strings without having to repeatedly scan for the end.

    Params:
      dest = destination buffer
      src = source string
    Returns: a pointer to the trailing nul byte in `dest`
*/
string stpcpy(string dest, string src)
{
  char* _cretval;
  char* _dest = dest.toCString(No.Alloc);
  const(char)* _src = src.toCString(No.Alloc);
  _cretval = g_stpcpy(_dest, _src);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Compares two strings for byte-by-byte equality and returns true
    if they are equal. It can be passed to [glib.hash_table.HashTable.new_] as the
    key_equal_func parameter, when using non-null strings as keys in a
    #GHashTable.
    
    This function is typically used for hash table comparisons, but can be used
    for general purpose comparisons of non-null strings. For a null-safe string
    comparison function, see [glib.global.strcmp0].

    Params:
      v1 = a key
      v2 = a key to compare with v1
    Returns: true if the two keys match
*/
bool strEqual(const(void)* v1, const(void)* v2)
{
  bool _retval;
  _retval = cast(bool)g_str_equal(v1, v2);
  return _retval;
}

/**
    Looks whether the string str begins with prefix.

    Params:
      str = a string to look in
      prefix = the prefix to look for
    Returns: true if str begins with prefix, false otherwise
*/
bool strHasPrefix(string str, string prefix)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  const(char)* _prefix = prefix.toCString(No.Alloc);
  _retval = cast(bool)g_str_has_prefix(_str, _prefix);
  return _retval;
}

/**
    Looks whether a string ends with suffix.

    Params:
      str = a string to look in
      suffix = the suffix to look for
    Returns: true if str ends with suffix, false otherwise
*/
bool strHasSuffix(string str, string suffix)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  const(char)* _suffix = suffix.toCString(No.Alloc);
  _retval = cast(bool)g_str_has_suffix(_str, _suffix);
  return _retval;
}

/**
    Converts a string to a hash value.
    
    This function implements the widely used "djb" hash apparently
    posted by Daniel Bernstein to comp.lang.c some time ago.  The 32
    bit unsigned hash value starts at 5381 and for each byte 'c' in
    the string, is updated: `hash = hash * 33 + c`. This function
    uses the signed value of each byte.
    
    It can be passed to [glib.hash_table.HashTable.new_] as the hash_func parameter,
    when using non-null strings as keys in a #GHashTable.
    
    Note that this function may not be a perfect fit for all use cases.
    For example, it produces some hash collisions with strings as short
    as 2.

    Params:
      v = a string key
    Returns: a hash value corresponding to the key
*/
uint strHash(const(void)* v)
{
  uint _retval;
  _retval = g_str_hash(v);
  return _retval;
}

/**
    Determines if a string is pure ASCII. A string is pure ASCII if it
    contains no bytes with the high bit set.

    Params:
      str = a string
    Returns: true if str is ASCII
*/
bool strIsAscii(string str)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  _retval = cast(bool)g_str_is_ascii(_str);
  return _retval;
}

/**
    Checks if a search conducted for search_term should match
    potential_hit.
    
    This function calls `funcGLib.str_tokenize_and_fold` on both
    search_term and potential_hit. ASCII alternates are never taken
    for search_term but will be taken for potential_hit according to
    the value of accept_alternates.
    
    A hit occurs when each folded token in search_term is a prefix of a
    folded token from potential_hit.
    
    Depending on how you're performing the search, it will typically be
    faster to call `[glib.global.strTokenizeAndFold]` on each string in
    your corpus and build an index on the returned folded tokens, then
    call `[glib.global.strTokenizeAndFold]` on the search term and
    perform lookups into that index.
    
    As some examples, searching for ‘fred’ would match the potential hit
    ‘Smith, Fred’ and also ‘Frédéric’.  Searching for ‘Fréd’ would match
    ‘Frédéric’ but not ‘Frederic’ (due to the one-directional nature of
    accent matching).  Searching ‘fo’ would match ‘Foo’ and ‘Bar Foo
    Baz’, but not ‘SFO’ (because no word has ‘fo’ as a prefix).

    Params:
      searchTerm = the search term from the user
      potentialHit = the text that may be a hit
      acceptAlternates = if true, ASCII alternates are accepted
    Returns: true if potential_hit is a hit
*/
bool strMatchString(string searchTerm, string potentialHit, bool acceptAlternates)
{
  bool _retval;
  const(char)* _searchTerm = searchTerm.toCString(No.Alloc);
  const(char)* _potentialHit = potentialHit.toCString(No.Alloc);
  _retval = cast(bool)g_str_match_string(_searchTerm, _potentialHit, acceptAlternates);
  return _retval;
}

/**
    Transliterate str to plain ASCII.
    
    For best results, str should be in composed normalised form.
    
    This function performs a reasonably good set of character
    replacements.  The particular set of replacements that is done may
    change by version or even by runtime environment.
    
    If the source language of str is known, it can used to improve the
    accuracy of the translation by passing it as from_locale.  It should
    be a valid POSIX locale string (of the form
    `language[_territory][.codeset][modifier]`).
    
    If from_locale is null then the current locale is used.
    
    If you want to do translation for no specific locale, and you want it
    to be done independently of the currently locale, specify `"C"` for
    from_locale.

    Params:
      str = a string, in UTF-8
      fromLocale = the source locale, if known
    Returns: a string in plain ASCII
*/
string strToAscii(string str, string fromLocale = null)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  const(char)* _fromLocale = fromLocale.toCString(No.Alloc);
  _cretval = g_str_to_ascii(_str, _fromLocale);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Tokenizes string and performs folding on each token.
    
    A token is a non-empty sequence of alphanumeric characters in the
    source string, separated by non-alphanumeric characters.  An
    "alphanumeric" character for this purpose is one that matches
    `funcGLib.unichar_isalnum` or `funcGLib.unichar_ismark`.
    
    Each token is then (Unicode) normalised and case-folded.  If
    ascii_alternates is non-`NULL` and some of the returned tokens
    contain non-ASCII characters, ASCII alternatives will be generated.
    
    The number of ASCII alternatives that are generated and the method
    for doing so is unspecified, but translit_locale (if specified) may
    improve the transliteration if the language of the source string is
    known.

    Params:
      string_ = a string to tokenize
      translitLocale = the language code (like 'de' or
          'en_GB') from which string originates
      asciiAlternates = a return location for ASCII alternates
    Returns: the folded tokens
*/
string[] strTokenizeAndFold(string string_, string translitLocale, out string[] asciiAlternates)
{
  char** _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  const(char)* _translitLocale = translitLocale.toCString(No.Alloc);
  char** _asciiAlternates;
  _cretval = g_str_tokenize_and_fold(_string_, _translitLocale, &_asciiAlternates);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  uint _lenasciiAlternates;
  if (_asciiAlternates)
  {
    for (; _asciiAlternates[_lenasciiAlternates] !is null; _lenasciiAlternates++)
    {
    }
  }

  asciiAlternates.length = _lenasciiAlternates;
  foreach (i; 0 .. _lenasciiAlternates)
    asciiAlternates[i] = _asciiAlternates[i].fromCString(Yes.Free);
  gFree(cast(void*)_asciiAlternates);
  return _retval;
}

/**
    For each character in string, if the character is not in valid_chars,
    replaces the character with substitutor.
    
    Modifies string in place, and return string itself, not a copy. The
    return value is to allow nesting such as:
    ```C
    g_ascii_strup (g_strcanon (str, "abc", '?'))
    ```
    
    In order to modify a copy, you may use `funcGLib.strdup`:
    ```C
    reformatted = g_strcanon (g_strdup (const_str), "abc", '?');
    …
    g_free (reformatted);
    ```

    Params:
      string_ = a nul-terminated array of bytes
      validChars = bytes permitted in string
      substitutor = replacement character for disallowed bytes
    Returns: the modified string
*/
string strcanon(string string_, string validChars, char substitutor)
{
  char* _cretval;
  char* _string_ = string_.toCString(No.Alloc);
  const(char)* _validChars = validChars.toCString(No.Alloc);
  _cretval = g_strcanon(_string_, _validChars, substitutor);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    A case-insensitive string comparison, corresponding to the standard
    `strcasecmp()` function on platforms which support it.

    Params:
      s1 = string to compare with s2
      s2 = string to compare with s1
    Returns: 0 if the strings match, a negative value if s1 < s2,
        or a positive value if s1 > s2

    Deprecated: See `funcGLib.strncasecmp` for a discussion of why this
        function is deprecated and how to replace it.
*/
int strcasecmp(string s1, string s2)
{
  int _retval;
  const(char)* _s1 = s1.toCString(No.Alloc);
  const(char)* _s2 = s2.toCString(No.Alloc);
  _retval = g_strcasecmp(_s1, _s2);
  return _retval;
}

/**
    Removes trailing whitespace from a string.
    
    This function doesn't allocate or reallocate any memory;
    it modifies string in place. Therefore, it cannot be used
    on statically allocated strings.
    
    The pointer to string is returned to allow the nesting of functions.
    
    Also see `funcGLib.strchug` and `funcGLib.strstrip`.

    Params:
      string_ = a string to remove the trailing whitespace from
    Returns: the modified string
*/
string strchomp(string string_)
{
  char* _cretval;
  char* _string_ = string_.toCString(No.Alloc);
  _cretval = g_strchomp(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Removes leading whitespace from a string, by moving the rest
    of the characters forward.
    
    This function doesn't allocate or reallocate any memory;
    it modifies string in place. Therefore, it cannot be used on
    statically allocated strings.
    
    The pointer to string is returned to allow the nesting of functions.
    
    Also see `funcGLib.strchomp` and `funcGLib.strstrip`.

    Params:
      string_ = a string to remove the leading whitespace from
    Returns: the modified string
*/
string strchug(string string_)
{
  char* _cretval;
  char* _string_ = string_.toCString(No.Alloc);
  _cretval = g_strchug(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Compares str1 and str2 like strcmp(). Handles null
    gracefully by sorting it before non-null strings.
    Comparing two null pointers returns 0.

    Params:
      str1 = a C string or null
      str2 = another C string or null
    Returns: an integer less than, equal to, or greater than zero, if str1 is <, == or > than str2.
*/
int strcmp0(string str1 = null, string str2 = null)
{
  int _retval;
  const(char)* _str1 = str1.toCString(No.Alloc);
  const(char)* _str2 = str2.toCString(No.Alloc);
  _retval = g_strcmp0(_str1, _str2);
  return _retval;
}

/**
    Replaces all escaped characters with their one byte equivalent.
    
    This function does the reverse conversion of `funcGLib.strescape`.

    Params:
      source = a string to compress
    Returns: a newly-allocated copy of source with all escaped
        character compressed
*/
string strcompress(string source)
{
  char* _cretval;
  const(char)* _source = source.toCString(No.Alloc);
  _cretval = g_strcompress(_source);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts any delimiter characters in string to new_delimiter.
    
    Any characters in string which are found in delimiters are
    changed to the new_delimiter character. Modifies string in place,
    and returns string itself, not a copy.
    
    The return value is to allow nesting such as:
    ```C
    g_ascii_strup (g_strdelimit (str, "abc", '?'))
    ```
    
    In order to modify a copy, you may use `funcGLib.strdup`:
    ```C
    reformatted = g_strdelimit (g_strdup (const_str), "abc", '?');
    …
    g_free (reformatted);
    ```

    Params:
      string_ = the string to convert
      delimiters = a string containing the current delimiters, or
          `NULL` to use the standard delimiters defined in [glib.types.STR_DELIMITERS]
      newDelimiter = the new delimiter character
    Returns: the modified string
*/
string strdelimit(string string_, string delimiters, char newDelimiter)
{
  char* _cretval;
  char* _string_ = string_.toCString(No.Alloc);
  const(char)* _delimiters = delimiters.toCString(No.Alloc);
  _cretval = g_strdelimit(_string_, _delimiters, newDelimiter);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a string to lower case.

    Params:
      string_ = the string to convert
    Returns: the string

    Deprecated: This function is totally broken for the reasons discussed
        in the `funcGLib.strncasecmp` docs — use `funcGLib.ascii_strdown` or
        `funcGLib.utf8_strdown` instead.
*/
string strdown(string string_)
{
  char* _cretval;
  char* _string_ = string_.toCString(No.Alloc);
  _cretval = g_strdown(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Duplicates a string. If str is `NULL` it returns `NULL`.

    Params:
      str = the string to duplicate
    Returns: a newly-allocated copy of str
*/
string strdup(string str = null)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_strdup(_str);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Copies an array of strings. The copy is a deep copy; each string is also
    copied.
    
    If called on a `NULL` value, `[glib.global.strdupv]` simply returns `NULL`.

    Params:
      strArray = an array of strings to copy
    Returns: a
        newly-allocated array of strings. Use `funcGLib.strfreev` to free it.
*/
string[] strdupv(string[] strArray = null)
{
  char** _cretval;
  char*[] _tmpstrArray;
  foreach (s; strArray)
    _tmpstrArray ~= s.toCString(No.Alloc);
  _tmpstrArray ~= null;
  char** _strArray = _tmpstrArray.ptr;

  _cretval = g_strdupv(_strArray);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Returns a string corresponding to the given error code, e.g. "no
    such process".
    
    Unlike `strerror()`, this always returns a string in
    UTF-8 encoding, and the pointer is guaranteed to remain valid for
    the lifetime of the process. If the error code is unknown, it returns a
    string like “Unknown error <code\>”.
    
    Note that the string may be translated according to the current locale.
    
    The value of `errno` will not be changed by this function. However, it may
    be changed by intermediate function calls, so you should save its value
    as soon as the call returns:
    ```C
    int saved_errno;
    
    ret = read (blah);
    saved_errno = errno;
    
    g_strerror (saved_errno);
    ```

    Params:
      errnum = the system error number. See the standard C `errno` documentation
    Returns: the string describing the error code
*/
string strerror(int errnum)
{
  const(char)* _cretval;
  _cretval = g_strerror(errnum);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Escapes the special characters '\b', '\f', '\n', '\r', '\t', '\v', '\'
    and '"' in the string source by inserting a '\' before
    them. Additionally all characters in the range 0x01-0x1F (everything
    below SPACE) and in the range 0x7F-0xFF (all non-ASCII chars) are
    replaced with a '\' followed by their octal representation.
    Characters supplied in exceptions are not escaped.
    
    `funcGLib.strcompress` does the reverse conversion.

    Params:
      source = a string to escape
      exceptions = a string of characters not to escape in source
    Returns: a newly-allocated copy of source with special characters escaped
*/
string strescape(string source, string exceptions = null)
{
  char* _cretval;
  const(char)* _source = source.toCString(No.Alloc);
  const(char)* _exceptions = exceptions.toCString(No.Alloc);
  _cretval = g_strescape(_source, _exceptions);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    An auxiliary function for gettext() support (see Q_()).

    Params:
      msgid = a string
      msgval = another string
    Returns: msgval, unless msgval is identical to msgid
          and contains a '|' character, in which case a pointer to
          the substring of msgid after the first '|' character is returned.
*/
string stripContext(string msgid, string msgval)
{
  const(char)* _cretval;
  const(char)* _msgid = msgid.toCString(No.Alloc);
  const(char)* _msgval = msgval.toCString(No.Alloc);
  _cretval = g_strip_context(_msgid, _msgval);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Joins an array of strings together to form one long string, with the
    optional separator inserted between each of them.
    
    If str_array has no items, the return value will be an
    empty string. If str_array contains a single item, separator will not
    appear in the resulting string.

    Params:
      separator = a string to insert between each of the strings
      strArray = an array of strings to join
    Returns: a newly-allocated string containing all of the strings joined
        together, with separator between them
*/
string strjoinv(string separator, string[] strArray)
{
  char* _cretval;
  const(char)* _separator = separator.toCString(No.Alloc);
  char*[] _tmpstrArray;
  foreach (s; strArray)
    _tmpstrArray ~= s.toCString(No.Alloc);
  _tmpstrArray ~= null;
  char** _strArray = _tmpstrArray.ptr;

  _cretval = g_strjoinv(_separator, _strArray);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    A case-insensitive string comparison, corresponding to the standard
    `strncasecmp()` function on platforms which support it. It is similar
    to `funcGLib.strcasecmp` except it only compares the first `n` characters of
    the strings.

    Params:
      s1 = string to compare with s2
      s2 = string to compare with s1
      n = the maximum number of characters to compare
    Returns: 0 if the strings match, a negative value if s1 < s2,
        or a positive value if s1 > s2

    Deprecated: The problem with `[glib.global.strncasecmp]` is that it does
        the comparison by calling `toupper()`/`tolower()`. These functions
        are locale-specific and operate on single bytes. However, it is
        impossible to handle things correctly from an internationalization
        standpoint by operating on bytes, since characters may be multibyte.
        Thus `[glib.global.strncasecmp]` is broken if your string is guaranteed to be
        ASCII, since it is locale-sensitive, and it's broken if your string
        is localized, since it doesn't work on many encodings at all,
        including UTF-8, EUC-JP, etc.
      
        There are therefore two replacement techniques: `funcGLib.ascii_strncasecmp`,
        which only works on ASCII and is not locale-sensitive, and
        `funcGLib.utf8_casefold` followed by `strcmp()` on the resulting strings,
        which is good for case-insensitive sorting of UTF-8.
*/
int strncasecmp(string s1, string s2, uint n)
{
  int _retval;
  const(char)* _s1 = s1.toCString(No.Alloc);
  const(char)* _s2 = s2.toCString(No.Alloc);
  _retval = g_strncasecmp(_s1, _s2, n);
  return _retval;
}

/**
    Duplicates the first `n` bytes of a string, returning a newly-allocated
    buffer `n` + 1 bytes long which will always be nul-terminated. If str
    is less than `n` bytes long the buffer is padded with nuls. If str is
    `NULL` it returns `NULL`.
    
    To copy a number of characters from a UTF-8 encoded string,
    use `funcGLib.utf8_strncpy` instead.

    Params:
      str = the string to duplicate
      n = the maximum number of bytes to copy from str
    Returns: a newly-allocated buffer containing the first
         `n` bytes of str
*/
string strndup(string str, size_t n)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_strndup(_str, n);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Creates a new string length bytes long filled with fill_char.

    Params:
      length = the length of the new string
      fillChar = the byte to fill the string with
    Returns: a newly-allocated string filled with fill_char
*/
string strnfill(size_t length, char fillChar)
{
  char* _cretval;
  _cretval = g_strnfill(length, fillChar);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Reverses all of the bytes in a string. For example,
    `g_strreverse ("abcdef")` will result in "fedcba".
    
    Note that `[glib.global.strreverse]` doesn't work on UTF-8 strings
    containing multibyte characters. For that purpose, use
    `funcGLib.utf8_strreverse`.

    Params:
      string_ = the string to reverse
    Returns: the string, reversed in place
*/
string strreverse(string string_)
{
  char* _cretval;
  char* _string_ = string_.toCString(No.Alloc);
  _cretval = g_strreverse(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Searches the string haystack for the last occurrence
    of the string needle.

    Params:
      haystack = a string to search in
      needle = the string to search for
    Returns: a pointer to the found occurrence, or `NULL` if not found
*/
string strrstr(string haystack, string needle)
{
  char* _cretval;
  const(char)* _haystack = haystack.toCString(No.Alloc);
  const(char)* _needle = needle.toCString(No.Alloc);
  _cretval = g_strrstr(_haystack, _needle);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Returns a string describing the given signal, e.g. "Segmentation fault".
    If the signal is unknown, it returns “unknown signal (<signum\>)”.
    
    You should use this function in preference to `strsignal()`, because it
    returns a string in UTF-8 encoding, and since not all platforms support
    the `strsignal()` function.

    Params:
      signum = the signal number. See the `signal` documentation
    Returns: the string describing the signal
*/
string strsignal(int signum)
{
  const(char)* _cretval;
  _cretval = g_strsignal(signum);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Splits a string into a maximum of max_tokens pieces, using the given
    delimiter. If max_tokens is reached, the remainder of string is
    appended to the last token.
    
    As an example, the result of `g_strsplit (":a:bc::d:", ":", -1)` is an array
    containing the six strings "", "a", "bc", "", "d" and "".
    
    As a special case, the result of splitting the empty string "" is an empty
    array, not an array containing a single string. The reason for this
    special case is that being able to represent an empty array is typically
    more useful than consistent handling of empty elements. If you do need
    to represent empty elements, you'll need to check for the empty string
    before calling `[glib.global.strsplit]`.

    Params:
      string_ = a string to split
      delimiter = a string which specifies the places at which to split
          the string. The delimiter is not included in any of the resulting
          strings, unless max_tokens is reached.
      maxTokens = the maximum number of pieces to split string into
          If this is less than 1, the string is split completely
    Returns: a newly-allocated array of strings, freed with
        `funcGLib.strfreev`
*/
string[] strsplit(string string_, string delimiter, int maxTokens)
{
  char** _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  const(char)* _delimiter = delimiter.toCString(No.Alloc);
  _cretval = g_strsplit(_string_, _delimiter, maxTokens);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Splits string into a number of tokens not containing any of the characters
    in delimiters. A token is the (possibly empty) longest string that does not
    contain any of the characters in delimiters. If max_tokens is reached, the
    remainder is appended to the last token.
    
    For example, the result of g_strsplit_set ("abc:def/ghi", ":/", -1) is an
    array containing the three strings "abc", "def", and "ghi".
    
    The result of g_strsplit_set (":def/ghi:", ":/", -1) is an array containing
    the four strings "", "def", "ghi", and "".
    
    As a special case, the result of splitting the empty string "" is an empty
    array, not an array containing a single string. The reason for this
    special case is that being able to represent an empty array is typically
    more useful than consistent handling of empty elements. If you do need
    to represent empty elements, you'll need to check for the empty string
    before calling `[glib.global.strsplitSet]`.
    
    Note that this function works on bytes not characters, so it can't be used
    to delimit UTF-8 strings for anything but ASCII characters.

    Params:
      string_ = a string to split
      delimiters = a string containing characters that are used to split the
          string. Can be empty, which will result in no string splitting
      maxTokens = the maximum number of tokens to split string into.
          If this is less than 1, the string is split completely
    Returns: a newly-allocated array of strings. Use
        `funcGLib.strfreev` to free it.
*/
string[] strsplitSet(string string_, string delimiters, int maxTokens)
{
  char** _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  const(char)* _delimiters = delimiters.toCString(No.Alloc);
  _cretval = g_strsplit_set(_string_, _delimiters, maxTokens);
  string[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] !is null)
      _cretlength++;
    _retval = new string[_cretlength];
    foreach (i; 0 .. _cretlength)
      _retval[i] = _cretval[i].fromCString(Yes.Free);
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Converts a string to a floating point value.
    
    It calls the standard `strtod()` function to handle the conversion, but
    if the string is not completely converted it attempts the conversion
    again with `funcGLib.ascii_strtod`, and returns the best match.
    
    This function should seldom be used. The normal situation when reading
    numbers not for human consumption is to use `funcGLib.ascii_strtod`. Only when
    you know that you must expect both locale formatted and C formatted numbers
    should you use this. Make sure that you don't pass strings such as comma
    separated lists of values, since the commas may be interpreted as a decimal
    point in some locales, causing unexpected results.

    Params:
      nptr = the string to convert to a numeric value
      endptr = if non-`NULL`, it returns the
          character after the last character used in the conversion
    Returns: the converted value
*/
double strtod(string nptr, out string endptr)
{
  double _retval;
  const(char)* _nptr = nptr.toCString(No.Alloc);
  char* _endptr;
  _retval = g_strtod(_nptr, &_endptr);
  endptr = _endptr.fromCString(No.Free);
  return _retval;
}

/**
    Converts a string to upper case.

    Params:
      string_ = the string to convert
    Returns: the string

    Deprecated: This function is totally broken for the reasons discussed
        in the `funcGLib.strncasecmp` docs — use `funcGLib.ascii_strup` or
        `funcGLib.utf8_strup` instead.
*/
string strup(string string_)
{
  char* _cretval;
  char* _string_ = string_.toCString(No.Alloc);
  _cretval = g_strup(_string_);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Checks if an array of strings contains the string str according to
    `funcGLib.str_equal`. strv must not be `NULL`.

    Params:
      strv = an array of strings to search in
      str = the string to search for
    Returns: true if str is an element of strv
*/
bool strvContains(string[] strv, string str)
{
  bool _retval;
  char*[] _tmpstrv;
  foreach (s; strv)
    _tmpstrv ~= s.toCString(No.Alloc);
  _tmpstrv ~= null;
  const(char*)* _strv = _tmpstrv.ptr;

  const(char)* _str = str.toCString(No.Alloc);
  _retval = cast(bool)g_strv_contains(_strv, _str);
  return _retval;
}

/**
    Checks if two arrays of strings contain exactly the same elements in
    exactly the same order.
    
    Elements are compared using `funcGLib.str_equal`. To match independently
    of order, sort the arrays first (using `funcGLib.qsort_with_data`
    or similar).
    
    Elements are compared using `funcGLib.str_equal`. To match independently
    of order, sort the arrays first (using `funcGLib.qsort_with_data`
    or similar).
    
    Two empty arrays are considered equal. Neither strv1 nor strv2 may be
    `NULL`.

    Params:
      strv1 = an array of strings to compare to strv2
      strv2 = an array of strings to compare to strv1
    Returns: true if strv1 and strv2 are equal
*/
bool strvEqual(string[] strv1, string[] strv2)
{
  bool _retval;
  char*[] _tmpstrv1;
  foreach (s; strv1)
    _tmpstrv1 ~= s.toCString(No.Alloc);
  _tmpstrv1 ~= null;
  const(char*)* _strv1 = _tmpstrv1.ptr;

  char*[] _tmpstrv2;
  foreach (s; strv2)
    _tmpstrv2 ~= s.toCString(No.Alloc);
  _tmpstrv2 ~= null;
  const(char*)* _strv2 = _tmpstrv2.ptr;

  _retval = cast(bool)g_strv_equal(_strv1, _strv2);
  return _retval;
}

/** */
gobject.types.GType strvGetType()
{
  gobject.types.GType _retval;
  _retval = g_strv_get_type();
  return _retval;
}

/**
    Returns the length of an array of strings. str_array must not be `NULL`.

    Params:
      strArray = an array of strings
    Returns: length of str_array
*/
uint strvLength(string[] strArray)
{
  uint _retval;
  char*[] _tmpstrArray;
  foreach (s; strArray)
    _tmpstrArray ~= s.toCString(No.Alloc);
  _tmpstrArray ~= null;
  char** _strArray = _tmpstrArray.ptr;

  _retval = g_strv_length(_strArray);
  return _retval;
}

/**
    Create a new test case, similar to [glib.global.testCreateCase]. However
    the test is assumed to use no fixture, and test suites are automatically
    created on the fly and added to the root fixture, based on the
    slash-separated portions of testpath. The test_data argument
    will be passed as first argument to test_func.
    
    If testpath includes the component "subprocess" anywhere in it,
    the test will be skipped by default, and only run if explicitly
    required via the `-p` command-line option or [glib.global.testTrapSubprocess].
    
    No component of testpath may start with a dot (`.`) if the
    [glib.types.TEST_OPTION_ISOLATE_DIRS] option is being used; and it is recommended to
    do so even if it isn’t.

    Params:
      testpath = /-separated test case path name for the test.
      testData = Test data argument for the test function.
      testFunc = The test function to invoke for this test.
*/
void testAddDataFunc(string testpath, const(void)* testData, glib.types.TestDataFunc testFunc)
{
  extern(C) void _testFuncCallback(const(void)* userData)
  {
    ptrThawGC(userData);
    auto _dlg = cast(glib.types.TestDataFunc*)userData;

    (*_dlg)();
  }
  auto _testFuncCB = testFunc ? &_testFuncCallback : null;
  const(char)* _testpath = testpath.toCString(No.Alloc);
  g_test_add_data_func(_testpath, testData, _testFuncCB);
}

/** */
void testAssertExpectedMessagesInternal(string domain, string file, int line, string func)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  g_test_assert_expected_messages_internal(_domain, _file, line, _func);
}

/**
    This function adds a message to test reports that
    associates a bug URI with a test case.
    
    Bug URIs are constructed from a base URI set with [glib.global.testBugBase]
    and bug_uri_snippet. If [glib.global.testBugBase] has not been called, it is
    assumed to be the empty string, so a full URI can be provided to
    [glib.global.testBug] instead.
    
    Since GLib 2.70, the base URI is not prepended to bug_uri_snippet if it
    is already a valid URI.

    Params:
      bugUriSnippet = Bug specific bug tracker URI or URI portion.

    Version: See also: g_test_summary()
*/
void testBug(string bugUriSnippet)
{
  const(char)* _bugUriSnippet = bugUriSnippet.toCString(No.Alloc);
  g_test_bug(_bugUriSnippet);
}

/**
    Specify the base URI for bug reports.
    
    The base URI is used to construct bug report messages for
    [glib.global.testMessage] when [glib.global.testBug] is called.
    Calling this function outside of a test case sets the
    default base URI for all test cases. Calling it from within
    a test case changes the base URI for the scope of the test
    case only.
    Bug URIs are constructed by appending a bug specific URI
    portion to uri_pattern, or by replacing the special string
    ``s`` within uri_pattern if that is present.
    
    If [glib.global.testBugBase] is not called, bug URIs are formed solely
    from the value provided by [glib.global.testBug].

    Params:
      uriPattern = the base pattern for bug URIs
*/
void testBugBase(string uriPattern)
{
  const(char)* _uriPattern = uriPattern.toCString(No.Alloc);
  g_test_bug_base(_uriPattern);
}

/**
    Attempt to disable system crash reporting infrastructure.
    
    This function should be called before exercising code paths that are
    expected or intended to crash, to avoid wasting resources in system-wide
    crash collection infrastructure such as systemd-coredump or abrt.
*/
void testDisableCrashReporting()
{
  g_test_disable_crash_reporting();
}

/**
    Indicates that a message with the given log_domain and log_level,
    with text matching pattern, is expected to be logged.
    
    When this message is logged, it will not be printed, and the test case will
    not abort.
    
    This API may only be used with the old logging API (`funcGLib.log` without
    `G_LOG_USE_STRUCTURED` defined). It will not work with the structured logging
    API. See [Testing for Messages](logging.html#testing-for-messages).
    
    Use `funcGLib.test_assert_expected_messages` to assert that all
    previously-expected messages have been seen and suppressed.
    
    You can call this multiple times in a row, if multiple messages are
    expected as a result of a single call. (The messages must appear in
    the same order as the calls to `funcGLib.test_expect_message`.)
    
    For example:
    
    ```c
    // g_main_context_push_thread_default() should fail if the
    // context is already owned by another thread.
    g_test_expect_message (G_LOG_DOMAIN,
                           G_LOG_LEVEL_CRITICAL,
                           "assertion*acquired_context*failed");
    g_main_context_push_thread_default (bad_context);
    g_test_assert_expected_messages ();
    ```
    
    Note that you cannot use this to test `funcGLib.error` messages, since
    `funcGLib.error` intentionally never returns even if the program doesn’t
    abort; use `funcGLib.test_trap_subprocess` in this case.
    
    If messages at `flagsGLib.LogLevelFlags.LEVEL_DEBUG` are emitted, but not explicitly
    expected via `funcGLib.test_expect_message` then they will be ignored.

    Params:
      logDomain = the log domain of the message
      logLevel = the log level of the message
      pattern = a glob-style pattern (see [glib.pattern_spec.PatternSpec])
*/
void testExpectMessage(string logDomain, glib.types.LogLevelFlags logLevel, string pattern)
{
  const(char)* _logDomain = logDomain.toCString(No.Alloc);
  const(char)* _pattern = pattern.toCString(No.Alloc);
  g_test_expect_message(_logDomain, logLevel, _pattern);
}

/**
    Indicates that a test failed. This function can be called
    multiple times from the same test. You can use this function
    if your test failed in a recoverable way.
    
    Do not use this function if the failure of a test could cause
    other tests to malfunction.
    
    Calling this function will not stop the test from running, you
    need to return from the test function yourself. So you can
    produce additional diagnostic messages or even continue running
    the test.
    
    If not called from inside a test, this function does nothing.
    
    Note that unlike [glib.global.testSkip] and [glib.global.testIncomplete], this
    function does not log a message alongside the test failure.
    If details of the test failure are available, either log them with
    [glib.global.testMessage] before [glib.global.testFail], or use [glib.global.testFailPrintf]
    instead.
*/
void testFail()
{
  g_test_fail();
}

/**
    Returns whether a test has already failed. This will
    be the case when [glib.global.testFail], [glib.global.testIncomplete]
    or [glib.global.testSkip] have been called, but also if an
    assertion has failed.
    
    This can be useful to return early from a test if
    continuing after a failed assertion might be harmful.
    
    The return value of this function is only meaningful
    if it is called from inside a test function.
    Returns: true if the test has failed
*/
bool testFailed()
{
  bool _retval;
  _retval = cast(bool)g_test_failed();
  return _retval;
}

/**
    Gets the pathname of the directory containing test files of the type
    specified by file_type.
    
    This is approximately the same as calling g_test_build_filename("."),
    but you don't need to free the return value.

    Params:
      fileType = the type of file (built vs. distributed)
    Returns: the path of the directory, owned by GLib
*/
string testGetDir(glib.types.TestFileType fileType)
{
  const(char)* _cretval;
  _cretval = g_test_get_dir(fileType);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Gets the test path for the test currently being run.
    
    In essence, it will be the same string passed as the first argument to
    e.g. g_test_add() when the test was added.
    
    This function returns a valid string only within a test function.
    
    Note that this is a test path, not a file system path.
    Returns: the test path for the test currently being run
*/
string testGetPath()
{
  const(char)* _cretval;
  _cretval = g_test_get_path();
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Indicates that a test failed because of some incomplete
    functionality. This function can be called multiple times
    from the same test.
    
    Calling this function will not stop the test from running, you
    need to return from the test function yourself. So you can
    produce additional diagnostic messages or even continue running
    the test.
    
    If not called from inside a test, this function does nothing.

    Params:
      msg = explanation
*/
void testIncomplete(string msg = null)
{
  const(char)* _msg = msg.toCString(No.Alloc);
  g_test_incomplete(_msg);
}

/** */
string testLogTypeName(glib.types.TestLogType logType)
{
  const(char)* _cretval;
  _cretval = g_test_log_type_name(logType);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Enqueue a pointer to be released with [glib.global.gfree] during the next
    teardown phase. This is equivalent to calling [glib.global.testQueueDestroy]
    with a destroy callback of [glib.global.gfree].

    Params:
      gfreePointer = the pointer to be stored.
*/
void testQueueFree(void* gfreePointer = null)
{
  g_test_queue_free(gfreePointer);
}

/**
    Get a reproducible random floating point number,
    see [glib.global.testRandInt] for details on test case random numbers.
    Returns: a random number from the seeded random number generator.
*/
double testRandDouble()
{
  double _retval;
  _retval = g_test_rand_double();
  return _retval;
}

/**
    Get a reproducible random floating pointer number out of a specified range,
    see [glib.global.testRandInt] for details on test case random numbers.

    Params:
      rangeStart = the minimum value returned by this function
      rangeEnd = the minimum value not returned by this function
    Returns: a number with range_start <= number < range_end.
*/
double testRandDoubleRange(double rangeStart, double rangeEnd)
{
  double _retval;
  _retval = g_test_rand_double_range(rangeStart, rangeEnd);
  return _retval;
}

/**
    Get a reproducible random integer number.
    
    The random numbers generated by the g_test_rand_*() family of functions
    change with every new test program start, unless the --seed option is
    given when starting test programs.
    
    For individual test cases however, the random number generator is
    reseeded, to avoid dependencies between tests and to make --seed
    effective for all test cases.
    Returns: a random number from the seeded random number generator.
*/
int testRandInt()
{
  int _retval;
  _retval = g_test_rand_int();
  return _retval;
}

/**
    Get a reproducible random integer number out of a specified range,
    see [glib.global.testRandInt] for details on test case random numbers.

    Params:
      begin = the minimum value returned by this function
      end = the smallest value not to be returned by this function
    Returns: a number with begin <= number < end.
*/
int testRandIntRange(int begin, int end)
{
  int _retval;
  _retval = g_test_rand_int_range(begin, end);
  return _retval;
}

/**
    Runs all tests under the toplevel suite which can be retrieved
    with [glib.global.testGetRoot]. Similar to [glib.global.testRunSuite], the test
    cases to be run are filtered according to test path arguments
    (`-p testpath` and `-s testpath`) as parsed by [glib.global.testInit].
    [glib.global.testRunSuite] or [glib.global.testRun] may only be called once in a
    program.
    
    In general, the tests and sub-suites within each suite are run in
    the order in which they are defined. However, note that prior to
    GLib 2.36, there was a bug in the `g_test_add_*`
    functions which caused them to create multiple suites with the same
    name, meaning that if you created tests "/foo/simple",
    "/bar/simple", and "/foo/using-bar" in that order, they would get
    run in that order (since [glib.global.testRun] would run the first "/foo"
    suite, then the "/bar" suite, then the second "/foo" suite). As of
    2.36, this bug is fixed, and adding the tests in that order would
    result in a running order of "/foo/simple", "/foo/using-bar",
    "/bar/simple". If this new ordering is sub-optimal (because it puts
    more-complicated tests before simpler ones, making it harder to
    figure out exactly what has failed), you can fix it by changing the
    test paths to group tests by suite in a way that will result in the
    desired running order. Eg, "/simple/foo", "/simple/bar",
    "/complex/foo-using-bar".
    
    However, you should never make the actual result of a test depend
    on the order that tests are run in. If you need to ensure that some
    particular code runs before or after a given test case, use
    g_test_add(), which lets you specify setup and teardown functions.
    
    If all tests are skipped or marked as incomplete (expected failures),
    this function will return 0 if producing TAP output, or 77 (treated
    as "skip test" by Automake) otherwise.
    Returns: 0 on success, 1 on failure (assuming it returns at all),
        0 or 77 if all tests were skipped with [glib.global.testSkip] and/or
        [glib.global.testIncomplete]
*/
int testRun()
{
  int _retval;
  _retval = g_test_run();
  return _retval;
}

/**
    Execute the tests within suite and all nested #GTestSuites.
    The test suites to be executed are filtered according to
    test path arguments (`-p testpath` and `-s testpath`) as parsed by
    [glib.global.testInit]. See the [glib.global.testRun] documentation for more
    information on the order that tests are run in.
    
    [glib.global.testRunSuite] or [glib.global.testRun] may only be called once
    in a program.

    Params:
      suite = a #GTestSuite
    Returns: 0 on success
*/
int testRunSuite(glib.test_suite.TestSuite suite)
{
  int _retval;
  _retval = g_test_run_suite(suite ? cast(GTestSuite*)suite._cPtr : null);
  return _retval;
}

/**
    Changes the behaviour of the various `g_assert_*()` macros,
    g_test_assert_expected_messages() and the various
    `g_test_trap_assert_*()` macros to not abort to program, but instead
    call [glib.global.testFail] and continue. (This also changes the behavior of
    [glib.global.testFail] so that it will not cause the test program to abort
    after completing the failed test.)
    
    Note that the g_assert_not_reached() and g_assert() macros are not
    affected by this.
    
    This function can only be called after [glib.global.testInit].
*/
void testSetNonfatalAssertions()
{
  g_test_set_nonfatal_assertions();
}

/**
    Indicates that a test was skipped.
    
    Calling this function will not stop the test from running, you
    need to return from the test function yourself. So you can
    produce additional diagnostic messages or even continue running
    the test.
    
    If not called from inside a test, this function does nothing.

    Params:
      msg = explanation
*/
void testSkip(string msg = null)
{
  const(char)* _msg = msg.toCString(No.Alloc);
  g_test_skip(_msg);
}

/**
    Returns true (after [glib.global.testInit] has been called) if the test
    program is running under [glib.global.testTrapSubprocess].
    Returns: true if the test program is running under
      [glib.global.testTrapSubprocess].
*/
bool testSubprocess()
{
  bool _retval;
  _retval = cast(bool)g_test_subprocess();
  return _retval;
}

/**
    Set the summary for a test, which describes what the test checks, and how it
    goes about checking it. This may be included in test report output, and is
    useful documentation for anyone reading the source code or modifying a test
    in future. It must be a single line.
    
    This should be called at the top of a test function.
    
    For example:
    ```c
    static void
    test_array_sort (void)
    {
      g_test_summary ("Test my_array_sort() sorts the array correctly and stably, "
                      "including testing zero length and one-element arrays.");
    
      …
    }
    ```

    Params:
      summary = One or two sentences summarising what the test checks, and how it
           checks it.

    Version: See also: g_test_bug()
*/
void testSummary(string summary)
{
  const(char)* _summary = summary.toCString(No.Alloc);
  g_test_summary(_summary);
}

/**
    Get the number of seconds since the last start of the timer with
    [glib.global.testTimerStart].
    Returns: the time since the last start of the timer in seconds, as a double
*/
double testTimerElapsed()
{
  double _retval;
  _retval = g_test_timer_elapsed();
  return _retval;
}

/**
    Report the last result of [glib.global.testTimerElapsed].
    Returns: the last result of [glib.global.testTimerElapsed], as a double
*/
double testTimerLast()
{
  double _retval;
  _retval = g_test_timer_last();
  return _retval;
}

/**
    Start a timing test. Call [glib.global.testTimerElapsed] when the task is supposed
    to be done. Call this function again to restart the timer.
*/
void testTimerStart()
{
  g_test_timer_start();
}

/** */
void testTrapAssertions(string domain, string file, int line, string func, ulong assertionFlags, string pattern)
{
  const(char)* _domain = domain.toCString(No.Alloc);
  const(char)* _file = file.toCString(No.Alloc);
  const(char)* _func = func.toCString(No.Alloc);
  const(char)* _pattern = pattern.toCString(No.Alloc);
  g_test_trap_assertions(_domain, _file, line, _func, assertionFlags, _pattern);
}

/**
    Fork the current test program to execute a test case that might
    not return or that might abort.
    
    If usec_timeout is non-0, the forked test case is aborted and
    considered failing if its run time exceeds it.
    
    The forking behavior can be configured with the #GTestTrapFlags flags.
    
    In the following example, the test code forks, the forked child
    process produces some sample output and exits successfully.
    The forking parent process then asserts successful child program
    termination and validates child program outputs.
    
    ```c
      static void
      test_fork_patterns (void)
      {
        if (g_test_trap_fork (0, G_TEST_TRAP_SILENCE_STDOUT | G_TEST_TRAP_SILENCE_STDERR))
          {
            g_print ("some stdout text: somagic17\n");
            g_printerr ("some stderr text: semagic43\n");
            exit (0); // successful test run
          }
        g_test_trap_assert_passed ();
        g_test_trap_assert_stdout ("*somagic17*");
        g_test_trap_assert_stderr ("*semagic43*");
      }
    ```

    Params:
      usecTimeout = Timeout for the forked test in micro seconds.
      testTrapFlags = Flags to modify forking behaviour.
    Returns: true for the forked child and false for the executing parent process.

    Deprecated: This function is implemented only on Unix platforms,
      is not always reliable due to problems inherent in fork-without-exec
      and doesn't set close-on-exec flag on its file descriptors.
      Use [glib.global.testTrapSubprocess] instead.
*/
bool testTrapFork(ulong usecTimeout, glib.types.TestTrapFlags testTrapFlags)
{
  bool _retval;
  _retval = cast(bool)g_test_trap_fork(usecTimeout, testTrapFlags);
  return _retval;
}

/**
    Check the result of the last [glib.global.testTrapSubprocess] call.
    Returns: true if the last test subprocess terminated successfully.
*/
bool testTrapHasPassed()
{
  bool _retval;
  _retval = cast(bool)g_test_trap_has_passed();
  return _retval;
}

/**
    Check the result of the last [glib.global.testTrapSubprocess] call.
    Returns: true if the last test subprocess got killed due to a timeout.
*/
bool testTrapReachedTimeout()
{
  bool _retval;
  _retval = cast(bool)g_test_trap_reached_timeout();
  return _retval;
}

/**
    Respawns the test program to run only test_path in a subprocess.
    
    This is equivalent to calling [glib.global.testTrapSubprocessWithEnvp] with `envp`
    set to null. See the documentation for that function for full details.

    Params:
      testPath = Test to run in a subprocess
      usecTimeout = Timeout for the subprocess test in micro seconds.
      testFlags = Flags to modify subprocess behaviour.
*/
void testTrapSubprocess(string testPath, ulong usecTimeout, glib.types.TestSubprocessFlags testFlags)
{
  const(char)* _testPath = testPath.toCString(No.Alloc);
  g_test_trap_subprocess(_testPath, usecTimeout, testFlags);
}

/**
    Respawns the test program to run only test_path in a subprocess with the
    given envp environment.
    
    This can be used for a test case that might not return, or that
    might abort.
    
    If test_path is null then the same test is re-run in a subprocess.
    You can use [glib.global.testSubprocess] to determine whether the test is in
    a subprocess or not.
    
    test_path can also be the name of the parent test, followed by
    "`/subprocess/`" and then a name for the specific subtest (or just
    ending with "`/subprocess`" if the test only has one child test);
    tests with names of this form will automatically be skipped in the
    parent process.
    
    If envp is null, the parent process’ environment will be inherited.
    
    If usec_timeout is non-0, the test subprocess is aborted and
    considered failing if its run time exceeds it.
    
    The subprocess behavior can be configured with the
    #GTestSubprocessFlags flags.
    
    You can use methods such as g_test_trap_assert_passed(),
    g_test_trap_assert_failed(), and g_test_trap_assert_stderr() to
    check the results of the subprocess. (But note that
    g_test_trap_assert_stdout() and g_test_trap_assert_stderr()
    cannot be used if test_flags specifies that the child should
    inherit the parent stdout/stderr.)
    
    If your `main ()` needs to behave differently in
    the subprocess, you can call [glib.global.testSubprocess] (after calling
    [glib.global.testInit]) to see whether you are in a subprocess.
    
    Internally, this function tracks the child process using
    [glib.global.childWatchSourceNew], so your process must not ignore `SIGCHLD`, and
    must not attempt to watch or wait for the child process via another
    mechanism.
    
    The following example tests that calling
    `my_object_new(1000000)` will abort with an error
    message.
    
    ```c
      static void
      test_create_large_object (void)
      {
        if (g_test_subprocess ())
          {
            my_object_new (1000000);
            return;
          }
    
        // Reruns this same test in a subprocess
        g_test_trap_subprocess (NULL, 0, G_TEST_SUBPROCESS_DEFAULT);
        g_test_trap_assert_failed ();
        g_test_trap_assert_stderr ("*ERROR*too large*");
      }
    
      static void
      test_different_username (void)
      {
        if (g_test_subprocess ())
          {
            // Code under test goes here
            g_message ("Username is now simulated as %s", g_getenv ("USER"));
            return;
          }
    
        // Reruns this same test in a subprocess
        g_autoptr(GStrv) envp = g_get_environ ();
        envp = g_environ_setenv (g_steal_pointer (&envp), "USER", "charlie", TRUE);
        g_test_trap_subprocess_with_envp (NULL, envp, 0, G_TEST_SUBPROCESS_DEFAULT);
        g_test_trap_assert_passed ();
        g_test_trap_assert_stdout ("Username is now simulated as charlie");
      }
    
      int
      main (int argc, char **argv)
      {
        g_test_init (&argc, &argv, NULL);
    
        g_test_add_func ("/myobject/create-large-object",
                         test_create_large_object);
        g_test_add_func ("/myobject/different-username",
                         test_different_username);
        return g_test_run ();
      }
    ```

    Params:
      testPath = Test to run in a subprocess
      envp = Environment
          to run the test in, or null to inherit the parent’s environment. This must
          be in the GLib filename encoding.
      usecTimeout = Timeout for the subprocess test in micro seconds.
      testFlags = Flags to modify subprocess behaviour.
*/
void testTrapSubprocessWithEnvp(string testPath, string[] envp, ulong usecTimeout, glib.types.TestSubprocessFlags testFlags)
{
  const(char)* _testPath = testPath.toCString(No.Alloc);
  const(char)*[] _tmpenvp;
  foreach (s; envp)
    _tmpenvp ~= s.toCString(No.Alloc);
  _tmpenvp ~= null;
  const(char*)* _envp = _tmpenvp.ptr;

  g_test_trap_subprocess_with_envp(_testPath, _envp, usecTimeout, testFlags);
}

/**
    Sets a function to be called at regular intervals, with the given
    priority.  The function is called repeatedly until it returns
    false, at which point the timeout is automatically destroyed and
    the function will not be called again.  The notify function is
    called when the timeout is destroyed.  The first call to the
    function will be at the end of the first interval.
    
    Note that timeout functions may be delayed, due to the processing of other
    event sources. Thus they should not be relied on for precise timing.
    After each call to the timeout function, the time of the next
    timeout is recalculated based on the current time and the given interval
    (it does not try to 'catch up' time lost in delays).
    
    See [memory management of sources][mainloop-memory-management] for details
    on how to handle the return value and memory management of data.
    
    This internally creates a main loop source using [glib.global.timeoutSourceNew]
    and attaches it to the global #GMainContext using [glib.source.Source.attach], so
    the callback will be invoked in whichever thread is running that main
    context. You can do these steps manually if you need greater control or to
    use a custom main context.
    
    The interval given is in terms of monotonic time, not wall clock time.
    See [glib.global.getMonotonicTime].

    Params:
      priority = the priority of the timeout source. Typically this will be in
          the range between [glib.types.PRIORITY_DEFAULT] and [glib.types.PRIORITY_HIGH].
      interval = the time between calls to the function, in milliseconds
          (1/1000ths of a second)
      function_ = function to call
    Returns: the ID (greater than 0) of the event source.
*/
uint timeoutAdd(int priority, uint interval, glib.types.SourceFunc function_)
{
  extern(C) gboolean _function_Callback(void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    _dretval = (*_dlg)();
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = g_timeout_add_full(priority, interval, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    Sets a function to be called at regular intervals, with priority.
    
    The function is called repeatedly until it returns [glib.types.SOURCE_REMOVE]
    or false, at which point the timeout is automatically destroyed and
    the function will not be called again.
    
    Unlike [glib.global.timeoutAdd], this function operates at whole second granularity.
    The initial starting point of the timer is determined by the implementation
    and the implementation is expected to group multiple timers together so that
    they fire all at the same time. To allow this grouping, the interval to the
    first timer is rounded and can deviate up to one second from the specified
    interval. Subsequent timer iterations will generally run at the specified
    interval.
    
    Note that timeout functions may be delayed, due to the processing of other
    event sources. Thus they should not be relied on for precise timing.
    After each call to the timeout function, the time of the next
    timeout is recalculated based on the current time and the given interval
    
    See [memory management of sources][mainloop-memory-management] for details
    on how to handle the return value and memory management of data.
    
    If you want timing more precise than whole seconds, use [glib.global.timeoutAdd]
    instead.
    
    The grouping of timers to fire at the same time results in a more power
    and CPU efficient behavior so if your timer is in multiples of seconds
    and you don't require the first timer exactly one second from now, the
    use of [glib.global.timeoutAddSeconds] is preferred over [glib.global.timeoutAdd].
    
    This internally creates a main loop source using
    [glib.global.timeoutSourceNewSeconds] and attaches it to the main loop context
    using [glib.source.Source.attach]. You can do these steps manually if you need
    greater control.
    
    It is safe to call this function from any thread.
    
    The interval given is in terms of monotonic time, not wall clock
    time.  See [glib.global.getMonotonicTime].

    Params:
      priority = the priority of the timeout source. Typically this will be in
          the range between [glib.types.PRIORITY_DEFAULT] and [glib.types.PRIORITY_HIGH].
      interval = the time between calls to the function, in seconds
      function_ = function to call
    Returns: the ID (greater than 0) of the event source.
*/
uint timeoutAddSeconds(int priority, uint interval, glib.types.SourceFunc function_)
{
  extern(C) gboolean _function_Callback(void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    _dretval = (*_dlg)();
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = g_timeout_add_seconds_full(priority, interval, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    Creates a new timeout source.
    
    The source will not initially be associated with any #GMainContext
    and must be added to one with [glib.source.Source.attach] before it will be
    executed.
    
    The interval given is in terms of monotonic time, not wall clock
    time.  See [glib.global.getMonotonicTime].

    Params:
      interval = the timeout interval in milliseconds.
    Returns: the newly-created timeout source
*/
glib.source.Source timeoutSourceNew(uint interval)
{
  GSource* _cretval;
  _cretval = g_timeout_source_new(interval);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Creates a new timeout source.
    
    The source will not initially be associated with any #GMainContext
    and must be added to one with [glib.source.Source.attach] before it will be
    executed.
    
    The scheduling granularity/accuracy of this timeout source will be
    in seconds.
    
    The interval given is in terms of monotonic time, not wall clock time.
    See [glib.global.getMonotonicTime].

    Params:
      interval = the timeout interval in seconds
    Returns: the newly-created timeout source
*/
glib.source.Source timeoutSourceNewSeconds(uint interval)
{
  GSource* _cretval;
  _cretval = g_timeout_source_new_seconds(interval);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Attempts to allocate n_bytes, and returns null on failure.
    Contrast with [glib.global.gmalloc], which aborts the program on failure.

    Params:
      nBytes = number of bytes to allocate.
    Returns: the allocated memory, or null.
*/
void* tryMalloc(size_t nBytes)
{
  auto _retval = g_try_malloc(nBytes);
  return _retval;
}

/**
    Attempts to allocate n_bytes, initialized to 0's, and returns null on
    failure. Contrast with [glib.global.malloc0], which aborts the program on failure.

    Params:
      nBytes = number of bytes to allocate
    Returns: the allocated memory, or null
*/
void* tryMalloc0(size_t nBytes)
{
  auto _retval = g_try_malloc0(nBytes);
  return _retval;
}

/**
    This function is similar to [glib.global.tryMalloc0], allocating (n_blocks * n_block_bytes) bytes,
    but care is taken to detect possible overflow during multiplication.

    Params:
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
    Returns: the allocated memory, or null
*/
void* tryMalloc0N(size_t nBlocks, size_t nBlockBytes)
{
  auto _retval = g_try_malloc0_n(nBlocks, nBlockBytes);
  return _retval;
}

/**
    This function is similar to [glib.global.tryMalloc], allocating (n_blocks * n_block_bytes) bytes,
    but care is taken to detect possible overflow during multiplication.

    Params:
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
    Returns: the allocated memory, or null.
*/
void* tryMallocN(size_t nBlocks, size_t nBlockBytes)
{
  auto _retval = g_try_malloc_n(nBlocks, nBlockBytes);
  return _retval;
}

/**
    Attempts to realloc mem to a new size, n_bytes, and returns null
    on failure. Contrast with [glib.global.realloc], which aborts the program
    on failure.
    
    If mem is null, behaves the same as [glib.global.tryMalloc].

    Params:
      mem = previously-allocated memory, or null.
      nBytes = number of bytes to allocate.
    Returns: the allocated memory, or null.
*/
void* tryRealloc(void* mem, size_t nBytes)
{
  auto _retval = g_try_realloc(mem, nBytes);
  return _retval;
}

/**
    This function is similar to [glib.global.tryRealloc], allocating (n_blocks * n_block_bytes) bytes,
    but care is taken to detect possible overflow during multiplication.

    Params:
      mem = previously-allocated memory, or null.
      nBlocks = the number of blocks to allocate
      nBlockBytes = the size of each block in bytes
    Returns: the allocated memory, or null.
*/
void* tryReallocN(void* mem, size_t nBlocks, size_t nBlockBytes)
{
  auto _retval = g_try_realloc_n(mem, nBlocks, nBlockBytes);
  return _retval;
}

/**
    Convert a string from UCS-4 to UTF-16. A 0 character will be
    added to the result after the converted text.

    Params:
      str = a UCS-4 encoded string
      itemsRead = location to store number of
            bytes read, or null. If an error occurs then the index of the invalid
            input is stored here.
      itemsWritten = location to store number
            of #gunichar2  written, or null. The value stored here does not include
            the trailing 0.
    Returns: a pointer to a newly allocated UTF-16 string.
          This value must be freed with [glib.global.gfree]. If an error occurs,
          null will be returned and error set.
    Throws: [ErrorWrap]
*/
ushort[] ucs4ToUtf16(dchar[] str, out glong itemsRead, out glong itemsWritten)
{
  ushort* _cretval;
  glong _len;
  if (str)
    _len = cast(glong)str.length;

  auto _str = cast(const(dchar)*)str.ptr;
  GError *_err;
  _cretval = g_ucs4_to_utf16(_str, _len, cast(glong*)&itemsRead, cast(glong*)&itemsWritten, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  ushort[] _retval;

  if (_cretval)
  {
    uint _cretlength;
    while (_cretval[_cretlength] != 0)
      _cretlength++;
    _retval = cast(ushort[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Convert a string from a 32-bit fixed width representation as UCS-4.
    to UTF-8. The result will be terminated with a 0 byte.

    Params:
      str = a UCS-4 encoded string
      itemsRead = location to store number of
            characters read, or null.
      itemsWritten = location to store number
            of bytes written or null. The value here stored does not include the
            trailing 0 byte.
    Returns: a pointer to a newly allocated UTF-8 string.
          This value must be freed with [glib.global.gfree]. If an error occurs,
          null will be returned and error set. In that case, items_read
          will be set to the position of the first invalid input character.
    Throws: [ErrorWrap]
*/
string ucs4ToUtf8(dchar[] str, out glong itemsRead, out glong itemsWritten)
{
  char* _cretval;
  glong _len;
  if (str)
    _len = cast(glong)str.length;

  auto _str = cast(const(dchar)*)str.ptr;
  GError *_err;
  _cretval = g_ucs4_to_utf8(_str, _len, cast(glong*)&itemsRead, cast(glong*)&itemsWritten, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Determines the break type of `c`. `c` should be a Unicode character
    (to derive a character from UTF-8 encoded text, use
    [glib.global.utf8GetChar]). The break type is used to find word and line
    breaks ("text boundaries"), Pango implements the Unicode boundary
    resolution algorithms and normally you would use a function such
    as [pango.global.break_] instead of caring about break types yourself.

    Params:
      c = a Unicode character
    Returns: the break type of `c`
*/
glib.types.UnicodeBreakType unicharBreakType(dchar c)
{
  GUnicodeBreakType _cretval;
  _cretval = g_unichar_break_type(c);
  glib.types.UnicodeBreakType _retval = cast(glib.types.UnicodeBreakType)_cretval;
  return _retval;
}

/**
    Determines the canonical combining class of a Unicode character.

    Params:
      uc = a Unicode character
    Returns: the combining class of the character
*/
int unicharCombiningClass(dchar uc)
{
  int _retval;
  _retval = g_unichar_combining_class(uc);
  return _retval;
}

/**
    Performs a single composition step of the
    Unicode canonical composition algorithm.
    
    This function includes algorithmic Hangul Jamo composition,
    but it is not exactly the inverse of [glib.global.unicharDecompose].
    No composition can have either of `a` or `b` equal to zero.
    To be precise, this function composes if and only if
    there exists a Primary Composite P which is canonically
    equivalent to the sequence <`a`,`b`>.  See the Unicode
    Standard for the definition of Primary Composite.
    
    If `a` and `b` do not compose a new character, ch is set to zero.
    
    See
    [UAX#15](http://unicode.org/reports/tr15/)
    for details.

    Params:
      a = a Unicode character
      b = a Unicode character
      ch = return location for the composed character
    Returns: true if the characters could be composed
*/
bool unicharCompose(dchar a, dchar b, out dchar ch)
{
  bool _retval;
  _retval = cast(bool)g_unichar_compose(a, b, cast(dchar*)&ch);
  return _retval;
}

/**
    Performs a single decomposition step of the
    Unicode canonical decomposition algorithm.
    
    This function does not include compatibility
    decompositions. It does, however, include algorithmic
    Hangul Jamo decomposition, as well as 'singleton'
    decompositions which replace a character by a single
    other character. In the case of singletons *`b` will
    be set to zero.
    
    If ch is not decomposable, *`a` is set to ch and *`b`
    is set to zero.
    
    Note that the way Unicode decomposition pairs are
    defined, it is guaranteed that `b` would not decompose
    further, but `a` may itself decompose.  To get the full
    canonical decomposition for ch, one would need to
    recursively call this function on `a`.  Or use
    [glib.global.unicharFullyDecompose].
    
    See
    [UAX#15](http://unicode.org/reports/tr15/)
    for details.

    Params:
      ch = a Unicode character
      a = return location for the first component of ch
      b = return location for the second component of ch
    Returns: true if the character could be decomposed
*/
bool unicharDecompose(dchar ch, out dchar a, out dchar b)
{
  bool _retval;
  _retval = cast(bool)g_unichar_decompose(ch, cast(dchar*)&a, cast(dchar*)&b);
  return _retval;
}

/**
    Determines the numeric value of a character as a decimal
    digit.

    Params:
      c = a Unicode character
    Returns: If `c` is a decimal digit (according to
      [glib.global.unicharIsdigit]), its numeric value. Otherwise, -1.
*/
int unicharDigitValue(dchar c)
{
  int _retval;
  _retval = g_unichar_digit_value(c);
  return _retval;
}

/**
    Computes the canonical or compatibility decomposition of a
    Unicode character.  For compatibility decomposition,
    pass true for compat; for canonical decomposition
    pass false for compat.
    
    The decomposed sequence is placed in result.  Only up to
    result_len characters are written into result.  The length
    of the full decomposition (irrespective of result_len) is
    returned by the function.  For canonical decomposition,
    currently all decompositions are of length at most 4, but
    this may change in the future (very unlikely though).
    At any rate, Unicode does guarantee that a buffer of length
    18 is always enough for both compatibility and canonical
    decompositions, so that is the size recommended. This is provided
    as [glib.types.UNICHAR_MAX_DECOMPOSITION_LENGTH].
    
    See
    [UAX#15](http://unicode.org/reports/tr15/)
    for details.

    Params:
      ch = a Unicode character.
      compat = whether perform canonical or compatibility decomposition
      result = location to store decomposed result, or null
      resultLen = length of result
    Returns: the length of the full decomposition.
*/
size_t unicharFullyDecompose(dchar ch, bool compat, out dchar result, size_t resultLen)
{
  size_t _retval;
  _retval = g_unichar_fully_decompose(ch, compat, cast(dchar*)&result, resultLen);
  return _retval;
}

/**
    In Unicode, some characters are "mirrored". This means that their
    images are mirrored horizontally in text that is laid out from right
    to left. For instance, "(" would become its mirror image, ")", in
    right-to-left text.
    
    If ch has the Unicode mirrored property and there is another unicode
    character that typically has a glyph that is the mirror image of ch's
    glyph and mirrored_ch is set, it puts that character in the address
    pointed to by mirrored_ch.  Otherwise the original character is put.

    Params:
      ch = a Unicode character
      mirroredCh = location to store the mirrored character
    Returns: true if ch has a mirrored character, false otherwise
*/
bool unicharGetMirrorChar(dchar ch, out dchar mirroredCh)
{
  bool _retval;
  _retval = cast(bool)g_unichar_get_mirror_char(ch, cast(dchar*)&mirroredCh);
  return _retval;
}

/**
    Looks up the #GUnicodeScript for a particular character (as defined
    by Unicode Standard Annex \#24). No check is made for ch being a
    valid Unicode character; if you pass in invalid character, the
    result is undefined.
    
    This function is equivalent to [pango.global.scriptForUnichar] and the
    two are interchangeable.

    Params:
      ch = a Unicode character
    Returns: the #GUnicodeScript for the character.
*/
glib.types.UnicodeScript unicharGetScript(dchar ch)
{
  GUnicodeScript _cretval;
  _cretval = g_unichar_get_script(ch);
  glib.types.UnicodeScript _retval = cast(glib.types.UnicodeScript)_cretval;
  return _retval;
}

/**
    Determines whether a character is alphanumeric.
    Given some UTF-8 text, obtain a character value
    with [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is an alphanumeric character
*/
bool unicharIsalnum(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isalnum(c);
  return _retval;
}

/**
    Determines whether a character is alphabetic (i.e. a letter).
    Given some UTF-8 text, obtain a character value with
    [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is an alphabetic character
*/
bool unicharIsalpha(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isalpha(c);
  return _retval;
}

/**
    Determines whether a character is a control character.
    Given some UTF-8 text, obtain a character value with
    [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is a control character
*/
bool unicharIscntrl(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_iscntrl(c);
  return _retval;
}

/**
    Determines if a given character is assigned in the Unicode
    standard.

    Params:
      c = a Unicode character
    Returns: true if the character has an assigned value
*/
bool unicharIsdefined(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isdefined(c);
  return _retval;
}

/**
    Determines whether a character is numeric (i.e. a digit).  This
    covers ASCII 0-9 and also digits in other languages/scripts.  Given
    some UTF-8 text, obtain a character value with [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is a digit
*/
bool unicharIsdigit(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isdigit(c);
  return _retval;
}

/**
    Determines whether a character is printable and not a space
    (returns false for control characters, format characters, and
    spaces). [glib.global.unicharIsprint] is similar, but returns true for
    spaces. Given some UTF-8 text, obtain a character value with
    [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is printable unless it's a space
*/
bool unicharIsgraph(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isgraph(c);
  return _retval;
}

/**
    Determines whether a character is a lowercase letter.
    Given some UTF-8 text, obtain a character value with
    [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is a lowercase letter
*/
bool unicharIslower(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_islower(c);
  return _retval;
}

/**
    Determines whether a character is a mark (non-spacing mark,
    combining mark, or enclosing mark in Unicode speak).
    Given some UTF-8 text, obtain a character value
    with [glib.global.utf8GetChar].
    
    Note: in most cases where isalpha characters are allowed,
    ismark characters should be allowed to as they are essential
    for writing most European languages as well as many non-Latin
    scripts.

    Params:
      c = a Unicode character
    Returns: true if `c` is a mark character
*/
bool unicharIsmark(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_ismark(c);
  return _retval;
}

/**
    Determines whether a character is printable.
    Unlike [glib.global.unicharIsgraph], returns true for spaces.
    Given some UTF-8 text, obtain a character value with
    [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is printable
*/
bool unicharIsprint(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isprint(c);
  return _retval;
}

/**
    Determines whether a character is punctuation or a symbol.
    Given some UTF-8 text, obtain a character value with
    [glib.global.utf8GetChar].

    Params:
      c = a Unicode character
    Returns: true if `c` is a punctuation or symbol character
*/
bool unicharIspunct(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_ispunct(c);
  return _retval;
}

/**
    Determines whether a character is a space, tab, or line separator
    (newline, carriage return, etc.).  Given some UTF-8 text, obtain a
    character value with [glib.global.utf8GetChar].
    
    (Note: don't use this to do word breaking; you have to use
    Pango or equivalent to get word breaking right, the algorithm
    is fairly complex.)

    Params:
      c = a Unicode character
    Returns: true if `c` is a space character
*/
bool unicharIsspace(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isspace(c);
  return _retval;
}

/**
    Determines if a character is titlecase. Some characters in
    Unicode which are composites, such as the DZ digraph
    have three case variants instead of just two. The titlecase
    form is used at the beginning of a word where only the
    first letter is capitalized. The titlecase form of the DZ
    digraph is U+01F2 LATIN CAPITAL LETTTER D WITH SMALL LETTER Z.

    Params:
      c = a Unicode character
    Returns: true if the character is titlecase
*/
bool unicharIstitle(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_istitle(c);
  return _retval;
}

/**
    Determines if a character is uppercase.

    Params:
      c = a Unicode character
    Returns: true if `c` is an uppercase character
*/
bool unicharIsupper(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isupper(c);
  return _retval;
}

/**
    Determines if a character is typically rendered in a double-width
    cell.

    Params:
      c = a Unicode character
    Returns: true if the character is wide
*/
bool unicharIswide(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_iswide(c);
  return _retval;
}

/**
    Determines if a character is typically rendered in a double-width
    cell under legacy East Asian locales.  If a character is wide according to
    [glib.global.unicharIswide], then it is also reported wide with this function, but
    the converse is not necessarily true. See the
    [Unicode Standard Annex #11](http://www.unicode.org/reports/tr11/)
    for details.
    
    If a character passes the [glib.global.unicharIswide] test then it will also pass
    this test, but not the other way around.  Note that some characters may
    pass both this test and [glib.global.unicharIszerowidth].

    Params:
      c = a Unicode character
    Returns: true if the character is wide in legacy East Asian locales
*/
bool unicharIswideCjk(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_iswide_cjk(c);
  return _retval;
}

/**
    Determines if a character is a hexadecimal digit.

    Params:
      c = a Unicode character.
    Returns: true if the character is a hexadecimal digit
*/
bool unicharIsxdigit(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_isxdigit(c);
  return _retval;
}

/**
    Determines if a given character typically takes zero width when rendered.
    The return value is true for all non-spacing and enclosing marks
    (e.g., combining accents), format characters, zero-width
    space, but not U+00AD SOFT HYPHEN.
    
    A typical use of this function is with one of [glib.global.unicharIswide] or
    [glib.global.unicharIswideCjk] to determine the number of cells a string occupies
    when displayed on a grid display (terminals).  However, note that not all
    terminals support zero-width rendering of zero-width marks.

    Params:
      c = a Unicode character
    Returns: true if the character has zero width
*/
bool unicharIszerowidth(dchar c)
{
  bool _retval;
  _retval = cast(bool)g_unichar_iszerowidth(c);
  return _retval;
}

/**
    Converts a character to lower case.

    Params:
      c = a Unicode character.
    Returns: the result of converting `c` to lower case.
                    If `c` is not an upperlower or titlecase character,
                    or has no lowercase equivalent `c` is returned unchanged.
*/
dchar unicharTolower(dchar c)
{
  dchar _retval;
  _retval = g_unichar_tolower(c);
  return _retval;
}

/**
    Converts a character to the titlecase.

    Params:
      c = a Unicode character
    Returns: the result of converting `c` to titlecase.
                    If `c` is not an uppercase or lowercase character,
                    `c` is returned unchanged.
*/
dchar unicharTotitle(dchar c)
{
  dchar _retval;
  _retval = g_unichar_totitle(c);
  return _retval;
}

/**
    Converts a character to uppercase.

    Params:
      c = a Unicode character
    Returns: the result of converting `c` to uppercase.
                    If `c` is not a lowercase or titlecase character,
                    or has no upper case equivalent `c` is returned unchanged.
*/
dchar unicharToupper(dchar c)
{
  dchar _retval;
  _retval = g_unichar_toupper(c);
  return _retval;
}

/**
    Classifies a Unicode character by type.

    Params:
      c = a Unicode character
    Returns: the type of the character.
*/
glib.types.UnicodeType unicharType(dchar c)
{
  GUnicodeType _cretval;
  _cretval = g_unichar_type(c);
  glib.types.UnicodeType _retval = cast(glib.types.UnicodeType)_cretval;
  return _retval;
}

/**
    Checks whether ch is a valid Unicode character. Some possible
    integer values of ch will not be valid. 0 is considered a valid
    character, though it's normally a string terminator.

    Params:
      ch = a Unicode character
    Returns: true if ch is a valid Unicode character
*/
bool unicharValidate(dchar ch)
{
  bool _retval;
  _retval = cast(bool)g_unichar_validate(ch);
  return _retval;
}

/**
    Determines the numeric value of a character as a hexadecimal
    digit.

    Params:
      c = a Unicode character
    Returns: If `c` is a hex digit (according to
      [glib.global.unicharIsxdigit]), its numeric value. Otherwise, -1.
*/
int unicharXdigitValue(dchar c)
{
  int _retval;
  _retval = g_unichar_xdigit_value(c);
  return _retval;
}

/**
    Computes the canonical decomposition of a Unicode character.

    Params:
      ch = a Unicode character.
    Returns: a newly allocated string of Unicode characters.
        result_len is set to the resulting length of the string.

    Deprecated: Use the more flexible [glib.global.unicharFullyDecompose]
        instead.
*/
dchar[] unicodeCanonicalDecomposition(dchar ch)
{
  dchar* _cretval;
  size_t _cretlength;
  _cretval = g_unicode_canonical_decomposition(ch, &_cretlength);
  dchar[] _retval;

  if (_cretval)
  {
    _retval = cast(dchar[])_cretval[0 .. _cretlength].dup;
  }
  return _retval;
}

/**
    Computes the canonical ordering of a string in-place.
    This rearranges decomposed characters in the string
    according to their combining classes.  See the Unicode
    manual for more information.

    Params:
      string_ = a UCS-4 encoded string.
*/
void unicodeCanonicalOrdering(dchar[] string_)
{
  size_t _len;
  if (string_)
    _len = cast(size_t)string_.length;

  auto _string_ = cast(dchar*)string_.ptr;
  g_unicode_canonical_ordering(_string_, _len);
}

/** */
glib.types.Quark unixErrorQuark()
{
  glib.types.Quark _retval;
  _retval = g_unix_error_quark();
  return _retval;
}

/**
    Sets a function to be called when the IO condition, as specified by
    condition becomes true for fd.
    
    This is the same as [glib.global.unixFdAdd], except that it allows you to
    specify a non-default priority and a provide a #GDestroyNotify for
    user_data.

    Params:
      priority = the priority of the source
      fd = a file descriptor
      condition = IO conditions to watch for on fd
      function_ = a #GUnixFDSourceFunc
    Returns: the ID (greater than 0) of the event source
*/
uint unixFdAddFull(int priority, int fd, glib.types.IOCondition condition, glib.types.UnixFDSourceFunc function_)
{
  extern(C) gboolean _function_Callback(int fd, GIOCondition condition, void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.UnixFDSourceFunc*)userData;

    _dretval = (*_dlg)(fd, condition);
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _function_CB = function_ ? &_function_Callback : null;
  uint _retval;
  auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
  GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
  _retval = g_unix_fd_add_full(priority, fd, condition, _function_CB, _function_, _function_DestroyCB);
  return _retval;
}

/**
    Creates a #GSource to watch for a particular I/O condition on a file
    descriptor.
    
    The source will never close the fd — you must do it yourself.
    
    Any callback attached to the returned #GSource must have type
    #GUnixFDSourceFunc.

    Params:
      fd = a file descriptor
      condition = I/O conditions to watch for on fd
    Returns: the newly created #GSource
*/
glib.source.Source unixFdSourceNew(int fd, glib.types.IOCondition condition)
{
  GSource* _cretval;
  _cretval = g_unix_fd_source_new(fd, condition);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    Get the `passwd` file entry for the given user_name using `getpwnam_r()`.
    This can fail if the given user_name doesn’t exist.
    
    The returned `struct passwd` has been allocated using [glib.global.gmalloc] and should
    be freed using [glib.global.gfree]. The strings referenced by the returned struct are
    included in the same allocation, so are valid until the `struct passwd` is
    freed.
    
    This function is safe to call from multiple threads concurrently.
    
    You will need to include `pwd.h` to get the definition of `struct passwd`.

    Params:
      userName = the username to get the passwd file entry for
    Returns: passwd entry, or null on error; free the returned
         value with [glib.global.gfree]
    Throws: [ErrorWrap]
*/
void* unixGetPasswdEntry(string userName)
{
  const(char)* _userName = userName.toCString(No.Alloc);
  GError *_err;
  auto _retval = g_unix_get_passwd_entry(_userName, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Similar to the UNIX pipe() call, but on modern systems like Linux
    uses the pipe2() system call, which atomically creates a pipe with
    the configured flags.
    
    As of GLib 2.78, the supported flags are `O_CLOEXEC`/`FD_CLOEXEC` (see below)
    and `O_NONBLOCK`. Prior to GLib 2.78, only `FD_CLOEXEC` was supported — if
    you wanted to configure `O_NONBLOCK` then that had to be done separately with
    `fcntl()`.
    
    Since GLib 2.80, the constants `G_UNIX_PIPE_END_READ` and
    `G_UNIX_PIPE_END_WRITE` can be used as mnemonic indexes in fds.
    
    It is a programmer error to call this function with unsupported flags, and a
    critical warning will be raised.
    
    As of GLib 2.78, it is preferred to pass `O_CLOEXEC` in, rather than
    `FD_CLOEXEC`, as that matches the underlying `pipe()` API more closely. Prior
    to 2.78, only `FD_CLOEXEC` was supported. Support for `FD_CLOEXEC` may be
    deprecated and removed in future.

    Params:
      fds = Array of two integers
      flags = Bitfield of file descriptor flags, as for fcntl()
    Returns: true on success, false if not (and errno will be set).
    Throws: [ErrorWrap]
*/
bool unixOpenPipe(int[] fds, int flags)
{
  bool _retval;
  assert(!fds || fds.length == 2);
  auto _fds = cast(int*)fds.ptr;
  GError *_err;
  _retval = cast(bool)g_unix_open_pipe(_fds, flags, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    Control the non-blocking state of the given file descriptor,
    according to nonblock. On most systems this uses `O_NONBLOCK`, but
    on some older ones may use `O_NDELAY`.

    Params:
      fd = A file descriptor
      nonblock = If true, set the descriptor to be non-blocking
    Returns: true if successful
    Throws: [ErrorWrap]
*/
bool unixSetFdNonblocking(int fd, bool nonblock)
{
  bool _retval;
  GError *_err;
  _retval = cast(bool)g_unix_set_fd_nonblocking(fd, nonblock, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  return _retval;
}

/**
    A convenience function for [glib.global.unixSignalSourceNew], which
    attaches to the default #GMainContext.  You can remove the watch
    using [glib.source.Source.remove].

    Params:
      priority = the priority of the signal source. Typically this will be in
                   the range between [glib.types.PRIORITY_DEFAULT] and [glib.types.PRIORITY_HIGH].
      signum = Signal number
      handler = Callback
    Returns: An ID (greater than 0) for the event source
*/
uint unixSignalAdd(int priority, int signum, glib.types.SourceFunc handler)
{
  extern(C) gboolean _handlerCallback(void* userData)
  {
    bool _dretval;
    auto _dlg = cast(glib.types.SourceFunc*)userData;

    _dretval = (*_dlg)();
    auto _retval = cast(gboolean)_dretval;

    return _retval;
  }
  auto _handlerCB = handler ? &_handlerCallback : null;
  uint _retval;
  auto _handler = handler ? freezeDelegate(cast(void*)&handler) : null;
  GDestroyNotify _handlerDestroyCB = handler ? &thawDelegate : null;
  _retval = g_unix_signal_add_full(priority, signum, _handlerCB, _handler, _handlerDestroyCB);
  return _retval;
}

/**
    Create a #GSource that will be dispatched upon delivery of the UNIX
    signal signum.  In GLib versions before 2.36, only `SIGHUP`, `SIGINT`,
    `SIGTERM` can be monitored.  In GLib 2.36, `SIGUSR1` and `SIGUSR2`
    were added. In GLib 2.54, `SIGWINCH` was added.
    
    Note that unlike the UNIX default, all sources which have created a
    watch will be dispatched, regardless of which underlying thread
    invoked [glib.global.unixSignalSourceNew].
    
    For example, an effective use of this function is to handle `SIGTERM`
    cleanly; flushing any outstanding files, and then calling
    [glib.main_loop.MainLoop.quit].  It is not safe to do any of this from a regular
    UNIX signal handler; such a handler may be invoked while malloc() or
    another library function is running, causing reentrancy issues if the
    handler attempts to use those functions.  None of the GLib/GObject
    API is safe against this kind of reentrancy.
    
    The interaction of this source when combined with native UNIX
    functions like sigprocmask() is not defined.
    
    The source will not initially be associated with any #GMainContext
    and must be added to one with [glib.source.Source.attach] before it will be
    executed.

    Params:
      signum = A signal number
    Returns: A newly created #GSource
*/
glib.source.Source unixSignalSourceNew(int signum)
{
  GSource* _cretval;
  _cretval = g_unix_signal_source_new(signum);
  auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
  return _retval;
}

/**
    A wrapper for the POSIX unlink() function. The unlink() function
    deletes a name from the filesystem. If this was the last link to the
    file and no processes have it opened, the diskspace occupied by the
    file is freed.
    
    See your C library manual for more details about unlink(). Note
    that on Windows, it is in general not possible to delete files that
    are open to some process, or mapped into memory.

    Params:
      filename = a pathname in the GLib file name encoding
            (UTF-8 on Windows)
    Returns: 0 if the name was successfully deleted, -1 if an error
         occurred
*/
int unlink(string filename)
{
  int _retval;
  const(char)* _filename = filename.toCString(No.Alloc);
  _retval = g_unlink(_filename);
  return _retval;
}

/**
    Removes an environment variable from the environment.
    
    Note that on some systems, when variables are overwritten, the
    memory used for the previous variables and its value isn't reclaimed.
    
    You should be mindful of the fact that environment variable handling
    in UNIX is not thread-safe, and your program may crash if one thread
    calls [glib.global.unsetenv] while another thread is calling getenv(). (And note
    that many functions, such as gettext(), call getenv() internally.) This
    function is only safe to use at the very start of your program, before
    creating any other threads (or creating objects that create worker
    threads of their own).
    
    If you need to set up the environment for a child process, you can
    use [glib.global.getEnviron] to get an environment array, modify that with
    [glib.global.environSetenv] and [glib.global.environUnsetenv], and then pass that
    array directly to execvpe(), [glib.global.spawnAsync], or the like.

    Params:
      variable = the environment variable to remove, must
            not contain '='
*/
void unsetenv(string variable)
{
  const(char)* _variable = variable.toCString(No.Alloc);
  g_unsetenv(_variable);
}

/**
    Pauses the current thread for the given number of microseconds.
    
    There are 1 million microseconds per second (represented by the
    [glib.types.USEC_PER_SEC] macro). [glib.global.usleep] may have limited precision,
    depending on hardware and operating system; don't rely on the exact
    length of the sleep.

    Params:
      microseconds = number of microseconds to pause
*/
void usleep(gulong microseconds)
{
  g_usleep(microseconds);
}

/**
    Convert a string from UTF-16 to UCS-4. The result will be
    nul-terminated.

    Params:
      str = a UTF-16 encoded string
      itemsRead = location to store number of
            words read, or null. If null, then `G_CONVERT_ERROR_PARTIAL_INPUT` will
            be returned in case str contains a trailing partial character. If
            an error occurs then the index of the invalid input is stored here.
    Returns: a pointer to a newly allocated UCS-4 string.
          This value must be freed with [glib.global.gfree]. If an error occurs,
          null will be returned and error set.
    Throws: [ErrorWrap]
*/
dchar[] utf16ToUcs4(ushort[] str, out glong itemsRead)
{
  dchar* _cretval;
  glong _cretlength;
  glong _len;
  if (str)
    _len = cast(glong)str.length;

  auto _str = cast(const(ushort)*)str.ptr;
  GError *_err;
  _cretval = g_utf16_to_ucs4(_str, _len, cast(glong*)&itemsRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  dchar[] _retval;

  if (_cretval)
  {
    _retval = cast(dchar[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Convert a string from UTF-16 to UTF-8. The result will be
    terminated with a 0 byte.
    
    Note that the input is expected to be already in native endianness,
    an initial byte-order-mark character is not handled specially.
    [glib.global.convert] can be used to convert a byte buffer of UTF-16 data of
    ambiguous endianness.
    
    Further note that this function does not validate the result
    string; it may e.g. include embedded NUL characters. The only
    validation done by this function is to ensure that the input can
    be correctly interpreted as UTF-16, i.e. it doesn't contain
    unpaired surrogates or partial character sequences.

    Params:
      str = a UTF-16 encoded string
      itemsRead = location to store number of
            words read, or null. If null, then `G_CONVERT_ERROR_PARTIAL_INPUT` will
            be returned in case str contains a trailing partial character. If
            an error occurs then the index of the invalid input is stored here.
            It’s guaranteed to be non-negative.
      itemsWritten = location to store number
            of bytes written, or null. The value stored here does not include the
            trailing 0 byte. It’s guaranteed to be non-negative.
    Returns: a pointer to a newly allocated UTF-8 string.
          This value must be freed with [glib.global.gfree]. If an error occurs,
          null will be returned and error set.
    Throws: [ErrorWrap]
*/
string utf16ToUtf8(ushort[] str, out glong itemsRead, out glong itemsWritten)
{
  char* _cretval;
  glong _len;
  if (str)
    _len = cast(glong)str.length;

  auto _str = cast(const(ushort)*)str.ptr;
  GError *_err;
  _cretval = g_utf16_to_utf8(_str, _len, cast(glong*)&itemsRead, cast(glong*)&itemsWritten, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a string into a form that is independent of case. The
    result will not correspond to any particular case, but can be
    compared for equality or ordered with the results of calling
    [glib.global.utf8Casefold] on other strings.
    
    Note that calling [glib.global.utf8Casefold] followed by [glib.global.utf8Collate] is
    only an approximation to the correct linguistic case insensitive
    ordering, though it is a fairly good one. Getting this exactly
    right would require a more sophisticated collation function that
    takes case sensitivity into account. GLib does not currently
    provide such a function.

    Params:
      str = a UTF-8 encoded string
    Returns: a newly allocated string, that is a
        case independent form of str.
*/
string utf8Casefold(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_casefold(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Compares two strings for ordering using the linguistically
    correct rules for the [current locale][setlocale].
    When sorting a large number of strings, it will be significantly
    faster to obtain collation keys with [glib.global.utf8CollateKey] and
    compare the keys with strcmp() when sorting instead of sorting
    the original strings.
    
    If the two strings are not comparable due to being in different collation
    sequences, the result is undefined. This can happen if the strings are in
    different language scripts, for example.

    Params:
      str1 = a UTF-8 encoded string
      str2 = a UTF-8 encoded string
    Returns: < 0 if str1 compares before str2,
        0 if they compare equal, > 0 if str1 compares after str2.
*/
int utf8Collate(string str1, string str2)
{
  int _retval;
  const(char)* _str1 = str1.toCString(No.Alloc);
  const(char)* _str2 = str2.toCString(No.Alloc);
  _retval = g_utf8_collate(_str1, _str2);
  return _retval;
}

/**
    Converts a string into a collation key that can be compared
    with other collation keys produced by the same function using
    strcmp().
    
    The results of comparing the collation keys of two strings
    with strcmp() will always be the same as comparing the two
    original keys with [glib.global.utf8Collate].
    
    Note that this function depends on the [current locale][setlocale].

    Params:
      str = a UTF-8 encoded string.
    Returns: a newly allocated string. This string should
        be freed with [glib.global.gfree] when you are done with it.
*/
string utf8CollateKey(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_collate_key(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a string into a collation key that can be compared
    with other collation keys produced by the same function using strcmp().
    
    In order to sort filenames correctly, this function treats the dot '.'
    as a special case. Most dictionary orderings seem to consider it
    insignificant, thus producing the ordering "event.c" "eventgenerator.c"
    "event.h" instead of "event.c" "event.h" "eventgenerator.c". Also, we
    would like to treat numbers intelligently so that "file1" "file10" "file5"
    is sorted as "file1" "file5" "file10".
    
    Note that this function depends on the [current locale][setlocale].

    Params:
      str = a UTF-8 encoded string.
    Returns: a newly allocated string. This string should
        be freed with [glib.global.gfree] when you are done with it.
*/
string utf8CollateKeyForFilename(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_collate_key_for_filename(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Finds the start of the next UTF-8 character in the string after `p`.
    
    `p` does not have to be at the beginning of a UTF-8 character. No check
    is made to see if the character found is actually valid other than
    it starts with an appropriate byte.
    
    If end is null, the return value will never be null: if the end of the
    string is reached, a pointer to the terminating nul byte is returned. If
    end is non-null, the return value will be null if the end of the string
    is reached.

    Params:
      p = a pointer to a position within a UTF-8 encoded string
      end = a pointer to the byte following the end of the string,
            or null to indicate that the string is nul-terminated
    Returns: a pointer to the found character or null if end is
         set and is reached
*/
string utf8FindNextChar(string p, string end = null)
{
  char* _cretval;
  const(char)* _p = p.toCString(No.Alloc);
  const(char)* _end = end.toCString(No.Alloc);
  _cretval = g_utf8_find_next_char(_p, _end);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Given a position `p` with a UTF-8 encoded string str, find the start
    of the previous UTF-8 character starting before `p`. Returns null if no
    UTF-8 characters are present in str before `p`.
    
    `p` does not have to be at the beginning of a UTF-8 character. No check
    is made to see if the character found is actually valid other than
    it starts with an appropriate byte.

    Params:
      str = pointer to the beginning of a UTF-8 encoded string
      p = pointer to some position within str
    Returns: a pointer to the found character or null.
*/
string utf8FindPrevChar(string str, string p)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  const(char)* _p = p.toCString(No.Alloc);
  _cretval = g_utf8_find_prev_char(_str, _p);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Converts a sequence of bytes encoded as UTF-8 to a Unicode character.
    
    If `p` does not point to a valid UTF-8 encoded character, results
    are undefined. If you are not sure that the bytes are complete
    valid Unicode characters, you should use [glib.global.utf8GetCharValidated]
    instead.

    Params:
      p = a pointer to Unicode character encoded as UTF-8
    Returns: the resulting character
*/
dchar utf8GetChar(string p)
{
  dchar _retval;
  const(char)* _p = p.toCString(No.Alloc);
  _retval = g_utf8_get_char(_p);
  return _retval;
}

/**
    Convert a sequence of bytes encoded as UTF-8 to a Unicode character.
    This function checks for incomplete characters, for invalid characters
    such as characters that are out of the range of Unicode, and for
    overlong encodings of valid characters.
    
    Note that [glib.global.utf8GetCharValidated] returns (gunichar)-2 if
    max_len is positive and any of the bytes in the first UTF-8 character
    sequence are nul.

    Params:
      p = a pointer to Unicode character encoded as UTF-8
    Returns: the resulting character. If `p` points to a partial
          sequence at the end of a string that could begin a valid
          character (or if max_len is zero), returns (gunichar)-2;
          otherwise, if `p` does not point to a valid UTF-8 encoded
          Unicode character, returns (gunichar)-1.
*/
dchar utf8GetCharValidated(string p)
{
  dchar _retval;
  ptrdiff_t _maxLen;
  if (p)
    _maxLen = cast(ptrdiff_t)p.length;

  auto _p = cast(const(char)*)p.ptr;
  _retval = g_utf8_get_char_validated(_p, _maxLen);
  return _retval;
}

/**
    If the provided string is valid UTF-8, return a copy of it. If not,
    return a copy in which bytes that could not be interpreted as valid Unicode
    are replaced with the Unicode replacement character (U+FFFD).
    
    For example, this is an appropriate function to use if you have received
    a string that was incorrectly declared to be UTF-8, and you need a valid
    UTF-8 version of it that can be logged or displayed to the user, with the
    assumption that it is close enough to ASCII or UTF-8 to be mostly
    readable as-is.

    Params:
      str = string to coerce into UTF-8
    Returns: a valid UTF-8 string whose content resembles str
*/
string utf8MakeValid(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_make_valid(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts a string into canonical form, standardizing
    such issues as whether a character with an accent
    is represented as a base character and combining
    accent or as a single precomposed character. The
    string has to be valid UTF-8, otherwise null is
    returned. You should generally call [glib.global.utf8Normalize]
    before comparing two Unicode strings.
    
    The normalization mode [glib.types.NormalizeMode.Default] only
    standardizes differences that do not affect the
    text content, such as the above-mentioned accent
    representation. [glib.types.NormalizeMode.All] also standardizes
    the "compatibility" characters in Unicode, such
    as SUPERSCRIPT THREE to the standard forms
    (in this case DIGIT THREE). Formatting information
    may be lost but for most text operations such
    characters should be considered the same.
    
    [glib.types.NormalizeMode.DefaultCompose] and [glib.types.NormalizeMode.AllCompose]
    are like [glib.types.NormalizeMode.Default] and [glib.types.NormalizeMode.All],
    but returned a result with composed forms rather
    than a maximally decomposed form. This is often
    useful if you intend to convert the string to
    a legacy encoding or pass it to a system with
    less capable Unicode handling.

    Params:
      str = a UTF-8 encoded string.
      mode = the type of normalization to perform.
    Returns: a newly allocated string, that
        is the normalized form of str, or null if str
        is not valid UTF-8.
*/
string utf8Normalize(string str, glib.types.NormalizeMode mode)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_normalize(_str, _len, mode);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts from an integer character offset to a pointer to a position
    within the string.
    
    Since 2.10, this function allows to pass a negative offset to
    step backwards. It is usually worth stepping backwards from the end
    instead of forwards if offset is in the last fourth of the string,
    since moving forward is about 3 times faster than moving backward.
    
    Note that this function doesn't abort when reaching the end of str.
    Therefore you should be sure that offset is within string boundaries
    before calling that function. Call [glib.global.utf8Strlen] when unsure.
    This limitation exists as this function is called frequently during
    text rendering and therefore has to be as fast as possible.

    Params:
      str = a UTF-8 encoded string
      offset = a character offset within str
    Returns: the resulting pointer
*/
string utf8OffsetToPointer(string str, glong offset)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_utf8_offset_to_pointer(_str, offset);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Converts from a pointer to position within a string to an integer
    character offset.
    
    Since 2.10, this function allows pos to be before str, and returns
    a negative offset in this case.

    Params:
      str = a UTF-8 encoded string
      pos = a pointer to a position within str
    Returns: the resulting character offset
*/
glong utf8PointerToOffset(string str, string pos)
{
  glong _retval;
  const(char)* _str = str.toCString(No.Alloc);
  const(char)* _pos = pos.toCString(No.Alloc);
  _retval = g_utf8_pointer_to_offset(_str, _pos);
  return _retval;
}

/**
    Finds the previous UTF-8 character in the string before `p`.
    
    `p` does not have to be at the beginning of a UTF-8 character. No check
    is made to see if the character found is actually valid other than
    it starts with an appropriate byte. If `p` might be the first
    character of the string, you must use [glib.global.utf8FindPrevChar] instead.

    Params:
      p = a pointer to a position within a UTF-8 encoded string
    Returns: a pointer to the found character
*/
string utf8PrevChar(string p)
{
  char* _cretval;
  const(char)* _p = p.toCString(No.Alloc);
  _cretval = g_utf8_prev_char(_p);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Finds the leftmost occurrence of the given Unicode character
    in a UTF-8 encoded string, while limiting the search to len bytes.
    If len is -1, allow unbounded search.

    Params:
      p = a nul-terminated UTF-8 encoded string
      c = a Unicode character
    Returns: null if the string does not contain the character,
          otherwise, a pointer to the start of the leftmost occurrence
          of the character in the string.
*/
string utf8Strchr(string p, dchar c)
{
  char* _cretval;
  ptrdiff_t _len;
  if (p)
    _len = cast(ptrdiff_t)p.length;

  auto _p = cast(const(char)*)p.ptr;
  _cretval = g_utf8_strchr(_p, _len, c);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Converts all Unicode characters in the string that have a case
    to lowercase. The exact manner that this is done depends
    on the current locale, and may result in the number of
    characters in the string changing.

    Params:
      str = a UTF-8 encoded string
    Returns: a newly allocated string, with all characters
         converted to lowercase.
*/
string utf8Strdown(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_strdown(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Computes the length of the string in characters, not including
    the terminating nul character. If the max'th byte falls in the
    middle of a character, the last (partial) character is not counted.

    Params:
      p = pointer to the start of a UTF-8 encoded string
      max = the maximum number of bytes to examine. If max
              is less than 0, then the string is assumed to be
              nul-terminated. If max is 0, `p` will not be examined and
              may be null. If max is greater than 0, up to max
              bytes are examined
    Returns: the length of the string in characters
*/
glong utf8Strlen(string p, ptrdiff_t max)
{
  glong _retval;
  const(char)* _p = p.toCString(No.Alloc);
  _retval = g_utf8_strlen(_p, max);
  return _retval;
}

/**
    Like the standard C strncpy() function, but copies a given number
    of characters instead of a given number of bytes. The src string
    must be valid UTF-8 encoded text. (Use [glib.global.utf8Validate] on all
    text before trying to use UTF-8 utility functions with it.)
    
    Note you must ensure dest is at least 4 * `n` + 1 to fit the
    largest possible UTF-8 characters

    Params:
      dest = buffer to fill with characters from src
      src = UTF-8 encoded string
      n = character count
    Returns: dest
*/
string utf8Strncpy(string dest, string src, size_t n)
{
  char* _cretval;
  char* _dest = dest.toCString(No.Alloc);
  const(char)* _src = src.toCString(No.Alloc);
  _cretval = g_utf8_strncpy(_dest, _src, n);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Find the rightmost occurrence of the given Unicode character
    in a UTF-8 encoded string, while limiting the search to len bytes.
    If len is -1, allow unbounded search.

    Params:
      p = a nul-terminated UTF-8 encoded string
      c = a Unicode character
    Returns: null if the string does not contain the character,
          otherwise, a pointer to the start of the rightmost occurrence
          of the character in the string.
*/
string utf8Strrchr(string p, dchar c)
{
  char* _cretval;
  ptrdiff_t _len;
  if (p)
    _len = cast(ptrdiff_t)p.length;

  auto _p = cast(const(char)*)p.ptr;
  _cretval = g_utf8_strrchr(_p, _len, c);
  string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
  return _retval;
}

/**
    Reverses a UTF-8 string. str must be valid UTF-8 encoded text.
    (Use [glib.global.utf8Validate] on all text before trying to use UTF-8
    utility functions with it.)
    
    This function is intended for programmatic uses of reversed strings.
    It pays no attention to decomposed characters, combining marks, byte
    order marks, directional indicators (LRM, LRO, etc) and similar
    characters which might need special handling when reversing a string
    for display purposes.
    
    Note that unlike [glib.global.strreverse], this function returns
    newly-allocated memory, which should be freed with [glib.global.gfree] when
    no longer needed.

    Params:
      str = a UTF-8 encoded string
    Returns: a newly-allocated string which is the reverse of str
*/
string utf8Strreverse(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_strreverse(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Converts all Unicode characters in the string that have a case
    to uppercase. The exact manner that this is done depends
    on the current locale, and may result in the number of
    characters in the string increasing. (For instance, the
    German ess-zet will be changed to SS.)

    Params:
      str = a UTF-8 encoded string
    Returns: a newly allocated string, with all characters
         converted to uppercase.
*/
string utf8Strup(string str)
{
  char* _cretval;
  ptrdiff_t _len;
  if (str)
    _len = cast(ptrdiff_t)str.length;

  auto _str = cast(const(char)*)str.ptr;
  _cretval = g_utf8_strup(_str, _len);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Copies a substring out of a UTF-8 encoded string.
    The substring will contain end_pos - start_pos characters.
    
    Since GLib 2.72, `-1` can be passed to end_pos to indicate the
    end of the string.

    Params:
      str = a UTF-8 encoded string
      startPos = a character offset within str
      endPos = another character offset within str,
          or `-1` to indicate the end of the string
    Returns: a newly allocated copy of the requested
          substring. Free with [glib.global.gfree] when no longer needed.
*/
string utf8Substring(string str, glong startPos, glong endPos)
{
  char* _cretval;
  const(char)* _str = str.toCString(No.Alloc);
  _cretval = g_utf8_substring(_str, startPos, endPos);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Convert a string from UTF-8 to a 32-bit fixed width
    representation as UCS-4. A trailing 0 character will be added to the
    string after the converted text.

    Params:
      str = a UTF-8 encoded string
      len = the maximum length of str to use, in bytes. If len < 0,
            then the string is nul-terminated.
      itemsRead = location to store number of
           bytes read, or null.
            If null, then `G_CONVERT_ERROR_PARTIAL_INPUT` will be
            returned in case str contains a trailing partial
            character. If an error occurs then the index of the
            invalid input is stored here.
    Returns: a pointer to a newly allocated UCS-4 string.
          This value must be freed with [glib.global.gfree]. If an error occurs,
          null will be returned and error set.
    Throws: [ErrorWrap]
*/
dchar[] utf8ToUcs4(string str, glong len, out glong itemsRead)
{
  dchar* _cretval;
  glong _cretlength;
  const(char)* _str = str.toCString(No.Alloc);
  GError *_err;
  _cretval = g_utf8_to_ucs4(_str, len, cast(glong*)&itemsRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  dchar[] _retval;

  if (_cretval)
  {
    _retval = cast(dchar[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Convert a string from UTF-8 to a 32-bit fixed width
    representation as UCS-4, assuming valid UTF-8 input.
    This function is roughly twice as fast as [glib.global.utf8ToUcs4]
    but does no error checking on the input. A trailing 0 character
    will be added to the string after the converted text.

    Params:
      str = a UTF-8 encoded string
    Returns: a pointer to a newly allocated UCS-4 string.
          This value must be freed with [glib.global.gfree].
*/
dchar[] utf8ToUcs4Fast(string str)
{
  dchar* _cretval;
  glong _cretlength;
  glong _len;
  if (str)
    _len = cast(glong)str.length;

  auto _str = cast(const(char)*)(str ~ char.init).ptr;
  _cretval = g_utf8_to_ucs4_fast(_str, _len, &_cretlength);
  dchar[] _retval;

  if (_cretval)
  {
    _retval = cast(dchar[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Convert a string from UTF-8 to UTF-16. A 0 character will be
    added to the result after the converted text.

    Params:
      str = a UTF-8 encoded string
      len = the maximum length (number of bytes) of str to use.
            If len < 0, then the string is nul-terminated.
      itemsRead = location to store number of
            bytes read, or null. If null, then `G_CONVERT_ERROR_PARTIAL_INPUT` will
            be returned in case str contains a trailing partial character. If
            an error occurs then the index of the invalid input is stored here.
    Returns: a pointer to a newly allocated UTF-16 string.
          This value must be freed with [glib.global.gfree]. If an error occurs,
          null will be returned and error set.
    Throws: [ErrorWrap]
*/
ushort[] utf8ToUtf16(string str, glong len, out glong itemsRead)
{
  ushort* _cretval;
  glong _cretlength;
  const(char)* _str = str.toCString(No.Alloc);
  GError *_err;
  _cretval = g_utf8_to_utf16(_str, len, cast(glong*)&itemsRead, &_cretlength, &_err);
  if (_err)
    throw new ErrorWrap(_err);
  ushort[] _retval;

  if (_cretval)
  {
    _retval = cast(ushort[])_cretval[0 .. _cretlength].dup;
    gFree(cast(void*)_cretval);
  }
  return _retval;
}

/**
    Cuts off the middle of the string, preserving half of truncate_length
    characters at the beginning and half at the end.
    
    If string is already short enough, this returns a copy of string.
    If truncate_length is `0`, an empty string is returned.

    Params:
      string_ = a nul-terminated UTF-8 encoded string
      truncateLength = the new size of string, in characters, including the ellipsis character
    Returns: a newly-allocated copy of string ellipsized in the middle
*/
string utf8TruncateMiddle(string string_, size_t truncateLength)
{
  char* _cretval;
  const(char)* _string_ = string_.toCString(No.Alloc);
  _cretval = g_utf8_truncate_middle(_string_, truncateLength);
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/**
    Validates UTF-8 encoded text. str is the text to validate;
    if str is nul-terminated, then max_len can be -1, otherwise
    max_len should be the number of bytes to validate.
    If end is non-null, then the end of the valid range
    will be stored there (i.e. the start of the first invalid
    character if some bytes were invalid, or the end of the text
    being validated otherwise).
    
    Note that [glib.global.utf8Validate] returns false if max_len is
    positive and any of the max_len bytes are nul.
    
    Returns true if all of str was valid. Many GLib and GTK
    routines require valid UTF-8 as input; so data read from a file
    or the network should be checked with [glib.global.utf8Validate] before
    doing anything else with it.

    Params:
      str = a pointer to character data
      end = return location for end of valid data
    Returns: true if the text was valid UTF-8
*/
bool utf8Validate(ubyte[] str, out string end)
{
  bool _retval;
  ptrdiff_t _maxLen;
  if (str)
    _maxLen = cast(ptrdiff_t)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  char* _end;
  _retval = cast(bool)g_utf8_validate(_str, _maxLen, &_end);
  end = _end.fromCString(No.Free);
  return _retval;
}

/**
    Validates UTF-8 encoded text.
    
    As with [glib.global.utf8Validate], but max_len must be set, and hence this function
    will always return false if any of the bytes of str are nul.

    Params:
      str = a pointer to character data
      end = return location for end of valid data
    Returns: true if the text was valid UTF-8
*/
bool utf8ValidateLen(ubyte[] str, out string end)
{
  bool _retval;
  size_t _maxLen;
  if (str)
    _maxLen = cast(size_t)str.length;

  auto _str = cast(const(ubyte)*)str.ptr;
  char* _end;
  _retval = cast(bool)g_utf8_validate_len(_str, _maxLen, &_end);
  end = _end.fromCString(No.Free);
  return _retval;
}

/**
    Parses the string str and verify if it is a UUID.
    
    The function accepts the following syntax:
    
    $(LIST
      * simple forms (e.g. `f81d4fae-7dec-11d0-a765-00a0c91e6bf6`)
    )
      
    Note that hyphens are required within the UUID string itself,
    as per the aforementioned RFC.

    Params:
      str = a string representing a UUID
    Returns: true if str is a valid UUID, false otherwise.
*/
bool uuidStringIsValid(string str)
{
  bool _retval;
  const(char)* _str = str.toCString(No.Alloc);
  _retval = cast(bool)g_uuid_string_is_valid(_str);
  return _retval;
}

/**
    Generates a random UUID (RFC 4122 version 4) as a string. It has the same
    randomness guarantees as #GRand, so must not be used for cryptographic
    purposes such as key generation, nonces, salts or one-time pads.
    Returns: A string that should be freed with [glib.global.gfree].
*/
string uuidStringRandom()
{
  char* _cretval;
  _cretval = g_uuid_string_random();
  string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
  return _retval;
}

/** */
gobject.types.GType variantGetGtype()
{
  gobject.types.GType _retval;
  _retval = g_variant_get_gtype();
  return _retval;
}
