/// Module for [ProxyResolver] interface mixin
module gio.proxy_resolver_mixin;

public import gio.proxy_resolver_iface_proxy;
public import gid.gid;
public import gio.async_result;
public import gio.c.functions;
public import gio.c.types;
public import gio.cancellable;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.proxy_resolver.ProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [gio.proxy_resolver.ProxyResolver] is used within [gio.socket_client.SocketClient] through
    the method [gio.socket_connectable.SocketConnectable.proxyEnumerate].
    
    Implementations of [gio.proxy_resolver.ProxyResolver] based on
    [libproxy](https://github.com/libproxy/libproxy) and GNOME settings can be
    found in [glib-networking](https://gitlab.gnome.org/GNOME/glib-networking).
    GIO comes with an implementation for use inside Flatpak portals.
*/
template ProxyResolverT()
{


  /**
      Checks if resolver can be used on this system. (This is used
      internally; [gio.proxy_resolver.ProxyResolver.getDefault] will only return a proxy
      resolver that returns true for this method.)
      Returns: true if resolver is supported.
  */
  override bool isSupported()
  {
    bool _retval;
    _retval = cast(bool)g_proxy_resolver_is_supported(cast(GProxyResolver*)this._cPtr);
    return _retval;
  }

  /**
      Looks into the system proxy configuration to determine what proxy,
      if any, to use to connect to uri. The returned proxy URIs are of
      the form `<protocol>://[user[:password]@]host[:port]` or
      `direct://`, where <protocol> could be http, rtsp, socks
      or other proxying protocol.
      
      If you don't know what network protocol is being used on the
      socket, you should use `none` as the URI protocol.
      In this case, the resolver might still return a generic proxy type
      (such as SOCKS), but would not return protocol-specific proxy types
      (such as http).
      
      `direct://` is used when no proxy is needed.
      Direct connection should not be attempted unless it is part of the
      returned array of proxies.
  
      Params:
        uri = a URI representing the destination to connect to
        cancellable = a #GCancellable, or null
      Returns: A
                      NULL-terminated array of proxy URIs. Must be freed
                      with [glib.global.strfreev].
      Throws: [ErrorWrap]
  */
  override string[] lookup(string uri, gio.cancellable.Cancellable cancellable = null)
  {
    char** _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_proxy_resolver_lookup(cast(GProxyResolver*)this._cPtr, _uri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Asynchronous lookup of proxy. See [gio.proxy_resolver.ProxyResolver.lookup] for more
      details.
  
      Params:
        uri = a URI representing the destination to connect to
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  override void lookupAsync(string uri, gio.cancellable.Cancellable cancellable = null, gio.types.AsyncReadyCallback callback = null)
  {
    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(gio.types.AsyncReadyCallback*)data;

      (*_dlg)(gobject.object.ObjectWrap._getDObject!(gobject.object.ObjectWrap)(cast(void*)sourceObject, No.Take), gobject.object.ObjectWrap._getDObject!(gio.async_result.AsyncResult)(cast(void*)res, No.Take));
    }
    auto _callbackCB = callback ? &_callbackCallback : null;
    const(char)* _uri = uri.toCString(No.Alloc);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_proxy_resolver_lookup_async(cast(GProxyResolver*)this._cPtr, _uri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Call this function to obtain the array of proxy URIs when
      [gio.proxy_resolver.ProxyResolver.lookupAsync] is complete. See
      [gio.proxy_resolver.ProxyResolver.lookup] for more details.
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: A
                      NULL-terminated array of proxy URIs. Must be freed
                      with [glib.global.strfreev].
      Throws: [ErrorWrap]
  */
  override string[] lookupFinish(gio.async_result.AsyncResult result)
  {
    char** _cretval;
    GError *_err;
    _cretval = g_proxy_resolver_lookup_finish(cast(GProxyResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gobject.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}
