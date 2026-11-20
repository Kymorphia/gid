/// Module for [ReplaceSubstringOptions] class
module arrow.replace_substring_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ReplaceSubstringOptions : arrow.function_options.FunctionOptions
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_replace_substring_options_get_type != &gidSymbolNotFound ? garrow_replace_substring_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowReplaceSubstringOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override ReplaceSubstringOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.replace_substring_options.ReplaceSubstringOptions]
      Returns: New builder object
  */
  static ReplaceSubstringOptionsGidBuilder builder() nothrow
  {
    return new ReplaceSubstringOptionsGidBuilder;
  }

  /**
      Get `maxReplacements` property.
      Returns: Max number of substrings to replace (-1 means unbounded).
  */
  @property long maxReplacements() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(long)("max-replacements");
  }

  /**
      Set `maxReplacements` property.
      Params:
        propval = Max number of substrings to replace (-1 means unbounded).
  */
  @property void maxReplacements(long propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(long)("max-replacements", propval);
  }

  /**
      Get `pattern` property.
      Returns: Pattern to match, literal, or regular expression depending on which kernel is used.
  */
  @property string pattern() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("pattern");
  }

  /**
      Set `pattern` property.
      Params:
        propval = Pattern to match, literal, or regular expression depending on which kernel is used.
  */
  @property void pattern(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("pattern", propval);
  }

  /**
      Get `replacement` property.
      Returns: String to replace the pattern with.
  */
  @property string replacement() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("replacement");
  }

  /**
      Set `replacement` property.
      Params:
        propval = String to replace the pattern with.
  */
  @property void replacement(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("replacement", propval);
  }

  /** */
  this() nothrow
  {
    GArrowReplaceSubstringOptions* _cretval;
    _cretval = garrow_replace_substring_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.replace_substring_options.ReplaceSubstringOptions]
class ReplaceSubstringOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `maxReplacements` property.
      Params:
        propval = Max number of substrings to replace (-1 means unbounded).
      Returns: Builder instance for fluent chaining
  */
  T maxReplacements(long propval) nothrow
  {
    return setProperty("max-replacements", propval);
  }

  /**
      Set `pattern` property.
      Params:
        propval = Pattern to match, literal, or regular expression depending on which kernel is used.
      Returns: Builder instance for fluent chaining
  */
  T pattern(string propval) nothrow
  {
    return setProperty("pattern", propval);
  }

  /**
      Set `replacement` property.
      Params:
        propval = String to replace the pattern with.
      Returns: Builder instance for fluent chaining
  */
  T replacement(string propval) nothrow
  {
    return setProperty("replacement", propval);
  }
}

/// Fluent builder for [arrow.replace_substring_options.ReplaceSubstringOptions]
final class ReplaceSubstringOptionsGidBuilder : ReplaceSubstringOptionsGidBuilderImpl!ReplaceSubstringOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ReplaceSubstringOptions build() nothrow
  {
    return new ReplaceSubstringOptions(cast(void*)createGObject(ReplaceSubstringOptions._getGType), Yes.Take);
  }
}
