/// Module for [Certificate] class
module gmime.certificate;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.types;
import gobject.object;

/**
    An object containing useful information about a certificate.
*/
class Certificate : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_certificate_get_type != &gidSymbolNotFound ? g_mime_certificate_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Certificate self()
  {
    return this;
  }

  /**
      Creates a new #GMimeCertificate object.
      Returns: a new #GMimeCertificate object.
  */
  this()
  {
    GMimeCertificate* _cretval;
    _cretval = g_mime_certificate_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the creation date of the certificate's key.
      Returns: the creation date of the certificate's key or %-1 if unknown.
  */
  long getCreated()
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
  long getCreated64()
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
  gmime.types.DigestAlgo getDigestAlgo()
  {
    GMimeDigestAlgo _cretval;
    _cretval = g_mime_certificate_get_digest_algo(cast(GMimeCertificate*)this._cPtr);
    gmime.types.DigestAlgo _retval = cast(gmime.types.DigestAlgo)_cretval;
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
  string getEmail()
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_email(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the expiration date of the certificate's key. A value of `0` means the certificate never expires.
      Returns: the expiration date of the certificate's key or %-1 if unknown.
  */
  long getExpires()
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
  long getExpires64()
  {
    long _retval;
    _retval = g_mime_certificate_get_expires64(cast(GMimeCertificate*)this._cPtr);
    return _retval;
  }

  /**
      Get the certificate's key fingerprint.
      Returns: the certificate's key fingerprint or null if unspecified.
  */
  string getFingerprint()
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_fingerprint(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the validity of the certificate's identity information.  This
      validity applies to the name, email, and user_id fields associated
      with the certificate.
      Returns: the identity validity of the certificate.
  */
  gmime.types.Validity getIdValidity()
  {
    GMimeValidity _cretval;
    _cretval = g_mime_certificate_get_id_validity(cast(GMimeCertificate*)this._cPtr);
    gmime.types.Validity _retval = cast(gmime.types.Validity)_cretval;
    return _retval;
  }

  /**
      Get the certificate's issuer name.
      Returns: the certificate's issuer name or null if unspecified.
  */
  string getIssuerName()
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_issuer_name(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the certificate's issuer serial.
      Returns: the certificate's issuer serial or null if unspecified.
  */
  string getIssuerSerial()
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_issuer_serial(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the certificate's key id.
      Returns: the certificate's key id or null if unspecified.
  */
  string getKeyId()
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_key_id(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
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
  string getName()
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_name(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the public-key algorithm used by the certificate.
      Returns: the public-key algorithm used by the certificate or
        #GMIME_PUBKEY_ALGO_DEFAULT if unspecified.
  */
  gmime.types.PubKeyAlgo getPubkeyAlgo()
  {
    GMimePubKeyAlgo _cretval;
    _cretval = g_mime_certificate_get_pubkey_algo(cast(GMimeCertificate*)this._cPtr);
    gmime.types.PubKeyAlgo _retval = cast(gmime.types.PubKeyAlgo)_cretval;
    return _retval;
  }

  /**
      Get the certificate trust.
      Returns: the certificate trust.
  */
  gmime.types.Trust getTrust()
  {
    GMimeTrust _cretval;
    _cretval = g_mime_certificate_get_trust(cast(GMimeCertificate*)this._cPtr);
    gmime.types.Trust _retval = cast(gmime.types.Trust)_cretval;
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
  string getUserId()
  {
    const(char)* _cretval;
    _cretval = g_mime_certificate_get_user_id(cast(GMimeCertificate*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Set the creation date of the certificate's key.
  
      Params:
        created = creation date
  */
  void setCreated(long created)
  {
    g_mime_certificate_set_created(cast(GMimeCertificate*)this._cPtr, created);
  }

  /**
      Set the digest algorithm used by the certificate.
  
      Params:
        algo = a #GMimeDigestAlgo
  */
  void setDigestAlgo(gmime.types.DigestAlgo algo)
  {
    g_mime_certificate_set_digest_algo(cast(GMimeCertificate*)this._cPtr, algo);
  }

  /**
      Set the email address associated with the
      certificate. (e.g. "jane\example.org")
  
      Params:
        email = certificate's email
  */
  void setEmail(string email)
  {
    const(char)* _email = email.toCString(No.Alloc);
    g_mime_certificate_set_email(cast(GMimeCertificate*)this._cPtr, _email);
  }

  /**
      Set the expiration date of the certificate's key. A value of `0` means the certificate never expires.
  
      Params:
        expires = expiration date
  */
  void setExpires(long expires)
  {
    g_mime_certificate_set_expires(cast(GMimeCertificate*)this._cPtr, expires);
  }

  /**
      Set the certificate's key fingerprint.
  
      Params:
        fingerprint = fingerprint string
  */
  void setFingerprint(string fingerprint)
  {
    const(char)* _fingerprint = fingerprint.toCString(No.Alloc);
    g_mime_certificate_set_fingerprint(cast(GMimeCertificate*)this._cPtr, _fingerprint);
  }

  /**
      Set the validity associated with the certificate's name, email, and user_id.
  
      Params:
        validity = a #GMimeValidity representing the validity of the certificate's identity information.
  */
  void setIdValidity(gmime.types.Validity validity)
  {
    g_mime_certificate_set_id_validity(cast(GMimeCertificate*)this._cPtr, validity);
  }

  /**
      Set the certificate's issuer name.
  
      Params:
        issuerName = certificate's issuer name
  */
  void setIssuerName(string issuerName)
  {
    const(char)* _issuerName = issuerName.toCString(No.Alloc);
    g_mime_certificate_set_issuer_name(cast(GMimeCertificate*)this._cPtr, _issuerName);
  }

  /**
      Set the certificate's issuer serial.
  
      Params:
        issuerSerial = certificate's issuer serial
  */
  void setIssuerSerial(string issuerSerial)
  {
    const(char)* _issuerSerial = issuerSerial.toCString(No.Alloc);
    g_mime_certificate_set_issuer_serial(cast(GMimeCertificate*)this._cPtr, _issuerSerial);
  }

  /**
      Set the certificate's key id.
  
      Params:
        keyId = key id
  */
  void setKeyId(string keyId)
  {
    const(char)* _keyId = keyId.toCString(No.Alloc);
    g_mime_certificate_set_key_id(cast(GMimeCertificate*)this._cPtr, _keyId);
  }

  /**
      Set the name associated with the certificate.  For email
      certificates, this is usually the name of the person who controls
      the certificate (encoded in UTF-8). (e.g. "Jane Doe")
  
      Params:
        name = certificate's name
  */
  void setName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    g_mime_certificate_set_name(cast(GMimeCertificate*)this._cPtr, _name);
  }

  /**
      Set the public-key algorithm used by the certificate.
  
      Params:
        algo = a #GMimePubKeyAlgo
  */
  void setPubkeyAlgo(gmime.types.PubKeyAlgo algo)
  {
    g_mime_certificate_set_pubkey_algo(cast(GMimeCertificate*)this._cPtr, algo);
  }

  /**
      Set the certificate trust.
  
      Params:
        trust = a #GMimeTrust value
  */
  void setTrust(gmime.types.Trust trust)
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
  void setUserId(string userId)
  {
    const(char)* _userId = userId.toCString(No.Alloc);
    g_mime_certificate_set_user_id(cast(GMimeCertificate*)this._cPtr, _userId);
  }
}
