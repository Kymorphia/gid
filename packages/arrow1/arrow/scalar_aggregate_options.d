/// Module for [ScalarAggregateOptions] class
module arrow.scalar_aggregate_options;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ScalarAggregateOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_scalar_aggregate_options_get_type != &gidSymbolNotFound ? garrow_scalar_aggregate_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ScalarAggregateOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.scalar_aggregate_options.ScalarAggregateOptions]
      Returns: New builder object
  */
  static ScalarAggregateOptionsGidBuilder builder() nothrow
  {
    return new ScalarAggregateOptionsGidBuilder;
  }

  /**
      Get `minCount` property.
      Returns: The minimum required number of values.
  */
  @property uint minCount() nothrow
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("min-count");
  }

  /**
      Set `minCount` property.
      Params:
        propval = The minimum required number of values.
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
    GArrowScalarAggregateOptions* _cretval;
    _cretval = garrow_scalar_aggregate_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.scalar_aggregate_options.ScalarAggregateOptions]
class ScalarAggregateOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `minCount` property.
      Params:
        propval = The minimum required number of values.
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

/// Fluent builder for [arrow.scalar_aggregate_options.ScalarAggregateOptions]
final class ScalarAggregateOptionsGidBuilder : ScalarAggregateOptionsGidBuilderImpl!ScalarAggregateOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ScalarAggregateOptions build() nothrow
  {
    return new ScalarAggregateOptions(cast(void*)createGObject(ScalarAggregateOptions._getGType), Yes.Take);
  }
}
