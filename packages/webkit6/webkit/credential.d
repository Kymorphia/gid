/// Module for [Credential] class
module webkit.credential;

import gid.gid;
import gio.tls_certificate;
import gobject.boxed;
import gobject.object;
import webkit.c.functions;
import webkit.c.types;
import webkit.types;

/**
    Groups information used for user authentication.
*/
class Credential : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())webkit_credential_get_type != &gidSymbolNotFound ? webkit_credential_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Credential self()
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
  this(string username, string password, webkit.types.CredentialPersistence persistence)
  {
    WebKitCredential* _cretval;
    const(char)* _username = username.toCString(No.Alloc);
    const(char)* _password = password.toCString(No.Alloc);
    _cretval = webkit_credential_new(_username, _password, persistence);
    this(_cretval, Yes.Take);
  }

  /**
      Create a new credential from the certificate and persistence mode.
      
      Note that [webkit.types.CredentialPersistence.Permanent] is not supported for certificate credentials.
  
      Params:
        certificate = The #GTlsCertificate, or null
        persistence = The #WebKitCredentialPersistence of the new credential
      Returns: A #WebKitCredential.
  */
  static webkit.credential.Credential newForCertificate(gio.tls_certificate.TlsCertificate certificate, webkit.types.CredentialPersistence persistence)
  {
    WebKitCredential* _cretval;
    _cretval = webkit_credential_new_for_certificate(certificate ? cast(GTlsCertificate*)certificate._cPtr(No.Dup) : null, persistence);
    auto _retval = _cretval ? new webkit.credential.Credential(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new credential from the provided PIN and persistence mode.
      
      Note that [webkit.types.CredentialPersistence.Permanent] is not supported for certificate pin credentials.
  
      Params:
        pin = The PIN for the new credential
        persistence = The #WebKitCredentialPersistence of the new credential
      Returns: A #WebKitCredential.
  */
  static webkit.credential.Credential newForCertificatePin(string pin, webkit.types.CredentialPersistence persistence)
  {
    WebKitCredential* _cretval;
    const(char)* _pin = pin.toCString(No.Alloc);
    _cretval = webkit_credential_new_for_certificate_pin(_pin, persistence);
    auto _retval = _cretval ? new webkit.credential.Credential(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Make a copy of the #WebKitCredential.
      Returns: A copy of passed in #WebKitCredential
  */
  webkit.credential.Credential copy()
  {
    WebKitCredential* _cretval;
    _cretval = webkit_credential_copy(cast(WebKitCredential*)this._cPtr);
    auto _retval = _cretval ? new webkit.credential.Credential(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the certificate currently held by this #WebKitCredential.
      Returns: a #GTlsCertificate, or null
  */
  gio.tls_certificate.TlsCertificate getCertificate()
  {
    GTlsCertificate* _cretval;
    _cretval = webkit_credential_get_certificate(cast(WebKitCredential*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.tls_certificate.TlsCertificate)(cast(GTlsCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the password currently held by this #WebKitCredential.
      Returns: The password stored in the #WebKitCredential.
  */
  string getPassword()
  {
    const(char)* _cretval;
    _cretval = webkit_credential_get_password(cast(WebKitCredential*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the persistence mode currently held by this #WebKitCredential.
      Returns: The #WebKitCredentialPersistence stored in the #WebKitCredential.
  */
  webkit.types.CredentialPersistence getPersistence()
  {
    WebKitCredentialPersistence _cretval;
    _cretval = webkit_credential_get_persistence(cast(WebKitCredential*)this._cPtr);
    webkit.types.CredentialPersistence _retval = cast(webkit.types.CredentialPersistence)_cretval;
    return _retval;
  }

  /**
      Get the username currently held by this #WebKitCredential.
      Returns: The username stored in the #WebKitCredential.
  */
  string getUsername()
  {
    const(char)* _cretval;
    _cretval = webkit_credential_get_username(cast(WebKitCredential*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Determine whether this credential has a password stored.
      Returns: true if the credential has a password or false otherwise.
  */
  bool hasPassword()
  {
    bool _retval;
    _retval = cast(bool)webkit_credential_has_password(cast(WebKitCredential*)this._cPtr);
    return _retval;
  }
}
