/// Module for [MainContext] class
module glib.main_context;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.source;
import glib.types;
import gobject.boxed;

/**
    The [glib.main_context.MainContext] struct is an opaque data
    type representing a set of sources to be handled in a main loop.
*/
class MainContext : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_main_context_get_type != &gidSymbolNotFound ? g_main_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MainContext self()
  {
    return this;
  }

  /**
      Creates a new #GMainContext structure.
      Returns: the new #GMainContext
  */
  this()
  {
    GMainContext* _cretval;
    _cretval = g_main_context_new();
    this(_cretval, Yes.Take);
  }

  /**
      Creates a new #GMainContext structure.
  
      Params:
        flags = a bitwise-OR combination of #GMainContextFlags flags that can only be
                  set at creation time.
      Returns: the new #GMainContext
  */
  static glib.main_context.MainContext newWithFlags(glib.types.MainContextFlags flags)
  {
    GMainContext* _cretval;
    _cretval = g_main_context_new_with_flags(flags);
    auto _retval = _cretval ? new glib.main_context.MainContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Tries to become the owner of the specified context.
      If some other thread is the owner of the context,
      returns false immediately. Ownership is properly
      recursive: the owner can require ownership again
      and will release ownership when [glib.main_context.MainContext.release]
      is called as many times as [glib.main_context.MainContext.acquire].
      
      You must be the owner of a context before you
      can call [glib.main_context.MainContext.prepare], [glib.main_context.MainContext.query],
      [glib.main_context.MainContext.check], [glib.main_context.MainContext.dispatch], [glib.main_context.MainContext.release].
      
      Since 2.76 context can be null to use the global-default
      main context.
      Returns: true if the operation succeeded, and
          this thread is now the owner of context.
  */
  bool acquire()
  {
    bool _retval;
    _retval = cast(bool)g_main_context_acquire(cast(GMainContext*)this._cPtr);
    return _retval;
  }

  /**
      Adds a file descriptor to the set of file descriptors polled for
      this context. This will very seldom be used directly. Instead
      a typical event source will use [glib.source.Source.addUnixFd] instead.
  
      Params:
        fd = a #GPollFD structure holding information about a file
               descriptor to watch.
        priority = the priority for this file descriptor which should be
               the same as the priority used for [glib.source.Source.attach] to ensure that the
               file descriptor is polled whenever the results may be needed.
  */
  void addPoll(glib.types.PollFD fd, int priority)
  {
    g_main_context_add_poll(cast(GMainContext*)this._cPtr, &fd, priority);
  }

  /**
      Passes the results of polling back to the main loop. You should be
      careful to pass fds and its length n_fds as received from
      [glib.main_context.MainContext.query], as this functions relies on assumptions
      on how fds is filled.
      
      You must have successfully acquired the context with
      [glib.main_context.MainContext.acquire] before you may call this function.
      
      Since 2.76 context can be null to use the global-default
      main context.
  
      Params:
        maxPriority = the maximum numerical priority of sources to check
        fds = array of #GPollFD's that was passed to
                the last call to [glib.main_context.MainContext.query]
      Returns: true if some sources are ready to be dispatched.
  */
  bool check(int maxPriority, glib.types.PollFD[] fds)
  {
    bool _retval;
    int _nFds;
    if (fds)
      _nFds = cast(int)fds.length;

    auto _fds = cast(GPollFD*)fds.ptr;
    _retval = cast(bool)g_main_context_check(cast(GMainContext*)this._cPtr, maxPriority, _fds, _nFds);
    return _retval;
  }

  /**
      Dispatches all pending sources.
      
      You must have successfully acquired the context with
      [glib.main_context.MainContext.acquire] before you may call this function.
      
      Since 2.76 context can be null to use the global-default
      main context.
  */
  void dispatch()
  {
    g_main_context_dispatch(cast(GMainContext*)this._cPtr);
  }

  /**
      Finds a source with the given source functions and user data.  If
      multiple sources exist with the same source function and user data,
      the first one found will be returned.
  
      Params:
        funcs = the source_funcs passed to [glib.source.Source.new_].
        userData = the user data from the callback.
      Returns: the source, if one was found, otherwise null
  */
  glib.source.Source findSourceByFuncsUserData(glib.types.SourceFuncs funcs, void* userData = null)
  {
    GSource* _cretval;
    _cretval = g_main_context_find_source_by_funcs_user_data(cast(GMainContext*)this._cPtr, &funcs, userData);
    auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Finds a #GSource given a pair of context and ID.
      
      It is a programmer error to attempt to look up a non-existent source.
      
      More specifically: source IDs can be reissued after a source has been
      destroyed and therefore it is never valid to use this function with a
      source ID which may have already been removed.  An example is when
      scheduling an idle to run in another thread with [glib.global.idleAdd]: the
      idle may already have run and been removed by the time this function
      is called on its (now invalid) source ID.  This source ID may have
      been reissued, leading to the operation being performed against the
      wrong source.
  
      Params:
        sourceId = the source ID, as returned by [glib.source.Source.getId].
      Returns: the #GSource
  */
  glib.source.Source findSourceById(uint sourceId)
  {
    GSource* _cretval;
    _cretval = g_main_context_find_source_by_id(cast(GMainContext*)this._cPtr, sourceId);
    auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Finds a source with the given user data for the callback.  If
      multiple sources exist with the same user data, the first
      one found will be returned.
  
      Params:
        userData = the user_data for the callback.
      Returns: the source, if one was found, otherwise null
  */
  glib.source.Source findSourceByUserData(void* userData = null)
  {
    GSource* _cretval;
    _cretval = g_main_context_find_source_by_user_data(cast(GMainContext*)this._cPtr, userData);
    auto _retval = _cretval ? new glib.source.Source(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Invokes a function in such a way that context is owned during the
      invocation of function.
      
      This function is the same as [glib.main_context.MainContext.invoke] except that it
      lets you specify the priority in case function ends up being
      scheduled as an idle and also lets you give a #GDestroyNotify for data.
      
      notify should not assume that it is called from any particular
      thread or with any particular context acquired.
  
      Params:
        priority = the priority at which to run function
        function_ = function to call
  */
  void invokeFull(int priority, glib.types.SourceFunc function_)
  {
    extern(C) gboolean _function_Callback(void* userData)
    {
      bool _dretval;
      auto _dlg = cast(glib.types.SourceFunc*)userData;

      _dretval = (*_dlg)();
      auto _retval = cast(gboolean)_dretval;

      return _retval;
    }
    auto _function_CB = function_ ? &_function_Callback : null;
    auto _function_ = function_ ? freezeDelegate(cast(void*)&function_) : null;
    GDestroyNotify _function_DestroyCB = function_ ? &thawDelegate : null;
    g_main_context_invoke_full(cast(GMainContext*)this._cPtr, priority, _function_CB, _function_, _function_DestroyCB);
  }

  /**
      Determines whether this thread holds the (recursive)
      ownership of this #GMainContext. This is useful to
      know before waiting on another thread that may be
      blocking to get ownership of context.
      Returns: true if current thread is owner of context.
  */
  bool isOwner()
  {
    bool _retval;
    _retval = cast(bool)g_main_context_is_owner(cast(GMainContext*)this._cPtr);
    return _retval;
  }

  /**
      Runs a single iteration for the given main loop. This involves
      checking to see if any event sources are ready to be processed,
      then if no events sources are ready and may_block is true, waiting
      for a source to become ready, then dispatching the highest priority
      events sources that are ready. Otherwise, if may_block is false
      sources are not waited to become ready, only those highest priority
      events sources will be dispatched (if any), that are ready at this
      given moment without further waiting.
      
      Note that even when may_block is true, it is still possible for
      [glib.main_context.MainContext.iteration] to return false, since the wait may
      be interrupted for other reasons than an event source becoming ready.
  
      Params:
        mayBlock = whether the call may block.
      Returns: true if events were dispatched.
  */
  bool iteration(bool mayBlock)
  {
    bool _retval;
    _retval = cast(bool)g_main_context_iteration(cast(GMainContext*)this._cPtr, mayBlock);
    return _retval;
  }

  /**
      Checks if any sources have pending events for the given context.
      Returns: true if events are pending.
  */
  bool pending()
  {
    bool _retval;
    _retval = cast(bool)g_main_context_pending(cast(GMainContext*)this._cPtr);
    return _retval;
  }

  /**
      Pops context off the thread-default context stack (verifying that
      it was on the top of the stack).
  */
  void popThreadDefault()
  {
    g_main_context_pop_thread_default(cast(GMainContext*)this._cPtr);
  }

  /**
      Prepares to poll sources within a main loop. The resulting information
      for polling is determined by calling g_main_context_query ().
      
      You must have successfully acquired the context with
      [glib.main_context.MainContext.acquire] before you may call this function.
  
      Params:
        priority = location to store priority of highest priority
                     source already ready.
      Returns: true if some source is ready to be dispatched
                      prior to polling.
  */
  bool prepare(out int priority)
  {
    bool _retval;
    _retval = cast(bool)g_main_context_prepare(cast(GMainContext*)this._cPtr, cast(int*)&priority);
    return _retval;
  }

  /**
      Acquires context and sets it as the thread-default context for the
      current thread. This will cause certain asynchronous operations
      (such as most [gio][gio]-based I/O) which are
      started in this thread to run under context and deliver their
      results to its main loop, rather than running under the global
      default main context in the main thread. Note that calling this function
      changes the context returned by [glib.main_context.MainContext.getThreadDefault],
      not the one returned by [glib.main_context.MainContext.default_], so it does not affect
      the context used by functions like [glib.global.idleAdd].
      
      Normally you would call this function shortly after creating a new
      thread, passing it a #GMainContext which will be run by a
      #GMainLoop in that thread, to set a new default context for all
      async operations in that thread. In this case you may not need to
      ever call [glib.main_context.MainContext.popThreadDefault], assuming you want the
      new #GMainContext to be the default for the whole lifecycle of the
      thread.
      
      If you don't have control over how the new thread was created (e.g.
      in the new thread isn't newly created, or if the thread life
      cycle is managed by a #GThreadPool), it is always suggested to wrap
      the logic that needs to use the new #GMainContext inside a
      [glib.main_context.MainContext.pushThreadDefault] / [glib.main_context.MainContext.popThreadDefault]
      pair, otherwise threads that are re-used will end up never explicitly
      releasing the #GMainContext reference they hold.
      
      In some cases you may want to schedule a single operation in a
      non-default context, or temporarily use a non-default context in
      the main thread. In that case, you can wrap the call to the
      asynchronous operation inside a
      [glib.main_context.MainContext.pushThreadDefault] /
      [glib.main_context.MainContext.popThreadDefault] pair, but it is up to you to
      ensure that no other asynchronous operations accidentally get
      started while the non-default context is active.
      
      Beware that libraries that predate this function may not correctly
      handle being used from a thread with a thread-default context. Eg,
      see [gio.file.File.supportsThreadContexts].
  */
  void pushThreadDefault()
  {
    g_main_context_push_thread_default(cast(GMainContext*)this._cPtr);
  }

  /**
      Determines information necessary to poll this main loop. You should
      be careful to pass the resulting fds array and its length n_fds
      as is when calling [glib.main_context.MainContext.check], as this function relies
      on assumptions made when the array is filled.
      
      You must have successfully acquired the context with
      [glib.main_context.MainContext.acquire] before you may call this function.
  
      Params:
        maxPriority = maximum priority source to check
        timeout = location to store timeout to be used in polling
        fds = location to
                store #GPollFD records that need to be polled.
      Returns: the number of records actually stored in fds,
          or, if more than n_fds records need to be stored, the number
          of records that need to be stored.
  */
  int query(int maxPriority, out int timeout, ref glib.types.PollFD[] fds)
  {
    int _retval;
    int _nFds;
    _nFds = cast(int)fds.length;
    _retval = g_main_context_query(cast(GMainContext*)this._cPtr, maxPriority, cast(int*)&timeout, fds.ptr, _nFds);
    return _retval;
  }

  /**
      Releases ownership of a context previously acquired by this thread
      with [glib.main_context.MainContext.acquire]. If the context was acquired multiple
      times, the ownership will be released only when [glib.main_context.MainContext.release]
      is called as many times as it was acquired.
      
      You must have successfully acquired the context with
      [glib.main_context.MainContext.acquire] before you may call this function.
  */
  void release()
  {
    g_main_context_release(cast(GMainContext*)this._cPtr);
  }

  /**
      Removes file descriptor from the set of file descriptors to be
      polled for a particular context.
  
      Params:
        fd = a #GPollFD descriptor previously added with [glib.main_context.MainContext.addPoll]
  */
  void removePoll(glib.types.PollFD fd)
  {
    g_main_context_remove_poll(cast(GMainContext*)this._cPtr, &fd);
  }

  /**
      If context is currently blocking in [glib.main_context.MainContext.iteration]
      waiting for a source to become ready, cause it to stop blocking
      and return.  Otherwise, cause the next invocation of
      [glib.main_context.MainContext.iteration] to return without blocking.
      
      This API is useful for low-level control over #GMainContext; for
      example, integrating it with main loop implementations such as
      #GMainLoop.
      
      Another related use for this function is when implementing a main
      loop with a termination condition, computed from multiple threads:
      
      ```c
        #define NUM_TASKS 10
        static gint tasks_remaining = NUM_TASKS;  // (atomic)
        ...
       
        while (g_atomic_int_get (&tasks_remaining) != 0)
          g_main_context_iteration (NULL, TRUE);
      ```
       
      Then in a thread:
      ```c
        perform_work();
      
        if (g_atomic_int_dec_and_test (&tasks_remaining))
          g_main_context_wakeup (NULL);
      ```
  */
  void wakeup()
  {
    g_main_context_wakeup(cast(GMainContext*)this._cPtr);
  }

  /**
      Returns the global-default main context. This is the main context
      used for main loop functions when a main loop is not explicitly
      specified, and corresponds to the "main" main loop. See also
      [glib.main_context.MainContext.getThreadDefault].
      Returns: the global-default main context.
  */
  static glib.main_context.MainContext default_()
  {
    GMainContext* _cretval;
    _cretval = g_main_context_default();
    auto _retval = _cretval ? new glib.main_context.MainContext(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the thread-default #GMainContext for this thread. Asynchronous
      operations that want to be able to be run in contexts other than
      the default one should call this method or
      [glib.main_context.MainContext.refThreadDefault] to get a #GMainContext to add
      their #GSources to. (Note that even in single-threaded
      programs applications may sometimes want to temporarily push a
      non-default context, so it is not safe to assume that this will
      always return null if you are running in the default thread.)
      
      If you need to hold a reference on the context, use
      [glib.main_context.MainContext.refThreadDefault] instead.
      Returns: the thread-default #GMainContext, or
        null if the thread-default context is the global-default main context.
  */
  static glib.main_context.MainContext getThreadDefault()
  {
    GMainContext* _cretval;
    _cretval = g_main_context_get_thread_default();
    auto _retval = _cretval ? new glib.main_context.MainContext(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the thread-default #GMainContext for this thread, as with
      [glib.main_context.MainContext.getThreadDefault], but also adds a reference to
      it with [glib.main_context.MainContext.ref_]. In addition, unlike
      [glib.main_context.MainContext.getThreadDefault], if the thread-default context
      is the global-default context, this will return that #GMainContext
      (with a ref added to it) rather than returning null.
      Returns: the thread-default #GMainContext. Unref
            with [glib.main_context.MainContext.unref] when you are done with it.
  */
  static glib.main_context.MainContext refThreadDefault()
  {
    GMainContext* _cretval;
    _cretval = g_main_context_ref_thread_default();
    auto _retval = _cretval ? new glib.main_context.MainContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
