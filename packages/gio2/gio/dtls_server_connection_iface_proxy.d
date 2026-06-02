/// Module for [DtlsServerConnectionIfaceProxy] interface proxy object
module gio.dtls_server_connection_iface_proxy;

import gobject.object;
import gio.dtls_server_connection;
import gio.dtls_server_connection_mixin;

/// Proxy object for [gio.dtls_server_connection.DtlsServerConnection] interface when a GObject has no applicable D binding
class DtlsServerConnectionIfaceProxy : IfaceProxy, gio.dtls_server_connection.DtlsServerConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.dtls_server_connection.DtlsServerConnection);
  }

  mixin DtlsServerConnectionT!();
}
