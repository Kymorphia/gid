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
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncConnect`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.iostream.IOStream vfuncConnect(gid.gio2.iostream.IOStream connection, gid.gio2.proxy_address.ProxyAddress proxyAddress, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy.Proxy._getGType);
    if (!_klass || !_klass.connect)
      return typeof(return).init;

    GIOStream* _cretval;
    GError *_err;
    _cretval = _klass.connect(cast(GProxy*)this._cPtr, connection ? cast(GIOStream*)connection._cPtr(No.Dup) : null, proxyAddress ? cast(GProxyAddress*)proxyAddress._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncConnectAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncConnectAsync(gid.gio2.iostream.IOStream connection, gid.gio2.proxy_address.ProxyAddress proxyAddress, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy.Proxy._getGType);
    if (!_klass || !_klass.connectAsync)
      return;

    extern(C) void _callbackCallback(GObject* sourceObject, GAsyncResult* res, void* data) nothrow
    {
      gidAttachThread();
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
    _klass.connectAsync(cast(GProxy*)this._cPtr, connection ? cast(GIOStream*)connection._cPtr(No.Dup) : null, proxyAddress ? cast(GProxyAddress*)proxyAddress._cPtr(No.Dup) : null, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
  }

  /**
      See [gid.gio2.proxy.Proxy.connect].
  
      Params:
        result = a #GAsyncResult
      Returns: a #GIOStream.
      Throws: [ErrorWrap]
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncConnectFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.iostream.IOStream vfuncConnectFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy.Proxy._getGType);
    if (!_klass || !_klass.connectFinish)
      return typeof(return).init;

    GIOStream* _cretval;
    GError *_err;
    _cretval = _klass.connectFinish(cast(GProxy*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncSupportsHostname`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncSupportsHostname()
  {
    auto _klass = cast(GProxyInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy.Proxy._getGType);
    if (!_klass || !_klass.supportsHostname)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.supportsHostname(cast(GProxy*)this._cPtr);
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
      gidAttachThread();
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

  /// True if the D class T overrides any vfunc method of gid.gio2.proxy.Proxy (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_proxy_Proxy(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConnect", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConnectAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConnectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsHostname", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.proxy.Proxy vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_proxy_Proxy(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConnect", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_proxy_Proxy(iface, "connect");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConnectAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.proxy.Proxy.vfuncConnectAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncConnectFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_proxy_Proxy(iface, "connect_finish");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncSupportsHostname", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_proxy_Proxy(iface, "supports_hostname");
  }

  private static void _installIfaceVfunc_gid_gio2_proxy_Proxy(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GProxyInterface*)iface;

    switch (vfunc)
    {
      case "connect":
      {
        static extern(C) GIOStream* _vfuncConnectTramp(GProxy* proxy, GIOStream* connection, GProxyAddress* proxyAddress, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)proxy);
          if (!_obj)
          {
            auto _klass = cast(GProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proxy), gid.gio2.proxy.Proxy._getGType);
            if (_klass && _klass.connect)
              return (cast(typeof(&_vfuncConnectTramp))_klass.connect)(proxy, connection, proxyAddress, cancellable, _err);
            return typeof(return).init;
          }

          gid.gio2.iostream.IOStream _dretval;

          try
          {
            _dretval = _obj.vfuncConnect(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.iostream.IOStream)(cast(void*)connection, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.proxy_address.ProxyAddress)(cast(void*)proxyAddress, No.Take), gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.connect = cast(typeof(_klass.connect))&_vfuncConnectTramp;
        break;
      }
      case "connect_finish":
      {
        static extern(C) GIOStream* _vfuncConnectFinishTramp(GProxy* proxy, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)proxy);
          if (!_obj)
          {
            auto _klass = cast(GProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proxy), gid.gio2.proxy.Proxy._getGType);
            if (_klass && _klass.connectFinish)
              return (cast(typeof(&_vfuncConnectFinishTramp))_klass.connectFinish)(proxy, result, _err);
            return typeof(return).init;
          }

          gid.gio2.iostream.IOStream _dretval;

          try
          {
            _dretval = _obj.vfuncConnectFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          auto _retval = _dretval ? cast(GIOStream*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.connectFinish = cast(typeof(_klass.connectFinish))&_vfuncConnectFinishTramp;
        break;
      }
      case "supports_hostname":
      {
        static extern(C) gboolean _vfuncSupportsHostnameTramp(GProxy* proxy) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)proxy);
          if (!_obj)
          {
            auto _klass = cast(GProxyInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)proxy), gid.gio2.proxy.Proxy._getGType);
            if (_klass && _klass.supportsHostname)
              return (cast(typeof(&_vfuncSupportsHostnameTramp))_klass.supportsHostname)(proxy);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncSupportsHostname();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.proxy.Proxy.vfuncSupportsHostname");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.supportsHostname = cast(typeof(_klass.supportsHostname))&_vfuncSupportsHostnameTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.proxy.Proxy]
template ProxyGidBuilderT()
{
}
