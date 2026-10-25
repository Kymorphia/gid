/// Module for [MIKEYPayloadSP] class
module gstsdp.mikeypayload_sp;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The Security Policy payload defines a set of policies that apply to a
    specific security protocol
*/
class MIKEYPayloadSP
{
  GstMIKEYPayloadSP _cInstance;

  /**
      Create a `mikeypayload_sp.MIKEYPayloadSP` wrap type.
      Params:
        policy = the policy number
        proto = the security protocol
  */
  this(uint policy = uint.init, gstsdp.types.MIKEYSecProto proto = gstsdp.types.MIKEYSecProto.init) nothrow
  {
    this.policy = policy;
    this.proto = proto;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstMIKEYPayloadSP*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `pt` field.
      Returns: the payload header
  */
  @property gstsdp.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadSP*)this._cPtr).pt);
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
  @property gstsdp.types.MIKEYSecProto proto() nothrow
  {
    return cast(gstsdp.types.MIKEYSecProto)(cast(GstMIKEYPayloadSP*)this._cPtr).proto;
  }

  /**
      Set `proto` field.
      Params:
        propval = the security protocol
  */
  @property void proto(gstsdp.types.MIKEYSecProto propval) nothrow
  {
    (cast(GstMIKEYPayloadSP*)this._cPtr).proto = cast(GstMIKEYSecProto)propval;
  }

  /**
      Get `params` field.
      Returns: array of #GstMIKEYPayloadSPParam
  */
  @property void*[] params() nothrow
  {
    return gArrayGToD!(void*)((cast(GstMIKEYPayloadSP*)this._cPtr).params);
  }
}
