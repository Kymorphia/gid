/// Module for [ThreadedResolver] class
module gid.gio2.threaded_resolver;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.resolver;
import gid.gio2.types;
import gid.gobject2.gid_builder;

/**
    #GThreadedResolver is an implementation of #GResolver which calls the libc
    lookup functions in threads to allow them to run asynchronously.
*/
class ThreadedResolver : gid.gio2.resolver.Resolver
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_threaded_resolver_get_type != &gidSymbolNotFound ? g_threaded_resolver_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GThreadedResolver";
  }

  /** Returns `this`, for use in `with` statements. */
  override ThreadedResolver self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.threaded_resolver.ThreadedResolver]
      Returns: New builder object
  */
  static ThreadedResolverGidBuilder builder() nothrow
  {
    return new ThreadedResolverGidBuilder;
  }
}

/// Fluent builder implementation template for [gid.gio2.threaded_resolver.ThreadedResolver]
class ThreadedResolverGidBuilderImpl(T) : gid.gio2.resolver.ResolverGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.threaded_resolver.ThreadedResolver]
final class ThreadedResolverGidBuilder : ThreadedResolverGidBuilderImpl!ThreadedResolverGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThreadedResolver build() nothrow
  {
    return new ThreadedResolver(cast(void*)createGObject(ThreadedResolver._getGType), Yes.Take);
  }
}
