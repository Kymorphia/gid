/// Module for [ProxyAddressEnumerator] class
module gid.gio2.proxy_address_enumerator;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.proxy_resolver;
import gid.gio2.socket_address_enumerator;
import gid.gio2.socket_connectable;
import gid.gio2.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.proxy_address_enumerator.ProxyAddressEnumerator] is a wrapper around
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] which takes the [gid.gio2.socket_address.SocketAddress]
    instances returned by the [gid.gio2.socket_address_enumerator.SocketAddressEnumerator]
    and wraps them in [gid.gio2.proxy_address.ProxyAddress] instances, using the given
    [gid.gio2.proxy_address_enumerator.ProxyAddressEnumerator.proxyResolver].
    
    This enumerator will be returned (for example, by
    [gid.gio2.socket_connectable.SocketConnectable.enumerate]) as appropriate when a proxy is
    configured; there should be no need to manually wrap a
    [gid.gio2.socket_address_enumerator.SocketAddressEnumerator] instance with one.
*/
class ProxyAddressEnumerator : gid.gio2.socket_address_enumerator.SocketAddressEnumerator
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_proxy_address_enumerator_get_type != &gidSymbolNotFound ? g_proxy_address_enumerator_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GProxyAddressEnumerator";
  }

  /** Returns `this`, for use in `with` statements. */
  override ProxyAddressEnumerator self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gio2.proxy_address_enumerator.ProxyAddressEnumerator]
      Returns: New builder object
  */
  static ProxyAddressEnumeratorGidBuilder builder() nothrow
  {
    return new ProxyAddressEnumeratorGidBuilder;
  }

  /**
      Get `connectable` property.
      Returns: The connectable being enumerated.
  */
  @property gid.gio2.socket_connectable.SocketConnectable connectable() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.socket_connectable.SocketConnectable)("connectable");
  }

  /**
      Get `defaultPort` property.
      Returns: The default port to use if #GProxyAddressEnumerator:uri does not
        specify one.
  */
  @property uint defaultPort() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(uint)("default-port");
  }

  /**
      Get `proxyResolver` property.
      Returns: The proxy resolver to use.
  */
  @property gid.gio2.proxy_resolver.ProxyResolver proxyResolver() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.gio2.proxy_resolver.ProxyResolver)("proxy-resolver");
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = The proxy resolver to use.
  */
  @property void proxyResolver(gid.gio2.proxy_resolver.ProxyResolver propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(gid.gio2.proxy_resolver.ProxyResolver)("proxy-resolver", propval);
  }

  /**
      Get `uri` property.
      Returns: The destination URI. Use `none://` for a generic socket.
  */
  @property string uri() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("uri");
  }
}

/// Fluent builder implementation template for [gid.gio2.proxy_address_enumerator.ProxyAddressEnumerator]
class ProxyAddressEnumeratorGidBuilderImpl(T) : gid.gio2.socket_address_enumerator.SocketAddressEnumeratorGidBuilderImpl!T
{

  /**
      Set `connectable` property.
      Params:
        propval = The connectable being enumerated.
      Returns: Builder instance for fluent chaining
  */
  T connectable(gid.gio2.socket_connectable.SocketConnectable propval) nothrow
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
  T defaultPort(uint propval) nothrow
  {
    return setProperty("default-port", propval);
  }

  /**
      Set `proxyResolver` property.
      Params:
        propval = The proxy resolver to use.
      Returns: Builder instance for fluent chaining
  */
  T proxyResolver(gid.gio2.proxy_resolver.ProxyResolver propval) nothrow
  {
    return setProperty("proxy-resolver", propval);
  }

  /**
      Set `uri` property.
      Params:
        propval = The destination URI. Use `none://` for a generic socket.
      Returns: Builder instance for fluent chaining
  */
  T uri(string propval) nothrow
  {
    return setProperty("uri", propval);
  }
}

/// Fluent builder for [gid.gio2.proxy_address_enumerator.ProxyAddressEnumerator]
final class ProxyAddressEnumeratorGidBuilder : ProxyAddressEnumeratorGidBuilderImpl!ProxyAddressEnumeratorGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ProxyAddressEnumerator build() nothrow
  {
    return new ProxyAddressEnumerator(cast(void*)createGObject(ProxyAddressEnumerator._getGType), Yes.Take);
  }
}
