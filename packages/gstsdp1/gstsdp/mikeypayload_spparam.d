/// Module for [MIKEYPayloadSPParam] class
module gstsdp.mikeypayload_spparam;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    A Type/Length/Value field for security parameters
*/
class MIKEYPayloadSPParam
{
  GstMIKEYPayloadSPParam _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.mikeypayload_spparam.MIKEYPayloadSPParam");

    _cInstance = *cast(GstMIKEYPayloadSPParam*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `type` field.
      Returns: specifies the type of the parameter
  */
  @property ubyte type()
  {
    return (cast(GstMIKEYPayloadSPParam*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = specifies the type of the parameter
  */
  @property void type(ubyte propval)
  {
    (cast(GstMIKEYPayloadSPParam*)this._cPtr).type = propval;
  }

  /**
      Get `len` field.
      Returns: specifies the length of @val
  */
  @property ubyte len()
  {
    return (cast(GstMIKEYPayloadSPParam*)this._cPtr).len;
  }

  /**
      Set `len` field.
      Params:
        propval = specifies the length of @val
  */
  @property void len(ubyte propval)
  {
    (cast(GstMIKEYPayloadSPParam*)this._cPtr).len = propval;
  }
}
