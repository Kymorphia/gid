/// Module for [MIKEYPayloadKEMAC] class
module gid.gstsdp1.mikeypayload_kemac;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.mikeypayload;
import gid.gstsdp1.types;

/**
    A structure holding the KEMAC payload
*/
class MIKEYPayloadKEMAC : StructWrap!(GstMIKEYPayloadKEMAC)
{
  /**
      Create a `mikeypayload_kemac.MIKEYPayloadKEMAC` wrap type.
      Params:
        encAlg = the #GstMIKEYEncAlg
        macAlg = the #GstMIKEYMacAlg
  */
  this(gid.gstsdp1.types.MIKEYEncAlg encAlg = gid.gstsdp1.types.MIKEYEncAlg.init, gid.gstsdp1.types.MIKEYMacAlg macAlg = gid.gstsdp1.types.MIKEYMacAlg.init) nothrow
  {
    this.encAlg = encAlg;
    this.macAlg = macAlg;
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
    return cToD!(gid.gstsdp1.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadKEMAC*)this._cPtr).pt);
  }

  /**
      Get `encAlg` field.
      Returns: the #GstMIKEYEncAlg
  */
  @property gid.gstsdp1.types.MIKEYEncAlg encAlg() nothrow
  {
    return cast(gid.gstsdp1.types.MIKEYEncAlg)(cast(GstMIKEYPayloadKEMAC*)this._cPtr).encAlg;
  }

  /**
      Set `encAlg` field.
      Params:
        propval = the #GstMIKEYEncAlg
  */
  @property void encAlg(gid.gstsdp1.types.MIKEYEncAlg propval) nothrow
  {
    (cast(GstMIKEYPayloadKEMAC*)this._cPtr).encAlg = cast(GstMIKEYEncAlg)propval;
  }

  /**
      Get `macAlg` field.
      Returns: the #GstMIKEYMacAlg
  */
  @property gid.gstsdp1.types.MIKEYMacAlg macAlg() nothrow
  {
    return cast(gid.gstsdp1.types.MIKEYMacAlg)(cast(GstMIKEYPayloadKEMAC*)this._cPtr).macAlg;
  }

  /**
      Set `macAlg` field.
      Params:
        propval = the #GstMIKEYMacAlg
  */
  @property void macAlg(gid.gstsdp1.types.MIKEYMacAlg propval) nothrow
  {
    (cast(GstMIKEYPayloadKEMAC*)this._cPtr).macAlg = cast(GstMIKEYMacAlg)propval;
  }

  /**
      Get `subpayloads` field.
      Returns: the subpayloads
  */
  @property void*[] subpayloads() nothrow
  {
    return gArrayToD!(void*)((cast(GstMIKEYPayloadKEMAC*)this._cPtr).subpayloads);
  }
}
