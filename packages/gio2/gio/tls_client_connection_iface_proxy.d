/// Module for [TlsClientConnectionIfaceProxy] interface proxy object
module gio.tls_client_connection_iface_proxy;

import gobject.object;
import gio.tls_client_connection;
import gio.tls_client_connection_mixin;

/// Proxy object for [gio.tls_client_connection.TlsClientConnection] interface when a GObject has no applicable D binding
class TlsClientConnectionIfaceProxy : IfaceProxy, gio.tls_client_connection.TlsClientConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.tls_client_connection.TlsClientConnection);
  }

  mixin TlsClientConnectionT!();
}
