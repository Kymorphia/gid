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
class MIKEYPayloadRAND
{
  GstMIKEYPayloadRAND _cInstance;

  /**
      Create a `mikeypayload_rand.MIKEYPayloadRAND` wrap type.
      Params:
        len = the length of @rand
  */
  this(ubyte len = ubyte.init) nothrow
  {
    this.len = len;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GstMIKEYPayloadRAND*)ptr;

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
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadRAND*)this._cPtr).pt);
  }

  /**
      Get `len` field.
      Returns: the length of @rand
  */
  @property ubyte len() nothrow
  {
    return (cast(GstMIKEYPayloadRAND*)this._cPtr).len;
  }

  /**
      Set `len` field.
      Params:
        propval = the length of @rand
  */
  @property void len(ubyte propval) nothrow
  {
    (cast(GstMIKEYPayloadRAND*)this._cPtr).len = propval;
  }
}
