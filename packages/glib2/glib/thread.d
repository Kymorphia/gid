/// Module for [Thread] struct
module glib.thread;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;

/**
    The #GThread struct represents a running thread. This struct
    is returned by [glib.thread.Thread.new_] or [glib.thread.Thread.tryNew]. You can
    obtain the #GThread struct representing the current thread by
    calling [glib.thread.Thread.self].
    
    GThread is refcounted, see [glib.thread.Thread.ref_] and [glib.thread.Thread.unref].
    The thread represented by it holds a reference while it is running,
    and [glib.thread.Thread.join] consumes the reference that it is given, so
    it is normally not necessary to manage GThread references
    explicitly.
    
    The structure is opaque -- none of its fields may be directly
    accessed.
*/
struct Thread
{
  /** */
  GThreadFunc func;

  /** */
  void* data;

  /** */
  gboolean joinable;

  /** */
  ThreadPriority priority;

  /**
      Waits until thread finishes, i.e. the function func, as
      given to [glib.thread.Thread.new_], returns or [glib.thread.Thread.exit] is called.
      If thread has already terminated, then [glib.thread.Thread.join]
      returns immediately.
      
      Any thread can wait for any other thread by calling [glib.thread.Thread.join],
      not just its 'creator'. Calling [glib.thread.Thread.join] from multiple threads
      for the same thread leads to undefined behaviour.
      
      The value returned by func or given to [glib.thread.Thread.exit] is
      returned by this function.
      
      [glib.thread.Thread.join] consumes the reference to the passed-in thread.
      This will usually cause the #GThread struct and associated resources
      to be freed. Use [glib.thread.Thread.ref_] to obtain an extra reference if you
      want to keep the GThread alive beyond the [glib.thread.Thread.join] call.
      Returns: the return value of the thread
  */
  void* join()
  {
    auto _retval = g_thread_join(cast(GThread*)&this);
    return _retval;
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = g_thread_error_quark();
    return _retval;
  }

  /**
      Terminates the current thread.
      
      If another thread is waiting for us using [glib.thread.Thread.join] then the
      waiting thread will be woken up and get retval as the return value
      of [glib.thread.Thread.join].
      
      Calling [glib.thread.Thread.exit] with a parameter retval is equivalent to
      returning retval from the function func, as given to [glib.thread.Thread.new_].
      
      You must only call [glib.thread.Thread.exit] from a thread that you created
      yourself with [glib.thread.Thread.new_] or related APIs. You must not call
      this function from a thread created with another threading library
      or or from within a #GThreadPool.
  
      Params:
        retval = the return value of this thread
  */
  static void exit(void* retval = null)
  {
    g_thread_exit(retval);
  }

  /**
      This function returns the #GThread corresponding to the
      current thread. Note that this function does not increase
      the reference count of the returned struct.
      
      This function will return a #GThread even for threads that
      were not created by GLib (i.e. those created by other threading
      APIs). This may be useful for thread identification purposes
      (i.e. comparisons) but you must not use GLib functions (such
      as [glib.thread.Thread.join]) on these threads.
      Returns: the #GThread representing the current thread
  */
  static glib.thread.Thread self()
  {
    GThread* _cretval;
    _cretval = g_thread_self();
    glib.thread.Thread _retval;
    if (_cretval)
      _retval = *cast(glib.thread.Thread*)_cretval;
    return _retval;
  }

  /**
      Causes the calling thread to voluntarily relinquish the CPU, so
      that other threads can run.
      
      This function is often used as a method to make busy wait less evil.
  */
  static void yield()
  {
    g_thread_yield();
  }
}

class ThreadException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(glib.thread.Thread.errorQuark, cast(int)code, msg);
  }

  alias Code = ThreadError;
}
