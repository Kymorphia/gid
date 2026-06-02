/// Module for [TlsServerConnectionIfaceProxy] interface proxy object
module gio.tls_server_connection_iface_proxy;

import gobject.object;
import gio.tls_server_connection;
import gio.tls_server_connection_mixin;

/// Proxy object for [gio.tls_server_connection.TlsServerConnection] interface when a GObject has no applicable D binding
class TlsServerConnectionIfaceProxy : IfaceProxy, gio.tls_server_connection.TlsServerConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.tls_server_connection.TlsServerConnection);
  }

  mixin TlsServerConnectionT!();
}
