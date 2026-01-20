/// Module for [MIKEYPayloadKeyData] class
module gstsdp.mikeypayload_key_data;

import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The Key data payload contains key material. It should be added as sub
    payload to the KEMAC.
*/
class MIKEYPayloadKeyData
{
  GstMIKEYPayloadKeyData _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.mikeypayload_key_data.MIKEYPayloadKeyData");

    _cInstance = *cast(GstMIKEYPayloadKeyData*)ptr;

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
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadKeyData*)this._cPtr).pt);
  }

  /**
      Get `keyType` field.
      Returns: the #GstMIKEYKeyDataType of @key_data
  */
  @property gstsdp.types.MIKEYKeyDataType keyType()
  {
    return cast(gstsdp.types.MIKEYKeyDataType)(cast(GstMIKEYPayloadKeyData*)this._cPtr).keyType;
  }

  /**
      Set `keyType` field.
      Params:
        propval = the #GstMIKEYKeyDataType of @key_data
  */
  @property void keyType(gstsdp.types.MIKEYKeyDataType propval)
  {
    (cast(GstMIKEYPayloadKeyData*)this._cPtr).keyType = cast(GstMIKEYKeyDataType)propval;
  }

  /**
      Get `keyLen` field.
      Returns: length of @key_data
  */
  @property ushort keyLen()
  {
    return (cast(GstMIKEYPayloadKeyData*)this._cPtr).keyLen;
  }

  /**
      Set `keyLen` field.
      Params:
        propval = length of @key_data
  */
  @property void keyLen(ushort propval)
  {
    (cast(GstMIKEYPayloadKeyData*)this._cPtr).keyLen = propval;
  }

  /**
      Get `saltLen` field.
      Returns: the length of @salt_data, can be 0
  */
  @property ushort saltLen()
  {
    return (cast(GstMIKEYPayloadKeyData*)this._cPtr).saltLen;
  }

  /**
      Set `saltLen` field.
      Params:
        propval = the length of @salt_data, can be 0
  */
  @property void saltLen(ushort propval)
  {
    (cast(GstMIKEYPayloadKeyData*)this._cPtr).saltLen = propval;
  }

  /**
      Get `kvType` field.
      Returns: the Key Validity type
  */
  @property gstsdp.types.MIKEYKVType kvType()
  {
    return cast(gstsdp.types.MIKEYKVType)(cast(GstMIKEYPayloadKeyData*)this._cPtr).kvType;
  }

  /**
      Set `kvType` field.
      Params:
        propval = the Key Validity type
  */
  @property void kvType(gstsdp.types.MIKEYKVType propval)
  {
    (cast(GstMIKEYPayloadKeyData*)this._cPtr).kvType = cast(GstMIKEYKVType)propval;
  }
}
