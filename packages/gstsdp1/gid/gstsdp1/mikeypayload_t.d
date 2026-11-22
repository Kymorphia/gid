/// Module for [MIKEYPayloadT] class
module gid.gstsdp1.mikeypayload_t;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.mikeypayload;
import gid.gstsdp1.types;

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
  @property gid.gstsdp1.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gid.gstsdp1.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadT*)this._cPtr).pt);
  }

  /**
      Get `type` field.
      Returns: a #GstMIKEYTSType
  */
  @property gid.gstsdp1.types.MIKEYTSType type() nothrow
  {
    return cast(gid.gstsdp1.types.MIKEYTSType)(cast(GstMIKEYPayloadT*)this._cPtr).type;
  }

  /**
  Get `tsValue` field.
  Returns: the timestamp value (copied), its length is determined by the timestamp type
  */
  @property ubyte[] tsValue() nothrow
  {
    import gid.gstsdp1.mikeypayload : MIKEYPayload;

    auto payload = cast(GstMIKEYPayloadT*)this._cPtr;
    auto _len = MIKEYPayload.tsValueLength(cast(gid.gstsdp1.types.MIKEYTSType)payload.type);

    if (!payload.tsValue || _len <= 0)
      return null;

    return payload.tsValue[0 .. _len].dup;
  }

}
