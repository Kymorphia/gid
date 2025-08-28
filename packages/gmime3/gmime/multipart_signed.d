/// Module for [MultipartSigned] class
module gmime.multipart_signed;

import gid.gid;
import glib.error;
import gmime.c.functions;
import gmime.c.types;
import gmime.crypto_context;
import gmime.multipart;
import gmime.object;
import gmime.signature_list;
import gmime.types;
import gobject.object;

/**
    A multipart/signed MIME part.
*/
class MultipartSigned : gmime.multipart.Multipart
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
    return cast(void function())g_mime_multipart_signed_get_type != &gidSymbolNotFound ? g_mime_multipart_signed_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MultipartSigned self()
  {
    return this;
  }

  /**
      Creates a new MIME multipart/signed object.
      Returns: an empty MIME multipart/signed object.
  */
  this()
  {
    GMimeMultipartSigned* _cretval;
    _cretval = g_mime_multipart_signed_new();
    this(_cretval, Yes.Take);
  }

  /**
      Attempts to sign the content MIME part with userid's private key
      using the ctx signing context. If successful, a new multipart/signed
      object is returned.
  
      Params:
        ctx = a #GMimeCryptoContext
        entity = MIME part to sign
        userid = user id to sign with
      Returns: a new #GMimeMultipartSigned object on success
        or null on fail. If signing fails, an exception will be set on err to provide
        information as to why the failure occurred.
      Throws: [ErrorWrap]
  */
  static gmime.multipart_signed.MultipartSigned sign(gmime.crypto_context.CryptoContext ctx, gmime.object.ObjectWrap entity, string userid)
  {
    GMimeMultipartSigned* _cretval;
    const(char)* _userid = userid.toCString(No.Alloc);
    GError *_err;
    _cretval = g_mime_multipart_signed_sign(ctx ? cast(GMimeCryptoContext*)ctx._cPtr(No.Dup) : null, entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, _userid, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.multipart_signed.MultipartSigned)(cast(GMimeMultipartSigned*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Attempts to verify the signed MIME part contained within the
      multipart/signed object mps.
  
      Params:
        flags = a #GMimeVerifyFlags
      Returns: a new #GMimeSignatureList object on
        success or null on fail. If the verification fails, an exception
        will be set on err to provide information as to why the failure
        occurred.
      Throws: [ErrorWrap]
  */
  gmime.signature_list.SignatureList verify(gmime.types.VerifyFlags flags)
  {
    GMimeSignatureList* _cretval;
    GError *_err;
    _cretval = g_mime_multipart_signed_verify(cast(GMimeMultipartSigned*)this._cPtr, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    return _retval;
  }
}
