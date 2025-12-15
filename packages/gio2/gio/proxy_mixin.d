/// Module for [Proxy] interface mixin
module gio.proxy_mixin;

public import gio.proxy_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.iostream;
public import gio.proxy_address;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    A [gio.proxy.Proxy] handles connecting to a remote host via a given type of
    proxy server. It is implemented by the `gio-proxy` extension point.
    The extensions are named after their proxy protocol name. As an
    example, a SOCKS5 proxy implementation can be retrieved with the
    name `socks5` using the function
    [gio.ioextension_point.IOExtensionPoint.getExtensionByName].
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
  override gio.iostream.IOStream connect(gio.iostream.IOStream connection, gio.proxy_address.ProxyAddress proxyAddress, gio.cancellable.Cancellable cancellable = null)
  {
    GIOStream* _cretval;
    GError *_err;
    _cretval = g_proxy_connect(cast(GProxy*)this._cPtr, connection ? cast(GIOStream*)connection._cPtr(No.Dup) : null, proxyAddress ? cast(GProxyAddress*)proxyAddress._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.iostream.IOStream)(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Asynchronous version of [gio.proxy.Proxy.connect].
  
      Params:
        connection = a #GIOStream
        proxyAddress = a #GProxyAddress
        cancellable = a #GCancellable
        callback = a #GAsyncReadyCallback
  */
  override void connectAsync(gio.iostream.IOStream connection, gio.proxy_address.ProxyAddress proxyAddress, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;

    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_proxy_connect_async(cast(GProxy*)this._cPtr, connection ? cast(GIOStream*)connection._cPtr(No.Dup) : null, proxyAddress ? cast(GProxyAddress*)proxyAddress._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      See [gio.proxy.Proxy.connect].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GIOStream.
      Throws: [ErrorWrap]
  */
  override gio.iostream.IOStream connectFinish(gio.async_result.AsyncResult result)
  {
    GIOStream* _cretval;
    GError *_err;
    _cretval = g_proxy_connect_finish(cast(GProxy*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.iostream.IOStream)(cast(GIOStream*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Some proxy protocols expect to be passed a hostname, which they
      will resolve to an IP address themselves. Others, like SOCKS4, do
      not allow this. This function will return false if proxy is
      implementing such a protocol. When false is returned, the caller
      should resolve the destination hostname first, and then pass a
      #GProxyAddress containing the stringified IP address to
      [gio.proxy.Proxy.connect] or [gio.proxy.Proxy.connectAsync].
      Returns: true if hostname resolution is supported.
  */
  override bool supportsHostname()
  {
    bool _retval;
    _retval = cast(bool)g_proxy_supports_hostname(cast(GProxy*)this._cPtr);
    return _retval;
  }
}
