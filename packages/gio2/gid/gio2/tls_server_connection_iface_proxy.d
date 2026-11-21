/// Module for [TlsServerConnectionIfaceProxy] interface proxy object
module gid.gio2.tls_server_connection_iface_proxy;

import gid.gobject2.object;
import gid.gio2.tls_server_connection;
import gid.gio2.tls_server_connection_mixin;

/// Proxy object for [gid.gio2.tls_server_connection.TlsServerConnection] interface when a GObject has no applicable D binding
class TlsServerConnectionIfaceProxy : IfaceProxy, gid.gio2.tls_server_connection.TlsServerConnection
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.tls_server_connection.TlsServerConnection);
  }

  mixin TlsServerConnectionT!();
}
