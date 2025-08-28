/// Module for [DecryptResult] class
module gmime.decrypt_result;

import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.certificate_list;
import gmime.signature_list;
import gmime.types;
import gobject.object;

/**
    An object containing the results from decrypting an encrypted stream.
*/
class DecryptResult : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_decrypt_result_get_type != &gidSymbolNotFound ? g_mime_decrypt_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override DecryptResult self()
  {
    return this;
  }

  /**
      Creates a new #GMimeDecryptResult object.
      Returns: a new #GMimeDecryptResult object.
  */
  this()
  {
    GMimeDecryptResult* _cretval;
    _cretval = g_mime_decrypt_result_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the cipher algorithm used.
      Returns: the cipher algorithm used.
  */
  gmime.types.CipherAlgo getCipher()
  {
    GMimeCipherAlgo _cretval;
    _cretval = g_mime_decrypt_result_get_cipher(cast(GMimeDecryptResult*)this._cPtr);
    gmime.types.CipherAlgo _retval = cast(gmime.types.CipherAlgo)_cretval;
    return _retval;
  }

  /**
      Get the mdc digest algorithm used.
      Returns: the mdc digest algorithm used.
  */
  gmime.types.DigestAlgo getMdc()
  {
    GMimeDigestAlgo _cretval;
    _cretval = g_mime_decrypt_result_get_mdc(cast(GMimeDecryptResult*)this._cPtr);
    gmime.types.DigestAlgo _retval = cast(gmime.types.DigestAlgo)_cretval;
    return _retval;
  }

  /**
      Gets the list of certificates that the stream had been encrypted to.
      Returns: a #GMimeCertificateList.
  */
  gmime.certificate_list.CertificateList getRecipients()
  {
    GMimeCertificateList* _cretval;
    _cretval = g_mime_decrypt_result_get_recipients(cast(GMimeDecryptResult*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.certificate_list.CertificateList)(cast(GMimeCertificateList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the session key used for this decryption.
      Returns: the session key digest algorithm used, or null if no
        session key was requested or found.
  */
  string getSessionKey()
  {
    const(char)* _cretval;
    _cretval = g_mime_decrypt_result_get_session_key(cast(GMimeDecryptResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets a list of signatures if the encrypted stream had also been signed.
      Returns: a #GMimeSignatureList or null if the
        stream was not signed.
  */
  gmime.signature_list.SignatureList getSignatures()
  {
    GMimeSignatureList* _cretval;
    _cretval = g_mime_decrypt_result_get_signatures(cast(GMimeDecryptResult*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the cipher algorithm used.
  
      Params:
        cipher = a #GMimeCipherAlgo
  */
  void setCipher(gmime.types.CipherAlgo cipher)
  {
    g_mime_decrypt_result_set_cipher(cast(GMimeDecryptResult*)this._cPtr, cipher);
  }

  /**
      Set the mdc digest algorithm used.
  
      Params:
        mdc = a #GMimeDigestAlgo
  */
  void setMdc(gmime.types.DigestAlgo mdc)
  {
    g_mime_decrypt_result_set_mdc(cast(GMimeDecryptResult*)this._cPtr, mdc);
  }

  /**
      Sets the list of certificates that the stream had been encrypted to.
  
      Params:
        recipients = A #GMimeCertificateList
  */
  void setRecipients(gmime.certificate_list.CertificateList recipients)
  {
    g_mime_decrypt_result_set_recipients(cast(GMimeDecryptResult*)this._cPtr, recipients ? cast(GMimeCertificateList*)recipients._cPtr(No.Dup) : null);
  }

  /**
      Set the session key to be returned by this decryption result.
  
      Params:
        sessionKey = a string representing the session key or null to unset the key
  */
  void setSessionKey(string sessionKey = null)
  {
    const(char)* _sessionKey = sessionKey.toCString(No.Alloc);
    g_mime_decrypt_result_set_session_key(cast(GMimeDecryptResult*)this._cPtr, _sessionKey);
  }

  /**
      Sets the list of signatures.
  
      Params:
        signatures = A #GMimeSignatureList
  */
  void setSignatures(gmime.signature_list.SignatureList signatures)
  {
    g_mime_decrypt_result_set_signatures(cast(GMimeDecryptResult*)this._cPtr, signatures ? cast(GMimeSignatureList*)signatures._cPtr(No.Dup) : null);
  }
}
