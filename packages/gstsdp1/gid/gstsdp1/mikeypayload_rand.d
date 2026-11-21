/// Module for [MIKEYPayloadRAND] class
module gid.gstsdp1.mikeypayload_rand;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.mikeypayload;
import gid.gstsdp1.types;

/**
    The RAND payload consists of a (pseudo-)random bit-string
*/
class MIKEYPayloadRAND : StructWrap!(GstMIKEYPayloadRAND)
{
  /**
      Create a `mikeypayload_rand.MIKEYPayloadRAND` wrap type.
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
    return cToD!(gid.gstsdp1.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadRAND*)this._cPtr).pt);
  }

  /**
      Get `rand` field.
      Returns: random values
  */
  @property ubyte[] rand() nothrow
  {
    if (!(cast(GstMIKEYPayloadRAND*)this._cPtr).rand)
      return null;

    return (cast(GstMIKEYPayloadRAND*)this._cPtr).rand[0 .. (cast(GstMIKEYPayloadRAND*)this._cPtr).len].dup;
  }
}
