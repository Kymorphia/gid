/// Module for [DtlsClientConnectionIfaceProxy] interface proxy object
module gid.gio2.dtls_client_connection_iface_proxy;

import gid.gobject2.object;
import gid.gio2.dtls_client_connection;
import gid.gio2.dtls_client_connection_mixin;
import gid.gio2.datagram_based;
import gid.gio2.datagram_based_mixin;
import gid.gio2.dtls_connection;
import gid.gio2.dtls_connection_mixin;

/// Proxy object for [gid.gio2.dtls_client_connection.DtlsClientConnection] interface when a GObject has no applicable D binding
class DtlsClientConnectionIfaceProxy : IfaceProxy, gid.gio2.dtls_client_connection.DtlsClientConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.dtls_client_connection.DtlsClientConnection);
  }

  mixin DtlsClientConnectionT!();
  mixin gid.gio2.datagram_based_mixin.DatagramBasedT!();
  mixin gid.gio2.dtls_connection_mixin.DtlsConnectionT!();
}
