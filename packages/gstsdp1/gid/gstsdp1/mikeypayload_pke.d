/// Module for [MIKEYPayloadPKE] class
module gid.gstsdp1.mikeypayload_pke;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.mikeypayload;
import gid.gstsdp1.types;

/**
    The Envelope data payload contains the encrypted envelope key that is
    used in the public-key transport to protect the data in the Key data
    transport payload.  The encryption algorithm used is implicit from
    the certificate/public key used.
*/
class MIKEYPayloadPKE : StructWrap!(GstMIKEYPayloadPKE)
{
  /**
      Create a `mikeypayload_pke.MIKEYPayloadPKE` wrap type.
      Params:
        C = envelope key cache indicator
  */
  this(gid.gstsdp1.types.MIKEYCacheType C = gid.gstsdp1.types.MIKEYCacheType.init) nothrow
  {
    this.C = C;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Get `pt` field.
      Returns: the common #GstMIKEYPayload
  */
  @property gid.gstsdp1.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gid.gstsdp1.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadPKE*)this._cPtr).pt);
  }

  /**
      Get `C` field.
      Returns: envelope key cache indicator
  */
  @property gid.gstsdp1.types.MIKEYCacheType C() nothrow
  {
    return cast(gid.gstsdp1.types.MIKEYCacheType)(cast(GstMIKEYPayloadPKE*)this._cPtr).C;
  }

  /**
      Set `C` field.
      Params:
        propval = envelope key cache indicator
  */
  @property void C(gid.gstsdp1.types.MIKEYCacheType propval) nothrow
  {
    (cast(GstMIKEYPayloadPKE*)this._cPtr).C = cast(GstMIKEYCacheType)propval;
  }

  /**
      Get `data` field.
      Returns: the encrypted envelope key
  */
  @property ubyte[] data() nothrow
  {
    if (!(cast(GstMIKEYPayloadPKE*)this._cPtr).data)
      return null;

    return (cast(GstMIKEYPayloadPKE*)this._cPtr).data[0 .. (cast(GstMIKEYPayloadPKE*)this._cPtr).dataLen].dup;
  }
}
