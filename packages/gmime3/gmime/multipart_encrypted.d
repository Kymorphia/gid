/// Module for [MultipartEncrypted] class
module gmime.multipart_encrypted;

import gid.gid;
import glib.error;
import gmime.c.functions;
import gmime.c.types;
import gmime.crypto_context;
import gmime.decrypt_result;
import gmime.multipart;
import gmime.object;
import gmime.types;
import gobject.object;

/**
    A multipart/encrypted MIME part.
*/
class MultipartEncrypted : gmime.multipart.Multipart
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
    return cast(void function())g_mime_multipart_encrypted_get_type != &gidSymbolNotFound ? g_mime_multipart_encrypted_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MultipartEncrypted self()
  {
    return this;
  }

  /**
      Creates a new MIME multipart/encrypted object.
      Returns: an empty MIME multipart/encrypted object.
  */
  this()
  {
    GMimeMultipartEncrypted* _cretval;
    _cretval = g_mime_multipart_encrypted_new();
    this(_cretval, Yes.Take);
  }

  /**
      Attempts to encrypt (and conditionally sign) the entity MIME part
      to the public keys of recipients using the ctx encryption
      context. If successful, a new multipart/encrypted object is returned.
  
      Params:
        ctx = a #GMimeCryptoContext
        entity = MIME part to encrypt
        sign = true if the content should also be signed or false otherwise
        userid = user id to use for signing (only used if sign is true)
        flags = a #GMimeEncryptFlags
        recipients = an array of recipients to encrypt to
      Returns: a new #GMimeMultipartEncrypted object on success
        or null on fail. If encrypting fails, an exception will be set on err to provide
        information as to why the failure occurred.
      Throws: [ErrorWrap]
  */
  static gmime.multipart_encrypted.MultipartEncrypted encrypt(gmime.crypto_context.CryptoContext ctx, gmime.object.ObjectWrap entity, bool sign, string userid, gmime.types.EncryptFlags flags, string[] recipients)
  {
    GMimeMultipartEncrypted* _cretval;
    const(char)* _userid = userid.toCString(No.Alloc);
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _cretval = g_mime_multipart_encrypted_encrypt(ctx ? cast(GMimeCryptoContext*)ctx._cPtr(No.Dup) : null, entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, sign, _userid, flags, _recipients, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.multipart_encrypted.MultipartEncrypted)(cast(GMimeMultipartEncrypted*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to decrypt the encrypted MIME part contained within the
      multipart/encrypted object encrypted.
      
      When non-null, session_key should be a null-terminated string,
      such as the one returned by [gmime.decrypt_result.DecryptResult.getSessionKey]
      from a previous decryption. If the session_key is not valid, decryption
      will fail.
      
      If result is non-null, then on a successful decrypt operation, it will be
      updated to point to a newly-allocated #GMimeDecryptResult with signature
      status information as well as a list of recipients that the part was
      encrypted to.
  
      Params:
        flags = a #GMimeDecryptFlags
        sessionKey = session key to use or null
        result = a #GMimeDecryptResult
      Returns: the decrypted MIME part on success or
        null on fail. If the decryption fails, an exception will be set on
        err to provide information as to why the failure occurred.
      Throws: [ErrorWrap]
  */
  gmime.object.ObjectWrap decrypt(gmime.types.DecryptFlags flags, string sessionKey, out gmime.decrypt_result.DecryptResult result)
  {
    GMimeObject* _cretval;
    const(char)* _sessionKey = sessionKey.toCString(No.Alloc);
    GMimeDecryptResult* _result;
    GError *_err;
    _cretval = g_mime_multipart_encrypted_decrypt(cast(GMimeMultipartEncrypted*)this._cPtr, flags, _sessionKey, &_result, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    result = new gmime.decrypt_result.DecryptResult(cast(void*)_result, Yes.Take);
    return _retval;
  }
}
