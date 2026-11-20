/// Module for [SkewOptions] class
module arrow.skew_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class SkewOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_skew_options_get_type != &gidSymbolNotFound ? garrow_skew_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowSkewOptions";
  }

  /** Returns `this`, for use in `with` statements. */
  override SkewOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.skew_options.SkewOptions]
      Returns: New builder object
  */
  static SkewOptionsGidBuilder builder() nothrow
  {
    return new SkewOptionsGidBuilder;
  }

  /**
      Get `biased` property.
      Returns: Whether the calculated value is biased.
        If false, the value computed includes a correction factor to reduce bias.
  */
  @property bool biased() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("biased");
  }

  /**
      Set `biased` property.
      Params:
        propval = Whether the calculated value is biased.
          If false, the value computed includes a correction factor to reduce bias.
  */
  @property void biased(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("biased", propval);
  }

  /**
      Get `minCount` property.
      Returns: If less than this many non-null values are observed, emit null.
  */
  @property uint minCount() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("min-count");
  }

  /**
      Set `minCount` property.
      Params:
        propval = If less than this many non-null values are observed, emit null.
  */
  @property void minCount(uint propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(uint)("min-count", propval);
  }

  /**
      Get `skipNulls` property.
      Returns: Whether NULLs are skipped or not.
  */
  @property bool skipNulls() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(bool)("skip-nulls");
  }

  /**
      Set `skipNulls` property.
      Params:
        propval = Whether NULLs are skipped or not.
  */
  @property void skipNulls(bool propval) nothrow
  {
    gobject.object.ObjectWrap.setProperty!(bool)("skip-nulls", propval);
  }

  /** */
  this() nothrow
  {
    GArrowSkewOptions* _cretval;
    _cretval = garrow_skew_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.skew_options.SkewOptions]
class SkewOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `biased` property.
      Params:
        propval = Whether the calculated value is biased.
          If false, the value computed includes a correction factor to reduce bias.
      Returns: Builder instance for fluent chaining
  */
  T biased(bool propval) nothrow
  {
    return setProperty("biased", propval);
  }

  /**
      Set `minCount` property.
      Params:
        propval = If less than this many non-null values are observed, emit null.
      Returns: Builder instance for fluent chaining
  */
  T minCount(uint propval) nothrow
  {
    return setProperty("min-count", propval);
  }

  /**
      Set `skipNulls` property.
      Params:
        propval = Whether NULLs are skipped or not.
      Returns: Builder instance for fluent chaining
  */
  T skipNulls(bool propval) nothrow
  {
    return setProperty("skip-nulls", propval);
  }
}

/// Fluent builder for [arrow.skew_options.SkewOptions]
final class SkewOptionsGidBuilder : SkewOptionsGidBuilderImpl!SkewOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SkewOptions build() nothrow
  {
    return new SkewOptions(cast(void*)createGObject(SkewOptions._getGType), Yes.Take);
  }
}
