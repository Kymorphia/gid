/// Module for [Certificate] class
module gid.gmime3.certificate;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An object containing useful information about a certificate.
*/
class Certificate : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_mime_certificate_get_type != &gidSymbolNotFound ? g_mime_certificate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeCertificate";
  }

  /** Returns `this`, for use in `with` statements. */
  override Certificate self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.certificate.Certificate]
      Returns: New builder object
  */
  static CertificateGidBuilder builder() nothrow
  {
    return new CertificateGidBuilder;
  }

  /**
      Creates a new #GMimeCertificate object.
      Returns: a new #GMimeCertificate object.
  */
  this() nothrow
  {
    GMimeCertificate* _cretval;
    _cretval = g_mime_certificate_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the creation date of the certificate's key.
      Returns: the creation date of the certificate's key or %-1 if unknown.
  */
  long getCreated() nothrow
  {
    long _retval;
    _retval = g_mime_certificate_get_created(cast(GMimeCertificate*)this._cPtr);
    return _retval;
  }

  /**
      Get the creation date of the certificate's key in seconds since the
      UNIX epoch, represented as a 64-bit signed integer.
      Returns: the creation date of the certificate's key or %-1 if unknown.
  */
  long getCreated64() nothrow
  {
    long _retval;
    _retval = g_mime_certificate_get_created64(cast(GMimeCertificate*)this._cPtr);
    return _retval;
  }

  /**
      Get the digest algorithm used by the certificate.
      Returns: the digest algorithm used by the certificate or
        #GMIME_DIGEST_ALGO_DEFAULT if unspecified.
  */
  gid.gmime3.types.DigestAlgo getDigestAlgo() nothrow
  {
    GMimeDigestAlgo _cretval;
    _cretval = g_mime_certificate_get_digest_algo(cast(GMimeCertificate*)this._cPtr);
    gid.gmime3.types.DigestAlgo _retval = cast(gid.gmime3.types.DigestAlgo)_cretval;
    return _retval;
  }

  /**
      Get the email address associated with the certificate.  If the
      certificate contains more than one email address with different
      validities, the email address with the highest validity is
      returned.  If more than one email address appears in the
      certificate with the same (highest) validity, the first such email
      address will be returned.
      Returns: the relevant e-mail address, or null if unspecified.
  */
  string getEmail() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_email(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the expiration date of the certificate's key. A value of `0` means the certificate never expires.
      Returns: the expiration date of the certificate's key or %-1 if unknown.
  */
  long getExpires() nothrow
  {
    long _retval;
    _retval = g_mime_certificate_get_expires(cast(GMimeCertificate*)this._cPtr);
    return _retval;
  }

  /**
      Get the expiration date of the certificate's key in seconds since
      the UNIX epoch, represented as a 64-bit signed integer. A value of
      `0` means the certificate never expires.
      Returns: the expiration date of the certificate's key or %-1 if unknown.
  */
  long getExpires64() nothrow
  {
    long _retval;
    _retval = g_mime_certificate_get_expires64(cast(GMimeCertificate*)this._cPtr);
    return _retval;
  }

  /**
      Get the certificate's key fingerprint.
      Returns: the certificate's key fingerprint or null if unspecified.
  */
  string getFingerprint() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_fingerprint(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the validity of the certificate's identity information.  This
      validity applies to the name, email, and user_id fields associated
      with the certificate.
      Returns: the identity validity of the certificate.
  */
  gid.gmime3.types.Validity getIdValidity() nothrow
  {
    GMimeValidity _cretval;
    _cretval = g_mime_certificate_get_id_validity(cast(GMimeCertificate*)this._cPtr);
    gid.gmime3.types.Validity _retval = cast(gid.gmime3.types.Validity)_cretval;
    return _retval;
  }

  /**
      Get the certificate's issuer name.
      Returns: the certificate's issuer name or null if unspecified.
  */
  string getIssuerName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_issuer_name(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the certificate's issuer serial.
      Returns: the certificate's issuer serial or null if unspecified.
  */
  string getIssuerSerial() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_issuer_serial(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the certificate's key id.
      Returns: the certificate's key id or null if unspecified.
  */
  string getKeyId() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_key_id(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the name associated with the certificate.  For email
      certificates, this is usually the name of the person who controls
      the certificate (encoded in UTF-8).  If the certificate contains
      more than one name with different validities, the name with the
      highest validity is returned.  If more than one name appears in the
      certificate with the same (highest) validity, the first such name
      will be returned.
      Returns: the the relevant name or null if unspecified.
  */
  string getName() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_name(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the public-key algorithm used by the certificate.
      Returns: the public-key algorithm used by the certificate or
        #GMIME_PUBKEY_ALGO_DEFAULT if unspecified.
  */
  gid.gmime3.types.PubKeyAlgo getPubkeyAlgo() nothrow
  {
    GMimePubKeyAlgo _cretval;
    _cretval = g_mime_certificate_get_pubkey_algo(cast(GMimeCertificate*)this._cPtr);
    gid.gmime3.types.PubKeyAlgo _retval = cast(gid.gmime3.types.PubKeyAlgo)_cretval;
    return _retval;
  }

  /**
      Get the certificate trust.
      Returns: the certificate trust.
  */
  gid.gmime3.types.Trust getTrust() nothrow
  {
    GMimeTrust _cretval;
    _cretval = g_mime_certificate_get_trust(cast(GMimeCertificate*)this._cPtr);
    gid.gmime3.types.Trust _retval = cast(gid.gmime3.types.Trust)_cretval;
    return _retval;
  }

  /**
      Get the certificate's full User ID.  If the certificate contains
      more than one User ID with different validities, the User ID with
      the highest validity is returned.  If more than one User ID appears
      in the certificate with the same (highest) validity, the first such
      User ID will be returned.
      Returns: the relevant User ID or null if unspecified.
  */
  string getUserId() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_user_id(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Set the creation date of the certificate's key.
  
      Params:
        created = creation date
  */
  void setCreated(long created) nothrow
  {
    g_mime_certificate_set_created(cast(GMimeCertificate*)this._cPtr, created);
  }

  /**
      Set the digest algorithm used by the certificate.
  
      Params:
        algo = a #GMimeDigestAlgo
  */
  void setDigestAlgo(gid.gmime3.types.DigestAlgo algo) nothrow
  {
    g_mime_certificate_set_digest_algo(cast(GMimeCertificate*)this._cPtr, algo);
  }

  /**
      Set the email address associated with the
      certificate. (e.g. "jane\example.org")
  
      Params:
        email = certificate's email
  */
  void setEmail(string email) nothrow
  {
    const(char)* _email = email.toCString!(No.Malloc, No.Nullable);
    g_mime_certificate_set_email(cast(GMimeCertificate*)this._cPtr, _email);
  }

  /**
      Set the expiration date of the certificate's key. A value of `0` means the certificate never expires.
  
      Params:
        expires = expiration date
  */
  void setExpires(long expires) nothrow
  {
    g_mime_certificate_set_expires(cast(GMimeCertificate*)this._cPtr, expires);
  }

  /**
      Set the certificate's key fingerprint.
  
      Params:
        fingerprint = fingerprint string
  */
  void setFingerprint(string fingerprint) nothrow
  {
    const(char)* _fingerprint = fingerprint.toCString!(No.Malloc, No.Nullable);
    g_mime_certificate_set_fingerprint(cast(GMimeCertificate*)this._cPtr, _fingerprint);
  }

  /**
      Set the validity associated with the certificate's name, email, and user_id.
  
      Params:
        validity = a #GMimeValidity representing the validity of the certificate's identity information.
  */
  void setIdValidity(gid.gmime3.types.Validity validity) nothrow
  {
    g_mime_certificate_set_id_validity(cast(GMimeCertificate*)this._cPtr, validity);
  }

  /**
      Set the certificate's issuer name.
  
      Params:
        issuerName = certificate's issuer name
  */
  void setIssuerName(string issuerName) nothrow
  {
    const(char)* _issuerName = issuerName.toCString!(No.Malloc, No.Nullable);
    g_mime_certificate_set_issuer_name(cast(GMimeCertificate*)this._cPtr, _issuerName);
  }

  /**
      Set the certificate's issuer serial.
  
      Params:
        issuerSerial = certificate's issuer serial
  */
  void setIssuerSerial(string issuerSerial) nothrow
  {
    const(char)* _issuerSerial = issuerSerial.toCString!(No.Malloc, No.Nullable);
    g_mime_certificate_set_issuer_serial(cast(GMimeCertificate*)this._cPtr, _issuerSerial);
  }

  /**
      Set the certificate's key id.
  
      Params:
        keyId = key id
  */
  void setKeyId(string keyId) nothrow
  {
    const(char)* _keyId = keyId.toCString!(No.Malloc, No.Nullable);
    g_mime_certificate_set_key_id(cast(GMimeCertificate*)this._cPtr, _keyId);
  }

  /**
      Set the name associated with the certificate.  For email
      certificates, this is usually the name of the person who controls
      the certificate (encoded in UTF-8). (e.g. "Jane Doe")
  
      Params:
        name = certificate's name
  */
  void setName(string name) nothrow
  {
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    g_mime_certificate_set_name(cast(GMimeCertificate*)this._cPtr, _name);
  }

  /**
      Set the public-key algorithm used by the certificate.
  
      Params:
        algo = a #GMimePubKeyAlgo
  */
  void setPubkeyAlgo(gid.gmime3.types.PubKeyAlgo algo) nothrow
  {
    g_mime_certificate_set_pubkey_algo(cast(GMimeCertificate*)this._cPtr, algo);
  }

  /**
      Set the certificate trust.
  
      Params:
        trust = a #GMimeTrust value
  */
  void setTrust(gid.gmime3.types.Trust trust) nothrow
  {
    g_mime_certificate_set_trust(cast(GMimeCertificate*)this._cPtr, trust);
  }

  /**
      Set the certificate's full User ID.  By convention, this is usually
      a mail name-addr as described in RFC 5322.  (e.g. "Jane Doe
      &lt;jane\example.org&gt;")
  
      Params:
        userId = the full User ID for a certificate
  */
  void setUserId(string userId) nothrow
  {
    const(char)* _userId = userId.toCString!(No.Malloc, No.Nullable);
    g_mime_certificate_set_user_id(cast(GMimeCertificate*)this._cPtr, _userId);
  }
}

/// Fluent builder implementation template for [gid.gmime3.certificate.Certificate]
class CertificateGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.certificate.Certificate]
final class CertificateGidBuilder : CertificateGidBuilderImpl!CertificateGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Certificate build() nothrow
  {
    return new Certificate(cast(void*)createGObject(Certificate._getGType), Yes.Take);
  }
}
