/// Module for [TlsFileDatabaseIfaceProxy] interface proxy object
module gio.tls_file_database_iface_proxy;

import gobject.object;
import gio.tls_file_database;
import gio.tls_file_database_mixin;

/// Proxy object for [gio.tls_file_database.TlsFileDatabase] interface when a GObject has no applicable D binding
class TlsFileDatabaseIfaceProxy : IfaceProxy, gio.tls_file_database.TlsFileDatabase
{
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface() nothrow
  {
    return typeid(gio.tls_file_database.TlsFileDatabase);
  }

  mixin TlsFileDatabaseT!();
}
