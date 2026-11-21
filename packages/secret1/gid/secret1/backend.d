/// Module for [Backend] interface
module gid.secret1.backend;

public import gid.core.basictypes;
public import gid.secret1.backend_iface_proxy;
import gid.core.gid;
import gid.gio2.async_initable;
import gid.gio2.async_result;
import gid.gio2.cancellable;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.secret1.c.functions;
import gid.secret1.c.types;
import gid.secret1.types;

/**
    #SecretBackend represents a backend implementation of password
    storage.
*/
interface Backend : gid.gio2.async_initable.AsyncInitable
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())secret_backend_get_type != &gidSymbolNotFound ? secret_backend_get_type() : cast(GType)0;
  }

  /**
      Get `flags` property.
      Returns: A set of flags describing which parts of the secret backend have
        been initialized.
  */
  @property gid.secret1.types.ServiceFlags flags() nothrow;

  /**
      Get a #SecretBackend instance.
      
      If such a backend already exists, then the same backend is returned.
      
      If flags contains any flags of which parts of the secret backend to
      ensure are initialized, then those will be initialized before completing.
      
      This method will return immediately and complete asynchronously.
  
      Params:
        flags = flags for which service functionality to ensure is initialized
        cancellable = optional cancellation object
        callback = called when the operation completes
  */
  static void get(gid.secret1.types.BackendFlags flags, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
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
    secret_backend_get(flags, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Complete an asynchronous operation to get a #SecretBackend.
  
      Params:
        result = the asynchronous result passed to the callback
      Returns: a new reference to a #SecretBackend proxy, which
          should be released with [gid.gobject2.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static gid.secret1.backend.Backend getFinish(gid.gio2.async_result.AsyncResult result)
  {
    SecretBackend* _cretval;
    GError *_err;
    _cretval = secret_backend_get_finish(result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.secret1.backend.Backend)(cast(SecretBackend*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.secret1.backend.Backend]
interface BackendGidBuilderImpl(T) : gid.gio2.async_initable.AsyncInitableGidBuilderImpl!T
{

  /**
      Set `flags` property.
      Params:
        propval = A set of flags describing which parts of the secret backend have
          been initialized.
      Returns: Builder instance for fluent chaining
  */
  T flags(gid.secret1.types.ServiceFlags propval) nothrow;
}
