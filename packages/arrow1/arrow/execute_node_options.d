/// Module for [ExecuteNodeOptions] class
module arrow.execute_node_options;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ExecuteNodeOptions : gobject.object.ObjectWrap
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
    return cast(void function())garrow_execute_node_options_get_type != &gidSymbolNotFound ? garrow_execute_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExecuteNodeOptions self()
  {
    return this;
  }

  /**
  Get builder for [arrow.execute_node_options.ExecuteNodeOptions]
  Returns: New builder object
  */
  static ExecuteNodeOptionsGidBuilder builder()
  {
    return new ExecuteNodeOptionsGidBuilder;
  }
}

class ExecuteNodeOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T options(void* propval)
  {
    return setProperty("options", propval);
  }
}

/// Fluent builder for [arrow.execute_node_options.ExecuteNodeOptions]
final class ExecuteNodeOptionsGidBuilder : ExecuteNodeOptionsGidBuilderImpl!ExecuteNodeOptionsGidBuilder
{
  ExecuteNodeOptions build()
  {
    return new ExecuteNodeOptions(cast(void*)createGObject(ExecuteNodeOptions._getGType), No.Take);
  }
}
