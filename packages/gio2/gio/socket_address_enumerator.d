/// Module for [SocketAddressEnumerator] class
module gio.socket_address_enumerator;

import gid.gid;
import gio.async_result;
import gio.c.functions;
import gio.c.types;
import gio.cancellable;
import gio.socket_address;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.socket_address_enumerator.SocketAddressEnumerator] is an enumerator type for
    [gio.socket_address.SocketAddress] instances. It is returned by enumeration functions
    such as [gio.socket_connectable.SocketConnectable.enumerate], which returns a
    [gio.socket_address_enumerator.SocketAddressEnumerator] to list each [gio.socket_address.SocketAddress] which could
    be used to connect to that [gio.socket_connectable.SocketConnectable].
    
    Enumeration is typically a blocking operation, so the asynchronous methods
    [gio.socket_address_enumerator.SocketAddressEnumerator.nextAsync] and
    [gio.socket_address_enumerator.SocketAddressEnumerator.nextFinish] should be used where
    possible.
    
    Each [gio.socket_address_enumerator.SocketAddressEnumerator] can only be enumerated once. Once
    [gio.socket_address_enumerator.SocketAddressEnumerator.next] has returned `NULL`, further
    enumeration with that [gio.socket_address_enumerator.SocketAddressEnumerator] is not possible, and it can
    be unreffed.
*/
class SocketAddressEnumerator : gobject.object.ObjectWrap
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
    return cast(void function())g_socket_address_enumerator_get_type != &gidSymbolNotFound ? g_socket_address_enumerator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketAddressEnumerator self()
  {
    return this;
  }

  /**
      Retrieves the next #GSocketAddress from enumerator. Note that this
      may block for some amount of time. (Eg, a #GNetworkAddress may need
      to do a DNS lookup before it can return an address.) Use
      [gio.socket_address_enumerator.SocketAddressEnumerator.nextAsync] if you need to avoid
      blocking.
      
      If enumerator is expected to yield addresses, but for some reason
      is unable to (eg, because of a DNS error), then the first call to
      [gio.socket_address_enumerator.SocketAddressEnumerator.next] will return an appropriate error
      in *error. However, if the first call to
      [gio.socket_address_enumerator.SocketAddressEnumerator.next] succeeds, then any further
      internal errors (other than cancellable being triggered) will be
      ignored.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case *error will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  */
  gio.socket_address.SocketAddress next(gio.cancellable.Cancellable cancellable = null)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously retrieves the next #GSocketAddress from enumerator
      and then calls callback, which must call
      [gio.socket_address_enumerator.SocketAddressEnumerator.nextFinish] to get the result.
      
      It is an error to call this multiple times before the previous callback has finished.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  void nextAsync(gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_socket_address_enumerator_next_async(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a completed call to
      [gio.socket_address_enumerator.SocketAddressEnumerator.nextAsync]. See
      [gio.socket_address_enumerator.SocketAddressEnumerator.next] for more information about
      error handling.
  
      Params:
        result = a #GAsyncResult
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case *error will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  */
  gio.socket_address.SocketAddress nextFinish(gio.async_result.AsyncResult result)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next_finish(cast(GSocketAddressEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }
}
