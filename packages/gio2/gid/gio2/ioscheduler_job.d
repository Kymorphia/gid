/// Module for [IOSchedulerJob] class
module gid.gio2.ioscheduler_job;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.types;

/**
    Opaque class for defining and scheduling IO jobs.

    Deprecated: Use [gid.glib2.thread_pool.ThreadPool] or
        [gid.gio2.task.Task.runInThread]
*/
@gidGir("IOSchedulerJob")
class IOSchedulerJob : OpaqueWrap!(GIOSchedulerJob*, void, void)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Used from an I/O job to send a callback to be run in the thread
      that the job was started from, waiting for the result (and thus
      blocking the I/O job).
  
      Params:
        func = a #GSourceFunc callback that will be called in the original thread
      Returns: The return value of func
  
      Deprecated: Use [gid.glib2.main_context.MainContext.invoke].
  */
  bool sendToMainloop(gid.glib2.types.SourceFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.glib2.types.SourceFunc*)userData;

      try
      {
        _dretval = (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.SourceFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    bool _retval;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    _retval = cast(bool)g_io_scheduler_job_send_to_mainloop(cast(GIOSchedulerJob*)this._cPtr, _funcCB, _func, _funcDestroyCB);
    return _retval;
  }

  /**
      Used from an I/O job to send a callback to be run asynchronously in
      the thread that the job was started from. The callback will be run
      when the main loop is available, but at that time the I/O job might
      have finished. The return value from the callback is ignored.
      
      Note that if you are passing the user_data from [gid.gio2.global.ioSchedulerPushJob]
      on to this function you have to ensure that it is not freed before
      func is called, either by passing null as notify to
      [gid.gio2.global.ioSchedulerPushJob] or by using refcounting for user_data.
  
      Params:
        func = a #GSourceFunc callback that will be called in the original thread
  
      Deprecated: Use [gid.glib2.main_context.MainContext.invoke].
  */
  void sendToMainloopAsync(gid.glib2.types.SourceFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(void* userData) nothrow
    {
      gidAttachThread();
      bool _dretval;
      auto _dlg = cast(gid.glib2.types.SourceFunc*)userData;

      try
      {
        _dretval = (*_dlg)();
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.glib2.types.SourceFunc");
      }
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;
    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    g_io_scheduler_job_send_to_mainloop_async(cast(GIOSchedulerJob*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }
}
