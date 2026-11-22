/// Module for [Credential] class
module gid.webkit6.credential;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gio2.tls_certificate;
import gid.gobject2.boxed;
import gid.gobject2.object;
import gid.webkit6.c.functions;
import gid.webkit6.c.types;
import gid.webkit6.types;

/**
    Groups information used for user authentication.
*/
class Credential : gid.gobject2.boxed.BoxedWrap!(webkit_credential_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override Credential self() nothrow
  {
    return this;
  }

  /**
      Create a new credential from the provided username, password and persistence mode.
  
      Params:
        username = The username for the new credential
        password = The password for the new credential
        persistence = The #WebKitCredentialPersistence of the new credential
      Returns: A #WebKitCredential.
  */
  this(string username, string password, gid.webkit6.types.CredentialPersistence persistence) nothrow
  {
    WebKitCredential* _cretval;
    const(char)* _username = username.toCString!(No.Malloc, No.Nullable);
    const(char)* _password = password.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_credential_new(_username, _password, persistence);
    this(_cretval, Yes.Take);
  }

  /**
      Create a new credential from the certificate and persistence mode.
      
      Note that [gid.webkit6.types.CredentialPersistence.Permanent] is not supported for certificate credentials.
  
      Params:
        certificate = The #GTlsCertificate, or null
        persistence = The #WebKitCredentialPersistence of the new credential
      Returns: A #WebKitCredential.
  */
  static gid.webkit6.credential.Credential newForCertificate(gid.gio2.tls_certificate.TlsCertificate certificate, gid.webkit6.types.CredentialPersistence persistence) nothrow
  {
    WebKitCredential* _cretval;
    _cretval = webkit_credential_new_for_certificate(certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, persistence);
    auto _retval = _cretval ? new gid.webkit6.credential.Credential(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new credential from the provided PIN and persistence mode.
      
      Note that [gid.webkit6.types.CredentialPersistence.Permanent] is not supported for certificate pin credentials.
  
      Params:
        pin = The PIN for the new credential
        persistence = The #WebKitCredentialPersistence of the new credential
      Returns: A #WebKitCredential.
  */
  static gid.webkit6.credential.Credential newForCertificatePin(string pin, gid.webkit6.types.CredentialPersistence persistence) nothrow
  {
    WebKitCredential* _cretval;
    const(char)* _pin = pin.toCString!(No.Malloc, No.Nullable);
    _cretval = webkit_credential_new_for_certificate_pin(_pin, persistence);
    auto _retval = _cretval ? new gid.webkit6.credential.Credential(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Make a copy of the #WebKitCredential.
      Returns: A copy of passed in #WebKitCredential
  */
  gid.webkit6.credential.Credential copy() nothrow
  {
    WebKitCredential* _cretval;
    _cretval = webkit_credential_copy(cast(WebKitCredential*)this._cPtr);
    auto _retval = _cretval ? new gid.webkit6.credential.Credential(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the certificate currently held by this #WebKitCredential.
      Returns: a #GTlsCertificate, or null
  */
  gid.gio2.tls_certificate.TlsCertificate getCertificate() nothrow
  {
    GTlsCertificate* _cretval;
    _cretval = webkit_credential_get_certificate(cast(WebKitCredential*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the password currently held by this #WebKitCredential.
      Returns: The password stored in the #WebKitCredential.
  */
  string getPassword() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_credential_get_password(cast(WebKitCredential*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the persistence mode currently held by this #WebKitCredential.
      Returns: The #WebKitCredentialPersistence stored in the #WebKitCredential.
  */
  gid.webkit6.types.CredentialPersistence getPersistence() nothrow
  {
    WebKitCredentialPersistence _cretval;
    _cretval = webkit_credential_get_persistence(cast(WebKitCredential*)this._cPtr);
    gid.webkit6.types.CredentialPersistence _retval = cast(gid.webkit6.types.CredentialPersistence)_cretval;
    return _retval;
  }

  /**
      Get the username currently held by this #WebKitCredential.
      Returns: The username stored in the #WebKitCredential.
  */
  string getUsername() nothrow
  {
    const(char)* _cretval;
    _cretval = webkit_credential_get_username(cast(WebKitCredential*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Determine whether this credential has a password stored.
      Returns: true if the credential has a password or false otherwise.
  */
  bool hasPassword() nothrow
  {
    bool _retval;
    _retval = cast(bool)webkit_credential_has_password(cast(WebKitCredential*)this._cPtr);
    return _retval;
  }
}
