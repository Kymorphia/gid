/// Module for [IOSchedulerJob] class
module gio.ioscheduler_job;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.types;

/**
    Opaque class for defining and scheduling IO jobs.

    Deprecated: Use [glib.thread_pool.ThreadPool] or
        [gio.task.Task.runInThread]
*/
class IOSchedulerJob
{
  GIOSchedulerJob* cInstancePtr;
  bool owned;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gio.ioscheduler_job.IOSchedulerJob");

    cInstancePtr = cast(GIOSchedulerJob*)ptr;

    owned = take;
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)cInstancePtr;
  }

  /**
      Used from an I/O job to send a callback to be run in the thread
      that the job was started from, waiting for the result (and thus
      blocking the I/O job).
  
      Params:
        func = a #GSourceFunc callback that will be called in the original thread
      Returns: The return value of func
  
      Deprecated: Use [glib.main_context.MainContext.invoke].
  */
  bool sendToMainloop(glib.types.SourceFunc func)
  {
    extern(C) gboolean _funcCallback(void* userData)
    {
      auto _dlg = cast(glib.types.SourceFunc*)userData;

      gboolean _retval = (*_dlg)();
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
      
      Note that if you are passing the user_data from [gio.global.ioSchedulerPushJob]
      on to this function you have to ensure that it is not freed before
      func is called, either by passing null as notify to
      [gio.global.ioSchedulerPushJob] or by using refcounting for user_data.
  
      Params:
        func = a #GSourceFunc callback that will be called in the original thread
  
      Deprecated: Use [glib.main_context.MainContext.invoke].
  */
  void sendToMainloopAsync(glib.types.SourceFunc func)
  {
    extern(C) gboolean _funcCallback(void* userData)
    {
      auto _dlg = cast(glib.types.SourceFunc*)userData;

      gboolean _retval = (*_dlg)();
      return _retval;
    }
    auto _funcCB = func ? &_funcCallback : null;

    auto _func = func ? freezeDelegate(cast(void*)&func) : null;
    GDestroyNotify _funcDestroyCB = func ? &thawDelegate : null;
    g_io_scheduler_job_send_to_mainloop_async(cast(GIOSchedulerJob*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }
}
