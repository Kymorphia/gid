/// Module for [ApplicationPkcs7Mime] class
module gid.gmime3.application_pkcs7_mime;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.decrypt_result;
import gid.gmime3.object;
import gid.gmime3.part;
import gid.gmime3.signature_list;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An application/pkcs7-mime MIME part.
*/
class ApplicationPkcs7Mime : gid.gmime3.part.Part
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
    return cast(void function())g_mime_application_pkcs7_mime_get_type != &gidSymbolNotFound ? g_mime_application_pkcs7_mime_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeApplicationPkcs7Mime";
  }

  /** Returns `this`, for use in `with` statements. */
  override ApplicationPkcs7Mime self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.application_pkcs7_mime.ApplicationPkcs7Mime]
      Returns: New builder object
  */
  static ApplicationPkcs7MimeGidBuilder builder() nothrow
  {
    return new ApplicationPkcs7MimeGidBuilder;
  }

  /**
      Creates a new application/pkcs7-mime object.
  
      Params:
        type = The type of S/MIME data contained within the part.
      Returns: an empty application/pkcs7-mime object.
  */
  this(gid.gmime3.types.SecureMimeType type) nothrow
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
  static gid.gmime3.application_pkcs7_mime.ApplicationPkcs7Mime encrypt(gid.gmime3.object.ObjectWrap entity, gid.gmime3.types.EncryptFlags flags, string[] recipients)
  {
    GMimeApplicationPkcs7Mime* _cretval;
    auto _recipients = gPtrArrayFromD!(string, false)(recipients);
    scope(exit) containerFree!(GPtrArray*, string, GidOwnership.None)(_recipients);
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_encrypt(entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, flags, _recipients, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.application_pkcs7_mime.ApplicationPkcs7Mime)(cast(GMimeApplicationPkcs7Mime*)_cretval, Yes.Take);
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
  static gid.gmime3.application_pkcs7_mime.ApplicationPkcs7Mime sign(gid.gmime3.object.ObjectWrap entity, string userid)
  {
    GMimeApplicationPkcs7Mime* _cretval;
    const(char)* _userid = userid.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_sign(entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, _userid, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.application_pkcs7_mime.ApplicationPkcs7Mime)(cast(GMimeApplicationPkcs7Mime*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to decrypt the encrypted application/pkcs7-mime part.
      
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
        result = the decryption result
      Returns: the decrypted MIME part on success or
        null on fail. If the decryption fails, an exception will be set on
        err to provide information as to why the failure occurred.
      Throws: [ErrorWrap]
  */
  gid.gmime3.object.ObjectWrap decrypt(gid.gmime3.types.DecryptFlags flags, string sessionKey, out gid.gmime3.decrypt_result.DecryptResult result)
  {
    GMimeObject* _cretval;
    const(char)* _sessionKey = sessionKey.toCString!(No.Malloc, No.Nullable);
    GMimeDecryptResult* _result;
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_decrypt(cast(GMimeApplicationPkcs7Mime*)this._cPtr, flags, _sessionKey, &_result, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(cast(GMimeObject*)_cretval, Yes.Take);
    result = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.decrypt_result.DecryptResult)(_result, Yes.Take);
    return _retval;
  }

  /**
      Gets the smime-type value of the Content-Type header.
      Returns: the smime-type value.
  */
  gid.gmime3.types.SecureMimeType getSmimeType() nothrow
  {
    GMimeSecureMimeType _cretval;
    _cretval = g_mime_application_pkcs7_mime_get_smime_type(cast(GMimeApplicationPkcs7Mime*)this._cPtr);
    gid.gmime3.types.SecureMimeType _retval = cast(gid.gmime3.types.SecureMimeType)_cretval;
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
  gid.gmime3.signature_list.SignatureList verify(gid.gmime3.types.VerifyFlags flags, out gid.gmime3.object.ObjectWrap entity)
  {
    GMimeSignatureList* _cretval;
    GMimeObject* _entity;
    GError *_err;
    _cretval = g_mime_application_pkcs7_mime_verify(cast(GMimeApplicationPkcs7Mime*)this._cPtr, flags, &_entity, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    entity = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.object.ObjectWrap)(_entity, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.application_pkcs7_mime.ApplicationPkcs7Mime]
class ApplicationPkcs7MimeGidBuilderImpl(T) : gid.gmime3.part.PartGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.application_pkcs7_mime.ApplicationPkcs7Mime]
final class ApplicationPkcs7MimeGidBuilder : ApplicationPkcs7MimeGidBuilderImpl!ApplicationPkcs7MimeGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  ApplicationPkcs7Mime build() nothrow
  {
    return new ApplicationPkcs7Mime(cast(void*)createGObject(ApplicationPkcs7Mime._getGType), Yes.Take);
  }
}
