/// Module for [MIKEYPayloadSP] class
module gstsdp.mikeypayload_sp;

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

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.mikeypayload_sp.MIKEYPayloadSP");

    _cInstance = *cast(GstMIKEYPayloadSP*)ptr;

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
      Returns: the payload header
  */
  @property gstsdp.mikeypayload.MIKEYPayload pt()
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadSP*)this._cPtr).pt);
  }

  /**
      Get `policy` field.
      Returns: the policy number
  */
  @property uint policy()
  {
    return (cast(GstMIKEYPayloadSP*)this._cPtr).policy;
  }

  /**
      Set `policy` field.
      Params:
        propval = the policy number
  */
  @property void policy(uint propval)
  {
    (cast(GstMIKEYPayloadSP*)this._cPtr).policy = propval;
  }

  /**
      Get `proto` field.
      Returns: the security protocol
  */
  @property gstsdp.types.MIKEYSecProto proto()
  {
    return cast(gstsdp.types.MIKEYSecProto)(cast(GstMIKEYPayloadSP*)this._cPtr).proto;
  }

  /**
      Set `proto` field.
      Params:
        propval = the security protocol
  */
  @property void proto(gstsdp.types.MIKEYSecProto propval)
  {
    (cast(GstMIKEYPayloadSP*)this._cPtr).proto = cast(GstMIKEYSecProto)propval;
  }
}
