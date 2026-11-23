/// Module for [MultipartEncrypted] class
module gid.gmime3.multipart_encrypted;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.crypto_context;
import gid.gmime3.decrypt_result;
import gid.gmime3.multipart;
import gid.gmime3.object;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A multipart/encrypted MIME part.
*/
class MultipartEncrypted : gid.gmime3.multipart.Multipart
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
    return cast(void function())g_mime_multipart_encrypted_get_type != &gidSymbolNotFound ? g_mime_multipart_encrypted_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeMultipartEncrypted";
  }

  /** Returns `this`, for use in `with` statements. */
  override MultipartEncrypted self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.multipart_encrypted.MultipartEncrypted]
      Returns: New builder object
  */
  static MultipartEncryptedGidBuilder builder() nothrow
  {
    return new MultipartEncryptedGidBuilder;
  }

  /**
      Creates a new MIME multipart/encrypted object.
      Returns: an empty MIME multipart/encrypted object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeMultipartEncrypted* _cretval;
      _cretval = g_mime_multipart_encrypted_new();
      this(_cretval, Yes.Take);
    }
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
  static gid.gmime3.multipart_encrypted.MultipartEncrypted encrypt(gid.gmime3.crypto_context.CryptoContext ctx, gid.gmime3.object.ObjectWrap entity, bool sign, string userid, gid.gmime3.types.EncryptFlags flags, string[] recipients)
  {
    GMimeMultipartEncrypted* _cretval;
    const(char)* _userid = userid.toCString!(No.Malloc, Yes.Nullable);
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _cretval = g_mime_multipart_encrypted_encrypt(ctx ? cast(GMimeCryptoContext*)ctx._cPtr(No.Dup) : null, entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, sign, _userid, flags, _recipients, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.multipart_encrypted.MultipartEncrypted)(cast(GMimeMultipartEncrypted*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to decrypt the encrypted MIME part contained within the
      multipart/encrypted object encrypted.
      
      When non-null, session_key should be a null-terminated string,
      such as the one returned by [gid.gmime3.decrypt_result.DecryptResult.getSessionKey]
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
  gid.gmime3.object.ObjectWrap decrypt(gid.gmime3.types.DecryptFlags flags, string sessionKey, out gid.gmime3.decrypt_result.DecryptResult result)
  {
    GMimeObject* _cretval;
    const(char)* _sessionKey = sessionKey.toCString!(No.Malloc, Yes.Nullable);
    GMimeDecryptResult* _result;
    GError *_err;
    _cretval = g_mime_multipart_encrypted_decrypt(cast(GMimeMultipartEncrypted*)this._cPtr, flags, _sessionKey, &_result, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    result = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.decrypt_result.DecryptResult)(_result, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.multipart_encrypted.MultipartEncrypted]
class MultipartEncryptedGidBuilderImpl(T) : gid.gmime3.multipart.MultipartGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.multipart_encrypted.MultipartEncrypted]
final class MultipartEncryptedGidBuilder : MultipartEncryptedGidBuilderImpl!MultipartEncryptedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultipartEncrypted build() nothrow
  {
    return new MultipartEncrypted(cast(void*)createGObject(MultipartEncrypted._getGType), Yes.Take);
  }
}
