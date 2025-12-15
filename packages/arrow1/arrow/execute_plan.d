/// Module for [ExecutePlan] class
module arrow.execute_plan;

import arrow.aggregate_node_options;
import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node;
import arrow.execute_node_options;
import arrow.filter_node_options;
import arrow.hash_join_node_options;
import arrow.project_node_options;
import arrow.sink_node_options;
import arrow.source_node_options;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.object;

/** */
class ExecutePlan : gobject.object.ObjectWrap
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
    return cast(void function())garrow_execute_plan_get_type != &gidSymbolNotFound ? garrow_execute_plan_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExecutePlan self()
  {
    return this;
  }

  /** */
  this()
  {
    GArrowExecutePlan* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_new(&_err);
    if (_err)
      throw new ErrorWrap(_err);
    this(_cretval, Yes.Take);
  }

  /**
      This is a shortcut of [arrow.execute_plan.ExecutePlan.buildNode] for aggregate
      node.
  
      Params:
        input = A #GArrowExecuteNode.
        options = A #GArrowAggregateNodeOptions.
      Returns: A newly built and added #GArrowExecuteNode
          for aggregation on success, null on error.
      Throws: [ErrorWrap]
  */
  arrow.execute_node.ExecuteNode buildAggregateNode(arrow.execute_node.ExecuteNode input, arrow.aggregate_node_options.AggregateNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_aggregate_node(cast(GArrowExecutePlan*)this._cPtr, input ? cast(GArrowExecuteNode*)input._cPtr(No.Dup) : null, options ? cast(GArrowAggregateNodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.execute_node.ExecuteNode)(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is a shortcut of [arrow.execute_plan.ExecutePlan.buildNode] for filter
      node.
  
      Params:
        input = A #GArrowExecuteNode.
        options = A #GArrowFilterNodeOptions.
      Returns: A newly built and added #GArrowExecuteNode
          for filter on success, null on error.
      Throws: [ErrorWrap]
  */
  arrow.execute_node.ExecuteNode buildFilterNode(arrow.execute_node.ExecuteNode input, arrow.filter_node_options.FilterNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_filter_node(cast(GArrowExecutePlan*)this._cPtr, input ? cast(GArrowExecuteNode*)input._cPtr(No.Dup) : null, options ? cast(GArrowFilterNodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.execute_node.ExecuteNode)(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is a shortcut of [arrow.execute_plan.ExecutePlan.buildNode] for hash
      join node.
  
      Params:
        left = A left #GArrowExecuteNode.
        right = A right #GArrowExecuteNode.
        options = A #GArrowHashJoinNodeOptions.
      Returns: A newly built and added #GArrowExecuteNode
          for hash join on success, null on error.
      Throws: [ErrorWrap]
  */
  arrow.execute_node.ExecuteNode buildHashJoinNode(arrow.execute_node.ExecuteNode left, arrow.execute_node.ExecuteNode right, arrow.hash_join_node_options.HashJoinNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_hash_join_node(cast(GArrowExecutePlan*)this._cPtr, left ? cast(GArrowExecuteNode*)left._cPtr(No.Dup) : null, right ? cast(GArrowExecuteNode*)right._cPtr(No.Dup) : null, options ? cast(GArrowHashJoinNodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.execute_node.ExecuteNode)(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.execute_node.ExecuteNode buildNode(string factoryName, arrow.execute_node.ExecuteNode[] inputs, arrow.execute_node_options.ExecuteNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    const(char)* _factoryName = factoryName.toCString(No.Alloc);
    auto _inputs = gListFromD!(arrow.execute_node.ExecuteNode)(inputs);
    scope(exit) containerFree!(GList*, arrow.execute_node.ExecuteNode, GidOwnership.None)(_inputs);
    GError *_err;
    _cretval = garrow_execute_plan_build_node(cast(GArrowExecutePlan*)this._cPtr, _factoryName, _inputs, options ? cast(GArrowExecuteNodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.execute_node.ExecuteNode)(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is a shortcut of [arrow.execute_plan.ExecutePlan.buildNode] for project
      node.
  
      Params:
        input = A #GArrowExecuteNode.
        options = A #GArrowProjectNodeOptions.
      Returns: A newly built and added #GArrowExecuteNode
          for project on success, null on error.
      Throws: [ErrorWrap]
  */
  arrow.execute_node.ExecuteNode buildProjectNode(arrow.execute_node.ExecuteNode input, arrow.project_node_options.ProjectNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_project_node(cast(GArrowExecutePlan*)this._cPtr, input ? cast(GArrowExecuteNode*)input._cPtr(No.Dup) : null, options ? cast(GArrowProjectNodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.execute_node.ExecuteNode)(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is a shortcut of [arrow.execute_plan.ExecutePlan.buildNode] for sink
      node.
  
      Params:
        input = A #GArrowExecuteNode.
        options = A #GArrowSinkNodeOptions.
      Returns: A newly built and added #GArrowExecuteNode
          for sink on success, null on error.
      Throws: [ErrorWrap]
  */
  arrow.execute_node.ExecuteNode buildSinkNode(arrow.execute_node.ExecuteNode input, arrow.sink_node_options.SinkNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_sink_node(cast(GArrowExecutePlan*)this._cPtr, input ? cast(GArrowExecuteNode*)input._cPtr(No.Dup) : null, options ? cast(GArrowSinkNodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.execute_node.ExecuteNode)(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      This is a shortcut of [arrow.execute_plan.ExecutePlan.buildNode] for source
      node.
  
      Params:
        options = A #GArrowSourceNodeOptions.
      Returns: A newly built and added #GArrowExecuteNode
          for source on success, null on error.
      Throws: [ErrorWrap]
  */
  arrow.execute_node.ExecuteNode buildSourceNode(arrow.source_node_options.SourceNodeOptions options)
  {
    GArrowExecuteNode* _cretval;
    GError *_err;
    _cretval = garrow_execute_plan_build_source_node(cast(GArrowExecutePlan*)this._cPtr, options ? cast(GArrowSourceNodeOptions*)options._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.execute_node.ExecuteNode)(cast(GArrowExecuteNode*)_cretval, Yes.Take);
    return _retval;
  }

  /** */
  arrow.execute_node.ExecuteNode[] getNodes()
  {
    GList* _cretval;
    _cretval = garrow_execute_plan_get_nodes(cast(GArrowExecutePlan*)this._cPtr);
    auto _retval = gListToD!(arrow.execute_node.ExecuteNode, GidOwnership.None)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Starts this plan.
  */
  void start()
  {
    garrow_execute_plan_start(cast(GArrowExecutePlan*)this._cPtr);
  }

  /**
      Stops this plan.
  */
  void stop()
  {
    garrow_execute_plan_stop(cast(GArrowExecutePlan*)this._cPtr);
  }

  /** */
  bool validate()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_execute_plan_validate(cast(GArrowExecutePlan*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Waits for finishing this plan.
      Returns: true on success, false on error.
      Throws: [ErrorWrap]
  */
  bool wait()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)garrow_execute_plan_wait(cast(GArrowExecutePlan*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
