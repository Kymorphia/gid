/// Module for [ThreadedResolver] class
module gio.threaded_resolver;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.resolver;
import gio.types;
import gobject.gid_builder;

/**
    #GThreadedResolver is an implementation of #GResolver which calls the libc
    lookup functions in threads to allow them to run asynchronously.
*/
class ThreadedResolver : gio.resolver.Resolver
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
    return cast(void function())g_threaded_resolver_get_type != &gidSymbolNotFound ? g_threaded_resolver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ThreadedResolver self()
  {
    return this;
  }

  /**
      Get builder for [gio.threaded_resolver.ThreadedResolver]
      Returns: New builder object
  */
  static ThreadedResolverGidBuilder builder()
  {
    return new ThreadedResolverGidBuilder;
  }
}

/// Fluent builder implementation template for [gio.threaded_resolver.ThreadedResolver]
class ThreadedResolverGidBuilderImpl(T) : gio.resolver.ResolverGidBuilderImpl!T
{
}

/// Fluent builder for [gio.threaded_resolver.ThreadedResolver]
final class ThreadedResolverGidBuilder : ThreadedResolverGidBuilderImpl!ThreadedResolverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThreadedResolver build()
  {
    return new ThreadedResolver(cast(void*)createGObject(ThreadedResolver._getGType), No.Take);
  }
}
