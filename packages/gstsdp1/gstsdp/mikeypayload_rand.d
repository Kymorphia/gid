/// Module for [MIKEYPayloadRAND] class
module gstsdp.mikeypayload_rand;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

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
  @property gstsdp.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadRAND*)this._cPtr).pt);
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
