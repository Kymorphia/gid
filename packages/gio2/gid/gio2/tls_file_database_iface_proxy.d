/// Module for [TlsFileDatabaseIfaceProxy] interface proxy object
module gid.gio2.tls_file_database_iface_proxy;

import gid.gobject2.object;
import gid.gio2.tls_file_database;
import gid.gio2.tls_file_database_mixin;

/// Proxy object for [gid.gio2.tls_file_database.TlsFileDatabase] interface when a GObject has no applicable D binding
class TlsFileDatabaseIfaceProxy : IfaceProxy, gid.gio2.tls_file_database.TlsFileDatabase
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gid.gio2.tls_file_database.TlsFileDatabase);
  }

  mixin TlsFileDatabaseT!();
}
