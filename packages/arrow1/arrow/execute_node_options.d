/// Module for [ExecuteNodeOptions] class
module arrow.execute_node_options;

public import gid.basictypes;
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
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_execute_node_options_get_type != &gidSymbolNotFound ? garrow_execute_node_options_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExecuteNodeOptions self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.execute_node_options.ExecuteNodeOptions]
      Returns: New builder object
  */
  static ExecuteNodeOptionsGidBuilder builder() nothrow
  {
    return new ExecuteNodeOptionsGidBuilder;
  }
}

/// Fluent builder implementation template for [arrow.execute_node_options.ExecuteNodeOptions]
class ExecuteNodeOptionsGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T options(void* propval) nothrow
  {
    return setProperty("options", propval);
  }
}

/// Fluent builder for [arrow.execute_node_options.ExecuteNodeOptions]
final class ExecuteNodeOptionsGidBuilder : ExecuteNodeOptionsGidBuilderImpl!ExecuteNodeOptionsGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ExecuteNodeOptions build() nothrow
  {
    return new ExecuteNodeOptions(cast(void*)createGObject(ExecuteNodeOptions._getGType), No.Take);
  }
}
