/// Module for [MIKEYPayloadRAND] class
module gstsdp.mikeypayload_rand;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The RAND payload consists of a (pseudo-)random bit-string
*/
class MIKEYPayloadRAND
{
  GstMIKEYPayloadRAND _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.mikeypayload_rand.MIKEYPayloadRAND");

    _cInstance = *cast(GstMIKEYPayloadRAND*)ptr;

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
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadRAND*)this._cPtr).pt);
  }

  /**
      Get `len` field.
      Returns: the length of @rand
  */
  @property ubyte len()
  {
    return (cast(GstMIKEYPayloadRAND*)this._cPtr).len;
  }

  /**
      Set `len` field.
      Params:
        propval = the length of @rand
  */
  @property void len(ubyte propval)
  {
    (cast(GstMIKEYPayloadRAND*)this._cPtr).len = propval;
  }
}
