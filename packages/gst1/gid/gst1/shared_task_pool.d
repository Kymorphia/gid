/// Module for [SharedTaskPool] class
module gid.gst1.shared_task_pool;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.task_pool;
import gid.gst1.types;

/**
    The #GstSharedTaskPool object.
*/
class SharedTaskPool : gid.gst1.task_pool.TaskPool
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_shared_task_pool_get_type != &gidSymbolNotFound ? gst_shared_task_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstSharedTaskPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override SharedTaskPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.shared_task_pool.SharedTaskPool]
      Returns: New builder object
  */
  static SharedTaskPoolGidBuilder builder() nothrow
  {
    return new SharedTaskPoolGidBuilder;
  }

  /**
      Create a new shared task pool. The shared task pool will queue tasks on
      a maximum number of threads, 1 by default.
      
      Do not use a #GstSharedTaskPool to manage potentially inter-dependent tasks such
      as pad tasks, as having one task waiting on another to return before returning
      would cause obvious deadlocks if they happen to share the same thread.
      Returns: a new #GstSharedTaskPool. [gid.gst1.object.ObjectWrap.unref] after usage.
  */
  this() nothrow
  {
    GstTaskPool* _cretval;
    _cretval = gst_shared_task_pool_new();
    this(_cretval, Yes.Take);
  }

  /** */
  uint getMaxThreads() nothrow
  {
    uint _retval;
    _retval = gst_shared_task_pool_get_max_threads(cast(GstSharedTaskPool*)this._cPtr);
    return _retval;
  }

  /**
      Update the maximal number of threads the pool may spawn. When
      the maximal number of threads is reduced, existing threads are not
      immediately shut down, see [gid.glib2.thread_pool.ThreadPool.setMaxThreads].
      
      Setting max_threads to 0 effectively freezes the pool.
  
      Params:
        maxThreads = Maximum number of threads to spawn.
  */
  void setMaxThreads(uint maxThreads) nothrow
  {
    gst_shared_task_pool_set_max_threads(cast(GstSharedTaskPool*)this._cPtr, maxThreads);
  }
}

/// Fluent builder implementation template for [gid.gst1.shared_task_pool.SharedTaskPool]
class SharedTaskPoolGidBuilderImpl(T) : gid.gst1.task_pool.TaskPoolGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.shared_task_pool.SharedTaskPool]
final class SharedTaskPoolGidBuilder : SharedTaskPoolGidBuilderImpl!SharedTaskPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SharedTaskPool build() nothrow
  {
    return new SharedTaskPool(cast(void*)createGObject(SharedTaskPool._getGType), Yes.Take);
  }
}
