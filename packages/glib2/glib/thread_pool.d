/// Module for [ThreadPool] class
module glib.thread_pool;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;

/**
    The [glib.thread_pool.ThreadPool] struct represents a thread pool.
    
    A thread pool is useful when you wish to asynchronously fork out the execution of work
    and continue working in your own thread. If that will happen often, the overhead of starting
    and destroying a thread each time might be too high. In such cases reusing already started
    threads seems like a good idea. And it indeed is, but implementing this can be tedious
    and error-prone.
    
    Therefore GLib provides thread pools for your convenience. An added advantage is, that the
    threads can be shared between the different subsystems of your program, when they are using GLib.
    
    To create a new thread pool, you use [glib.thread_pool.ThreadPool.new_].
    It is destroyed by [glib.thread_pool.ThreadPool.free].
    
    If you want to execute a certain task within a thread pool, use [glib.thread_pool.ThreadPool.push].
    
    To get the current number of running threads you call [glib.thread_pool.ThreadPool.getNumThreads].
    To get the number of still unprocessed tasks you call [glib.thread_pool.ThreadPool.unprocessed].
    To control the maximum number of threads for a thread pool, you use
    [glib.thread_pool.ThreadPool.getMaxThreads]. and [glib.thread_pool.ThreadPool.setMaxThreads].
    
    Finally you can control the number of unused threads, that are kept alive by GLib for future use.
    The current number can be fetched with [glib.thread_pool.ThreadPool.getNumUnusedThreads].
    The maximum number can be controlled by [glib.thread_pool.ThreadPool.getMaxUnusedThreads] and
    [glib.thread_pool.ThreadPool.setMaxUnusedThreads]. All currently unused threads
    can be stopped by calling [glib.thread_pool.ThreadPool.stopUnusedThreads].
*/
class ThreadPool
{
  GThreadPool _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.thread_pool.ThreadPool");

    _cInstance = *cast(GThreadPool*)ptr;

