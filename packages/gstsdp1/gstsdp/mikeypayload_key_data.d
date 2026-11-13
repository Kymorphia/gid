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
  */
  this(gstsdp.types.MIKEYKeyDataType keyType = gstsdp.types.MIKEYKeyDataType.init, gstsdp.types.MIKEYKVType kvType = gstsdp.types.MIKEYKVType.init) nothrow
  {
    this.keyType = keyType;
    this.kvType = kvType;
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
  Get `kvData` field.
  Returns: the key validity data (copied) for the key validity type: empty for
  [gstsdp.types.MIKEYKVType.Null], the SPI/MKI for [gstsdp.types.MIKEYKVType.Spi] or the valid from and valid
  to values for [gstsdp.types.MIKEYKVType.Interval]
  */
  @property ubyte[][] kvData() nothrow
  {
    auto payload = cast(GstMIKEYPayloadKeyData*)this._cPtr;
    size_t _count; // Number of key validity data arrays for the key validity type

    if (payload.kvType == GstMIKEYKVType.Spi)
      _count = 1;
    else if (payload.kvType == GstMIKEYKVType.Interval)
    _count = 2;
    else
      return null;

    auto _retval = new ubyte[][](_count);

    foreach (i, ref data; _retval)
      data = payload.kvData[i] ? payload.kvData[i][0 .. payload.kvLen[i]].dup : null;

    return _retval;
  }
}
