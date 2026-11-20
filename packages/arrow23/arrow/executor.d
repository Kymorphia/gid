/// Module for [Executor] class
module arrow.executor;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class Executor : gobject.object.ObjectWrap
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
    return cast(void function())garrow_executor_get_type != &gidSymbolNotFound ? garrow_executor_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowExecutor";
  }

  /** Returns `this`, for use in `with` statements. */
  override Executor self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.executor.Executor]
      Returns: New builder object
  */
  static ExecutorGidBuilder builder() nothrow
  {
    return new ExecutorGidBuilder;
  }
}

/// Fluent builder implementation template for [arrow.executor.Executor]
class ExecutorGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /** */
  T executor(void* propval) nothrow
  {
    return setProperty("executor", propval);
  }
}

/// Fluent builder for [arrow.executor.Executor]
final class ExecutorGidBuilder : ExecutorGidBuilderImpl!ExecutorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Executor build() nothrow
  {
    return new Executor(cast(void*)createGObject(Executor._getGType), Yes.Take);
  }
}
