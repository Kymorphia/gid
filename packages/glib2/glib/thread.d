/// Module for [Thread] class
module glib.thread;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.error;
import glib.types;
import gobject.boxed;

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
class Thread : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_thread_get_type != &gidSymbolNotFound ? g_thread_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Thread self()
  {
    return this;
  }

  /**
      This function creates a new thread. The new thread starts by invoking
      func with the argument data. The thread will run until func returns
      or until [glib.thread.Thread.exit] is called from the new thread. The return value
      of func becomes the return value of the thread, which can be obtained
      with [glib.thread.Thread.join].
      
      The name can be useful for discriminating threads in a debugger.
      It is not used for other purposes and does not have to be unique.
      Some systems restrict the length of name to 16 bytes.
      
      If the thread can not be created the program aborts. See
      [glib.thread.Thread.tryNew] if you want to attempt to deal with failures.
      
      If you are using threads to offload (potentially many) short-lived tasks,
      #GThreadPool may be more appropriate than manually spawning and tracking
      multiple #GThreads.
      
      To free the struct returned by this function, use [glib.thread.Thread.unref].
      Note that [glib.thread.Thread.join] implicitly unrefs the #GThread as well.
      
      New threads by default inherit their scheduler policy (POSIX) or thread
      priority (Windows) of the thread creating the new thread.
      
      This behaviour changed in GLib 2.64: before threads on Windows were not
      inheriting the thread priority but were spawned with the default priority.
      Starting with GLib 2.64 the behaviour is now consistent between Windows and
      POSIX and all threads inherit their parent thread's priority.
  
      Params:
        name = an (optional) name for the new thread
        func = a function to execute in the new thread
      Returns: the new #GThread
  */
  this(string name, glib.types.ThreadFunc func)
  {
    extern(C) void* _funcCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.ThreadFunc*)data;

      void* _retval = (*_dlg)();
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    GThread* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    _cretval = g_thread_new(_name, _funcCB, _func);
    this(_cretval, Yes.Take);
  }

  /**
      This function is the same as [glib.thread.Thread.new_] except that
      it allows for the possibility of failure.
      
      If a thread can not be created (due to resource limits),
      error is set and null is returned.
  
      Params:
        name = an (optional) name for the new thread
        func = a function to execute in the new thread
      Returns: the new #GThread, or null if an error occurred
      Throws: [ThreadException]
  */
  static glib.thread.Thread tryNew(string name, glib.types.ThreadFunc func)
  {
    extern(C) void* _funcCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.ThreadFunc*)data;

      void* _retval = (*_dlg)();
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    GThread* _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GError *_err;
    _cretval = g_thread_try_new(_name, _funcCB, _func, &_err);
    if (_err)
      throw new ThreadException(_err);
    auto _retval = _cretval ? new glib.thread.Thread(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

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
    auto _retval = g_thread_join(cast(GThread*)this._cPtr);
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
    auto _retval = _cretval ? new glib.thread.Thread(cast(void*)_cretval, No.Take) : null;
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
