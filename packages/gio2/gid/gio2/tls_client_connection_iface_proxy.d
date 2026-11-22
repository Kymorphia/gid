/// Module for [TlsClientConnectionIfaceProxy] interface proxy object
module gid.gio2.tls_client_connection_iface_proxy;

import gid.gobject2.object;
import gid.gio2.tls_client_connection;
import gid.gio2.tls_client_connection_mixin;

/// Proxy object for [gid.gio2.tls_client_connection.TlsClientConnection] interface when a GObject has no applicable D binding
class TlsClientConnectionIfaceProxy : IfaceProxy, gid.gio2.tls_client_connection.TlsClientConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.tls_client_connection.TlsClientConnection);
  }

  mixin TlsClientConnectionT!();
}
