/// Module for [Proxy] interface
module gid.gio2.proxy;

public import gid.core.basictypes;
public import gid.gio2.proxy_iface_proxy;
import gid.core.utils;
import gid.gio2.async_result;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.cancellable;
import gid.gio2.iostream;
import gid.gio2.proxy_address;
import gid.gio2.types;
import gid.glib2.error;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A [gid.gio2.proxy.Proxy] handles connecting to a remote host via a given type of
    proxy server. It is implemented by the `gio-proxy` extension point.
    The extensions are named after their proxy protocol name. As an
    example, a SOCKS5 proxy implementation can be retrieved with the
    name `socks5` using the function
    [gid.gio2.ioextension_point.IOExtensionPoint.getExtensionByName].
*/
interface Proxy : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_proxy_get_type != &gidSymbolNotFound ? g_proxy_get_type() : cast(GType)0;
  }

  /**
      Find the `gio-proxy` extension point for a proxy implementation that supports
      the specified protocol.
  
      Params:
        protocol = the proxy protocol name (e.g. http, socks, etc)
      Returns: return a #GProxy or NULL if protocol
                      is not supported.
  */
  static gid.gio2.proxy.Proxy getDefaultForProtocol(string protocol) nothrow
  {
    GProxy* _cretval;
    const(char)* _protocol = protocol.toCString!(No.Malloc, No.Nullable);
    _cretval = g_proxy_get_default_for_protocol(_protocol);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.proxy.Proxy)(cast(GProxy*)_cretval, Yes.Take);
    return _retval;
  }





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
  gid.gio2.iostream.IOStream connect(gid.gio2.iostream.IOStream connection, gid.gio2.proxy_address.ProxyAddress proxyAddress, gid.gio2.cancellable.Cancellable cancellable = null);

  /**
      Asynchronous version of [gid.gio2.proxy.Proxy.connect].
  
      Params:
        connection = a #GIOStream
        proxyAddress = a #GProxyAddress
        cancellable = a #GCancellable
        callback = a #GAsyncReadyCallback
  */
  void connectAsync(gid.gio2.iostream.IOStream connection, gid.gio2.proxy_address.ProxyAddress proxyAddress, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null);

  /**
      See [gid.gio2.proxy.Proxy.connect].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GIOStream.
      Throws: [ErrorWrap]
  */
  gid.gio2.iostream.IOStream connectFinish(gid.gio2.async_result.AsyncResult result);

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
  bool supportsHostname();
}

/// Fluent builder implementation template for [gid.gio2.proxy.Proxy]
interface ProxyGidBuilderImpl(T)
{
}
