module Vte.Regex;

import GLib.ErrorG;
import GObject.Boxed;
import Gid.gid;
import Vte.Types;
import Vte.c.functions;
import Vte.c.types;

class Regex : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())vte_regex_get_type != &gidSymbolNotFound ? vte_regex_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Compiles pattern into a regex for use as a match regex
   * with [Vte.Terminal.matchAddRegex] or
   * vte_terminal_event_check_regex_simple$(LPAREN)$(RPAREN).
   * See man:pcre2pattern$(LPAREN)3$(RPAREN) for information
   * about the supported regex language, and man:pcre2api$(LPAREN)3$(RPAREN) for
   * information about the supported flags.
   * The regex will be compiled using <literal>PCRE2_UTF</literal> and
   * possibly other flags, in addition to the flags supplied in flags.
   * Params:
   *   pattern = a regex pattern string
   *   patternLength = the length of pattern in bytes, or -1 if the
   *     string is NUL-terminated and the length is unknown
   *   flags = PCRE2 compile flags
   * Returns: a newly created #VteRegex, or %NULL with error filled in
   */
  static Regex newForMatch(string pattern, ptrdiff_t patternLength, uint flags)
  {
    VteRegex* _cretval;
    const(char)* _pattern = pattern.toCString(No.Alloc);
    GError *_err;
    _cretval = vte_regex_new_for_match(_pattern, patternLength, flags, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Compiles pattern into a regex for use as a match regex
   * with [Vte.Terminal.matchAddRegex] or
   * vte_terminal_event_check_regex_simple$(LPAREN)$(RPAREN).
   * See man:pcre2pattern$(LPAREN)3$(RPAREN) for information
   * about the supported regex language, and man:pcre2api$(LPAREN)3$(RPAREN) for
   * information about the supported flags and extra_flags.
   * The regex will be compiled using <literal>PCRE2_UTF</literal> and
   * possibly other flags, in addition to the flags supplied in flags.
   * If regex compilation fails, error will be set and error_offset point
   * to error as an offset into pattern.
   * Params:
   *   pattern = a regex pattern string
   *   patternLength = the length of pattern in bytes, or -1 if the
   *     string is NUL-terminated and the length is unknown
   *   flags = PCRE2 compile flags
   *   extraFlags = PCRE2 extra compile flags
   *   errorOffset = return location to store the error offset
   * Returns: a newly created #VteRegex, or %NULL
   */
  static Regex newForMatchFull(string pattern, ptrdiff_t patternLength, uint flags, uint extraFlags, out size_t errorOffset)
  {
    VteRegex* _cretval;
    const(char)* _pattern = pattern.toCString(No.Alloc);
    GError *_err;
    _cretval = vte_regex_new_for_match_full(_pattern, patternLength, flags, extraFlags, cast(size_t*)&errorOffset, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Compiles pattern into a regex for use as a search regex
   * with [Vte.Terminal.searchSetRegex].
   * See man:pcre2pattern$(LPAREN)3$(RPAREN) for information
   * about the supported regex language, and man:pcre2api$(LPAREN)3$(RPAREN) for
   * information about the supported flags.
   * The regex will be compiled using <literal>PCRE2_UTF</literal> and
   * possibly other flags, in addition to the flags supplied in flags.
   * Params:
   *   pattern = a regex pattern string
   *   patternLength = the length of pattern in bytes, or -1 if the
   *     string is NUL-terminated and the length is unknown
   *   flags = PCRE2 compile flags
   * Returns: a newly created #VteRegex, or %NULL with error filled in
   */
  static Regex newForSearch(string pattern, ptrdiff_t patternLength, uint flags)
  {
    VteRegex* _cretval;
    const(char)* _pattern = pattern.toCString(No.Alloc);
    GError *_err;
    _cretval = vte_regex_new_for_search(_pattern, patternLength, flags, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Compiles pattern into a regex for use as a search regex
   * with [Vte.Terminal.searchSetRegex].
   * See man:pcre2pattern$(LPAREN)3$(RPAREN) for information
   * about the supported regex language, and man:pcre2api$(LPAREN)3$(RPAREN) for
   * information about the supported flags and extra_flags.
   * The regex will be compiled using <literal>PCRE2_UTF</literal> and
   * possibly other flags, in addition to the flags supplied in flags.
   * If regex compilation fails, error will be set and error_offset point
   * to error as an offset into pattern.
   * Params:
   *   pattern = a regex pattern string
   *   patternLength = the length of pattern in bytes, or -1 if the
   *     string is NUL-terminated and the length is unknown
   *   flags = PCRE2 compile flags
   *   extraFlags =
   *   errorOffset = return location to store the error offset
   * Returns: a newly created #VteRegex, or %NULL
   */
  static Regex newForSearchFull(string pattern, ptrdiff_t patternLength, uint flags, uint extraFlags, out size_t errorOffset)
  {
    VteRegex* _cretval;
    const(char)* _pattern = pattern.toCString(No.Alloc);
    GError *_err;
    _cretval = vte_regex_new_for_search_full(_pattern, patternLength, flags, extraFlags, cast(size_t*)&errorOffset, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Regex(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * If the platform supports JITing, JIT compiles regex.
   * Params:
   *   flags = PCRE2 JIT flags, or 0
   * Returns: %TRUE if JITing succeeded $(LPAREN)or PCRE2 was built without
   *   JIT support$(RPAREN), or %FALSE with error filled in
   */
  bool jit(uint flags)
  {
    bool _retval;
    GError *_err;
    _retval = vte_regex_jit(cast(VteRegex*)cPtr, flags, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }

  /**
   * See man:pcre2api$(LPAREN)3$(RPAREN) and man:pcre2_substitute$(LPAREN)3$(RPAREN) for more information.
   * Params:
   *   subject = the subject string
   *   replacement = the replacement string
   *   flags = PCRE2 match flags
   * Returns: the substituted string, or %NULL
   *   if an error occurred
   */
  string substitute(string subject, string replacement, uint flags)
  {
    char* _cretval;
    const(char)* _subject = subject.toCString(No.Alloc);
    const(char)* _replacement = replacement.toCString(No.Alloc);
    GError *_err;
    _cretval = vte_regex_substitute(cast(VteRegex*)cPtr, _subject, _replacement, flags, &_err);
    if (_err)
      throw new ErrorG(_err);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
