/// Module for [MatchSubstringOptions] class
module arrow.match_substring_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class MatchSubstringOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_match_substring_options_get_type != &gidSymbolNotFound ? garrow_match_substring_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MatchSubstringOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.match_substring_options.MatchSubstringOptions]
      Returns: New builder object
  */
  static MatchSubstringOptionsGidBuilder builder() nothrow
  {
    return new MatchSubstringOptionsGidBuilder;
  }

  /**
      Get `ignoreCase` property.
      Returns: Whether to perform a case-insensitive match.
  */
  @property bool ignoreCase() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("ignore-case");
  }

  /**
      Set `ignoreCase` property.
      Params:
        propval = Whether to perform a case-insensitive match.
  */
  @property void ignoreCase(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("ignore-case", propval);
  }

  /**
      Get `pattern` property.
      Returns: The exact substring (or regex, depending on kernel) to look for
        inside input values.
  */
  @property string pattern() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("pattern");
  }

  /**
      Set `pattern` property.
      Params:
        propval = The exact substring (or regex, depending on kernel) to look for
          inside input values.
  */
  @property void pattern(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("pattern", propval);
  }

  /** */
  this() nothrow
  {
    GArrowMatchSubstringOptions* _cretval;
    _cretval = garrow_match_substring_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.match_substring_options.MatchSubstringOptions]
class MatchSubstringOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `ignoreCase` property.
      Params:
        propval = Whether to perform a case-insensitive match.
      Returns: Builder instance for fluent chaining
  */
  T ignoreCase(bool propval) nothrow
  {
    return setProperty("ignore-case", propval);
  }

  /**
      Set `pattern` property.
      Params:
        propval = The exact substring (or regex, depending on kernel) to look for
          inside input values.
      Returns: Builder instance for fluent chaining
  */
  T pattern(string propval) nothrow
  {
    return setProperty("pattern", propval);
  }
}

/// Fluent builder for [arrow.match_substring_options.MatchSubstringOptions]
final class MatchSubstringOptionsGidBuilder : MatchSubstringOptionsGidBuilderImpl!MatchSubstringOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MatchSubstringOptions build() nothrow
  {
    return new MatchSubstringOptions(cast(void*)createGObject(MatchSubstringOptions._getGType), Yes.Take);
  }
}
