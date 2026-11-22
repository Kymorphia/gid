/// Module for [DtlsServerConnectionIfaceProxy] interface proxy object
module gid.gio2.dtls_server_connection_iface_proxy;

import gid.gobject2.object;
import gid.gio2.dtls_server_connection;
import gid.gio2.dtls_server_connection_mixin;
import gid.gio2.datagram_based;
import gid.gio2.datagram_based_mixin;
import gid.gio2.dtls_connection;
import gid.gio2.dtls_connection_mixin;

/// Proxy object for [gid.gio2.dtls_server_connection.DtlsServerConnection] interface when a GObject has no applicable D binding
class DtlsServerConnectionIfaceProxy : IfaceProxy, gid.gio2.dtls_server_connection.DtlsServerConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.dtls_server_connection.DtlsServerConnection);
  }

  mixin DtlsServerConnectionT!();
  mixin gid.gio2.datagram_based_mixin.DatagramBasedT!();
  mixin gid.gio2.dtls_connection_mixin.DtlsConnectionT!();
}
