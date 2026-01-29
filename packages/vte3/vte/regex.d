/// Module for [Regex] class
module vte.regex;

import gid.gid;
import glib.error;
import gobject.boxed;
import vte.c.functions;
import vte.c.types;
import vte.types;

/** */
class Regex : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())vte_regex_get_type != &gidSymbolNotFound ? vte_regex_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Regex self()
  {
    return this;
  }

  /**
      Compiles pattern into a regex for use as a match regex
      with [vte.terminal.Terminal.matchAddRegex] or
      [vte.terminal.Terminal.eventCheckRegexSimple].
      
      See man:pcre2pattern(3) for information
      about the supported regex language, and man:pcre2api(3) for
      information about the supported flags.
      
      The regex will be compiled using <literal>PCRE2_UTF</literal> and
      possibly other flags, in addition to the flags supplied in flags.
  
      Params:
        pattern = a regex pattern string
        flags = PCRE2 compile flags
      Returns: a newly created #VteRegex, or null with error filled in
      Throws: [ErrorWrap]
  */
  static vte.regex.Regex newForMatch(string pattern, uint flags)
  {
    VteRegex* _cretval;
    ptrdiff_t _patternLength;
    if (pattern)
      _patternLength = cast(ptrdiff_t)pattern.length;

    auto _pattern = cast(const(char)*)pattern.ptr;
    GError *_err;
    _cretval = vte_regex_new_for_match(_pattern, _patternLength, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new vte.regex.Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compiles pattern into a regex for use as a match regex
      with [vte.terminal.Terminal.matchAddRegex] or
      [vte.terminal.Terminal.eventCheckRegexSimple].
      
      See man:pcre2pattern(3) for information
      about the supported regex language, and man:pcre2api(3) for
      information about the supported flags and extra_flags.
      
      The regex will be compiled using <literal>PCRE2_UTF</literal> and
      possibly other flags, in addition to the flags supplied in flags.
      
      If regex compilation fails, error will be set and error_offset point
      to error as an offset into pattern.
  
      Params:
        pattern = a regex pattern string
        flags = PCRE2 compile flags
        extraFlags = PCRE2 extra compile flags
        errorOffset = return location to store the error offset
      Returns: a newly created #VteRegex, or null
      Throws: [ErrorWrap]
  */
  static vte.regex.Regex newForMatchFull(string pattern, uint flags, uint extraFlags, out size_t errorOffset)
  {
    VteRegex* _cretval;
    ptrdiff_t _patternLength;
    if (pattern)
      _patternLength = cast(ptrdiff_t)pattern.length;

    auto _pattern = cast(const(char)*)pattern.ptr;
    GError *_err;
    _cretval = vte_regex_new_for_match_full(_pattern, _patternLength, flags, extraFlags, cast(size_t*)&errorOffset, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new vte.regex.Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compiles pattern into a regex for use as a search regex
      with [vte.terminal.Terminal.searchSetRegex].
      
      See man:pcre2pattern(3) for information
      about the supported regex language, and man:pcre2api(3) for
      information about the supported flags.
      
      The regex will be compiled using <literal>PCRE2_UTF</literal> and
      possibly other flags, in addition to the flags supplied in flags.
  
      Params:
        pattern = a regex pattern string
        flags = PCRE2 compile flags
      Returns: a newly created #VteRegex, or null with error filled in
      Throws: [ErrorWrap]
  */
  static vte.regex.Regex newForSearch(string pattern, uint flags)
  {
    VteRegex* _cretval;
    ptrdiff_t _patternLength;
    if (pattern)
      _patternLength = cast(ptrdiff_t)pattern.length;

    auto _pattern = cast(const(char)*)pattern.ptr;
    GError *_err;
    _cretval = vte_regex_new_for_search(_pattern, _patternLength, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new vte.regex.Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compiles pattern into a regex for use as a search regex
      with [vte.terminal.Terminal.searchSetRegex].
      
      See man:pcre2pattern(3) for information
      about the supported regex language, and man:pcre2api(3) for
      information about the supported flags and extra_flags.
      
      The regex will be compiled using <literal>PCRE2_UTF</literal> and
      possibly other flags, in addition to the flags supplied in flags.
      
      If regex compilation fails, error will be set and error_offset point
      to error as an offset into pattern.
  
      Params:
        pattern = a regex pattern string
        flags = PCRE2 compile flags
        extraFlags = 
        errorOffset = return location to store the error offset
      Returns: a newly created #VteRegex, or null
      Throws: [ErrorWrap]
  */
  static vte.regex.Regex newForSearchFull(string pattern, uint flags, uint extraFlags, out size_t errorOffset)
  {
    VteRegex* _cretval;
    ptrdiff_t _patternLength;
    if (pattern)
      _patternLength = cast(ptrdiff_t)pattern.length;

    auto _pattern = cast(const(char)*)pattern.ptr;
    GError *_err;
    _cretval = vte_regex_new_for_search_full(_pattern, _patternLength, flags, extraFlags, cast(size_t*)&errorOffset, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new vte.regex.Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      If the platform supports JITing, JIT compiles regex.
  
      Params:
        flags = PCRE2 JIT flags, or 0
      Returns: true if JITing succeeded (or PCRE2 was built without
          JIT support), or false with error filled in
      Throws: [ErrorWrap]
  */
  bool jit(uint flags)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)vte_regex_jit(cast(VteRegex*)this._cPtr, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      See man:pcre2api(3) and man:pcre2_substitute(3) for more information.
  
      Params:
        subject = the subject string
        replacement = the replacement string
        flags = PCRE2 match flags
      Returns: the substituted string, or null
          if an error occurred
      Throws: [ErrorWrap]
  */
  string substitute(string subject, string replacement, uint flags)
  {
    char* _cretval;
    const(char)* _subject = subject.toCString(No.Alloc);
    const(char)* _replacement = replacement.toCString(No.Alloc);
    GError *_err;
    _cretval = vte_regex_substitute(cast(VteRegex*)this._cPtr, _subject, _replacement, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
