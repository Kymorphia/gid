/// Module for [MatchInfo] class
module glib.match_info;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_match_info_get_type != &gidSymbolNotFound ? g_match_info_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MatchInfo self() nothrow
  {
    return this;
  }

  /**
      Returns a new string containing the text in string_to_expand with
      references and escape sequences expanded. References refer to the last
      match done with string against regex and have the same syntax used by
      [glib.regex.Regex.replace].
      
      The string_to_expand must be UTF-8 encoded even if [glib.types.RegexCompileFlags.Raw] was
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
    const(char)* _stringToExpand = stringToExpand.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_match_info_expand_references(cast(const(GMatchInfo)*)this._cPtr, _stringToExpand, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
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
  string fetch(int matchNum) nothrow
  {
    char* _cretval;
    _cretval = g_match_info_fetch(cast(const(GMatchInfo)*)this._cPtr, matchNum);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
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
  string[] fetchAll() nothrow
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
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Retrieves the text matching the capturing parentheses named name.
      
      If name is a valid sub pattern name but it didn't match anything
      (e.g. sub pattern `"X"`, matching `"b"` against `"(?P<X>a)?b"`)
      then an empty string is returned.
      
      The string is fetched from the string passed to the match function,
      so you cannot call this function after freeing the string.
  
      Params:
        name = name of the subexpression
      Returns: The matched substring, or null if an error
            occurred. You have to free the string yourself
  */
  string fetchNamed(string name) nothrow
  {
    char* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_match_info_fetch_named(cast(const(GMatchInfo)*)this._cPtr, _name);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Retrieves the position in bytes of the capturing parentheses named name.
      
      If name is a valid sub pattern name but it didn't match anything
      (e.g. sub pattern `"X"`, matching `"b"` against `"(?P<X>a)?b"`)
      then start_pos and end_pos are set to -1 and true is returned.
      
      As end_pos is set to the byte after the final byte of the match (on success),
      the length of the match can be calculated as `end_pos - start_pos`.
  
      Params:
        name = name of the subexpression
        startPos = pointer to location where to store
              the start position, or null
        endPos = pointer to location where to store
              the end position (the byte after the final byte of the match), or null
      Returns: true if the position was fetched, false otherwise.
            If the position cannot be fetched, start_pos and end_pos
            are left unchanged.
  */
  bool fetchNamedPos(string name, out int startPos, out int endPos) nothrow
  {
    bool _retval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _retval = cast(bool)g_match_info_fetch_named_pos(cast(const(GMatchInfo)*)this._cPtr, _name, cast(int*)&startPos, cast(int*)&endPos);
    return _retval;
  }

  /**
      Returns the start and end positions (in bytes) of a successfully matching
      capture parenthesis.
      
      Valid values for match_num are `0` for the full text of the match,
      `1` for the first paren set, `2` for the second, and so on.
      
      As end_pos is set to the byte after the final byte of the match (on success),
      the length of the match can be calculated as `end_pos - start_pos`.
      
      As a best practice, initialize start_pos and end_pos to identifiable
      values, such as `G_MAXINT`, so that you can test if
      `[glib.match_info.MatchInfo.fetchPos]` actually changed the value for a given
      capture parenthesis.
      
      The parameter match_num corresponds to a matched capture parenthesis. The
      actual value you use for match_num depends on the method used to generate
      match_info. The following sections describe those methods.
      
      ## Methods Using Non-deterministic Finite Automata Matching
      
      The methods [glib.regex.Regex.match] and [glib.regex.Regex.matchFull]
      return a [glib.match_info.MatchInfo] using traditional (greedy) pattern
      matching, also known as
      [Non-deterministic Finite Automaton](https://en.wikipedia.org/wiki/Nondeterministic_finite_automaton)
      (NFA) matching. You pass the returned [glib.match_info.MatchInfo] from these methods to
      `[glib.match_info.MatchInfo.fetchPos]` to determine the start and end positions
      of capture parentheses. The values for match_num correspond to the capture
      parentheses in order, with `0` corresponding to the entire matched string.
      
      match_num can refer to a capture parenthesis with no match. For example,
      the string `b` matches against the pattern `(a)?b`, but the capture
      parenthesis `(a)` has no match. In this case, `[glib.match_info.MatchInfo.fetchPos]`
      returns true and sets start_pos and end_pos to `-1` when called with
      `match_num` as `1` (for `(a)`).
      
      For an expanded example, a regex pattern is `(a)?(.*?)the (.*)`,
      and a candidate string is `glib regexes are the best`. In this scenario
      there are four capture parentheses numbered 0–3: an implicit one
      for the entire string, and three explicitly declared in the regex pattern.
      
      Given this example, the following table describes the return values
      from `[glib.match_info.MatchInfo.fetchPos]` for various values of match_num.
      
      `match_num` | Contents | Return value | Returned `start_pos` | Returned `end_pos`
      ----------- | -------- | ------------ | -------------------- | ------------------
      0 | Matches entire string | True | 0 | 25
      1 | Does not match first character | True | -1 | -1
      2 | All text before `the ` | True | 0 | 17
      3 | All text after `the ` | True | 21 | 25
      4 | Capture paren out of range | False | Unchanged | Unchanged
      
      The following code sample and output implements this example.
      
      ``` { .c }
      #include <glib.h>
      
      int
      main (int argc, char *argv[])
      {
        g_autoptr(GError) local_error = NULL;
        const char *regex_pattern = "(a)?(.*?)the (.*)";
        const char *test_string = "glib regexes are the best";
        g_autoptr(GRegex) regex = NULL;
      
        regex = g_regex_new (regex_pattern,
                             G_REGEX_DEFAULT,
                             G_REGEX_MATCH_DEFAULT,
                             &local_error);
        if (regex == NULL)
          {
            g_printerr ("Error creating regex: %s\n", local_error->message);
            return 1;
          }
      
        g_autoptr(GMatchInfo) match_info = NULL;
        g_regex_match (regex, test_string, G_REGEX_MATCH_DEFAULT, &match_info);
      
        int n_matched_strings = g_match_info_get_match_count (match_info);
      
        // Print header line
        g_print ("match_num Contents                  Return value returned start_pos returned end_pos\n");
      
        // Iterate over each capture paren, including one that is out of range as a demonstration.
        for (int match_num = 0; match_num <= n_matched_strings; match_num++)
          {
            gboolean found_match;
            g_autofree char *paren_string = NULL;
            int start_pos = G_MAXINT;
            int end_pos = G_MAXINT;
      
            found_match = g_match_info_fetch_pos (match_info,
                                                  match_num,
                                                  &start_pos,
                                                  &end_pos);
      
            // If no match, display N/A as the found string.
            if (start_pos == G_MAXINT || start_pos == -1)
              paren_string = g_strdup ("N/A");
            else
              paren_string = g_strndup (test_string + start_pos, end_pos - start_pos);
      
            g_print ("%-9d %-25s %-12d %-18d %d\n", match_num, paren_string, found_match, start_pos, end_pos);
          }
      
        return 0;
      }
      ```
      
      ```
      match_num Contents                  Return value returned start_pos returned end_pos
      0         glib regexes are the best 1            0                  25
      1         N/A                       1            -1                 -1
      2         glib regexes are          1            0                  17
      3         best                      1            21                 25
      4         N/A                       0            2147483647         2147483647
      ```
      ## Methods Using Deterministic Finite Automata Matching
      
      The methods [glib.regex.Regex.matchAll] and
      [glib.regex.Regex.matchAllFull]
      return a [glib.match_info.MatchInfo] using
      [Deterministic Finite Automaton](https://en.wikipedia.org/wiki/Deterministic_finite_automaton)
      (DFA) pattern matching. This algorithm detects overlapping matches. You pass
      the returned [glib.match_info.MatchInfo] from these methods to `[glib.match_info.MatchInfo.fetchPos]`
      to determine the start and end positions of each overlapping match. Use the
      method [glib.match_info.MatchInfo.getMatchCount] to determine the number
      of overlapping matches.
      
      For example, a regex pattern is `<.*>`, and a candidate string is
      `<a> <b> <c>`. In this scenario there are three implicit capture
      parentheses: one for the entire string, one for `<a> <b>`, and one for `<a>`.
      
      Given this example, the following table describes the return values from
      `[glib.match_info.MatchInfo.fetchPos]` for various values of match_num.
      
      `match_num` | Contents | Return value | Returned `start_pos` | Returned `end_pos`
      ----------- | -------- | ------------ | -------------------- | ------------------
      0 | Matches entire string | True | 0 | 11
      1 | Matches `<a> <b>` | True | 0 | 7
      2 | Matches `<a>` | True | 0 | 3
      3 | Capture paren out of range | False | Unchanged | Unchanged
      
      The following code sample and output implements this example.
      
      ``` { .c }
      #include <glib.h>
      
      int
      main (int argc, char *argv[])
      {
        g_autoptr(GError) local_error = NULL;
        const char *regex_pattern = "<.*>";
        const char *test_string = "<a> <b> <c>";
        g_autoptr(GRegex) regex = NULL;
      
        regex = g_regex_new (regex_pattern,
                             G_REGEX_DEFAULT,
                             G_REGEX_MATCH_DEFAULT,
                             &local_error);
        if (regex == NULL)
          {
            g_printerr ("Error creating regex: %s\n", local_error->message);
            return -1;
          }
      
        g_autoptr(GMatchInfo) match_info = NULL;
        g_regex_match_all (regex, test_string, G_REGEX_MATCH_DEFAULT, &match_info);
      
        int n_matched_strings = g_match_info_get_match_count (match_info);
      
        // Print header line
        g_print ("match_num Contents                  Return value returned start_pos returned end_pos\n");
      
        // Iterate over each capture paren, including one that is out of range as a demonstration.
        for (int match_num = 0; match_num <= n_matched_strings; match_num++)
          {
            gboolean found_match;
            g_autofree char *paren_string = NULL;
            int start_pos = G_MAXINT;
            int end_pos = G_MAXINT;
      
            found_match = g_match_info_fetch_pos (match_info, match_num, &start_pos, &end_pos);
      
            // If no match, display N/A as the found string.
            if (start_pos == G_MAXINT || start_pos == -1)
              paren_string = g_strdup ("N/A");
            else
              paren_string = g_strndup (test_string + start_pos, end_pos - start_pos);
      
            g_print ("%-9d %-25s %-12d %-18d %d\n", match_num, paren_string, found_match, start_pos, end_pos);
          }
      
        return 0;
      }
      ```
      
      ```
      match_num Contents                  Return value returned start_pos returned end_pos
      0         <a> <b> <c>               1            0                  11
      1         <a> <b>                   1            0                  7
      2         <a>                       1            0                  3
      3         N/A                       0            2147483647         2147483647
      ```
  
      Params:
        matchNum = number of the capture parenthesis
        startPos = pointer to location where to store
              the start position, or null
        endPos = pointer to location where to store
              the end position (the byte after the final byte of the match), or null
      Returns: True if match_num is within range, false otherwise. If
          the capture paren has a match, start_pos and end_pos contain the
          start and end positions (in bytes) of the matching substring. If the
          capture paren has no match, start_pos and end_pos are `-1`. If
          match_num is out of range, start_pos and end_pos are left unchanged.
  */
  bool fetchPos(int matchNum, out int startPos, out int endPos) nothrow
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
  int getMatchCount() nothrow
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
  glib.regex.Regex getRegex() nothrow
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
  string getString() nothrow
  {
    const(char)* _cretval;
    _cretval = g_match_info_get_string(cast(const(GMatchInfo)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
      [glib.types.RegexMatchFlags.PartialSoft] and [glib.types.RegexMatchFlags.PartialHard] flags.
      When they are used, the return code for
      [glib.regex.Regex.match] or [glib.regex.Regex.matchFull] is, as usual, true
      for a complete match, false otherwise. But, when these functions
      return false, you can check if the match was partial calling
      [glib.match_info.MatchInfo.isPartialMatch].
      
      The difference between [glib.types.RegexMatchFlags.PartialSoft] and
      [glib.types.RegexMatchFlags.PartialHard] is that when a partial match is encountered
      with [glib.types.RegexMatchFlags.PartialSoft], matching continues to search for a
      possible complete match, while with [glib.types.RegexMatchFlags.PartialHard] matching
      stops at the partial match.
      When both [glib.types.RegexMatchFlags.PartialSoft] and [glib.types.RegexMatchFlags.PartialHard]
      are set, the latter takes precedence.
      
      There were formerly some restrictions on the pattern for partial matching.
      The restrictions no longer apply.
      
      See pcrepartial(3) for more information on partial matching.
      Returns: true if the match was partial, false otherwise
  */
  bool isPartialMatch() nothrow
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
  bool matches() nothrow
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
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }
}
