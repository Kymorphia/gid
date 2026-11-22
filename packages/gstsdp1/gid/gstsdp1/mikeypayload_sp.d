/// Module for [MIKEYPayloadSP] class
module gid.gstsdp1.mikeypayload_sp;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.mikeypayload;
import gid.gstsdp1.types;

/**
    The Security Policy payload defines a set of policies that apply to a
    specific security protocol
*/
class MIKEYPayloadSP : StructWrap!(GstMIKEYPayloadSP)
{
  /**
      Create a `mikeypayload_sp.MIKEYPayloadSP` wrap type.
      Params:
        policy = the policy number
        proto = the security protocol
  */
  this(uint policy = uint.init, gid.gstsdp1.types.MIKEYSecProto proto = gid.gstsdp1.types.MIKEYSecProto.init) nothrow
  {
    this.policy = policy;
    this.proto = proto;
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
      Returns: the payload header
  */
  @property gid.gstsdp1.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gid.gstsdp1.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadSP*)this._cPtr).pt);
  }

  /**
      Get `policy` field.
      Returns: the policy number
  */
  @property uint policy() nothrow
  {
    return (cast(GstMIKEYPayloadSP*)this._cPtr).policy;
  }

  /**
      Set `policy` field.
      Params:
        propval = the policy number
  */
  @property void policy(uint propval) nothrow
  {
    (cast(GstMIKEYPayloadSP*)this._cPtr).policy = propval;
  }

  /**
      Get `proto` field.
      Returns: the security protocol
  */
  @property gid.gstsdp1.types.MIKEYSecProto proto() nothrow
  {
    return cast(gid.gstsdp1.types.MIKEYSecProto)(cast(GstMIKEYPayloadSP*)this._cPtr).proto;
  }

  /**
      Set `proto` field.
      Params:
        propval = the security protocol
  */
  @property void proto(gid.gstsdp1.types.MIKEYSecProto propval) nothrow
  {
    (cast(GstMIKEYPayloadSP*)this._cPtr).proto = cast(GstMIKEYSecProto)propval;
  }

  /**
      Get `params` field.
      Returns: array of #GstMIKEYPayloadSPParam
  */
  @property void*[] params() nothrow
  {
    return gArrayToD!(void*)((cast(GstMIKEYPayloadSP*)this._cPtr).params);
  }
}
