/// Module for [MatchInfo] class
module glib.match_info;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.regex;
import glib.types;
import gobject.boxed;

/**
    A GMatchInfo is an opaque struct used to return information about
    matches.
*/
class MatchInfo : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_match_info_get_type != &gidSymbolNotFound ? g_match_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MatchInfo self()
  {
    return this;
  }

  /**
      Returns a new string containing the text in string_to_expand with
      references and escape sequences expanded. References refer to the last
      match done with string against regex and have the same syntax used by
      [glib.regex.Regex.replace].
      
      The string_to_expand must be UTF-8 encoded even if `G_REGEX_RAW` was
      passed to [glib.regex.Regex.new_].
      
      The backreferences are extracted from the string passed to the match
      function, so you cannot call this function after freeing the string.
      
      match_info may be null in which case string_to_expand must not
      contain references. For instance "foo\n" does not refer to an actual
      pattern and '\n' merely will be replaced with \n character,
      while to expand "\0" (whole match) one needs the result of a match.
      Use [glib.regex.Regex.checkReplacement] to find out whether string_to_expand
      contains references.
  
      Params:
        stringToExpand = the string to expand
      Returns: the expanded string, or null if an error occurred
      Throws: [ErrorWrap]
  */
  string expandReferences(string stringToExpand)
  {
    char* _cretval;
    const(char)* _stringToExpand = stringToExpand.toCString(No.Alloc);
    GError *_err;
    _cretval = g_match_info_expand_references(cast(const(GMatchInfo)*)this._cPtr, _stringToExpand, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the text matching the match_num'th capturing
      parentheses. 0 is the full text of the match, 1 is the first paren
      set, 2 the second, and so on.
      
      If match_num is a valid sub pattern but it didn't match anything
      (e.g. sub pattern 1, matching "b" against "(a)?b") then an empty
      string is returned.
      
      If the match was obtained using the DFA algorithm, that is using
      [glib.regex.Regex.matchAll] or [glib.regex.Regex.matchAllFull], the retrieved
      string is not that of a set of parentheses but that of a matched
      substring. Substrings are matched in reverse order of length, so
      0 is the longest match.
      
      The string is fetched from the string passed to the match function,
      so you cannot call this function after freeing the string.
  
      Params:
        matchNum = number of the sub expression
      Returns: The matched substring, or null if an error
            occurred. You have to free the string yourself
  */
  string fetch(int matchNum)
  {
    char* _cretval;
    _cretval = g_match_info_fetch(cast(const(GMatchInfo)*)this._cPtr, matchNum);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Bundles up pointers to each of the matching substrings from a match
      and stores them in an array of gchar pointers. The first element in
      the returned array is the match number 0, i.e. the entire matched
      text.
      
      If a sub pattern didn't match anything (e.g. sub pattern 1, matching
      "b" against "(a)?b") then an empty string is inserted.
      
      If the last match was obtained using the DFA algorithm, that is using
      [glib.regex.Regex.matchAll] or [glib.regex.Regex.matchAllFull], the retrieved
      strings are not that matched by sets of parentheses but that of the
      matched substring. Substrings are matched in reverse order of length,
      so the first one is the longest match.
      
      The strings are fetched from the string passed to the match function,
      so you cannot call this function after freeing the string.
      Returns: a null-terminated array of gchar *
            pointers.  It must be freed using [glib.global.strfreev]. If the previous
            match failed null is returned
  */
  string[] fetchAll()
  {
    char** _cretval;
    _cretval = g_match_info_fetch_all(cast(const(GMatchInfo)*)this._cPtr);
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
      Retrieves the text matching the capturing parentheses named name.
      
      If name is a valid sub pattern name but it didn't match anything
      (e.g. sub pattern "X", matching "b" against "(?P<X>a)?b")
      then an empty string is returned.
      
      The string is fetched from the string passed to the match function,
      so you cannot call this function after freeing the string.
  
      Params:
        name = name of the subexpression
      Returns: The matched substring, or null if an error
            occurred. You have to free the string yourself
  */
  string fetchNamed(string name)
  {
    char* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_match_info_fetch_named(cast(const(GMatchInfo)*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the position in bytes of the capturing parentheses named name.
      
      If name is a valid sub pattern name but it didn't match anything
      (e.g. sub pattern "X", matching "b" against "(?P<X>a)?b")
      then start_pos and end_pos are set to -1 and true is returned.
  
      Params:
        name = name of the subexpression
        startPos = pointer to location where to store
              the start position, or null
        endPos = pointer to location where to store
              the end position, or null
      Returns: true if the position was fetched, false otherwise.
            If the position cannot be fetched, start_pos and end_pos
            are left unchanged.
  */
  bool fetchNamedPos(string name, out int startPos, out int endPos)
  {
    bool _retval;
    const(char)* _name = name.toCString(No.Alloc);
    _retval = cast(bool)g_match_info_fetch_named_pos(cast(const(GMatchInfo)*)this._cPtr, _name, cast(int*)&startPos, cast(int*)&endPos);
    return _retval;
  }

  /**
      Retrieves the position in bytes of the match_num'th capturing
      parentheses. 0 is the full text of the match, 1 is the first
      paren set, 2 the second, and so on.
      
      If match_num is a valid sub pattern but it didn't match anything
      (e.g. sub pattern 1, matching "b" against "(a)?b") then start_pos
      and end_pos are set to -1 and true is returned.
      
      If the match was obtained using the DFA algorithm, that is using
      [glib.regex.Regex.matchAll] or [glib.regex.Regex.matchAllFull], the retrieved
      position is not that of a set of parentheses but that of a matched
      substring. Substrings are matched in reverse order of length, so
      0 is the longest match.
  
      Params:
        matchNum = number of the sub expression
        startPos = pointer to location where to store
              the start position, or null
        endPos = pointer to location where to store
              the end position, or null
      Returns: true if the position was fetched, false otherwise. If
          the position cannot be fetched, start_pos and end_pos are left
          unchanged
  */
  bool fetchPos(int matchNum, out int startPos, out int endPos)
  {
    bool _retval;
    _retval = cast(bool)g_match_info_fetch_pos(cast(const(GMatchInfo)*)this._cPtr, matchNum, cast(int*)&startPos, cast(int*)&endPos);
    return _retval;
  }

  /**
      Retrieves the number of matched substrings (including substring 0,
      that is the whole matched text), so 1 is returned if the pattern
      has no substrings in it and 0 is returned if the match failed.
      
      If the last match was obtained using the DFA algorithm, that is
      using [glib.regex.Regex.matchAll] or [glib.regex.Regex.matchAllFull], the retrieved
      count is not that of the number of capturing parentheses but that of
      the number of matched substrings.
      Returns: Number of matched substrings, or -1 if an error occurred
  */
  int getMatchCount()
  {
    int _retval;
    _retval = g_match_info_get_match_count(cast(const(GMatchInfo)*)this._cPtr);
    return _retval;
  }

  /**
      Returns #GRegex object used in match_info. It belongs to Glib
      and must not be freed. Use [glib.regex.Regex.ref_] if you need to keep it
      after you free match_info object.
      Returns: #GRegex object used in match_info
  */
  glib.regex.Regex getRegex()
  {
    GRegex* _cretval;
    _cretval = g_match_info_get_regex(cast(const(GMatchInfo)*)this._cPtr);
    auto _retval = _cretval ? new glib.regex.Regex(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Returns the string searched with match_info. This is the
      string passed to [glib.regex.Regex.match] or [glib.regex.Regex.replace] so
      you may not free it before calling this function.
      Returns: the string searched with match_info
  */
  string getString()
  {
    const(char)* _cretval;
    _cretval = g_match_info_get_string(cast(const(GMatchInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Usually if the string passed to g_regex_match*() matches as far as
      it goes, but is too short to match the entire pattern, false is
      returned. There are circumstances where it might be helpful to
      distinguish this case from other cases in which there is no match.
      
      Consider, for example, an application where a human is required to
      type in data for a field with specific formatting requirements. An
      example might be a date in the form ddmmmyy, defined by the pattern
      "^\d?\d(jan|feb|mar|apr|may|jun|jul|aug|sep|oct|nov|dec)\d\d$".
      If the application sees the user’s keystrokes one by one, and can
      check that what has been typed so far is potentially valid, it is
      able to raise an error as soon as a mistake is made.
      
      GRegex supports the concept of partial matching by means of the
      `G_REGEX_MATCH_PARTIAL_SOFT` and `G_REGEX_MATCH_PARTIAL_HARD` flags.
      When they are used, the return code for
      [glib.regex.Regex.match] or [glib.regex.Regex.matchFull] is, as usual, true
      for a complete match, false otherwise. But, when these functions
      return false, you can check if the match was partial calling
      [glib.match_info.MatchInfo.isPartialMatch].
      
      The difference between `G_REGEX_MATCH_PARTIAL_SOFT` and
      `G_REGEX_MATCH_PARTIAL_HARD` is that when a partial match is encountered
      with `G_REGEX_MATCH_PARTIAL_SOFT`, matching continues to search for a
      possible complete match, while with `G_REGEX_MATCH_PARTIAL_HARD` matching
      stops at the partial match.
      When both `G_REGEX_MATCH_PARTIAL_SOFT` and `G_REGEX_MATCH_PARTIAL_HARD`
      are set, the latter takes precedence.
      
      There were formerly some restrictions on the pattern for partial matching.
      The restrictions no longer apply.
      
      See pcrepartial(3) for more information on partial matching.
      Returns: true if the match was partial, false otherwise
  */
  bool isPartialMatch()
  {
    bool _retval;
    _retval = cast(bool)g_match_info_is_partial_match(cast(const(GMatchInfo)*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether the previous match operation succeeded.
      Returns: true if the previous match operation succeeded,
          false otherwise
  */
  bool matches()
  {
    bool _retval;
    _retval = cast(bool)g_match_info_matches(cast(const(GMatchInfo)*)this._cPtr);
    return _retval;
  }

  /**
      Scans for the next match using the same parameters of the previous
      call to [glib.regex.Regex.matchFull] or [glib.regex.Regex.match] that returned
      match_info.
      
      The match is done on the string passed to the match function, so you
      cannot free it before calling this function.
      Returns: true is the string matched, false otherwise
      Throws: [ErrorWrap]
  */
  bool next()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_match_info_next(cast(GMatchInfo*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
