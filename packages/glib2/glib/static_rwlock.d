/// Module for [StaticRWLock] class
module glib.static_rwlock;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    The #GStaticRWLock struct represents a read-write lock. A read-write
    lock can be used for protecting data that some portions of code only
    read from, while others also write. In such situations it is
    desirable that several readers can read at once, whereas of course
    only one writer may write at a time.
    
    Take a look at the following example:
    ```
      GStaticRWLock rwlock = G_STATIC_RW_LOCK_INIT;
      GPtrArray *array;
    
      gpointer
      my_array_get (guint index)
      {
        gpointer retval = NULL;
    
        if (!array)
          return NULL;
    
        g_static_rw_lock_reader_lock (&rwlock);
        if (index < array->len)
          retval = g_ptr_array_index (array, index);
        g_static_rw_lock_reader_unlock (&rwlock);
    
        return retval;
      }
    
      void
      my_array_set (guint index, gpointer data)
      {
        g_static_rw_lock_writer_lock (&rwlock);
    
        if (!array)
          array = g_ptr_array_new ();
    
        if (index >= array->len)
          g_ptr_array_set_size (array, index + 1);
        g_ptr_array_index (array, index) = data;
    
        g_static_rw_lock_writer_unlock (&rwlock);
      }
    ```
    
    This example shows an array which can be accessed by many readers
    (the my_array_get() function) simultaneously, whereas the writers
    (the my_array_set() function) will only be allowed once at a time
    and only if no readers currently access the array. This is because
    of the potentially dangerous resizing of the array. Using these
    functions is fully multi-thread safe now.
    
    Most of the time, writers should have precedence over readers. That
    means, for this implementation, that as soon as a writer wants to
    lock the data, no other reader is allowed to lock the data, whereas,
    of course, the readers that already have locked the data are allowed
    to finish their operation. As soon as the last reader unlocks the
    data, the writer will lock it.
    
    Even though #GStaticRWLock is not opaque, it should only be used
    with the following functions.
    
    All of the g_static_rw_lock_* functions can be used even if
    [glib.thread.Thread.init_] has not been called. Then they do nothing, apart
    from g_static_rw_lock_*_trylock, which does nothing but returning true.
    
    A read-write lock has a higher overhead than a mutex. For example, both
    [glib.static_rwlock.StaticRWLock.readerLock] and [glib.static_rwlock.StaticRWLock.readerUnlock] have
    to lock and unlock a #GStaticMutex, so it takes at least twice the time
    to lock and unlock a #GStaticRWLock that it does to lock and unlock a
    #GStaticMutex. So only data structures that are accessed by multiple
    readers, and which keep the lock for a considerable time justify a
    #GStaticRWLock. The above example most probably would fare better with a
    #GStaticMutex.

    Deprecated: Use a #GRWLock instead
*/
class StaticRWLock
{
  GStaticRWLock _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for glib.static_rwlock.StaticRWLock");

    _cInstance = *cast(GStaticRWLock*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }
}
