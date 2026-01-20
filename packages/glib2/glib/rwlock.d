/// Module for [RWLock] struct
module glib.rwlock;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.types;

/**
    The GRWLock struct is an opaque data structure to represent a
    reader-writer lock. It is similar to a #GMutex in that it allows
    multiple threads to coordinate access to a shared resource.
    
    The difference to a mutex is that a reader-writer lock discriminates
    between read-only ('reader') and full ('writer') access. While only
    one thread at a time is allowed write access (by holding the 'writer'
    lock via [glib.rwlock.RWLock.writerLock]), multiple threads can gain
    simultaneous read-only access (by holding the 'reader' lock via
    [glib.rwlock.RWLock.readerLock]).
    
    It is unspecified whether readers or writers have priority in acquiring the
    lock when a reader already holds the lock and a writer is queued to acquire
    it.
    
    Here is an example for an array with access functions:
    ```c
      GRWLock lock;
      GPtrArray *array;
    
      gpointer
      my_array_get (guint index)
      {
        gpointer retval = NULL;
    
        if (!array)
          return NULL;
    
        g_rw_lock_reader_lock (&lock);
        if (index < array->len)
          retval = g_ptr_array_index (array, index);
        g_rw_lock_reader_unlock (&lock);
    
        return retval;
      }
    
      void
      my_array_set (guint index, gpointer data)
      {
        g_rw_lock_writer_lock (&lock);
    
        if (!array)
          array = g_ptr_array_new ();
    
        if (index >= array->len)
          g_ptr_array_set_size (array, index+1);
        g_ptr_array_index (array, index) = data;
    
        g_rw_lock_writer_unlock (&lock);
      }
     ```
    This example shows an array which can be accessed by many readers
    (the my_array_get() function) simultaneously, whereas the writers
    (the my_array_set() function) will only be allowed one at a time
    and only if no readers currently access the array. This is because
    of the potentially dangerous resizing of the array. Using these
    functions is fully multi-thread safe now.
    
    If a #GRWLock is allocated in static storage then it can be used
    without initialisation.  Otherwise, you should call
    [glib.rwlock.RWLock.init_] on it and [glib.rwlock.RWLock.clear] when done.
    
    A GRWLock should only be accessed with the g_rw_lock_ functions.
*/
struct RWLock
{
  /** */
  void* p;

  /** */
  uint[2] i;

  /**
      Frees the resources allocated to a lock with [glib.rwlock.RWLock.init_].
      
      This function should not be used with a #GRWLock that has been
      statically allocated.
      
      Calling [glib.rwlock.RWLock.clear] when any thread holds the lock
      leads to undefined behaviour.
  */
  void clear()
  {
    g_rw_lock_clear(cast(GRWLock*)&this);
  }

  /**
      Initializes a #GRWLock so that it can be used.
      
      This function is useful to initialize a lock that has been
      allocated on the stack, or as part of a larger structure.  It is not
      necessary to initialise a reader-writer lock that has been statically
      allocated.
      
      ```c
        typedef struct {
          GRWLock l;
          ...
        } Blob;
      
      Blob *b;
      
      b = g_new (Blob, 1);
      g_rw_lock_init (&b->l);
      ```
      
      To undo the effect of [glib.rwlock.RWLock.init_] when a lock is no longer
      needed, use [glib.rwlock.RWLock.clear].
      
      Calling [glib.rwlock.RWLock.init_] on an already initialized #GRWLock leads
      to undefined behaviour.
  */
  void init_()
  {
    g_rw_lock_init(cast(GRWLock*)&this);
  }

  /**
      Obtain a read lock on rw_lock. If another thread currently holds
      the write lock on rw_lock, the current thread will block until the
      write lock was (held and) released. If another thread does not hold
      the write lock, but is waiting for it, it is implementation defined
      whether the reader or writer will block. Read locks can be taken
      recursively.
      
      Calling [glib.rwlock.RWLock.readerLock] while the current thread already
      owns a write lock leads to undefined behaviour. Read locks however
      can be taken recursively, in which case you need to make sure to
      call [glib.rwlock.RWLock.readerUnlock] the same amount of times.
      
      It is implementation-defined how many read locks are allowed to be
      held on the same lock simultaneously. If the limit is hit,
      or if a deadlock is detected, a critical warning will be emitted.
  */
  void readerLock()
  {
    g_rw_lock_reader_lock(cast(GRWLock*)&this);
  }

  /**
      Tries to obtain a read lock on rw_lock and returns true if
      the read lock was successfully obtained. Otherwise it
      returns false.
      Returns: true if rw_lock could be locked
  */
  bool readerTrylock()
  {
    bool _retval;
    _retval = cast(bool)g_rw_lock_reader_trylock(cast(GRWLock*)&this);
    return _retval;
  }

  /**
      Release a read lock on rw_lock.
      
      Calling [glib.rwlock.RWLock.readerUnlock] on a lock that is not held
      by the current thread leads to undefined behaviour.
  */
  void readerUnlock()
  {
    g_rw_lock_reader_unlock(cast(GRWLock*)&this);
  }

  /**
      Obtain a write lock on rw_lock. If another thread currently holds
      a read or write lock on rw_lock, the current thread will block
      until all other threads have dropped their locks on rw_lock.
      
      Calling [glib.rwlock.RWLock.writerLock] while the current thread already
      owns a read or write lock on rw_lock leads to undefined behaviour.
  */
  void writerLock()
  {
    g_rw_lock_writer_lock(cast(GRWLock*)&this);
  }

  /**
      Tries to obtain a write lock on rw_lock. If another thread
      currently holds a read or write lock on rw_lock, it immediately
      returns false.
      Otherwise it locks rw_lock and returns true.
      Returns: true if rw_lock could be locked
  */
  bool writerTrylock()
  {
    bool _retval;
    _retval = cast(bool)g_rw_lock_writer_trylock(cast(GRWLock*)&this);
    return _retval;
  }

  /**
      Release a write lock on rw_lock.
      
      Calling [glib.rwlock.RWLock.writerUnlock] on a lock that is not held
      by the current thread leads to undefined behaviour.
  */
  void writerUnlock()
  {
    g_rw_lock_writer_unlock(cast(GRWLock*)&this);
  }
}
