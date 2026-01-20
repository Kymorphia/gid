/// Module for [MIKEYMessage] class
module gstsdp.mikeymessage;

import gid.gid;
import glib.bytes;
import glib.error;
import gobject.boxed;
import gst.caps;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeypayload;
import gstsdp.types;

/**
    Structure holding the information of the MIKEY message
*/
class MIKEYMessage : gobject.boxed.Boxed
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
    return cast(void function())gst_mikey_message_get_type != &gidSymbolNotFound ? gst_mikey_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override MIKEYMessage self()
  {
    return this;
  }

  /**
      Get `version_` field.
      Returns: the version
  */
  @property ubyte version_()
  {
    return (cast(GstMIKEYMessage*)this._cPtr).version_;
  }

  /**
      Set `version_` field.
      Params:
        propval = the version
  */
  @property void version_(ubyte propval)
  {
    (cast(GstMIKEYMessage*)this._cPtr).version_ = propval;
  }

  /**
      Get `type` field.
      Returns: the #GstMIKEYType message type
  */
  @property gstsdp.types.MIKEYType type()
  {
    return cast(gstsdp.types.MIKEYType)(cast(GstMIKEYMessage*)this._cPtr).type;
  }

  /**
      Set `type` field.
      Params:
        propval = the #GstMIKEYType message type
  */
  @property void type(gstsdp.types.MIKEYType propval)
  {
    (cast(GstMIKEYMessage*)this._cPtr).type = cast(GstMIKEYType)propval;
  }

  /**
      Get `V` field.
      Returns: verify flag
  */
  @property bool V()
  {
    return cast(bool)(cast(GstMIKEYMessage*)this._cPtr).V;
  }

  /**
      Set `V` field.
      Params:
        propval = verify flag
  */
  @property void V(bool propval)
  {
    (cast(GstMIKEYMessage*)this._cPtr).V = propval;
  }

  /**
      Get `prfFunc` field.
      Returns: a #GstMIKEYPRFFunc
  */
  @property gstsdp.types.MIKEYPRFFunc prfFunc()
  {
    return cast(gstsdp.types.MIKEYPRFFunc)(cast(GstMIKEYMessage*)this._cPtr).prfFunc;
  }

  /**
      Set `prfFunc` field.
      Params:
        propval = a #GstMIKEYPRFFunc
  */
  @property void prfFunc(gstsdp.types.MIKEYPRFFunc propval)
  {
    (cast(GstMIKEYMessage*)this._cPtr).prfFunc = cast(GstMIKEYPRFFunc)propval;
  }

  /**
      Get `CSBId` field.
      Returns: Identifies the Crypto Session Bundle
  */
  @property uint CSBId()
  {
    return (cast(GstMIKEYMessage*)this._cPtr).CSBId;
  }

  /**
      Set `CSBId` field.
      Params:
        propval = Identifies the Crypto Session Bundle
  */
  @property void CSBId(uint propval)
  {
    (cast(GstMIKEYMessage*)this._cPtr).CSBId = propval;
  }

  /**
      Get `mapType` field.
      Returns: a #GstMIKEYMapType
  */
  @property gstsdp.types.MIKEYMapType mapType()
  {
    return cast(gstsdp.types.MIKEYMapType)(cast(GstMIKEYMessage*)this._cPtr).mapType;
  }

  /**
      Set `mapType` field.
      Params:
        propval = a #GstMIKEYMapType
  */
  @property void mapType(gstsdp.types.MIKEYMapType propval)
  {
    (cast(GstMIKEYMessage*)this._cPtr).mapType = cast(GstMIKEYMapType)propval;
  }

  /**
      Make a new MIKEY message.
      Returns: a new #GstMIKEYMessage on success
  */
  this()
  {
    GstMIKEYMessage* _cretval;
    _cretval = gst_mikey_message_new();
    this(_cretval, Yes.Take);
  }

  /**
      Make a new #GstMIKEYMessage from bytes.
  
      Params:
        bytes = a #GBytes
        info = a #GstMIKEYDecryptInfo
      Returns: a new #GstMIKEYMessage
      Throws: [ErrorWrap]
  */
  static gstsdp.mikeymessage.MIKEYMessage newFromBytes(glib.bytes.Bytes bytes, gstsdp.types.MIKEYDecryptInfo info)
  {
    GstMIKEYMessage* _cretval;
    GError *_err;
    _cretval = gst_mikey_message_new_from_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, info, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gstsdp.mikeymessage.MIKEYMessage(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Makes mikey message including:
       $(LIST
          * Security Policy Payload
          * Key Data Transport Payload
          * Key Data Sub-Payload
       )
  
      Params:
        caps = a #GstCaps, including SRTP parameters (srtp/srtcp cipher, authorization, key data)
      Returns: a #GstMIKEYMessage,
        or null if there is no srtp information in the caps.
  */
  static gstsdp.mikeymessage.MIKEYMessage newFromCaps(gst.caps.Caps caps)
  {
    GstMIKEYMessage* _cretval;
    _cretval = gst_mikey_message_new_from_caps(caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    auto _retval = _cretval ? new gstsdp.mikeymessage.MIKEYMessage(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parse size bytes from data into a #GstMIKEYMessage. info contains the
      parameters to decrypt and verify the data.
  
      Params:
        data = bytes to read
        info = #GstMIKEYDecryptInfo
      Returns: a #GstMIKEYMessage on success or null when parsing failed and
        error will be set.
      Throws: [ErrorWrap]
  */
  static gstsdp.mikeymessage.MIKEYMessage newFromData(ubyte[] data, gstsdp.types.MIKEYDecryptInfo info)
  {
    GstMIKEYMessage* _cretval;
    size_t _size;
    if (data)
      _size = cast(size_t)data.length;

    auto _data = cast(const(void)*)data.ptr;
    GError *_err;
    _cretval = gst_mikey_message_new_from_data(_data, _size, info, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gstsdp.mikeymessage.MIKEYMessage(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Add a Crypto policy for SRTP to msg.
  
      Params:
        policy = The security policy applied for the stream with ssrc
        ssrc = the SSRC that must be used for the stream
        roc = current rollover counter
      Returns: true on success
  */
  bool addCsSrtp(ubyte policy, uint ssrc, uint roc)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_add_cs_srtp(cast(GstMIKEYMessage*)this._cPtr, policy, ssrc, roc);
    return _retval;
  }

  /**
      Add a new payload to msg.
  
      Params:
        payload = a #GstMIKEYPayload
      Returns: true on success
  */
  bool addPayload(gstsdp.mikeypayload.MIKEYPayload payload)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_add_payload(cast(GstMIKEYMessage*)this._cPtr, payload ? cast(GstMIKEYPayload*)payload._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Add a new PKE payload to msg with the given parameters.
  
      Params:
        C = envelope key cache indicator
        data = the encrypted envelope key
      Returns: true on success
  */
  bool addPke(gstsdp.types.MIKEYCacheType C, ubyte[] data)
  {
    bool _retval;
    ushort _dataLen;
    if (data)
      _dataLen = cast(ushort)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_mikey_message_add_pke(cast(GstMIKEYMessage*)this._cPtr, C, _dataLen, _data);
    return _retval;
  }

  /**
      Add a new RAND payload to msg with the given parameters.
  
      Params:
        rand = random data
      Returns: true on success
  */
  bool addRand(ubyte[] rand)
  {
    bool _retval;
    ubyte _len;
    if (rand)
      _len = cast(ubyte)rand.length;

    auto _rand = cast(const(ubyte)*)rand.ptr;
    _retval = cast(bool)gst_mikey_message_add_rand(cast(GstMIKEYMessage*)this._cPtr, _len, _rand);
    return _retval;
  }

  /**
      Add a new RAND payload to msg with len random bytes.
  
      Params:
        len = length
      Returns: true on success
  */
  bool addRandLen(ubyte len)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_add_rand_len(cast(GstMIKEYMessage*)this._cPtr, len);
    return _retval;
  }

  /**
      Add a new T payload to msg that contains the current time
      in NTP-UTC format.
      Returns: true on success
  */
  bool addTNowNtpUtc()
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_add_t_now_ntp_utc(cast(GstMIKEYMessage*)this._cPtr);
    return _retval;
  }

  /** */
  string base64Encode()
  {
    char* _cretval;
    _cretval = gst_mikey_message_base64_encode(cast(GstMIKEYMessage*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Find the nth occurrence of the payload with type in msg.
  
      Params:
        type = a #GstMIKEYPayloadType
        nth = payload to find
      Returns: the nth #GstMIKEYPayload of type.
  */
  gstsdp.mikeypayload.MIKEYPayload findPayload(gstsdp.types.MIKEYPayloadType type, uint nth)
  {
    const(GstMIKEYPayload)* _cretval;
    _cretval = gst_mikey_message_find_payload(cast(const(GstMIKEYMessage)*)this._cPtr, type, nth);
    auto _retval = _cretval ? new gstsdp.mikeypayload.MIKEYPayload(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the policy information of msg at idx.
  
      Params:
        idx = an index
      Returns: a #GstMIKEYMapSRTP
  */
  gstsdp.types.MIKEYMapSRTP getCsSrtp(uint idx)
  {
    const(GstMIKEYMapSRTP)* _cretval;
    _cretval = gst_mikey_message_get_cs_srtp(cast(const(GstMIKEYMessage)*)this._cPtr, idx);
    gstsdp.types.MIKEYMapSRTP _retval;
    if (_cretval)
      _retval = *cast(gstsdp.types.MIKEYMapSRTP*)_cretval;
    return _retval;
  }

  /**
      Get the number of crypto sessions in msg.
      Returns: the number of crypto sessions
  */
  uint getNCs()
  {
    uint _retval;
    _retval = gst_mikey_message_get_n_cs(cast(const(GstMIKEYMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of payloads in msg.
      Returns: the number of payloads in msg
  */
  uint getNPayloads()
  {
    uint _retval;
    _retval = gst_mikey_message_get_n_payloads(cast(const(GstMIKEYMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Get the #GstMIKEYPayload at idx in msg
  
      Params:
        idx = an index
      Returns: the #GstMIKEYPayload at idx. The payload
        remains valid for as long as it is part of msg.
  */
  gstsdp.mikeypayload.MIKEYPayload getPayload(uint idx)
  {
    const(GstMIKEYPayload)* _cretval;
    _cretval = gst_mikey_message_get_payload(cast(const(GstMIKEYMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.mikeypayload.MIKEYPayload(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Insert a Crypto Session map for SRTP in msg at idx
      
      When idx is -1, the policy will be appended.
  
      Params:
        idx = the index to insert at
        map = the map info
      Returns: true on success
  */
  bool insertCsSrtp(int idx, gstsdp.types.MIKEYMapSRTP map)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_insert_cs_srtp(cast(GstMIKEYMessage*)this._cPtr, idx, &map);
    return _retval;
  }

  /**
      Insert the payload at index idx in msg. If idx is -1, the payload
      will be appended to msg.
  
      Params:
        idx = an index
        payload = a #GstMIKEYPayload
      Returns: true on success
  */
  bool insertPayload(uint idx, gstsdp.mikeypayload.MIKEYPayload payload)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_insert_payload(cast(GstMIKEYMessage*)this._cPtr, idx, payload ? cast(GstMIKEYPayload*)payload._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Remove the SRTP policy at idx.
  
      Params:
        idx = the index to remove
      Returns: true on success
  */
  bool removeCsSrtp(int idx)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_remove_cs_srtp(cast(GstMIKEYMessage*)this._cPtr, idx);
    return _retval;
  }

  /**
      Remove the payload in msg at idx
  
      Params:
        idx = an index
      Returns: true on success
  */
  bool removePayload(uint idx)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_remove_payload(cast(GstMIKEYMessage*)this._cPtr, idx);
    return _retval;
  }

  /**
      Replace a Crypto Session map for SRTP in msg at idx with map.
  
      Params:
        idx = the index to insert at
        map = the map info
      Returns: true on success
  */
  bool replaceCsSrtp(int idx, gstsdp.types.MIKEYMapSRTP map)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_replace_cs_srtp(cast(GstMIKEYMessage*)this._cPtr, idx, &map);
    return _retval;
  }

  /**
      Replace the payload at idx in msg with payload.
  
      Params:
        idx = an index
        payload = a #GstMIKEYPayload
      Returns: true on success
  */
  bool replacePayload(uint idx, gstsdp.mikeypayload.MIKEYPayload payload)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_replace_payload(cast(GstMIKEYMessage*)this._cPtr, idx, payload ? cast(GstMIKEYPayload*)payload._cPtr(Yes.Dup) : null);
    return _retval;
  }

  /**
      Set the information in msg.
  
      Params:
        version_ = a version
        type = a #GstMIKEYType
        V = verify flag
        prfFunc = the #GstMIKEYPRFFunc function to use
        CSBId = the Crypto Session Bundle id
        mapType = the #GstMIKEYMapType
      Returns: true on success
  */
  bool setInfo(ubyte version_, gstsdp.types.MIKEYType type, bool V, gstsdp.types.MIKEYPRFFunc prfFunc, uint CSBId, gstsdp.types.MIKEYMapType mapType)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_set_info(cast(GstMIKEYMessage*)this._cPtr, version_, type, V, prfFunc, CSBId, mapType);
    return _retval;
  }

  /**
      Convert msg to a #GBytes.
  
      Params:
        info = a #GstMIKEYEncryptInfo
      Returns: a new #GBytes for msg.
      Throws: [ErrorWrap]
  */
  glib.bytes.Bytes toBytes(gstsdp.types.MIKEYEncryptInfo info)
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = gst_mikey_message_to_bytes(cast(GstMIKEYMessage*)this._cPtr, info, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /** */
  bool toCaps(gst.caps.Caps caps)
  {
    bool _retval;
    _retval = cast(bool)gst_mikey_message_to_caps(cast(const(GstMIKEYMessage)*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    return _retval;
  }
}
