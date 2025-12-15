/// Module for [Mutex] class
module glib.mutex;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    The #GMutex struct is an opaque data structure to represent a mutex
    (mutual exclusion). It can be used to protect data against shared
    access.
    
    Take for example the following function:
    ```c
      int
      give_me_next_number (void)
      {
        static int current_number = 0;
    
        // now do a very complicated calculation to calculate the new
        // number, this might for example be a random number generator
        current_number = calc_next_number (current_number);
    
        return current_number;
      }
    ```
    It is easy to see that this won't work in a multi-threaded
    application. There current_number must be protected against shared
    access. A #GMutex can be used as a solution to this problem:
    ```c
      int
      give_me_next_number (void)
      {
        static GMutex mutex;
        static int current_number = 0;
        int ret_val;
    
        g_mutex_lock (&mutex);
        ret_val = current_number = calc_next_number (current_number);
        g_mutex_unlock (&mutex);
    
        return ret_val;
      }
    ```
    Notice that the #GMutex is not initialised to any particular value.
    Its placement in static storage ensures that it will be initialised
    to all-zeros, which is appropriate.
    
    If a #GMutex is placed in other contexts (eg: embedded in a struct)
    then it must be explicitly initialised using [glib.mutex.Mutex.init_].
    
    A #GMutex should only be accessed via g_mutex_ functions.
*/
class Mutex
{
  GMutex cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.mutex.Mutex");

    cInstance = *cast(GMutex*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Frees the resources allocated to a mutex with [glib.mutex.Mutex.init_].
      
      This function should not be used with a #GMutex that has been
      statically allocated.
      
      Calling [glib.mutex.Mutex.clear] on a locked mutex leads to undefined
      behaviour.
  */
  void clear()
  {
    g_mutex_clear(cast(GMutex*)this._cPtr);
  }

  /**
      Initializes a #GMutex so that it can be used.
      
      This function is useful to initialize a mutex that has been
      allocated on the stack, or as part of a larger structure.
      It is not necessary to initialize a mutex that has been
      statically allocated.
      
      ```c
        typedef struct {
          GMutex m;
          ...
        } Blob;
      
      Blob *b;
      
      b = g_new (Blob, 1);
      g_mutex_init (&b->m);
      ```
      
      To undo the effect of [glib.mutex.Mutex.init_] when a mutex is no longer
      needed, use [glib.mutex.Mutex.clear].
      
      Calling [glib.mutex.Mutex.init_] on an already initialized #GMutex leads
      to undefined behaviour.
  */
  void init_()
  {
    g_mutex_init(cast(GMutex*)this._cPtr);
  }

  /**
      Locks mutex. If mutex is already locked by another thread, the
      current thread will block until mutex is unlocked by the other
      thread.
      
      #GMutex is neither guaranteed to be recursive nor to be
      non-recursive.  As such, calling [glib.mutex.Mutex.lock] on a #GMutex that has
      already been locked by the same thread results in undefined behaviour
      (including but not limited to deadlocks).
  */
  void lock()
  {
    g_mutex_lock(cast(GMutex*)this._cPtr);
  }

  /**
      Tries to lock mutex. If mutex is already locked by another thread,
      it immediately returns false. Otherwise it locks mutex and returns
      true.
      
      #GMutex is neither guaranteed to be recursive nor to be
      non-recursive.  As such, calling [glib.mutex.Mutex.lock] on a #GMutex that has
      already been locked by the same thread results in undefined behaviour
      (including but not limited to deadlocks or arbitrary return values).
      Returns: true if mutex could be locked
  */
  bool trylock()
  {
    bool _retval;
    _retval = cast(bool)g_mutex_trylock(cast(GMutex*)this._cPtr);
    return _retval;
  }

  /**
      Unlocks mutex. If another thread is blocked in a [glib.mutex.Mutex.lock]
      call for mutex, it will become unblocked and can lock mutex itself.
      
      Calling [glib.mutex.Mutex.unlock] on a mutex that is not locked by the
      current thread leads to undefined behaviour.
  */
  void unlock()
  {
    g_mutex_unlock(cast(GMutex*)this._cPtr);
  }
}
