/// Module for [ThreadWrapper] class
module gda.thread_wrapper;

import gda.c.functions;
import gda.c.types;
import gda.types;
import gid.gid;
import glib.error;
import glib.iochannel;
import glib.types;
import gobject.object;
import gobject.value;

/** */
class ThreadWrapper : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gda_thread_wrapper_get_type != &gidSymbolNotFound ? gda_thread_wrapper_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ThreadWrapper self()
  {
    return this;
  }

  /**
      Creates a new #GdaThreadWrapper object
      Returns: a new #GdaThreadWrapper object, or null if threads are not supported/enabled
  */
  this()
  {
    GdaThreadWrapper* _cretval;
    _cretval = gda_thread_wrapper_new();
    this(_cretval, Yes.Take);
  }

  /** */
  static glib.types.Quark errorQuark()
  {
    glib.types.Quark _retval;
    _retval = gda_thread_wrapper_error_quark();
    return _retval;
  }

  /**
      Cancels a job not yet executed. This may fail for the following reasons:
      <itemizedlist>
       <listitem><para>the job id could not be found, either because it has already been treated or because
                       it does not exist or because it was created in another thread</para></listitem>
       <listitem><para>the job id is currently being treated by the worker thread</para></listitem>
      </itemizedlist>
  
      Params:
        id = the ID of a job as returned by [gda.thread_wrapper.ThreadWrapper.execute] or [gda.thread_wrapper.ThreadWrapper.executeVoid]
      Returns: true if the job has been cancelled, or false in any other case.
  */
  bool cancel(uint id)
  {
    bool _retval;
    _retval = cast(bool)gda_thread_wrapper_cancel(cast(GdaThreadWrapper*)this._cPtr, id);
    return _retval;
  }

  /**
      Connects a callback function to a signal for a particular object. The difference with g_signal_connect() and
      similar functions are:
      <itemizedlist>
       <listitem><para>the callback argument is not a #GCallback function, so the callback signature is not
         dependent on the signal itself</para></listitem>
       <listitem><para>the signal handler must not have to return any value</para></listitem>
       <listitem><para>the callback function will be called asynchronously, the caller may need to use
         [gda.thread_wrapper.ThreadWrapper.iterate] to get the notification</para></listitem>
       <listitem><para>if private_job and private_thread control in which case the signal is propagated.</para></listitem>
      </itemizedlist>
      
      Also note that signal handling is done asynchronously: when emitted in the worker thread, it
      will be "queued" to be processed in the user thread when it has the chance (when [gda.thread_wrapper.ThreadWrapper.iterate]
      is called directly or indirectly). The side effect is that the callback function is usually
      called long after the object emitting the signal has finished emitting it.
      
      To disconnect a signal handler, don't use any of the g_signal_handler_*() functions but the
      [gda.thread_wrapper.ThreadWrapper.disconnect] method.
  
      Params:
        instance = the instance to connect to
        sigName = a string of the form "signal-name::detail"
        privateThread = set to true if callback is to be invoked only if the signal has
             been emitted while in wrapper's private sub thread (ie. used when wrapper is executing some functions
             specified by [gda.thread_wrapper.ThreadWrapper.execute] or [gda.thread_wrapper.ThreadWrapper.executeVoid]), and to false if the
             callback is to be invoked whenever the signal is emitted, independently of the thread in which the
             signal is emitted.
        privateJob = set to true if callback is to be invoked only if the signal has
             been emitted when a job created for the calling thread is being executed, and to false
             if callback has to be called whenever the sig_name signal is emitted by instance. Note that
             this argument is not taken into account if private_thread is set to false.
        callback = a #GdaThreadWrapperCallback function
      Returns: the handler ID
  */
  gulong connectRaw(void* instance, string sigName, bool privateThread, bool privateJob, gda.types.ThreadWrapperCallback callback)
  {
    extern(C) void _callbackCallback(GdaThreadWrapper* wrapper, void* instance, const(char)* signame, int nParamValues, const(GValue)* paramValues, void* gdaReserved, void* data)
    {
      auto _dlg = cast(gda.types.ThreadWrapperCallback*)data;
      string _signame = signame.fromCString(No.Free);

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gda.thread_wrapper.ThreadWrapper)(cast(void*)wrapper, No.Take), instance, _signame, nParamValues, paramValues ? new gobject.value.Value(cast(void*)paramValues, No.Take) : null, gdaReserved);
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    gulong _retval;
    const(char)* _sigName = sigName.toCString(No.Alloc);
    auto _callback = callback ? cast(void*)&(callback) : null;
    _retval = gda_thread_wrapper_connect_raw(cast(GdaThreadWrapper*)this._cPtr, instance, _sigName, privateThread, privateJob, _callbackCB, _callback);
    return _retval;
  }

  /**
      Disconnects the emission of a signal, does the opposite of [gda.thread_wrapper.ThreadWrapper.connectRaw].
      
      As soon as this method returns, the callback function set when [gda.thread_wrapper.ThreadWrapper.connectRaw]
      was called will not be called anymore (even if the object has emitted the signal in the worker
      thread and this signal has not been handled in the user thread).
  
      Params:
        id = a handler ID, as returned by [gda.thread_wrapper.ThreadWrapper.connectRaw]
  */
  void disconnect(gulong id)
  {
    gda_thread_wrapper_disconnect(cast(GdaThreadWrapper*)this._cPtr, id);
  }

  /**
      Use this method to check if the execution of a function is finished. The function's execution must have
      been requested using [gda.thread_wrapper.ThreadWrapper.execute].
  
      Params:
        mayLock = TRUE if this funct must lock the caller untill a result is available
        expId = ID of the job for which a result is expected
      Returns: the pointer returned by the execution, or null if no result is available
      Throws: [ThreadWrapperException]
  */
  void* fetchResult(bool mayLock, uint expId)
  {
    GError *_err;
    auto _retval = gda_thread_wrapper_fetch_result(cast(GdaThreadWrapper*)this._cPtr, mayLock, expId, &_err);
    if (_err)
      throw new ThreadWrapperException(_err);
    return _retval;
  }

  /**
      Allow wrapper to notify when an execution job is finished, by making its exec ID
      readable through a new #GIOChannel. This function is useful when the notification needs
      to be included into a main loop. This also notifies that signals (emitted by objects in
      wrapper's internal thread) are available.
      
      The returned #GIOChannel will have something to read everytime an execution job is finished
      for an execution job submitted from the calling thread. The user whould read #GdaThreadNotification
      structures from the channel and analyse its contents to call [gda.thread_wrapper.ThreadWrapper.iterate]
      or [gda.thread_wrapper.ThreadWrapper.fetchResult].
      
      Note1: the new communication channel will only be operational for jobs submitted after this
      function returns, and for signals which have been connected after this function returns. A safe
      practice is to call this function before the wrapper object has been used.
      
      Note2: this function will return the same #GIOChannel everytime it's called from the same thread.
      
      Note3: if the usage of the returned #GIOChannel reveals an error, then [glib.iochannel.IOChannel.shutdown] and
      [glib.iochannel.IOChannel.unref] should be called on the #GIOChannel to let wrapper know it should not use
      that object anymore.
      Returns: a new #GIOChannel, or null if it could not be created
  */
  glib.iochannel.IOChannel getIoChannel()
  {
    GIOChannel* _cretval;
    _cretval = gda_thread_wrapper_get_io_channel(cast(GdaThreadWrapper*)this._cPtr);
    auto _retval = _cretval ? new glib.iochannel.IOChannel(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Use this method to query the number of functions which have been queued to be executed
      but which have not yet been executed.
      Returns: the number of jobs not yet executed
  */
  int getWaitingSize()
  {
    int _retval;
    _retval = gda_thread_wrapper_get_waiting_size(cast(GdaThreadWrapper*)this._cPtr);
    return _retval;
  }

  /**
      This method gives wrapper a chance to check if some functions to be executed have finished
      <emphasis>for the calling thread</emphasis>. In this case it handles the execution result and
      makes it ready to be processed using [gda.thread_wrapper.ThreadWrapper.fetchResult].
      
      This method also allows wrapper to handle signals which may have been emitted by objects
      while in the worker thread, and call the callback function specified when [gda.thread_wrapper.ThreadWrapper.connectRaw]
      was used.
      
      If may_block is true, then it will block untill there is one finished execution
      (functions returning void and signals are ignored regarding this argument).
  
      Params:
        mayBlock = whether the call may block
  */
  void iterate(bool mayBlock)
  {
    gda_thread_wrapper_iterate(cast(GdaThreadWrapper*)this._cPtr, mayBlock);
  }

  /**
      Requests that the signal which ID is id (which has been obtained using [gda.thread_wrapper.ThreadWrapper.connectRaw])
      be treated by the calling thread instead of by the thread in which [gda.thread_wrapper.ThreadWrapper.connectRaw]
      was called.
  
      Params:
        id = a signal ID
  */
  void stealSignal(gulong id)
  {
    gda_thread_wrapper_steal_signal(cast(GdaThreadWrapper*)this._cPtr, id);
  }

  /**
      Does the opposite of [gda.thread_wrapper.ThreadWrapper.getIoChannel]
  */
  void unsetIoChannel()
  {
    gda_thread_wrapper_unset_io_channel(cast(GdaThreadWrapper*)this._cPtr);
  }
}

class ThreadWrapperException : ErrorWrap
{
  this(GError* err)
  {
    super(err);
  }

  this(Code code, string msg)
  {
    super(gda.thread_wrapper.ThreadWrapper.errorQuark, cast(int)code, msg);
  }

  alias Code = ThreadWrapperError;
}
