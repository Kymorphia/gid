/// Module for [MIKEYPayloadT] class
module gstsdp.mikeypayload_t;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The timestamp payload carries the timestamp information
*/
class MIKEYPayloadT
{
  GstMIKEYPayloadT _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.mikeypayload_t.MIKEYPayloadT");

    _cInstance = *cast(GstMIKEYPayloadT*)ptr;

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
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadT*)this._cPtr).pt);
  }

  /**
      Get `type` field.
      Returns: a #GstMIKEYTSType
  */
  @property gstsdp.types.MIKEYTSType type()
  {
    return cast(gstsdp.types.MIKEYTSType)(cast(GstMIKEYPayloadT*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = a #GstMIKEYTSType
  */
  @property void type(gstsdp.types.MIKEYTSType propval)
  {
    (cast(GstMIKEYPayloadT*)this._cPtr).type = cast(GstMIKEYTSType)propval;
  }
}
