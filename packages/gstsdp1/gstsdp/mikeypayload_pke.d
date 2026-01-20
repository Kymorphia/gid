/// Module for [MIKEYPayloadPKE] class
module gstsdp.mikeypayload_pke;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The Envelope data payload contains the encrypted envelope key that is
    used in the public-key transport to protect the data in the Key data
    transport payload.  The encryption algorithm used is implicit from
    the certificate/public key used.
*/
class MIKEYPayloadPKE
{
  GstMIKEYPayloadPKE _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.mikeypayload_pke.MIKEYPayloadPKE");

    _cInstance = *cast(GstMIKEYPayloadPKE*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `pt` field.
      Returns: the common #GstMIKEYPayload
  */
  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadPKE*)this._cPtr).pt);
  }

  /**
      Get `C` field.
      Returns: envelope key cache indicator
  */
  @property gstsdp.types.MIKEYCacheType C()
  {
    return cast(gstsdp.types.MIKEYCacheType)(cast(GstMIKEYPayloadPKE*)this._cPtr).C;
  }

  /**
      Set `C` field.
      Params:
        propval = envelope key cache indicator
  */
  @property void C(gstsdp.types.MIKEYCacheType propval)
  {
    (cast(GstMIKEYPayloadPKE*)this._cPtr).C = cast(GstMIKEYCacheType)propval;
  }

  /**
      Get `dataLen` field.
      Returns: length of @data
  */
  @property ushort dataLen()
  {
    return (cast(GstMIKEYPayloadPKE*)this._cPtr).dataLen;
  }

  /**
      Set `dataLen` field.
      Params:
        propval = length of @data
  */
  @property void dataLen(ushort propval)
  {
    (cast(GstMIKEYPayloadPKE*)this._cPtr).dataLen = propval;
  }
}