    if (take)
      gFree(ptr);
  }

  ~this()
  {
    freePool(&_cInstance);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `func` field.
      Returns: the function to execute in the threads of this pool
  */
  @property GFunc func()
  {
    return (cast(GThreadPool*)this._cPtr).func;
  }

  /**
      Set `func` field.
      Params:
        propval = the function to execute in the threads of this pool
  */

  @property void func(GFunc propval)
  {
    (cast(GThreadPool*)this._cPtr).func = propval;
  }

  /**
      Get `exclusive` field.
      Returns: are all threads exclusive to this pool
  */
  @property bool exclusive()
  {
    return cast(bool)(cast(GThreadPool*)this._cPtr).exclusive;
  }

  /**
      Set `exclusive` field.
      Params:
        propval = are all threads exclusive to this pool
  */
  @property void exclusive(bool propval)
  {
    (cast(GThreadPool*)this._cPtr).exclusive = propval;
  }

  private static void freePool(GThreadPool* pool)
  {
    g_thread_pool_free(pool, true, false); // immediate, wait
  }



  /**
      Returns the maximal number of threads for pool.
      Returns: the maximal number of threads
  */
  int getMaxThreads()
  {
    int _retval;
    _retval = g_thread_pool_get_max_threads(cast(GThreadPool*)this._cPtr);
    return _retval;
  }

  /**
      Returns the number of threads currently running in pool.
      Returns: the number of threads currently running
  */
  uint getNumThreads()
  {
    uint _retval;
    _retval = g_thread_pool_get_num_threads(cast(GThreadPool*)this._cPtr);
    return _retval;
  }

  /**
      Moves the item to the front of the queue of unprocessed
      items, so that it will be processed next.
  
      Params:
        data = an unprocessed item in the pool
      Returns: true if the item was found and moved
  */
  bool moveToFront(void* data = null)
  {
    bool _retval;
    _retval = cast(bool)g_thread_pool_move_to_front(cast(GThreadPool*)this._cPtr, data);
    return _retval;
  }

  /**
      Inserts data into the list of tasks to be executed by pool.
      
      When the number of currently running threads is lower than the
      maximal allowed number of threads, a new thread is started (or
      reused) with the properties given to [glib.thread_pool.ThreadPool.new_].
      Otherwise, data stays in the queue until a thread in this pool
      finishes its previous task and processes data.
      
      error can be null to ignore errors, or non-null to report
      errors. An error can only occur when a new thread couldn't be
      created. In that case data is simply appended to the queue of
      work to do.
      
      Before version 2.32, this function did not return a success status.
  
      Params:
        data = a new task for pool
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool push(void* data = null)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_thread_pool_push(cast(GThreadPool*)this._cPtr, data, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Sets the maximal allowed number of threads for pool.
      A value of -1 means that the maximal number of threads
      is unlimited. If pool is an exclusive thread pool, setting
      the maximal number of threads to -1 is not allowed.
      
      Setting max_threads to 0 means stopping all work for pool.
      It is effectively frozen until max_threads is set to a non-zero
      value again.
      
      A thread is never terminated while calling func, as supplied by
      [glib.thread_pool.ThreadPool.new_]. Instead the maximal number of threads only
      has effect for the allocation of new threads in [glib.thread_pool.ThreadPool.push].
      A new thread is allocated, whenever the number of currently
      running threads in pool is smaller than the maximal number.
      
      error can be null to ignore errors, or non-null to report
      errors. An error can only occur when a new thread couldn't be
      created.
      
      Before version 2.32, this function did not return a success status.
  
      Params:
        maxThreads = a new maximal number of threads for pool,
              or -1 for unlimited
      Returns: true on success, false if an error occurred
      Throws: [ErrorWrap]
  */
  bool setMaxThreads(int maxThreads)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_thread_pool_set_max_threads(cast(GThreadPool*)this._cPtr, maxThreads, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Returns the number of tasks still unprocessed in pool.
      Returns: the number of unprocessed tasks
  */
  uint unprocessed()
  {
    uint _retval;
    _retval = g_thread_pool_unprocessed(cast(GThreadPool*)this._cPtr);
    return _retval;
  }

  /**
      This function will return the maximum interval that a
      thread will wait in the thread pool for new tasks before
      being stopped.
      
      If this function returns 0, threads waiting in the thread
      pool for new work are not stopped.
      Returns: the maximum interval (milliseconds) to wait
            for new tasks in the thread pool before stopping the
            thread
  */
  static uint getMaxIdleTime()
  {
    uint _retval;
    _retval = g_thread_pool_get_max_idle_time();
    return _retval;
  }

  /**
      Returns the maximal allowed number of unused threads.
      Returns: the maximal number of unused threads
  */
  static int getMaxUnusedThreads()
  {
    int _retval;
    _retval = g_thread_pool_get_max_unused_threads();
    return _retval;
  }

  /**
      Returns the number of currently unused threads.
      Returns: the number of currently unused threads
  */
  static uint getNumUnusedThreads()
  {
    uint _retval;
    _retval = g_thread_pool_get_num_unused_threads();
    return _retval;
  }

  /**
      This function will set the maximum interval that a thread
      waiting in the pool for new tasks can be idle for before
      being stopped. This function is similar to calling
      [glib.thread_pool.ThreadPool.stopUnusedThreads] on a regular timeout,
      except this is done on a per thread basis.
      
      By setting interval to 0, idle threads will not be stopped.
      
      The default value is 15000 (15 seconds).
  
      Params:
        interval = the maximum interval (in milliseconds)
              a thread can be idle
  */
  static void setMaxIdleTime(uint interval)
  {
    g_thread_pool_set_max_idle_time(interval);
  }

  /**
      Sets the maximal number of unused threads to max_threads.
      If max_threads is -1, no limit is imposed on the number
      of unused threads.
      
      The default value is 2.
  
      Params:
        maxThreads = maximal number of unused threads
  */
  static void setMaxUnusedThreads(int maxThreads)
  {
    g_thread_pool_set_max_unused_threads(maxThreads);
  }

  /**
      Stops all currently unused threads. This does not change the
      maximal number of unused threads. This function can be used to
      regularly stop all unused threads e.g. from [glib.global.timeoutAdd].
  */
  static void stopUnusedThreads()
  {
    g_thread_pool_stop_unused_threads();
  }
}
