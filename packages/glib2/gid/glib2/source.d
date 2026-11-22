/// Module for [Source] class
module gid.glib2.source;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.c.functions;
import gid.glib2.c.types;
import gid.glib2.main_context;
import gid.glib2.time_val;
import gid.glib2.types;
import gid.gobject2.boxed;

/**
    The [gid.glib2.source.Source] struct is an opaque data type
    representing an event source.
*/
class Source : gid.gobject2.boxed.BoxedWrap!(g_source_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Source self() nothrow
  {
    return this;
  }

  /**
      Creates a new [gid.glib2.source.Source] structure.
      
      The size is specified to
      allow creating structures derived from [gid.glib2.source.Source] that contain
      additional data. The size passed in must be at least
      `sizeof (GSource)`.
      
      The source will not initially be associated with any [gid.glib2.main_context.MainContext]
      and must be added to one with [gid.glib2.source.Source.attach] before it will be
      executed.
  
      Params:
        sourceFuncs = structure containing functions that implement
            the source‘s behavior
        structSize = size of the [gid.glib2.source.Source] structure to create, in bytes
      Returns: the newly-created source
  */
  this(gid.glib2.types.SourceFuncs sourceFuncs, uint structSize) nothrow
  {
    GSource* _cretval;
    _cretval = g_source_new(cast(GSourceFuncs*)&sourceFuncs, structSize);
    this(_cretval, Yes.Take);
  }

  /**
      Adds child_source to source as a ‘polled’ source.
      
      When source is added to a [gid.glib2.main_context.MainContext], child_source will be
      automatically added with the same priority. When child_source is triggered,
      it will cause source to dispatch (in addition to calling its own callback),
      and when source is destroyed, it will destroy child_source as well.
      
      The source will also still be dispatched if its own prepare/check functions
      indicate that it is ready.
      
      If you don’t need child_source to do anything on its own when it
      triggers, you can call `[gid.gobject2.global.sourceSetDummyCallback]` on it to set a
      callback that does nothing (except return true if appropriate).
      
      The source will hold a reference on child_source while child_source
      is attached to it.
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
  
      Params:
        childSource = a second source that source should ‘poll’
  */
  void addChildSource(gid.glib2.source.Source childSource) nothrow
  {
    g_source_add_child_source(cast(GSource*)this._cPtr, childSource ? cast(GSource*)childSource._cPtr(No.Dup) : null);
  }

  /**
      Adds a file descriptor to the set of file descriptors polled for
      this source.
      
      This is usually combined with [gid.glib2.source.Source.new_] to add an
      event source. The event source’s check function will typically test
      the revents field in the [gid.glib2.types.PollFD] struct and return true if
      events need to be processed.
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
      
      Using this API forces the linear scanning of event sources on each
      main loop iteration.  Newly-written event sources should try to use
      `[gid.glib2.source.Source.addUnixFd]` instead of this API.
  
      Params:
        fd = a [gid.glib2.types.PollFD] structure holding information about a file
            descriptor to watch
  */
  void addPoll(gid.glib2.types.PollFD fd) nothrow
  {
    g_source_add_poll(cast(GSource*)this._cPtr, cast(GPollFD*)&fd);
  }

  /**
      Monitors fd for the IO events in events.
      
      The tag returned by this function can be used to remove or modify the
      monitoring of the fd using [gid.glib2.source.Source.removeUnixFd] or
      [gid.glib2.source.Source.modifyUnixFd].
      
      It is not necessary to remove the file descriptor before destroying the
      source; it will be cleaned up automatically.
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        fd = the file descriptor to monitor
        events = an event mask
      Returns: an opaque tag
  */
  void* addUnixFd(int fd, gid.glib2.types.IOCondition events) nothrow
  {
    auto _retval = g_source_add_unix_fd(cast(GSource*)this._cPtr, fd, events);
    return _retval;
  }

  /**
      Adds a [gid.glib2.source.Source] to a context so that it will be executed within
      that context.
      
      Remove it by calling [gid.glib2.source.Source.destroy].
      
      This function is safe to call from any thread, regardless of which thread
      the context is running in.
  
      Params:
        context = a main context (if `NULL`, the global-default
            main context will be used)
      Returns: the ID (greater than 0) for the source within the
          [gid.glib2.main_context.MainContext]
  */
  uint attach(gid.glib2.main_context.MainContext context = null) nothrow
  {
    uint _retval;
    _retval = g_source_attach(cast(GSource*)this._cPtr, context ? cast(GMainContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes a source from its [gid.glib2.main_context.MainContext], if any, and marks it as
      destroyed.
      
      The source cannot be subsequently added to another
      context. It is safe to call this on sources which have already been
      removed from their context.
      
      This does not unref the [gid.glib2.source.Source]: if you still hold a reference,
      use [gid.glib2.source.Source.unref] to drop it.
      
      This function is safe to call from any thread, regardless of which thread
      the [gid.glib2.main_context.MainContext] is running in.
      
      If the source is currently attached to a [gid.glib2.main_context.MainContext],
      destroying it will effectively unset the callback similar to calling
      [gid.glib2.source.Source.setCallback]. This can mean, that the data’s
      [gid.glib2.types.DestroyNotify] gets called right away.
  */
  void destroy() nothrow
  {
    g_source_destroy(cast(GSource*)this._cPtr);
  }

  /**
      Gets a reference to the [gid.glib2.main_context.MainContext] with which the source is
      associated.
      
      You can call this on a source that has been destroyed. You can
      always call this function on the source returned from
      `funcGLib.main_current_source`.
      Returns: the [gid.glib2.main_context.MainContext] with which
          the source is associated, or `NULL` if the context has not yet been added
          to a source
  */
  gid.glib2.main_context.MainContext dupContext() nothrow
  {
    GMainContext* _cretval;
    _cretval = g_source_dup_context(cast(GSource*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.main_context.MainContext(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Checks whether a source is allowed to be called recursively.
      
      See [gid.glib2.source.Source.setCanRecurse].
      Returns: whether recursion is allowed
  */
  bool getCanRecurse() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_source_get_can_recurse(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets the [gid.glib2.main_context.MainContext] with which the source is associated.
      
      You can call this on a source that has been destroyed, provided
      that the [gid.glib2.main_context.MainContext] it was attached to still exists (in which
      case it will return that [gid.glib2.main_context.MainContext]). In particular, you can
      always call this function on the source returned from
      `funcGLib.main_current_source`. But calling this function on a source
      whose [gid.glib2.main_context.MainContext] has been destroyed is an error.
      
      If the associated [gid.glib2.main_context.MainContext] could be destroy concurrently from
      a different thread, then this function is not safe to call and
      [gid.glib2.source.Source.dupContext] should be used instead.
      Returns: the main context with which the
          source is associated, or `NULL` if the context has not yet been added to a
          source
  */
  gid.glib2.main_context.MainContext getContext() nothrow
  {
    GMainContext* _cretval;
    _cretval = g_source_get_context(cast(GSource*)this._cPtr);
    auto _retval = _cretval ? new gid.glib2.main_context.MainContext(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function ignores source and is otherwise the same as
      `funcGLib.get_current_time`.
  
      Params:
        timeval = [gid.glib2.time_val.TimeVal] structure in which to store current time
  
      Deprecated: use [gid.glib2.source.Source.getTime] instead
  */
  void getCurrentTime(gid.glib2.time_val.TimeVal timeval) nothrow
  {
    g_source_get_current_time(cast(GSource*)this._cPtr, cast(GTimeVal*)&timeval);
  }

  /**
      Returns the numeric ID for a particular source.
      
      The ID of a source
      is a positive integer which is unique within a particular main loop
      context. The reverse mapping from ID to source is done by
      [gid.glib2.main_context.MainContext.findSourceById].
      
      You can only call this function while the source is associated to a
      [gid.glib2.main_context.MainContext] instance; calling this function before
      [gid.glib2.source.Source.attach] or after [gid.glib2.source.Source.destroy] yields
      undefined behavior. The ID returned is unique within the
      [gid.glib2.main_context.MainContext] instance passed to [gid.glib2.source.Source.attach].
      Returns: the ID (greater than 0) for the source
  */
  uint getId() nothrow
  {
    uint _retval;
    _retval = g_source_get_id(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets a name for the source, used in debugging and profiling.
      
      The
      name may be `NULL` if it has never been set with [gid.glib2.source.Source.setName].
      Returns: the name of the source
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_source_get_name(cast(GSource*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the priority of a source.
      Returns: the priority of the source
  */
  int getPriority() nothrow
  {
    int _retval;
    _retval = g_source_get_priority(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets the ‘ready time’ of source, as set by
      [gid.glib2.source.Source.setReadyTime].
      
      Any time before or equal to the current monotonic time (including zero)
      is an indication that the source will fire immediately.
      Returns: the monotonic ready time, `-1` for ‘never’
  */
  long getReadyTime() nothrow
  {
    long _retval;
    _retval = g_source_get_ready_time(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets the time to be used when checking this source.
      
      The advantage of
      calling this function over calling `funcGLib.get_monotonic_time` directly is
      that when checking multiple sources, GLib can cache a single value
      instead of having to repeatedly get the system monotonic time.
      
      The time here is the system monotonic time, if available, or some
      other reasonable alternative otherwise.  See `funcGLib.get_monotonic_time`.
      Returns: the monotonic time in microseconds
  */
  long getTime() nothrow
  {
    long _retval;
    _retval = g_source_get_time(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Returns whether source has been destroyed.
      
      This is important when you operate upon your objects
      from within idle handlers, but may have freed the object
      before the dispatch of your idle handler.
      
      ```c
      static gboolean
      idle_callback (gpointer data)
      {
        SomeWidget *self = data;
         
        g_mutex_lock (&self->idle_id_mutex);
        // do stuff with self
        self->idle_id = 0;
        g_mutex_unlock (&self->idle_id_mutex);
         
        return G_SOURCE_REMOVE;
      }
       
      static void
      some_widget_do_stuff_later (SomeWidget *self)
      {
        g_mutex_lock (&self->idle_id_mutex);
        self->idle_id = g_idle_add (idle_callback, self);
        g_mutex_unlock (&self->idle_id_mutex);
      }
       
      static void
      some_widget_init (SomeWidget *self)
      {
        g_mutex_init (&self->idle_id_mutex);
      
        // ...
      }
      
      static void
      some_widget_finalize (GObject *object)
      {
        SomeWidget *self = SOME_WIDGET (object);
         
        if (self->idle_id)
          g_source_remove (self->idle_id);
         
        g_mutex_clear (&self->idle_id_mutex);
      
        G_OBJECT_CLASS (parent_class)->finalize (object);
      }
      ```
      
      This will fail in a multi-threaded application if the
      widget is destroyed before the idle handler fires due
      to the use after free in the callback. A solution, to
      this particular problem, is to check to if the source
      has already been destroy within the callback.
      
      ```c
      static gboolean
      idle_callback (gpointer data)
      {
        SomeWidget *self = data;
        
        g_mutex_lock (&self->idle_id_mutex);
        if (!g_source_is_destroyed (g_main_current_source ()))
          {
            // do stuff with self
          }
        g_mutex_unlock (&self->idle_id_mutex);
        
        return FALSE;
      }
      ```
      
      Calls to this function from a thread other than the one acquired by the
      [gid.glib2.main_context.MainContext] the [gid.glib2.source.Source] is attached to are typically
      redundant, as the source could be destroyed immediately after this function
      returns. However, once a source is destroyed it cannot be un-destroyed, so
      this function can be used for opportunistic checks from any thread.
      Returns: true if the source has been destroyed, false otherwise
  */
  bool isDestroyed() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_source_is_destroyed(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Updates the event mask to watch for the file descriptor identified by tag.
      
      The tag is the tag returned from [gid.glib2.source.Source.addUnixFd].
      
      If you want to remove a file descriptor, don’t set its event mask to zero.
      Instead, call [gid.glib2.source.Source.removeUnixFd].
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        tag = the tag from [gid.glib2.source.Source.addUnixFd]
        newEvents = the new event mask to watch
  */
  void modifyUnixFd(void* tag, gid.glib2.types.IOCondition newEvents) nothrow
  {
    g_source_modify_unix_fd(cast(GSource*)this._cPtr, tag, newEvents);
  }

  /**
      Queries the events reported for the file descriptor corresponding to tag
      on source during the last poll.
      
      The return value of this function is only defined when the function
      is called from the check or dispatch functions for source.
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        tag = the tag from [gid.glib2.source.Source.addUnixFd]
      Returns: the conditions reported on the file descriptor
  */
  gid.glib2.types.IOCondition queryUnixFd(void* tag) nothrow
  {
    GIOCondition _cretval;
    _cretval = g_source_query_unix_fd(cast(GSource*)this._cPtr, tag);
    gid.glib2.types.IOCondition _retval = cast(gid.glib2.types.IOCondition)_cretval;
    return _retval;
  }

  /**
      Detaches child_source from source and destroys it.
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
  
      Params:
        childSource = a source previously passed to
            [gid.glib2.source.Source.addChildSource]
  */
  void removeChildSource(gid.glib2.source.Source childSource) nothrow
  {
    g_source_remove_child_source(cast(GSource*)this._cPtr, childSource ? cast(GSource*)childSource._cPtr(No.Dup) : null);
  }

  /**
      Removes a file descriptor from the set of file descriptors polled for
      this source.
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
  
      Params:
        fd = a [gid.glib2.types.PollFD] structure previously passed to
            [gid.glib2.source.Source.addPoll]
  */
  void removePoll(gid.glib2.types.PollFD fd) nothrow
  {
    g_source_remove_poll(cast(GSource*)this._cPtr, cast(GPollFD*)&fd);
  }

  /**
      Reverses the effect of a previous call to [gid.glib2.source.Source.addUnixFd].
      
      You only need to call this if you want to remove a file descriptor from being
      watched while keeping the same source around.  In the normal case you
      will just want to destroy the source.
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        tag = the tag from [gid.glib2.source.Source.addUnixFd]
  */
  void removeUnixFd(void* tag) nothrow
  {
    g_source_remove_unix_fd(cast(GSource*)this._cPtr, tag);
  }

  /**
      Sets the callback function for a source. The callback for a source is
      called from the source’s dispatch function.
      
      The exact type of func depends on the type of source; ie. you
      should not count on func being called with data as its first
      parameter. Cast func with `funcGLib.SOURCE_FUNC` to avoid warnings about
      incompatible function types.
      
      See [main loop memory management](main-loop.html#memory-management-of-sources) for details
      on how to handle memory management of data.
      
      Typically, you won’t use this function. Instead use functions specific
      to the type of source you are using, such as `funcGLib.idle_add` or
      `funcGLib.timeout_add`.
      
      It is safe to call this function multiple times on a source which has already
      been attached to a context. The changes will take effect for the next time
      the source is dispatched after this call returns.
      
      Note that [gid.glib2.source.Source.destroy] for a currently attached source has the effect
      of also unsetting the callback.
  
      Params:
        func = a callback function
  */
  void setCallback(gid.glib2.types.SourceFunc func) nothrow
  {
    extern(C) gboolean _funcCallback(void* userData) nothrow
    {
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
    g_source_set_callback(cast(GSource*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets the callback function storing the data as a reference counted callback
      ‘object’.
      
      This is used internally. Note that calling
      [gid.glib2.source.Source.setCallbackIndirect] assumes
      an initial reference count on callback_data, and thus
      `callback_funcs->unref` will eventually be called once more than
      `callback_funcs->ref`.
      
      It is safe to call this function multiple times on a source which has already
      been attached to a context. The changes will take effect for the next time
      the source is dispatched after this call returns.
  
      Params:
        callbackData = pointer to callback data ‘object’
        callbackFuncs = functions for reference counting callback_data
            and getting the callback and data
  */
  void setCallbackIndirect(void* callbackData, gid.glib2.types.SourceCallbackFuncs callbackFuncs) nothrow
  {
    g_source_set_callback_indirect(cast(GSource*)this._cPtr, callbackData, cast(GSourceCallbackFuncs*)&callbackFuncs);
  }

  /**
      Sets whether a source can be called recursively.
      
      If can_recurse is true, then while the source is being dispatched then this
      source will be processed normally. Otherwise, all processing of this
      source is blocked until the dispatch function returns.
  
      Params:
        canRecurse = whether recursion is allowed for this source
  */
  void setCanRecurse(bool canRecurse) nothrow
  {
    g_source_set_can_recurse(cast(GSource*)this._cPtr, canRecurse);
  }

  /**
      Sets the source functions of an unattached source.
      
      These can be used to override the default implementations for the type
      of source.
  
      Params:
        funcs = the new source functions
  */
  void setFuncs(gid.glib2.types.SourceFuncs funcs) nothrow
  {
    g_source_set_funcs(cast(GSource*)this._cPtr, cast(GSourceFuncs*)&funcs);
  }

  /**
      Sets a name for the source, used in debugging and profiling.
      
      The name defaults to `NULL`.
      
      The source name should describe in a human-readable way
      what the source does. For example, ‘X11 event queue’
      or ‘GTK repaint idle handler’.
      
      It is permitted to call this function multiple times, but is not
      recommended due to the potential performance impact.  For example,
      one could change the name in the `check` function of a
      [gid.glib2.types.SourceFuncs] to include details like the event type in the
      source name.
      
      Use caution if changing the name while another thread may be
      accessing it with [gid.glib2.source.Source.getName]; that function does not copy
      the value, and changing the value will free it while the other thread
      may be attempting to use it.
      
      Also see [gid.glib2.source.Source.setStaticName].
  
      Params:
        name = debug name for the source
  */
  void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    g_source_set_name(cast(GSource*)this._cPtr, _name);
  }

  /**
      Sets the priority of a source.
      
      While the main loop is being run, a
      source will be dispatched if it is ready to be dispatched and no
      sources at a higher (numerically smaller) priority are ready to be
      dispatched.
      
      A child source always has the same priority as its parent.  It is not
      permitted to change the priority of a source once it has been added
      as a child of another source.
  
      Params:
        priority = the new priority
  */
  void setPriority(int priority) nothrow
  {
    g_source_set_priority(cast(GSource*)this._cPtr, priority);
  }

  /**
      Sets a source to be dispatched when the given monotonic time is
      reached (or passed).
      
      If the monotonic time is in the past (as it
      always will be if ready_time is `0`) then the source will be
      dispatched immediately.
      
      If ready_time is `-1` then the source is never woken up on the basis
      of the passage of time.
      
      Dispatching the source does not reset the ready time.  You should do
      so yourself, from the source dispatch function.
      
      Note that if you have a pair of sources where the ready time of one
      suggests that it will be delivered first but the priority for the
      other suggests that it would be delivered first, and the ready time
      for both sources is reached during the same main context iteration,
      then the order of dispatch is undefined.
      
      It is a no-op to call this function on a [gid.glib2.source.Source] which has
      already been destroyed with [gid.glib2.source.Source.destroy].
      
      This API is only intended to be used by implementations of [gid.glib2.source.Source].
      Do not call this API on a [gid.glib2.source.Source] that you did not create.
  
      Params:
        readyTime = the monotonic time at which the source will be ready;
            `0` for ‘immediately’, `-1` for ‘never’
  */
  void setReadyTime(long readyTime) nothrow
  {
    g_source_set_ready_time(cast(GSource*)this._cPtr, readyTime);
  }

  /**
      A variant of [gid.glib2.source.Source.setName] that does not
      duplicate the name, and can only be used with
      string literals.
  
      Params:
        name = debug name for the source
  */
  void setStaticName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    g_source_set_static_name(cast(GSource*)this._cPtr, _name);
  }

  /**
      Removes the source with the given ID from the default main context.
      
      You must
      use [gid.glib2.source.Source.destroy] for sources added to a non-default main context.
      
      The ID of a [gid.glib2.source.Source] is given by [gid.glib2.source.Source.getId], or will be
      returned by the functions [gid.glib2.source.Source.attach], `funcGLib.idle_add`,
      `funcGLib.idle_add_full`, `funcGLib.timeout_add`,
      `funcGLib.timeout_add_full`, `funcGLib.child_watch_add`,
      `funcGLib.child_watch_add_full`, `funcGLib.io_add_watch`, and
      `funcGLib.io_add_watch_full`.
      
      It is a programmer error to attempt to remove a non-existent source.
      
      More specifically: source IDs can be reissued after a source has been
      destroyed and therefore it is never valid to use this function with a
      source ID which may have already been removed.  An example is when
      scheduling an idle to run in another thread with `funcGLib.idle_add`: the
      idle may already have run and been removed by the time this function
      is called on its (now invalid) source ID.  This source ID may have
      been reissued, leading to the operation being performed against the
      wrong source.
  
      Params:
        tag = the ID of the source to remove.
      Returns: true if the source was found and removed, false otherwise
  */
  static bool remove(uint tag) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_source_remove(tag);
    return _retval;
  }

  /**
      Removes a source from the default main loop context given the
      source functions and user data.
      
      If multiple sources exist with the same source functions and user data, only
      one will be destroyed.
  
      Params:
        funcs = the source_funcs passed to [gid.glib2.source.Source.new_]
        userData = the user data for the callback
      Returns: true if a source was found and removed, false otherwise
  */
  static bool removeByFuncsUserData(gid.glib2.types.SourceFuncs funcs, void* userData = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_source_remove_by_funcs_user_data(cast(GSourceFuncs*)&funcs, userData);
    return _retval;
  }

  /**
      Removes a source from the default main loop context given the user
      data for the callback.
      
      If multiple sources exist with the same user data, only one will be destroyed.
  
      Params:
        userData = the user_data for the callback
      Returns: true if a source was found and removed, false otherwise
  */
  static bool removeByUserData(void* userData = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_source_remove_by_user_data(userData);
    return _retval;
  }

  /**
      Sets the name of a source using its ID.
      
      This is a convenience utility to set source names from the return
      value of `funcGLib.idle_add`, `funcGLib.timeout_add`, etc.
      
      It is a programmer error to attempt to set the name of a non-existent
      source.
      
      More specifically: source IDs can be reissued after a source has been
      destroyed and therefore it is never valid to use this function with a
      source ID which may have already been removed.  An example is when
      scheduling an idle to run in another thread with `funcGLib.idle_add`: the
      idle may already have run and been removed by the time this function
      is called on its (now invalid) source ID.  This source ID may have
      been reissued, leading to the operation being performed against the
      wrong source.
  
      Params:
        tag = a source ID
        name = debug name for the source
  */
  static void setNameById(uint tag, string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    g_source_set_name_by_id(tag, _name);
  }
}
