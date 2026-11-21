/// Module for [DtlsConnectionIfaceProxy] interface proxy object
module gid.gio2.dtls_connection_iface_proxy;

import gid.gobject2.object;
import gid.gio2.dtls_connection;
import gid.gio2.dtls_connection_mixin;
import gid.gio2.datagram_based;
import gid.gio2.datagram_based_mixin;

/// Proxy object for [gid.gio2.dtls_connection.DtlsConnection] interface when a GObject has no applicable D binding
class DtlsConnectionIfaceProxy : IfaceProxy, gid.gio2.dtls_connection.DtlsConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.dtls_connection.DtlsConnection);
  }

  mixin DtlsConnectionT!();
  mixin gid.gio2.datagram_based_mixin.DatagramBasedT!();
}
