/// Module for [AsyncQueue] class
module glib.async_queue;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.time_val;
import glib.types;

/**
    An opaque data structure which represents an asynchronous queue.
    
    It should only be accessed through the `g_async_queue_*` functions.
*/
class AsyncQueue
{
  GAsyncQueue* _cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.async_queue.AsyncQueue");

    _cInstancePtr = cast(GAsyncQueue*)ptr;

    owned = take;
  }

  ~this()
  {
    if (owned)
      g_async_queue_unref(_cInstancePtr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)_cInstancePtr;
  }

  /**
      Returns the length of the queue.
      
      Actually this function returns the number of data items in
      the queue minus the number of waiting threads, so a negative
      value means waiting threads, and a positive value means available
      entries in the queue. A return value of 0 could mean n entries
      in the queue and n threads waiting. This can happen due to locking
      of the queue or due to scheduling.
      Returns: the length of the queue
  */
  int length()
  {
    int _retval;
    _retval = g_async_queue_length(cast(GAsyncQueue*)this._cPtr);
    return _retval;
  }

  /**
      Returns the length of the queue.
      
      Actually this function returns the number of data items in
      the queue minus the number of waiting threads, so a negative
      value means waiting threads, and a positive value means available
      entries in the queue. A return value of 0 could mean n entries
      in the queue and n threads waiting. This can happen due to locking
      of the queue or due to scheduling.
      
      This function must be called while holding the queue's lock.
      Returns: the length of the queue.
  */
  int lengthUnlocked()
  {
    int _retval;
    _retval = g_async_queue_length_unlocked(cast(GAsyncQueue*)this._cPtr);
    return _retval;
  }

  /**
      Acquires the queue's lock. If another thread is already
      holding the lock, this call will block until the lock
      becomes available.
      
      Call [glib.async_queue.AsyncQueue.unlock] to drop the lock again.
      
      While holding the lock, you can only call the
      g_async_queue_*_unlocked() functions on queue. Otherwise,
      deadlock may occur.
  */
  void lock()
  {
    g_async_queue_lock(cast(GAsyncQueue*)this._cPtr);
  }

  /**
      Pops data from the queue. If queue is empty, this function
      blocks until data becomes available.
      Returns: data from the queue
  */
  void* pop()
  {
    auto _retval = g_async_queue_pop(cast(GAsyncQueue*)this._cPtr);
    return _retval;
  }

  /**
      Pops data from the queue. If queue is empty, this function
      blocks until data becomes available.
      
      This function must be called while holding the queue's lock.
      Returns: data from the queue.
  */
  void* popUnlocked()
  {
    auto _retval = g_async_queue_pop_unlocked(cast(GAsyncQueue*)this._cPtr);
    return _retval;
  }

  /**
      Pushes the data into the queue.
      
      The data parameter must not be null.
  
      Params:
        data = data to push onto the queue
  */
  void push(void* data)
  {
    g_async_queue_push(cast(GAsyncQueue*)this._cPtr, data);
  }

  /**
      Pushes the item into the queue. item must not be null.
      In contrast to [glib.async_queue.AsyncQueue.push], this function
      pushes the new item ahead of the items already in the queue,
      so that it will be the next one to be popped off the queue.
  
      Params:
        item = data to push into the queue
  */
  void pushFront(void* item)
  {
    g_async_queue_push_front(cast(GAsyncQueue*)this._cPtr, item);
  }

  /**
      Pushes the item into the queue. item must not be null.
      In contrast to [glib.async_queue.AsyncQueue.pushUnlocked], this function
      pushes the new item ahead of the items already in the queue,
      so that it will be the next one to be popped off the queue.
      
      This function must be called while holding the queue's lock.
  
      Params:
        item = data to push into the queue
  */
  void pushFrontUnlocked(void* item)
  {
    g_async_queue_push_front_unlocked(cast(GAsyncQueue*)this._cPtr, item);
  }

  /**
      Inserts data into queue using func to determine the new
      position.
      
      This function requires that the queue is sorted before pushing on
      new elements, see [glib.async_queue.AsyncQueue.sort].
      
      This function will lock queue before it sorts the queue and unlock
      it when it is finished.
      
      For an example of func see [glib.async_queue.AsyncQueue.sort].
  
      Params:
        data = the data to push into the queue
        func = the #GCompareDataFunc is used to sort queue
  */
  void pushSorted(void* data, glib.types.CompareDataFunc func)
  {
    extern(C) int _funcCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_async_queue_push_sorted(cast(GAsyncQueue*)this._cPtr, data, _funcCB, _func);
  }

  /**
      Inserts data into queue using func to determine the new
      position.
      
      The sort function func is passed two elements of the queue.
      It should return 0 if they are equal, a negative value if the
      first element should be higher in the queue or a positive value
      if the first element should be lower in the queue than the second
      element.
      
      This function requires that the queue is sorted before pushing on
      new elements, see [glib.async_queue.AsyncQueue.sort].
      
      This function must be called while holding the queue's lock.
      
      For an example of func see [glib.async_queue.AsyncQueue.sort].
  
      Params:
        data = the data to push into the queue
        func = the #GCompareDataFunc is used to sort queue
  */
  void pushSortedUnlocked(void* data, glib.types.CompareDataFunc func)
  {
    extern(C) int _funcCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_async_queue_push_sorted_unlocked(cast(GAsyncQueue*)this._cPtr, data, _funcCB, _func);
  }

  /**
      Pushes the data into the queue.
      
      The data parameter must not be null.
      
      This function must be called while holding the queue's lock.
  
      Params:
        data = data to push onto the queue
  */
  void pushUnlocked(void* data)
  {
    g_async_queue_push_unlocked(cast(GAsyncQueue*)this._cPtr, data);
  }

  /**
      Increases the reference count of the asynchronous queue by 1.
  
      Deprecated: Reference counting is done atomically.
        so [glib.async_queue.AsyncQueue.ref_] can be used regardless of the queue's
        lock.
  */
  void refUnlocked()
  {
    g_async_queue_ref_unlocked(cast(GAsyncQueue*)this._cPtr);
  }

  /**
      Remove an item from the queue.
  
      Params:
        item = the data to remove from the queue
      Returns: true if the item was removed
  */
  bool remove(void* item)
  {
    bool _retval;
    _retval = cast(bool)g_async_queue_remove(cast(GAsyncQueue*)this._cPtr, item);
    return _retval;
  }

  /**
      Remove an item from the queue.
      
      This function must be called while holding the queue's lock.
  
      Params:
        item = the data to remove from the queue
      Returns: true if the item was removed
  */
  bool removeUnlocked(void* item = null)
  {
    bool _retval;
    _retval = cast(bool)g_async_queue_remove_unlocked(cast(GAsyncQueue*)this._cPtr, item);
    return _retval;
  }

  /**
      Sorts queue using func.
      
      The sort function func is passed two elements of the queue.
      It should return 0 if they are equal, a negative value if the
      first element should be higher in the queue or a positive value
      if the first element should be lower in the queue than the second
      element.
      
      This function will lock queue before it sorts the queue and unlock
      it when it is finished.
      
      If you were sorting a list of priority numbers to make sure the
      lowest priority would be at the top of the queue, you could use:
      ```c
       gint32 id1;
       gint32 id2;
      
       id1 = GPOINTER_TO_INT (element1);
       id2 = GPOINTER_TO_INT (element2);
      
       return (id1 > id2 ? +1 : id1 == id2 ? 0 : -1);
      ```
  
      Params:
        func = the #GCompareDataFunc is used to sort queue
  */
  void sort(glib.types.CompareDataFunc func)
  {
    extern(C) int _funcCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_async_queue_sort(cast(GAsyncQueue*)this._cPtr, _funcCB, _func);
  }

  /**
      Sorts queue using func.
      
      The sort function func is passed two elements of the queue.
      It should return 0 if they are equal, a negative value if the
      first element should be higher in the queue or a positive value
      if the first element should be lower in the queue than the second
      element.
      
      This function must be called while holding the queue's lock.
  
      Params:
        func = the #GCompareDataFunc is used to sort queue
  */
  void sortUnlocked(glib.types.CompareDataFunc func)
  {
    extern(C) int _funcCallback(const(void)* a, const(void)* b, void* userData)
    {
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      int _retval = (*_dlg)(a, b);
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_async_queue_sort_unlocked(cast(GAsyncQueue*)this._cPtr, _funcCB, _func);
  }

  /**
      Pops data from the queue. If the queue is empty, blocks until
      end_time or until data becomes available.
      
      If no data is received before end_time, null is returned.
      
      To easily calculate end_time, a combination of [glib.global.getRealTime]
      and [glib.time_val.TimeVal.add] can be used.
  
      Params:
        endTime = a #GTimeVal, determining the final time
      Returns: data from the queue or null, when no data is
          received before end_time.
  
      Deprecated: use [glib.async_queue.AsyncQueue.timeoutPop].
  */
  void* timedPop(glib.time_val.TimeVal endTime)
  {
    auto _retval = g_async_queue_timed_pop(cast(GAsyncQueue*)this._cPtr, cast(GTimeVal*)&endTime);
    return _retval;
  }

  /**
      Pops data from the queue. If the queue is empty, blocks until
      end_time or until data becomes available.
      
      If no data is received before end_time, null is returned.
      
      To easily calculate end_time, a combination of [glib.global.getRealTime]
      and [glib.time_val.TimeVal.add] can be used.
      
      This function must be called while holding the queue's lock.
  
      Params:
        endTime = a #GTimeVal, determining the final time
      Returns: data from the queue or null, when no data is
          received before end_time.
  
      Deprecated: use [glib.async_queue.AsyncQueue.timeoutPopUnlocked].
  */
  void* timedPopUnlocked(glib.time_val.TimeVal endTime)
  {
    auto _retval = g_async_queue_timed_pop_unlocked(cast(GAsyncQueue*)this._cPtr, cast(GTimeVal*)&endTime);
    return _retval;
  }

  /**
      Pops data from the queue. If the queue is empty, blocks for
      timeout microseconds, or until data becomes available.
      
      If no data is received before the timeout, null is returned.
  
      Params:
        timeout = the number of microseconds to wait
      Returns: data from the queue or null, when no data is
          received before the timeout.
  */
  void* timeoutPop(ulong timeout)
  {
    auto _retval = g_async_queue_timeout_pop(cast(GAsyncQueue*)this._cPtr, timeout);
    return _retval;
  }

  /**
      Pops data from the queue. If the queue is empty, blocks for
      timeout microseconds, or until data becomes available.
      
      If no data is received before the timeout, null is returned.
      
      This function must be called while holding the queue's lock.
  
      Params:
        timeout = the number of microseconds to wait
      Returns: data from the queue or null, when no data is
          received before the timeout.
  */
  void* timeoutPopUnlocked(ulong timeout)
  {
    auto _retval = g_async_queue_timeout_pop_unlocked(cast(GAsyncQueue*)this._cPtr, timeout);
    return _retval;
  }

  /**
      Tries to pop data from the queue. If no data is available,
      null is returned.
      Returns: data from the queue or null, when no data is
          available immediately.
  */
  void* tryPop()
  {
    auto _retval = g_async_queue_try_pop(cast(GAsyncQueue*)this._cPtr);
    return _retval;
  }

  /**
      Tries to pop data from the queue. If no data is available,
      null is returned.
      
      This function must be called while holding the queue's lock.
      Returns: data from the queue or null, when no data is
          available immediately.
  */
  void* tryPopUnlocked()
  {
    auto _retval = g_async_queue_try_pop_unlocked(cast(GAsyncQueue*)this._cPtr);
    return _retval;
  }

  /**
      Releases the queue's lock.
      
      Calling this function when you have not acquired
      the with [glib.async_queue.AsyncQueue.lock] leads to undefined
      behaviour.
  */
  void unlock()
  {
    g_async_queue_unlock(cast(GAsyncQueue*)this._cPtr);
  }

  /**
      Decreases the reference count of the asynchronous queue by 1
      and releases the lock. This function must be called while holding
      the queue's lock. If the reference count went to 0, the queue
      will be destroyed and the memory allocated will be freed.
  
      Deprecated: Reference counting is done atomically.
        so [glib.async_queue.AsyncQueue.unref] can be used regardless of the queue's
        lock.
  */
  void unrefAndUnlock()
  {
    g_async_queue_unref_and_unlock(cast(GAsyncQueue*)this._cPtr);
  }
}
