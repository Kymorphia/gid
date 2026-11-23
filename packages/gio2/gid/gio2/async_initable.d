/// Module for [AsyncInitable] interface
module gid.gio2.async_initable;

public import gid.core.basictypes;
public import gid.gio2.async_initable_iface_proxy;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gobject2.parameter;
import gid.gobject2.types;

/**
    [gid.gio2.async_initable.AsyncInitable] is an interface for asynchronously initializable objects.
    
    This is the asynchronous version of [gid.gio2.initable.Initable]; it behaves the same
    in all ways except that initialization is asynchronous. For more details
    see the descriptions on [gid.gio2.initable.Initable].
    
    A class may implement both the [gid.gio2.initable.Initable] and [gid.gio2.async_initable.AsyncInitable] interfaces.
    
    Users of objects implementing this are not intended to use the interface
    method directly; instead it will be used automatically in various ways.
    For C applications you generally just call [gid.gio2.async_initable.AsyncInitable.newAsync]
    directly, or indirectly via a foo_thing_new_async() wrapper. This will call
    [gid.gio2.async_initable.AsyncInitable.initAsync] under the covers, calling back with `NULL`
    and a set [gid.glib2.error.ErrorWrap] on failure.
    
    A typical implementation might look something like this:
    
    ```c
    enum {
       NOT_INITIALIZED,
       INITIALIZING,
       INITIALIZED
    };
    
    static void
    _foo_ready_cb (Foo *self)
    {
      GList *l;
    
      self->priv->state = INITIALIZED;
    
      for (l = self->priv->init_results; l != NULL; l = l->next)
        {
          GTask *task = l->data;
    
          if (self->priv->success)
            g_task_return_boolean (task, TRUE);
          else
            g_task_return_new_error (task, ...);
          g_object_unref (task);
        }
    
      g_list_free (self->priv->init_results);
      self->priv->init_results = NULL;
    }
    
    static void
    foo_init_async (GAsyncInitable       *initable,
                    int                   io_priority,
                    GCancellable         *cancellable,
                    GAsyncReadyCallback   callback,
                    gpointer              user_data)
    {
      Foo *self = FOO (initable);
      GTask *task;
    
      task = g_task_new (initable, cancellable, callback, user_data);
      g_task_set_name (task, G_STRFUNC);
    
      switch (self->priv->state)
        {
          case NOT_INITIALIZED:
            _foo_get_ready (self);
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            self->priv->state = INITIALIZING;
            break;
          case INITIALIZING:
            self->priv->init_results = g_list_append (self->priv->init_results,
                                                      task);
            break;
          case INITIALIZED:
            if (!self->priv->success)
              g_task_return_new_error (task, ...);
            else
              g_task_return_boolean (task, TRUE);
            g_object_unref (task);
            break;
        }
    }
    
    static gboolean
    foo_init_finish (GAsyncInitable       *initable,
                     GAsyncResult         *result,
                     GError              **error)
    {
      g_return_val_if_fail (g_task_is_valid (result, initable), FALSE);
    
      return g_task_propagate_boolean (G_TASK (result), error);
    }
    
    static void
    foo_async_initable_iface_init (gpointer g_iface,
                                   gpointer data)
    {
      GAsyncInitableIface *iface = g_iface;
    
      iface->init_async = foo_init_async;
      iface->init_finish = foo_init_finish;
    }
    ```
*/
interface AsyncInitable : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_async_initable_get_type != &gidSymbolNotFound ? g_async_initable_get_type() : cast(GType)0;
  }

  /**
      Helper function for constructing #GAsyncInitable object. This is
      similar to [gid.gobject2.object.ObjectWrap.newv] but also initializes the object asynchronously.
      
      When the initialization is finished, callback will be called. You can
      then call [gid.gio2.async_initable.AsyncInitable.newFinish] to get the new object and check
      for any errors.
  
      Params:
        objectType = a #GType supporting #GAsyncInitable.
        nParameters = the number of parameters in parameters
        parameters = the parameters to use to construct the object
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call when the initialization is
              finished
  
      Deprecated: Use [gid.gobject2.object.ObjectWrap.newWithProperties] and
        [gid.gio2.async_initable.AsyncInitable.initAsync] instead. See #GParameter for more information.
  */
  static void newvAsync(gid.gobject2.types.GType objectType, uint nParameters, gid.gobject2.parameter.Parameter parameters, int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_async_initable_newv_async(objectType, nParameters, parameters ? cast(GParameter*)parameters._cPtr : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }



  /**
      Starts asynchronous initialization of the object implementing the
      interface. This must be done before any real use of the object after
      initial construction. If the object also implements #GInitable you can
      optionally call [gid.gio2.initable.Initable.init_] instead.
      
      This method is intended for language bindings. If writing in C,
      [gid.gio2.async_initable.AsyncInitable.newAsync] should typically be used instead.
      
      When the initialization is finished, callback will be called. You can
      then call [gid.gio2.async_initable.AsyncInitable.initFinish] to get the result of the
      initialization.
      
      Implementations may also support cancellation. If cancellable is not
      null, then initialization can be cancelled by triggering the cancellable
      object from another thread. If the operation was cancelled, the error
      [gid.gio2.types.IOErrorEnum.Cancelled] will be returned. If cancellable is not null, and
      the object doesn't support cancellable initialization, the error
      [gid.gio2.types.IOErrorEnum.NotSupported] will be returned.
      
      As with #GInitable, if the object is not initialized, or initialization
      returns with an error, then all operations on the object except
      [gid.gobject2.object.ObjectWrap.ref_] and [gid.gobject2.object.ObjectWrap.unref] are considered to be invalid, and
      have undefined behaviour. They will often fail with g_critical() or
      g_warning(), but this must not be relied on.
      
      Callers should not assume that a class which implements #GAsyncInitable can
      be initialized multiple times; for more information, see [gid.gio2.initable.Initable.init_].
      If a class explicitly supports being initialized multiple times,
      implementation requires yielding all subsequent calls to init_async() on the
      results of the first call.
      
      For classes that also support the #GInitable interface, the default
      implementation of this method will run the [gid.gio2.initable.Initable.init_] function
      in a thread, so if you want to support asynchronous initialization via
      threads, just implement the #GAsyncInitable interface without overriding
      any interface methods.
  
      Params:
        ioPriority = the [I/O priority](iface.AsyncResult.html#io-priority) of the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void initAsync(int ioPriority, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      Finishes asynchronous initialization and returns the result.
      See [gid.gio2.async_initable.AsyncInitable.initAsync].
  
      Params:
        res = a #GAsyncResult.
      Returns: true if successful. If an error has occurred, this function
        will return false and set error appropriately if present.
      Throws: [ErrorWrap]
  */
  bool initFinish(gid.gio2.async_result.AsyncResult res);

  /**
      Finishes the async construction for the various g_async_initable_new
      calls, returning the created object or null on error.
  
      Params:
        res = the #GAsyncResult from the callback
      Returns: a newly created #GObject,
             or null on error. Free with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gid.gobject2.object.ObjectWrap newFinish(gid.gio2.async_result.AsyncResult res);
}

/// Fluent builder implementation template for [gid.gio2.async_initable.AsyncInitable]
interface AsyncInitableGidBuilderImpl(T)
{
}
