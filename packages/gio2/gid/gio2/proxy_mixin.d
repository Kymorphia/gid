/// Module for [Proxy] interface mixin
module gid.gio2.proxy_mixin;

public import gid.core.basictypes;
public import gid.gio2.proxy_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.iostream;
public import gid.gio2.proxy_address;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    A [gid.gio2.proxy.Proxy] handles connecting to a remote host via a given type of
    proxy server. It is implemented by the `gio-proxy` extension point.
    The extensions are named after their proxy protocol name. As an
    example, a SOCKS5 proxy implementation can be retrieved with the
    name `socks5` using the function
    [gid.gio2.ioextension_point.IOExtensionPoint.getExtensionByName].
*/
template ProxyT()
{


  /**
      Given connection to communicate with a proxy (eg, a
      #GSocketConnection that is connected to the proxy server), this
      does the necessary handshake to connect to proxy_address, and if
      required, wraps the #GIOStream to handle proxy payload.
  
      Params:
        connection = a #GIOStream
        proxyAddress = a #GProxyAddress
        cancellable = a #GCancellable
      Returns: a #GIOStream that will replace connection. This might
                      be the same as connection, in which case a reference
                      will be added.
      Throws: [ErrorWrap]
  */
  override gid.gio2.iostream.IOStream connect(gid.gio2.iostream.IOStream connection, gid.gio2.proxy_address.ProxyAddress proxyAddress, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    GIOStream* _cretval;
    GError *_err;
    _cretval = g_proxy_connect(cast(GProxy*)this._cPtr, connection ? cast(GIOStream*)connection._cPtr(No.Dup) : null, proxyAddress ? cast(GProxyAddress*)proxyAddress._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.iostream.IOStream)(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronous version of [gid.gio2.proxy.Proxy.connect].
  
      Params:
        connection = a #GIOStream
        proxyAddress = a #GProxyAddress
        cancellable = a #GCancellable
        callback = a #GAsyncReadyCallback
  */
  override void connectAsync(gid.gio2.iostream.IOStream connection, gid.gio2.proxy_address.ProxyAddress proxyAddress, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    g_proxy_connect_async(cast(GProxy*)this._cPtr, connection ? cast(GIOStream*)connection._cPtr(No.Dup) : null, proxyAddress ? cast(GProxyAddress*)proxyAddress._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      See [gid.gio2.proxy.Proxy.connect].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GIOStream.
      Throws: [ErrorWrap]
  */
  override gid.gio2.iostream.IOStream connectFinish(gid.gio2.async_result.AsyncResult result)
  {
    GIOStream* _cretval;
    GError *_err;
    _cretval = g_proxy_connect_finish(cast(GProxy*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.iostream.IOStream)(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Some proxy protocols expect to be passed a hostname, which they
      will resolve to an IP address themselves. Others, like SOCKS4, do
      not allow this. This function will return false if proxy is
      implementing such a protocol. When false is returned, the caller
      should resolve the destination hostname first, and then pass a
      #GProxyAddress containing the stringified IP address to
      [gid.gio2.proxy.Proxy.connect] or [gid.gio2.proxy.Proxy.connectAsync].
      Returns: true if hostname resolution is supported.
  */
  override bool supportsHostname() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_proxy_supports_hostname(cast(GProxy*)this._cPtr);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.proxy.Proxy]
template ProxyGidBuilderT()
{
}
