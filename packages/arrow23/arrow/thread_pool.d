/// Module for [ThreadPool] class
module arrow.thread_pool;

public import gid.basictypes;
import arrow.c.functions;
import arrow.c.types;
import arrow.executor;
import arrow.types;
import gid.gid;
import glib.error;
import gobject.gid_builder;

/** */
class ThreadPool : arrow.executor.Executor
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
    return cast(void function())garrow_thread_pool_get_type != &gidSymbolNotFound ? garrow_thread_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GArrowThreadPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override ThreadPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [arrow.thread_pool.ThreadPool]
      Returns: New builder object
  */
  static ThreadPoolGidBuilder builder() nothrow
  {
    return new ThreadPoolGidBuilder;
  }

  /** */
  this(uint nThreads)
  {
    GArrowThreadPool* _cretval;
    GError *_err;
    _cretval = garrow_thread_pool_new(nThreads, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    this(_cretval, Yes.Take);
  }
}

/// Fluent builder implementation template for [arrow.thread_pool.ThreadPool]
class ThreadPoolGidBuilderImpl(T) : arrow.executor.ExecutorGidBuilderImpl!T
{
}

/// Fluent builder for [arrow.thread_pool.ThreadPool]
final class ThreadPoolGidBuilder : ThreadPoolGidBuilderImpl!ThreadPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ThreadPool build() nothrow
  {
    return new ThreadPool(cast(void*)createGObject(ThreadPool._getGType), Yes.Take);
  }
}
