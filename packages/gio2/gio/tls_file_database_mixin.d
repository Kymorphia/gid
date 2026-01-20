/// Module for [TlsFileDatabase] interface mixin
module gio.tls_file_database_mixin;

public import gio.tls_file_database_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import glib.error;
public import gobject.object;

/**
    [gio.tls_file_database.TlsFileDatabase] is implemented by [gio.tls_database.TlsDatabase] objects which
    load their certificate information from a file. It is an interface which
    TLS library specific subtypes implement.
*/
template TlsFileDatabaseT()
{

  /**
      Get `anchors` property.
      Returns: The path to a file containing PEM encoded certificate authority
        root anchors. The certificates in this file will be treated as
        root authorities for the purpose of verifying other certificates
        via the [gio.tls_database.TlsDatabase.verifyChain] operation.
  */
  @property string anchors()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("anchors");
  }

  /**
      Set `anchors` property.
      Params:
        propval = The path to a file containing PEM encoded certificate authority
          root anchors. The certificates in this file will be treated as
          root authorities for the purpose of verifying other certificates
          via the [gio.tls_database.TlsDatabase.verifyChain] operation.
  */
  @property void anchors(string propval)
  {
    gobject.object.ObjectWrap.setProperty!(string)("anchors", propval);
  }

}
