/// Module for [ProxyAddressEnumerator] class
module gio.proxy_address_enumerator;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.proxy_resolver;
import gio.socket_address_enumerator;
import gio.socket_connectable;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    [gio.proxy_address_enumerator.ProxyAddressEnumerator] is a wrapper around
    [gio.socket_address_enumerator.SocketAddressEnumerator] which takes the [gio.socket_address.SocketAddress]
    instances returned by the [gio.socket_address_enumerator.SocketAddressEnumerator]
    and wraps them in [gio.proxy_address.ProxyAddress] instances, using the given
    `property@Gio.ProxyAddressEnumerator:proxy-resolver`.
    
    This enumerator will be returned (for example, by
    [gio.socket_connectable.SocketConnectable.enumerate]) as appropriate when a proxy is
    configured; there should be no need to manually wrap a
    [gio.socket_address_enumerator.SocketAddressEnumerator] instance with one.
*/
class ProxyAddressEnumerator : gio.socket_address_enumerator.SocketAddressEnumerator
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_proxy_address_enumerator_get_type != &gidSymbolNotFound ? g_proxy_address_enumerator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ProxyAddressEnumerator self()
  {
    return this;
  }

  /**
  Get builder for [gio.proxy_address_enumerator.ProxyAddressEnumerator]
  Returns: New builder object
  */
  static ProxyAddressEnumeratorGidBuilder builder()
  {
    return new ProxyAddressEnumeratorGidBuilder;
  }

  /**
      Get `connectable` property.
      Returns: The connectable being enumerated.
  */
  @property gio.socket_connectable.SocketConnectable connectable()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.socket_connectable.SocketConnectable)("connectable");
  }

  /**
      Get `defaultPort` property.
      Returns: The default port to use if #GProxyAddressEnumerator:uri does not
        specify one.
  */
  @property uint defaultPort()
  {
    return gobject.object.ObjectWrap.getProperty!(uint)("default-port");
  }

  /**
      Get `proxyResolver` property.
      Returns: The proxy resolver to use.
  */
  @property gio.proxy_resolver.ProxyResolver proxyResolver()
  {
    return gobject.object.ObjectWrap.getProperty!(gio.proxy_resolver.ProxyResolver)("proxy-resolver");
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = The proxy resolver to use.
  */
  @property void proxyResolver(gio.proxy_resolver.ProxyResolver propval)
  {
    gobject.object.ObjectWrap.setProperty!(gio.proxy_resolver.ProxyResolver)("proxy-resolver", propval);
  }

  /**
      Get `uri` property.
      Returns: The destination URI. Use `none://` for a generic socket.
  */
  @property string uri()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("uri");
  }
}

class ProxyAddressEnumeratorGidBuilderImpl(T) : gio.socket_address_enumerator.SocketAddressEnumeratorGidBuilderImpl!T
{

  /**
      Set `connectable` property.
      Params:
        propval = The connectable being enumerated.
      Returns: Builder instance for fluent chaining
  */
  T connectable(gio.socket_connectable.SocketConnectable propval)
  {
    return setProperty("connectable", propval);
  }

  /**
      Set `defaultPort` property.
      Params:
        propval = The default port to use if #GProxyAddressEnumerator:uri does not
          specify one.
      Returns: Builder instance for fluent chaining
  */
  T defaultPort(uint propval)
  {
    return setProperty("default-port", propval);
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = The proxy resolver to use.
      Returns: Builder instance for fluent chaining
  */
  T proxyResolver(gio.proxy_resolver.ProxyResolver propval)
  {
    return setProperty("proxy-resolver", propval);
  }

  /**
      Set `uri` property.
      Params:
        propval = The destination URI. Use `none://` for a generic socket.
      Returns: Builder instance for fluent chaining
  */
  T uri(string propval)
  {
    return setProperty("uri", propval);
  }
}

/// Fluent builder for [gio.proxy_address_enumerator.ProxyAddressEnumerator]
final class ProxyAddressEnumeratorGidBuilder : ProxyAddressEnumeratorGidBuilderImpl!ProxyAddressEnumeratorGidBuilder
{
  ProxyAddressEnumerator build()
  {
    return new ProxyAddressEnumerator(cast(void*)createGObject(ProxyAddressEnumerator._getGType), No.Take);
  }
}
