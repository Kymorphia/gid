/// Module for [SocketConnectable] interface mixin
module gid.gio2.socket_connectable_mixin;

public import gid.core.basictypes;
public import gid.gio2.socket_connectable;
public import gid.gio2.socket_connectable_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.socket_address_enumerator;
public import gid.gio2.types;
public import gid.gobject2.c.functions;
public import gid.gobject2.c.types;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    Objects that describe one or more potential socket endpoints
    implement [gid.gio2.socket_connectable.SocketConnectable]. Callers can then use
    [gid.gio2.socket_connectable.SocketConnectable.enumerate] to get a
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] to try out each socket address in turn
    until one succeeds, as shown in the sample code below.
    
    ```c
    MyConnectionType *
    connect_to_host (const char    *hostname,
                     guint16        port,
                     GCancellable  *cancellable,
                     GError       **error)
    {
      MyConnection *conn = NULL;
      GSocketConnectable *addr;
      GSocketAddressEnumerator *enumerator;
      GSocketAddress *sockaddr;
      GError *conn_error = NULL;
    
      addr = g_network_address_new (hostname, port);
      enumerator = g_socket_connectable_enumerate (addr);
      g_object_unref (addr);
    
      // Try each sockaddr until we succeed. Record the first connection error,
      // but not any further ones (since they'll probably be basically the same
      // as the first).
      while (!conn && (sockaddr = g_socket_address_enumerator_next (enumerator, cancellable, error))
        {
          conn = connect_to_sockaddr (sockaddr, conn_error ? NULL : &conn_error);
          g_object_unref (sockaddr);
        }
      g_object_unref (enumerator);
    
      if (conn)
        {
          if (conn_error)
            {
              // We couldn't connect to the first address, but we succeeded
              // in connecting to a later address.
              g_error_free (conn_error);
            }
          return conn;
        }
      else if (error)
        {
          /// Either initial lookup failed, or else the caller cancelled us.
          if (conn_error)
            g_error_free (conn_error);
          return NULL;
        }
      else
        {
          g_error_propagate (error, conn_error);
          return NULL;
        }
    }
    ```
