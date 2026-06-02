/// Module for [DtlsClientConnectionIfaceProxy] interface proxy object
module gio.dtls_client_connection_iface_proxy;

import gobject.object;
import gio.dtls_client_connection;
import gio.dtls_client_connection_mixin;

/// Proxy object for [gio.dtls_client_connection.DtlsClientConnection] interface when a GObject has no applicable D binding
class DtlsClientConnectionIfaceProxy : IfaceProxy, gio.dtls_client_connection.DtlsClientConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.dtls_client_connection.DtlsClientConnection);
  }

  mixin DtlsClientConnectionT!();
}
