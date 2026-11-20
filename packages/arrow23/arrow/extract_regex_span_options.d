/// Module for [ExtractRegexSpanOptions] class
module arrow.extract_regex_span_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ExtractRegexSpanOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_extract_regex_span_options_get_type != &gidSymbolNotFound ? garrow_extract_regex_span_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowExtractRegexSpanOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override ExtractRegexSpanOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.extract_regex_span_options.ExtractRegexSpanOptions]
      Returns: New builder object
  */
  static ExtractRegexSpanOptionsGidBuilder builder() nothrow
  {
    return new ExtractRegexSpanOptionsGidBuilder;
  }

  /**
      Get `pattern` property.
      Returns: Regular expression with named capture fields.
  */
  @property string pattern() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(string)("pattern");
  }

  /**
      Set `pattern` property.
      Params:
        propval = Regular expression with named capture fields.
  */
  @property void pattern(string propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(string)("pattern", propval);
  }

  /** */
  this() nothrow
  {
    GArrowExtractRegexSpanOptions* _cretval;
    _cretval = garrow_extract_regex_span_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.extract_regex_span_options.ExtractRegexSpanOptions]
class ExtractRegexSpanOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `pattern` property.
      Params:
        propval = Regular expression with named capture fields.
      Returns: Builder instance for fluent chaining
  */
  T pattern(string propval) nothrow
  {
    return setProperty("pattern", propval);
  }
}

/// Fluent builder for [arrow.extract_regex_span_options.ExtractRegexSpanOptions]
final class ExtractRegexSpanOptionsGidBuilder : ExtractRegexSpanOptionsGidBuilderImpl!ExtractRegexSpanOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ExtractRegexSpanOptions build() nothrow
  {
    return new ExtractRegexSpanOptions(cast(void*)createGObject(ExtractRegexSpanOptions._getGType), Yes.Take);
  }
}
