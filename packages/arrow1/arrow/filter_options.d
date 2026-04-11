/// Module for [FilterOptions] class
module arrow.filter_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.function_options;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class FilterOptions : arrow.function_options.FunctionOptions
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
    return cast(void function())garrow_filter_options_get_type != &gidSymbolNotFound ? garrow_filter_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.filter_options.FilterOptions]
      Returns: New builder object
  */
  static FilterOptionsGidBuilder builder()
  {
    return new FilterOptionsGidBuilder;
  }

  /**
      Get `nullSelectionBehavior` property.
      Returns: How to handle filtered values.
  */
  @property arrow.types.FilterNullSelectionBehavior nullSelectionBehavior()
  {
    return gobject.object.ObjectWrap.getProperty!(arrow.types.FilterNullSelectionBehavior)("null-selection-behavior");
  }

  /**
      Set `nullSelectionBehavior` property.
      Params:
        propval = How to handle filtered values.
  */
  @property void nullSelectionBehavior(arrow.types.FilterNullSelectionBehavior propval)
  {
    gobject.object.ObjectWrap.setProperty!(arrow.types.FilterNullSelectionBehavior)("null-selection-behavior", propval);
  }

  /** */
  this()
  {
    GArrowFilterOptions* _cretval;
    _cretval = garrow_filter_options_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.filter_options.FilterOptions]
class FilterOptionsGidBuilderImpl(T) : arrow.function_options.FunctionOptionsGidBuilderImpl!T
{

  /**
      Set `nullSelectionBehavior` property.
      Params:
        propval = How to handle filtered values.
      Returns: Builder instance for fluent chaining
  */
  T nullSelectionBehavior(arrow.types.FilterNullSelectionBehavior propval)
  {
    return setProperty("null-selection-behavior", propval);
  }
}

/// Fluent builder for [arrow.filter_options.FilterOptions]
final class FilterOptionsGidBuilder : FilterOptionsGidBuilderImpl!FilterOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  FilterOptions build()
  {
    return new FilterOptions(cast(void*)createGObject(FilterOptions._getGType), Yes.Take);
  }
}
