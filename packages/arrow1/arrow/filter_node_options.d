/// Module for [FilterNodeOptions] class
module arrow.filter_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.expression;
import arrow.types;
import gid.gid;
import gobject.gid_builder;

/** */
class FilterNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
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
    return cast(void function())garrow_filter_node_options_get_type != &gidSymbolNotFound ? garrow_filter_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override FilterNodeOptions self()
  {
    return this;
  }

  /**
  Get builder for [arrow.filter_node_options.FilterNodeOptions]
  Returns: New builder object
  */
  static FilterNodeOptionsGidBuilder builder()
  {
    return new FilterNodeOptionsGidBuilder;
  }

  /** */
  this(arrow.expression.Expression expression)
  {
    GArrowFilterNodeOptions* _cretval;
    _cretval = garrow_filter_node_options_new(expression ? cast(GArrowExpression*)expression._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}

class FilterNodeOptionsGidBuilderImpl(T) : arrow.execute_node_options.ExecuteNodeOptionsGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.filter_node_options.FilterNodeOptions]
final class FilterNodeOptionsGidBuilder : FilterNodeOptionsGidBuilderImpl!FilterNodeOptionsGidBuilder
{
  FilterNodeOptions build()
  {
    return new FilterNodeOptions(cast(void*)createGObject(FilterNodeOptions._getGType), Yes.Take);
  }
}
