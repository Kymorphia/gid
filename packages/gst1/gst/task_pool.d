/// Module for [TaskPool] class
module gst.task_pool;

import gid.gid;
import glib.error;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.types;

/**
    This object provides an abstraction for creating threads. The default
    implementation uses a regular GThreadPool to start tasks.
    
    Subclasses can be made to create custom threads.
*/
class TaskPool : gst.object.ObjectWrap
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
    return cast(void function())gst_task_pool_get_type != &gidSymbolNotFound ? gst_task_pool_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TaskPool self()
  {
    return this;
  }

  /**
      Create a new default task pool. The default task pool will use a regular
      GThreadPool for threads.
      Returns: a new #GstTaskPool. [gst.object.ObjectWrap.unref] after usage.
  */
  this()
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
  void cleanup()
  {
    gst_task_pool_cleanup(cast(GstTaskPool*)this._cPtr);
  }

  /**
      Dispose of the handle returned by [gst.task_pool.TaskPool.push]. This does
      not need to be called with the default implementation as the default
      #GstTaskPoolClass::push implementation always returns null. This does not need to be
      called either when calling [gst.task_pool.TaskPool.join], but should be called
      when joining is not necessary, but [gst.task_pool.TaskPool.push] returned a
      non-null value.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  */
  void disposeHandle(void* id = null)
  {
    gst_task_pool_dispose_handle(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Join a task and/or return it to the pool. id is the id obtained from
      [gst.task_pool.TaskPool.push]. The default implementation does nothing, as the
      default #GstTaskPoolClass::push implementation always returns null.
      
      This method should only be called with the same pool instance that provided
      id.
  
      Params:
        id = the id
  */
  void join(void* id = null)
  {
    gst_task_pool_join(cast(GstTaskPool*)this._cPtr, id);
  }

  /**
      Prepare the taskpool for accepting [gst.task_pool.TaskPool.push] operations.
      
      MT safe.
      Throws: [ErrorWrap]
  */
  void prepare()
  {
    GError *_err;
    gst_task_pool_prepare(cast(GstTaskPool*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
  }

  /**
      Start the execution of a new thread from pool.
  
      Params:
        func = the function to call
      Returns: a pointer that should be used
        for the gst_task_pool_join function. This pointer can be null, you
        must check error to detect errors. If the pointer is not null and
        [gst.task_pool.TaskPool.join] is not used, call [gst.task_pool.TaskPool.disposeHandle]
        instead.
      Throws: [ErrorWrap]
  */
  void* push(gst.types.TaskPoolFunction func)
  {
    extern(C) void _funcCallback(void* userData)
    {
      ptrThawGC(userData);
      auto _dlg = cast(gst.types.TaskPoolFunction*)userData;

      (*_dlg)();
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GError *_err;
    auto _retval = gst_task_pool_push(cast(GstTaskPool*)this._cPtr, _funcCB, _func, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
