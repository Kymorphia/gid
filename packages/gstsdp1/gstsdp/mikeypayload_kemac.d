/// Module for [MIKEYPayloadKEMAC] class
module gstsdp.mikeypayload_kemac;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    A structure holding the KEMAC payload
*/
class MIKEYPayloadKEMAC
{
  GstMIKEYPayloadKEMAC _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstMIKEYPayloadKEMAC*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `pt` field.
      Returns: the common #GstMIKEYPayload
  */
  @property gstsdp.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadKEMAC*)this._cPtr).pt);
  }

  /**
      Get `encAlg` field.
      Returns: the #GstMIKEYEncAlg
  */
  @property gstsdp.types.MIKEYEncAlg encAlg() nothrow
  {
    return cast(gstsdp.types.MIKEYEncAlg)(cast(GstMIKEYPayloadKEMAC*)this._cPtr).encAlg;
  }

  /**
      Set `encAlg` field.
      Params:
        propval = the #GstMIKEYEncAlg
  */
  @property void encAlg(gstsdp.types.MIKEYEncAlg propval) nothrow
  {
    (cast(GstMIKEYPayloadKEMAC*)this._cPtr).encAlg = cast(GstMIKEYEncAlg)propval;
  }

  /**
      Get `macAlg` field.
      Returns: the #GstMIKEYMacAlg
  */
  @property gstsdp.types.MIKEYMacAlg macAlg() nothrow
  {
    return cast(gstsdp.types.MIKEYMacAlg)(cast(GstMIKEYPayloadKEMAC*)this._cPtr).macAlg;
  }

  /**
      Set `macAlg` field.
      Params:
        propval = the #GstMIKEYMacAlg
  */
  @property void macAlg(gstsdp.types.MIKEYMacAlg propval) nothrow
  {
    (cast(GstMIKEYPayloadKEMAC*)this._cPtr).macAlg = cast(GstMIKEYMacAlg)propval;
  }
}
