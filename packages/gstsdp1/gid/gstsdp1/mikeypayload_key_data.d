/// Module for [MIKEYPayloadKeyData] class
module gid.gstsdp1.mikeypayload_key_data;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.mikeypayload;
import gid.gstsdp1.types;

/**
    The Key data payload contains key material. It should be added as sub
    payload to the KEMAC.
*/
@gidGir("MIKEYPayloadKeyData")
class MIKEYPayloadKeyData : StructWrap!(GstMIKEYPayloadKeyData)
{
  /**
      Create a `mikeypayload_key_data.MIKEYPayloadKeyData` wrap type.
      Params:
        keyType = the #GstMIKEYKeyDataType of @key_data
        kvType = the Key Validity type
  */
  this(gid.gstsdp1.types.MIKEYKeyDataType keyType = gid.gstsdp1.types.MIKEYKeyDataType.init, gid.gstsdp1.types.MIKEYKVType kvType = gid.gstsdp1.types.MIKEYKVType.init) nothrow
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
  @property gid.gstsdp1.mikeypayload.MIKEYPayload pt() nothrow
  {
    return cToD!(gid.gstsdp1.mikeypayload.MIKEYPayload)(cast(void*)&(cast(GstMIKEYPayloadKeyData*)this._cPtr).pt);
  }

  /**
      Get `keyType` field.
      Returns: the #GstMIKEYKeyDataType of @key_data
  */
  @property gid.gstsdp1.types.MIKEYKeyDataType keyType() nothrow
  {
    return cast(gid.gstsdp1.types.MIKEYKeyDataType)(cast(GstMIKEYPayloadKeyData*)this._cPtr).keyType;
  }

  /**
      Set `keyType` field.
      Params:
        propval = the #GstMIKEYKeyDataType of @key_data
  */
  @property void keyType(gid.gstsdp1.types.MIKEYKeyDataType propval) nothrow
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
  @property gid.gstsdp1.types.MIKEYKVType kvType() nothrow
  {
    return cast(gid.gstsdp1.types.MIKEYKVType)(cast(GstMIKEYPayloadKeyData*)this._cPtr).kvType;
  }

  /**
      Set `kvType` field.
      Params:
        propval = the Key Validity type
  */
  @property void kvType(gid.gstsdp1.types.MIKEYKVType propval) nothrow
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
  [gid.gstsdp1.types.MIKEYKVType.Null], the SPI/MKI for [gid.gstsdp1.types.MIKEYKVType.Spi] or the valid from and valid
  to values for [gid.gstsdp1.types.MIKEYKVType.Interval]
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
