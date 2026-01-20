/// Module for [TlsFileDatabase] interface
module gio.tls_file_database;

public import gio.tls_file_database_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import gobject.object;

/**
    [gio.tls_file_database.TlsFileDatabase] is implemented by [gio.tls_database.TlsDatabase] objects which
    load their certificate information from a file. It is an interface which
    TLS library specific subtypes implement.
*/
interface TlsFileDatabase
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_tls_file_database_get_type != &gidSymbolNotFound ? g_tls_file_database_get_type() : cast(GType)0;
  }

  /**
      Get `anchors` property.
      Returns: The path to a file containing PEM encoded certificate authority
        root anchors. The certificates in this file will be treated as
        root authorities for the purpose of verifying other certificates
        via the [gio.tls_database.TlsDatabase.verifyChain] operation.
  */
  @property string anchors();

  /**
      Set `anchors` property.
      Params:
        propval = The path to a file containing PEM encoded certificate authority
          root anchors. The certificates in this file will be treated as
          root authorities for the purpose of verifying other certificates
          via the [gio.tls_database.TlsDatabase.verifyChain] operation.
  */
  @property void anchors(string propval);

  /**
      Creates a new #GTlsFileDatabase which uses anchor certificate authorities
      in anchors to verify certificate chains.
      
      The certificates in anchors must be PEM encoded.
  
      Params:
        anchors = filename of anchor certificate authorities.
      Returns: the new
        #GTlsFileDatabase, or null on error
      Throws: [ErrorWrap]
  */
  static gio.tls_file_database.TlsFileDatabase new_(string anchors)
  {
    GTlsDatabase* _cretval;
    const(char)* _anchors = anchors.toCString(No.Alloc);
    GError *_err;
    _cretval = g_tls_file_database_new(_anchors, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_file_database.TlsFileDatabase)(cast(GTlsDatabase*)_cretval, Yes.Take);
    return _retval;
  }
}
