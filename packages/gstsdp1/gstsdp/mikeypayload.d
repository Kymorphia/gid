/// Module for [MIKEYPayload] class
module gstsdp.mikeypayload;

import gid.gid;
import gobject.boxed;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload_spparam;
import gstsdp.types;

/**
    Hold the common fields for all payloads
*/
class MIKEYPayload : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_mikey_payload_get_type != &gidSymbolNotFound ? gst_mikey_payload_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MIKEYPayload self()
  {
    return this;
  }

  /**
      Get `type` field.
      Returns: the payload type
  */
  @property gstsdp.types.MIKEYPayloadType type()
  {
    return cast(gstsdp.types.MIKEYPayloadType)(cast(GstMIKEYPayload*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the payload type
  */
  @property void type(gstsdp.types.MIKEYPayloadType propval)
  {
    (cast(GstMIKEYPayload*)this._cPtr).type = cast(GstMIKEYPayloadType)propval;
  }

  /**
      Get `len` field.
      Returns: length of the payload
  */
  @property uint len()
  {
    return (cast(GstMIKEYPayload*)this._cPtr).len;
  }

  /**
      Set `len` field.
      Params:
        propval = length of the payload
  */
  @property void len(uint propval)
  {
    (cast(GstMIKEYPayload*)this._cPtr).len = propval;
  }

  /**
      Make a new #GstMIKEYPayload with type.
  
      Params:
        type = a #GstMIKEYPayloadType
      Returns: a new #GstMIKEYPayload or null on failure.
  */
  this(gstsdp.types.MIKEYPayloadType type)
  {
    GstMIKEYPayload* _cretval;
    _cretval = gst_mikey_payload_new(type);
    this(_cretval, Yes.Take);
  }

  /**
      Add a new sub payload to payload.
  
      Params:
        newpay = a #GstMIKEYPayload to add
      Returns: true on success.
  */
  bool kemacAddSub(gstsdp.mikeypayload.MIKEYPayload newpay)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_payload_kemac_add_sub(cast(GstMIKEYPayload*)this._cPtr, newpay ? cast(GstMIKEYPayload*)newpay._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Get the number of sub payloads of payload. payload should be of type
      `GST_MIKEY_PT_KEMAC`.
      Returns: the number of sub payloads in payload
  */
  uint kemacGetNSub()
  {
    uint _retval;
    _retval = gst_mikey_payload_kemac_get_n_sub(cast(const(GstMIKEYPayload)*)this._cPtr);
    return _retval;
  }

  /**
      Get the sub payload of payload at idx. payload should be of type
      `GST_MIKEY_PT_KEMAC`.
  
      Params:
        idx = an index
      Returns: the #GstMIKEYPayload at idx.
  */
  gstsdp.mikeypayload.MIKEYPayload kemacGetSub(uint idx)
  {
    const(GstMIKEYPayload)* _cretval;
    _cretval = gst_mikey_payload_kemac_get_sub(cast(const(GstMIKEYPayload)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.mikeypayload.MIKEYPayload(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Remove the sub payload at idx in payload.
  
      Params:
        idx = the index to remove
      Returns: true on success.
  */
  bool kemacRemoveSub(uint idx)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_payload_kemac_remove_sub(cast(GstMIKEYPayload*)this._cPtr, idx);
    return _retval;
  }

  /**
      Set the KEMAC parameters. payload should point to a `GST_MIKEY_PT_KEMAC`
      payload.
  
      Params:
        encAlg = the #GstMIKEYEncAlg
        macAlg = a #GstMIKEYMacAlg
      Returns: true on success
  */
  bool kemacSet(gstsdp.types.MIKEYEncAlg encAlg, gstsdp.types.MIKEYMacAlg macAlg)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_payload_kemac_set(cast(GstMIKEYPayload*)this._cPtr, encAlg, macAlg);
    return _retval;
  }

  /**
      Set the key validity period in the `GST_MIKEY_PT_KEY_DATA` payload.
  
      Params:
        vfData = the Valid From data
        vtData = the Valid To data
      Returns: true on success
  */
  bool keyDataSetInterval(ubyte[] vfData, ubyte[] vtData)
  {
    bool _retval;
    ubyte _vfLen;
    if (vfData)
      _vfLen = cast(ubyte)vfData.length;

    auto _vfData = cast(const(ubyte)*)vfData.ptr;
    ubyte _vtLen;
    if (vtData)
      _vtLen = cast(ubyte)vtData.length;

    auto _vtData = cast(const(ubyte)*)vtData.ptr;
    _retval = cast(bool)gst_mikey_payload_key_data_set_interval(cast(GstMIKEYPayload*)this._cPtr, _vfLen, _vfData, _vtLen, _vtData);
    return _retval;
  }

  /**
      Set key_len bytes of key_data of type key_type as the key for the
      `GST_MIKEY_PT_KEY_DATA` payload.
  
      Params:
        keyType = a #GstMIKEYKeyDataType
        keyData = the key of type key_type
      Returns: true on success
  */
  bool keyDataSetKey(gstsdp.types.MIKEYKeyDataType keyType, ubyte[] keyData)
  {
    bool _retval;
    ushort _keyLen;
    if (keyData)
      _keyLen = cast(ushort)keyData.length;

    auto _keyData = cast(const(ubyte)*)keyData.ptr;
    _retval = cast(bool)gst_mikey_payload_key_data_set_key(cast(GstMIKEYPayload*)this._cPtr, keyType, _keyLen, _keyData);
    return _retval;
  }

  /**
      Set the salt key data. If salt_len is 0 and salt_data is null, the
      salt data will be removed.
  
      Params:
        saltData = the salt
      Returns: true on success
  */
  bool keyDataSetSalt(ubyte[] saltData = null)
  {
    bool _retval;
    ushort _saltLen;
    if (saltData)
      _saltLen = cast(ushort)saltData.length;

    auto _saltData = cast(const(ubyte)*)saltData.ptr;
    _retval = cast(bool)gst_mikey_payload_key_data_set_salt(cast(GstMIKEYPayload*)this._cPtr, _saltLen, _saltData);
    return _retval;
  }

  /**
      Set the SPI/MKI validity in the `GST_MIKEY_PT_KEY_DATA` payload.
  
      Params:
        spiData = the SPI/MKI data
      Returns: true on success
  */
  bool keyDataSetSpi(ubyte[] spiData)
  {
    bool _retval;
    ubyte _spiLen;
    if (spiData)
      _spiLen = cast(ubyte)spiData.length;

    auto _spiData = cast(const(ubyte)*)spiData.ptr;
    _retval = cast(bool)gst_mikey_payload_key_data_set_spi(cast(GstMIKEYPayload*)this._cPtr, _spiLen, _spiData);
    return _retval;
  }

  /**
      Set the PKE values in payload. payload must be of type
      `GST_MIKEY_PT_PKE`.
  
      Params:
        C = envelope key cache indicator
        data = the encrypted envelope key
      Returns: true on success
  */
  bool pkeSet(gstsdp.types.MIKEYCacheType C, ubyte[] data)
  {
    bool _retval;
    ushort _dataLen;
    if (data)
      _dataLen = cast(ushort)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_mikey_payload_pke_set(cast(GstMIKEYPayload*)this._cPtr, C, _dataLen, _data);
    return _retval;
  }

  /**
      Set the random values in a `GST_MIKEY_PT_RAND` payload.
  
      Params:
        rand = random values
      Returns: true on success
  */
  bool randSet(ubyte[] rand)
  {
    bool _retval;
    ubyte _len;
    if (rand)
      _len = cast(ubyte)rand.length;

    auto _rand = cast(const(ubyte)*)rand.ptr;
    _retval = cast(bool)gst_mikey_payload_rand_set(cast(GstMIKEYPayload*)this._cPtr, _len, _rand);
    return _retval;
  }

  /**
      Add a new parameter to the `GST_MIKEY_PT_SP` payload with type, len
      and val.
  
      Params:
        type = a type
        val = len bytes of data
      Returns: true on success
  */
  bool spAddParam(ubyte type, ubyte[] val)
  {
    bool _retval;
    ubyte _len;
    if (val)
      _len = cast(ubyte)val.length;

    auto _val = cast(const(ubyte)*)val.ptr;
    _retval = cast(bool)gst_mikey_payload_sp_add_param(cast(GstMIKEYPayload*)this._cPtr, type, _len, _val);
    return _retval;
  }

  /**
      Get the number of security policy parameters in a `GST_MIKEY_PT_SP`
      payload.
      Returns: the number of parameters in payload
  */
  uint spGetNParams()
  {
    uint _retval;
    _retval = gst_mikey_payload_sp_get_n_params(cast(const(GstMIKEYPayload)*)this._cPtr);
    return _retval;
  }

  /**
      Get the Security Policy parameter in a `GST_MIKEY_PT_SP` payload
      at idx.
  
      Params:
        idx = an index
      Returns: the #GstMIKEYPayloadSPParam at idx in payload
  */
  gstsdp.mikeypayload_spparam.MIKEYPayloadSPParam spGetParam(uint idx)
  {
    const(GstMIKEYPayloadSPParam)* _cretval;
    _cretval = gst_mikey_payload_sp_get_param(cast(const(GstMIKEYPayload)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.mikeypayload_spparam.MIKEYPayloadSPParam(cast(GstMIKEYPayloadSPParam*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Remove the Security Policy parameters from a `GST_MIKEY_PT_SP`
      payload at idx.
  
      Params:
        idx = an index
      Returns: true on success
  */
  bool spRemoveParam(uint idx)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_payload_sp_remove_param(cast(GstMIKEYPayload*)this._cPtr, idx);
    return _retval;
  }

  /**
      Set the Security Policy parameters for payload.
  
      Params:
        policy = the policy number
        proto = a #GstMIKEYSecProto
      Returns: true on success
  */
  bool spSet(uint policy, gstsdp.types.MIKEYSecProto proto)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_payload_sp_set(cast(GstMIKEYPayload*)this._cPtr, policy, proto);
    return _retval;
  }
}
