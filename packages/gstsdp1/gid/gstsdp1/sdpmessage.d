/// Module for [SDPMessage] class
module gid.gstsdp1.sdpmessage;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.boxed;
import gid.gst1.caps;
import gid.gstsdp1.c.functions;
import gid.gstsdp1.c.types;
import gid.gstsdp1.mikeymessage;
import gid.gstsdp1.sdpattribute;
import gid.gstsdp1.sdpbandwidth;
import gid.gstsdp1.sdpconnection;
import gid.gstsdp1.sdpkey;
import gid.gstsdp1.sdpmedia;
import gid.gstsdp1.sdporigin;
import gid.gstsdp1.sdptime;
import gid.gstsdp1.sdpzone;
import gid.gstsdp1.types;

/**
    The GstSDPMessage helper functions makes it easy to parse and create SDP
    messages.
*/
class SDPMessage : gid.gobject2.boxed.BoxedWrap!(gst_sdp_message_get_type)
{
  /**
      Create a `sdpmessage.SDPMessage` boxed type.
  */
  this() nothrow
  {
    super(boxedNew!GstSDPMessage(_getGType), Yes.Take);
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override SDPMessage self() nothrow
  {
    return this;
  }

  /**
      Get `version_` field.
      Returns: the protocol version
  */
  @property string version_() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).version_);
  }

  /**
      Get `origin` field.
      Returns: owner/creator and session identifier
  */
  @property gid.gstsdp1.sdporigin.SDPOrigin origin() nothrow
  {
    return new gid.gstsdp1.sdporigin.SDPOrigin(cast(GstSDPOrigin*)&(cast(GstSDPMessage*)this._cPtr).origin, this);
  }

  /**
      Get `sessionName` field.
      Returns: session name
  */
  @property string sessionName() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).sessionName);
  }

  /**
      Get `information` field.
      Returns: session information
  */
  @property string information() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).information);
  }

  /**
      Get `uri` field.
      Returns: URI of description
  */
  @property string uri() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMessage*)this._cPtr).uri);
  }

  /**
      Get `emails` field.
      Returns: array of #gchar with email addresses
  */
  @property void*[] emails() nothrow
  {
    return gArrayToD!(void*)((cast(GstSDPMessage*)this._cPtr).emails);
  }

  /**
      Get `phones` field.
      Returns: array of #gchar with phone numbers
  */
  @property void*[] phones() nothrow
  {
    return gArrayToD!(void*)((cast(GstSDPMessage*)this._cPtr).phones);
  }

  /**
      Get `connection` field.
      Returns: connection information for the session
  */
  @property gid.gstsdp1.sdpconnection.SDPConnection connection() nothrow
  {
    return new gid.gstsdp1.sdpconnection.SDPConnection(cast(GstSDPConnection*)&(cast(GstSDPMessage*)this._cPtr).connection, this);
  }

  /**
      Get `bandwidths` field.
      Returns: array of #GstSDPBandwidth with bandwidth information
  */
  @property void*[] bandwidths() nothrow
  {
    return gArrayToD!(void*)((cast(GstSDPMessage*)this._cPtr).bandwidths);
  }

  /**
      Get `times` field.
      Returns: array of #GstSDPTime with time descriptions
  */
  @property void*[] times() nothrow
  {
    return gArrayToD!(void*)((cast(GstSDPMessage*)this._cPtr).times);
  }

  /**
      Get `zones` field.
      Returns: array of #GstSDPZone with time zone adjustments
  */
  @property void*[] zones() nothrow
  {
    return gArrayToD!(void*)((cast(GstSDPMessage*)this._cPtr).zones);
  }

  /**
      Get `key` field.
      Returns: encryption key
  */
  @property gid.gstsdp1.sdpkey.SDPKey key() nothrow
  {
    return new gid.gstsdp1.sdpkey.SDPKey(cast(GstSDPKey*)&(cast(GstSDPMessage*)this._cPtr).key, this);
  }

  /**
      Get `attributes` field.
      Returns: array of #GstSDPAttribute with session attributes
  */
  @property void*[] attributes() nothrow
  {
    return gArrayToD!(void*)((cast(GstSDPMessage*)this._cPtr).attributes);
  }

  /**
      Get `medias` field.
      Returns: array of #GstSDPMedia with media descriptions
  */
  @property void*[] medias() nothrow
  {
    return gArrayToD!(void*)((cast(GstSDPMessage*)this._cPtr).medias);
  }

  /**
  Adds media to the array of medias in msg. The contents of media are moved to msg and media is re-initialized
  afterwards (empty), so it can be used again.
  
  Params:
  media = a #GstSDPMedia
  Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult addMedia(gid.gstsdp1.sdpmedia.SDPMedia media) nothrow
  {
    auto _media = media ? cast(GstSDPMedia*)media._cPtr(No.Dup) : null;
    GstSDPResult _cretval = gst_sdp_message_add_media(cast(GstSDPMessage*)this._cPtr, _media);

    if (_media && _cretval == GstSDPResult.Ok)
      gst_sdp_media_init(_media);

    return cast(gid.gstsdp1.types.SDPResult)_cretval;
  }

  /**
      Add the attribute with key and value to msg.
  
      Params:
        key = the key
        value = the value
      Returns: GST_SDP_OK.
  */
  gid.gstsdp1.types.SDPResult addAttribute(string key, string value = null) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    const(char)* _value = value.toCString!(No.Malloc, Yes.Nullable);
    _cretval = gst_sdp_message_add_attribute(cast(GstSDPMessage*)this._cPtr, _key, _value);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add the specified bandwidth information to msg.
  
      Params:
        bwtype = the bandwidth modifier type
        bandwidth = the bandwidth in kilobits per second
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult addBandwidth(string bwtype, uint bandwidth) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _bwtype = bwtype.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_add_bandwidth(cast(GstSDPMessage*)this._cPtr, _bwtype, bandwidth);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add email to the list of emails in msg.
  
      Params:
        email = an email
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult addEmail(string email) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _email = email.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_add_email(cast(GstSDPMessage*)this._cPtr, _email);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add phone to the list of phones in msg.
  
      Params:
        phone = a phone
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult addPhone(string phone) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _phone = phone.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_add_phone(cast(GstSDPMessage*)this._cPtr, _phone);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult addTime(string start, string stop, string[] repeat) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _start = start.toCString!(No.Malloc, No.Nullable);
    const(char)* _stop = stop.toCString!(No.Malloc, No.Nullable);
    auto _repeat_arr = new char*[](repeat.length + 1);
    auto _repeat = cast(char**)_repeat_arr.ptr;
    foreach (i, s; repeat) _repeat[i] = s.toCString!(No.Malloc);
    _cretval = gst_sdp_message_add_time(cast(GstSDPMessage*)this._cPtr, _start, _stop, _repeat);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add time zone information to msg.
  
      Params:
        adjTime = the NTP time that a time zone adjustment happens
        typedTime = the offset from the time when the session was first scheduled
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult addZone(string adjTime, string typedTime) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _adjTime = adjTime.toCString!(No.Malloc, No.Nullable);
    const(char)* _typedTime = typedTime.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_add_zone(cast(GstSDPMessage*)this._cPtr, _adjTime, _typedTime);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Convert the contents of msg to a text string.
      Returns: A dynamically allocated string representing the SDP description.
  */
  string asText() nothrow
  {
    char* _cretval;
    _cretval = gst_sdp_message_as_text(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Get the number of attributes in msg.
      Returns: the number of attributes in msg.
  */
  uint attributesLen() nothrow
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
  gid.gstsdp1.types.SDPResult attributesToCaps(gid.gst1.caps.Caps caps) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_attributes_to_caps(cast(const(GstSDPMessage)*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of bandwidth information in msg.
      Returns: the number of bandwidth information in msg.
  */
  uint bandwidthsLen() nothrow
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
  gid.gstsdp1.types.SDPResult copy(out gid.gstsdp1.sdpmessage.SDPMessage copy) nothrow
  {
    GstSDPResult _cretval;
    GstSDPMessage* _copy;
    _cretval = gst_sdp_message_copy(cast(const(GstSDPMessage)*)this._cPtr, &_copy);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    if (_copy)
      copy = new gid.gstsdp1.sdpmessage.SDPMessage(cast(void*)_copy, Yes.Take);
    return _retval;
  }

  /**
      Dump the parsed contents of msg to stdout.
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult dump() nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_dump(cast(const(GstSDPMessage)*)this._cPtr);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of emails in msg.
      Returns: the number of emails in msg.
  */
  uint emailsLen() nothrow
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
  gid.gstsdp1.sdpattribute.SDPAttribute getAttribute(uint idx) nothrow
  {
    const(GstSDPAttribute)* _cretval;
    _cretval = gst_sdp_message_get_attribute(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gid.gstsdp1.sdpattribute.SDPAttribute(cast(GstSDPAttribute*)_cretval, this) : null;
    return _retval;
  }

  /**
      Get the first attribute with key key in msg.
  
      Params:
        key = the key
      Returns: the attribute value of the first attribute with key.
  */
  string getAttributeVal(string key) nothrow
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_get_attribute_val(cast(const(GstSDPMessage)*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the nth attribute with key key in msg.
  
      Params:
        key = the key
        nth = the index
      Returns: the attribute value of the nth attribute with key.
  */
  string getAttributeValN(string key, uint nth) nothrow
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_get_attribute_val_n(cast(const(GstSDPMessage)*)this._cPtr, _key, nth);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the bandwidth at index idx from msg.
  
      Params:
        idx = the bandwidth index
      Returns: a #GstSDPBandwidth.
  */
  gid.gstsdp1.sdpbandwidth.SDPBandwidth getBandwidth(uint idx) nothrow
  {
    const(GstSDPBandwidth)* _cretval;
    _cretval = gst_sdp_message_get_bandwidth(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gid.gstsdp1.sdpbandwidth.SDPBandwidth(cast(GstSDPBandwidth*)_cretval, this) : null;
    return _retval;
  }

  /**
      Get the connection of msg.
      Returns: a #GstSDPConnection. The result remains valid as long as msg is valid.
  */
  gid.gstsdp1.sdpconnection.SDPConnection getConnection() nothrow
  {
    const(GstSDPConnection)* _cretval;
    _cretval = gst_sdp_message_get_connection(cast(const(GstSDPMessage)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstsdp1.sdpconnection.SDPConnection(cast(GstSDPConnection*)_cretval, this) : null;
    return _retval;
  }

  /**
      Get the email with number idx from msg.
  
      Params:
        idx = an email index
      Returns: the email at position idx.
  */
  string getEmail(uint idx) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_email(cast(const(GstSDPMessage)*)this._cPtr, idx);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the information in msg.
      Returns: a #GstSDPResult.
  */
  string getInformation() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_information(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the encryption information from msg.
      Returns: a #GstSDPKey.
  */
  gid.gstsdp1.sdpkey.SDPKey getKey() nothrow
  {
    const(GstSDPKey)* _cretval;
    _cretval = gst_sdp_message_get_key(cast(const(GstSDPMessage)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstsdp1.sdpkey.SDPKey(cast(GstSDPKey*)_cretval, this) : null;
    return _retval;
  }

  /**
      Get the media description at index idx in msg.
  
      Params:
        idx = the index
      Returns: a #GstSDPMedia.
  */
  gid.gstsdp1.sdpmedia.SDPMedia getMedia(uint idx) nothrow
  {
    const(GstSDPMedia)* _cretval;
    _cretval = gst_sdp_message_get_media(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gid.gstsdp1.sdpmedia.SDPMedia(cast(GstSDPMedia*)_cretval, this) : null;
    return _retval;
  }

  /**
      Get the origin of msg.
      Returns: a #GstSDPOrigin. The result remains valid as long as msg is valid.
  */
  gid.gstsdp1.sdporigin.SDPOrigin getOrigin() nothrow
  {
    const(GstSDPOrigin)* _cretval;
    _cretval = gst_sdp_message_get_origin(cast(const(GstSDPMessage)*)this._cPtr);
    auto _retval = _cretval ? new gid.gstsdp1.sdporigin.SDPOrigin(cast(GstSDPOrigin*)_cretval, this) : null;
    return _retval;
  }

  /**
      Get the phone with number idx from msg.
  
      Params:
        idx = a phone index
      Returns: the phone at position idx.
  */
  string getPhone(uint idx) nothrow
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_phone(cast(const(GstSDPMessage)*)this._cPtr, idx);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the session name in msg.
      Returns: a #GstSDPResult.
  */
  string getSessionName() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_session_name(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get time information with index idx from msg.
  
      Params:
        idx = the time index
      Returns: a #GstSDPTime.
  */
  gid.gstsdp1.sdptime.SDPTime getTime(uint idx) nothrow
  {
    const(GstSDPTime)* _cretval;
    _cretval = gst_sdp_message_get_time(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gid.gstsdp1.sdptime.SDPTime(cast(GstSDPTime*)_cretval, this) : null;
    return _retval;
  }

  /**
      Get the URI in msg.
      Returns: a #GstSDPResult.
  */
  string getUri() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_uri(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get the version in msg.
      Returns: a #GstSDPResult.
  */
  string getVersion() nothrow
  {
    const(char)* _cretval;
    _cretval = gst_sdp_message_get_version(cast(const(GstSDPMessage)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(No.Free);
    return _retval;
  }

  /**
      Get time zone information with index idx from msg.
  
      Params:
        idx = the zone index
      Returns: a #GstSDPZone.
  */
  gid.gstsdp1.sdpzone.SDPZone getZone(uint idx) nothrow
  {
    const(GstSDPZone)* _cretval;
    _cretval = gst_sdp_message_get_zone(cast(const(GstSDPMessage)*)this._cPtr, idx);
    auto _retval = _cretval ? new gid.gstsdp1.sdpzone.SDPZone(cast(GstSDPZone*)_cretval, this) : null;
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
  gid.gstsdp1.types.SDPResult insertAttribute(int idx, gid.gstsdp1.sdpattribute.SDPAttribute attr) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_attribute(cast(GstSDPMessage*)this._cPtr, idx, attr ? cast(GstSDPAttribute*)attr._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult insertBandwidth(int idx, gid.gstsdp1.sdpbandwidth.SDPBandwidth bw) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_bandwidth(cast(GstSDPMessage*)this._cPtr, idx, bw ? cast(GstSDPBandwidth*)bw._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult insertEmail(int idx, string email) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _email = email.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_insert_email(cast(GstSDPMessage*)this._cPtr, idx, _email);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult insertPhone(int idx, string phone) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _phone = phone.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_insert_phone(cast(GstSDPMessage*)this._cPtr, idx, _phone);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult insertTime(int idx, gid.gstsdp1.sdptime.SDPTime t) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_time(cast(GstSDPMessage*)this._cPtr, idx, t ? cast(GstSDPTime*)t._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult insertZone(int idx, gid.gstsdp1.sdpzone.SDPZone zone) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_insert_zone(cast(GstSDPMessage*)this._cPtr, idx, zone ? cast(GstSDPZone*)zone._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of media descriptions in msg.
      Returns: the number of media descriptions in msg.
  */
  uint mediasLen() nothrow
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
  gid.gstsdp1.types.SDPResult parseKeymgmt(out gid.gstsdp1.mikeymessage.MIKEYMessage mikey) nothrow
  {
    GstSDPResult _cretval;
    GstMIKEYMessage* _mikey;
    _cretval = gst_sdp_message_parse_keymgmt(cast(const(GstSDPMessage)*)this._cPtr, &_mikey);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    if (_mikey)
      mikey = new gid.gstsdp1.mikeymessage.MIKEYMessage(cast(void*)_mikey, Yes.Take);
    return _retval;
  }

  /**
      Get the number of phones in msg.
      Returns: the number of phones in msg.
  */
  uint phonesLen() nothrow
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
  gid.gstsdp1.types.SDPResult removeAttribute(uint idx) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_attribute(cast(GstSDPMessage*)this._cPtr, idx);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the bandwidth information in msg at index idx.
  
      Params:
        idx = the bandwidth index
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult removeBandwidth(uint idx) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_bandwidth(cast(GstSDPMessage*)this._cPtr, idx);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the email in msg at index idx.
  
      Params:
        idx = an email index
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult removeEmail(uint idx) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_email(cast(GstSDPMessage*)this._cPtr, idx);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the media at idx from the array of medias in msg if found.
  
      Params:
        idx = the media index
      Returns: #GST_SDP_OK when the specified media is found at idx and removed,
        #GST_SDP_EINVAL otherwise.
  */
  gid.gstsdp1.types.SDPResult removeMedia(uint idx) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_media(cast(GstSDPMessage*)this._cPtr, idx);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the phone number in msg at index idx.
  
      Params:
        idx = a phone index
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult removePhone(uint idx) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_phone(cast(GstSDPMessage*)this._cPtr, idx);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the time information in msg at index idx.
  
      Params:
        idx = the index
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult removeTime(uint idx) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_time(cast(GstSDPMessage*)this._cPtr, idx);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the zone information in msg at index idx.
  
      Params:
        idx = the index
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult removeZone(uint idx) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_remove_zone(cast(GstSDPMessage*)this._cPtr, idx);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the attribute in msg at index idx with attr.
  
      Params:
        idx = the index
        attr = a #GstSDPAttribute
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult replaceAttribute(uint idx, gid.gstsdp1.sdpattribute.SDPAttribute attr) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_attribute(cast(GstSDPMessage*)this._cPtr, idx, attr ? cast(GstSDPAttribute*)attr._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the bandwidth information in msg at index idx with bw.
  
      Params:
        idx = the bandwidth index
        bw = the bandwidth
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult replaceBandwidth(uint idx, gid.gstsdp1.sdpbandwidth.SDPBandwidth bw) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_bandwidth(cast(GstSDPMessage*)this._cPtr, idx, bw ? cast(GstSDPBandwidth*)bw._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the email in msg at index idx with email.
  
      Params:
        idx = an email index
        email = an email
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult replaceEmail(uint idx, string email) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _email = email.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_replace_email(cast(GstSDPMessage*)this._cPtr, idx, _email);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the phone number in msg at index idx with phone.
  
      Params:
        idx = a phone index
        phone = a phone
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult replacePhone(uint idx, string phone) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _phone = phone.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_replace_phone(cast(GstSDPMessage*)this._cPtr, idx, _phone);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the time information in msg at index idx with `t`.
  
      Params:
        idx = the index
        t = a #GstSDPTime
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult replaceTime(uint idx, gid.gstsdp1.sdptime.SDPTime t) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_time(cast(GstSDPMessage*)this._cPtr, idx, t ? cast(GstSDPTime*)t._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the zone information in msg at index idx with zone.
  
      Params:
        idx = the index
        zone = a #GstSDPZone
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult replaceZone(uint idx, gid.gstsdp1.sdpzone.SDPZone zone) nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_replace_zone(cast(GstSDPMessage*)this._cPtr, idx, zone ? cast(GstSDPZone*)zone._cPtr : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult setConnection(string nettype, string addrtype, string address, uint ttl, uint addrNumber) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _nettype = nettype.toCString!(No.Malloc, No.Nullable);
    const(char)* _addrtype = addrtype.toCString!(No.Malloc, No.Nullable);
    const(char)* _address = address.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_set_connection(cast(GstSDPMessage*)this._cPtr, _nettype, _addrtype, _address, ttl, addrNumber);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the information in msg.
  
      Params:
        information = the information
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult setInformation(string information) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _information = information.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_set_information(cast(GstSDPMessage*)this._cPtr, _information);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Adds the encryption information to msg.
  
      Params:
        type = the encryption type
        data = the encryption data
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult setKey(string type, string data) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _type = type.toCString!(No.Malloc, No.Nullable);
    const(char)* _data = data.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_set_key(cast(GstSDPMessage*)this._cPtr, _type, _data);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  gid.gstsdp1.types.SDPResult setOrigin(string username, string sessId, string sessVersion, string nettype, string addrtype, string addr) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _username = username.toCString!(No.Malloc, No.Nullable);
    const(char)* _sessId = sessId.toCString!(No.Malloc, No.Nullable);
    const(char)* _sessVersion = sessVersion.toCString!(No.Malloc, No.Nullable);
    const(char)* _nettype = nettype.toCString!(No.Malloc, No.Nullable);
    const(char)* _addrtype = addrtype.toCString!(No.Malloc, No.Nullable);
    const(char)* _addr = addr.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_set_origin(cast(GstSDPMessage*)this._cPtr, _username, _sessId, _sessVersion, _nettype, _addrtype, _addr);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the session name in msg.
  
      Params:
        sessionName = the session name
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult setSessionName(string sessionName) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _sessionName = sessionName.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_set_session_name(cast(GstSDPMessage*)this._cPtr, _sessionName);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the URI in msg.
  
      Params:
        uri = the URI
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult setUri(string uri) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_set_uri(cast(GstSDPMessage*)this._cPtr, _uri);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the version in msg.
  
      Params:
        version_ = the version
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult setVersion(string version_) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _version_ = version_.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_set_version(cast(GstSDPMessage*)this._cPtr, _version_);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of time information entries in msg.
      Returns: the number of time information entries in msg.
  */
  uint timesLen() nothrow
  {
    uint _retval;
    _retval = gst_sdp_message_times_len(cast(const(GstSDPMessage)*)this._cPtr);
    return _retval;
  }

  /**
      Free all resources allocated in msg. msg should not be used anymore after
      this function. This function should be used when msg was allocated on the
      stack and initialized with [gid.gstsdp1.sdpmessage.SDPMessage.init_].
      Returns: a #GstSDPResult.
  */
  gid.gstsdp1.types.SDPResult uninit() nothrow
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_message_uninit(cast(GstSDPMessage*)this._cPtr);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of time zone information entries in msg.
      Returns: the number of time zone information entries in msg.
  */
  uint zonesLen() nothrow
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
  static string asUri(string scheme, gid.gstsdp1.sdpmessage.SDPMessage msg) nothrow
  {
    char* _cretval;
    const(char)* _scheme = scheme.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_as_uri(_scheme, msg ? cast(const(GstSDPMessage)*)msg._cPtr(No.Dup) : null);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }

  /**
      Initialize msg so that its contents are as if it was freshly allocated
      with [gid.gstsdp1.sdpmessage.SDPMessage.new_]. This function is mostly used to initialize a message
      allocated on the stack. [gid.gstsdp1.sdpmessage.SDPMessage.uninit] undoes this operation.
      
      When this function is invoked on newly allocated data (with malloc or on the
      stack), its contents should be set to 0 before calling this function.
  
      Params:
        msg = a #GstSDPMessage
      Returns: a #GstSDPResult.
  */
  static gid.gstsdp1.types.SDPResult init_(out gid.gstsdp1.sdpmessage.SDPMessage msg) nothrow
  {
    GstSDPResult _cretval;
    auto _msg = boxedNew!GstSDPMessage(gid.gstsdp1.sdpmessage.SDPMessage._getGType);
    _cretval = gst_sdp_message_init(_msg);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    msg = new gid.gstsdp1.sdpmessage.SDPMessage(cast(void*)_msg, Yes.Take);
    return _retval;
  }

  /**
      Allocate a new GstSDPMessage and store the result in msg.
  
      Params:
        msg = pointer to new #GstSDPMessage
      Returns: a #GstSDPResult.
  */
  static gid.gstsdp1.types.SDPResult new_(out gid.gstsdp1.sdpmessage.SDPMessage msg) nothrow
  {
    GstSDPResult _cretval;
    GstSDPMessage* _msg;
    _cretval = gst_sdp_message_new(&_msg);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    if (_msg)
      msg = new gid.gstsdp1.sdpmessage.SDPMessage(cast(void*)_msg, Yes.Take);
    return _retval;
  }

  /**
      Parse text and create a new SDPMessage from these.
  
      Params:
        text = A dynamically allocated string representing the SDP description
        msg = pointer to new #GstSDPMessage
      Returns: a #GstSDPResult.
  */
  static gid.gstsdp1.types.SDPResult newFromText(string text, out gid.gstsdp1.sdpmessage.SDPMessage msg) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _text = text.toCString!(No.Malloc, No.Nullable);
    GstSDPMessage* _msg;
    _cretval = gst_sdp_message_new_from_text(_text, &_msg);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    if (_msg)
      msg = new gid.gstsdp1.sdpmessage.SDPMessage(cast(void*)_msg, Yes.Take);
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
  static gid.gstsdp1.types.SDPResult parseBuffer(ubyte[] data, gid.gstsdp1.sdpmessage.SDPMessage msg) nothrow
  {
    GstSDPResult _cretval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_sdp_message_parse_buffer(_data, _size, msg ? cast(GstSDPMessage*)msg._cPtr(No.Dup) : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
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
  static gid.gstsdp1.types.SDPResult parseUri(string uri, gid.gstsdp1.sdpmessage.SDPMessage msg) nothrow
  {
    GstSDPResult _cretval;
    const(char)* _uri = uri.toCString!(No.Malloc, No.Nullable);
    _cretval = gst_sdp_message_parse_uri(_uri, msg ? cast(GstSDPMessage*)msg._cPtr(No.Dup) : null);
    gid.gstsdp1.types.SDPResult _retval = cast(gid.gstsdp1.types.SDPResult)_cretval;
    return _retval;
  }
}
