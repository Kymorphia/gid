/// Module for [PatternSpec] class
module glib.pattern_spec;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;
import gobject.boxed;

/**
    A [glib.pattern_spec.PatternSpec] struct is the 'compiled' form of a glob-style pattern.
    
    The `func@GLib.pattern_match_simple` and [glib.pattern_spec.PatternSpec.match] functions
    match a string against a pattern containing '*' and '?' wildcards with similar
    semantics as the standard `glob()` function: '*' matches an arbitrary,
    possibly empty, string, '?' matches an arbitrary character.
    
    Note that in contrast to `glob()`, the '/' character can be matched by
    the wildcards, there are no '[...]' character ranges and '*' and '?'
    can not be escaped to include them literally in a pattern.
    
    When multiple strings must be matched against the same pattern, it is better
    to compile the pattern to a [glib.pattern_spec.PatternSpec] using
    [glib.pattern_spec.PatternSpec.new_] and use [glib.pattern_spec.PatternSpec.matchString]
    instead of `func@GLib.pattern_match_simple`. This avoids the overhead of repeated
    pattern compilation.
*/
class PatternSpec : gobject.boxed.Boxed
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
    return cast(void function())g_pattern_spec_get_type != &gidSymbolNotFound ? g_pattern_spec_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override PatternSpec self()
  {
    return this;
  }

  /**
      Compiles a pattern to a #GPatternSpec.
  
      Params:
        pattern = a zero-terminated UTF-8 encoded string
      Returns: a newly-allocated #GPatternSpec
  */
  this(string pattern)
  {
    GPatternSpec* _cretval;
    const(char)* _pattern = pattern.toCString(No.Alloc);
    _cretval = g_pattern_spec_new(_pattern);
    this(_cretval, Yes.Take);
  }

  /**
      Copies pspec in a new #GPatternSpec.
      Returns: a copy of pspec.
  */
  glib.pattern_spec.PatternSpec copy()
  {
    GPatternSpec* _cretval;
    _cretval = g_pattern_spec_copy(cast(GPatternSpec*)this._cPtr);
    auto _retval = _cretval ? new glib.pattern_spec.PatternSpec(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Compares two compiled pattern specs and returns whether they will
      match the same set of strings.
  
      Params:
        pspec2 = another #GPatternSpec
      Returns: Whether the compiled patterns are equal
  */
  bool equal(glib.pattern_spec.PatternSpec pspec2)
  {
    bool _retval;
    _retval = cast(bool)g_pattern_spec_equal(cast(GPatternSpec*)this._cPtr, pspec2 ? cast(GPatternSpec*)pspec2._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Matches a string against a compiled pattern. Passing the correct
      length of the string given is mandatory. The reversed string can be
      omitted by passing null, this is more efficient if the reversed
      version of the string to be matched is not at hand, as
      [glib.global.patternMatch] will only construct it if the compiled pattern
      requires reverse matches.
      
      Note that, if the user code will (possibly) match a string against a
      multitude of patterns containing wildcards, chances are high that
      some patterns will require a reversed string. In this case, it's
      more efficient to provide the reversed string to avoid multiple
      constructions thereof in the various calls to [glib.global.patternMatch].
      
      Note also that the reverse of a UTF-8 encoded string can in general
      not be obtained by [glib.global.strreverse]. This works only if the string
      does not contain any multibyte characters. GLib offers the
      [glib.global.utf8Strreverse] function to reverse UTF-8 encoded strings.
  
      Params:
        string_ = the UTF-8 encoded string to match
        stringReversed = the reverse of string or null
      Returns: true if string matches pspec
  */
  bool match(string string_, string stringReversed = null)
  {
    bool _retval;
    size_t _stringLength;
    if (string_)
      _stringLength = cast(size_t)string_.length;

    auto _string_ = cast(const(char)*)string_.ptr;
    const(char)* _stringReversed = stringReversed.toCString(No.Alloc);
    _retval = cast(bool)g_pattern_spec_match(cast(GPatternSpec*)this._cPtr, _stringLength, _string_, _stringReversed);
    return _retval;
  }

  /**
      Matches a string against a compiled pattern. If the string is to be
      matched against more than one pattern, consider using
      [glib.global.patternMatch] instead while supplying the reversed string.
  
      Params:
        string_ = the UTF-8 encoded string to match
      Returns: true if string matches pspec
  */
  bool matchString(string string_)
  {
    bool _retval;
    const(char)* _string_ = string_.toCString(No.Alloc);
    _retval = cast(bool)g_pattern_spec_match_string(cast(GPatternSpec*)this._cPtr, _string_);
    return _retval;
  }
}
