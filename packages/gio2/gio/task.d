/// Module for [Task] class
module gio.task;

import gid.gid;
import gio.async_result;
import gio.async_result_mixin;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.types;
import glib.error;
import glib.main_context;
import glib.types;
import gobject.object;
import gobject.value;

/**
    A [gio.task.Task] represents and manages a cancellable ‘task’.
    
    ## Asynchronous operations
    
    The most common usage of [gio.task.Task] is as a [gio.async_result.AsyncResult], to
    manage data during an asynchronous operation. You call
    [gio.task.Task.new_] in the ‘start’ method, followed by
    [gio.task.Task.setTaskData] and the like if you need to keep some
    additional data associated with the task, and then pass the
    task object around through your asynchronous operation.
    Eventually, you will call a method such as
    [gio.task.Task.returnPointer] or [gio.task.Task.returnError], which
    will save the value you give it and then invoke the task’s callback
    function in the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault])
    where it was created (waiting until the next iteration of the main
    loop first, if necessary). The caller will pass the [gio.task.Task] back to
    the operation’s finish function (as a [gio.async_result.AsyncResult]), and you can
    use [gio.task.Task.propagatePointer] or the like to extract the
    return value.
    
    Using [gio.task.Task] requires the thread-default [glib.main_context.MainContext] from when
    the [gio.task.Task] was constructed to be running at least until the task has
    completed and its data has been freed.
    
    If a [gio.task.Task] has been constructed and its callback set, it is an error to
    not call `g_task_return_*()` on it. GLib will warn at runtime if this happens
    (since 2.76).
    
    Here is an example for using [gio.task.Task] as a [gio.async_result.AsyncResult]:
    ```c
    typedef struct {
      CakeFrostingType frosting;
      char *message;
    } DecorationData;
    
    static void
    decoration_data_free (DecorationData *decoration)
    {
      g_free (decoration->message);
      g_slice_free (DecorationData, decoration);
    }
    
    static void
    baked_cb (Cake     *cake,
              gpointer  user_data)
    {
      GTask *task = user_data;
      DecorationData *decoration = g_task_get_task_data (task);
      GError *error = NULL;
    
      if (cake == NULL)
        {
          g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,
                                   "Go to the supermarket");
          g_object_unref (task);
          return;
        }
    
      if (!cake_decorate (cake, decoration->frosting, decoration->message, &error))
        {
          g_object_unref (cake);
          // g_task_return_error() takes ownership of error
          g_task_return_error (task, error);
          g_object_unref (task);
          return;
        }
    
      g_task_return_pointer (task, cake, g_object_unref);
      g_object_unref (task);
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      GTask *task;
      DecorationData *decoration;
      Cake  *cake;
    
      task = g_task_new (self, cancellable, callback, user_data);
      if (radius < 3)
        {
          g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_TOO_SMALL,
                                   "%ucm radius cakes are silly",
                                   radius);
          g_object_unref (task);
          return;
        }
    
      cake = _baker_get_cached_cake (self, radius, flavor, frosting, message);
      if (cake != NULL)
        {
          // _baker_get_cached_cake() returns a reffed cake
          g_task_return_pointer (task, cake, g_object_unref);
          g_object_unref (task);
          return;
        }
    
      decoration = g_slice_new (DecorationData);
      decoration->frosting = frosting;
      decoration->message = g_strdup (message);
      g_task_set_task_data (task, decoration, (GDestroyNotify) decoration_data_free);
    
      _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);
    }
    
    Cake *
    baker_bake_cake_finish (Baker         *self,
                            GAsyncResult  *result,
                            GError       **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, self), NULL);
    
      return g_task_propagate_pointer (G_TASK (result), error);
    }
    ```
    
    ## Chained asynchronous operations
    
    [gio.task.Task] also tries to simplify asynchronous operations that
    internally chain together several smaller asynchronous
    operations. [gio.task.Task.getCancellable], [gio.task.Task.getContext],
    and [gio.task.Task.getPriority] allow you to get back the task’s
    [gio.cancellable.Cancellable], [glib.main_context.MainContext], and
    [I/O priority](iface.AsyncResult.html#io-priority)
    when starting a new subtask, so you don’t have to keep track
    of them yourself. [gio.task.Task.attachSource] simplifies the case
    of waiting for a source to fire (automatically using the correct
    [glib.main_context.MainContext] and priority).
    
    Here is an example for chained asynchronous operations:
    ```c
    typedef struct {
      Cake *cake;
      CakeFrostingType frosting;
      char *message;
    } BakingData;
    
    static void
    decoration_data_free (BakingData *bd)
    {
      if (bd->cake)
        g_object_unref (bd->cake);
      g_free (bd->message);
      g_slice_free (BakingData, bd);
    }
    
    static void
    decorated_cb (Cake         *cake,
                  GAsyncResult *result,
                  gpointer      user_data)
    {
      GTask *task = user_data;
      GError *error = NULL;
    
      if (!cake_decorate_finish (cake, result, &error))
        {
          g_object_unref (cake);
          g_task_return_error (task, error);
          g_object_unref (task);
          return;
        }
    
      // baking_data_free() will drop its ref on the cake, so we have to
      // take another here to give to the caller.
      g_task_return_pointer (task, g_object_ref (cake), g_object_unref);
      g_object_unref (task);
    }
    
    static gboolean
    decorator_ready (gpointer user_data)
    {
      GTask *task = user_data;
      BakingData *bd = g_task_get_task_data (task);
    
      cake_decorate_async (bd->cake, bd->frosting, bd->message,
                           g_task_get_cancellable (task),
                           decorated_cb, task);
    
      return G_SOURCE_REMOVE;
    }
    
    static void
    baked_cb (Cake     *cake,
              gpointer  user_data)
    {
      GTask *task = user_data;
      BakingData *bd = g_task_get_task_data (task);
      GError *error = NULL;
    
      if (cake == NULL)
        {
          g_task_return_new_error (task, BAKER_ERROR, BAKER_ERROR_NO_FLOUR,
                                   "Go to the supermarket");
          g_object_unref (task);
          return;
        }
    
      bd->cake = cake;
    
      // Bail out now if the user has already cancelled
      if (g_task_return_error_if_cancelled (task))
        {
          g_object_unref (task);
          return;
        }
    
      if (cake_decorator_available (cake))
        decorator_ready (task);
      else
        {
          GSource *source;
    
          source = cake_decorator_wait_source_new (cake);
          // Attach @source to @task’s GMainContext and have it call
          // decorator_ready() when it is ready.
          g_task_attach_source (task, source, decorator_ready);
          g_source_unref (source);
        }
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           gint                 priority,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      GTask *task;
      BakingData *bd;
    
      task = g_task_new (self, cancellable, callback, user_data);
      g_task_set_priority (task, priority);
    
      bd = g_slice_new0 (BakingData);
      bd->frosting = frosting;
      bd->message = g_strdup (message);
      g_task_set_task_data (task, bd, (GDestroyNotify) baking_data_free);
    
      _baker_begin_cake (self, radius, flavor, cancellable, baked_cb, task);
    }
    
    Cake *
    baker_bake_cake_finish (Baker         *self,
                            GAsyncResult  *result,
                            GError       **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, self), NULL);
    
      return g_task_propagate_pointer (G_TASK (result), error);
    }
    ```
    
    ## Asynchronous operations from synchronous ones
    
    You can use [gio.task.Task.runInThread] to turn a synchronous
    operation into an asynchronous one, by running it in a thread.
    When it completes, the result will be dispatched to the thread-default main
    context (see [glib.main_context.MainContext.pushThreadDefault]) where the [gio.task.Task]
    was created.
    
    Running a task in a thread:
    ```c
    typedef struct {
      guint radius;
      CakeFlavor flavor;
      CakeFrostingType frosting;
      char *message;
    } CakeData;
    
    static void
    cake_data_free (CakeData *cake_data)
    {
      g_free (cake_data->message);
      g_slice_free (CakeData, cake_data);
    }
    
    static void
    bake_cake_thread (GTask         *task,
                      gpointer       source_object,
                      gpointer       task_data,
                      GCancellable  *cancellable)
    {
      Baker *self = source_object;
      CakeData *cake_data = task_data;
      Cake *cake;
      GError *error = NULL;
    
      cake = bake_cake (baker, cake_data->radius, cake_data->flavor,
                        cake_data->frosting, cake_data->message,
                        cancellable, &error);
      if (cake)
        g_task_return_pointer (task, cake, g_object_unref);
      else
        g_task_return_error (task, error);
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      CakeData *cake_data;
      GTask *task;
    
      cake_data = g_slice_new (CakeData);
      cake_data->radius = radius;
      cake_data->flavor = flavor;
      cake_data->frosting = frosting;
      cake_data->message = g_strdup (message);
      task = g_task_new (self, cancellable, callback, user_data);
      g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
      g_task_run_in_thread (task, bake_cake_thread);
      g_object_unref (task);
    }
    
    Cake *
    baker_bake_cake_finish (Baker         *self,
                            GAsyncResult  *result,
                            GError       **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, self), NULL);
    
      return g_task_propagate_pointer (G_TASK (result), error);
    }
    ```
    
    ## Adding cancellability to uncancellable tasks
    
    Finally, [gio.task.Task.runInThread] and
    [gio.task.Task.runInThreadSync] can be used to turn an uncancellable
    operation into a cancellable one. If you call
    [gio.task.Task.setReturnOnCancel], passing `TRUE`, then if the task’s
    [gio.cancellable.Cancellable] is cancelled, it will return control back to the
    caller immediately, while allowing the task thread to continue running in the
    background (and simply discarding its result when it finally does finish).
    Provided that the task thread is careful about how it uses
    locks and other externally-visible resources, this allows you
    to make ‘GLib-friendly’ asynchronous and cancellable
    synchronous variants of blocking APIs.
    
    Cancelling a task:
    ```c
    static void
    bake_cake_thread (GTask         *task,
                      gpointer       source_object,
                      gpointer       task_data,
                      GCancellable  *cancellable)
    {
      Baker *self = source_object;
      CakeData *cake_data = task_data;
      Cake *cake;
      GError *error = NULL;
    
      cake = bake_cake (baker, cake_data->radius, cake_data->flavor,
                        cake_data->frosting, cake_data->message,
                        &error);
      if (error)
        {
          g_task_return_error (task, error);
          return;
        }
    
      // If the task has already been cancelled, then we don’t want to add
      // the cake to the cake cache. Likewise, we don’t  want to have the
      // task get cancelled in the middle of updating the cache.
      // g_task_set_return_on_cancel() will return %TRUE here if it managed
      // to disable return-on-cancel, or %FALSE if the task was cancelled
      // before it could.
      if (g_task_set_return_on_cancel (task, FALSE))
        {
          // If the caller cancels at this point, their
          // GAsyncReadyCallback won’t be invoked until we return,
          // so we don’t have to worry that this code will run at
          // the same time as that code does. But if there were
          // other functions that might look at the cake cache,
          // then we’d probably need a GMutex here as well.
          baker_add_cake_to_cache (baker, cake);
          g_task_return_pointer (task, cake, g_object_unref);
        }
    }
    
    void
    baker_bake_cake_async (Baker               *self,
                           guint                radius,
                           CakeFlavor           flavor,
                           CakeFrostingType     frosting,
                           const char          *message,
                           GCancellable        *cancellable,
                           GAsyncReadyCallback  callback,
                           gpointer             user_data)
    {
      CakeData *cake_data;
      GTask *task;
    
      cake_data = g_slice_new (CakeData);
    
      ...
    
      task = g_task_new (self, cancellable, callback, user_data);
      g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
      g_task_set_return_on_cancel (task, TRUE);
      g_task_run_in_thread (task, bake_cake_thread);
    }
    
    Cake *
    baker_bake_cake_sync (Baker               *self,
                          guint                radius,
                          CakeFlavor           flavor,
                          CakeFrostingType     frosting,
                          const char          *message,
                          GCancellable        *cancellable,
                          GError             **error)
    {
      CakeData *cake_data;
      GTask *task;
      Cake *cake;
    
      cake_data = g_slice_new (CakeData);
    
      ...
    
      task = g_task_new (self, cancellable, NULL, NULL);
      g_task_set_task_data (task, cake_data, (GDestroyNotify) cake_data_free);
      g_task_set_return_on_cancel (task, TRUE);
      g_task_run_in_thread_sync (task, bake_cake_thread);
    
      cake = g_task_propagate_pointer (task, error);
      g_object_unref (task);
      return cake;
    }
    ```
    
    ## Porting from [gio.simple_async_result.SimpleAsyncResult]
    
    [gio.task.Task]’s API attempts to be simpler than [gio.simple_async_result.SimpleAsyncResult]’s
    in several ways:
    
    $(LIST
      * You can save task-specific data with [gio.task.Task.setTaskData], and
        retrieve it later with [gio.task.Task.getTaskData]. This replaces the
        abuse of [gio.simple_async_result.SimpleAsyncResult.setOpResGpointer] for the same
        purpose with [gio.simple_async_result.SimpleAsyncResult].
      * In addition to the task data, [gio.task.Task] also keeps track of the
        [priority](iface.AsyncResult.html#io-priority), [gio.cancellable.Cancellable],
        and [glib.main_context.MainContext] associated with the task, so tasks that
        consist of a chain of simpler asynchronous operations will have easy access
        to those values when starting each sub-task.
      * [gio.task.Task.returnErrorIfCancelled] provides simplified
        handling for cancellation. In addition, cancellation
        overrides any other [gio.task.Task] return value by default, like
        [gio.simple_async_result.SimpleAsyncResult] does when
        [gio.simple_async_result.SimpleAsyncResult.setCheckCancellable] is called.
        (You can use [gio.task.Task.setCheckCancellable] to turn off that
        behavior.) On the other hand, [gio.task.Task.runInThread]
        guarantees that it will always run your
        `task_func`, even if the task’s [gio.cancellable.Cancellable]
        is already cancelled before the task gets a chance to run;
        you can start your `task_func` with a
        [gio.task.Task.returnErrorIfCancelled] check if you need the
        old behavior.
      * The ‘return’ methods (eg, [gio.task.Task.returnPointer])
        automatically cause the task to be ‘completed’ as well, and
        there is no need to worry about the ‘complete’ vs ‘complete in idle’
        distinction. ([gio.task.Task] automatically figures out
        whether the task’s callback can be invoked directly, or
        if it needs to be sent to another [glib.main_context.MainContext], or delayed
        until the next iteration of the current [glib.main_context.MainContext].)
      * The ‘finish’ functions for [gio.task.Task] based operations are generally
        much simpler than [gio.simple_async_result.SimpleAsyncResult] ones, normally consisting
        of only a single call to [gio.task.Task.propagatePointer] or the like.
        Since [gio.task.Task.propagatePointer] ‘steals’ the return value from
        the [gio.task.Task], it is not necessary to juggle pointers around to
        prevent it from being freed twice.
      * With [gio.simple_async_result.SimpleAsyncResult], it was common to call
        [gio.simple_async_result.SimpleAsyncResult.propagateError] from the
        `_finish()` wrapper function, and have
        virtual method implementations only deal with successful
        returns. This behavior is deprecated, because it makes it
        difficult for a subclass to chain to a parent class’s async
        methods. Instead, the wrapper function should just be a
        simple wrapper, and the virtual method should call an
        appropriate `g_task_propagate_` function.
        Note that wrapper methods can now use
        [gio.async_result.AsyncResult.legacyPropagateError] to do old-style
        [gio.simple_async_result.SimpleAsyncResult] error-returning behavior, and
        [gio.async_result.AsyncResult.isTagged] to check if a result is tagged as
        having come from the `_async()` wrapper
        function (for ‘short-circuit’ results, such as when passing
        `0` to [gio.input_stream.InputStream.readAsync]).
    )
      
    ## Thread-safety considerations
    
    Due to some infelicities in the API design, there is a
    thread-safety concern that users of [gio.task.Task] have to be aware of:
    
    If the `main` thread drops its last reference to the source object
    or the task data before the task is finalized, then the finalizers
    of these objects may be called on the worker thread.
    
    This is a problem if the finalizers use non-threadsafe API, and
    can lead to hard-to-debug crashes. Possible workarounds include:
    
    $(LIST
      * Clear task data in a signal handler for `notify::completed`
      * Keep iterating a main context in the main thread and defer
        dropping the reference to the source object to that main
        context when the task is finalized
    )
*/
class Task : gobject.object.ObjectWrap, gio.async_result.AsyncResult
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
    return cast(void function())g_task_get_type != &gidSymbolNotFound ? g_task_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Task self()
  {
    return this;
  }

  /**
      Get `completed` property.
      Returns: Whether the task has completed, meaning its callback (if set) has been
      invoked.
      
      This can only happen after [gio.task.Task.returnPointer],
      [gio.task.Task.returnError] or one of the other return functions have been called
      on the task. However, it is not guaranteed to happen immediately after
      those functions are called, as the task’s callback may need to be scheduled
      to run in a different thread.
      
      That means it is **not safe** to use this property to track whether a
      return function has been called on the #GTask. Callers must do that
      tracking themselves, typically by linking the lifetime of the #GTask to the
      control flow of their code.
      
      This property is guaranteed to change from false to true exactly once.
      
      The #GObject::notify signal for this change is emitted in the same main
      context as the task’s callback, immediately after that callback is invoked.
  */
  @property bool completed()
  {
    return getCompleted();
  }

  mixin AsyncResultT!();

  /**
      Creates a #GTask acting on source_object, which will eventually be
      used to invoke callback in the current
      [thread-default main context][g-main-context-push-thread-default].
      
      Call this in the "start" method of your asynchronous method, and
      pass the #GTask around throughout the asynchronous operation. You
      can use [gio.task.Task.setTaskData] to attach task-specific data to the
      object, which you can retrieve later via [gio.task.Task.getTaskData].
      
      By default, if cancellable is cancelled, then the return value of
      the task will always be [gio.types.IOErrorEnum.Cancelled], even if the task had
      already completed before the cancellation. This allows for
      simplified handling in cases where cancellation may imply that
      other objects that the task depends on have been destroyed. If you
      do not want this behavior, you can use
      [gio.task.Task.setCheckCancellable] to change it.
  
      Params:
        sourceObject = the #GObject that owns
            this task, or null.
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback.
      Returns: a #GTask.
  */
  this(gobject.object.ObjectWrap sourceObject = null, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    GTask* _cretval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _cretval = g_task_new(sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
    this(_cretval, Yes.Take);
  }

  /**
      Checks that result is a #GTask, and that source_object is its
      source object (or that source_object is null and result has no
      source object). This can be used in g_return_if_fail() checks.
  
      Params:
        result = A #GAsyncResult
        sourceObject = the source object
            expected to be associated with the task
      Returns: true if result and source_object are valid, false
        if not
  */
  static bool isValid(gio.async_result.AsyncResult result, gobject.object.ObjectWrap sourceObject = null)
  {
    bool _retval;
    _retval = cast(bool)g_task_is_valid(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Creates a #GTask and then immediately calls [gio.task.Task.returnError]
      on it. Use this in the wrapper function of an asynchronous method
      when you want to avoid even calling the virtual method. You can
      then use [gio.async_result.AsyncResult.isTagged] in the finish method wrapper to
      check if the result there is tagged as having been created by the
      wrapper method, and deal with it appropriately if so.
      
      See also [gio.task.Task.reportNewError].
  
      Params:
        sourceObject = the #GObject that owns
            this task, or null.
        callback = a #GAsyncReadyCallback.
        sourceTag = an opaque pointer indicating the source of this task
        error = error to report
  */
  static void reportError(gobject.object.ObjectWrap sourceObject, gio.types.AsyncReadyCallback callback, void* sourceTag, glib.error.ErrorWrap error)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_task_report_error(sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, _callbackCB, _callback, sourceTag, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Gets task's #GCancellable
      Returns: task's #GCancellable
  */
  gio.cancellable.Cancellable getCancellable()
  {
    GCancellable* _cretval;
    _cretval = g_task_get_cancellable(cast(GTask*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.cancellable.Cancellable)(cast(GCancellable*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets task's check-cancellable flag. See
      [gio.task.Task.setCheckCancellable] for more details.
      Returns: 
  */
  bool getCheckCancellable()
  {
    bool _retval;
    _retval = cast(bool)g_task_get_check_cancellable(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Gets the value of #GTask:completed. This changes from false to true after
      the task’s callback is invoked, and will return false if called from inside
      the callback.
      Returns: true if the task has completed, false otherwise.
  */
  bool getCompleted()
  {
    bool _retval;
    _retval = cast(bool)g_task_get_completed(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Gets the #GMainContext that task will return its result in (that
      is, the context that was the
      [thread-default main context][g-main-context-push-thread-default]
      at the point when task was created).
      
      This will always return a non-null value, even if the task's
      context is the default #GMainContext.
      Returns: task's #GMainContext
  */
  glib.main_context.MainContext getContext()
  {
    GMainContext* _cretval;
    _cretval = g_task_get_context(cast(GTask*)this._cPtr);
    auto _retval = _cretval ? new glib.main_context.MainContext(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets task’s name. See [gio.task.Task.setName].
      Returns: task’s name, or null
  */
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_task_get_name(cast(GTask*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets task's priority
      Returns: task's priority
  */
  int getPriority()
  {
    int _retval;
    _retval = g_task_get_priority(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Gets task's return-on-cancel flag. See
      [gio.task.Task.setReturnOnCancel] for more details.
      Returns: 
  */
  bool getReturnOnCancel()
  {
    bool _retval;
    _retval = cast(bool)g_task_get_return_on_cancel(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Gets the source object from task. Like
      [gio.async_result.AsyncResult.getSourceObject], but does not ref the object.
      Returns: task's source object, or null
  */
  gobject.object.ObjectWrap getSourceObject()
  {
    GObject* _cretval;
    _cretval = g_task_get_source_object(cast(GTask*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, No.Take);
    return _retval;
  }

  /**
      Gets task's source tag. See [gio.task.Task.setSourceTag].
      Returns: task's source tag
  */
  void* getSourceTag()
  {
    auto _retval = g_task_get_source_tag(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Gets task's `task_data`.
      Returns: task's `task_data`.
  */
  void* getTaskData()
  {
    auto _retval = g_task_get_task_data(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Tests if task resulted in an error.
      Returns: true if the task resulted in an error, false otherwise.
  */
  bool hadError()
  {
    bool _retval;
    _retval = cast(bool)g_task_had_error(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Gets the result of task as a #gboolean.
      
      If the task resulted in an error, or was cancelled, then this will
      instead return false and set error.
      
      Since this method transfers ownership of the return value (or
      error) to the caller, you may only call it once.
      Returns: the task result, or false on error
      Throws: [ErrorWrap]
  */
  bool propagateBoolean()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_task_propagate_boolean(cast(GTask*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the result of task as an integer (#gssize).
      
      If the task resulted in an error, or was cancelled, then this will
      instead return -1 and set error.
      
      Since this method transfers ownership of the return value (or
      error) to the caller, you may only call it once.
      Returns: the task result, or -1 on error
      Throws: [ErrorWrap]
  */
  ptrdiff_t propagateInt()
  {
    ptrdiff_t _retval;
    GError *_err;
    _retval = g_task_propagate_int(cast(GTask*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the result of task as a pointer, and transfers ownership
      of that value to the caller.
      
      If the task resulted in an error, or was cancelled, then this will
      instead return null and set error.
      
      Since this method transfers ownership of the return value (or
      error) to the caller, you may only call it once.
      Returns: the task result, or null on error
      Throws: [ErrorWrap]
  */
  void* propagatePointer()
  {
    GError *_err;
    auto _retval = g_task_propagate_pointer(cast(GTask*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the result of task as a #GValue, and transfers ownership of
      that value to the caller. As with [gio.task.Task.returnValue], this is
      a generic low-level method; [gio.task.Task.propagatePointer] and the like
      will usually be more useful for C code.
      
      If the task resulted in an error, or was cancelled, then this will
      instead set error and return false.
      
      Since this method transfers ownership of the return value (or
      error) to the caller, you may only call it once.
  
      Params:
        value = return location for the #GValue
      Returns: true if task succeeded, false on error.
      Throws: [ErrorWrap]
  */
  bool propagateValue(out gobject.value.Value value)
  {
    bool _retval;
    GValue _value;
    GError *_err;
    _retval = cast(bool)g_task_propagate_value(cast(GTask*)this._cPtr, &_value, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    value = new gobject.value.Value(cast(void*)&_value, No.Take);
    return _retval;
  }

  /**
      Sets task's result to result and completes the task (see
      [gio.task.Task.returnPointer] for more discussion of exactly what this
      means).
  
      Params:
        result = the #gboolean result of a task function.
  */
  void returnBoolean(bool result)
  {
    g_task_return_boolean(cast(GTask*)this._cPtr, result);
  }

  /**
      Sets task's result to error (which task assumes ownership of)
      and completes the task (see [gio.task.Task.returnPointer] for more
      discussion of exactly what this means).
      
      Note that since the task takes ownership of error, and since the
      task may be completed before returning from [gio.task.Task.returnError],
      you cannot assume that error is still valid after calling this.
      Call [glib.error.ErrorWrap.copy] on the error if you need to keep a local copy
      as well.
      
      See also [gio.task.Task.returnNewError],
      [gio.task.Task.returnNewErrorLiteral].
  
      Params:
        error = the #GError result of a task function.
  */
  void returnError(glib.error.ErrorWrap error)
  {
    g_task_return_error(cast(GTask*)this._cPtr, error ? cast(GError*)error._cPtr : null);
  }

  /**
      Checks if task's #GCancellable has been cancelled, and if so, sets
      task's error accordingly and completes the task (see
      [gio.task.Task.returnPointer] for more discussion of exactly what this
      means).
      Returns: true if task has been cancelled, false if not
  */
  bool returnErrorIfCancelled()
  {
    bool _retval;
    _retval = cast(bool)g_task_return_error_if_cancelled(cast(GTask*)this._cPtr);
    return _retval;
  }

  /**
      Sets task's result to result and completes the task (see
      [gio.task.Task.returnPointer] for more discussion of exactly what this
      means).
  
      Params:
        result = the integer (#gssize) result of a task function.
  */
  void returnInt(ptrdiff_t result)
  {
    g_task_return_int(cast(GTask*)this._cPtr, result);
  }

  /**
      Sets task’s result to a new [glib.error.ErrorWrap] created from domain, code,
      message and completes the task.
      
      See [gio.task.Task.returnPointer] for more discussion of exactly what
      ‘completing the task’ means.
      
      See also [gio.task.Task.returnNewError].
  
      Params:
        domain = a #GQuark.
        code = an error code.
        message = an error message
  */
  void returnNewErrorLiteral(glib.types.Quark domain, int code, string message)
  {
    const(char)* _message = message.toCString(No.Alloc);
    g_task_return_new_error_literal(cast(GTask*)this._cPtr, domain, code, _message);
  }

  /**
      Sets task's result to result and completes the task. If result
      is not null, then result_destroy will be used to free result if
      the caller does not take ownership of it with
      [gio.task.Task.propagatePointer].
      
      "Completes the task" means that for an ordinary asynchronous task
      it will either invoke the task's callback, or else queue that
      callback to be invoked in the proper #GMainContext, or in the next
      iteration of the current #GMainContext. For a task run via
      [gio.task.Task.runInThread] or [gio.task.Task.runInThreadSync], calling this
      method will save result to be returned to the caller later, but
      the task will not actually be completed until the #GTaskThreadFunc
      exits.
      
      Note that since the task may be completed before returning from
      [gio.task.Task.returnPointer], you cannot assume that result is still
      valid after calling this, unless you are still holding another
      reference on it.
  
      Params:
        result = the pointer result of a task
              function
        resultDestroy = a #GDestroyNotify function.
  */
  void returnPointer(void* result = null, glib.types.DestroyNotify resultDestroy = null)
  {
    extern(C) void _resultDestroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _resultDestroyCB = resultDestroy ? &_resultDestroyCallback : null;
    g_task_return_pointer(cast(GTask*)this._cPtr, result, _resultDestroyCB);
  }

  /**
      Sets task's result to result (by copying it) and completes the task.
      
      If result is null then a #GValue of type `G_TYPE_POINTER`
      with a value of null will be used for the result.
      
      This is a very generic low-level method intended primarily for use
      by language bindings; for C code, [gio.task.Task.returnPointer] and the
      like will normally be much easier to use.
  
      Params:
        result = the #GValue result of
                                               a task function
  */
  void returnValue(gobject.value.Value result = null)
  {
    g_task_return_value(cast(GTask*)this._cPtr, result ? cast(GValue*)result._cPtr(No.Dup) : null);
  }

  /**
      Runs task_func in another thread. When task_func returns, task's
      #GAsyncReadyCallback will be invoked in task's #GMainContext.
      
      This takes a ref on task until the task completes.
      
      See #GTaskThreadFunc for more details about how task_func is handled.
      
      Although GLib currently rate-limits the tasks queued via
      [gio.task.Task.runInThread], you should not assume that it will always
      do this. If you have a very large number of tasks to run (several tens of
      tasks), but don't want them to all run at once, you should only queue a
      limited number of them (around ten) at a time.
      
      Be aware that if your task depends on other tasks to complete, use of this
      function could lead to a livelock if the other tasks also use this function
      and enough of them (around 10) execute in a dependency chain, as that will
      exhaust the thread pool. If this situation is possible, consider using a
      separate worker thread or thread pool explicitly, rather than using
      [gio.task.Task.runInThread].
  
      Params:
        taskFunc = a #GTaskThreadFunc
  */
  void runInThread(gio.types.TaskThreadFunc taskFunc)
  {
    extern(C) void _taskFuncCallback(GTask* task, GObject* sourceObject, void* taskData, GCancellable* cancellable)
    {
      ptrThawGC(taskData);
      auto _dlg = cast(gio.types.TaskThreadFunc*)taskData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.task.Task)(cast(void*)task, No.Take), gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
    }
    auto _taskFuncCB = taskFunc ? &_taskFuncCallback : null;
    g_task_run_in_thread(cast(GTask*)this._cPtr, _taskFuncCB);
  }

  /**
      Runs task_func in another thread, and waits for it to return or be
      cancelled. You can use [gio.task.Task.propagatePointer], etc, afterward
      to get the result of task_func.
      
      See #GTaskThreadFunc for more details about how task_func is handled.
      
      Normally this is used with tasks created with a null
      `callback`, but note that even if the task does
      have a callback, it will not be invoked when task_func returns.
      #GTask:completed will be set to true just before this function returns.
      
      Although GLib currently rate-limits the tasks queued via
      [gio.task.Task.runInThreadSync], you should not assume that it will
      always do this. If you have a very large number of tasks to run,
      but don't want them to all run at once, you should only queue a
      limited number of them at a time.
  
      Params:
        taskFunc = a #GTaskThreadFunc
  */
  void runInThreadSync(gio.types.TaskThreadFunc taskFunc)
  {
    extern(C) void _taskFuncCallback(GTask* task, GObject* sourceObject, void* taskData, GCancellable* cancellable)
    {
      ptrThawGC(taskData);
      auto _dlg = cast(gio.types.TaskThreadFunc*)taskData;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gio.task.Task)(cast(void*)task, No.Take), gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
    }
    auto _taskFuncCB = taskFunc ? &_taskFuncCallback : null;
    g_task_run_in_thread_sync(cast(GTask*)this._cPtr, _taskFuncCB);
  }

  /**
      Sets or clears task's check-cancellable flag. If this is true
      (the default), then [gio.task.Task.propagatePointer], etc, and
      [gio.task.Task.hadError] will check the task's #GCancellable first, and
      if it has been cancelled, then they will consider the task to have
      returned an "Operation was cancelled" error
      ([gio.types.IOErrorEnum.Cancelled]), regardless of any other error or return
      value the task may have had.
      
      If check_cancellable is false, then the #GTask will not check the
      cancellable itself, and it is up to task's owner to do this (eg,
      via [gio.task.Task.returnErrorIfCancelled]).
      
      If you are using [gio.task.Task.setReturnOnCancel] as well, then
      you must leave check-cancellable set true.
  
      Params:
        checkCancellable = whether #GTask will check the state of
            its #GCancellable for you.
  */
  void setCheckCancellable(bool checkCancellable)
  {
    g_task_set_check_cancellable(cast(GTask*)this._cPtr, checkCancellable);
  }

  /**
      Sets task’s name, used in debugging and profiling. The name defaults to
      null.
      
      The task name should describe in a human readable way what the task does.
      For example, ‘Open file’ or ‘Connect to network host’. It is used to set the
      name of the #GSource used for idle completion of the task.
      
      This function may only be called before the task is first used in a thread
      other than the one it was constructed in. It is called automatically by
      [gio.task.Task.setSourceTag] if not called already.
  
      Params:
        name = a human readable name for the task, or null to unset it
  */
  void setName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    g_task_set_name(cast(GTask*)this._cPtr, _name);
  }

  /**
      Sets task's priority. If you do not call this, it will default to
      `G_PRIORITY_DEFAULT`.
      
      This will affect the priority of #GSources created with
      [gio.task.Task.attachSource] and the scheduling of tasks run in threads,
      and can also be explicitly retrieved later via
      [gio.task.Task.getPriority].
  
      Params:
        priority = the [priority](iface.AsyncResult.html#io-priority) of the request
  */
  void setPriority(int priority)
  {
    g_task_set_priority(cast(GTask*)this._cPtr, priority);
  }

  /**
      Sets or clears task's return-on-cancel flag. This is only
      meaningful for tasks run via [gio.task.Task.runInThread] or
      [gio.task.Task.runInThreadSync].
      
      If return_on_cancel is true, then cancelling task's
      #GCancellable will immediately cause it to return, as though the
      task's #GTaskThreadFunc had called
      [gio.task.Task.returnErrorIfCancelled] and then returned.
      
      This allows you to create a cancellable wrapper around an
      uninterruptible function. The #GTaskThreadFunc just needs to be
      careful that it does not modify any externally-visible state after
      it has been cancelled. To do that, the thread should call
      [gio.task.Task.setReturnOnCancel] again to (atomically) set
      return-on-cancel false before making externally-visible changes;
      if the task gets cancelled before the return-on-cancel flag could
      be changed, [gio.task.Task.setReturnOnCancel] will indicate this by
      returning false.
      
      You can disable and re-enable this flag multiple times if you wish.
      If the task's #GCancellable is cancelled while return-on-cancel is
      false, then calling [gio.task.Task.setReturnOnCancel] to set it true
      again will cause the task to be cancelled at that point.
      
      If the task's #GCancellable is already cancelled before you call
      [gio.task.Task.runInThread]/[gio.task.Task.runInThreadSync], then the
      #GTaskThreadFunc will still be run (for consistency), but the task
      will also be completed right away.
  
      Params:
        returnOnCancel = whether the task returns automatically when
            it is cancelled.
      Returns: true if task's return-on-cancel flag was changed to
          match return_on_cancel. false if task has already been
          cancelled.
  */
  bool setReturnOnCancel(bool returnOnCancel)
  {
    bool _retval;
    _retval = cast(bool)g_task_set_return_on_cancel(cast(GTask*)this._cPtr, returnOnCancel);
    return _retval;
  }

  /**
      Sets task's source tag.
      
      You can use this to tag a task return
      value with a particular pointer (usually a pointer to the function
      doing the tagging) and then later check it using
      [gio.task.Task.getSourceTag] (or [gio.async_result.AsyncResult.isTagged]) in the
      task's "finish" function, to figure out if the response came from a
      particular place.
      
      A macro wrapper around this function will automatically set the
      task’s name to the string form of source_tag if it’s not already
      set, for convenience.
  
      Params:
        sourceTag = an opaque pointer indicating the source of this task
  */
  void setSourceTag(void* sourceTag = null)
  {
    g_task_set_source_tag(cast(GTask*)this._cPtr, sourceTag);
  }

  /**
      Sets task’s name, used in debugging and profiling.
      
      This is a variant of [gio.task.Task.setName] that avoids copying name.
  
      Params:
        name = a human readable name for the task. Must be a string literal
  */
  void setStaticName(string name = null)
  {
    const(char)* _name = name.toCString(No.Alloc);
    g_task_set_static_name(cast(GTask*)this._cPtr, _name);
  }

  /**
      Sets task's task data (freeing the existing task data, if any).
  
      Params:
        taskData = task-specific data
        taskDataDestroy = #GDestroyNotify for task_data
  */
  void setTaskData(void* taskData = null, glib.types.DestroyNotify taskDataDestroy = null)
  {
    extern(C) void _taskDataDestroyCallback(void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(glib.types.DestroyNotify*)data;

      (*_dlg)();
    }
    auto _taskDataDestroyCB = taskDataDestroy ? &_taskDataDestroyCallback : null;
    g_task_set_task_data(cast(GTask*)this._cPtr, taskData, _taskDataDestroyCB);
  }
}
