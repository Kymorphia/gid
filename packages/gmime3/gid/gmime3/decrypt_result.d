/// Module for [DecryptResult] class
module gid.gmime3.decrypt_result;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.certificate_list;
import gid.gmime3.signature_list;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An object containing the results from decrypting an encrypted stream.
*/
class DecryptResult : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_decrypt_result_get_type != &gidSymbolNotFound ? g_mime_decrypt_result_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeDecryptResult";
  }

  /** Returns `this`, for use in `with` statements. */
  override DecryptResult self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.decrypt_result.DecryptResult]
      Returns: New builder object
  */
  static DecryptResultGidBuilder builder() nothrow
  {
    return new DecryptResultGidBuilder;
  }

  /**
      Creates a new #GMimeDecryptResult object.
      Returns: a new #GMimeDecryptResult object.
  */
  this() nothrow
  {
    GMimeDecryptResult* _cretval;
    _cretval = g_mime_decrypt_result_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the cipher algorithm used.
      Returns: the cipher algorithm used.
  */
  gid.gmime3.types.CipherAlgo getCipher() nothrow
  {
    GMimeCipherAlgo _cretval;
    _cretval = g_mime_decrypt_result_get_cipher(cast(GMimeDecryptResult*)this._cPtr);
    gid.gmime3.types.CipherAlgo _retval = cast(gid.gmime3.types.CipherAlgo)_cretval;
    return _retval;
  }

  /**
      Get the mdc digest algorithm used.
      Returns: the mdc digest algorithm used.
  */
  gid.gmime3.types.DigestAlgo getMdc() nothrow
  {
    GMimeDigestAlgo _cretval;
    _cretval = g_mime_decrypt_result_get_mdc(cast(GMimeDecryptResult*)this._cPtr);
    gid.gmime3.types.DigestAlgo _retval = cast(gid.gmime3.types.DigestAlgo)_cretval;
    return _retval;
  }

  /**
      Gets the list of certificates that the stream had been encrypted to.
      Returns: a #GMimeCertificateList.
  */
  gid.gmime3.certificate_list.CertificateList getRecipients() nothrow
  {
    GMimeCertificateList* _cretval;
    _cretval = g_mime_decrypt_result_get_recipients(cast(GMimeDecryptResult*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.certificate_list.CertificateList)(cast(GMimeCertificateList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the session key used for this decryption.
      Returns: the session key digest algorithm used, or null if no
        session key was requested or found.
  */
  string getSessionKey() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_decrypt_result_get_session_key(cast(GMimeDecryptResult*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets a list of signatures if the encrypted stream had also been signed.
      Returns: a #GMimeSignatureList or null if the
        stream was not signed.
  */
  gid.gmime3.signature_list.SignatureList getSignatures() nothrow
  {
    GMimeSignatureList* _cretval;
    _cretval = g_mime_decrypt_result_get_signatures(cast(GMimeDecryptResult*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, No.Take);
    return _retval;
  }

  /**
      Set the cipher algorithm used.
  
      Params:
        cipher = a #GMimeCipherAlgo
  */
  void setCipher(gid.gmime3.types.CipherAlgo cipher) nothrow
  {
    g_mime_decrypt_result_set_cipher(cast(GMimeDecryptResult*)this._cPtr, cipher);
  }

  /**
      Set the mdc digest algorithm used.
  
      Params:
        mdc = a #GMimeDigestAlgo
  */
  void setMdc(gid.gmime3.types.DigestAlgo mdc) nothrow
  {
    g_mime_decrypt_result_set_mdc(cast(GMimeDecryptResult*)this._cPtr, mdc);
  }

  /**
      Sets the list of certificates that the stream had been encrypted to.
  
      Params:
        recipients = A #GMimeCertificateList
  */
  void setRecipients(gid.gmime3.certificate_list.CertificateList recipients) nothrow
  {
    g_mime_decrypt_result_set_recipients(cast(GMimeDecryptResult*)this._cPtr, recipients ? cast(GMimeCertificateList*)recipients._cPtr(No.Dup) : null);
  }

  /**
      Set the session key to be returned by this decryption result.
  
      Params:
        sessionKey = a string representing the session key or null to unset the key
  */
  void setSessionKey(string sessionKey = null) nothrow
  {
    const(char)* _sessionKey = sessionKey.toCString!(No.Malloc, Yes.Nullable);
    g_mime_decrypt_result_set_session_key(cast(GMimeDecryptResult*)this._cPtr, _sessionKey);
  }

  /**
      Sets the list of signatures.
  
      Params:
        signatures = A #GMimeSignatureList
  */
  void setSignatures(gid.gmime3.signature_list.SignatureList signatures) nothrow
  {
    g_mime_decrypt_result_set_signatures(cast(GMimeDecryptResult*)this._cPtr, signatures ? cast(GMimeSignatureList*)signatures._cPtr(No.Dup) : null);
  }
}

/// Fluent builder implementation template for [gid.gmime3.decrypt_result.DecryptResult]
class DecryptResultGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.decrypt_result.DecryptResult]
final class DecryptResultGidBuilder : DecryptResultGidBuilderImpl!DecryptResultGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  DecryptResult build() nothrow
  {
    return new DecryptResult(cast(void*)createGObject(DecryptResult._getGType), Yes.Take);
  }
}
