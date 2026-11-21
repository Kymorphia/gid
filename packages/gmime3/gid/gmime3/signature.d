/// Module for [Signature] class
module gid.gmime3.signature;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gmime3.c.functions;
import gid.gmime3.c.types;
import gid.gmime3.certificate;
import gid.gmime3.types;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    An object containing useful information about a signature.
*/
class Signature : gid.gobject2.object.ObjectWrap
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
    return cast(void function())g_mime_signature_get_type != &gidSymbolNotFound ? g_mime_signature_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GMimeSignature";
  }

  /** Returns `this`, for use in `with` statements. */
  override Signature self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gmime3.signature.Signature]
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
  gid.gmime3.certificate.Certificate getCertificate() nothrow
  {
    GMimeCertificate* _cretval;
    _cretval = g_mime_signature_get_certificate(cast(GMimeSignature*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gmime3.certificate.Certificate)(cast(GMimeCertificate*)_cretval, No.Take);
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
  gid.gmime3.types.SignatureStatus getStatus() nothrow
  {
    GMimeSignatureStatus _cretval;
    _cretval = g_mime_signature_get_status(cast(GMimeSignature*)this._cPtr);
    gid.gmime3.types.SignatureStatus _retval = cast(gid.gmime3.types.SignatureStatus)_cretval;
    return _retval;
  }

  /**
      Set the signature's certificate.
  
      Params:
        cert = a #GMimeCertificate
  */
  void setCertificate(gid.gmime3.certificate.Certificate cert) nothrow
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
  void setStatus(gid.gmime3.types.SignatureStatus status) nothrow
  {
    g_mime_signature_set_status(cast(GMimeSignature*)this._cPtr, status);
  }
}

/// Fluent builder implementation template for [gid.gmime3.signature.Signature]
class SignatureGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.gmime3.signature.Signature]
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
