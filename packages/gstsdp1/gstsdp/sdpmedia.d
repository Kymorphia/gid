/// Module for [SDPMedia] class
module gstsdp.sdpmedia;

import gid.gid;
import gst.caps;
import gstsdp.c.functions;
import gstsdp.c.types;
import gstsdp.mikeymessage;
import gstsdp.sdpattribute;
import gstsdp.sdpbandwidth;
import gstsdp.sdpconnection;
import gstsdp.sdpkey;
import gstsdp.types;

/**
    The contents of the SDP "m=" field with all related fields.
*/
class SDPMedia
{
  GstSDPMedia _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstsdp.sdpmedia.SDPMedia");

    _cInstance = *cast(GstSDPMedia*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `media` field.
      Returns: the media type
  */
  @property string media()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMedia*)this._cPtr).media);
  }

  /**
      Set `media` field.
      Params:
        propval = the media type
  */
  @property void media(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPMedia*)this._cPtr).media);
    dToC(propval, cast(void*)&(cast(GstSDPMedia*)this._cPtr).media);
  }

  /**
      Get `port` field.
      Returns: the transport port to which the media stream will be sent
  */
  @property uint port()
  {
    return (cast(GstSDPMedia*)this._cPtr).port;
  }

  /**
      Set `port` field.
      Params:
        propval = the transport port to which the media stream will be sent
  */
  @property void port(uint propval)
  {
    (cast(GstSDPMedia*)this._cPtr).port = propval;
  }

  /**
      Get `numPorts` field.
      Returns: the number of ports or -1 if only one port was specified
  */
  @property uint numPorts()
  {
    return (cast(GstSDPMedia*)this._cPtr).numPorts;
  }

  /**
      Set `numPorts` field.
      Params:
        propval = the number of ports or -1 if only one port was specified
  */
  @property void numPorts(uint propval)
  {
    (cast(GstSDPMedia*)this._cPtr).numPorts = propval;
  }

  /**
      Get `proto` field.
      Returns: the transport protocol
  */
  @property string proto()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMedia*)this._cPtr).proto);
  }

  /**
      Set `proto` field.
      Params:
        propval = the transport protocol
  */
  @property void proto(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPMedia*)this._cPtr).proto);
    dToC(propval, cast(void*)&(cast(GstSDPMedia*)this._cPtr).proto);
  }

  /**
      Get `information` field.
      Returns: the media title
  */
  @property string information()
  {
    return cToD!(string)(cast(void*)(cast(GstSDPMedia*)this._cPtr).information);
  }

  /**
      Set `information` field.
      Params:
        propval = the media title
  */
  @property void information(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(GstSDPMedia*)this._cPtr).information);
    dToC(propval, cast(void*)&(cast(GstSDPMedia*)this._cPtr).information);
  }

  /**
      Get `key` field.
      Returns: the encryption key
  */
  @property gstsdp.sdpkey.SDPKey key()
  {
    return new gstsdp.sdpkey.SDPKey(cast(GstSDPKey*)&(cast(GstSDPMedia*)this._cPtr).key, No.Take);
  }

  /**
      Add the attribute with key and value to media.
  
      Params:
        key = a key
        value = a value
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult addAttribute(string key, string value = null)
  {
    GstSDPResult _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    const(char)* _value = value.toCString(No.Alloc);
    _cretval = gst_sdp_media_add_attribute(cast(GstSDPMedia*)this._cPtr, _key, _value);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add the bandwidth information with bwtype and bandwidth to media.
  
      Params:
        bwtype = the bandwidth modifier type
        bandwidth = the bandwidth in kilobits per second
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult addBandwidth(string bwtype, uint bandwidth)
  {
    GstSDPResult _cretval;
    const(char)* _bwtype = bwtype.toCString(No.Alloc);
    _cretval = gst_sdp_media_add_bandwidth(cast(GstSDPMedia*)this._cPtr, _bwtype, bandwidth);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add the given connection parameters to media.
  
      Params:
        nettype = the type of network. "IN" is defined to have the meaning
          "Internet".
        addrtype = the type of address.
        address = the address
        ttl = the time to live of the address
        addrNumber = the number of layers
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult addConnection(string nettype, string addrtype, string address, uint ttl, uint addrNumber)
  {
    GstSDPResult _cretval;
    const(char)* _nettype = nettype.toCString(No.Alloc);
    const(char)* _addrtype = addrtype.toCString(No.Alloc);
    const(char)* _address = address.toCString(No.Alloc);
    _cretval = gst_sdp_media_add_connection(cast(GstSDPMedia*)this._cPtr, _nettype, _addrtype, _address, ttl, addrNumber);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Add the format information to media.
  
      Params:
        format = the format
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult addFormat(string format)
  {
    GstSDPResult _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = gst_sdp_media_add_format(cast(GstSDPMedia*)this._cPtr, _format);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Convert the contents of media to a text string.
      Returns: A dynamically allocated string representing the media.
  */
  string asText()
  {
    char* _cretval;
    _cretval = gst_sdp_media_as_text(cast(const(GstSDPMedia)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the number of attribute fields in media.
      Returns: the number of attributes in media.
  */
  uint attributesLen()
  {
    uint _retval;
    _retval = gst_sdp_media_attributes_len(cast(const(GstSDPMedia)*)this._cPtr);
    return _retval;
  }

  /**
      Mapping of attributes of #GstSDPMedia to #GstCaps
  
      Params:
        caps = a #GstCaps
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult attributesToCaps(gst.caps.Caps caps)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_attributes_to_caps(cast(const(GstSDPMedia)*)this._cPtr, caps ? cast(GstCaps*)caps._cPtr(No.Dup) : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Get the number of bandwidth fields in media.
      Returns: the number of bandwidths in media.
  */
  uint bandwidthsLen()
  {
    uint _retval;
    _retval = gst_sdp_media_bandwidths_len(cast(const(GstSDPMedia)*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of connection fields in media.
      Returns: the number of connections in media.
  */
  uint connectionsLen()
  {
    uint _retval;
    _retval = gst_sdp_media_connections_len(cast(const(GstSDPMedia)*)this._cPtr);
    return _retval;
  }

  /**
      Allocate a new copy of media and store the result in copy. The value in
      copy should be release with gst_sdp_media_free function.
  
      Params:
        copy = pointer to new #GstSDPMedia
      Returns: a #GstSDPResult
  */
  gstsdp.types.SDPResult copy(out gstsdp.sdpmedia.SDPMedia copy)
  {
    GstSDPResult _cretval;
    GstSDPMedia* _copy;
    _cretval = gst_sdp_media_copy(cast(const(GstSDPMedia)*)this._cPtr, &_copy);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    copy = new gstsdp.sdpmedia.SDPMedia(cast(void*)_copy, Yes.Take);
    return _retval;
  }

  /**
      Get the number of formats in media.
      Returns: the number of formats in media.
  */
  uint formatsLen()
  {
    uint _retval;
    _retval = gst_sdp_media_formats_len(cast(const(GstSDPMedia)*)this._cPtr);
    return _retval;
  }

  /**
      Get the attribute at position idx in media.
  
      Params:
        idx = an index
      Returns: the #GstSDPAttribute at position idx.
  */
  gstsdp.sdpattribute.SDPAttribute getAttribute(uint idx)
  {
    const(GstSDPAttribute)* _cretval;
    _cretval = gst_sdp_media_get_attribute(cast(const(GstSDPMedia)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdpattribute.SDPAttribute(cast(GstSDPAttribute*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the first attribute value for key in media.
  
      Params:
        key = a key
      Returns: the first attribute value for key.
  */
  string getAttributeVal(string key)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_sdp_media_get_attribute_val(cast(const(GstSDPMedia)*)this._cPtr, _key);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the nth attribute value for key in media.
  
      Params:
        key = a key
        nth = an index
      Returns: the nth attribute value.
  */
  string getAttributeValN(string key, uint nth)
  {
    const(char)* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = gst_sdp_media_get_attribute_val_n(cast(const(GstSDPMedia)*)this._cPtr, _key, nth);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the bandwidth at position idx in media.
  
      Params:
        idx = an index
      Returns: the #GstSDPBandwidth at position idx.
  */
  gstsdp.sdpbandwidth.SDPBandwidth getBandwidth(uint idx)
  {
    const(GstSDPBandwidth)* _cretval;
    _cretval = gst_sdp_media_get_bandwidth(cast(const(GstSDPMedia)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdpbandwidth.SDPBandwidth(cast(GstSDPBandwidth*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Mapping of caps from SDP fields:
      
      a=rtpmap:(payload) (encoding_name)/(clock_rate)[/(encoding_params)]
      
      a=framesize:(payload) (width)-(height)
      
      a=fmtp:(payload) (param)[=(value)];...
      
      Note that the extmap, ssrc and rid attributes are set only by [gstsdp.sdpmedia.SDPMedia.attributesToCaps].
  
      Params:
        pt = a payload type
      Returns: a #GstCaps, or null if an error happened
  */
  gst.caps.Caps getCapsFromMedia(int pt)
  {
    GstCaps* _cretval;
    _cretval = gst_sdp_media_get_caps_from_media(cast(const(GstSDPMedia)*)this._cPtr, pt);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the connection at position idx in media.
  
      Params:
        idx = an index
      Returns: the #GstSDPConnection at position idx.
  */
  gstsdp.sdpconnection.SDPConnection getConnection(uint idx)
  {
    const(GstSDPConnection)* _cretval;
    _cretval = gst_sdp_media_get_connection(cast(const(GstSDPMedia)*)this._cPtr, idx);
    auto _retval = _cretval ? new gstsdp.sdpconnection.SDPConnection(cast(GstSDPConnection*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the format information at position idx in media.
  
      Params:
        idx = an index
      Returns: the format at position idx.
  */
  string getFormat(uint idx)
  {
    const(char)* _cretval;
    _cretval = gst_sdp_media_get_format(cast(const(GstSDPMedia)*)this._cPtr, idx);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the information of media
      Returns: the information of media.
  */
  string getInformation()
  {
    const(char)* _cretval;
    _cretval = gst_sdp_media_get_information(cast(const(GstSDPMedia)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the encryption information from media.
      Returns: a #GstSDPKey.
  */
  gstsdp.sdpkey.SDPKey getKey()
  {
    const(GstSDPKey)* _cretval;
    _cretval = gst_sdp_media_get_key(cast(const(GstSDPMedia)*)this._cPtr);
    auto _retval = _cretval ? new gstsdp.sdpkey.SDPKey(cast(GstSDPKey*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Get the media description of media.
      Returns: the media description.
  */
  string getMedia()
  {
    const(char)* _cretval;
    _cretval = gst_sdp_media_get_media(cast(const(GstSDPMedia)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the number of ports for media.
      Returns: the number of ports for media.
  */
  uint getNumPorts()
  {
    uint _retval;
    _retval = gst_sdp_media_get_num_ports(cast(const(GstSDPMedia)*)this._cPtr);
    return _retval;
  }

  /**
      Get the port number for media.
      Returns: the port number of media.
  */
  uint getPort()
  {
    uint _retval;
    _retval = gst_sdp_media_get_port(cast(const(GstSDPMedia)*)this._cPtr);
    return _retval;
  }

  /**
      Get the transport protocol of media
      Returns: the transport protocol of media.
  */
  string getProto()
  {
    const(char)* _cretval;
    _cretval = gst_sdp_media_get_proto(cast(const(GstSDPMedia)*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Insert the attribute to media at idx. When idx is -1,
      the attribute is appended.
  
      Params:
        idx = an index
        attr = a #GstSDPAttribute
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult insertAttribute(int idx, gstsdp.sdpattribute.SDPAttribute attr)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_insert_attribute(cast(GstSDPMedia*)this._cPtr, idx, attr ? cast(GstSDPAttribute*)attr._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert the bandwidth information to media at idx. When idx is -1,
      the bandwidth is appended.
  
      Params:
        idx = an index
        bw = a #GstSDPBandwidth
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult insertBandwidth(int idx, gstsdp.sdpbandwidth.SDPBandwidth bw)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_insert_bandwidth(cast(GstSDPMedia*)this._cPtr, idx, bw ? cast(GstSDPBandwidth*)bw._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert the connection information to media at idx. When idx is -1,
      the connection is appended.
  
      Params:
        idx = an index
        conn = a #GstSDPConnection
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult insertConnection(int idx, gstsdp.sdpconnection.SDPConnection conn)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_insert_connection(cast(GstSDPMedia*)this._cPtr, idx, conn ? cast(GstSDPConnection*)conn._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Insert the format information to media at idx. When idx is -1,
      the format is appended.
  
      Params:
        idx = an index
        format = the format
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult insertFormat(int idx, string format)
  {
    GstSDPResult _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = gst_sdp_media_insert_format(cast(GstSDPMedia*)this._cPtr, idx, _format);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Creates a new #GstMIKEYMessage after parsing the key-mgmt attribute
      from a #GstSDPMedia.
  
      Params:
        mikey = pointer to new #GstMIKEYMessage
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult parseKeymgmt(out gstsdp.mikeymessage.MIKEYMessage mikey)
  {
    GstSDPResult _cretval;
    GstMIKEYMessage* _mikey;
    _cretval = gst_sdp_media_parse_keymgmt(cast(const(GstSDPMedia)*)this._cPtr, &_mikey);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    mikey = new gstsdp.mikeymessage.MIKEYMessage(cast(void*)_mikey, Yes.Take);
    return _retval;
  }

  /**
      Remove the attribute in media at idx.
  
      Params:
        idx = an index
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult removeAttribute(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_remove_attribute(cast(GstSDPMedia*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the bandwidth information in media at idx.
  
      Params:
        idx = an index
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult removeBandwidth(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_remove_bandwidth(cast(GstSDPMedia*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the connection information in media at idx.
  
      Params:
        idx = an index
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult removeConnection(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_remove_connection(cast(GstSDPMedia*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Remove the format information in media at idx.
  
      Params:
        idx = an index
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult removeFormat(uint idx)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_remove_format(cast(GstSDPMedia*)this._cPtr, idx);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the attribute in media at idx with attr.
  
      Params:
        idx = an index
        attr = a #GstSDPAttribute
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult replaceAttribute(uint idx, gstsdp.sdpattribute.SDPAttribute attr)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_replace_attribute(cast(GstSDPMedia*)this._cPtr, idx, attr ? cast(GstSDPAttribute*)attr._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the bandwidth information in media at idx with bw.
  
      Params:
        idx = an index
        bw = a #GstSDPBandwidth
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult replaceBandwidth(uint idx, gstsdp.sdpbandwidth.SDPBandwidth bw)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_replace_bandwidth(cast(GstSDPMedia*)this._cPtr, idx, bw ? cast(GstSDPBandwidth*)bw._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the connection information in media at idx with conn.
  
      Params:
        idx = an index
        conn = a #GstSDPConnection
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult replaceConnection(uint idx, gstsdp.sdpconnection.SDPConnection conn)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_replace_connection(cast(GstSDPMedia*)this._cPtr, idx, conn ? cast(GstSDPConnection*)conn._cPtr : null);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Replace the format information in media at idx with format.
  
      Params:
        idx = an index
        format = the format
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult replaceFormat(uint idx, string format)
  {
    GstSDPResult _cretval;
    const(char)* _format = format.toCString(No.Alloc);
    _cretval = gst_sdp_media_replace_format(cast(GstSDPMedia*)this._cPtr, idx, _format);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the media information of media to information.
  
      Params:
        information = the media information
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult setInformation(string information)
  {
    GstSDPResult _cretval;
    const(char)* _information = information.toCString(No.Alloc);
    _cretval = gst_sdp_media_set_information(cast(GstSDPMedia*)this._cPtr, _information);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Adds the encryption information to media.
  
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
    _cretval = gst_sdp_media_set_key(cast(GstSDPMedia*)this._cPtr, _type, _data);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the media description of media to med.
  
      Params:
        med = the media description
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult setMedia(string med)
  {
    GstSDPResult _cretval;
    const(char)* _med = med.toCString(No.Alloc);
    _cretval = gst_sdp_media_set_media(cast(GstSDPMedia*)this._cPtr, _med);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the port information in media.
  
      Params:
        port = the port number
        numPorts = the number of ports
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult setPortInfo(uint port, uint numPorts)
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_set_port_info(cast(GstSDPMedia*)this._cPtr, port, numPorts);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Set the media transport protocol of media to proto.
  
      Params:
        proto = the media transport protocol
      Returns: #GST_SDP_OK.
  */
  gstsdp.types.SDPResult setProto(string proto)
  {
    GstSDPResult _cretval;
    const(char)* _proto = proto.toCString(No.Alloc);
    _cretval = gst_sdp_media_set_proto(cast(GstSDPMedia*)this._cPtr, _proto);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Free all resources allocated in media. media should not be used anymore after
      this function. This function should be used when media was allocated on the
      stack and initialized with [gstsdp.sdpmedia.SDPMedia.init_].
      Returns: a #GstSDPResult.
  */
  gstsdp.types.SDPResult uninit()
  {
    GstSDPResult _cretval;
    _cretval = gst_sdp_media_uninit(cast(GstSDPMedia*)this._cPtr);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    return _retval;
  }

  /**
      Initialize media so that its contents are as if it was freshly allocated
      with [gstsdp.sdpmedia.SDPMedia.new_]. This function is mostly used to initialize a media
      allocated on the stack. [gstsdp.sdpmedia.SDPMedia.uninit] undoes this operation.
      
      When this function is invoked on newly allocated data (with malloc or on the
      stack), its contents should be set to 0 before calling this function.
  
      Params:
        media = a #GstSDPMedia
      Returns: a #GstSDPResult.
  */
  static gstsdp.types.SDPResult init_(out gstsdp.sdpmedia.SDPMedia media)
  {
    GstSDPResult _cretval;
    GstSDPMedia _media;
    _cretval = gst_sdp_media_init(&_media);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    media = new gstsdp.sdpmedia.SDPMedia(cast(void*)&_media, No.Take);
    return _retval;
  }

  /**
      Allocate a new GstSDPMedia and store the result in media.
  
      Params:
        media = pointer to new #GstSDPMedia
      Returns: a #GstSDPResult.
  */
  static gstsdp.types.SDPResult new_(out gstsdp.sdpmedia.SDPMedia media)
  {
    GstSDPResult _cretval;
    GstSDPMedia* _media;
    _cretval = gst_sdp_media_new(&_media);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    media = new gstsdp.sdpmedia.SDPMedia(cast(void*)_media, Yes.Take);
    return _retval;
  }

  /**
      Mapping of caps to SDP fields:
      
      a=rtpmap:(payload) (encoding_name) or (clock_rate)[or (encoding_params)]
      
      a=framesize:(payload) (width)-(height)
      
      a=fmtp:(payload) (param)[=(value)];...
      
      a=rtcp-fb:(payload) (param1) [param2]...
      
      a=extmap:(id)[/direction] (extensionname) (extensionattributes)
  
      Params:
        caps = a #GstCaps
        media = a #GstSDPMedia
      Returns: a #GstSDPResult.
  */
  static gstsdp.types.SDPResult setMediaFromCaps(gst.caps.Caps caps, out gstsdp.sdpmedia.SDPMedia media)
  {
    GstSDPResult _cretval;
    GstSDPMedia _media;
    _cretval = gst_sdp_media_set_media_from_caps(caps ? cast(const(GstCaps)*)caps._cPtr(No.Dup) : null, &_media);
    gstsdp.types.SDPResult _retval = cast(gstsdp.types.SDPResult)_cretval;
    media = new gstsdp.sdpmedia.SDPMedia(cast(void*)&_media, No.Take);
    return _retval;
  }
}
