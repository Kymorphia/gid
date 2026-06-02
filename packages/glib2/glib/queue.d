/// Module for [Queue] class
module glib.queue;

public import gid.basictypes;
import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    Contains the public fields of a
    [Queue][glib-Double-ended-Queues].
*/
class Queue
{
  GQueue _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GQueue*)ptr;

    if (take)
      gFree(ptr);
  }

  ~this() nothrow
  {
    g_queue_free(&_cInstance);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `length` field.
      Returns: the number of elements in the queue
  */
  @property uint length() nothrow
  {
    return (cast(GQueue*)this._cPtr).length;
  }

  /**
      Set `length` field.
      Params:
        propval = the number of elements in the queue
  */
  @property void length(uint propval) nothrow
  {
    (cast(GQueue*)this._cPtr).length = propval;
  }

  /**
      Removes all the elements in queue. If queue elements contain
      dynamically-allocated memory, they should be freed first.
  */
  void clear() nothrow
  {
    g_queue_clear(cast(GQueue*)this._cPtr);
  }

  /**
      Convenience method, which frees all the memory used by a #GQueue,
      and calls the provided free_func on each item in the #GQueue.
  
      Params:
        freeFunc = the function to be called to free memory allocated
  */
  void clearFull(glib.types.DestroyNotify freeFunc = null) nothrow
  {
    extern(C) void _freeFuncCallback(void* data) nothrow
    {
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.DestroyNotify");
      }
    }
    auto _freeFuncCB = freeFunc ? &_freeFuncCallback : null;
    g_queue_clear_full(cast(GQueue*)this._cPtr, _freeFuncCB);
  }

  /**
      Calls func for each element in the queue passing user_data to the
      function.
      
      It is safe for func to remove the element from queue, but it must
      not modify any part of the queue after that element.
  
      Params:
        func = the function to call for each element's data
  */
  void foreach_(glib.types.Func func) nothrow
  {
    extern(C) void _funcCallback(void* data, void* userData) nothrow
    {
      auto _dlg = cast(glib.types.Func*)userData;

      try
      {
        (*_dlg)(data);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.Func");
      }
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_queue_foreach(cast(GQueue*)this._cPtr, _funcCB, _func);
  }

  /**
      Convenience method, which frees all the memory used by a #GQueue,
      and calls the specified destroy function on every element's data.
      
      free_func should not modify the queue (eg, by removing the freed
      element from it).
  
      Params:
        freeFunc = the function to be called to free each element's data
  */
  void freeFull(glib.types.DestroyNotify freeFunc) nothrow
  {
    extern(C) void _freeFuncCallback(void* data) nothrow
    {
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      try
      {
        (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.DestroyNotify");
      }
    }
    auto _freeFuncCB = freeFunc ? &_freeFuncCallback : null;
    g_queue_free_full(cast(GQueue*)this._cPtr, _freeFuncCB);
  }

  /**
      Returns the number of items in queue.
      Returns: the number of items in queue
  */
  uint getLength() nothrow
  {
    uint _retval;
    _retval = g_queue_get_length(cast(GQueue*)this._cPtr);
    return _retval;
  }

  /**
      Returns the position of the first element in queue which contains data.
  
      Params:
        data = the data to find
      Returns: the position of the first element in queue which
            contains data, or -1 if no element in queue contains data
  */
  int index(const(void)* data = null) nothrow
  {
    int _retval;
    _retval = g_queue_index(cast(GQueue*)this._cPtr, data);
    return _retval;
  }

  /**
      A statically-allocated #GQueue must be initialized with this function
      before it can be used. Alternatively you can initialize it with
      `G_QUEUE_INIT`. It is not necessary to initialize queues created with
      [glib.queue.Queue.new_].
  */
  void init_() nothrow
  {
    g_queue_init(cast(GQueue*)this._cPtr);
  }

  /**
      Inserts data into queue using func to determine the new position.
  
      Params:
        data = the data to insert
        func = the #GCompareDataFunc used to compare elements in the queue. It is
              called with two elements of the queue and user_data. It should
              return 0 if the elements are equal, a negative value if the first
              element comes before the second, and a positive value if the second
              element comes before the first.
  */
  void insertSorted(void* data, glib.types.CompareDataFunc func) nothrow
  {
    extern(C) int _funcCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      int _retval;
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      try
      {
        _retval = (*_dlg)(a, b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.CompareDataFunc");
      }
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? cast(void*)&(func) : null;
    g_queue_insert_sorted(cast(GQueue*)this._cPtr, data, _funcCB, _func);
  }

  /**
      Returns true if the queue is empty.
      Returns: true if the queue is empty
  */
  bool isEmpty() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_queue_is_empty(cast(GQueue*)this._cPtr);
    return _retval;
  }

  /**
      Returns the first element of the queue.
      Returns: the data of the first element in the queue, or null
            if the queue is empty
  */
  void* peekHead() nothrow
  {
    auto _retval = g_queue_peek_head(cast(GQueue*)this._cPtr);
    return _retval;
  }

  /**
      Returns the `n`'th element of queue.
  
      Params:
        n = the position of the element
      Returns: the data for the `n`'th element of queue,
            or null if `n` is off the end of queue
  */
  void* peekNth(uint n) nothrow
  {
    auto _retval = g_queue_peek_nth(cast(GQueue*)this._cPtr, n);
    return _retval;
  }

  /**
      Returns the last element of the queue.
      Returns: the data of the last element in the queue, or null
            if the queue is empty
  */
  void* peekTail() nothrow
  {
    auto _retval = g_queue_peek_tail(cast(GQueue*)this._cPtr);
    return _retval;
  }

  /**
      Removes the first element of the queue and returns its data.
      Returns: the data of the first element in the queue, or null
            if the queue is empty
  */
  void* popHead() nothrow
  {
    auto _retval = g_queue_pop_head(cast(GQueue*)this._cPtr);
    return _retval;
  }

  /**
      Removes the `n`'th element of queue and returns its data.
  
      Params:
        n = the position of the element
      Returns: the element's data, or null if `n` is off the end of queue
  */
  void* popNth(uint n) nothrow
  {
    auto _retval = g_queue_pop_nth(cast(GQueue*)this._cPtr, n);
    return _retval;
  }

  /**
      Removes the last element of the queue and returns its data.
      Returns: the data of the last element in the queue, or null
            if the queue is empty
  */
  void* popTail() nothrow
  {
    auto _retval = g_queue_pop_tail(cast(GQueue*)this._cPtr);
    return _retval;
  }

  /**
      Adds a new element at the head of the queue.
  
      Params:
        data = the data for the new element.
  */
  void pushHead(void* data = null) nothrow
  {
    g_queue_push_head(cast(GQueue*)this._cPtr, data);
  }

  /**
      Inserts a new element into queue at the given position.
  
      Params:
        data = the data for the new element
        n = the position to insert the new element. If `n` is negative or
              larger than the number of elements in the queue, the element is
              added to the end of the queue.
  */
  void pushNth(void* data, int n) nothrow
  {
    g_queue_push_nth(cast(GQueue*)this._cPtr, data, n);
  }

  /**
      Adds a new element at the tail of the queue.
  
      Params:
        data = the data for the new element
  */
  void pushTail(void* data = null) nothrow
  {
    g_queue_push_tail(cast(GQueue*)this._cPtr, data);
  }

  /**
      Removes the first element in queue that contains data.
  
      Params:
        data = the data to remove
      Returns: true if data was found and removed from queue
  */
  bool remove(const(void)* data = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_queue_remove(cast(GQueue*)this._cPtr, data);
    return _retval;
  }

  /**
      Remove all elements whose data equals data from queue.
  
      Params:
        data = the data to remove
      Returns: the number of elements removed from queue
  */
  uint removeAll(const(void)* data = null) nothrow
  {
    uint _retval;
    _retval = g_queue_remove_all(cast(GQueue*)this._cPtr, data);
    return _retval;
  }

  /**
      Reverses the order of the items in queue.
  */
  void reverse() nothrow
  {
    g_queue_reverse(cast(GQueue*)this._cPtr);
  }

  /**
      Sorts queue using compare_func.
  
      Params:
        compareFunc = the #GCompareDataFunc used to sort queue. This function
              is passed two elements of the queue and should return 0 if they are
              equal, a negative value if the first comes before the second, and
              a positive value if the second comes before the first.
  */
  void sort(glib.types.CompareDataFunc compareFunc) nothrow
  {
    extern(C) int _compareFuncCallback(const(void)* a, const(void)* b, void* userData) nothrow
    {
      int _retval;
      auto _dlg = cast(glib.types.CompareDataFunc*)userData;

      try
      {
        _retval = (*_dlg)(a, b);
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "glib.types.CompareDataFunc");
      }
      return _retval;
    }
    auto _compareFuncCB = compareFunc ? &_compareFuncCallback : null;
    auto _compareFunc = compareFunc ? cast(void*)&(compareFunc) : null;
    g_queue_sort(cast(GQueue*)this._cPtr, _compareFuncCB, _compareFunc);
  }
}
