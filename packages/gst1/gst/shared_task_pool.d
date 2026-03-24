/// Module for [SharedTaskPool] class
module gst.shared_task_pool;

import gid.gid;
import gobject.gid_builder;
import gst.c.functions;
import gst.c.types;
import gst.task_pool;
import gst.types;

/**
    The #GstSharedTaskPool object.
*/
class SharedTaskPool : gst.task_pool.TaskPool
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
    return cast(void function())gst_shared_task_pool_get_type != &gidSymbolNotFound ? gst_shared_task_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SharedTaskPool self()
  {
    return this;
  }

  /**
  Get builder for [gst.shared_task_pool.SharedTaskPool]
  Returns: New builder object
  */
  static SharedTaskPoolGidBuilder builder()
  {
    return new SharedTaskPoolGidBuilder;
  }

  /**
      Create a new shared task pool. The shared task pool will queue tasks on
      a maximum number of threads, 1 by default.
      
      Do not use a #GstSharedTaskPool to manage potentially inter-dependent tasks such
      as pad tasks, as having one task waiting on another to return before returning
      would cause obvious deadlocks if they happen to share the same thread.
      Returns: a new #GstSharedTaskPool. [gst.object.ObjectWrap.unref] after usage.
  */
  this()
  {
    GstTaskPool* _cretval;
    _cretval = gst_shared_task_pool_new();
    this(_cretval, Yes.Take);
  }

  /** */
  uint getMaxThreads()
  {
    uint _retval;
    _retval = gst_shared_task_pool_get_max_threads(cast(GstSharedTaskPool*)this._cPtr);
    return _retval;
  }

  /**
      Update the maximal number of threads the pool may spawn. When
      the maximal number of threads is reduced, existing threads are not
      immediately shut down, see [glib.thread_pool.ThreadPool.setMaxThreads].
      
      Setting max_threads to 0 effectively freezes the pool.
  
      Params:
        maxThreads = Maximum number of threads to spawn.
  */
  void setMaxThreads(uint maxThreads)
  {
    gst_shared_task_pool_set_max_threads(cast(GstSharedTaskPool*)this._cPtr, maxThreads);
  }
}

class SharedTaskPoolGidBuilderImpl(T) : gst.task_pool.TaskPoolGidBuilderImpl!T
{
}

/// Fluent builder for [gst.shared_task_pool.SharedTaskPool]
final class SharedTaskPoolGidBuilder : SharedTaskPoolGidBuilderImpl!SharedTaskPoolGidBuilder
{
  SharedTaskPool build()
  {
    return new SharedTaskPool(cast(void*)createGObject(SharedTaskPool._getGType), Yes.Take);
  }
}
