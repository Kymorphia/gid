/// Module for [RTCPPacket] class
module gstrtp.rtcppacket;

import gid.gid;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtcpbuffer;
import gstrtp.types;

/**
    Data structure that points to a packet at @offset in @buffer.
    The size of the structure is made public to allow stack allocations.
*/
class RTCPPacket
{
  GstRTCPPacket _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtp.rtcppacket.RTCPPacket");

    _cInstance = *cast(GstRTCPPacket*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `rtcp` field.
      Returns: pointer to RTCP buffer
  */
  @property gstrtp.rtcpbuffer.RTCPBuffer rtcp()
  {
    return new gstrtp.rtcpbuffer.RTCPBuffer(cast(GstRTCPBuffer*)(cast(GstRTCPPacket*)this._cPtr).rtcp, No.Take);
  }

  /**
      Get `offset` field.
      Returns: offset of packet in buffer data
  */
  @property uint offset()
  {
    return (cast(GstRTCPPacket*)this._cPtr).offset;
  }

  /**
      Set `offset` field.
      Params:
        propval = offset of packet in buffer data
  */
  @property void offset(uint propval)
  {
    (cast(GstRTCPPacket*)this._cPtr).offset = propval;
  }

  /**
      Add profile-specific extension data to packet. If packet already
      contains profile-specific extension data will be appended to the existing
      extension.
  
      Params:
        data = profile-specific data
      Returns: true if the profile specific extension data was added.
  */
  bool addProfileSpecificExt(ubyte[] data)
  {
    bool _retval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_rtcp_packet_add_profile_specific_ext(cast(GstRTCPPacket*)this._cPtr, _data, _len);
    return _retval;
  }

  /**
      Add a new report block to packet with the given values.
  
      Params:
        ssrc = data source being reported
        fractionlost = fraction lost since last SR/RR
        packetslost = the cumululative number of packets lost
        exthighestseq = the extended last sequence number received
        jitter = the interarrival jitter
        lsr = the last SR packet from this source
        dlsr = the delay since last SR packet
      Returns: true if the packet was created. This function can return false if
        the max MTU is exceeded or the number of report blocks is greater than
        #GST_RTCP_MAX_RB_COUNT.
  */
  bool addRb(uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_add_rb(cast(GstRTCPPacket*)this._cPtr, ssrc, fractionlost, packetslost, exthighestseq, jitter, lsr, dlsr);
    return _retval;
  }

  /**
      Get the application-dependent data attached to a RTPFB or PSFB packet.
      Returns: A pointer to the data
  */
  ubyte* appGetData()
  {
    auto _retval = gst_rtcp_packet_app_get_data(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the length of the application-dependent data attached to an APP
      packet.
      Returns: The length of data in 32-bit words.
  */
  ushort appGetDataLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_app_get_data_length(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the name field of the APP packet.
      Returns: The 4-byte name field, not zero-terminated.
  */
  string appGetName()
  {
    const(char)* _cretval;
    _cretval = gst_rtcp_packet_app_get_name(cast(GstRTCPPacket*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(No.Free);
    return _retval;
  }

  /**
      Get the SSRC/CSRC field of the APP packet.
      Returns: The SSRC/CSRC.
  */
  uint appGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_app_get_ssrc(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the subtype field of the APP packet.
      Returns: The subtype.
  */
  ubyte appGetSubtype()
  {
    ubyte _retval;
    _retval = gst_rtcp_packet_app_get_subtype(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Set the length of the application-dependent data attached to an APP
      packet.
  
      Params:
        wordlen = Length of the data in 32-bit words
      Returns: true if there was enough space in the packet to add this much
        data.
  */
  bool appSetDataLength(ushort wordlen)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_app_set_data_length(cast(GstRTCPPacket*)this._cPtr, wordlen);
    return _retval;
  }

  /**
      Set the name field of the APP packet.
  
      Params:
        name = 4-byte ASCII name
  */
  void appSetName(string name)
  {
    const(char)* _name = name.toCString(No.Alloc);
    gst_rtcp_packet_app_set_name(cast(GstRTCPPacket*)this._cPtr, _name);
  }

  /**
      Set the SSRC/CSRC field of the APP packet.
  
      Params:
        ssrc = SSRC/CSRC of the packet
  */
  void appSetSsrc(uint ssrc)
  {
    gst_rtcp_packet_app_set_ssrc(cast(GstRTCPPacket*)this._cPtr, ssrc);
  }

  /**
      Set the subtype field of the APP packet.
  
      Params:
        subtype = subtype of the packet
  */
  void appSetSubtype(ubyte subtype)
  {
    gst_rtcp_packet_app_set_subtype(cast(GstRTCPPacket*)this._cPtr, subtype);
  }

  /**
      Add ssrc to the BYE packet.
  
      Params:
        ssrc = an SSRC to add
      Returns: true if the ssrc was added. This function can return false if
        the max MTU is exceeded or the number of sources blocks is greater than
        #GST_RTCP_MAX_BYE_SSRC_COUNT.
  */
  bool byeAddSsrc(uint ssrc)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_bye_add_ssrc(cast(GstRTCPPacket*)this._cPtr, ssrc);
    return _retval;
  }

  /**
      Adds len SSRCs in ssrc to BYE packet.
  
      Params:
        ssrc = an array of SSRCs to add
      Returns: true if the all the SSRCs were added. This function can return false if
        the max MTU is exceeded or the number of sources blocks is greater than
        #GST_RTCP_MAX_BYE_SSRC_COUNT.
  */
  bool byeAddSsrcs(uint[] ssrc)
  {
    bool _retval;
    uint _len;
    if (ssrc)
      _len = cast(uint)ssrc.length;

    auto _ssrc = cast(uint*)ssrc.ptr;
    _retval = cast(bool)gst_rtcp_packet_bye_add_ssrcs(cast(GstRTCPPacket*)this._cPtr, _ssrc, _len);
    return _retval;
  }

  /**
      Get the nth SSRC of the BYE packet.
  
      Params:
        nth = the nth SSRC to get
      Returns: The nth SSRC of packet.
  */
  uint byeGetNthSsrc(uint nth)
  {
    uint _retval;
    _retval = gst_rtcp_packet_bye_get_nth_ssrc(cast(GstRTCPPacket*)this._cPtr, nth);
    return _retval;
  }

  /**
      Get the reason in packet.
      Returns: The reason for the BYE packet or NULL if the packet did not contain
        a reason string. The string must be freed with [glib.global.gfree] after usage.
  */
  string byeGetReason()
  {
    char* _cretval;
    _cretval = gst_rtcp_packet_bye_get_reason(cast(GstRTCPPacket*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }

  /**
      Get the length of the reason string.
      Returns: The length of the reason string or 0 when there is no reason string
        present.
  */
  ubyte byeGetReasonLen()
  {
    ubyte _retval;
    _retval = gst_rtcp_packet_bye_get_reason_len(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the number of SSRC fields in packet.
      Returns: The number of SSRC fields in packet.
  */
  uint byeGetSsrcCount()
  {
    uint _retval;
    _retval = gst_rtcp_packet_bye_get_ssrc_count(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Set the reason string to reason in packet.
  
      Params:
        reason = a reason string
      Returns: TRUE if the string could be set.
  */
  bool byeSetReason(string reason)
  {
    bool _retval;
    const(char)* _reason = reason.toCString(No.Alloc);
    _retval = cast(bool)gst_rtcp_packet_bye_set_reason(cast(GstRTCPPacket*)this._cPtr, _reason);
    return _retval;
  }

  /**
      The profile-specific extension data is copied into a new allocated
      memory area data. This must be freed with [glib.global.gfree] after usage.
  
      Params:
        data = result profile-specific data
      Returns: true if there was valid data.
  */
  bool copyProfileSpecificExt(out ubyte[] data)
  {
    bool _retval;
    uint _len;
    ubyte* _data;
    _retval = cast(bool)gst_rtcp_packet_copy_profile_specific_ext(cast(GstRTCPPacket*)this._cPtr, &_data, &_len);
    data.length = _len;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _len];
    gFree(cast(void*)_data);
    return _retval;
  }

  /**
      Get the Feedback Control Information attached to a RTPFB or PSFB packet.
      Returns: a pointer to the FCI
  */
  ubyte* fbGetFci()
  {
    auto _retval = gst_rtcp_packet_fb_get_fci(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the length of the Feedback Control Information attached to a
      RTPFB or PSFB packet.
      Returns: The length of the FCI in 32-bit words.
  */
  ushort fbGetFciLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_fb_get_fci_length(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the media SSRC field of the RTPFB or PSFB packet.
      Returns: the media SSRC.
  */
  uint fbGetMediaSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_fb_get_media_ssrc(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the sender SSRC field of the RTPFB or PSFB packet.
      Returns: the sender SSRC.
  */
  uint fbGetSenderSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_fb_get_sender_ssrc(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the feedback message type of the FB packet.
      Returns: The feedback message type.
  */
  gstrtp.types.RTCPFBType fbGetType()
  {
    GstRTCPFBType _cretval;
    _cretval = gst_rtcp_packet_fb_get_type(cast(GstRTCPPacket*)this._cPtr);
    gstrtp.types.RTCPFBType _retval = cast(gstrtp.types.RTCPFBType)_cretval;
    return _retval;
  }

  /**
      Set the length of the Feedback Control Information attached to a
      RTPFB or PSFB packet.
  
      Params:
        wordlen = Length of the FCI in 32-bit words
      Returns: true if there was enough space in the packet to add this much FCI
  */
  bool fbSetFciLength(ushort wordlen)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_fb_set_fci_length(cast(GstRTCPPacket*)this._cPtr, wordlen);
    return _retval;
  }

  /**
      Set the media SSRC field of the RTPFB or PSFB packet.
  
      Params:
        ssrc = a media SSRC
  */
  void fbSetMediaSsrc(uint ssrc)
  {
    gst_rtcp_packet_fb_set_media_ssrc(cast(GstRTCPPacket*)this._cPtr, ssrc);
  }

  /**
      Set the sender SSRC field of the RTPFB or PSFB packet.
  
      Params:
        ssrc = a sender SSRC
  */
  void fbSetSenderSsrc(uint ssrc)
  {
    gst_rtcp_packet_fb_set_sender_ssrc(cast(GstRTCPPacket*)this._cPtr, ssrc);
  }

  /**
      Set the feedback message type of the FB packet.
  
      Params:
        type = the #GstRTCPFBType to set
  */
  void fbSetType(gstrtp.types.RTCPFBType type)
  {
    gst_rtcp_packet_fb_set_type(cast(GstRTCPPacket*)this._cPtr, type);
  }

  /**
      Get the count field in packet.
      Returns: The count field in packet or -1 if packet does not point to a
        valid packet.
  */
  ubyte getCount()
  {
    ubyte _retval;
    _retval = gst_rtcp_packet_get_count(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the length field of packet. This is the length of the packet in
      32-bit words minus one.
      Returns: The length field of packet.
  */
  ushort getLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_get_length(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the packet padding of the packet pointed to by packet.
      Returns: If the packet has the padding bit set.
  */
  bool getPadding()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_get_padding(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /** */
  bool getProfileSpecificExt(out ubyte[] data)
  {
    bool _retval;
    uint _len;
    ubyte* _data;
    _retval = cast(bool)gst_rtcp_packet_get_profile_specific_ext(cast(GstRTCPPacket*)this._cPtr, &_data, &_len);
    data.length = _len;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _len];
    return _retval;
  }

  /** */
  ushort getProfileSpecificExtLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_get_profile_specific_ext_length(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Parse the values of the nth report block in packet and store the result in
      the values.
  
      Params:
        nth = the nth report block in packet
        ssrc = result for data source being reported
        fractionlost = result for fraction lost since last SR/RR
        packetslost = result for the cumululative number of packets lost
        exthighestseq = result for the extended last sequence number received
        jitter = result for the interarrival jitter
        lsr = result for the last SR packet from this source
        dlsr = result for the delay since last SR packet
  */
  void getRb(uint nth, out uint ssrc, out ubyte fractionlost, out int packetslost, out uint exthighestseq, out uint jitter, out uint lsr, out uint dlsr)
  {
    gst_rtcp_packet_get_rb(cast(GstRTCPPacket*)this._cPtr, nth, cast(uint*)&ssrc, cast(ubyte*)&fractionlost, cast(int*)&packetslost, cast(uint*)&exthighestseq, cast(uint*)&jitter, cast(uint*)&lsr, cast(uint*)&dlsr);
  }

  /**
      Get the number of report blocks in packet.
      Returns: The number of report blocks in packet.
  */
  uint getRbCount()
  {
    uint _retval;
    _retval = gst_rtcp_packet_get_rb_count(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the packet type of the packet pointed to by packet.
      Returns: The packet type or GST_RTCP_TYPE_INVALID when packet is not
        pointing to a valid packet.
  */
  gstrtp.types.RTCPType getType()
  {
    GstRTCPType _cretval;
    _cretval = gst_rtcp_packet_get_type(cast(GstRTCPPacket*)this._cPtr);
    gstrtp.types.RTCPType _retval = cast(gstrtp.types.RTCPType)_cretval;
    return _retval;
  }

  /**
      Move the packet pointer packet to the next packet in the payload.
      Use [gstrtp.rtcpbuffer.RTCPBuffer.getFirstPacket] to initialize packet.
      Returns: TRUE if packet is pointing to a valid packet after calling this
        function.
  */
  bool moveToNext()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_move_to_next(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Removes the packet pointed to by packet and moves pointer to the next one
      Returns: TRUE if packet is pointing to a valid packet after calling this
        function.
  */
  bool remove()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_remove(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the ssrc field of the RR packet.
      Returns: the ssrc.
  */
  uint rrGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_rr_get_ssrc(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Set the ssrc field of the RR packet.
  
      Params:
        ssrc = the SSRC to set
  */
  void rrSetSsrc(uint ssrc)
  {
    gst_rtcp_packet_rr_set_ssrc(cast(GstRTCPPacket*)this._cPtr, ssrc);
  }

  /**
      Add a new SDES entry to the current item in packet.
  
      Params:
        type = the #GstRTCPSDESType of the SDES entry
        data = the data
      Returns: true if the item could be added, false if the MTU has been
        reached.
  */
  bool sdesAddEntry(gstrtp.types.RTCPSDESType type, ubyte[] data)
  {
    bool _retval;
    ubyte _len;
    if (data)
      _len = cast(ubyte)data.length;

    auto _data = cast(const(ubyte)*)data.ptr;
    _retval = cast(bool)gst_rtcp_packet_sdes_add_entry(cast(GstRTCPPacket*)this._cPtr, type, _len, _data);
    return _retval;
  }

  /**
      Add a new SDES item for ssrc to packet.
  
      Params:
        ssrc = the SSRC of the new item to add
      Returns: true if the item could be added, false if the maximum amount of
        items has been exceeded for the SDES packet or the MTU has been reached.
  */
  bool sdesAddItem(uint ssrc)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_sdes_add_item(cast(GstRTCPPacket*)this._cPtr, ssrc);
    return _retval;
  }

  /**
      This function is like [gstrtp.rtcppacket.RTCPPacket.sdesGetEntry] but it returns a
      null-terminated copy of the data instead. use [glib.global.gfree] after usage.
  
      Params:
        type = result of the entry type
        data = result entry data
      Returns: true if there was valid data.
  */
  bool sdesCopyEntry(out gstrtp.types.RTCPSDESType type, out ubyte[] data)
  {
    bool _retval;
    ubyte _len;
    ubyte* _data;
    _retval = cast(bool)gst_rtcp_packet_sdes_copy_entry(cast(GstRTCPPacket*)this._cPtr, &type, &_len, &_data);
    data.length = _len;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _len];
    gFree(cast(void*)_data);
    return _retval;
  }

  /**
      Move to the first SDES entry in the current item.
      Returns: true if there was a first entry.
  */
  bool sdesFirstEntry()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_sdes_first_entry(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Move to the first SDES item in packet.
      Returns: TRUE if there was a first item.
  */
  bool sdesFirstItem()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_sdes_first_item(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the data of the current SDES item entry. type (when not NULL) will
      contain the type of the entry. data (when not NULL) will point to len
      bytes.
      
      When type refers to a text item, data will point to a UTF8 string. Note
      that this UTF8 string is NOT null-terminated. Use
      [gstrtp.rtcppacket.RTCPPacket.sdesCopyEntry] to get a null-terminated copy of the entry.
  
      Params:
        type = result of the entry type
        data = result entry data
      Returns: true if there was valid data.
  */
  bool sdesGetEntry(out gstrtp.types.RTCPSDESType type, out ubyte[] data)
  {
    bool _retval;
    ubyte _len;
    ubyte* _data;
    _retval = cast(bool)gst_rtcp_packet_sdes_get_entry(cast(GstRTCPPacket*)this._cPtr, &type, &_len, &_data);
    data.length = _len;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _len];
    return _retval;
  }

  /**
      Get the number of items in the SDES packet packet.
      Returns: The number of items in packet.
  */
  uint sdesGetItemCount()
  {
    uint _retval;
    _retval = gst_rtcp_packet_sdes_get_item_count(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the SSRC of the current SDES item.
      Returns: the SSRC of the current item.
  */
  uint sdesGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_sdes_get_ssrc(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Move to the next SDES entry in the current item.
      Returns: true if there was a next entry.
  */
  bool sdesNextEntry()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_sdes_next_entry(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Move to the next SDES item in packet.
      Returns: TRUE if there was a next item.
  */
  bool sdesNextItem()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_sdes_next_item(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Set the nth new report block in packet with the given values.
      
      Note: Not implemented.
  
      Params:
        nth = the nth report block to set
        ssrc = data source being reported
        fractionlost = fraction lost since last SR/RR
        packetslost = the cumululative number of packets lost
        exthighestseq = the extended last sequence number received
        jitter = the interarrival jitter
        lsr = the last SR packet from this source
        dlsr = the delay since last SR packet
  */
  void setRb(uint nth, uint ssrc, ubyte fractionlost, int packetslost, uint exthighestseq, uint jitter, uint lsr, uint dlsr)
  {
    gst_rtcp_packet_set_rb(cast(GstRTCPPacket*)this._cPtr, nth, ssrc, fractionlost, packetslost, exthighestseq, jitter, lsr, dlsr);
  }

  /**
      Parse the SR sender info and store the values.
  
      Params:
        ssrc = result SSRC
        ntptime = result NTP time
        rtptime = result RTP time
        packetCount = result packet count
        octetCount = result octet count
  */
  void srGetSenderInfo(out uint ssrc, out ulong ntptime, out uint rtptime, out uint packetCount, out uint octetCount)
  {
    gst_rtcp_packet_sr_get_sender_info(cast(GstRTCPPacket*)this._cPtr, cast(uint*)&ssrc, cast(ulong*)&ntptime, cast(uint*)&rtptime, cast(uint*)&packetCount, cast(uint*)&octetCount);
  }

  /**
      Set the given values in the SR packet packet.
  
      Params:
        ssrc = the SSRC
        ntptime = the NTP time
        rtptime = the RTP time
        packetCount = the packet count
        octetCount = the octet count
  */
  void srSetSenderInfo(uint ssrc, ulong ntptime, uint rtptime, uint packetCount, uint octetCount)
  {
    gst_rtcp_packet_sr_set_sender_info(cast(GstRTCPPacket*)this._cPtr, ssrc, ntptime, rtptime, packetCount, octetCount);
  }

  /**
      Move to the first extended report block in XR packet.
      Returns: TRUE if there was a first extended report block.
  */
  bool xrFirstRb()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_first_rb(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /** */
  ushort xrGetBlockLength()
  {
    ushort _retval;
    _retval = gst_rtcp_packet_xr_get_block_length(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Get the extended report block type of the XR packet.
      Returns: The extended report block type.
  */
  gstrtp.types.RTCPXRType xrGetBlockType()
  {
    GstRTCPXRType _cretval;
    _cretval = gst_rtcp_packet_xr_get_block_type(cast(GstRTCPPacket*)this._cPtr);
    gstrtp.types.RTCPXRType _retval = cast(gstrtp.types.RTCPXRType)_cretval;
    return _retval;
  }

  /**
      Parse the extended report block for DLRR report block type.
  
      Params:
        nth = the index of sub-block to retrieve.
        ssrc = the SSRC of the receiver.
        lastRr = the last receiver reference timestamp of ssrc.
        delay = the delay since last_rr.
      Returns: true if the report block is correctly parsed.
  */
  bool xrGetDlrrBlock(uint nth, out uint ssrc, out uint lastRr, out uint delay)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_dlrr_block(cast(GstRTCPPacket*)this._cPtr, nth, cast(uint*)&ssrc, cast(uint*)&lastRr, cast(uint*)&delay);
    return _retval;
  }

  /**
      Retrieve the packet receipt time of seq which ranges in [begin_seq, end_seq).
  
      Params:
        seq = the sequence to retrieve the time.
        receiptTime = the packet receipt time of seq.
      Returns: true if the report block returns the receipt time correctly.
  */
  bool xrGetPrtBySeq(ushort seq, out uint receiptTime)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_prt_by_seq(cast(GstRTCPPacket*)this._cPtr, seq, cast(uint*)&receiptTime);
    return _retval;
  }

  /**
      Parse the Packet Recept Times Report Block from a XR packet
  
      Params:
        ssrc = the SSRC of the RTP data packet source being reported upon by this report block.
        thinning = the amount of thinning performed on the sequence number space.
        beginSeq = the first sequence number that this block reports on.
        endSeq = the last sequence number that this block reports on plus one.
      Returns: true if the report block is correctly parsed.
  */
  bool xrGetPrtInfo(out uint ssrc, out ubyte thinning, out ushort beginSeq, out ushort endSeq)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_prt_info(cast(GstRTCPPacket*)this._cPtr, cast(uint*)&ssrc, cast(ubyte*)&thinning, cast(ushort*)&beginSeq, cast(ushort*)&endSeq);
    return _retval;
  }

  /**
      Parse the extended report block for Loss RLE and Duplicated LRE block type.
  
      Params:
        ssrc = the SSRC of the RTP data packet source being reported upon by this report block.
        thinning = the amount of thinning performed on the sequence number space.
        beginSeq = the first sequence number that this block reports on.
        endSeq = the last sequence number that this block reports on plus one.
        chunkCount = the number of chunks calculated by block length.
      Returns: true if the report block is correctly parsed.
  */
  bool xrGetRleInfo(out uint ssrc, out ubyte thinning, out ushort beginSeq, out ushort endSeq, out uint chunkCount)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_rle_info(cast(GstRTCPPacket*)this._cPtr, cast(uint*)&ssrc, cast(ubyte*)&thinning, cast(ushort*)&beginSeq, cast(ushort*)&endSeq, cast(uint*)&chunkCount);
    return _retval;
  }

  /**
      Retrieve actual chunk data.
  
      Params:
        nth = the index of chunk to retrieve.
        chunk = the nth chunk.
      Returns: true if the report block returns chunk correctly.
  */
  bool xrGetRleNthChunk(uint nth, out ushort chunk)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_rle_nth_chunk(cast(GstRTCPPacket*)this._cPtr, nth, cast(ushort*)&chunk);
    return _retval;
  }

  /** */
  bool xrGetRrt(out ulong timestamp)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_rrt(cast(GstRTCPPacket*)this._cPtr, cast(ulong*)&timestamp);
    return _retval;
  }

  /**
      Get the ssrc field of the XR packet.
      Returns: the ssrc.
  */
  uint xrGetSsrc()
  {
    uint _retval;
    _retval = gst_rtcp_packet_xr_get_ssrc(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }

  /**
      Extract a basic information from static summary report block of XR packet.
  
      Params:
        ssrc = the SSRC of the source.
        beginSeq = the first sequence number that this block reports on.
        endSeq = the last sequence number that this block reports on plus one.
      Returns: true if the report block is correctly parsed.
  */
  bool xrGetSummaryInfo(out uint ssrc, out ushort beginSeq, out ushort endSeq)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_summary_info(cast(GstRTCPPacket*)this._cPtr, cast(uint*)&ssrc, cast(ushort*)&beginSeq, cast(ushort*)&endSeq);
    return _retval;
  }

  /**
      Extract jitter information from the statistics summary. If the jitter flag in
      a block header is set as zero, all of jitters will be zero.
  
      Params:
        minJitter = the minimum relative transit time between two sequences.
        maxJitter = the maximum relative transit time between two sequences.
        meanJitter = the mean relative transit time between two sequences.
        devJitter = the standard deviation of the relative transit time between two sequences.
      Returns: true if the report block is correctly parsed.
  */
  bool xrGetSummaryJitter(out uint minJitter, out uint maxJitter, out uint meanJitter, out uint devJitter)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_summary_jitter(cast(GstRTCPPacket*)this._cPtr, cast(uint*)&minJitter, cast(uint*)&maxJitter, cast(uint*)&meanJitter, cast(uint*)&devJitter);
    return _retval;
  }

  /**
      Get the number of lost or duplicate packets. If the flag in a block header
      is set as zero, lost_packets or dup_packets will be zero.
  
      Params:
        lostPackets = the number of lost packets between begin_seq and end_seq.
        dupPackets = the number of duplicate packets between begin_seq and end_seq.
      Returns: true if the report block is correctly parsed.
  */
  bool xrGetSummaryPkt(out uint lostPackets, out uint dupPackets)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_summary_pkt(cast(GstRTCPPacket*)this._cPtr, cast(uint*)&lostPackets, cast(uint*)&dupPackets);
    return _retval;
  }

  /**
      Extract the value of ttl for ipv4, or hop limit for ipv6.
  
      Params:
        isIpv4 = the flag to indicate that the return values are ipv4 ttl or ipv6 hop limits.
        minTtl = the minimum TTL or Hop Limit value of data packets between two sequences.
        maxTtl = the maximum TTL or Hop Limit value of data packets between two sequences.
        meanTtl = the mean TTL or Hop Limit value of data packets between two sequences.
        devTtl = the standard deviation of the TTL or Hop Limit value of data packets between two sequences.
      Returns: true if the report block is correctly parsed.
  */
  bool xrGetSummaryTtl(out bool isIpv4, out ubyte minTtl, out ubyte maxTtl, out ubyte meanTtl, out ubyte devTtl)
  {
    bool _retval;
    gboolean _isIpv4;
    _retval = cast(bool)gst_rtcp_packet_xr_get_summary_ttl(cast(GstRTCPPacket*)this._cPtr, &_isIpv4, cast(ubyte*)&minTtl, cast(ubyte*)&maxTtl, cast(ubyte*)&meanTtl, cast(ubyte*)&devTtl);
    isIpv4 = cast(bool)_isIpv4;
    return _retval;
  }

  /** */
  bool xrGetVoipBurstMetrics(out ubyte burstDensity, out ubyte gapDensity, out ushort burstDuration, out ushort gapDuration)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_burst_metrics(cast(GstRTCPPacket*)this._cPtr, cast(ubyte*)&burstDensity, cast(ubyte*)&gapDensity, cast(ushort*)&burstDuration, cast(ushort*)&gapDuration);
    return _retval;
  }

  /** */
  bool xrGetVoipConfigurationParams(out ubyte gmin, out ubyte rxConfig)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_configuration_params(cast(GstRTCPPacket*)this._cPtr, cast(ubyte*)&gmin, cast(ubyte*)&rxConfig);
    return _retval;
  }

  /** */
  bool xrGetVoipDelayMetrics(out ushort roundtripDelay, out ushort endSystemDelay)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_delay_metrics(cast(GstRTCPPacket*)this._cPtr, cast(ushort*)&roundtripDelay, cast(ushort*)&endSystemDelay);
    return _retval;
  }

  /** */
  bool xrGetVoipJitterBufferParams(out ushort jbNominal, out ushort jbMaximum, out ushort jbAbsMax)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_jitter_buffer_params(cast(GstRTCPPacket*)this._cPtr, cast(ushort*)&jbNominal, cast(ushort*)&jbMaximum, cast(ushort*)&jbAbsMax);
    return _retval;
  }

  /** */
  bool xrGetVoipMetricsSsrc(out uint ssrc)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_metrics_ssrc(cast(GstRTCPPacket*)this._cPtr, cast(uint*)&ssrc);
    return _retval;
  }

  /** */
  bool xrGetVoipPacketMetrics(out ubyte lossRate, out ubyte discardRate)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_packet_metrics(cast(GstRTCPPacket*)this._cPtr, cast(ubyte*)&lossRate, cast(ubyte*)&discardRate);
    return _retval;
  }

  /** */
  bool xrGetVoipQualityMetrics(out ubyte rFactor, out ubyte extRFactor, out ubyte mosLq, out ubyte mosCq)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_quality_metrics(cast(GstRTCPPacket*)this._cPtr, cast(ubyte*)&rFactor, cast(ubyte*)&extRFactor, cast(ubyte*)&mosLq, cast(ubyte*)&mosCq);
    return _retval;
  }

  /** */
  bool xrGetVoipSignalMetrics(out ubyte signalLevel, out ubyte noiseLevel, out ubyte rerl, out ubyte gmin)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_get_voip_signal_metrics(cast(GstRTCPPacket*)this._cPtr, cast(ubyte*)&signalLevel, cast(ubyte*)&noiseLevel, cast(ubyte*)&rerl, cast(ubyte*)&gmin);
    return _retval;
  }

  /**
      Move to the next extended report block in XR packet.
      Returns: TRUE if there was a next extended report block.
  */
  bool xrNextRb()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_packet_xr_next_rb(cast(GstRTCPPacket*)this._cPtr);
    return _retval;
  }
}
