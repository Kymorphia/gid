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
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncIsSupported`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected bool vfuncIsSupported()
  {
    auto _klass = cast(GProxyResolverInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy_resolver.ProxyResolver._getGType);
    if (!_klass || !_klass.isSupported)
      return typeof(return).init;

    bool _retval;
    _retval = cast(bool)_klass.isSupported(cast(GProxyResolver*)this._cPtr);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLookup`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncLookup(string uri, gid.gio2.cancellable.Cancellable cancellable = null)
  {
    auto _klass = cast(GProxyResolverInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy_resolver.ProxyResolver._getGType);
    if (!_klass || !_klass.lookup)
      return typeof(return).init;

    char** _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = _klass.lookup(cast(GProxyResolver*)this._cPtr, _uri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, &_err);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLookupAsync`
      to chain up from an override.
      Overriding it from D is not supported (parameter 'callback' of kind 'Callback' is not supported).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected void vfuncLookupAsync(string uri, gid.gio2.cancellable.Cancellable cancellable = null, gid.gio2.types.AsyncReadyCallback callback = null)
  {
    auto _klass = cast(GProxyResolverInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy_resolver.ProxyResolver._getGType);
    if (!_klass || !_klass.lookupAsync)
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
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    auto _callback = callback ? freezeDelegate(cast(void*)&callback) : null;
    _klass.lookupAsync(cast(GProxyResolver*)this._cPtr, _uri, cancellable ? cast(GCancellable*)cancellable._cPtr(No.Dup) : null, _callbackCB, _callback);
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
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncLookupFinish`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string[] vfuncLookupFinish(gid.gio2.async_result.AsyncResult result)
  {
    auto _klass = cast(GProxyResolverInterface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.proxy_resolver.ProxyResolver._getGType);
    if (!_klass || !_klass.lookupFinish)
      return typeof(return).init;

    char** _cretval;
    GError *_err;
    _cretval = _klass.lookupFinish(cast(GProxyResolver*)this._cPtr, result ? cast(GAsyncResult*)(cast(gid.gobject2.object.ObjectWrap)result)._cPtr(No.Dup) : null, &_err);
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

  /// True if the D class T overrides any vfunc method of gid.gio2.proxy_resolver.ProxyResolver (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_proxy_resolver_ProxyResolver(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSupported", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookup", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupAsync", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupFinish", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.proxy_resolver.ProxyResolver vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_proxy_resolver_ProxyResolver(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncIsSupported", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_proxy_resolver_ProxyResolver(iface, "is_supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookup", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_proxy_resolver_ProxyResolver(iface, "lookup");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupAsync", true)[0], gid.gobject2.object.GidIfaceVfunc))
      static assert(0, "Overriding gid.gio2.proxy_resolver.ProxyResolver.vfuncLookupAsync is not supported: parameter 'callback' of kind 'Callback' is not supported");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncLookupFinish", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_proxy_resolver_ProxyResolver(iface, "lookup_finish");
  }

  private static void _installIfaceVfunc_gid_gio2_proxy_resolver_ProxyResolver(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GProxyResolverInterface*)iface;

    switch (vfunc)
    {
      case "is_supported":
      {
        static extern(C) gboolean _vfuncIsSupportedTramp(GProxyResolver* resolver) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GProxyResolverInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver), gid.gio2.proxy_resolver.ProxyResolver._getGType);
            if (_klass && _klass.isSupported)
              return (cast(typeof(&_vfuncIsSupportedTramp))_klass.isSupported)(resolver);
            return typeof(return).init;
          }

          bool _dretval;

          try
          {
            _dretval = _obj.vfuncIsSupported();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.proxy_resolver.ProxyResolver.vfuncIsSupported");
          }
          auto _retval = cast(gboolean)_dretval;

          return _retval;
        }

        _klass.isSupported = cast(typeof(_klass.isSupported))&_vfuncIsSupportedTramp;
        break;
      }
      case "lookup":
      {
        static extern(C) char** _vfuncLookupTramp(GProxyResolver* resolver, const(char)* uri, GCancellable* cancellable, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GProxyResolverInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver), gid.gio2.proxy_resolver.ProxyResolver._getGType);
            if (_klass && _klass.lookup)
              return (cast(typeof(&_vfuncLookupTramp))_klass.lookup)(resolver, uri, cancellable, _err);
            return typeof(return).init;
          }

          string[] _dretval;
          string _uri = uri.fromCString!(No.Free);

          try
          {
            _dretval = _obj.vfuncLookup(_uri, gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.cancellable.Cancellable)(cast(void*)cancellable, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          char** _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc((_dretval.length + 1) * (*_retval).sizeof);

            foreach (i; 0 .. _dretval.length)
              _retval[i] = toCString!(Yes.Malloc)(_dretval[i]);
          }


          return _retval;
        }

        _klass.lookup = cast(typeof(_klass.lookup))&_vfuncLookupTramp;
        break;
      }
      case "lookup_finish":
      {
        static extern(C) char** _vfuncLookupFinishTramp(GProxyResolver* resolver, GAsyncResult* result, GError** _err) nothrow
        {
          gidAttachThread();
          auto _obj = cast(typeof(this))gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)resolver);
          if (!_obj)
          {
            auto _klass = cast(GProxyResolverInterface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)resolver), gid.gio2.proxy_resolver.ProxyResolver._getGType);
            if (_klass && _klass.lookupFinish)
              return (cast(typeof(&_vfuncLookupFinishTramp))_klass.lookupFinish)(resolver, result, _err);
            return typeof(return).init;
          }

          string[] _dretval;

          try
          {
            _dretval = _obj.vfuncLookupFinish(gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.async_result.AsyncResult)(cast(void*)result, No.Take));
          }
          catch (Exception e)
          {
            gidExceptionToGError(e, _err);
          }
          char** _retval;

          if (_dretval.length > 0)
          {
            _retval = cast(typeof(_retval))gMalloc((_dretval.length + 1) * (*_retval).sizeof);

            foreach (i; 0 .. _dretval.length)
              _retval[i] = toCString!(Yes.Malloc)(_dretval[i]);
          }


          return _retval;
        }

        _klass.lookupFinish = cast(typeof(_klass.lookupFinish))&_vfuncLookupFinishTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.proxy_resolver.ProxyResolver]
template ProxyResolverGidBuilderT()
{
}
