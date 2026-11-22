/// Module for [TlsFileDatabase] interface mixin
module gid.gio2.tls_file_database_mixin;

public import gid.core.basictypes;
public import gid.gio2.tls_file_database_iface_proxy;
public import gid.core.utils;
public import gid.gio2.c.functions;
public import gid.gio2.c.types;
public import gid.gio2.types;
public import gid.glib2.error;
public import gid.gobject2.gid_builder;
public import gid.gobject2.object;

/**
    [gid.gio2.tls_file_database.TlsFileDatabase] is implemented by [gid.gio2.tls_database.TlsDatabase] objects which
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
        via the [gid.gio2.tls_database.TlsDatabase.verifyChain] operation.
  */
  @property string anchors() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("anchors");
  }

  /**
      Set `anchors` property.
      Params:
        propval = The path to a file containing PEM encoded certificate authority
          root anchors. The certificates in this file will be treated as
          root authorities for the purpose of verifying other certificates
          via the [gid.gio2.tls_database.TlsDatabase.verifyChain] operation.
  */
  @property void anchors(string propval) nothrow
  {
    gid.gobject2.object.ObjectWrap.setProperty!(string)("anchors", propval);
  }

}

/// Fluent builder implementation template for [gid.gio2.tls_file_database.TlsFileDatabase]
template TlsFileDatabaseGidBuilderT()
{

  /**
      Set `anchors` property.
      Params:
        propval = The path to a file containing PEM encoded certificate authority
          root anchors. The certificates in this file will be treated as
          root authorities for the purpose of verifying other certificates
          via the [gid.gio2.tls_database.TlsDatabase.verifyChain] operation.
      Returns: Builder instance for fluent chaining
  */
  T anchors(string propval) nothrow
  {
    return setProperty("anchors", propval);
  }
}
