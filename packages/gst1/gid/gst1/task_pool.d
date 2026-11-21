/// Module for [TaskPool] class
module gid.gst1.task_pool;

public import gid.core.basictypes;
import gid.core.gid;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gst1.c.functions;
import gid.gst1.c.types;
import gid.gst1.object;
import gid.gst1.types;

/**
    This object provides an abstraction for creating threads. The default
    implementation uses a regular GThreadPool to start tasks.
    
    Subclasses can be made to create custom threads.
*/
class TaskPool : gid.gst1.object.ObjectWrap
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
    return cast(void function())gst_task_pool_get_type != &gidSymbolNotFound ? gst_task_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GstTaskPool";
  }

  /** Returns `this`, for use in `with` statements. */
  override TaskPool self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gst1.task_pool.TaskPool]
      Returns: New builder object
  */
  static TaskPoolGidBuilder builder() nothrow
  {
    return new TaskPoolGidBuilder;
  }

  /**
      Create a new default task pool. The default task pool will use a regular
      GThreadPool for threads.
      Returns: a new #GstTaskPool. [gid.gst1.object.ObjectWrap.unref] after usage.
  */
  this() nothrow
  {
    GstTaskPool* _cretval;
    _cretval = gst_task_pool_new();
    this(_cretval, Yes.Take);
  }

  /**
      Wait for all tasks to be stopped. This is mainly used internally
      to ensure proper cleanup of internal data structures in test suites.
      
      MT safe.
  */
  void cleanup() nothrow
  {
    gst_task_pool_cleanup(cast(GstTaskPool*)this._cPtr);
  }

  /**
      Dispose of the handle returned by [gid.gst1.task_pool.TaskPool.push]. This does
      not need to be called with the default implementation as the default
      #GstTaskPoolClass::push implementation always returns null. This does not need to be
      called either when calling [gid.gst1.task_pool.TaskPool.join], but should be called
      when joining is not necessary, but [gid.gst1.task_pool.TaskPool.push] returned a
      non-null value.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  */
  void disposeHandle(void* id = null) nothrow
  {
    gst_task_pool_dispose_handle(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Join a task and/or return it to the pool. id is the id obtained from
      [gid.gst1.task_pool.TaskPool.push]. The default implementation does nothing, as the
      default #GstTaskPoolClass::push implementation always returns null.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  */
  void join(void* id = null) nothrow
  {
    gst_task_pool_join(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Prepare the taskpool for accepting [gid.gst1.task_pool.TaskPool.push] operations.
      
      MT safe.
      Throws: [ErrorWrap]
  */
  void prepare()
  {
    GError *_err;
    gst_task_pool_prepare(cast(GstTaskPool*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
  }

  /**
      Start the execution of a new thread from pool.
  
      Params:
        func = the function to call
      Returns: a pointer that should be used
        for the gst_task_pool_join function. This pointer can be null, you
        must check error to detect errors. If the pointer is not null and
        [gid.gst1.task_pool.TaskPool.join] is not used, call [gid.gst1.task_pool.TaskPool.disposeHandle]
        instead.
      Throws: [ErrorWrap]
  */
  void* push(gid.gst1.types.TaskPoolFunction func)
  {
    extern(C) void _funcCallback(void* userData) nothrow
    {
      ptrThawGC(userData);
      auto _dlg = cast(gid.gst1.types.TaskPoolFunction*)userData;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gst1.types.TaskPoolFunction");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GError *_err;
    auto _retval = gst_task_pool_push(cast(GstTaskPool*)this._cPtr, _funcCB, _func, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gst1.task_pool.TaskPool]
class TaskPoolGidBuilderImpl(T) : gid.gst1.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gst1.task_pool.TaskPool]
final class TaskPoolGidBuilder : TaskPoolGidBuilderImpl!TaskPoolGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TaskPool build() nothrow
  {
    return new TaskPool(cast(void*)createGObject(TaskPool._getGType), Yes.Take);
  }
}
