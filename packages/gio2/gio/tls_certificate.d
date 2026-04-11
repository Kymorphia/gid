/// Module for [TlsCertificate] class
module gio.tls_certificate;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.inet_address;
import gio.socket_connectable;
import gio.types;
import glib.bytes;
import glib.date_time;
import glib.error;
import gobject.gid_builder;
import gobject.object;

/**
    A certificate used for TLS authentication and encryption.
    This can represent either a certificate only (eg, the certificate
    received by a client from a server), or the combination of
    a certificate and a private key (which is needed when acting as a
    [gio.tls_server_connection.TlsServerConnection]).
*/
class TlsCertificate : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_tls_certificate_get_type != &gidSymbolNotFound ? g_tls_certificate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TlsCertificate self()
  {
    return this;
  }

  /**
      Get builder for [gio.tls_certificate.TlsCertificate]
      Returns: New builder object
  */
  static TlsCertificateGidBuilder builder()
  {
    return new TlsCertificateGidBuilder;
  }

  /**
      Get `certificatePem` property.
      Returns: The PEM (ASCII) encoded representation of the certificate.
        This property and the #GTlsCertificate:certificate
        property represent the same data, just in different forms.
  */
  @property string certificatePem()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("certificate-pem");
  }

  /**
      Get `issuer` property.
      Returns: A #GTlsCertificate representing the entity that issued this
        certificate. If null, this means that the certificate is either
        self-signed, or else the certificate of the issuer is not
        available.
        
        Beware the issuer certificate may not be the same as the
        certificate that would actually be used to construct a valid
        certification path during certificate verification.
        [RFC 4158](https://datatracker.ietf.org/doc/html/rfc4158) explains
        why an issuer certificate cannot be naively assumed to be part of the
        the certification path (though GLib's TLS backends may not follow the
        path building strategies outlined in this RFC). Due to the complexity
        of certification path building, GLib does not provide any way to know
        which certification path will actually be used. Accordingly, this
        property cannot be used to make security-related decisions. Only
        GLib itself should make security decisions about TLS certificates.
  */
  @property gio.tls_certificate.TlsCertificate issuer()
  {
    return getIssuer();
  }

  /**
      Get `issuerName` property.
      Returns: The issuer from the certificate,
        null if unavailable.
  */
  @property string issuerName()
  {
    return getIssuerName();
  }

  /**
      Get `notValidAfter` property.
      Returns: The time at which this cert is no longer valid,
        null if unavailable.
  */
  @property glib.date_time.DateTime notValidAfter()
  {
    return getNotValidAfter();
  }

  /**
      Get `notValidBefore` property.
      Returns: The time at which this cert is considered to be valid,
        null if unavailable.
  */
  @property glib.date_time.DateTime notValidBefore()
  {
    return getNotValidBefore();
  }

  /**
      Get `pkcs11Uri` property.
      Returns: A URI referencing the [PKCS \#11](https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html)
        objects containing an X.509 certificate and optionally a private key.
        
        If null, the certificate is either not backed by PKCS \#11 or the
        #GTlsBackend does not support PKCS \#11.
  */
  @property string pkcs11Uri()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("pkcs11-uri");
  }

  /**
      Get `privateKeyPem` property.
      Returns: The PEM (ASCII) encoded representation of the certificate's
        private key in either [PKCS \#1 format](https://datatracker.ietf.org/doc/html/rfc8017)
        ("`BEGIN RSA PRIVATE KEY`") or unencrypted
        [PKCS \#8 format](https://datatracker.ietf.org/doc/html/rfc5208)
        ("`BEGIN PRIVATE KEY`"). PKCS \#8 format is supported since 2.32;
        earlier releases only support PKCS \#1. You can use the `openssl rsa`
        tool to convert PKCS \#8 keys to PKCS \#1.
        
        This property (or the #GTlsCertificate:private-key property)
        can be set when constructing a key (for example, from a file).
        Since GLib 2.70, it is now also readable; however, be aware that if
        the private key is backed by a PKCS \#11 URI - for example, if it
        is stored on a smartcard - then this property will be null. If so,
        the private key must be referenced via its PKCS \#11 URI,
        #GTlsCertificate:private-key-pkcs11-uri. You must check both
        properties to see if the certificate really has a private key.
        When this property is read, the output format will be unencrypted
        PKCS \#8.
  */
  @property string privateKeyPem()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("private-key-pem");
  }

  /**
      Get `privateKeyPkcs11Uri` property.
      Returns: A URI referencing a [PKCS \#11](https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html)
        object containing a private key.
  */
  @property string privateKeyPkcs11Uri()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("private-key-pkcs11-uri");
  }

  /**
      Get `subjectName` property.
      Returns: The subject from the cert,
        null if unavailable.
  */
  @property string subjectName()
  {
    return getSubjectName();
  }

  /**
      Creates a #GTlsCertificate from the data in file.
      
      As of 2.72, if the filename ends in `.p12` or `.pfx` the data is loaded by
      [gio.tls_certificate.TlsCertificate.newFromPkcs12] otherwise it is loaded by
      [gio.tls_certificate.TlsCertificate.newFromPem]. See those functions for
      exact details.
      
      If file cannot be read or parsed, the function will return null and
      set error.
  
      Params:
        file = file containing a certificate to import
      Returns: the new certificate, or null on error
      Throws: [ErrorWrap]
  */
  static gio.tls_certificate.TlsCertificate newFromFile(string file)
  {
    GTlsCertificate* _cretval;
    const(char)* _file = file.toCString(No.Alloc);
    GError *_err;
    _cretval = g_tls_certificate_new_from_file(_file, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GTlsCertificate from the data in file.
      
      If file cannot be read or parsed, the function will return null and
      set error.
      
      Any unknown file types will error with [gio.types.IOErrorEnum.NotSupported].
      Currently only `.p12` and `.pfx` files are supported.
      See [gio.tls_certificate.TlsCertificate.newFromPkcs12] for more details.
  
      Params:
        file = file containing a certificate to import
        password = password for PKCS #12 files
      Returns: the new certificate, or null on error
      Throws: [ErrorWrap]
  */
  static gio.tls_certificate.TlsCertificate newFromFileWithPassword(string file, string password)
  {
    GTlsCertificate* _cretval;
    const(char)* _file = file.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    GError *_err;
    _cretval = g_tls_certificate_new_from_file_with_password(_file, _password, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GTlsCertificate from the PEM-encoded data in cert_file
      and key_file. The returned certificate will be the first certificate
      found in cert_file. As of GLib 2.44, if cert_file contains more
      certificates it will try to load a certificate chain. All
      certificates will be verified in the order found (top-level
      certificate should be the last one in the file) and the
      #GTlsCertificate:issuer property of each certificate will be set
      accordingly if the verification succeeds. If any certificate in the
      chain cannot be verified, the first certificate in the file will
      still be returned.
      
      If either file cannot be read or parsed, the function will return
      null and set error. Otherwise, this behaves like
      [gio.tls_certificate.TlsCertificate.newFromPem].
  
      Params:
        certFile = file containing one or more PEM-encoded
              certificates to import
        keyFile = file containing a PEM-encoded private key
              to import
      Returns: the new certificate, or null on error
      Throws: [ErrorWrap]
  */
  static gio.tls_certificate.TlsCertificate newFromFiles(string certFile, string keyFile)
  {
    GTlsCertificate* _cretval;
    const(char)* _certFile = certFile.toCString(No.Alloc);
    const(char)* _keyFile = keyFile.toCString(No.Alloc);
    GError *_err;
    _cretval = g_tls_certificate_new_from_files(_certFile, _keyFile, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GTlsCertificate from the PEM-encoded data in data. If
      data includes both a certificate and a private key, then the
      returned certificate will include the private key data as well. (See
      the #GTlsCertificate:private-key-pem property for information about
      supported formats.)
      
      The returned certificate will be the first certificate found in
      data. As of GLib 2.44, if data contains more certificates it will
      try to load a certificate chain. All certificates will be verified in
      the order found (top-level certificate should be the last one in the
      file) and the #GTlsCertificate:issuer property of each certificate
      will be set accordingly if the verification succeeds. If any
      certificate in the chain cannot be verified, the first certificate in
      the file will still be returned.
  
      Params:
        data = PEM-encoded certificate data
      Returns: the new certificate, or null if data is invalid
      Throws: [ErrorWrap]
  */
  static gio.tls_certificate.TlsCertificate newFromPem(string data)
  {
    GTlsCertificate* _cretval;
    ptrdiff_t _length;
    if (data)
      _length = cast(ptrdiff_t)data.length;

    auto _data = cast(const(char)*)data.ptr;
    GError *_err;
    _cretval = g_tls_certificate_new_from_pem(_data, _length, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GTlsCertificate from a
      [PKCS \#11](https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html) URI.
      
      An example pkcs11_uri would be `pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My`20Client``20Certificate`;id=`01``
      
      Where the token’s layout is:
      
      ```
      Object 0:
        URL: pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01;object=private%20key;type=private
        Type: Private key (RSA-2048)
        ID: 01
      
      Object 1:
        URL: pkcs11:model=Model;manufacturer=Manufacture;serial=1;token=My%20Client%20Certificate;id=%01;object=Certificate%20for%20Authentication;type=cert
        Type: X.509 Certificate (RSA-2048)
        ID: 01
      ```
      
      In this case the certificate and private key would both be detected and used as expected.
      pkcs_uri may also just reference an X.509 certificate object and then optionally
      private_key_pkcs11_uri allows using a private key exposed under a different URI.
      
      Note that the private key is not accessed until usage and may fail or require a PIN later.
  
      Params:
        pkcs11Uri = A PKCS \#11 URI
        privateKeyPkcs11Uri = A PKCS \#11 URI
      Returns: the new certificate, or null on error
      Throws: [ErrorWrap]
  */
  static gio.tls_certificate.TlsCertificate newFromPkcs11Uris(string pkcs11Uri, string privateKeyPkcs11Uri = null)
  {
    GTlsCertificate* _cretval;
    const(char)* _pkcs11Uri = pkcs11Uri.toCString(No.Alloc);
    const(char)* _privateKeyPkcs11Uri = privateKeyPkcs11Uri.toCString(No.Alloc);
    GError *_err;
    _cretval = g_tls_certificate_new_from_pkcs11_uris(_pkcs11Uri, _privateKeyPkcs11Uri, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates a #GTlsCertificate from the data in data. It must contain
      a certificate and matching private key.
      
      If extra certificates are included they will be verified as a chain
      and the #GTlsCertificate:issuer property will be set.
      All other data will be ignored.
      
      You can pass as single password for all of the data which will be
      used both for the PKCS #12 container as well as encrypted
      private keys. If decryption fails it will error with
      [gio.types.TlsError.BadCertificatePassword].
      
      This constructor requires support in the current #GTlsBackend.
      If support is missing it will error with
      [gio.types.IOErrorEnum.NotSupported].
      
      Other parsing failures will error with [gio.types.TlsError.BadCertificate].
  
      Params:
        data = DER-encoded PKCS #12 format certificate data
        password = optional password for encrypted certificate data
      Returns: the new certificate, or null if data is invalid
      Throws: [ErrorWrap]
  */
  static gio.tls_certificate.TlsCertificate newFromPkcs12(ubyte[] data, string password = null)
  {
    GTlsCertificate* _cretval;
    size_t _length;
    if (data)
      _length = cast(size_t)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    const(char)* _password = password.toCString(No.Alloc);
    GError *_err;
    _cretval = g_tls_certificate_new_from_pkcs12(_data, _length, _password, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Creates one or more #GTlsCertificates from the PEM-encoded
      data in file. If file cannot be read or parsed, the function will
      return null and set error. If file does not contain any
      PEM-encoded certificates, this will return an empty list and not
      set error.
  
      Params:
        file = file containing PEM-encoded certificates to import
      Returns: a
        #GList containing #GTlsCertificate objects. You must free the list
        and its contents when you are done with it.
      Throws: [ErrorWrap]
  */
  static gio.tls_certificate.TlsCertificate[] listNewFromFile(string file)
  {
    GList* _cretval;
    const(char)* _file = file.toCString(No.Alloc);
    GError *_err;
    _cretval = g_tls_certificate_list_new_from_file(_file, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gListToD!(gio.tls_certificate.TlsCertificate, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Gets the value of #GTlsCertificate:dns-names.
      Returns: A #GPtrArray of
        #GBytes elements, or null if it's not available.
  */
  glib.bytes.Bytes[] getDnsNames()
  {
    GPtrArray* _cretval;
    _cretval = g_tls_certificate_get_dns_names(cast(GTlsCertificate*)this._cPtr);
    auto _retval = gPtrArrayToD!(glib.bytes.Bytes, GidOwnership.Container)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Gets the value of #GTlsCertificate:ip-addresses.
      Returns: A #GPtrArray
        of #GInetAddress elements, or null if it's not available.
  */
  gio.inet_address.InetAddress[] getIpAddresses()
  {
    GPtrArray* _cretval;
    _cretval = g_tls_certificate_get_ip_addresses(cast(GTlsCertificate*)this._cPtr);
    auto _retval = gPtrArrayToD!(gio.inet_address.InetAddress, GidOwnership.Container)(cast(GPtrArray*)_cretval);
    return _retval;
  }

  /**
      Gets the #GTlsCertificate representing cert's issuer, if known
      Returns: The certificate of cert's issuer,
        or null if cert is self-signed or signed with an unknown
        certificate.
  */
  gio.tls_certificate.TlsCertificate getIssuer()
  {
    GTlsCertificate* _cretval;
    _cretval = g_tls_certificate_get_issuer(cast(GTlsCertificate*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Returns the issuer name from the certificate.
      Returns: The issuer name, or null if it's not available.
  */
  string getIssuerName()
  {
    char* _cretval;
    _cretval = g_tls_certificate_get_issuer_name(cast(GTlsCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Returns the time at which the certificate became or will become invalid.
      Returns: The not-valid-after date, or null if it's not available.
  */
  glib.date_time.DateTime getNotValidAfter()
  {
    GDateTime* _cretval;
    _cretval = g_tls_certificate_get_not_valid_after(cast(GTlsCertificate*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the time at which the certificate became or will become valid.
      Returns: The not-valid-before date, or null if it's not available.
  */
  glib.date_time.DateTime getNotValidBefore()
  {
    GDateTime* _cretval;
    _cretval = g_tls_certificate_get_not_valid_before(cast(GTlsCertificate*)this._cPtr);
    auto _retval = _cretval ? new glib.date_time.DateTime(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Returns the subject name from the certificate.
      Returns: The subject name, or null if it's not available.
  */
  string getSubjectName()
  {
    char* _cretval;
    _cretval = g_tls_certificate_get_subject_name(cast(GTlsCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Check if two #GTlsCertificate objects represent the same certificate.
      The raw DER byte data of the two certificates are checked for equality.
      This has the effect that two certificates may compare equal even if
      their #GTlsCertificate:issuer, #GTlsCertificate:private-key, or
      #GTlsCertificate:private-key-pem properties differ.
  
      Params:
        certTwo = second certificate to compare
      Returns: whether the same or not
  */
  bool isSame(gio.tls_certificate.TlsCertificate certTwo)
  {
    bool _retval;
    _retval = cast(bool)g_tls_certificate_is_same(cast(GTlsCertificate*)this._cPtr, certTwo ? cast(GTlsCertificate*)certTwo._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      This verifies cert and returns a set of #GTlsCertificateFlags
      indicating any problems found with it. This can be used to verify a
      certificate outside the context of making a connection, or to
      check a certificate against a CA that is not part of the system
      CA database.
      
      If cert is valid, [gio.types.TlsCertificateFlags.NoFlags] is returned.
      
      If identity is not null, cert's name(s) will be compared against
      it, and [gio.types.TlsCertificateFlags.BadIdentity] will be set in the return
      value if it does not match. If identity is null, that bit will
      never be set in the return value.
      
      If trusted_ca is not null, then cert (or one of the certificates
      in its chain) must be signed by it, or else
      [gio.types.TlsCertificateFlags.UnknownCa] will be set in the return value. If
      trusted_ca is null, that bit will never be set in the return
      value.
      
      GLib guarantees that if certificate verification fails, at least one
      error will be set in the return value, but it does not guarantee
      that all possible errors will be set. Accordingly, you may not safely
      decide to ignore any particular type of error. For example, it would
      be incorrect to mask [gio.types.TlsCertificateFlags.Expired] if you want to allow
      expired certificates, because this could potentially be the only
      error flag set even if other problems exist with the certificate.
      
      Because TLS session context is not used, #GTlsCertificate may not
      perform as many checks on the certificates as #GTlsConnection would.
      For example, certificate constraints may not be honored, and
      revocation checks may not be performed. The best way to verify TLS
      certificates used by a TLS connection is to let #GTlsConnection
      handle the verification.
  
      Params:
        identity = the expected peer identity
        trustedCa = the certificate of a trusted authority
      Returns: the appropriate #GTlsCertificateFlags
  */
  gio.types.TlsCertificateFlags verify(gio.socket_connectable.SocketConnectable identity = null, gio.tls_certificate.TlsCertificate trustedCa = null)
  {
    GTlsCertificateFlags _cretval;
    _cretval = g_tls_certificate_verify(cast(GTlsCertificate*)this._cPtr, identity ? cast(GSocketConnectable*)(cast(gobject.object.ObjectWrap)identity)._cPtr(No.Dup) : null, trustedCa ? cast(GTlsCertificate*)trustedCa._cPtr(No.Dup) : null);
    gio.types.TlsCertificateFlags _retval = cast(gio.types.TlsCertificateFlags)_cretval;
    return _retval;
  }
}

/// Fluent builder implementation template for [gio.tls_certificate.TlsCertificate]
class TlsCertificateGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `certificatePem` property.
      Params:
        propval = The PEM (ASCII) encoded representation of the certificate.
          This property and the #GTlsCertificate:certificate
          property represent the same data, just in different forms.
      Returns: Builder instance for fluent chaining
  */
  T certificatePem(string propval)
  {
    return setProperty("certificate-pem", propval);
  }

  /**
      Set `issuer` property.
      Params:
        propval = A #GTlsCertificate representing the entity that issued this
          certificate. If null, this means that the certificate is either
          self-signed, or else the certificate of the issuer is not
          available.
          
          Beware the issuer certificate may not be the same as the
          certificate that would actually be used to construct a valid
          certification path during certificate verification.
          [RFC 4158](https://datatracker.ietf.org/doc/html/rfc4158) explains
          why an issuer certificate cannot be naively assumed to be part of the
          the certification path (though GLib's TLS backends may not follow the
          path building strategies outlined in this RFC). Due to the complexity
          of certification path building, GLib does not provide any way to know
          which certification path will actually be used. Accordingly, this
          property cannot be used to make security-related decisions. Only
          GLib itself should make security decisions about TLS certificates.
      Returns: Builder instance for fluent chaining
  */
  T issuer(gio.tls_certificate.TlsCertificate propval)
  {
    return setProperty("issuer", propval);
  }

  /**
      Set `password` property.
      Params:
        propval = An optional password used when constructed with GTlsCertificate:pkcs12-data.
      Returns: Builder instance for fluent chaining
  */
  T password(string propval)
  {
    return setProperty("password", propval);
  }

  /**
      Set `pkcs11Uri` property.
      Params:
        propval = A URI referencing the [PKCS \#11](https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html)
          objects containing an X.509 certificate and optionally a private key.
          
          If null, the certificate is either not backed by PKCS \#11 or the
          #GTlsBackend does not support PKCS \#11.
      Returns: Builder instance for fluent chaining
  */
  T pkcs11Uri(string propval)
  {
    return setProperty("pkcs11-uri", propval);
  }

  /**
      Set `privateKeyPem` property.
      Params:
        propval = The PEM (ASCII) encoded representation of the certificate's
          private key in either [PKCS \#1 format](https://datatracker.ietf.org/doc/html/rfc8017)
          ("`BEGIN RSA PRIVATE KEY`") or unencrypted
          [PKCS \#8 format](https://datatracker.ietf.org/doc/html/rfc5208)
          ("`BEGIN PRIVATE KEY`"). PKCS \#8 format is supported since 2.32;
          earlier releases only support PKCS \#1. You can use the `openssl rsa`
          tool to convert PKCS \#8 keys to PKCS \#1.
          
          This property (or the #GTlsCertificate:private-key property)
          can be set when constructing a key (for example, from a file).
          Since GLib 2.70, it is now also readable; however, be aware that if
          the private key is backed by a PKCS \#11 URI - for example, if it
          is stored on a smartcard - then this property will be null. If so,
          the private key must be referenced via its PKCS \#11 URI,
          #GTlsCertificate:private-key-pkcs11-uri. You must check both
          properties to see if the certificate really has a private key.
          When this property is read, the output format will be unencrypted
          PKCS \#8.
      Returns: Builder instance for fluent chaining
  */
  T privateKeyPem(string propval)
  {
    return setProperty("private-key-pem", propval);
  }

  /**
      Set `privateKeyPkcs11Uri` property.
      Params:
        propval = A URI referencing a [PKCS \#11](https://docs.oasis-open.org/pkcs11/pkcs11-base/v3.0/os/pkcs11-base-v3.0-os.html)
          object containing a private key.
      Returns: Builder instance for fluent chaining
  */
  T privateKeyPkcs11Uri(string propval)
  {
    return setProperty("private-key-pkcs11-uri", propval);
  }
}

/// Fluent builder for [gio.tls_certificate.TlsCertificate]
final class TlsCertificateGidBuilder : TlsCertificateGidBuilderImpl!TlsCertificateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  TlsCertificate build()
  {
    return new TlsCertificate(cast(void*)createGObject(TlsCertificate._getGType), No.Take);
  }
}
