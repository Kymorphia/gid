/// Module for [Backend] interface
module secret.backend;

public import secret.backend_iface_proxy;
import gid.gid;
import gio.async_result;
import gio.cancellable;
import gio.types;
import glib.error;
import gobject.object;
import secret.c.functions;
import secret.c.types;
import secret.types;

/**
    #SecretBackend represents a backend implementation of password
    storage.
*/
interface Backend
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())secret_backend_get_type != &gidSymbolNotFound ? secret_backend_get_type() : cast(GType)0;
  }

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
  static void get(secret.types.BackendFlags flags, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
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
          should be released with [gobject.object.ObjectWrap.unref].
      Throws: [ErrorWrap]
  */
  static secret.backend.Backend getFinish(gio.async_result.AsyncResult result)
  {
    SecretBackend* _cretval;
    GError *_err;
    _cretval = secret_backend_get_finish(result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(secret.backend.Backend)(cast(SecretBackend*)_cretval, Yes.Take);
    return _retval;
  }
}
