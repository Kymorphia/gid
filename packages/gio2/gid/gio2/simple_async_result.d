/// Module for [SimpleAsyncResult] class
module gid.gio2.simple_async_result;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.async_result_mixin;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    As of GLib 2.46, [gid.gio2.simple_async_result.SimpleAsyncResult] is deprecated in favor of
    [gid.gio2.task.Task], which provides a simpler API.
    
    [gid.gio2.simple_async_result.SimpleAsyncResult] implements [gid.gio2.async_result.AsyncResult].
    
    [gid.gio2.simple_async_result.SimpleAsyncResult] handles [gid.gio2.types.AsyncReadyCallback]s, error
    reporting, operation cancellation and the final state of an operation,
    completely transparent to the application. Results can be returned
    as a pointer e.g. for functions that return data that is collected
    asynchronously, a boolean value for checking the success or failure
    of an operation, or a `gssize` for operations which return the number
    of bytes modified by the operation; all of the simple return cases
    are covered.
    
    Most of the time, an application will not need to know of the details
    of this API; it is handled transparently, and any necessary operations
    are handled by [gid.gio2.async_result.AsyncResult]’s interface. However, if implementing
    a new GIO module, for writing language bindings, or for complex
    applications that need better control of how asynchronous operations
    are completed, it is important to understand this functionality.
    
    [gid.gio2.simple_async_result.SimpleAsyncResult]s are tagged with the calling function to ensure
    that asynchronous functions and their finishing functions are used
    together correctly.
    
    To create a new [gid.gio2.simple_async_result.SimpleAsyncResult], call [gid.gio2.simple_async_result.SimpleAsyncResult.new_].
    If the result needs to be created for a [gid.glib2.error.ErrorWrap], use
    [gid.gio2.simple_async_result.SimpleAsyncResult.newFromError] or
    [gid.gio2.simple_async_result.SimpleAsyncResult.newTakeError]. If a [gid.glib2.error.ErrorWrap] is not available
    (e.g. the asynchronous operation doesn’t take a [gid.glib2.error.ErrorWrap] argument),
    but the result still needs to be created for an error condition, use
    [gid.gio2.simple_async_result.SimpleAsyncResult.newError] (or
    [gid.gio2.simple_async_result.SimpleAsyncResult.setErrorVa] if your application or binding
    requires passing a variable argument list directly), and the error can then
    be propagated through the use of
    [gid.gio2.simple_async_result.SimpleAsyncResult.propagateError].
    
    An asynchronous operation can be made to ignore a cancellation event by
    calling [gid.gio2.simple_async_result.SimpleAsyncResult.setHandleCancellation] with a
    [gid.gio2.simple_async_result.SimpleAsyncResult] for the operation and `FALSE`. This is useful for
    operations that are dangerous to cancel, such as close (which would
    cause a leak if cancelled before being run).
    
    [gid.gio2.simple_async_result.SimpleAsyncResult] can integrate into GLib’s event loop,
    [gid.glib2.main_loop.MainLoop], or it can use [gid.glib2.thread.Thread]s.
    [gid.gio2.simple_async_result.SimpleAsyncResult.complete] will finish an I/O task directly
    from the point where it is called.
    [gid.gio2.simple_async_result.SimpleAsyncResult.completeInIdle] will finish it from an idle
    handler in the  thread-default main context (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]) where the [gid.gio2.simple_async_result.SimpleAsyncResult]
    was created. [gid.gio2.simple_async_result.SimpleAsyncResult.runInThread] will run the job in
    a separate thread and then use
    [gid.gio2.simple_async_result.SimpleAsyncResult.completeInIdle] to deliver the result.
    
    To set the results of an asynchronous function,
    [gid.gio2.simple_async_result.SimpleAsyncResult.setOpResGpointer],
    [gid.gio2.simple_async_result.SimpleAsyncResult.setOpResGboolean], and
    [gid.gio2.simple_async_result.SimpleAsyncResult.setOpResGssize]
    are provided, setting the operation's result to a [gid.xlib2.types.void*], `gboolean`, or
    `gssize`, respectively.
    
    Likewise, to get the result of an asynchronous function,
    [gid.gio2.simple_async_result.SimpleAsyncResult.getOpResGpointer],
    [gid.gio2.simple_async_result.SimpleAsyncResult.getOpResGboolean], and
    [gid.gio2.simple_async_result.SimpleAsyncResult.getOpResGssize] are
    provided, getting the operation’s result as a [gid.xlib2.types.void*], `gboolean`, and
    `gssize`, respectively.
    
    For the details of the requirements implementations must respect, see
    [gid.gio2.async_result.AsyncResult].  A typical implementation of an asynchronous
    operation using [gid.gio2.simple_async_result.SimpleAsyncResult] looks something like this:
    
    ```c
    static void
    baked_cb (Cake    *cake,
              gpointer user_data)
    {
      // In this example, this callback is not given a reference to the cake,
      // so the GSimpleAsyncResult has to take a reference to it.
      GSimpleAsyncResult *result = user_data;
    
      if (cake == NULL)
        g_simple_async_result_set_error (result,
                                         BAKER_ERRORS,
                                         BAKER_ERROR_NO_FLOUR,
                                         "Go to the supermarket");
      else
        g_simple_async_result_set_op_res_gpointer (result,
                                                   g_object_ref (cake),
                                                   g_object_unref);
    
    
      // In this example, we assume that baked_cb is called as a callback from
      // the mainloop, so it's safe to complete the operation synchronously here.
      // If, however, _baker_prepare_cake () might call its callback without
      // first returning to the mainloop — inadvisable, but some APIs do so —
      // we would need to use g_simple_async_result_complete_in_idle().
      g_simple_async_result_complete (result);
      g_object_unref (result);
    }
    
    void
    baker_bake_cake_async (Baker              *self,
                           guint               radius,
                           GAsyncReadyCallback callback,
                           gpointer            user_data)
    {
      GSimpleAsyncResult *simple;
      Cake               *cake;
    
      if (radius < 3)
        {
          g_simple_async_report_error_in_idle (G_OBJECT (self),
                                               callback,
                                               user_data,
                                               BAKER_ERRORS,
                                               BAKER_ERROR_TOO_SMALL,
                                               "%ucm radius cakes are silly",
                                               radius);
          return;
        }
    
      simple = g_simple_async_result_new (G_OBJECT (self),
                                          callback,
                                          user_data,
                                          baker_bake_cake_async);
      cake = _baker_get_cached_cake (self, radius);
    
      if (cake != NULL)
        {
          g_simple_async_result_set_op_res_gpointer (simple,
                                                     g_object_ref (cake),
                                                     g_object_unref);
          g_simple_async_result_complete_in_idle (simple);
          g_object_unref (simple);
          // Drop the reference returned by _baker_get_cached_cake();
          // the GSimpleAsyncResult has taken its own reference.
          g_object_unref (cake);
          return;
        }
    
      _baker_prepare_cake (self, radius, baked_cb, simple);
    }
    
    Cake *
    baker_bake_cake_finish (Baker        *self,
                            GAsyncResult *result,
                            GError      **error)
    {
      GSimpleAsyncResult *simple;
      Cake               *cake;
    
      g_return_val_if_fail (g_simple_async_result_is_valid (result,
                                                            G_OBJECT (self),
                                                            baker_bake_cake_async),
                            NULL);
    
      simple = (GSimpleAsyncResult *) result;
    
      if (g_simple_async_result_propagate_error (simple, error))
        return NULL;
    
      cake = CAKE (g_simple_async_result_get_op_res_gpointer (simple));
      return g_object_ref (cake);
    }
    ```
