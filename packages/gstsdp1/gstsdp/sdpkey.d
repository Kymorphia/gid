/// Module for [SDPKey] class
module gstsdp.sdpkey;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "k=" field which is used to convey encryption
    keys.
*/
class SDPKey
{
  GstSDPKey _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.sdpkey.SDPKey");

    _cInstance = *cast(GstSDPKey*)ptr;

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
      Returns: the encryption type
  */
  @property string type()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPKey*)this._cPtr).type);
  }

  /**
      Set `type` field.
      Params:
        propval = the encryption type
  */
  @property void type(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPKey*)this._cPtr).type);
    dToC(propval, cast(void*)&(cast(GstSDPKey*)this._cPtr).type);
  }

  /**
      Get `data` field.
      Returns: the encryption data
  */
  @property string data()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPKey*)this._cPtr).data);
  }

  /**
      Set `data` field.
      Params:
        propval = the encryption data
  */
  @property void data(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPKey*)this._cPtr).data);
    dToC(propval, cast(void*)&(cast(GstSDPKey*)this._cPtr).data);
  }
}
