/// Module for [CryptoContext] class
module gmime.crypto_context;

import gid.gid;
import glib.error;
import gmime.c.functions;
import gmime.c.types;
import gmime.decrypt_result;
import gmime.signature_list;
import gmime.stream;
import gmime.types;
import gobject.object;

/**
    A crypto context for use with MIME.
*/
class CryptoContext : gobject.object.ObjectWrap
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
    return cast(void function())g_mime_crypto_context_get_type != &gidSymbolNotFound ? g_mime_crypto_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override CryptoContext self()
  {
    return this;
  }

  /**
      Creates a new crypto context for the specified protocol.
  
      Params:
        protocol = the crypto protocol
      Returns: a newly allocated #GMimeCryptoContext.
  */
  this(string protocol)
  {
    GMimeCryptoContext* _cretval;
    const(char)* _protocol = protocol.toCString(No.Alloc);
    _cretval = g_mime_crypto_context_new(_protocol);
    this(_cretval, Yes.Take);
  }

  /**
      Decrypts the ciphertext input stream and writes the resulting cleartext
      to the output stream.
      
      When non-null, session_key should be a null-terminated string,
      such as the one returned by [gmime.decrypt_result.DecryptResult.getSessionKey]
      from a previous decryption. If the session_key is not valid, decryption
      will fail.
      
      If the encrypted input stream was also signed, the returned
      #GMimeDecryptResult will have a non-null list of signatures, each with a
      #GMimeSignatureStatus (among other details about each signature).
      
      On success, the returned #GMimeDecryptResult will contain a list of
      certificates, one for each recipient, that the original encrypted stream
      was encrypted to.
      
      Note: It *may* be possible to maliciously design an encrypted stream such
      that recursively decrypting it will result in an endless loop, causing
      a denial of service attack on your application.
  
      Params:
        flags = a set of #GMimeDecryptFlags
        sessionKey = the session key to use or null
        istream = input/ciphertext stream
        ostream = output/cleartext stream
      Returns: a #GMimeDecryptResult on success or null
        on error.
      Throws: [ErrorWrap]
  */
  gmime.decrypt_result.DecryptResult decrypt(gmime.types.DecryptFlags flags, string sessionKey, gmime.stream.Stream istream, gmime.stream.Stream ostream)
  {
    GMimeDecryptResult* _cretval;
    const(char)* _sessionKey = sessionKey.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_crypto_context_decrypt(cast(GMimeCryptoContext*)this._cPtr, flags, _sessionKey, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.decrypt_result.DecryptResult)(cast(GMimeDecryptResult*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the digest id based on the digest name.
  
      Params:
        name = digest name
      Returns: the equivalent digest id or #GMIME_DIGEST_ALGO_DEFAULT on fail.
  */
  gmime.types.DigestAlgo digestId(string name)
  {
    GMimeDigestAlgo _cretval;
    const(char)* _name = name.toCString(No.Alloc);
    _cretval = g_mime_crypto_context_digest_id(cast(GMimeCryptoContext*)this._cPtr, _name);
    gmime.types.DigestAlgo _retval = cast(gmime.types.DigestAlgo)_cretval;
    return _retval;
  }

  /**
      Gets the digest name based on the digest id digest.
  
      Params:
        digest = digest id
      Returns: the equivalent digest name or null on fail.
  */
  string digestName(gmime.types.DigestAlgo digest)
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_digest_name(cast(GMimeCryptoContext*)this._cPtr, digest);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Encrypts (and optionally signs) the cleartext input stream and
      writes the resulting ciphertext to the output stream.
  
      Params:
        sign = sign as well as encrypt
        userid = the key id (or email address) to use when signing (assuming sign is true)
        flags = a set of #GMimeEncryptFlags
        recipients = an array of recipient key ids and/or email addresses
        istream = cleartext input stream
        ostream = ciphertext output stream
      Returns: `0` on success or %-1 on fail.
      Throws: [ErrorWrap]
  */
  int encrypt(bool sign, string userid, gmime.types.EncryptFlags flags, string[] recipients, gmime.stream.Stream istream, gmime.stream.Stream ostream)
  {
    int _retval;
    const(char)* _userid = userid.toCString(No.Alloc);
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _retval = g_mime_crypto_context_encrypt(cast(GMimeCryptoContext*)this._cPtr, sign, _userid, flags, _recipients, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Exports the keys/certificates in keys to the stream ostream from
      the key/certificate database controlled by ctx.
      
      If keys is null or contains only a null element, then all keys
      will be exported.
  
      Params:
        keys = an array of key ids, terminated by a null element
        ostream = output stream
      Returns: `0` on success or %-1 on fail.
      Throws: [ErrorWrap]
  */
  int exportKeys(string[] keys, gmime.stream.Stream ostream)
  {
    int _retval;
    char*[] _tmpkeys;
    foreach (s; keys)
      _tmpkeys ~= s.toCString(No.Alloc);
    _tmpkeys ~= null;
    const(char*)* _keys = _tmpkeys.ptr;

    GError *_err;
    _retval = g_mime_crypto_context_export_keys(cast(GMimeCryptoContext*)this._cPtr, _keys, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Gets the encryption protocol for the crypto context.
      Returns: the encryption protocol or null if not supported.
  */
  string getEncryptionProtocol()
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_get_encryption_protocol(cast(GMimeCryptoContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the key exchange protocol for the crypto context.
      Returns: the key exchange protocol or null if not supported.
  */
  string getKeyExchangeProtocol()
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_get_key_exchange_protocol(cast(GMimeCryptoContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Gets the signature protocol for the crypto context.
      Returns: the signature protocol or null if not supported.
  */
  string getSignatureProtocol()
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_get_signature_protocol(cast(GMimeCryptoContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Imports a stream of keys/certificates contained within istream
      into the key/certificate database controlled by ctx.
  
      Params:
        istream = input stream (containing keys)
      Returns: the total number of keys imported on success or %-1 on fail.
      Throws: [ErrorWrap]
  */
  int importKeys(gmime.stream.Stream istream)
  {
    int _retval;
    GError *_err;
    _retval = g_mime_crypto_context_import_keys(cast(GMimeCryptoContext*)this._cPtr, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Signs the input stream and writes the resulting signature to the output stream.
  
      Params:
        detach = true if ostream should be the detached signature; otherwise, false
        userid = private key to use to sign the stream
        istream = input stream
        ostream = output stream
      Returns: the #GMimeDigestAlgo used on success or %-1 on fail.
      Throws: [ErrorWrap]
  */
  int sign(bool detach, string userid, gmime.stream.Stream istream, gmime.stream.Stream ostream)
  {
    int _retval;
    const(char)* _userid = userid.toCString(No.Alloc);
    GError *_err;
    _retval = g_mime_crypto_context_sign(cast(GMimeCryptoContext*)this._cPtr, detach, _userid, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Verifies the signature. If istream is a clearsigned stream, you
      should pass null as the sigstream parameter and may wish to
      provide an ostream argument for GMime to output the original
      plaintext into. Otherwise sigstream is assumed to be the signature
      stream and is used to verify the integirity of the istream.
  
      Params:
        flags = a #GMimeVerifyFlags
        istream = input stream
        sigstream = detached-signature stream
        ostream = output stream for use with encapsulated signature input streams
      Returns: a #GMimeSignatureList object containing
        the status of each signature or null on error.
      Throws: [ErrorWrap]
  */
  gmime.signature_list.SignatureList verify(gmime.types.VerifyFlags flags, gmime.stream.Stream istream, gmime.stream.Stream sigstream = null, gmime.stream.Stream ostream = null)
  {
    GMimeSignatureList* _cretval;
    GError *_err;
    _cretval = g_mime_crypto_context_verify(cast(GMimeCryptoContext*)this._cPtr, flags, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, sigstream ? cast(GMimeStream*)sigstream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    return _retval;
  }
}
