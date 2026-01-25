/// Module for [AsyncResult] interface mixin
module gio.async_result_mixin;

public import gio.async_result_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.async_result.AsyncResult] provides a base class for implementing asynchronous function results.
    
    Asynchronous operations are broken up into two separate operations
    which are chained together by a [gio.types.AsyncReadyCallback]. To begin
    an asynchronous operation, provide a [gio.types.AsyncReadyCallback] to the
    asynchronous function. This callback will be triggered when the
    operation has completed, and must be run in a later iteration of
    the thread-default main context (see
    [glib.main_context.MainContext.pushThreadDefault]) from where the operation was
    initiated. It will be passed a [gio.async_result.AsyncResult] instance filled with the
    details of the operation's success or failure, the object the asynchronous
    function was started for and any error codes returned. The asynchronous
    callback function is then expected to call the corresponding `_finish()`
    function, passing the object the function was called for, the
    [gio.async_result.AsyncResult] instance, and (optionally) an @error to grab any
    error conditions that may have occurred.
    
    The `_finish()` function for an operation takes the generic result
    (of type [gio.async_result.AsyncResult]) and returns the specific result that the
    operation in question yields (e.g. a [gio.file_enumerator.FileEnumerator] for a
    "enumerate children" operation). If the result or error status of the
    operation is not needed, there is no need to call the `_finish()`
    function; GIO will take care of cleaning up the result and error
    information after the [gio.types.AsyncReadyCallback] returns. You can pass
    `NULL` for the [gio.types.AsyncReadyCallback] if you don't need to take any
    action at all after the operation completes. Applications may also
    take a reference to the [gio.async_result.AsyncResult] and call `_finish()` later;
    however, the `_finish()` function may be called at most once.
    
    Example of a typical asynchronous operation flow:
    
    ```c
    void _theoretical_frobnitz_async (Theoretical         *t,
                                      GCancellable        *c,
                                      GAsyncReadyCallback  cb,
                                      gpointer             u);
    
    gboolean _theoretical_frobnitz_finish (Theoretical   *t,
                                           GAsyncResult  *res,
                                           GError       **e);
    
    static void
    frobnitz_result_func (GObject      *source_object,
    		 GAsyncResult *res,
    		 gpointer      user_data)
    {
      gboolean success = FALSE;
    
      success = _theoretical_frobnitz_finish (source_object, res, NULL);
    
      if (success)
        g_printf ("Hurray!\n");
      else
        g_printf ("Uh oh!\n");
    
      ...
    
    }
    
    int main (int argc, void *argv[])
    {
       ...
    
       _theoretical_frobnitz_async (theoretical_data,
                                    NULL,
                                    frobnitz_result_func,
                                    NULL);
    
       ...
    }
    ```
    
    The callback for an asynchronous operation is called only once, and is
    always called, even in the case of a cancelled operation. On cancellation
    the result is a [gio.types.IOErrorEnum.Cancelled] error.
    
    ## I/O Priority
    
    Many I/O-related asynchronous operations have a priority parameter,
    which is used in certain cases to determine the order in which
    operations are executed. They are not used to determine system-wide
    I/O scheduling. Priorities are integers, with lower numbers indicating
    higher priority. It is recommended to choose priorities between
    [glib.types.PRIORITY_LOW] and [glib.types.PRIORITY_HIGH], with [glib.types.PRIORITY_DEFAULT]
    as a default.
*/
template AsyncResultT()
{

  /**
      Gets the source object from a #GAsyncResult.
      Returns: a new reference to the source
           object for the res, or null if there is none.
  */
  override gobject.object.ObjectWrap getSourceObject()
  {
    GObject* _cretval;
    _cretval = g_async_result_get_source_object(cast(GAsyncResult*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(GObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the user data from a #GAsyncResult.
      Returns: the user data for res.
  */
  override void* getUserData()
  {
    auto _retval = g_async_result_get_user_data(cast(GAsyncResult*)this._cPtr);
    return _retval;
  }

  /**
      Checks if res has the given source_tag (generally a function
      pointer indicating the function res was created by).
  
      Params:
        sourceTag = an application-defined tag
      Returns: true if res has the indicated source_tag, false if
          not.
  */
  override bool isTagged(void* sourceTag = null)
  {
    bool _retval;
    _retval = cast(bool)g_async_result_is_tagged(cast(GAsyncResult*)this._cPtr, sourceTag);
    return _retval;
  }

  /**
      If res is a #GSimpleAsyncResult, this is equivalent to
      [gio.simple_async_result.SimpleAsyncResult.propagateError]. Otherwise it returns
      false.
      
      This can be used for legacy error handling in async *_finish()
      wrapper functions that traditionally handled #GSimpleAsyncResult
      error returns themselves rather than calling into the virtual method.
      This should not be used in new code; #GAsyncResult errors that are
      set by virtual methods should also be extracted by virtual methods,
      to enable subclasses to chain up correctly.
      Returns: true if error is has been filled in with an error from
          res, false if not.
      Throws: [ErrorWrap]
  */
  override bool legacyPropagateError()
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)g_async_result_legacy_propagate_error(cast(GAsyncResult*)this._cPtr, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }
}
