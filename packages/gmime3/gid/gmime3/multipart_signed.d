/// Module for [MultipartSigned] class
module gid.gmime3.multipart_signed;

public import gid.core.basictypes;
import gid.core.utils;
import gid.glib2.error;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.crypto_context;
import gid.gmime3.multipart;
import gid.gmime3.object;
import gid.gmime3.signature_list;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    A multipart/signed MIME part.
*/
class MultipartSigned : gid.gmime3.multipart.Multipart
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
    return cast(void function())g_mime_multipart_signed_get_type != &gidSymbolNotFound ? g_mime_multipart_signed_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeMultipartSigned";
  }

  /** Returns `this`, for use in `with` statements. */
  override MultipartSigned self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.multipart_signed.MultipartSigned]
      Returns: New builder object
  */
  static MultipartSignedGidBuilder builder() nothrow
  {
    return new MultipartSignedGidBuilder;
  }

  /**
      Creates a new MIME multipart/signed object.
      Returns: an empty MIME multipart/signed object.
  */
  this() nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gobject.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
    }
    else
    {
      GMimeMultipartSigned* _cretval;
      _cretval = g_mime_multipart_signed_new();
      this(_cretval, Yes.Take);
    }
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
  static gid.gmime3.multipart_signed.MultipartSigned sign(gid.gmime3.crypto_context.CryptoContext ctx, gid.gmime3.object.ObjectWrap entity, string userid)
  {
    GMimeMultipartSigned* _cretval;
    const(char)* _userid = userid.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_mime_multipart_signed_sign(ctx ? cast(GMimeCryptoContext*)ctx._cPtr(No.Dup) : null, entity ? cast(GMimeObject*)entity._cPtr(No.Dup) : null, _userid, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.multipart_signed.MultipartSigned)(cast(GMimeMultipartSigned*)_cretval, Yes.Take);
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
  gid.gmime3.signature_list.SignatureList verify(gid.gmime3.types.VerifyFlags flags)
  {
    GMimeSignatureList* _cretval;
    GError *_err;
    _cretval = g_mime_multipart_signed_verify(cast(GMimeMultipartSigned*)this._cPtr, flags, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.signature_list.SignatureList)(cast(GMimeSignatureList*)_cretval, Yes.Take);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gmime3.multipart_signed.MultipartSigned]
class MultipartSignedGidBuilderImpl(T) : gid.gmime3.multipart.MultipartGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.multipart_signed.MultipartSigned]
final class MultipartSignedGidBuilder : MultipartSignedGidBuilderImpl!MultipartSignedGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  MultipartSigned build() nothrow
  {
    return new MultipartSigned(cast(void*)createGObject(MultipartSigned._getGType), Yes.Take);
  }
}
