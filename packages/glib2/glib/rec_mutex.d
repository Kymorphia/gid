/// Module for [RecMutex] class
module glib.rec_mutex;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    The GRecMutex struct is an opaque data structure to represent a
    recursive mutex. It is similar to a #GMutex with the difference
    that it is possible to lock a GRecMutex multiple times in the same
    thread without deadlock. When doing so, care has to be taken to
    unlock the recursive mutex as often as it has been locked.
    
    If a #GRecMutex is allocated in static storage then it can be used
    without initialisation.  Otherwise, you should call
    [glib.rec_mutex.RecMutex.init_] on it and [glib.rec_mutex.RecMutex.clear] when done.
    
    A GRecMutex should only be accessed with the
    g_rec_mutex_ functions.
*/
class RecMutex
{
  GRecMutex cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.rec_mutex.RecMutex");

    cInstance = *cast(GRecMutex*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /**
      Frees the resources allocated to a recursive mutex with
      [glib.rec_mutex.RecMutex.init_].
      
      This function should not be used with a #GRecMutex that has been
      statically allocated.
      
      Calling [glib.rec_mutex.RecMutex.clear] on a locked recursive mutex leads
      to undefined behaviour.
  */
  void clear()
  {
    g_rec_mutex_clear(cast(GRecMutex*)this._cPtr);
  }

  /**
      Initializes a #GRecMutex so that it can be used.
      
      This function is useful to initialize a recursive mutex
      that has been allocated on the stack, or as part of a larger
      structure.
      
      It is not necessary to initialise a recursive mutex that has been
      statically allocated.
      
      ```c
        typedef struct {
          GRecMutex m;
          ...
        } Blob;
      
      Blob *b;
      
      b = g_new (Blob, 1);
      g_rec_mutex_init (&b->m);
      ```
      
      Calling [glib.rec_mutex.RecMutex.init_] on an already initialized #GRecMutex
      leads to undefined behaviour.
      
      To undo the effect of [glib.rec_mutex.RecMutex.init_] when a recursive mutex
      is no longer needed, use [glib.rec_mutex.RecMutex.clear].
  */
  void init_()
  {
    g_rec_mutex_init(cast(GRecMutex*)this._cPtr);
  }

  /**
      Locks rec_mutex. If rec_mutex is already locked by another
      thread, the current thread will block until rec_mutex is
      unlocked by the other thread. If rec_mutex is already locked
      by the current thread, the 'lock count' of rec_mutex is increased.
      The mutex will only become available again when it is unlocked
      as many times as it has been locked.
  */
  void lock()
  {
    g_rec_mutex_lock(cast(GRecMutex*)this._cPtr);
  }

  /**
      Tries to lock rec_mutex. If rec_mutex is already locked
      by another thread, it immediately returns false. Otherwise
      it locks rec_mutex and returns true.
      Returns: true if rec_mutex could be locked
  */
  bool trylock()
  {
    bool _retval;
    _retval = cast(bool)g_rec_mutex_trylock(cast(GRecMutex*)this._cPtr);
    return _retval;
  }

  /**
      Unlocks rec_mutex. If another thread is blocked in a
      [glib.rec_mutex.RecMutex.lock] call for rec_mutex, it will become unblocked
      and can lock rec_mutex itself.
      
      Calling [glib.rec_mutex.RecMutex.unlock] on a recursive mutex that is not
      locked by the current thread leads to undefined behaviour.
  */
  void unlock()
  {
    g_rec_mutex_unlock(cast(GRecMutex*)this._cPtr);
  }
}
