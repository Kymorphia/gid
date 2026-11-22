/// Module for [ProxyResolver] interface mixin
module gid.gio2.proxy_resolver_mixin;

public import gid.core.basictypes;
public import gid.gio2.proxy_resolver_iface_proxy;
public import gid.core.utils;
public import gid.gio2.async_result;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.cancellable;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.proxy_resolver.ProxyResolver] provides synchronous and asynchronous network proxy
    resolution. [gid.gio2.proxy_resolver.ProxyResolver] is used within [gid.gio2.socket_client.SocketClient] through
    the method [gid.gio2.socket_connectable.SocketConnectable.proxyEnumerate].
    
    Implementations of [gid.gio2.proxy_resolver.ProxyResolver] based on
    [libproxy](https://github.com/libproxy/libproxy) and GNOME settings can be
    found in [glib-networking](https://gitlab.gnome.org/GNOME/glib-networking).
    GIO comes with an implementation for use inside Flatpak portals.
*/
template ProxyResolverT()
{


  /**
      Checks if resolver can be used on this system. (This is used
      internally; [gid.gio2.proxy_resolver.ProxyResolver.getDefault] will only return a proxy
      resolver that returns true for this method.)
      Returns: true if resolver is supported.
  */
  override bool isSupported() nothrow
  {
    bool _retval;
    _retval = cast(bool)g_proxy_resolver_is_supported(cast(GProxyResolver*)this._cPtr);
    return _retval;
  }

  /**
      Looks into the system proxy configuration to determine what proxy,
      if any, to use to connect to uri. The returned proxy URIs are of
      the form `<protocol>://[user[:password]@]host[:port]` or
      `direct://`, where `<protocol>` could be http, rtsp, socks
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
                      with [gid.glib2.global.strfreev].
      Throws: [ErrorWrap]
  */
  override string[] lookup(string uri, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    char** _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_proxy_resolver_lookup(cast(GProxyResolver*)this._cPtr, _uri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Asynchronous lookup of proxy. See [gid.gio2.proxy_resolver.ProxyResolver.lookup] for more
      details.
  
      Params:
        uri = a URI representing the destination to connect to
        cancellable = a #GCancellable, or null
        callback = callback to call after resolution completes
  */
  override void lookupAsync(string uri, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null) nothrow
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
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    g_proxy_resolver_lookup_async(cast(GProxyResolver*)this._cPtr, _uri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      Call this function to obtain the array of proxy URIs when
      [gid.gio2.proxy_resolver.ProxyResolver.lookupAsync] is complete. See
      [gid.gio2.proxy_resolver.ProxyResolver.lookup] for more details.
  
      Params:
        result = the result passed to your #GAsyncReadyCallback
      Returns: A
                      NULL-terminated array of proxy URIs. Must be freed
                      with [gid.glib2.global.strfreev].
      Throws: [ErrorWrap]
  */
  override string[] lookupFinish(gid.gio2.async_result.AsyncResult result)
  {
    char** _cretval;
    GError *_err;
    _cretval = g_proxy_resolver_lookup_finish(cast(GProxyResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString!(Yes.Free);
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gio2.proxy_resolver.ProxyResolver]
template ProxyResolverGidBuilderT()
{
}
