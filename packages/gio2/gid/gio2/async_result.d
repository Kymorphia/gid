/// Module for [AsyncResult] interface
module gid.gio2.async_result;

public import gid.core.basictypes;
public import gid.gio2.async_result_iface_proxy;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.async_result.AsyncResult] provides a base class for implementing asynchronous function results.
    
    Asynchronous operations are broken up into two separate operations
    which are chained together by a [gid.gio2.types.AsyncReadyCallback]. To begin
    an asynchronous operation, provide a [gid.gio2.types.AsyncReadyCallback] to the
    asynchronous function. This callback will be triggered when the
    operation has completed, and must be run in a later iteration of
    the thread-default main context (see
    [gid.glib2.main_context.MainContext.pushThreadDefault]) from where the operation was
    initiated. It will be passed a [gid.gio2.async_result.AsyncResult] instance filled with the
    details of the operation's success or failure, the object the asynchronous
    function was started for and any error codes returned. The asynchronous
    callback function is then expected to call the corresponding `_finish()`
    function, passing the object the function was called for, the
    [gid.gio2.async_result.AsyncResult] instance, and (optionally) an @error to grab any
    error conditions that may have occurred.
    
    The `_finish()` function for an operation takes the generic result
    (of type [gid.gio2.async_result.AsyncResult]) and returns the specific result that the
    operation in question yields (e.g. a [gid.gio2.file_enumerator.FileEnumerator] for a
    "enumerate children" operation). If the result or error status of the
    operation is not needed, there is no need to call the `_finish()`
    function; GIO will take care of cleaning up the result and error
    information after the [gid.gio2.types.AsyncReadyCallback] returns. You can pass
    `NULL` for the [gid.gio2.types.AsyncReadyCallback] if you don't need to take any
    action at all after the operation completes. Applications may also
    take a reference to the [gid.gio2.async_result.AsyncResult] and call `_finish()` later;
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
    the result is a [gid.gio2.types.IOErrorEnum.Cancelled] error.
    
    ## I/O Priority
    
    Many I/O-related asynchronous operations have a priority parameter,
    which is used in certain cases to determine the order in which
    operations are executed. They are not used to determine system-wide
    I/O scheduling. Priorities are integers, with lower numbers indicating
    higher priority. It is recommended to choose priorities between
    [gid.glib2.types.PRIORITY_LOW] and [gid.glib2.types.PRIORITY_HIGH], with [gid.glib2.types.PRIORITY_DEFAULT]
    as a default.
*/
@gidGir("AsyncResult", "AsyncResultIface")
interface AsyncResult : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_async_result_get_type != &gidSymbolNotFound ? g_async_result_get_type() : cast(GType)0;
  }




  /**
      Gets the source object from a [gid.gio2.async_result.AsyncResult].
      Returns: a new reference to the source
           object for the res, or `NULL` if there is none.
  */
  gid.gobject2.object.ObjectWrap getSourceObject();

  /**
      Gets the user data from a [gid.gio2.async_result.AsyncResult].
      Returns: the user data for res.
  */
  void* getUserData();

  /**
      Checks if res has the given source_tag (generally a function
      pointer indicating the function res was created by).
  
      Params:
        sourceTag = an application-defined tag
      Returns: `TRUE` if res has the indicated source_tag, `FALSE` if
          not.
  */
  bool isTagged(void* sourceTag = null);

  /**
      If res is a [gid.gio2.simple_async_result.SimpleAsyncResult], this is equivalent to
      [gid.gio2.simple_async_result.SimpleAsyncResult.propagateError]. Otherwise it returns
      `FALSE`.
      
      This can be used for legacy error handling in async `*_finish()`
      wrapper functions that traditionally handled [gid.gio2.simple_async_result.SimpleAsyncResult]
      error returns themselves rather than calling into the virtual method.
      This should not be used in new code; [gid.gio2.async_result.AsyncResult] errors that are
      set by virtual methods should also be extracted by virtual methods,
      to enable subclasses to chain up correctly.
      Returns: `TRUE` if error is has been filled in with an error from
          res, `FALSE` if not.
      Throws: [ErrorWrap]
  */
  bool legacyPropagateError();
}

/// Fluent builder implementation template for [gid.gio2.async_result.AsyncResult]
interface AsyncResultGidBuilderImpl(T)
{
}