*/
template SocketConnectableT()
{

  /**
      Creates a #GSocketAddressEnumerator for connectable.
      Returns: a new #GSocketAddressEnumerator.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncEnumerate`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.socket_address_enumerator.SocketAddressEnumerator vfuncEnumerate()
  {
    auto _klass = cast(GSocketConnectableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.socket_connectable.SocketConnectable._getGType);
    if (!_klass || !_klass.enumerate)
      return typeof(return).init;

    GSocketAddressEnumerator* _cretval;
    _cretval = _klass.enumerate(cast(GSocketConnectable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address_enumerator.SocketAddressEnumerator)(cast(GSocketAddressEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GSocketAddressEnumerator for connectable that will
      return a #GProxyAddress for each of its addresses that you must connect
      to via a proxy.
      
      If connectable does not implement
      [gid.gio2.socket_connectable.SocketConnectable.proxyEnumerate], this will fall back to
      calling [gid.gio2.socket_connectable.SocketConnectable.enumerate].
      Returns: a new #GSocketAddressEnumerator.
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncProxyEnumerate`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected gid.gio2.socket_address_enumerator.SocketAddressEnumerator vfuncProxyEnumerate()
  {
    auto _klass = cast(GSocketConnectableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.socket_connectable.SocketConnectable._getGType);
    if (!_klass || !_klass.proxyEnumerate)
      return typeof(return).init;

    GSocketAddressEnumerator* _cretval;
    _cretval = _klass.proxyEnumerate(cast(GSocketConnectable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address_enumerator.SocketAddressEnumerator)(cast(GSocketAddressEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Format a #GSocketConnectable as a string. This is a human-readable format for
      use in debugging output, and is not a stable serialization format. It is not
      suitable for use in user interfaces as it exposes too much information for a
      user.
      
      If the #GSocketConnectable implementation does not support string formatting,
      the implementation’s type name will be returned as a fallback.
      Returns: the formatted string
  
      Interface virtual method: calls the C implementation of the interface of the object's class (or of the
      nearest C ancestor class of a D subclass type, a no-op if it does not implement the interface), use `super.vfuncToString`
      to chain up from an override.
      Overrides are installed in the interface structure of the D subclass GType (see `gid.gobject2.object.GObjectSubclass`).
  */
  @(gid.gobject2.object.GidIfaceVfunc)
  protected string vfuncToString()
  {
    auto _klass = cast(GSocketConnectableIface*)g_type_interface_peek(cast(GTypeClass*)_vfuncClass, gid.gio2.socket_connectable.SocketConnectable._getGType);
    if (!_klass || !_klass.toString_)
      return typeof(return).init;

    char* _cretval;
    _cretval = _klass.toString_(cast(GSocketConnectable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Creates a #GSocketAddressEnumerator for connectable.
      Returns: a new #GSocketAddressEnumerator.
  */
  override gid.gio2.socket_address_enumerator.SocketAddressEnumerator enumerate() nothrow
  {
    GSocketAddressEnumerator* _cretval;
    _cretval = g_socket_connectable_enumerate(cast(GSocketConnectable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address_enumerator.SocketAddressEnumerator)(cast(GSocketAddressEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GSocketAddressEnumerator for connectable that will
      return a #GProxyAddress for each of its addresses that you must connect
      to via a proxy.
      
      If connectable does not implement
      [gid.gio2.socket_connectable.SocketConnectable.proxyEnumerate], this will fall back to
      calling [gid.gio2.socket_connectable.SocketConnectable.enumerate].
      Returns: a new #GSocketAddressEnumerator.
  */
  override gid.gio2.socket_address_enumerator.SocketAddressEnumerator proxyEnumerate() nothrow
  {
    GSocketAddressEnumerator* _cretval;
    _cretval = g_socket_connectable_proxy_enumerate(cast(GSocketConnectable*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address_enumerator.SocketAddressEnumerator)(cast(GSocketAddressEnumerator*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Format a #GSocketConnectable as a string. This is a human-readable format for
      use in debugging output, and is not a stable serialization format. It is not
      suitable for use in user interfaces as it exposes too much information for a
      user.
      
      If the #GSocketConnectable implementation does not support string formatting,
      the implementation’s type name will be returned as a fallback.
      Returns: the formatted string
  */
  override string toString_() nothrow
  {
    char* _cretval;
    _cretval = g_socket_connectable_to_string(cast(GSocketConnectable*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /// True if the D class T overrides any vfunc method of gid.gio2.socket_connectable.SocketConnectable (DiG)
  enum bool _ifaceVfuncsOverridden_gid_gio2_socket_connectable_SocketConnectable(T) = !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncProxyEnumerate", true)[0], gid.gobject2.object.GidIfaceVfunc) || !imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncToString", true)[0], gid.gobject2.object.GidIfaceVfunc);

  /**
      Install the C trampolines of the gid.gio2.socket_connectable.SocketConnectable vfunc methods which a D class overrides into the interface
      structure of its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overriding a vfunc method which has no
      trampoline is a compile error.
      Params:
        T = D class
        iface = Interface structure of the GType registered for T
  */
  static void _installIfaceVfuncs_gid_gio2_socket_connectable_SocketConnectable(T)(void* iface) nothrow
  {
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncEnumerate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_socket_connectable_SocketConnectable(iface, "enumerate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncProxyEnumerate", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_socket_connectable_SocketConnectable(iface, "proxy_enumerate");
    static if (!imported!"std.traits".hasUDA!(__traits(getOverloads, T, "vfuncToString", true)[0], gid.gobject2.object.GidIfaceVfunc))
      _installIfaceVfunc_gid_gio2_socket_connectable_SocketConnectable(iface, "to_string");
  }

  private static void _installIfaceVfunc_gid_gio2_socket_connectable_SocketConnectable(void* iface, string vfunc) nothrow
  {
    auto _klass = cast(GSocketConnectableIface*)iface;

    switch (vfunc)
    {
      case "enumerate":
      {
        static extern(C) GSocketAddressEnumerator* _vfuncEnumerateTramp(GSocketConnectable* connectable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)connectable);
          if (!_obj)
          {
            auto _klass = cast(GSocketConnectableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)connectable), gid.gio2.socket_connectable.SocketConnectable._getGType);
            if (_klass && _klass.enumerate)
              return (cast(typeof(&_vfuncEnumerateTramp))_klass.enumerate)(connectable);
            return typeof(return).init;
          }

          gid.gio2.socket_address_enumerator.SocketAddressEnumerator _dretval;

          try
          {
            _dretval = _obj.vfuncEnumerate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_connectable.SocketConnectable.vfuncEnumerate");
          }
          auto _retval = _dretval ? cast(GSocketAddressEnumerator*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.enumerate = cast(typeof(_klass.enumerate))&_vfuncEnumerateTramp;
        break;
      }
      case "proxy_enumerate":
      {
        static extern(C) GSocketAddressEnumerator* _vfuncProxyEnumerateTramp(GSocketConnectable* connectable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)connectable);
          if (!_obj)
          {
            auto _klass = cast(GSocketConnectableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)connectable), gid.gio2.socket_connectable.SocketConnectable._getGType);
            if (_klass && _klass.proxyEnumerate)
              return (cast(typeof(&_vfuncProxyEnumerateTramp))_klass.proxyEnumerate)(connectable);
            return typeof(return).init;
          }

          gid.gio2.socket_address_enumerator.SocketAddressEnumerator _dretval;

          try
          {
            _dretval = _obj.vfuncProxyEnumerate();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_connectable.SocketConnectable.vfuncProxyEnumerate");
          }
          auto _retval = _dretval ? cast(GSocketAddressEnumerator*)_dretval._cPtr(Yes.Dup) : null;

          return _retval;
        }

        _klass.proxyEnumerate = cast(typeof(_klass.proxyEnumerate))&_vfuncProxyEnumerateTramp;
        break;
      }
      case "to_string":
      {
        static extern(C) char* _vfuncToStringTramp(GSocketConnectable* connectable) nothrow
        {
          gidAttachThread();
          auto _obj = gid.gobject2.object.ObjectWrap._vfuncDObject!(typeof(this))(cast(void*)connectable);
          if (!_obj)
          {
            auto _klass = cast(GSocketConnectableIface*)g_type_interface_peek(cast(GTypeClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)connectable), gid.gio2.socket_connectable.SocketConnectable._getGType);
            if (_klass && _klass.toString_)
              return (cast(typeof(&_vfuncToStringTramp))_klass.toString_)(connectable);
            return typeof(return).init;
          }

          string _dretval;

          try
          {
            _dretval = _obj.vfuncToString();
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.gio2.socket_connectable.SocketConnectable.vfuncToString");
          }
          auto _retval = toCString!(Yes.Malloc, No.Nullable)(_dretval);

          return _retval;
        }

        _klass.toString_ = cast(typeof(_klass.toString_))&_vfuncToStringTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.gio2.socket_connectable.SocketConnectable]
template SocketConnectableGidBuilderT()
{
}
