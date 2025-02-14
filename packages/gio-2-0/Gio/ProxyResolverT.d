module Gio.ProxyResolverT;

public import Gio.ProxyResolverIfaceProxy;
public import GLib.ErrorG;
public import GObject.ObjectG;
public import Gid.gid;
public import Gio.AsyncResult;
public import Gio.AsyncResultT;
public import Gio.Cancellable;
public import Gio.Types;
public import Gio.c.functions;
public import Gio.c.types;

/**
 * `GProxyResolver` provides synchronous and asynchronous network proxy
 * resolution. `GProxyResolver` is used within [Gio.SocketClient] through
 * the method [Gio.SocketConnectable.proxyEnumerate].
 * Implementations of `GProxyResolver` based on
 * [libproxy](https://github.com/libproxy/libproxy) and GNOME settings can be
 * found in [glib-networking](https://gitlab.gnome.org/GNOME/glib-networking).
 * GIO comes with an implementation for use inside Flatpak portals.
 */
template ProxyResolverT()
{


  /**
   * Checks if resolver can be used on this system. $(LPAREN)This is used
   * internally; [Gio.ProxyResolver.getDefault] will only return a proxy
   * resolver that returns %TRUE for this method.$(RPAREN)
   * Returns: %TRUE if resolver is supported.
   */
  override bool isSupported()
  {
    bool _retval;
    _retval = g_proxy_resolver_is_supported(cast(GProxyResolver*)cPtr);
    return _retval;
  }

  /**
   * Looks into the system proxy configuration to determine what proxy,
   * if any, to use to connect to uri. The returned proxy URIs are of
   * the form `<protocol>://[user[:password]@]host[:port]` or
   * `direct://`, where <protocol> could be http, rtsp, socks
   * or other proxying protocol.
   * If you don't know what network protocol is being used on the
   * socket, you should use `none` as the URI protocol.
   * In this case, the resolver might still return a generic proxy type
   * $(LPAREN)such as SOCKS$(RPAREN), but would not return protocol-specific proxy types
   * $(LPAREN)such as http$(RPAREN).
   * `direct://` is used when no proxy is needed.
   * Direct connection should not be attempted unless it is part of the
   * returned array of proxies.
   * Params:
   *   uri = a URI representing the destination to connect to
   *   cancellable = a #GCancellable, or %NULL
   * Returns: A
   *   NULL-terminated array of proxy URIs. Must be freed
   *   with [GLib.Global.strfreev].
   */
  override string[] lookup(string uri, Cancellable cancellable)
  {
    char** _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_proxy_resolver_lookup(cast(GProxyResolver*)cPtr, _uri, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }

  /**
   * Asynchronous lookup of proxy. See [Gio.ProxyResolver.lookup] for more
   * details.
   * Params:
   *   uri = a URI representing the destination to connect to
   *   cancellable = a #GCancellable, or %NULL
   *   callback = callback to call after resolution completes
   */
  override void lookupAsync(string uri, Cancellable cancellable, AsyncReadyCallback callback)
  {
    extern(C) void _callbackCallback(ObjectC* sourceObject, GAsyncResult* res, void* data)
    {
      ptrThawGC(data);
      auto _dlg = cast(AsyncReadyCallback*)data;

      (*_dlg)(ObjectG.getDObject!ObjectG(cast(void*)sourceObject, No.Take), ObjectG.getDObject!AsyncResult(cast(void*)res, No.Take));
    }

    const(char)* _uri = uri.toCString(No.Alloc);
    auto _callback = freezeDelegate(cast(void*)&callback);
    g_proxy_resolver_lookup_async(cast(GProxyResolver*)cPtr, _uri, cancellable ? cast(GCancellable*)cancellable.cPtr(No.Dup) : null, &_callbackCallback, _callback);
  }

  /**
   * Call this function to obtain the array of proxy URIs when
   * [Gio.ProxyResolver.lookupAsync] is complete. See
   * [Gio.ProxyResolver.lookup] for more details.
   * Params:
   *   result = the result passed to your #GAsyncReadyCallback
   * Returns: A
   *   NULL-terminated array of proxy URIs. Must be freed
   *   with [GLib.Global.strfreev].
   */
  override string[] lookupFinish(AsyncResult result)
  {
    char** _cretval;
    GError *_err;
    _cretval = g_proxy_resolver_lookup_finish(cast(GProxyResolver*)cPtr, result ? cast(GAsyncResult*)(cast(ObjectG)result).cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorG(_err);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      for (; _cretval[_cretlength] !is null; _cretlength++)
        break;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(Yes.Free);
    }
    return _retval;
  }
}
