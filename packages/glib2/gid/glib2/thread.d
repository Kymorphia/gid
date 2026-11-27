/// Module for [Thread] class
module gid.glib2.thread;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.error;
import gid.glib2.types;
import gid.gobject2.boxed;

/**
    The #GThread struct represents a running thread. This struct
    is returned by [gid.glib2.thread.Thread.new_] or [gid.glib2.thread.Thread.tryNew]. You can
    obtain the #GThread struct representing the current thread by
    calling [gid.glib2.thread.Thread.self].
    
    GThread is refcounted, see [gid.glib2.thread.Thread.ref_] and [gid.glib2.thread.Thread.unref].
    The thread represented by it holds a reference while it is running,
    and [gid.glib2.thread.Thread.join] consumes the reference that it is given, so
    it is normally not necessary to manage GThread references
    explicitly.
    
    The structure is opaque -- none of its fields may be directly
    accessed.
*/
@gidGir("Thread")
class Thread : gid.gobject2.boxed.BoxedWrap!(g_thread_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Thread self() nothrow
  {
    return this;
  }

  /**
      This function creates a new thread. The new thread starts by invoking
      func with the argument data. The thread will run until func returns
      or until [gid.glib2.thread.Thread.exit] is called from the new thread. The return value
      of func becomes the return value of the thread, which can be obtained
      with [gid.glib2.thread.Thread.join].
      
      The name can be useful for discriminating threads in a debugger.
      It is not used for other purposes and does not have to be unique.
      Some systems restrict the length of name to 16 bytes.
      
      If the thread can not be created the program aborts. See
      [gid.glib2.thread.Thread.tryNew] if you want to attempt to deal with failures.
      
      If you are using threads to offload (potentially many) short-lived tasks,
      #GThreadPool may be more appropriate than manually spawning and tracking
      multiple #GThreads.
      
      To free the struct returned by this function, use [gid.glib2.thread.Thread.unref].
      Note that [gid.glib2.thread.Thread.join] implicitly unrefs the #GThread as well.
      
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
  this(string name, gid.glib2.types.ThreadFunc func) nothrow
  {
    extern(C) void* _funcCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      void* _retval;
      auto _dlg = cast(gid.glib2.types.ThreadFunc*)data;

      try
      {
        _retval = (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.ThreadFunc");
      }
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    GThread* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    _cretval = g_thread_new(_name, _funcCB, _func);
    this(_cretval, Yes.Take);
  }

  /**
      This function is the same as [gid.glib2.thread.Thread.new_] except that
      it allows for the possibility of failure.
      
      If a thread can not be created (due to resource limits),
      error is set and null is returned.
  
      Params:
        name = an (optional) name for the new thread
        func = a function to execute in the new thread
      Returns: the new #GThread, or null if an error occurred
      Throws: [ThreadException]
  */
  static gid.glib2.thread.Thread tryNew(string name, gid.glib2.types.ThreadFunc func)
  {
    extern(C) void* _funcCallback(void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      void* _retval;
      auto _dlg = cast(gid.glib2.types.ThreadFunc*)data;

      try
      {
        _retval = (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.ThreadFunc");
      }
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    GThread* _cretval;
    const(char)* _name = name.toCString!(No.Malloc, Yes.Nullable);
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GError *_err;
    _cretval = g_thread_try_new(_name, _funcCB, _func, &_err);
    if (_err)
      throw new ThreadException(_err, Yes.Take);
    auto _retval = _cretval ? new gid.glib2.thread.Thread(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Gets the name of the thread.
      
      This function is intended for debugging purposes.
      Returns: the name of the thread
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_thread_get_name(cast(GThread*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Waits until thread finishes, i.e. the function func, as
      given to [gid.glib2.thread.Thread.new_], returns or [gid.glib2.thread.Thread.exit] is called.
      If thread has already terminated, then [gid.glib2.thread.Thread.join]
      returns immediately.
      
      Any thread can wait for any other thread by calling [gid.glib2.thread.Thread.join],
      not just its 'creator'. Calling [gid.glib2.thread.Thread.join] from multiple threads
      for the same thread leads to undefined behaviour.
      
      The value returned by func or given to [gid.glib2.thread.Thread.exit] is
      returned by this function.
      
      [gid.glib2.thread.Thread.join] consumes the reference to the passed-in thread.
      This will usually cause the #GThread struct and associated resources
      to be freed. Use [gid.glib2.thread.Thread.ref_] to obtain an extra reference if you
      want to keep the GThread alive beyond the [gid.glib2.thread.Thread.join] call.
      Returns: the return value of the thread
  */
  void* join() nothrow
  {
    auto _retval = g_thread_join(cast(GThread*)this._cPtr(Yes.Dup));
    return _retval;
  }

  /** */
  static gid.glib2.types.Quark errorQuark() nothrow
  {
    gid.glib2.types.Quark _retval;
    _retval = g_thread_error_quark();
    return _retval;
  }

  /**
      Terminates the current thread.
      
      If another thread is waiting for us using [gid.glib2.thread.Thread.join] then the
      waiting thread will be woken up and get retval as the return value
      of [gid.glib2.thread.Thread.join].
      
      Calling [gid.glib2.thread.Thread.exit] with a parameter retval is equivalent to
      returning retval from the function func, as given to [gid.glib2.thread.Thread.new_].
      
      You must only call [gid.glib2.thread.Thread.exit] from a thread that you created
      yourself with [gid.glib2.thread.Thread.new_] or related APIs. You must not call
      this function from a thread created with another threading library
      or or from within a #GThreadPool.
  
      Params:
        retval = the return value of this thread
  */
  static void exit(void* retval = null) nothrow
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
      as [gid.glib2.thread.Thread.join]) on these threads.
      Returns: the #GThread representing the current thread
  */
  static gid.glib2.thread.Thread self() nothrow
  {
    GThread* _cretval;
    _cretval = g_thread_self();
    auto _retval = _cretval ? new gid.glib2.thread.Thread(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Causes the calling thread to voluntarily relinquish the CPU, so
      that other threads can run.
      
      This function is often used as a method to make busy wait less evil.
  */
  static void yield() nothrow
  {
    g_thread_yield();
  }
}

class ThreadException : ErrorWrap
{
  this(GError* err, Flag!"Take" take) nothrow
  {
    super(err, take);
  }

  this(Code code, string msg) nothrow
  {
    super(gid.glib2.thread.Thread.errorQuark, cast(int)code, msg);
  }

  alias Code = ThreadError;
}
