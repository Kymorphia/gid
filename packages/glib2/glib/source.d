/// Module for [Source] class
module glib.source;

import gid.gid;
import glib.c.functions;
import glib.c.types;
import glib.main_context;
import glib.time_val;
import glib.types;
import gobject.boxed;

/**
    The [glib.source.Source] struct is an opaque data type
    representing an event source.
*/
class Source : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_source_get_type != &gidSymbolNotFound ? g_source_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Source self()
  {
    return this;
  }

  /**
      Creates a new #GSource structure. The size is specified to
      allow creating structures derived from #GSource that contain
      additional data. The size passed in must be at least
      `sizeof (GSource)`.
      
      The source will not initially be associated with any #GMainContext
      and must be added to one with [glib.source.Source.attach] before it will be
      executed.
  
      Params:
        sourceFuncs = structure containing functions that implement
                         the sources behavior.
        structSize = size of the #GSource structure to create.
      Returns: the newly-created #GSource.
  */
  this(glib.types.SourceFuncs sourceFuncs, uint structSize)
  {
    GSource* _cretval;
    _cretval = g_source_new(&sourceFuncs, structSize);
    this(_cretval, Yes.Take);
  }

  /**
      Adds child_source to source as a "polled" source; when source is
      added to a #GMainContext, child_source will be automatically added
      with the same priority, when child_source is triggered, it will
      cause source to dispatch (in addition to calling its own
      callback), and when source is destroyed, it will destroy
      child_source as well. (source will also still be dispatched if
      its own prepare/check functions indicate that it is ready.)
      
      If you don't need child_source to do anything on its own when it
      triggers, you can call [gobject.global.sourceSetDummyCallback] on it to set a
      callback that does nothing (except return true if appropriate).
      
      source will hold a reference on child_source while child_source
      is attached to it.
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
  
      Params:
        childSource = a second #GSource that source should "poll"
  */
  void addChildSource(glib.source.Source childSource)
  {
    g_source_add_child_source(cast(GSource*)this._cPtr, childSource ? cast(GSource*)childSource._cPtr(No.Dup) : null);
  }

  /**
      Adds a file descriptor to the set of file descriptors polled for
      this source. This is usually combined with [glib.source.Source.new_] to add an
      event source. The event source's check function will typically test
      the revents field in the #GPollFD struct and return true if events need
      to be processed.
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
      
      Using this API forces the linear scanning of event sources on each
      main loop iteration.  Newly-written event sources should try to use
      [glib.source.Source.addUnixFd] instead of this API.
  
      Params:
        fd = a #GPollFD structure holding information about a file
               descriptor to watch.
  */
  void addPoll(glib.types.PollFD fd)
  {
    g_source_add_poll(cast(GSource*)this._cPtr, &fd);
  }

  /**
      Monitors fd for the IO events in events.
      
      The tag returned by this function can be used to remove or modify the
      monitoring of the fd using [glib.source.Source.removeUnixFd] or
      [glib.source.Source.modifyUnixFd].
      
      It is not necessary to remove the fd before destroying the source; it
      will be cleaned up automatically.
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        fd = the fd to monitor
        events = an event mask
      Returns: an opaque tag
  */
  void* addUnixFd(int fd, glib.types.IOCondition events)
  {
    auto _retval = g_source_add_unix_fd(cast(GSource*)this._cPtr, fd, events);
    return _retval;
  }

  /**
      Adds a #GSource to a context so that it will be executed within
      that context. Remove it by calling [glib.source.Source.destroy].
      
      This function is safe to call from any thread, regardless of which thread
      the context is running in.
  
      Params:
        context = a #GMainContext (if null, the global-default
            main context will be used)
      Returns: the ID (greater than 0) for the source within the
          #GMainContext.
  */
  uint attach(glib.main_context.MainContext context = null)
  {
    uint _retval;
    _retval = g_source_attach(cast(GSource*)this._cPtr, context ? cast(GMainContext*)context._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Removes a source from its #GMainContext, if any, and mark it as
      destroyed.  The source cannot be subsequently added to another
      context. It is safe to call this on sources which have already been
      removed from their context.
      
      This does not unref the #GSource: if you still hold a reference, use
      [glib.source.Source.unref] to drop it.
      
      This function is safe to call from any thread, regardless of which thread
      the #GMainContext is running in.
      
      If the source is currently attached to a #GMainContext, destroying it
      will effectively unset the callback similar to calling [glib.source.Source.setCallback].
      This can mean, that the data's #GDestroyNotify gets called right away.
  */
  void destroy()
  {
    g_source_destroy(cast(GSource*)this._cPtr);
  }

  /**
      Checks whether a source is allowed to be called recursively.
      see [glib.source.Source.setCanRecurse].
      Returns: whether recursion is allowed.
  */
  bool getCanRecurse()
  {
    bool _retval;
    _retval = cast(bool)g_source_get_can_recurse(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GMainContext with which the source is associated.
      
      You can call this on a source that has been destroyed, provided
      that the #GMainContext it was attached to still exists (in which
      case it will return that #GMainContext). In particular, you can
      always call this function on the source returned from
      [glib.global.mainCurrentSource]. But calling this function on a source
      whose #GMainContext has been destroyed is an error.
      Returns: the #GMainContext with which the
                      source is associated, or null if the context has not
                      yet been added to a source.
  */
  glib.main_context.MainContext getContext()
  {
    GMainContext* _cretval;
    _cretval = g_source_get_context(cast(GSource*)this._cPtr);
    auto _retval = _cretval ? new glib.main_context.MainContext(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      This function ignores source and is otherwise the same as
      [glib.global.getCurrentTime].
  
      Params:
        timeval = #GTimeVal structure in which to store current time.
  
      Deprecated: use [glib.source.Source.getTime] instead
  */
  void getCurrentTime(glib.time_val.TimeVal timeval)
  {
    g_source_get_current_time(cast(GSource*)this._cPtr, timeval ? cast(GTimeVal*)timeval._cPtr : null);
  }

  /**
      Returns the numeric ID for a particular source. The ID of a source
      is a positive integer which is unique within a particular main loop
      context. The reverse
      mapping from ID to source is done by [glib.main_context.MainContext.findSourceById].
      
      You can only call this function while the source is associated to a
      #GMainContext instance; calling this function before [glib.source.Source.attach]
      or after [glib.source.Source.destroy] yields undefined behavior. The ID returned
      is unique within the #GMainContext instance passed to [glib.source.Source.attach].
      Returns: the ID (greater than 0) for the source
  */
  uint getId()
  {
    uint _retval;
    _retval = g_source_get_id(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets a name for the source, used in debugging and profiling.  The
      name may be #NULL if it has never been set with [glib.source.Source.setName].
      Returns: the name of the source
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_source_get_name(cast(GSource*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the priority of a source.
      Returns: the priority of the source
  */
  int getPriority()
  {
    int _retval;
    _retval = g_source_get_priority(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets the "ready time" of source, as set by
      [glib.source.Source.setReadyTime].
      
      Any time before or equal to the current monotonic time (including 0)
      is an indication that the source will fire immediately.
      Returns: the monotonic ready time, -1 for "never"
  */
  long getReadyTime()
  {
    long _retval;
    _retval = g_source_get_ready_time(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Gets the time to be used when checking this source. The advantage of
      calling this function over calling [glib.global.getMonotonicTime] directly is
      that when checking multiple sources, GLib can cache a single value
      instead of having to repeatedly get the system monotonic time.
      
      The time here is the system monotonic time, if available, or some
      other reasonable alternative otherwise.  See [glib.global.getMonotonicTime].
      Returns: the monotonic time in microseconds
  */
  long getTime()
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
      #GMainContext the #GSource is attached to are typically redundant, as the
      source could be destroyed immediately after this function returns. However,
      once a source is destroyed it cannot be un-destroyed, so this function can be
      used for opportunistic checks from any thread.
      Returns: true if the source has been destroyed
  */
  bool isDestroyed()
  {
    bool _retval;
    _retval = cast(bool)g_source_is_destroyed(cast(GSource*)this._cPtr);
    return _retval;
  }

  /**
      Updates the event mask to watch for the fd identified by tag.
      
      tag is the tag returned from [glib.source.Source.addUnixFd].
      
      If you want to remove a fd, don't set its event mask to zero.
      Instead, call [glib.source.Source.removeUnixFd].
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        tag = the tag from [glib.source.Source.addUnixFd]
        newEvents = the new event mask to watch
  */
  void modifyUnixFd(void* tag, glib.types.IOCondition newEvents)
  {
    g_source_modify_unix_fd(cast(GSource*)this._cPtr, tag, newEvents);
  }

  /**
      Queries the events reported for the fd corresponding to tag on
      source during the last poll.
      
      The return value of this function is only defined when the function
      is called from the check or dispatch functions for source.
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        tag = the tag from [glib.source.Source.addUnixFd]
      Returns: the conditions reported on the fd
  */
  glib.types.IOCondition queryUnixFd(void* tag)
  {
    GIOCondition _cretval;
    _cretval = g_source_query_unix_fd(cast(GSource*)this._cPtr, tag);
    glib.types.IOCondition _retval = cast(glib.types.IOCondition)_cretval;
    return _retval;
  }

  /**
      Detaches child_source from source and destroys it.
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
  
      Params:
        childSource = a #GSource previously passed to
              [glib.source.Source.addChildSource].
  */
  void removeChildSource(glib.source.Source childSource)
  {
    g_source_remove_child_source(cast(GSource*)this._cPtr, childSource ? cast(GSource*)childSource._cPtr(No.Dup) : null);
  }

  /**
      Removes a file descriptor from the set of file descriptors polled for
      this source.
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
  
      Params:
        fd = a #GPollFD structure previously passed to [glib.source.Source.addPoll].
  */
  void removePoll(glib.types.PollFD fd)
  {
    g_source_remove_poll(cast(GSource*)this._cPtr, &fd);
  }

  /**
      Reverses the effect of a previous call to [glib.source.Source.addUnixFd].
      
      You only need to call this if you want to remove an fd from being
      watched while keeping the same source around.  In the normal case you
      will just want to destroy the source.
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
      
      As the name suggests, this function is not available on Windows.
  
      Params:
        tag = the tag from [glib.source.Source.addUnixFd]
  */
  void removeUnixFd(void* tag)
  {
    g_source_remove_unix_fd(cast(GSource*)this._cPtr, tag);
  }

  /**
      Sets the callback function for a source. The callback for a source is
      called from the source's dispatch function.
      
      The exact type of func depends on the type of source; ie. you
      should not count on func being called with data as its first
      parameter. Cast func with G_SOURCE_FUNC() to avoid warnings about
      incompatible function types.
      
      See [memory management of sources][mainloop-memory-management] for details
      on how to handle memory management of data.
      
      Typically, you won't use this function. Instead use functions specific
      to the type of source you are using, such as [glib.global.idleAdd] or [glib.global.timeoutAdd].
      
      It is safe to call this function multiple times on a source which has already
      been attached to a context. The changes will take effect for the next time
      the source is dispatched after this call returns.
      
      Note that [glib.source.Source.destroy] for a currently attached source has the effect
      of also unsetting the callback.
  
      Params:
        func = a callback function
  */
  void setCallback(glib.types.SourceFunc func)
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
    g_source_set_callback(cast(GSource*)this._cPtr, _funcCB, _func, _funcDestroyCB);
  }

  /**
      Sets the callback function storing the data as a refcounted callback
      "object". This is used internally. Note that calling
      [glib.source.Source.setCallbackIndirect] assumes
      an initial reference count on callback_data, and thus
      callback_funcs->unref will eventually be called once more
      than callback_funcs->ref.
      
      It is safe to call this function multiple times on a source which has already
      been attached to a context. The changes will take effect for the next time
      the source is dispatched after this call returns.
  
      Params:
        callbackData = pointer to callback data "object"
        callbackFuncs = functions for reference counting callback_data
                           and getting the callback and data
  */
  void setCallbackIndirect(void* callbackData, glib.types.SourceCallbackFuncs callbackFuncs)
  {
    g_source_set_callback_indirect(cast(GSource*)this._cPtr, callbackData, &callbackFuncs);
  }

  /**
      Sets whether a source can be called recursively. If can_recurse is
      true, then while the source is being dispatched then this source
      will be processed normally. Otherwise, all processing of this
      source is blocked until the dispatch function returns.
  
      Params:
        canRecurse = whether recursion is allowed for this source
  */
  void setCanRecurse(bool canRecurse)
  {
    g_source_set_can_recurse(cast(GSource*)this._cPtr, canRecurse);
  }

  /**
      Sets the source functions (can be used to override
      default implementations) of an unattached source.
  
      Params:
        funcs = the new #GSourceFuncs
  */
  void setFuncs(glib.types.SourceFuncs funcs)
  {
    g_source_set_funcs(cast(GSource*)this._cPtr, &funcs);
  }

  /**
      Sets a name for the source, used in debugging and profiling.
      The name defaults to #NULL.
      
      The source name should describe in a human-readable way
      what the source does. For example, "X11 event queue"
      or "GTK repaint idle handler" or whatever it is.
      
      It is permitted to call this function multiple times, but is not
      recommended due to the potential performance impact.  For example,
      one could change the name in the "check" function of a #GSourceFuncs
      to include details like the event type in the source name.
      
      Use caution if changing the name while another thread may be
      accessing it with [glib.source.Source.getName]; that function does not copy
      the value, and changing the value will free it while the other thread
      may be attempting to use it.
      
      Also see [glib.source.Source.setStaticName].
  
      Params:
        name = debug name for the source
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    g_source_set_name(cast(GSource*)this._cPtr, _name);
  }

  /**
      Sets the priority of a source. While the main loop is being run, a
      source will be dispatched if it is ready to be dispatched and no
      sources at a higher (numerically smaller) priority are ready to be
      dispatched.
      
      A child source always has the same priority as its parent.  It is not
      permitted to change the priority of a source once it has been added
      as a child of another source.
  
      Params:
        priority = the new priority.
  */
  void setPriority(int priority)
  {
    g_source_set_priority(cast(GSource*)this._cPtr, priority);
  }

  /**
      Sets a #GSource to be dispatched when the given monotonic time is
      reached (or passed).  If the monotonic time is in the past (as it
      always will be if ready_time is 0) then the source will be
      dispatched immediately.
      
      If ready_time is -1 then the source is never woken up on the basis
      of the passage of time.
      
      Dispatching the source does not reset the ready time.  You should do
      so yourself, from the source dispatch function.
      
      Note that if you have a pair of sources where the ready time of one
      suggests that it will be delivered first but the priority for the
      other suggests that it would be delivered first, and the ready time
      for both sources is reached during the same main context iteration,
      then the order of dispatch is undefined.
      
      It is a no-op to call this function on a #GSource which has already been
      destroyed with [glib.source.Source.destroy].
      
      This API is only intended to be used by implementations of #GSource.
      Do not call this API on a #GSource that you did not create.
  
      Params:
        readyTime = the monotonic time at which the source will be ready,
                       0 for "immediately", -1 for "never"
  */
  void setReadyTime(long readyTime)
  {
    g_source_set_ready_time(cast(GSource*)this._cPtr, readyTime);
  }

  /**
      A variant of [glib.source.Source.setName] that does not
      duplicate the name, and can only be used with
      string literals.
  
      Params:
        name = debug name for the source
  */
  void setStaticName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    g_source_set_static_name(cast(GSource*)this._cPtr, _name);
  }

  /**
      Removes the source with the given ID from the default main context. You must
      use [glib.source.Source.destroy] for sources added to a non-default main context.
      
      The ID of a #GSource is given by [glib.source.Source.getId], or will be
      returned by the functions [glib.source.Source.attach], [glib.global.idleAdd],
      [glib.global.idleAddFull], [glib.global.timeoutAdd], [glib.global.timeoutAddFull],
      [glib.global.childWatchAdd], [glib.global.childWatchAddFull], [glib.global.ioAddWatch], and
      [glib.global.ioAddWatchFull].
      
      It is a programmer error to attempt to remove a non-existent source.
      
      More specifically: source IDs can be reissued after a source has been
      destroyed and therefore it is never valid to use this function with a
      source ID which may have already been removed.  An example is when
      scheduling an idle to run in another thread with [glib.global.idleAdd]: the
      idle may already have run and been removed by the time this function
      is called on its (now invalid) source ID.  This source ID may have
      been reissued, leading to the operation being performed against the
      wrong source.
  
      Params:
        tag = the ID of the source to remove.
      Returns: true if the source was found and removed.
  */
  static bool remove(uint tag)
  {
    bool _retval;
    _retval = cast(bool)g_source_remove(tag);
    return _retval;
  }

  /**
      Removes a source from the default main loop context given the
      source functions and user data. If multiple sources exist with the
      same source functions and user data, only one will be destroyed.
  
      Params:
        funcs = The source_funcs passed to [glib.source.Source.new_]
        userData = the user data for the callback
      Returns: true if a source was found and removed.
  */
  static bool removeByFuncsUserData(glib.types.SourceFuncs funcs, void* userData = null)
  {
    bool _retval;
    _retval = cast(bool)g_source_remove_by_funcs_user_data(&funcs, userData);
    return _retval;
  }

  /**
      Removes a source from the default main loop context given the user
      data for the callback. If multiple sources exist with the same user
      data, only one will be destroyed.
  
      Params:
        userData = the user_data for the callback.
      Returns: true if a source was found and removed.
  */
  static bool removeByUserData(void* userData = null)
  {
    bool _retval;
    _retval = cast(bool)g_source_remove_by_user_data(userData);
    return _retval;
  }

  /**
      Sets the name of a source using its ID.
      
      This is a convenience utility to set source names from the return
      value of [glib.global.idleAdd], [glib.global.timeoutAdd], etc.
      
      It is a programmer error to attempt to set the name of a non-existent
      source.
      
      More specifically: source IDs can be reissued after a source has been
      destroyed and therefore it is never valid to use this function with a
      source ID which may have already been removed.  An example is when
      scheduling an idle to run in another thread with [glib.global.idleAdd]: the
      idle may already have run and been removed by the time this function
      is called on its (now invalid) source ID.  This source ID may have
      been reissued, leading to the operation being performed against the
      wrong source.
  
      Params:
        tag = a #GSource ID
        name = debug name for the source
  */
  static void setNameById(uint tag, string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    g_source_set_name_by_id(tag, _name);
  }
}
