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
  */
  this() nothrow
  {
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
  Get `tsValue` field.
  Returns: the timestamp value (copied), its length is determined by the timestamp type
  */
  @property ubyte[] tsValue() nothrow
  {
    import gstsdp.mikeypayload : MIKEYPayload;

    auto payload = cast(GstMIKEYPayloadT*)this._cPtr;
    auto _len = MIKEYPayload.tsValueLength(cast(gstsdp.types.MIKEYTSType)payload.type);

    if (!payload.tsValue || _len <= 0)
      return null;

    return payload.tsValue[0 .. _len].dup;
  }

}
