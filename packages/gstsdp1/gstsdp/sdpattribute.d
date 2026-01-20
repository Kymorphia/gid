/// Module for [SDPAttribute] class
module gstsdp.sdpattribute;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.types;

/**
    The contents of the SDP "a=" field which contains a key/value pair.
*/
class SDPAttribute
{
  GstSDPAttribute _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.sdpattribute.SDPAttribute");

    _cInstance = *cast(GstSDPAttribute*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `key` field.
      Returns: the attribute key
  */
  @property string key()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPAttribute*)this._cPtr).key);
  }

  /**
      Set `key` field.
      Params:
        propval = the attribute key
  */
  @property void key(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPAttribute*)this._cPtr).key);
    dToC(propval, cast(void*)&(cast(GstSDPAttribute*)this._cPtr).key);
  }

  /**
      Get `value` field.
      Returns: the attribute value or NULL when it was a property attribute
  */
  @property string value()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPAttribute*)this._cPtr).value);
  }

  /**
      Set `value` field.
      Params:
        propval = the attribute value or NULL when it was a property attribute
  */
  @property void value(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPAttribute*)this._cPtr).value);
    dToC(propval, cast(void*)&(cast(GstSDPAttribute*)this._cPtr).value);
  }

  /**
      Clear the attribute.
      Returns: GST_SDP_OK.
  */
  gstsdp.types.SDPResult clear()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_attribute_clear(cast(GstSDPAttribute*)this._cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the attribute with key and value.
  
      Params:
        key = the key
        value = the value
      Returns: GST_SDP_OK.
  */
  gstsdp.types.SDPResult set(string key, string value = null)
  {
    GstSDPResult _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _cretval = gst_sdp_attribute_set(cast(GstSDPAttribute*)this._cPtr, _key, _value);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
