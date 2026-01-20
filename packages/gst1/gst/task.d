/// Module for [Task] class
module gst.task;

import gid.gid;
import glib.thread;
import gobject.object;
import gst.c.functions;
import gst.c.types;
import gst.object;
import gst.task_pool;
import gst.types;

/**
    #GstTask is used by #GstElement and #GstPad to provide the data passing
    threads in a #GstPipeline.
    
    A #GstPad will typically start a #GstTask to push or pull data to/from the
    peer pads. Most source elements start a #GstTask to push data. In some cases
    a demuxer element can start a #GstTask to pull data from a peer element. This
    is typically done when the demuxer can perform random access on the upstream
    peer element for improved performance.
    
    Although convenience functions exist on #GstPad to start/pause/stop tasks, it
    might sometimes be needed to create a #GstTask manually if it is not related to
    a #GstPad.
    
    Before the #GstTask can be run, it needs a #GRecMutex that can be set with
    [gst.task.Task.setLock].
    
    The task can be started, paused and stopped with [gst.task.Task.start], [gst.task.Task.pause]
    and [gst.task.Task.stop] respectively or with the [gst.task.Task.setState] function.
    
    A #GstTask will repeatedly call the #GstTaskFunction with the user data
    that was provided when creating the task with [gst.task.Task.new_]. While calling
    the function it will acquire the provided lock. The provided lock is released
    when the task pauses or stops.
    
    Stopping a task with [gst.task.Task.stop] will not immediately make sure the task is
    not running anymore. Use [gst.task.Task.join] to make sure the task is completely
    stopped and the thread is stopped.
    
    After creating a #GstTask, use [gst.object.ObjectWrap.unref] to free its resources. This can
    only be done when the task is not running anymore.
    
    Task functions can send a #GstMessage to send out-of-band data to the
    application. The application can receive messages from the #GstBus in its
    mainloop.
    
    For debugging purposes, the task will configure its object name as the thread
    name on Linux. Please note that the object name should be configured before the
    task is started; changing the object name after the task has been started, has
    no effect on the thread name.
*/
class Task : gst.object.ObjectWrap
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
    return cast(void function())gst_task_get_type != &gidSymbolNotFound ? gst_task_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Task self()
  {
    return this;
  }

  /**
      Create a new Task that will repeatedly call the provided func
      with user_data as a parameter. Typically the task will run in
      a new thread.
      
      The function cannot be changed after the task has been created. You
      must create a new #GstTask to change the function.
      
      This function will not yet create and start a thread. Use [gst.task.Task.start] or
      [gst.task.Task.pause] to create and start the GThread.
      
      Before the task can be used, a #GRecMutex must be configured using the
      [gst.task.Task.setLock] function. This lock will always be acquired while
      func is called.
  
      Params:
        func = The #GstTaskFunction to use
      Returns: A new #GstTask.
        
        MT safe.
  */
  this(gst.types.TaskFunction func)
  {
    extern(C) void _funcCallback(void* userData)
    {
      auto _dlg = cast(gst.types.TaskFunction*)userData;

      (*_dlg)();
    }
    auto _funcCB = func ? &_funcCallback : null;
    GstTask* _cretval;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _cretval = gst_task_new(_funcCB, _func, _funcDestroyCB);
    this(_cretval, Yes.Take);
  }

  /**
      Wait for all tasks to be stopped. This is mainly used internally
      to ensure proper cleanup of internal data structures in test suites.
      
      MT safe.
  */
  static void cleanupAll()
  {
    gst_task_cleanup_all();
  }

  /**
      Get the #GstTaskPool that this task will use for its streaming
      threads.
      
      MT safe.
      Returns: the #GstTaskPool used by task. [gst.object.ObjectWrap.unref]
        after usage.
  */
  gst.task_pool.TaskPool getPool()
  {
    GstTaskPool* _cretval;
    _cretval = gst_task_get_pool(cast(GstTask*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gst.task_pool.TaskPool)(cast(GstTaskPool*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Get the current state of the task.
      Returns: The #GstTaskState of the task
        
        MT safe.
  */
  gst.types.TaskState getState()
  {
    GstTaskState _cretval;
    _cretval = gst_task_get_state(cast(GstTask*)this._cPtr);
    gst.types.TaskState _retval = cast(gst.types.TaskState)_cretval;
    return _retval;
  }

  /**
      Joins task. After this call, it is safe to unref the task
      and clean up the lock set with [gst.task.Task.setLock].
      
      The task will automatically be stopped with this call.
      
      This function cannot be called from within a task function as this
      would cause a deadlock. The function will detect this and print a
      g_warning.
      Returns: true if the task could be joined.
        
        MT safe.
  */
  bool join()
  {
    bool _retval;
    _retval = cast(bool)gst_task_join(cast(GstTask*)this._cPtr);
    return _retval;
  }

  /**
      Pauses task. This method can also be called on a task in the
      stopped state, in which case a thread will be started and will remain
      in the paused state. This function does not wait for the task to complete
      the paused state.
      Returns: true if the task could be paused.
        
        MT safe.
  */
  bool pause()
  {
    bool _retval;
    _retval = cast(bool)gst_task_pause(cast(GstTask*)this._cPtr);
    return _retval;
  }

  /**
      Resume task in case it was paused. If the task was stopped, it will
      remain in that state and this function will return false.
      Returns: true if the task could be resumed.
        
        MT safe.
  */
  bool resume()
  {
    bool _retval;
    _retval = cast(bool)gst_task_resume(cast(GstTask*)this._cPtr);
    return _retval;
  }

  /**
      Call enter_func when the task function of task is entered. user_data will
      be passed to enter_func and notify will be called when user_data is no
      longer referenced.
  
      Params:
        enterFunc = a #GstTaskThreadFunc
  */
  void setEnterCallback(gst.types.TaskThreadFunc enterFunc)
  {
    extern(C) void _enterFuncCallback(GstTask* task, GThread* thread, void* userData)
    {
      auto _dlg = cast(gst.types.TaskThreadFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.task.Task)(cast(void*)task, No.Take), *cast(glib.thread.Thread*)thread);
    }
    auto _enterFuncCB = enterFunc ? &_enterFuncCallback : null;
    auto _enterFunc = enterFunc ? freezeDelegate(cast(void*)&enterFunc) : null;
    GDestroyNotify _enterFuncDestroyCB = enterFunc ? &thawDelegate : null;
    gst_task_set_enter_callback(cast(GstTask*)this._cPtr, _enterFuncCB, _enterFunc, _enterFuncDestroyCB);
  }

  /**
      Call leave_func when the task function of task is left. user_data will
      be passed to leave_func and notify will be called when user_data is no
      longer referenced.
  
      Params:
        leaveFunc = a #GstTaskThreadFunc
  */
  void setLeaveCallback(gst.types.TaskThreadFunc leaveFunc)
  {
    extern(C) void _leaveFuncCallback(GstTask* task, GThread* thread, void* userData)
    {
      auto _dlg = cast(gst.types.TaskThreadFunc*)userData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gst.task.Task)(cast(void*)task, No.Take), *cast(glib.thread.Thread*)thread);
    }
    auto _leaveFuncCB = leaveFunc ? &_leaveFuncCallback : null;
    auto _leaveFunc = leaveFunc ? freezeDelegate(cast(void*)&leaveFunc) : null;
    GDestroyNotify _leaveFuncDestroyCB = leaveFunc ? &thawDelegate : null;
    gst_task_set_leave_callback(cast(GstTask*)this._cPtr, _leaveFuncCB, _leaveFunc, _leaveFuncDestroyCB);
  }

  /**
      Set pool as the new GstTaskPool for task. Any new streaming threads that
      will be created by task will now use pool.
      
      MT safe.
  
      Params:
        pool = a #GstTaskPool
  */
  void setPool(gst.task_pool.TaskPool pool)
  {
    gst_task_set_pool(cast(GstTask*)this._cPtr, pool ? cast(GstTaskPool*)pool._cPtr(No.Dup) : null);
  }

  /**
      Sets the state of task to state.
      
      The task must have a lock associated with it using
      [gst.task.Task.setLock] when going to GST_TASK_STARTED or GST_TASK_PAUSED or
      this function will return false.
      
      MT safe.
  
      Params:
        state = the new task state
      Returns: true if the state could be changed.
  */
  bool setState(gst.types.TaskState state)
  {
    bool _retval;
    _retval = cast(bool)gst_task_set_state(cast(GstTask*)this._cPtr, state);
    return _retval;
  }

  /**
      Starts task. The task must have a lock associated with it using
      [gst.task.Task.setLock] or this function will return false.
      Returns: true if the task could be started.
        
        MT safe.
  */
  bool start()
  {
    bool _retval;
    _retval = cast(bool)gst_task_start(cast(GstTask*)this._cPtr);
    return _retval;
  }

  /**
      Stops task. This method merely schedules the task to stop and
      will not wait for the task to have completely stopped. Use
      [gst.task.Task.join] to stop and wait for completion.
      Returns: true if the task could be stopped.
        
        MT safe.
  */
  bool stop()
  {
    bool _retval;
    _retval = cast(bool)gst_task_stop(cast(GstTask*)this._cPtr);
    return _retval;
  }
}
