/// Module for [MIKEYPayloadKeyData] class
module gstsdp.mikeypayload_key_data;

public import gid.basictypes;
import gid.gid;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    The Key data payload contains key material. It should be added as sub
    payload to the KEMAC.
*/
class MIKEYPayloadKeyData : StructWrap!(GstMIKEYPayloadKeyData)
{
  /**
      Create a `mikeypayload_key_data.MIKEYPayloadKeyData` wrap type.
      Params:
        keyType = the #GstMIKEYKeyDataType of @key_data
        kvType = the Key Validity type
        kvLen = length of @kv_data
  */
  this(gstsdp.types.MIKEYKeyDataType keyType = gstsdp.types.MIKEYKeyDataType.init, gstsdp.types.MIKEYKVType kvType = gstsdp.types.MIKEYKVType.init, ubyte[2] kvLen = (ubyte[2]).init) nothrow
  {
    this.keyType = keyType;
    this.kvType = kvType;
    this.kvLen = kvLen;
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
    return cToD!(gstsdp.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadKeyData*)this._cPtr).pt);
  }

  /**
      Get `keyType` field.
      Returns: the #GstMIKEYKeyDataType of @key_data
  */
  @property gstsdp.types.MIKEYKeyDataType keyType() nothrow
  {
    return cast(gstsdp.types.MIKEYKeyDataType)(cast(GstMIKEYPayloadKeyData*)this._cPtr).keyType;
  }

  /**
      Set `keyType` field.
      Params:
        propval = the #GstMIKEYKeyDataType of @key_data
  */
  @property void keyType(gstsdp.types.MIKEYKeyDataType propval) nothrow
  {
    (cast(GstMIKEYPayloadKeyData*)this._cPtr).keyType = cast(GstMIKEYKeyDataType)propval;
  }

  /**
      Get `keyData` field.
      Returns: the key data
  */
  @property ubyte[] keyData() nothrow
  {
    if (!(cast(GstMIKEYPayloadKeyData*)this._cPtr).keyData)
      return null;

    return (cast(GstMIKEYPayloadKeyData*)this._cPtr).keyData[0 .. (cast(GstMIKEYPayloadKeyData*)this._cPtr).keyLen].dup;
  }

  /**
      Get `saltData` field.
      Returns: salt data
  */
  @property ubyte[] saltData() nothrow
  {
    if (!(cast(GstMIKEYPayloadKeyData*)this._cPtr).saltData)
      return null;

    return (cast(GstMIKEYPayloadKeyData*)this._cPtr).saltData[0 .. (cast(GstMIKEYPayloadKeyData*)this._cPtr).saltLen].dup;
  }

  /**
      Get `kvType` field.
      Returns: the Key Validity type
  */
  @property gstsdp.types.MIKEYKVType kvType() nothrow
  {
    return cast(gstsdp.types.MIKEYKVType)(cast(GstMIKEYPayloadKeyData*)this._cPtr).kvType;
  }

  /**
      Set `kvType` field.
      Params:
        propval = the Key Validity type
  */
  @property void kvType(gstsdp.types.MIKEYKVType propval) nothrow
  {
    (cast(GstMIKEYPayloadKeyData*)this._cPtr).kvType = cast(GstMIKEYKVType)propval;
  }

  /**
      Get `kvLen` field.
      Returns: length of @kv_data
  */
  @property ubyte[2] kvLen() nothrow
  {
    return *cast(ubyte[2]*)&(cast(GstMIKEYPayloadKeyData*)this._cPtr).kvLen;
  }

  /**
      Set `kvLen` field.
      Params:
        propval = length of @kv_data
  */
  @property void kvLen(ubyte[2] propval) nothrow
  {
    (cast(GstMIKEYPayloadKeyData*)this._cPtr).kvLen = *cast(ubyte[2]*)&propval;
  }
}
