/// Module for [ApplicationPkcs7Mime] class
module gmime.application_pkcs7_mime;

import gid.gid;
import glib.error;
import gmime.c.functions;
import gmime.c.types;
import gmime.decrypt_result;
import gmime.object;
import gmime.part;
import gmime.signature_list;
import gmime.types;
import gobject.object;

/**
    An application/pkcs7-mime MIME part.
*/
class ApplicationPkcs7Mime : gmime.part.Part
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
    return cast(void function())g_mime_application_pkcs7_mime_get_type != &gidSymbolNotFound ? g_mime_application_pkcs7_mime_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override ApplicationPkcs7Mime self()
  {
    return this;
  }

  /**
      Creates a new application/pkcs7-mime object.
  
      Params:
        type = The type of S/MIME data contained within the part.
      Returns: an empty application/pkcs7-mime object.
  */
  this(gmime.types.SecureMimeType type)
  {
    GMimeApplicationPkcs7Mime* _cretval;
    _cretval = g_mime_application_pkcs7_mime_new(type);
    this(_cretval, Yes.Take);
  }

  /**
      Attempts to encrypt the entity MIME part to the public keys of recipients
      using S/MIME. If successful, a new application/pkcs7-mime object is returned.
  
      Params:
        entity = a #GMimeObject to encrypt
        flags = a #GMimeEncryptFlags
        recipients = an array of recipients to encrypt to
      Returns: a new #GMimeApplicationPkcs7Mime object on success
        or null on fail. If encrypting fails, an exception will be set on err to provide
        information as to why the failure occurred.
      Throws: [ErrorWrap]
  */
  static gmime.application_pkcs7_mime.ApplicationPkcs7Mime encrypt(gmime.object.ObjectWrap entity, gmime.types.EncryptFlags flags, string[] recipients)
  {
    GMimeApplicationPkcs7Mime* _cretval;
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_encrypt(entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, flags, _recipients, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.application_pkcs7_mime.ApplicationPkcs7Mime)(cast(GMimeApplicationPkcs7Mime*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to sign the entity MIME part with userid's private key using
      S/MIME. If successful, a new application/pkcs7-mime object is returned.
  
      Params:
        entity = a #GMimeObject
        userid = the user id to sign with
      Returns: a new #GMimeApplicationPkcs7Mime object on success
        or null on fail. If signing fails, an exception will be set on err to provide
        information as to why the failure occurred.
      Throws: [ErrorWrap]
  */
  static gmime.application_pkcs7_mime.ApplicationPkcs7Mime sign(gmime.object.ObjectWrap entity, string userid)
  {
    GMimeApplicationPkcs7Mime* _cretval;
    const(char)* _userid = userid.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_sign(entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, _userid, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.application_pkcs7_mime.ApplicationPkcs7Mime)(cast(GMimeApplicationPkcs7Mime*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to decrypt the encrypted application/pkcs7-mime part.
      
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
        result = the decryption result
      Returns: the decrypted MIME part on success or
        null on fail. If the decryption fails, an exception will be set on
        err to provide information as to why the failure occurred.
      Throws: [ErrorWrap]
  */
  gmime.object.ObjectWrap decrypt(gmime.types.DecryptFlags flags, string sessionKey, gmime.decrypt_result.DecryptResult result)
  {
    GMimeObject* _cretval;
    const(char)* _sessionKey = sessionKey.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_decrypt(cast(GMimeApplicationPkcs7Mime*)this._cPtr, flags, _sessionKey, result ? cast(GMimeDecryptResult**)result._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Gets the smime-type value of the Content-Type header.
      Returns: the smime-type value.
  */
  gmime.types.SecureMimeType getSmimeType()
  {
    GMimeSecureMimeType _cretval;
    _cretval = g_mime_application_pkcs7_mime_get_smime_type(cast(GMimeApplicationPkcs7Mime*)this._cPtr);
    gmime.types.SecureMimeType _retval = cast(gmime.types.SecureMimeType)_cretval;
    return _retval;
  }

  /**
      Attempts to verify the signed pkcs7_mime part and extract the original
      MIME entity.
  
      Params:
        flags = a #GMimeVerifyFlags
        entity = the extracted entity
      Returns: a new #GMimeSignatureList object on
        success or null on fail. If the verification fails, an exception
        will be set on err to provide information as to why the failure
        occurred.
      Throws: [ErrorWrap]
  */
  gmime.signature_list.SignatureList verify(gmime.types.VerifyFlags flags, out gmime.object.ObjectWrap entity)
  {
    GMimeSignatureList* _cretval;
    GMimeObject* _entity;
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_verify(cast(GMimeApplicationPkcs7Mime*)this._cPtr, flags, &_entity, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    entity = new gmime.object.ObjectWrap(cast(void*)_entity, Yes.Take);
    return _retval;
  }
}
