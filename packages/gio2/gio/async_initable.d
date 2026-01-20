/// Module for [AsyncInitable] interface
module gio.async_initable;

public import gio.async_initable_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import gobject.parameter;
import gobject.types;

/**
    [gio.async_initable.AsyncInitable] is an interface for asynchronously initializable objects.
    
    This is the asynchronous version of [gio.initable.Initable]; it behaves the same
    in all ways except that initialization is asynchronous. For more details
    see the descriptions on [gio.initable.Initable].
    
    A class may implement both the [gio.initable.Initable] and [gio.async_initable.AsyncInitable] interfaces.
    
    Users of objects implementing this are not intended to use the interface
    method directly; instead it will be used automatically in various ways.
    For C applications you generally just call [gio.async_initable.AsyncInitable.newAsync]
    directly, or indirectly via a foo_thing_new_async() wrapper. This will call
    [gio.async_initable.AsyncInitable.initAsync] under the covers, calling back with `NULL`
    and a set [glib.error.ErrorWrap] on failure.
    
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
interface AsyncInitable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_async_initable_get_type != &gidSymbolNotFound ? g_async_initable_get_type() : cast(GType)0;
  }

  /**
      Helper function for constructing #GAsyncInitable object. This is
      similar to [gobject.object.ObjectWrap.newv] but also initializes the object asynchronously.
      
      When the initialization is finished, callback will be called. You can
      then call [gio.async_initable.AsyncInitable.newFinish] to get the new object and check
      for any errors.
  
      Params:
        objectType = a #GType supporting #GAsyncInitable.
        nParameters = the number of parameters in parameters
        parameters = the parameters to use to construct the object
        ioPriority = the [I/O priority][io-priority] of the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call when the initialization is
              finished
  
      Deprecated: Use [gobject.object.ObjectWrap.newWithProperties] and
        [gio.async_initable.AsyncInitable.initAsync] instead. See #GParameter for more information.
  */
  static void newvAsync(gobject.types.GType objectType, uint nParameters, gobject.parameter.Parameter parameters, int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_async_initable_newv_async(objectType, nParameters, parameters ? cast(GParameter*)parameters._cPtr : null, ioPriority, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Starts asynchronous initialization of the object implementing the
      interface. This must be done before any real use of the object after
      initial construction. If the object also implements #GInitable you can
      optionally call [gio.initable.Initable.init_] instead.
      
      This method is intended for language bindings. If writing in C,
      [gio.async_initable.AsyncInitable.newAsync] should typically be used instead.
      
      When the initialization is finished, callback will be called. You can
      then call [gio.async_initable.AsyncInitable.initFinish] to get the result of the
      initialization.
      
      Implementations may also support cancellation. If cancellable is not
      null, then initialization can be cancelled by triggering the cancellable
      object from another thread. If the operation was cancelled, the error
      [gio.types.IOErrorEnum.Cancelled] will be returned. If cancellable is not null, and
      the object doesn't support cancellable initialization, the error
      [gio.types.IOErrorEnum.NotSupported] will be returned.
      
      As with #GInitable, if the object is not initialized, or initialization
      returns with an error, then all operations on the object except
      [gobject.object.ObjectWrap.ref_] and [gobject.object.ObjectWrap.unref] are considered to be invalid, and
      have undefined behaviour. They will often fail with g_critical() or
      g_warning(), but this must not be relied on.
      
      Callers should not assume that a class which implements #GAsyncInitable can
      be initialized multiple times; for more information, see [gio.initable.Initable.init_].
      If a class explicitly supports being initialized multiple times,
      implementation requires yielding all subsequent calls to init_async() on the
      results of the first call.
      
      For classes that also support the #GInitable interface, the default
      implementation of this method will run the [gio.initable.Initable.init_] function
      in a thread, so if you want to support asynchronous initialization via
      threads, just implement the #GAsyncInitable interface without overriding
      any interface methods.
  
      Params:
        ioPriority = the [I/O priority][io-priority] of the operation
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call when the request is satisfied
  */
  void initAsync(int ioPriority, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null);

  /**
      Finishes asynchronous initialization and returns the result.
      See [gio.async_initable.AsyncInitable.initAsync].
  
      Params:
        res = a #GAsyncResult.
      Returns: true if successful. If an error has occurred, this function
        will return false and set error appropriately if present.
      Throws: [ErrorWrap]
  */
  bool initFinish(gio.async_result.AsyncResult res);

  /**
      Finishes the async construction for the various g_async_initable_new
      calls, returning the created object or null on error.
  
      Params:
        res = the #GAsyncResult from the callback
      Returns: a newly created #GObject,
             or null on error. Free with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  gobject.object.ObjectWrap newFinish(gio.async_result.AsyncResult res);
}
