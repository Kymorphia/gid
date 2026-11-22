/// Module for [SocketAddressEnumerator] class
module gid.gio2.socket_address_enumerator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.socket_address;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] is an enumerator type for
    [gid.gio2.socket_address.SocketAddress] instances. It is returned by enumeration functions
    such as [gid.gio2.socket_connectable.SocketConnectable.enumerate], which returns a
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] to list each [gid.gio2.socket_address.SocketAddress] which could
    be used to connect to that [gid.gio2.socket_connectable.SocketConnectable].
    
    Enumeration is typically a blocking operation, so the asynchronous methods
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync] and
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextFinish] should be used where
    possible.
    
    Each [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] can only be enumerated once. Once
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] has returned `NULL`, further
    enumeration with that [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] is not possible, and it can
    be unreffed.
*/
class SocketAddressEnumerator : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_socket_address_enumerator_get_type != &gidSymbolNotFound ? g_socket_address_enumerator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GSocketAddressEnumerator";
  }

  /** Returns `this`, for use in `with` statements. */
  override SocketAddressEnumerator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.socket_address_enumerator.SocketAddressEnumerator]
      Returns: New builder object
  */
  static SocketAddressEnumeratorGidBuilder builder() nothrow
  {
    return new SocketAddressEnumeratorGidBuilder;
  }

  /**
      Retrieves the next #GSocketAddress from enumerator. Note that this
      may block for some amount of time. (Eg, a #GNetworkAddress may need
      to do a DNS lookup before it can return an address.) Use
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync] if you need to avoid
      blocking.
      
      If enumerator is expected to yield addresses, but for some reason
      is unable to (eg, because of a DNS error), then the first call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] will return an appropriate error
      in `*error`. However, if the first call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] succeeds, then any further
      internal errors (other than cancellable being triggered) will be
      ignored.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case `*error` will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_address.SocketAddress next(gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronously retrieves the next #GSocketAddress from enumerator
      and then calls callback, which must call
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextFinish] to get the result.
      
      It is an error to call this multiple times before the previous callback has finished.
  
      Params:
        cancellable = optional #GCancellable object, null to ignore.
        callback = a #GAsyncReadyCallback to call
            when the request is satisfied
  */
  void nextAsync(gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_socket_address_enumerator_next_async(cast(GSocketAddressEnumerator*)this._cPtr, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Retrieves the result of a completed call to
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.nextAsync]. See
      [gid.gio2.socket_address_enumerator.SocketAddressEnumerator.next] for more information about
      error handling.
  
      Params:
        result = a #GAsyncResult
      Returns: a #GSocketAddress (owned by the caller), or null on
            error (in which case `*error` will be set) or if there are no
            more addresses.
      Throws: [ErrorWrap]
  */
  gid.gio2.socket_address.SocketAddress nextFinish(gid.gio2.async_result.AsyncResult result)
  {
    GSocketAddress* _cretval;
    GError *_err;
    _cretval = g_socket_address_enumerator_next_finish(cast(GSocketAddressEnumerator*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(cast(GSocketAddress*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_address_enumerator.SocketAddressEnumerator]
class SocketAddressEnumeratorGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gio2.socket_address_enumerator.SocketAddressEnumerator]
final class SocketAddressEnumeratorGidBuilder : SocketAddressEnumeratorGidBuilderImpl!SocketAddressEnumeratorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  SocketAddressEnumerator build() nothrow
  {
    return new SocketAddressEnumerator(cast(void*)createGObject(SocketAddressEnumerator._getGType), Yes.Take);
  }
}
