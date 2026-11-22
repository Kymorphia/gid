/// Module for [CryptoContext] class
module gid.gmime3.crypto_context;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.decrypt_result;
import gid.gmime3.signature_list;
import gid.gmime3.stream;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A crypto context for use with MIME.
*/
class CryptoContext : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_crypto_context_get_type != &gidSymbolNotFound ? g_mime_crypto_context_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeCryptoContext";
  }

  /** Returns `this`, for use in `with` statements. */
  override CryptoContext self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.crypto_context.CryptoContext]
      Returns: New builder object
  */
  static CryptoContextGidBuilder builder() nothrow
  {
    return new CryptoContextGidBuilder;
  }

  /**
      Creates a new crypto context for the specified protocol.
  
      Params:
        protocol = the crypto protocol
      Returns: a newly allocated #GMimeCryptoContext.
  */
  this(string protocol) nothrow
  {
    GMimeCryptoContext* _cretval;
    const(char)* _protocol = protocol.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_crypto_context_new(_protocol);
    this(_cretval, Yes.Take);
  }

  /**
      Decrypts the ciphertext input stream and writes the resulting cleartext
      to the output stream.
      
      When non-null, session_key should be a null-terminated string,
      such as the one returned by [gid.gmime3.decrypt_result.DecryptResult.getSessionKey]
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
  gid.gmime3.decrypt_result.DecryptResult decrypt(gid.gmime3.types.DecryptFlags flags, string sessionKey, gid.gmime3.stream.Stream istream, gid.gmime3.stream.Stream ostream)
  {
    GMimeDecryptResult* _cretval;
    const(char)* _sessionKey = sessionKey.toCString!(No.Malloc, Yes.Nullable);
    GError *_err;
    _cretval = g_mime_crypto_context_decrypt(cast(GMimeCryptoContext*)this._cPtr, flags, _sessionKey, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.decrypt_result.DecryptResult)(cast(GMimeDecryptResult*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the digest id based on the digest name.
  
      Params:
        name = digest name
      Returns: the equivalent digest id or #GMIME_DIGEST_ALGO_DEFAULT on fail.
  */
  gid.gmime3.types.DigestAlgo digestId(string name) nothrow
  {
    GMimeDigestAlgo _cretval;
    const(char)* _name = name.toCString!(No.Malloc, No.Nullable);
    _cretval = g_mime_crypto_context_digest_id(cast(GMimeCryptoContext*)this._cPtr, _name);
    gid.gmime3.types.DigestAlgo _retval = cast(gid.gmime3.types.DigestAlgo)_cretval;
    return _retval;
  }

  /**
      Gets the digest name based on the digest id digest.
  
      Params:
        digest = digest id
      Returns: the equivalent digest name or null on fail.
  */
  string digestName(gid.gmime3.types.DigestAlgo digest) nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_digest_name(cast(GMimeCryptoContext*)this._cPtr, digest);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
  int encrypt(bool sign, string userid, gid.gmime3.types.EncryptFlags flags, string[] recipients, gid.gmime3.stream.Stream istream, gid.gmime3.stream.Stream ostream)
  {
    int _retval;
    const(char)* _userid = userid.toCString!(No.Malloc, Yes.Nullable);
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _retval = g_mime_crypto_context_encrypt(cast(GMimeCryptoContext*)this._cPtr, sign, _userid, flags, _recipients, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  int exportKeys(string[] keys, gid.gmime3.stream.Stream ostream)
  {
    int _retval;
    auto _keys_arr = new char*[](keys.length + 1);
    auto _keys = cast(char**)_keys_arr.ptr;
    foreach (i, s; keys) _keys[i] = s.toCString!(No.Malloc);
    GError *_err;
    _retval = g_mime_crypto_context_export_keys(cast(GMimeCryptoContext*)this._cPtr, _keys, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    return _retval;
  }

  /**
      Gets the encryption protocol for the crypto context.
      Returns: the encryption protocol or null if not supported.
  */
  string getEncryptionProtocol() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_get_encryption_protocol(cast(GMimeCryptoContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the key exchange protocol for the crypto context.
      Returns: the key exchange protocol or null if not supported.
  */
  string getKeyExchangeProtocol() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_get_key_exchange_protocol(cast(GMimeCryptoContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Gets the signature protocol for the crypto context.
      Returns: the signature protocol or null if not supported.
  */
  string getSignatureProtocol() nothrow
  {
    const(char)* _cretval;
    _cretval = g_mime_crypto_context_get_signature_protocol(cast(GMimeCryptoContext*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
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
  int importKeys(gid.gmime3.stream.Stream istream)
  {
    int _retval;
    GError *_err;
    _retval = g_mime_crypto_context_import_keys(cast(GMimeCryptoContext*)this._cPtr, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  int sign(bool detach, string userid, gid.gmime3.stream.Stream istream, gid.gmime3.stream.Stream ostream)
  {
    int _retval;
    const(char)* _userid = userid.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _retval = g_mime_crypto_context_sign(cast(GMimeCryptoContext*)this._cPtr, detach, _userid, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  gid.gmime3.signature_list.SignatureList verify(gid.gmime3.types.VerifyFlags flags, gid.gmime3.stream.Stream istream, gid.gmime3.stream.Stream sigstream = null, gid.gmime3.stream.Stream ostream = null)
  {
    GMimeSignatureList* _cretval;
    GError *_err;
    _cretval = g_mime_crypto_context_verify(cast(GMimeCryptoContext*)this._cPtr, flags, istream ? cast(GMimeStream*)istream._cPtr(No.Dup) : null, sigstream ? cast(GMimeStream*)sigstream._cPtr(No.Dup) : null, ostream ? cast(GMimeStream*)ostream._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.crypto_context.CryptoContext]
class CryptoContextGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.crypto_context.CryptoContext]
final class CryptoContextGidBuilder : CryptoContextGidBuilderImpl!CryptoContextGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  CryptoContext build() nothrow
  {
    return new CryptoContext(cast(void*)createGObject(CryptoContext._getGType), Yes.Take);
  }
}
