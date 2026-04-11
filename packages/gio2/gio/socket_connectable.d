/// Module for [SocketConnectable] interface
module gio.socket_connectable;

public import gio.socket_connectable_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.socket_address_enumerator;
import gio.types;
import gobject.gid_builder;
import gobject.object;

/**
    Objects that describe one or more potential socket endpoints
    implement [gio.socket_connectable.SocketConnectable]. Callers can then use
    [gio.socket_connectable.SocketConnectable.enumerate] to get a
    [gio.socket_address_enumerator.SocketAddressEnumerator] to try out each socket address in turn
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
interface SocketConnectable
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_socket_connectable_get_type != &gidSymbolNotFound ? g_socket_connectable_get_type() : cast(GType)0;
  }

  /**
      Creates a #GSocketAddressEnumerator for connectable.
      Returns: a new #GSocketAddressEnumerator.
  */
  gio.socket_address_enumerator.SocketAddressEnumerator enumerate();

  /**
      Creates a #GSocketAddressEnumerator for connectable that will
      return a #GProxyAddress for each of its addresses that you must connect
      to via a proxy.
      
      If connectable does not implement
      [gio.socket_connectable.SocketConnectable.proxyEnumerate], this will fall back to
      calling [gio.socket_connectable.SocketConnectable.enumerate].
      Returns: a new #GSocketAddressEnumerator.
  */
  gio.socket_address_enumerator.SocketAddressEnumerator proxyEnumerate();

  /**
      Format a #GSocketConnectable as a string. This is a human-readable format for
      use in debugging output, and is not a stable serialization format. It is not
      suitable for use in user interfaces as it exposes too much information for a
      user.
      
      If the #GSocketConnectable implementation does not support string formatting,
      the implementation’s type name will be returned as a fallback.
      Returns: the formatted string
  */
  string toString_();
}

/// Fluent builder implementation template for [gio.socket_connectable.SocketConnectable]
interface SocketConnectableGidBuilderImpl(T)
{
}
