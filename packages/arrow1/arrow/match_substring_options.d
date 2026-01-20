/// Module for [MatchSubstringOptions] class
module arrow.match_substring_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.object;

/** */
class MatchSubstringOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_match_substring_options_get_type != &gidSymbolNotFound ? garrow_match_substring_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MatchSubstringOptions self()
  {
    return this;
  }

  /**
      Get `ignoreCase` property.
      Returns: Whether to perform a case-insensitive match.
  */
  @property bool ignoreCase()
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("ignore-case");
  }

  /**
      Set `ignoreCase` property.
      Params:
        propval = Whether to perform a case-insensitive match.
  */
  @property void ignoreCase(bool propval)
  {
    gobject.object.ObjectWrap.setProperty!(bool)("ignore-case", propval);
  }

  /**
      Get `pattern` property.
      Returns: The exact substring (or regex, depending on kernel) to look for
        inside input values.
  */
  @property string pattern()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("pattern");
  }

  /**
      Set `pattern` property.
      Params:
        propval = The exact substring (or regex, depending on kernel) to look for
          inside input values.
  */
  @property void pattern(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("pattern", propval);
  }

  /** */
  this()
  {
    GArrowMatchSubstringOptions* _cretval;
    _cretval = garrow_match_substring_options_new();
    this(_cretval, Yes.Take);
  }
}
