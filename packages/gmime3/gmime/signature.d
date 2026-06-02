/// Module for [Signature] class
module gmime.signature;

public import gid.basictypes;
import gid.gid;
import gmime.c.functions;
import gmime.c.types;
import gmime.certificate;
import gmime.types;
import gobject.gid_builder;
import gobject.object;

/**
    An object containing useful information about a signature.
*/
class Signature : gobject.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_mime_signature_get_type != &gidSymbolNotFound ? g_mime_signature_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Signature self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gmime.signature.Signature]
      Returns: New builder object
  */
  static SignatureGidBuilder builder() nothrow
  {
    return new SignatureGidBuilder;
  }

  /**
      Creates a new #GMimeSignature object.
      Returns: a new #GMimeSignature object.
  */
  this() nothrow
  {
    GMimeSignature* _cretval;
    _cretval = g_mime_signature_new();
    this(_cretval, Yes.Take);
  }

  /**
      Get the signature's certificate.
      Returns: the signature's certificate.
  */
  gmime.certificate.Certificate getCertificate() nothrow
  {
    GMimeCertificate* _cretval;
    _cretval = g_mime_signature_get_certificate(cast(GMimeSignature*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gmime.certificate.Certificate)(cast(GMimeCertificate*)_cretval, No.Take);
    return _retval;
  }

  /**
      Get the creation date of the signature.
      Returns: the creation date of the signature or %-1 if unknown.
  */
  long getCreated() nothrow
  {
    long _retval;
    _retval = g_mime_signature_get_created(cast(GMimeSignature*)this._cPtr);
    return _retval;
  }

  /**
      Get the creation date of the signature in seconds since the UNIX
      epoch, represented as a 64-bit signed integer.
      Returns: the creation date of the signature or %-1 if unknown.
  */
  long getCreated64() nothrow
  {
    long _retval;
    _retval = g_mime_signature_get_created64(cast(GMimeSignature*)this._cPtr);
    return _retval;
  }

  /**
      Get the expiration date of the signature. A value of `0` means the signature never expires.
      Returns: the expiration date of the signature or %-1 if unknown.
  */
  long getExpires() nothrow
  {
    long _retval;
    _retval = g_mime_signature_get_expires(cast(GMimeSignature*)this._cPtr);
    return _retval;
  }

  /**
      Get the expiration date of the signature in seconds since the UNIX
      epoch, represented as a 64-bit signed integer. A value of `0` means
      the signature never expires.
      Returns: the expiration date of the signature or %-1 if unknown.
  */
  long getExpires64() nothrow
  {
    long _retval;
    _retval = g_mime_signature_get_expires64(cast(GMimeSignature*)this._cPtr);
    return _retval;
  }

  /**
      Get the signature status as a bitfield of #GMimeSignatureStatus flags.
      Returns: the signature status.
  */
  gmime.types.SignatureStatus getStatus() nothrow
  {
    GMimeSignatureStatus _cretval;
    _cretval = g_mime_signature_get_status(cast(GMimeSignature*)this._cPtr);
    gmime.types.SignatureStatus _retval = cast(gmime.types.SignatureStatus)_cretval;
    return _retval;
  }

  /**
      Set the signature's certificate.
  
      Params:
        cert = a #GMimeCertificate
  */
  void setCertificate(gmime.certificate.Certificate cert) nothrow
  {
    g_mime_signature_set_certificate(cast(GMimeSignature*)this._cPtr, cert ? cast(GMimeCertificate*)cert._cPtr(No.Dup) : null);
  }

  /**
      Set the creation date of the signature.
  
      Params:
        created = creation date
  */
  void setCreated(long created) nothrow
  {
    g_mime_signature_set_created(cast(GMimeSignature*)this._cPtr, created);
  }

  /**
      Set the expiration date of the signature. A value of `0` means the signature never expires.
  
      Params:
        expires = expiration date
  */
  void setExpires(long expires) nothrow
  {
    g_mime_signature_set_expires(cast(GMimeSignature*)this._cPtr, expires);
  }

  /**
      Set the status on the signature.
  
      Params:
        status = a #GMimeSignatureStatus
  */
  void setStatus(gmime.types.SignatureStatus status) nothrow
  {
    g_mime_signature_set_status(cast(GMimeSignature*)this._cPtr, status);
  }
}

/// Fluent builder implementation template for [gmime.signature.Signature]
class SignatureGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gmime.signature.Signature]
final class SignatureGidBuilder : SignatureGidBuilderImpl!SignatureGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Signature build() nothrow
  {
    return new Signature(cast(void*)createGObject(Signature._getGType), Yes.Take);
  }
}