*/
class SimpleAsyncResult : gid.gobject2.object.ObjectWrap, gid.gio2.async_result.AsyncResult
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_simple_async_result_get_type != &gidSymbolNotFound ? g_simple_async_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSimpleAsyncResult";
  }

  /** Returns `this`, for use in `with` statements. */
  override SimpleAsyncResult self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.simple_async_result.SimpleAsyncResult]
      Returns: New builder object
  */
  static SimpleAsyncResultGidBuilder builder() nothrow
  {
    return new SimpleAsyncResultGidBuilder;
  }

  mixin AsyncResultT!();

  /**
      Creates a #GSimpleAsyncResult.
      
      The common convention is to create the #GSimpleAsyncResult in the
      function that starts the asynchronous operation and use that same
      function as the source_tag.
      
      If your operation supports cancellation with #GCancellable (which it
      probably should) then you should provide the user's cancellable to
      [gid.gio2.simple_async_result.SimpleAsyncResult.setCheckCancellable] immediately after
      this function returns.
  
      Params:
        sourceObject = a #GObject, or null.
        callback = a #GAsyncReadyCallback.
        sourceTag = the asynchronous function.
      Returns: a #GSimpleAsyncResult.
  
      Deprecated: Use [gid.gio2.task.Task.new_] instead.
  */
  this(gid.gobject2.object.ObjectWrap sourceObject = null, gid.gio2.types.AsyncReadyCallback callback = null, void* sourceTag = null) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, sourceObject !is null || callback !is null || sourceTag !is null), Yes.Take);
    }
    else
    {
      extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
      {
        gidAttachThread();
        ptrThawGC(data);
        auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

        try
        {
          (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
        }
        catch (Exception e)
        {
          gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
        }
      }
      auto _callbackCB = callback ? &_callbackCallback : null;
      GSimpleAsyncResult* _cretval;
      auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
      _cretval = g_simple_async_result_new(sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, _callbackCB, _callback, sourceTag);
      this(_cretval, Yes.Take);
    }
  }

  /**
      Creates a #GSimpleAsyncResult from an error condition.
  
      Params:
        sourceObject = a #GObject, or null.
        callback = a #GAsyncReadyCallback.
        error = a #GError
      Returns: a #GSimpleAsyncResult.
  
      Deprecated: Use [gid.gio2.task.Task.new_] and [gid.gio2.task.Task.returnError] instead.
  */
  static gid.gio2.simple_async_result.SimpleAsyncResult newFromError(gid.gobject2.object.ObjectWrap sourceObject, gid.gio2.types.AsyncReadyCallback callback, gid.glib2.error.ErrorWrap error) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
      ptrThawGC(data);
      auto _dlg = cast(gid.gio2.types.AsyncReadyCallback*)data;

      try
      {
        (*_dlg)(gid.gobject2.object.ObjectWrap._getDObject!(gid.gobject2.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)res, No.Take));
      }
      catch (Exception e)
      {
        gidInvokeCallbackExceptionHandler(e, "gid.gio2.types.AsyncReadyCallback");
      }
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    GSimpleAsyncResult* _cretval;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _cretval = g_simple_async_result_new_from_error(sourceObject ? cast(GObject*)sourceObject._cPtr(No.Dup) : null, _callbackCB, _callback, error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.simple_async_result.SimpleAsyncResult)(cast(GSimpleAsyncResult*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Ensures that the data passed to the _finish function of an async
      operation is consistent.  Three checks are performed.
      
      First, result is checked to ensure that it is really a
      #GSimpleAsyncResult.  Second, source is checked to ensure that it
      matches the source object of result.  Third, source_tag is
      checked to ensure that it is equal to the source_tag argument given
      to [gid.gio2.simple_async_result.SimpleAsyncResult.new_] (which, by convention, is a pointer
      to the _async function corresponding to the _finish function from
      which this function is called).  (Alternatively, if either
      source_tag or result's source tag is null, then the source tag
      check is skipped.)
  
      Params:
        result = the #GAsyncResult passed to the _finish function.
        source = the #GObject passed to the _finish function.
        sourceTag = the asynchronous function.
      Returns: #TRUE if all checks passed or #FALSE if any failed.
  
      Deprecated: Use #GTask and [gid.gio2.task.Task.isValid] instead.
  */
  static bool isValid(gid.gio2.async_result.AsyncResult result, gid.gobject2.object.ObjectWrap source = null, void* sourceTag = null) nothrow
  {
    bool _retval;
    _retval = cast(bool)g_simple_async_result_is_valid(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, source ? cast(GObject*)source._cPtr(No.Dup) : null, sourceTag);
    return _retval;
  }

  /**
      Completes an asynchronous I/O job immediately. Must be called in
      the thread where the asynchronous result was to be delivered, as it
      invokes the callback directly. If you are in a different thread use
      [gid.gio2.simple_async_result.SimpleAsyncResult.completeInIdle].
      
      Calling this function takes a reference to simple for as long as
      is needed to complete the call.
  
      Deprecated: Use #GTask instead.
  */
  void complete() nothrow
  {
    g_simple_async_result_complete(cast(GSimpleAsyncResult*)this._cPtr);
  }

  /**
      Completes an asynchronous function in an idle handler in the
      thread-default main context (see [gid.glib2.main_context.MainContext.pushThreadDefault])
      of the thread that simple was initially created in
      (and re-pushes that context around the invocation of the callback).
      
      Calling this function takes a reference to simple for as long as
      is needed to complete the call.
  
      Deprecated: Use #GTask instead.
  */
  void completeInIdle() nothrow
  {
    g_simple_async_result_complete_in_idle(cast(GSimpleAsyncResult*)this._cPtr);
  }

  /**
      Gets the operation result boolean from within the asynchronous result.
      Returns: true if the operation's result was true, false
            if the operation's result was false.
  
      Deprecated: Use #GTask and [gid.gio2.task.Task.propagateBoolean] instead.
  */
  bool getOpResGboolean() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_simple_async_result_get_op_res_gboolean(cast(GSimpleAsyncResult*)this._cPtr);
    return _retval;
  }

  /**
      Gets a gssize from the asynchronous result.
      Returns: a gssize returned from the asynchronous function.
  
      Deprecated: Use #GTask and [gid.gio2.task.Task.propagateInt] instead.
  */
  ptrdiff_t getOpResGssize() nothrow
  {
    ptrdiff_t _retval;
    _retval = g_simple_async_result_get_op_res_gssize(cast(GSimpleAsyncResult*)this._cPtr);
    return _retval;
  }

  /**
      Propagates an error from within the simple asynchronous result to
      a given destination.
      
      If the #GCancellable given to a prior call to
      [gid.gio2.simple_async_result.SimpleAsyncResult.setCheckCancellable] is cancelled then this
      function will return true with dest set appropriately.
      Returns: true if the error was propagated to dest. false otherwise.
      Throws: [ErrorWrap]
  
      Deprecated: Use #GTask instead.
  */
  bool propagateError()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_simple_async_result_propagate_error(cast(GSimpleAsyncResult*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Sets a #GCancellable to check before dispatching results.
      
      This function has one very specific purpose: the provided cancellable
      is checked at the time of [gid.gio2.simple_async_result.SimpleAsyncResult.propagateError] If
      it is cancelled, these functions will return an "Operation was
      cancelled" error ([gid.gio2.types.IOErrorEnum.Cancelled]).
      
      Implementors of cancellable asynchronous functions should use this in
      order to provide a guarantee to their callers that cancelling an
      async operation will reliably result in an error being returned for
      that operation (even if a positive result for the operation has
      already been sent as an idle to the main context to be dispatched).
      
      The checking described above is done regardless of any call to the
      unrelated [gid.gio2.simple_async_result.SimpleAsyncResult.setHandleCancellation] function.
  
      Params:
        checkCancellable = a #GCancellable to check, or null to unset
  
      Deprecated: Use #GTask instead.
  */
  void setCheckCancellable(gid.gio2.cancellable.Cancellable checkCancellable = null) nothrow
  {
    g_simple_async_result_set_check_cancellable(cast(GSimpleAsyncResult*)this._cPtr, checkCancellable ? cast(GCancellable*)checkCancellable._cPtr(No.Dup) : null);
  }

  /**
      Sets the result from a #GError.
  
      Params:
        error = #GError.
  
      Deprecated: Use #GTask and [gid.gio2.task.Task.returnError] instead.
  */
  void setFromError(gid.glib2.error.ErrorWrap error) nothrow
  {
    g_simple_async_result_set_from_error(cast(GSimpleAsyncResult*)this._cPtr, error ? cast(const(GError)*)error._cPtr(No.Dup) : null);
  }

  /**
      Sets whether to handle cancellation within the asynchronous operation.
      
      This function has nothing to do with
      [gid.gio2.simple_async_result.SimpleAsyncResult.setCheckCancellable].  It only refers to the
      #GCancellable passed to [gid.gio2.simple_async_result.SimpleAsyncResult.runInThread].
  
      Params:
        handleCancellation = a #gboolean.
  */
  void setHandleCancellation(bool handleCancellation) nothrow
  {
    g_simple_async_result_set_handle_cancellation(cast(GSimpleAsyncResult*)this._cPtr, handleCancellation);
  }

  /**
      Sets the operation result to a boolean within the asynchronous result.
  
      Params:
        opRes = a #gboolean.
  
      Deprecated: Use #GTask and [gid.gio2.task.Task.returnBoolean] instead.
  */
  void setOpResGboolean(bool opRes) nothrow
  {
    g_simple_async_result_set_op_res_gboolean(cast(GSimpleAsyncResult*)this._cPtr, opRes);
  }

  /**
      Sets the operation result within the asynchronous result to
      the given op_res.
  
      Params:
        opRes = a #gssize.
  
      Deprecated: Use #GTask and [gid.gio2.task.Task.returnInt] instead.
  */
  void setOpResGssize(ptrdiff_t opRes) nothrow
  {
    g_simple_async_result_set_op_res_gssize(cast(GSimpleAsyncResult*)this._cPtr, opRes);
  }
}

/// Fluent builder implementation template for [gid.gio2.simple_async_result.SimpleAsyncResult]
class SimpleAsyncResultGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.gio2.async_result.AsyncResultGidBuilderImpl!T
{

  mixin AsyncResultGidBuilderT!();
}

/// Fluent builder for [gid.gio2.simple_async_result.SimpleAsyncResult]
final class SimpleAsyncResultGidBuilder : SimpleAsyncResultGidBuilderImpl!SimpleAsyncResultGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SimpleAsyncResult build() nothrow
  {
    return new SimpleAsyncResult(cast(void*)createGObject(SimpleAsyncResult._getGType), Yes.Take);
  }
}
