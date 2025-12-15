/// Module for [Cancellable] class
module gio.cancellable;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.source;
import glib.types;
import gobject.dclosure;
import gobject.object;

/**
    [gio.cancellable.Cancellable] allows operations to be cancelled.
    
    [gio.cancellable.Cancellable] is a thread-safe operation cancellation stack used
    throughout GIO to allow for cancellation of synchronous and
    asynchronous operations.
*/
class Cancellable : gobject.object.ObjectWrap
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
    return cast(void function())g_cancellable_get_type != &gidSymbolNotFound ? g_cancellable_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Cancellable self()
  {
    return this;
  }

  /**
      Creates a new #GCancellable object.
      
      Applications that want to start one or more operations
      that should be cancellable should create a #GCancellable
      and pass it to the operations.
      
      One #GCancellable can be used in multiple consecutive
      operations or in multiple concurrent operations.
      Returns: a #GCancellable.
  */
  this()
  {
    GCancellable* _cretval;
    _cretval = g_cancellable_new();
    this(_cretval, Yes.Take);
  }

  /**
      Gets the top cancellable from the stack.
      Returns: a #GCancellable from the top
        of the stack, or null if the stack is empty.
  */
  static gio.cancellable.Cancellable getCurrent()
  {
    GCancellable* _cretval;
    _cretval = g_cancellable_get_current();
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.cancellable.Cancellable)(cast(GCancellable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Will set cancellable to cancelled, and will emit the
      #GCancellable::cancelled signal. (However, see the warning about
      race conditions in the documentation for that signal if you are
      planning to connect to it.)
      
      This function is thread-safe. In other words, you can safely call
      it from a thread other than the one running the operation that was
      passed the cancellable.
      
      If cancellable is null, this function returns immediately for convenience.
      
      The convention within GIO is that cancelling an asynchronous
      operation causes it to complete asynchronously. That is, if you
      cancel the operation from the same thread in which it is running,
      then the operation's #GAsyncReadyCallback will not be invoked until
      the application returns to the main loop.
  */
  void cancel()
  {
    g_cancellable_cancel(cast(GCancellable*)this._cPtr);
  }

  /**
      Disconnects a handler from a cancellable instance similar to
      [gobject.global.signalHandlerDisconnect].  Additionally, in the event that a
      signal handler is currently running, this call will block until the
      handler has finished.  Calling this function from a
      #GCancellable::cancelled signal handler will therefore result in a
      deadlock.
      
      This avoids a race condition where a thread cancels at the
      same time as the cancellable operation is finished and the
      signal handler is removed. See #GCancellable::cancelled for
      details on how to use this.
      
      If cancellable is null or handler_id is `0` this function does
      nothing.
  
      Params:
        handlerId = Handler id of the handler to be disconnected, or `0`.
  */
  void disconnect(gulong handlerId)
  {
    g_cancellable_disconnect(cast(GCancellable*)this._cPtr, handlerId);
  }

  /**
      Gets the file descriptor for a cancellable job. This can be used to
      implement cancellable operations on Unix systems. The returned fd will
      turn readable when cancellable is cancelled.
      
      You are not supposed to read from the fd yourself, just check for
      readable status. Reading to unset the readable status is done
      with [gio.cancellable.Cancellable.reset].
      
      After a successful return from this function, you should use
      [gio.cancellable.Cancellable.releaseFd] to free up resources allocated for
      the returned file descriptor.
      
      See also [gio.cancellable.Cancellable.makePollfd].
      Returns: A valid file descriptor. `-1` if the file descriptor
        is not supported, or on errors.
  */
  int getFd()
  {
    int _retval;
    _retval = g_cancellable_get_fd(cast(GCancellable*)this._cPtr);
    return _retval;
  }

  /**
      Checks if a cancellable job has been cancelled.
      Returns: true if cancellable is cancelled,
        FALSE if called with null or if item is not cancelled.
  */
  bool isCancelled()
  {
    bool _retval;
    _retval = cast(bool)g_cancellable_is_cancelled(cast(GCancellable*)this._cPtr);
    return _retval;
  }

  /**
      Creates a #GPollFD corresponding to cancellable; this can be passed
      to [glib.global.poll] and used to poll for cancellation. This is useful both
      for unix systems without a native poll and for portability to
      windows.
      
      When this function returns true, you should use
      [gio.cancellable.Cancellable.releaseFd] to free up resources allocated for the
      pollfd. After a false return, do not call [gio.cancellable.Cancellable.releaseFd].
      
      If this function returns false, either no cancellable was given or
      resource limits prevent this function from allocating the necessary
      structures for polling. (On Linux, you will likely have reached
      the maximum number of file descriptors.) The suggested way to handle
      these cases is to ignore the cancellable.
      
      You are not supposed to read from the fd yourself, just check for
      readable status. Reading to unset the readable status is done
      with [gio.cancellable.Cancellable.reset].
  
      Params:
        pollfd = a pointer to a #GPollFD
      Returns: true if pollfd was successfully initialized, false on
                 failure to prepare the cancellable.
  */
  bool makePollfd(glib.types.PollFD pollfd)
  {
    bool _retval;
    _retval = cast(bool)g_cancellable_make_pollfd(cast(GCancellable*)this._cPtr, &pollfd);
    return _retval;
  }

  /**
      Pops cancellable off the cancellable stack (verifying that cancellable
      is on the top of the stack).
  */
  void popCurrent()
  {
    g_cancellable_pop_current(cast(GCancellable*)this._cPtr);
  }

  /**
      Pushes cancellable onto the cancellable stack. The current
      cancellable can then be received using [gio.cancellable.Cancellable.getCurrent].
      
      This is useful when implementing cancellable operations in
      code that does not allow you to pass down the cancellable object.
      
      This is typically called automatically by e.g. #GFile operations,
      so you rarely have to call this yourself.
  */
  void pushCurrent()
  {
    g_cancellable_push_current(cast(GCancellable*)this._cPtr);
  }

  /**
      Releases a resources previously allocated by [gio.cancellable.Cancellable.getFd]
      or [gio.cancellable.Cancellable.makePollfd].
      
      For compatibility reasons with older releases, calling this function
      is not strictly required, the resources will be automatically freed
      when the cancellable is finalized. However, the cancellable will
      block scarce file descriptors until it is finalized if this function
      is not called. This can cause the application to run out of file
      descriptors when many #GCancellables are used at the same time.
  */
  void releaseFd()
  {
    g_cancellable_release_fd(cast(GCancellable*)this._cPtr);
  }

  /**
      Resets cancellable to its uncancelled state.
      
      If cancellable is currently in use by any cancellable operation
      then the behavior of this function is undefined.
      
      Note that it is generally not a good idea to reuse an existing
      cancellable for more operations after it has been cancelled once,
      as this function might tempt you to do. The recommended practice
      is to drop the reference to a cancellable after cancelling it,
      and let it die with the outstanding async operations. You should
      create a fresh cancellable for further async operations.
  */
  void reset()
  {
    g_cancellable_reset(cast(GCancellable*)this._cPtr);
  }

  /**
      If the cancellable is cancelled, sets the error to notify
      that the operation was cancelled.
      Returns: true if cancellable was cancelled, false if it was not
      Throws: [ErrorWrap]
  */
  bool setErrorIfCancelled()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_cancellable_set_error_if_cancelled(cast(GCancellable*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Creates a source that triggers if cancellable is cancelled and
      calls its callback of type #GCancellableSourceFunc. This is
      primarily useful for attaching to another (non-cancellable) source
      with [glib.source.Source.addChildSource] to add cancellability to it.
      
      For convenience, you can call this with a null #GCancellable,
      in which case the source will never trigger.
      
      The new #GSource will hold a reference to the #GCancellable.
      Returns: the new #GSource.
  */
  glib.source.Source sourceNew()
  {
    GSource* _cretval;
    _cretval = g_cancellable_source_new(cast(GCancellable*)this._cPtr);
    auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Connect to `Cancelled` signal.
  
      Emitted when the operation has been cancelled.
      
      Can be used by implementations of cancellable operations. If the
      operation is cancelled from another thread, the signal will be
      emitted in the thread that cancelled the operation, not the
      thread that is running the operation.
      
      Note that disconnecting from this signal (or any signal) in a
      multi-threaded program is prone to race conditions. For instance
      it is possible that a signal handler may be invoked even after
      a call to [gobject.global.signalHandlerDisconnect] for that handler has
      already returned.
      
      There is also a problem when cancellation happens right before
      connecting to the signal. If this happens the signal will
      unexpectedly not be emitted, and checking before connecting to
      the signal leaves a race condition where this is still happening.
      
      In order to make it safe and easy to connect handlers there
      are two helper functions: [gio.cancellable.Cancellable.connect] and
      [gio.cancellable.Cancellable.disconnect] which protect against problems
      like this.
      
      An example of how to us this:
      ```c
          // Make sure we don't do unnecessary work if already cancelled
          if (g_cancellable_set_error_if_cancelled (cancellable, error))
            return;
      
          // Set up all the data needed to be able to handle cancellation
          // of the operation
          my_data = my_data_new (...);
      
          id = 0;
          if (cancellable)
            id = g_cancellable_connect (cancellable,
          			      G_CALLBACK (cancelled_handler)
          			      data, NULL);
      
          // cancellable operation here...
      
          g_cancellable_disconnect (cancellable, id);
      
          // cancelled_handler is never called after this, it is now safe
          // to free the data
          my_data_free (my_data);
      ```
      
      Note that the cancelled signal is emitted in the thread that
      the user cancelled from, which may be the main thread. So, the
      cancellable signal should not do something that can block.
  
      Params:
        callback = signal callback delegate or function to connect
  
          $(D void callback(gio.cancellable.Cancellable cancellable))
  
          `cancellable` the instance the signal is connected to (optional)
  
        after = Yes.After to execute callback after default handler, No.After to execute before (default)
      Returns: Signal ID
  */
  ulong connectCancelled(T)(T callback, Flag!"After" after = No.After)
  if (isCallable!T
    && is(ReturnType!T == void)
  && (Parameters!T.length < 1 || (ParameterStorageClassTuple!T[0] == ParameterStorageClass.none && is(Parameters!T[0] : gio.cancellable.Cancellable)))
  && Parameters!T.length < 2)
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      Tuple!(Parameters!T) _paramTuple;

      static if (Parameters!T.length > 0)
        _paramTuple[0] = getVal!(Parameters!T[0])(&_paramVals[0]);

      _dClosure.cb(_paramTuple[]);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("cancelled", closure, after);
  }
}
