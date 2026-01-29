/// Module for [SDPMessage] class
module gstsdp.sdpmessage;

import gid.gid;
import gobject.boxed;
import gst.caps;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeymessage;
import gstsdp.sdpattribute;
import gstsdp.sdpbandwidth;
import gstsdp.sdpconnection;
import gstsdp.sdpkey;
import gstsdp.sdpmedia;
import gstsdp.sdporigin;
import gstsdp.sdptime;
import gstsdp.sdpzone;
import gstsdp.types;

/**
    The GstSDPMessage helper functions makes it easy to parse and create SDP
    messages.
*/
class SDPMessage : gobject.boxed.Boxed
{

  /**
      Create a `sdpmessage.SDPMessage` boxed type.
      Params:
        version_ = the protocol version
        sessionName = session name
        information = session information
        uri = URI of description
  */
  this(string version_ = string.init, string sessionName = string.init, string information = string.init, string uri = string.init)
  {
    super(gMalloc(GstSDPMessage.sizeof), Yes.Take);
    this.version_ = version_;
    this.sessionName = sessionName;
    this.information = information;
    this.uri = uri;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_sdp_message_get_type != &gidSymbolNotFound ? gst_sdp_message_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override SDPMessage self()
  {
    return this;
  }

  /**
      Get `version_` field.
      Returns: the protocol version
  */
  @property string version_()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).version_);
  }

  /**
      Set `version_` field.
      Params:
        propval = the protocol version
  */
  @property void version_(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).version_);
    dToC(propval, cast(void*)&(cast(GstSDPMessage*)this._cPtr).version_);
  }

  /**
      Get `origin` field.
      Returns: owner/creator and session identifier
  */
  @property gstsdp.sdporigin.SDPOrigin origin()
  {
    return new gstsdp.sdporigin.SDPOrigin(cast(GstSDPOrigin*)&(cast(GstSDPMessage*)this._cPtr).origin, No.Take);
  }

  /**
      Get `sessionName` field.
      Returns: session name
  */
  @property string sessionName()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).sessionName);
  }

  /**
      Set `sessionName` field.
      Params:
        propval = session name
  */
  @property void sessionName(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).sessionName);
    dToC(propval, cast(void*)&(cast(GstSDPMessage*)this._cPtr).sessionName);
  }

  /**
      Get `information` field.
      Returns: session information
  */
  @property string information()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).information);
  }

  /**
      Set `information` field.
      Params:
        propval = session information
  */
  @property void information(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).information);
    dToC(propval, cast(void*)&(cast(GstSDPMessage*)this._cPtr).information);
  }

  /**
      Get `uri` field.
      Returns: URI of description
  */
  @property string uri()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).uri);
  }

  /**
      Set `uri` field.
      Params:
        propval = URI of description
  */
  @property void uri(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).uri);
    dToC(propval, cast(void*)&(cast(GstSDPMessage*)this._cPtr).uri);
  }

  /**
      Get `connection` field.
      Returns: connection information for the session
  */
  @property gstsdp.sdpconnection.SDPConnection connection()
  {
    return new gstsdp.sdpconnection.SDPConnection(cast(GstSDPConnection*)&(cast(GstSDPMessage*)this._cPtr).connection, No.Take);
  }

  /**
      Get `key` field.
      Returns: encryption key
  */
  @property gstsdp.sdpkey.SDPKey key()
  {
    return new gstsdp.sdpkey.SDPKey(cast(GstSDPKey*)&(cast(GstSDPMessage*)this._cPtr).key, No.Take);
  }

  /**
      Add the attribute with key and value to msg.
  
      Params:
        key = the key
        value = the value
      Returns: GST_SDP_OK.
  */
  gstsdp.types.SDPResult addAttribute(string key, string value = null)
  {
    GstSDPResult _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _cretval = gst_sdp_message_add_attribute(cast(GstSDPMessage*)this._cPtr, _key, _value);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add the specified bandwidth information to msg.
  
      Params:
        bwtype = the bandwidth modifier type
        bandwidth = the bandwidth in kilobits per second
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addBandwidth(string bwtype, uint bandwidth)
  {
    GstSDPResult _cretval;
    const(char)* _bwtype = bwtype.toCString(No.Alloc);
    _cretval = gst_sdp_message_add_bandwidth(cast(GstSDPMessage*)this._cPtr, _bwtype, bandwidth);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add email to the list of emails in msg.
  
      Params:
        email = an email
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addEmail(string email)
  {
    GstSDPResult _cretval;
    const(char)* _email = email.toCString(No.Alloc);
    _cretval = gst_sdp_message_add_email(cast(GstSDPMessage*)this._cPtr, _email);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Adds media to the array of medias in msg. This function takes ownership of
      the contents of media so that media will have to be reinitialized with
      [gstsdp.sdpmedia.SDPMedia.init_] before it can be used again.
  
      Params:
        media = a #GstSDPMedia to add
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addMedia(gstsdp.sdpmedia.SDPMedia media)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_add_media(cast(GstSDPMessage*)this._cPtr, media ? cast(GstSDPMedia*)media._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add phone to the list of phones in msg.
  
      Params:
        phone = a phone
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addPhone(string phone)
  {
    GstSDPResult _cretval;
    const(char)* _phone = phone.toCString(No.Alloc);
    _cretval = gst_sdp_message_add_phone(cast(GstSDPMessage*)this._cPtr, _phone);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add time information start and stop to msg.
  
      Params:
        start = the start time
        stop = the stop time
        repeat = the repeat times
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addTime(string start, string stop, string[] repeat)
  {
    GstSDPResult _cretval;
    const(char)* _start = start.toCString(No.Alloc);
    const(char)* _stop = stop.toCString(No.Alloc);
    char*[] _tmprepeat;
    foreach (s; repeat)
      _tmprepeat ~= s.toCString(No.Alloc);
    _tmprepeat ~= null;
    const(char*)* _repeat = _tmprepeat.ptr;

    _cretval = gst_sdp_message_add_time(cast(GstSDPMessage*)this._cPtr, _start, _stop, _repeat);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add time zone information to msg.
  
      Params:
        adjTime = the NTP time that a time zone adjustment happens
        typedTime = the offset from the time when the session was first scheduled
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addZone(string adjTime, string typedTime)
  {
    GstSDPResult _cretval;
    const(char)* _adjTime = adjTime.toCString(No.Alloc);
    const(char)* _typedTime = typedTime.toCString(No.Alloc);
    _cretval = gst_sdp_message_add_zone(cast(GstSDPMessage*)this._cPtr, _adjTime, _typedTime);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Convert the contents of msg to a text string.
      Returns: A dynamically allocated string representing the SDP description.
  */
  string asText()
  {
    char* _cretval;
    _cretval = gst_sdp_message_as_text(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the number of attributes in msg.
      Returns: the number of attributes in msg.
  */
  uint attributesLen()
  {
    uint _retval;
    _retval = gst_sdp_message_attributes_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Mapping of attributes of #GstSDPMessage to #GstCaps
  
      Params:
        caps = a #GstCaps
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult attributesToCaps(gst.caps.Caps caps)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_attributes_to_caps(cast(const(GstSDPMessage)*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of bandwidth information in msg.
      Returns: the number of bandwidth information in msg.
  */
  uint bandwidthsLen()
  {
    uint _retval;
    _retval = gst_sdp_message_bandwidths_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Allocate a new copy of msg and store the result in copy. The value in
      copy should be release with gst_sdp_message_free function.
  
      Params:
        copy = pointer to new #GstSDPMessage
      Returns: a #GstSDPResult
  */
  gstsdp.types.SDPResult copy(out gstsdp.sdpmessage.SDPMessage copy)
  {
    GstSDPResult _cretval;
    GstSDPMessage* _copy;
    _cretval = gst_sdp_message_copy(cast(const(GstSDPMessage)*)this._cPtr, &_copy);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    copy = new gstsdp.sdpmessage.SDPMessage(cast(void*)_copy, Yes.Take);
    return _retval;
  }

  /**
      Dump the parsed contents of msg to stdout.
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult dump()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_dump(cast(const(GstSDPMessage)*)this._cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of emails in msg.
      Returns: the number of emails in msg.
  */
  uint emailsLen()
  {
    uint _retval;
    _retval = gst_sdp_message_emails_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Get the attribute at position idx in msg.
  
      Params:
        idx = the index
      Returns: the #GstSDPAttribute at position idx.
  */
  gstsdp.sdpattribute.SDPAttribute getAttribute(uint idx)
  {
    const(GstSDPAttribute)* _cretval;
    _cretval = gst_sdp_message_get_attribute(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdpattribute.SDPAttribute(cast(GstSDPAttribute*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the first attribute with key key in msg.
  
      Params:
        key = the key
      Returns: the attribute value of the first attribute with key.
  */
  string getAttributeVal(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_sdp_message_get_attribute_val(cast(const(GstSDPMessage)*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the nth attribute with key key in msg.
  
      Params:
        key = the key
        nth = the index
      Returns: the attribute value of the nth attribute with key.
  */
  string getAttributeValN(string key, uint nth)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_sdp_message_get_attribute_val_n(cast(const(GstSDPMessage)*)this._cPtr, _key, nth);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the bandwidth at index idx from msg.
  
      Params:
        idx = the bandwidth index
      Returns: a #GstSDPBandwidth.
  */
  gstsdp.sdpbandwidth.SDPBandwidth getBandwidth(uint idx)
  {
    const(GstSDPBandwidth)* _cretval;
    _cretval = gst_sdp_message_get_bandwidth(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdpbandwidth.SDPBandwidth(cast(GstSDPBandwidth*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the connection of msg.
      Returns: a #GstSDPConnection. The result remains valid as long as msg is valid.
  */
  gstsdp.sdpconnection.SDPConnection getConnection()
  {
    const(GstSDPConnection)* _cretval;
    _cretval = gst_sdp_message_get_connection(cast(const(GstSDPMessage)*)this._cPtr);
    auto _retval = _cretval ? new gstsdp.sdpconnection.SDPConnection(cast(GstSDPConnection*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the email with number idx from msg.
  
      Params:
        idx = an email index
      Returns: the email at position idx.
  */
  string getEmail(uint idx)
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_email(cast(const(GstSDPMessage)*)this._cPtr, idx);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the information in msg.
      Returns: a #GstSDPResult.
  */
  string getInformation()
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_information(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the encryption information from msg.
      Returns: a #GstSDPKey.
  */
  gstsdp.sdpkey.SDPKey getKey()
  {
    const(GstSDPKey)* _cretval;
    _cretval = gst_sdp_message_get_key(cast(const(GstSDPMessage)*)this._cPtr);
    auto _retval = _cretval ? new gstsdp.sdpkey.SDPKey(cast(GstSDPKey*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the media description at index idx in msg.
  
      Params:
        idx = the index
      Returns: a #GstSDPMedia.
  */
  gstsdp.sdpmedia.SDPMedia getMedia(uint idx)
  {
    const(GstSDPMedia)* _cretval;
    _cretval = gst_sdp_message_get_media(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdpmedia.SDPMedia(cast(GstSDPMedia*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the origin of msg.
      Returns: a #GstSDPOrigin. The result remains valid as long as msg is valid.
  */
  gstsdp.sdporigin.SDPOrigin getOrigin()
  {
    const(GstSDPOrigin)* _cretval;
    _cretval = gst_sdp_message_get_origin(cast(const(GstSDPMessage)*)this._cPtr);
    auto _retval = _cretval ? new gstsdp.sdporigin.SDPOrigin(cast(GstSDPOrigin*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the phone with number idx from msg.
  
      Params:
        idx = a phone index
      Returns: the phone at position idx.
  */
  string getPhone(uint idx)
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_phone(cast(const(GstSDPMessage)*)this._cPtr, idx);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the session name in msg.
      Returns: a #GstSDPResult.
  */
  string getSessionName()
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_session_name(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get time information with index idx from msg.
  
      Params:
        idx = the time index
      Returns: a #GstSDPTime.
  */
  gstsdp.sdptime.SDPTime getTime(uint idx)
  {
    const(GstSDPTime)* _cretval;
    _cretval = gst_sdp_message_get_time(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdptime.SDPTime(cast(GstSDPTime*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the URI in msg.
      Returns: a #GstSDPResult.
  */
  string getUri()
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_uri(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the version in msg.
      Returns: a #GstSDPResult.
  */
  string getVersion()
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_version(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get time zone information with index idx from msg.
  
      Params:
        idx = the zone index
      Returns: a #GstSDPZone.
  */
  gstsdp.sdpzone.SDPZone getZone(uint idx)
  {
    const(GstSDPZone)* _cretval;
    _cretval = gst_sdp_message_get_zone(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdpzone.SDPZone(cast(GstSDPZone*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Insert attribute into the array of attributes in msg
      at index idx.
      When -1 is given as idx, the attribute is inserted at the end.
  
      Params:
        idx = an index
        attr = a #GstSDPAttribute
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult insertAttribute(int idx, gstsdp.sdpattribute.SDPAttribute attr)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_attribute(cast(GstSDPMessage*)this._cPtr, idx, attr ? cast(GstSDPAttribute*)attr._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert bandwidth parameters into the array of bandwidths in msg
      at index idx.
      When -1 is given as idx, the bandwidth is inserted at the end.
  
      Params:
        idx = an index
        bw = the bandwidth
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult insertBandwidth(int idx, gstsdp.sdpbandwidth.SDPBandwidth bw)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_bandwidth(cast(GstSDPMessage*)this._cPtr, idx, bw ? cast(GstSDPBandwidth*)bw._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert email into the array of emails in msg at index idx.
      When -1 is given as idx, the email is inserted at the end.
  
      Params:
        idx = an index
        email = an email
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult insertEmail(int idx, string email)
  {
    GstSDPResult _cretval;
    const(char)* _email = email.toCString(No.Alloc);
    _cretval = gst_sdp_message_insert_email(cast(GstSDPMessage*)this._cPtr, idx, _email);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert phone into the array of phone numbers in msg at index idx.
      When -1 is given as idx, the phone is inserted at the end.
  
      Params:
        idx = a phone index
        phone = a phone
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult insertPhone(int idx, string phone)
  {
    GstSDPResult _cretval;
    const(char)* _phone = phone.toCString(No.Alloc);
    _cretval = gst_sdp_message_insert_phone(cast(GstSDPMessage*)this._cPtr, idx, _phone);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert time parameters into the array of times in msg
      at index idx.
      When -1 is given as idx, the times are inserted at the end.
  
      Params:
        idx = an index
        t = a #GstSDPTime
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult insertTime(int idx, gstsdp.sdptime.SDPTime t)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_time(cast(GstSDPMessage*)this._cPtr, idx, t ? cast(GstSDPTime*)t._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert zone parameters into the array of zones in msg
      at index idx.
      When -1 is given as idx, the zone is inserted at the end.
  
      Params:
        idx = an index
        zone = a #GstSDPZone
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult insertZone(int idx, gstsdp.sdpzone.SDPZone zone)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_zone(cast(GstSDPMessage*)this._cPtr, idx, zone ? cast(GstSDPZone*)zone._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of media descriptions in msg.
      Returns: the number of media descriptions in msg.
  */
  uint mediasLen()
  {
    uint _retval;
    _retval = gst_sdp_message_medias_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Creates a new #GstMIKEYMessage after parsing the key-mgmt attribute
      from a #GstSDPMessage.
  
      Params:
        mikey = pointer to new #GstMIKEYMessage
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult parseKeymgmt(out gstsdp.mikeymessage.MIKEYMessage mikey)
  {
    GstSDPResult _cretval;
    GstMIKEYMessage* _mikey;
    _cretval = gst_sdp_message_parse_keymgmt(cast(const(GstSDPMessage)*)this._cPtr, &_mikey);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    mikey = new gstsdp.mikeymessage.MIKEYMessage(cast(void*)_mikey, Yes.Take);
    return _retval;
  }

  /**
      Get the number of phones in msg.
      Returns: the number of phones in msg.
  */
  uint phonesLen()
  {
    uint _retval;
    _retval = gst_sdp_message_phones_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Remove the attribute in msg at index idx.
  
      Params:
        idx = the index
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult removeAttribute(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_attribute(cast(GstSDPMessage*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the bandwidth information in msg at index idx.
  
      Params:
        idx = the bandwidth index
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult removeBandwidth(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_bandwidth(cast(GstSDPMessage*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the email in msg at index idx.
  
      Params:
        idx = an email index
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult removeEmail(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_email(cast(GstSDPMessage*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the media at idx from the array of medias in msg if found.
  
      Params:
        idx = the media index
      Returns: #GST_SDP_OK when the specified media is found at idx and removed,
        #GST_SDP_EINVAL otherwise.
  */
  gstsdp.types.SDPResult removeMedia(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_media(cast(GstSDPMessage*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the phone number in msg at index idx.
  
      Params:
        idx = a phone index
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult removePhone(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_phone(cast(GstSDPMessage*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the time information in msg at index idx.
  
      Params:
        idx = the index
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult removeTime(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_time(cast(GstSDPMessage*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the zone information in msg at index idx.
  
      Params:
        idx = the index
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult removeZone(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_zone(cast(GstSDPMessage*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the attribute in msg at index idx with attr.
  
      Params:
        idx = the index
        attr = a #GstSDPAttribute
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult replaceAttribute(uint idx, gstsdp.sdpattribute.SDPAttribute attr)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_attribute(cast(GstSDPMessage*)this._cPtr, idx, attr ? cast(GstSDPAttribute*)attr._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the bandwidth information in msg at index idx with bw.
  
      Params:
        idx = the bandwidth index
        bw = the bandwidth
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult replaceBandwidth(uint idx, gstsdp.sdpbandwidth.SDPBandwidth bw)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_bandwidth(cast(GstSDPMessage*)this._cPtr, idx, bw ? cast(GstSDPBandwidth*)bw._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the email in msg at index idx with email.
  
      Params:
        idx = an email index
        email = an email
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult replaceEmail(uint idx, string email)
  {
    GstSDPResult _cretval;
    const(char)* _email = email.toCString(No.Alloc);
    _cretval = gst_sdp_message_replace_email(cast(GstSDPMessage*)this._cPtr, idx, _email);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the phone number in msg at index idx with phone.
  
      Params:
        idx = a phone index
        phone = a phone
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult replacePhone(uint idx, string phone)
  {
    GstSDPResult _cretval;
    const(char)* _phone = phone.toCString(No.Alloc);
    _cretval = gst_sdp_message_replace_phone(cast(GstSDPMessage*)this._cPtr, idx, _phone);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the time information in msg at index idx with `t`.
  
      Params:
        idx = the index
        t = a #GstSDPTime
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult replaceTime(uint idx, gstsdp.sdptime.SDPTime t)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_time(cast(GstSDPMessage*)this._cPtr, idx, t ? cast(GstSDPTime*)t._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the zone information in msg at index idx with zone.
  
      Params:
        idx = the index
        zone = a #GstSDPZone
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult replaceZone(uint idx, gstsdp.sdpzone.SDPZone zone)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_zone(cast(GstSDPMessage*)this._cPtr, idx, zone ? cast(GstSDPZone*)zone._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Configure the SDP connection in msg with the given parameters.
  
      Params:
        nettype = the type of network. "IN" is defined to have the meaning
          "Internet".
        addrtype = the type of address.
        address = the address
        ttl = the time to live of the address
        addrNumber = the number of layers
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult setConnection(string nettype, string addrtype, string address, uint ttl, uint addrNumber)
  {
    GstSDPResult _cretval;
    const(char)* _nettype = nettype.toCString(No.Alloc);
    const(char)* _addrtype = addrtype.toCString(No.Alloc);
    const(char)* _address = address.toCString(No.Alloc);
    _cretval = gst_sdp_message_set_connection(cast(GstSDPMessage*)this._cPtr, _nettype, _addrtype, _address, ttl, addrNumber);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the information in msg.
  
      Params:
        information = the information
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult setInformation(string information)
  {
    GstSDPResult _cretval;
    const(char)* _information = information.toCString(No.Alloc);
    _cretval = gst_sdp_message_set_information(cast(GstSDPMessage*)this._cPtr, _information);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Adds the encryption information to msg.
  
      Params:
        type = the encryption type
        data = the encryption data
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult setKey(string type, string data)
  {
    GstSDPResult _cretval;
    const(char)* _type = type.toCString(No.Alloc);
    const(char)* _data = data.toCString(No.Alloc);
    _cretval = gst_sdp_message_set_key(cast(GstSDPMessage*)this._cPtr, _type, _data);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Configure the SDP origin in msg with the given parameters.
  
      Params:
        username = the user name
        sessId = a session id
        sessVersion = a session version
        nettype = a network type
        addrtype = an address type
        addr = an address
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult setOrigin(string username, string sessId, string sessVersion, string nettype, string addrtype, string addr)
  {
    GstSDPResult _cretval;
    const(char)* _username = username.toCString(No.Alloc);
    const(char)* _sessId = sessId.toCString(No.Alloc);
    const(char)* _sessVersion = sessVersion.toCString(No.Alloc);
    const(char)* _nettype = nettype.toCString(No.Alloc);
    const(char)* _addrtype = addrtype.toCString(No.Alloc);
    const(char)* _addr = addr.toCString(No.Alloc);
    _cretval = gst_sdp_message_set_origin(cast(GstSDPMessage*)this._cPtr, _username, _sessId, _sessVersion, _nettype, _addrtype, _addr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the session name in msg.
  
      Params:
        sessionName = the session name
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult setSessionName(string sessionName)
  {
    GstSDPResult _cretval;
    const(char)* _sessionName = sessionName.toCString(No.Alloc);
    _cretval = gst_sdp_message_set_session_name(cast(GstSDPMessage*)this._cPtr, _sessionName);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the URI in msg.
  
      Params:
        uri = the URI
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult setUri(string uri)
  {
    GstSDPResult _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_sdp_message_set_uri(cast(GstSDPMessage*)this._cPtr, _uri);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the version in msg.
  
      Params:
        version_ = the version
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult setVersion(string version_)
  {
    GstSDPResult _cretval;
    const(char)* _version_ = version_.toCString(No.Alloc);
    _cretval = gst_sdp_message_set_version(cast(GstSDPMessage*)this._cPtr, _version_);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of time information entries in msg.
      Returns: the number of time information entries in msg.
  */
  uint timesLen()
  {
    uint _retval;
    _retval = gst_sdp_message_times_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Free all resources allocated in msg. msg should not be used anymore after
      this function. This function should be used when msg was allocated on the
      stack and initialized with [gstsdp.sdpmessage.SDPMessage.init_].
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult uninit()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_uninit(cast(GstSDPMessage*)this._cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of time zone information entries in msg.
      Returns: the number of time zone information entries in msg.
  */
  uint zonesLen()
  {
    uint _retval;
    _retval = gst_sdp_message_zones_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Creates a uri from msg with the given scheme. The uri has the format:
      
       \scheme:///[#type=value *[&type=value]]
      
       Where each value is url encoded.
  
      Params:
        scheme = the uri scheme
        msg = the #GstSDPMessage
      Returns: a uri for msg.
  */
  static string asUri(string scheme, gstsdp.sdpmessage.SDPMessage msg)
  {
    char* _cretval;
    const(char)* _scheme = scheme.toCString(No.Alloc);
    _cretval = gst_sdp_message_as_uri(_scheme, msg ? cast(const(GstSDPMessage)*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Initialize msg so that its contents are as if it was freshly allocated
      with [gstsdp.sdpmessage.SDPMessage.new_]. This function is mostly used to initialize a message
      allocated on the stack. [gstsdp.sdpmessage.SDPMessage.uninit] undoes this operation.
      
      When this function is invoked on newly allocated data (with malloc or on the
      stack), its contents should be set to 0 before calling this function.
  
      Params:
        msg = a #GstSDPMessage
      Returns: a #GstSDPResult.
  */
  static gstsdp.types.SDPResult init_(out gstsdp.sdpmessage.SDPMessage msg)
  {
    GstSDPResult _cretval;
    GstSDPMessage _msg;
    _cretval = gst_sdp_message_init(&_msg);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    msg = new gstsdp.sdpmessage.SDPMessage(cast(void*)&_msg, No.Take);
    return _retval;
  }

  /**
      Allocate a new GstSDPMessage and store the result in msg.
  
      Params:
        msg = pointer to new #GstSDPMessage
      Returns: a #GstSDPResult.
  */
  static gstsdp.types.SDPResult new_(out gstsdp.sdpmessage.SDPMessage msg)
  {
    GstSDPResult _cretval;
    GstSDPMessage* _msg;
    _cretval = gst_sdp_message_new(&_msg);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    msg = new gstsdp.sdpmessage.SDPMessage(cast(void*)_msg, Yes.Take);
    return _retval;
  }

  /**
      Parse text and create a new SDPMessage from these.
  
      Params:
        text = A dynamically allocated string representing the SDP description
        msg = pointer to new #GstSDPMessage
      Returns: a #GstSDPResult.
  */
  static gstsdp.types.SDPResult newFromText(string text, out gstsdp.sdpmessage.SDPMessage msg)
  {
    GstSDPResult _cretval;
    const(char)* _text = text.toCString(No.Alloc);
    GstSDPMessage* _msg;
    _cretval = gst_sdp_message_new_from_text(_text, &_msg);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    msg = new gstsdp.sdpmessage.SDPMessage(cast(void*)_msg, Yes.Take);
    return _retval;
  }

  /**
      Parse the contents of size bytes pointed to by data and store the result in
      msg.
  
      Params:
        data = the start of the buffer
        msg = the result #GstSDPMessage
      Returns: #GST_SDP_OK on success.
  */
  static gstsdp.types.SDPResult parseBuffer(ubyte[] data, gstsdp.sdpmessage.SDPMessage msg)
  {
    GstSDPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _cretval = gst_sdp_message_parse_buffer(_data, _size, msg ? cast(GstSDPMessage*)msg._cPtr(No.Dup) : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Parse the null-terminated uri and store the result in msg.
      
      The uri should be of the form:
      
       scheme://[address[:ttl=ttl][:noa=noa]]/[sessionname]
                    [#type=value *[&type=value]]
      
       where value is url encoded. This looslely resembles
       http://tools.ietf.org/html/draft-fujikawa-sdp-url-01
  
      Params:
        uri = the start of the uri
        msg = the result #GstSDPMessage
      Returns: #GST_SDP_OK on success.
  */
  static gstsdp.types.SDPResult parseUri(string uri, gstsdp.sdpmessage.SDPMessage msg)
  {
    GstSDPResult _cretval;
    const(char)* _uri = uri.toCString(No.Alloc);
    _cretval = gst_sdp_message_parse_uri(_uri, msg ? cast(GstSDPMessage*)msg._cPtr(No.Dup) : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }
}
