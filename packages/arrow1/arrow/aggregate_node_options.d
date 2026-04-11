/// Module for [AggregateNodeOptions] class
module arrow.aggregate_node_options;

import arrow.aggregation;
import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class AggregateNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
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
    return cast(void function())garrow_aggregate_node_options_get_type != &gidSymbolNotFound ? garrow_aggregate_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override AggregateNodeOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.aggregate_node_options.AggregateNodeOptions]
      Returns: New builder object
  */
  static AggregateNodeOptionsGidBuilder builder()
  {
    return new AggregateNodeOptionsGidBuilder;
  }

  /** */
  this(arrow.aggregation.Aggregation[] aggregations, string[] keys = null)
  {
    GArrowAggregateNodeOptions* _cretval;
    auto _aggregations = gListFromD!(arrow.aggregation.Aggregation)(aggregations);
    scope(exit) containerFree!(GList*, arrow.aggregation.Aggregation, GidOwnership.None)(_aggregations);
    size_t _nKeys;
    if (keys)
      _nKeys = cast(size_t)keys.length;

    char*[] _tmpkeys;
    foreach (s; keys)
      _tmpkeys ~= s.toCString(No.Alloc);
    const(char*)* _keys = _tmpkeys.ptr;

    GError *_err;
    _cretval = garrow_aggregate_node_options_new(_aggregations, _keys, _nKeys, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.aggregate_node_options.AggregateNodeOptions]
class AggregateNodeOptionsGidBuilderImpl(T) : arrow.execute_node_options.ExecuteNodeOptionsGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.aggregate_node_options.AggregateNodeOptions]
final class AggregateNodeOptionsGidBuilder : AggregateNodeOptionsGidBuilderImpl!AggregateNodeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  AggregateNodeOptions build()
  {
    return new AggregateNodeOptions(cast(void*)createGObject(AggregateNodeOptions._getGType), Yes.Take);
  }
}
