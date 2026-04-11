/// Module for [SinkNodeOptions] class
module arrow.sink_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.execute_node_options;
import arrow.record_batch_reader;
import arrow.schema;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class SinkNodeOptions : arrow.execute_node_options.ExecuteNodeOptions
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
    return cast(void function())garrow_sink_node_options_get_type != &gidSymbolNotFound ? garrow_sink_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SinkNodeOptions self()
  {
    return this;
  }

  /**
      Get builder for [arrow.sink_node_options.SinkNodeOptions]
      Returns: New builder object
  */
  static SinkNodeOptionsGidBuilder builder()
  {
    return new SinkNodeOptionsGidBuilder;
  }

  /** */
  this()
  {
    GArrowSinkNodeOptions* _cretval;
    _cretval = garrow_sink_node_options_new();
    this(_cretval, Yes.Take);
  }

  /** */
  arrow.record_batch_reader.RecordBatchReader getReader(arrow.schema.Schema schema)
  {
    GArrowRecordBatchReader* _cretval;
    _cretval = garrow_sink_node_options_get_reader(cast(GArrowSinkNodeOptions*)this._cPtr, schema ? cast(GArrowSchema*)schema._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(arrow.record_batch_reader.RecordBatchReader)(cast(GArrowRecordBatchReader*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [arrow.sink_node_options.SinkNodeOptions]
class SinkNodeOptionsGidBuilderImpl(T) : arrow.execute_node_options.ExecuteNodeOptionsGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.sink_node_options.SinkNodeOptions]
final class SinkNodeOptionsGidBuilder : SinkNodeOptionsGidBuilderImpl!SinkNodeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SinkNodeOptions build()
  {
    return new SinkNodeOptions(cast(void*)createGObject(SinkNodeOptions._getGType), Yes.Take);
  }
}
