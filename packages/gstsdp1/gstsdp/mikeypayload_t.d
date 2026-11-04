/// Module for [MIKEYPayloadT] class
module gstsdp.mikeypayload_t;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The timestamp payload carries the timestamp information
*/
class MIKEYPayloadT : StructWrap!(GstMIKEYPayloadT)
{
  /**
      Create a `mikeypayload_t.MIKEYPayloadT` wrap type.
      Params:
        type = a #GstMIKEYTSType
  */
  this(gstsdp.types.MIKEYTSType type = gstsdp.types.MIKEYTSType.init) nothrow
  {
    this.type = type;
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
  @property gstsdp.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadT*)this._cPtr).pt);
  }

  /**
      Get `type` field.
      Returns: a #GstMIKEYTSType
  */
  @property gstsdp.types.MIKEYTSType type() nothrow
  {
    return cast(gstsdp.types.MIKEYTSType)(cast(GstMIKEYPayloadT*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = a #GstMIKEYTSType
  */
  @property void type(gstsdp.types.MIKEYTSType propval) nothrow
  {
    (cast(GstMIKEYPayloadT*)this._cPtr).type = cast(GstMIKEYTSType)propval;
  }
}
