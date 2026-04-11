/// Module for [ExecuteContext] class
module arrow.execute_context;

import arrow.c.functions;
import arrow.c.types;
import arrow.types;
import gid.gid;
import gobject.gid_builder;
import gobject.object;

/** */
class ExecuteContext : gobject.object.ObjectWrap
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
    return cast(void function())garrow_execute_context_get_type != &gidSymbolNotFound ? garrow_execute_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ExecuteContext self()
  {
    return this;
  }

  /**
      Get builder for [arrow.execute_context.ExecuteContext]
      Returns: New builder object
  */
  static ExecuteContextGidBuilder builder()
  {
    return new ExecuteContextGidBuilder;
  }

  /** */
  this()
  {
    GArrowExecuteContext* _cretval;
    _cretval = garrow_execute_context_new();
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.execute_context.ExecuteContext]
class ExecuteContextGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.execute_context.ExecuteContext]
final class ExecuteContextGidBuilder : ExecuteContextGidBuilderImpl!ExecuteContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ExecuteContext build()
  {
    return new ExecuteContext(cast(void*)createGObject(ExecuteContext._getGType), Yes.Take);
  }
}
