/// Module for [RTPBuffer] class
module gstrtp.rtpbuffer;

import gid.gid;
import glib.bytes;
import gst.buffer;
import gst.types;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.types;

/**
    The GstRTPBuffer helper functions makes it easy to parse and create regular
    #GstBuffer objects that contain RTP payloads. These buffers are typically of
    'application/x-rtp' #GstCaps.
*/
class RTPBuffer
{
  GstRTPBuffer _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtp.rtpbuffer.RTPBuffer");

    _cInstance = *cast(GstRTPBuffer*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `buffer` field.
      Returns: pointer to RTP buffer
  */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstRTPBuffer*)this._cPtr).buffer);
  }

  /**
      Set `buffer` field.
      Params:
        propval = pointer to RTP buffer
  */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstRTPBuffer*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstRTPBuffer*)this._cPtr).buffer);
  }

  /**
      Get `state` field.
      Returns: internal state
  */
  @property uint state()
  {
    return (cast(GstRTPBuffer*)this._cPtr).state;
  }

  /**
      Set `state` field.
      Params:
        propval = internal state
  */
  @property void state(uint propval)
  {
    (cast(GstRTPBuffer*)this._cPtr).state = propval;
  }

  /**
      Adds a RFC 5285 header extension with a one byte header to the end of the
      RTP header. If there is already a RFC 5285 header extension with a one byte
      header, the new extension will be appended.
      It will not work if there is already a header extension that does not follow
      the mechanism described in RFC 5285 or if there is a header extension with
      a two bytes header as described in RFC 5285. In that case, use
      [gstrtp.rtpbuffer.RTPBuffer.addExtensionTwobytesHeader]
  
      Params:
        id = The ID of the header extension (between 1 and 14).
        data = location for data
      Returns: true if header extension could be added
  */
  bool addExtensionOnebyteHeader(ubyte id, ubyte[] data)
  {
    bool _retval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(void)*)data.ptr;
    _retval = cast(bool)gst_rtp_buffer_add_extension_onebyte_header(cast(GstRTPBuffer*)this._cPtr, id, _data, _size);
    return _retval;
  }

  /**
      Adds a RFC 5285 header extension with a two bytes header to the end of the
      RTP header. If there is already a RFC 5285 header extension with a two bytes
      header, the new extension will be appended.
      It will not work if there is already a header extension that does not follow
      the mechanism described in RFC 5285 or if there is a header extension with
      a one byte header as described in RFC 5285. In that case, use
      [gstrtp.rtpbuffer.RTPBuffer.addExtensionOnebyteHeader]
  
      Params:
        appbits = Application specific bits
        id = The ID of the header extension
        data = location for data
      Returns: true if header extension could be added
  */
  bool addExtensionTwobytesHeader(ubyte appbits, ubyte id, ubyte[] data)
  {
    bool _retval;
    uint _size;
    if (data)
      _size = cast(uint)data.length;

    auto _data = cast(const(void)*)data.ptr;
    _retval = cast(bool)gst_rtp_buffer_add_extension_twobytes_header(cast(GstRTPBuffer*)this._cPtr, appbits, id, _data, _size);
    return _retval;
  }

  /**
      Get the CSRC at index idx in buffer.
  
      Params:
        idx = the index of the CSRC to get
      Returns: the CSRC at index idx in host order.
  */
  uint getCsrc(ubyte idx)
  {
    uint _retval;
    _retval = gst_rtp_buffer_get_csrc(cast(GstRTPBuffer*)this._cPtr, idx);
    return _retval;
  }

  /**
      Get the CSRC count of the RTP packet in buffer.
      Returns: the CSRC count of buffer.
  */
  ubyte getCsrcCount()
  {
    ubyte _retval;
    _retval = gst_rtp_buffer_get_csrc_count(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Check if the extension bit is set on the RTP packet in buffer.
      Returns: TRUE if buffer has the extension bit set.
  */
  bool getExtension()
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_buffer_get_extension(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Similar to gst_rtp_buffer_get_extension_data, but more suitable for language
      bindings usage. bits will contain the extension 16 bits of custom data and
      the extension data (not including the extension header) is placed in a new
      #GBytes structure.
      
      If rtp did not contain an extension, this function will return null, with
      bits unchanged. If there is an extension header but no extension data then
      an empty #GBytes will be returned.
  
      Params:
        bits = location for header bits
      Returns: A new #GBytes if an extension header was present
        and null otherwise.
  */
  glib.bytes.Bytes getExtensionData(out ushort bits)
  {
    GBytes* _cretval;
    _cretval = gst_rtp_buffer_get_extension_bytes(cast(GstRTPBuffer*)this._cPtr, cast(ushort*)&bits);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Parses RFC 5285 style header extensions with a one byte header. It will
      return the nth extension with the requested id.
  
      Params:
        id = The ID of the header extension to be read (between 1 and 14).
        nth = Read the nth extension packet with the requested ID
        data = location for data
      Returns: TRUE if buffer had the requested header extension
  */
  bool getExtensionOnebyteHeader(ubyte id, uint nth, out ubyte[] data)
  {
    bool _retval;
    uint _size;
    void* _data;
    _retval = cast(bool)gst_rtp_buffer_get_extension_onebyte_header(cast(GstRTPBuffer*)this._cPtr, id, nth, &_data, &_size);
    data.length = _size;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _size];
    return _retval;
  }

  /**
      Parses RFC 5285 style header extensions with a two bytes header. It will
      return the nth extension with the requested id.
  
      Params:
        appbits = Application specific bits
        id = The ID of the header extension to be read (between 1 and 14).
        nth = Read the nth extension packet with the requested ID
        data = location for data
      Returns: TRUE if buffer had the requested header extension
  */
  bool getExtensionTwobytesHeader(out ubyte appbits, ubyte id, uint nth, out ubyte[] data)
  {
    bool _retval;
    uint _size;
    void* _data;
    _retval = cast(bool)gst_rtp_buffer_get_extension_twobytes_header(cast(GstRTPBuffer*)this._cPtr, cast(ubyte*)&appbits, id, nth, &_data, &_size);
    data.length = _size;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _size];
    return _retval;
  }

  /**
      Return the total length of the header in buffer. This include the length of
      the fixed header, the CSRC list and the extension header.
      Returns: The total length of the header in buffer.
  */
  uint getHeaderLen()
  {
    uint _retval;
    _retval = gst_rtp_buffer_get_header_len(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Check if the marker bit is set on the RTP packet in buffer.
      Returns: TRUE if buffer has the marker bit set.
  */
  bool getMarker()
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_buffer_get_marker(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Return the total length of the packet in buffer.
      Returns: The total length of the packet in buffer.
  */
  uint getPacketLen()
  {
    uint _retval;
    _retval = gst_rtp_buffer_get_packet_len(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Check if the padding bit is set on the RTP packet in buffer.
      Returns: TRUE if buffer has the padding bit set.
  */
  bool getPadding()
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_buffer_get_padding(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Create a buffer of the payload of the RTP packet in buffer. This function
      will internally create a subbuffer of buffer so that a memcpy can be
      avoided.
      Returns: A new buffer with the data of the payload.
  */
  gst.buffer.Buffer getPayloadBuffer()
  {
    GstBuffer* _cretval;
    _cretval = gst_rtp_buffer_get_payload_buffer(cast(GstRTPBuffer*)this._cPtr);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Similar to gst_rtp_buffer_get_payload, but more suitable for language
      bindings usage. The return value is a pointer to a #GBytes structure
      containing the payload data in rtp.
      Returns: A new #GBytes containing the payload data in rtp.
  */
  glib.bytes.Bytes getPayload()
  {
    GBytes* _cretval;
    _cretval = gst_rtp_buffer_get_payload_bytes(cast(GstRTPBuffer*)this._cPtr);
    auto _retval = _cretval ? new glib.bytes.Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the length of the payload of the RTP packet in buffer.
      Returns: The length of the payload in buffer.
  */
  uint getPayloadLen()
  {
    uint _retval;
    _retval = gst_rtp_buffer_get_payload_len(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Create a subbuffer of the payload of the RTP packet in buffer. offset bytes
      are skipped in the payload and the subbuffer will be of size len.
      If len is -1 the total payload starting from offset is subbuffered.
  
      Params:
        offset = the offset in the payload
        len = the length in the payload
      Returns: A new buffer with the specified data of the payload.
  */
  gst.buffer.Buffer getPayloadSubbuffer(uint offset, uint len)
  {
    GstBuffer* _cretval;
    _cretval = gst_rtp_buffer_get_payload_subbuffer(cast(GstRTPBuffer*)this._cPtr, offset, len);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Get the payload type of the RTP packet in buffer.
      Returns: The payload type.
  */
  ubyte getPayloadType()
  {
    ubyte _retval;
    _retval = gst_rtp_buffer_get_payload_type(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Get the sequence number of the RTP packet in buffer.
      Returns: The sequence number in host order.
  */
  ushort getSeq()
  {
    ushort _retval;
    _retval = gst_rtp_buffer_get_seq(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Get the SSRC of the RTP packet in buffer.
      Returns: the SSRC of buffer in host order.
  */
  uint getSsrc()
  {
    uint _retval;
    _retval = gst_rtp_buffer_get_ssrc(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Get the timestamp of the RTP packet in buffer.
      Returns: The timestamp in host order.
  */
  uint getTimestamp()
  {
    uint _retval;
    _retval = gst_rtp_buffer_get_timestamp(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Get the version number of the RTP packet in buffer.
      Returns: The version of buffer.
  */
  ubyte getVersion()
  {
    ubyte _retval;
    _retval = gst_rtp_buffer_get_version(cast(GstRTPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Set the amount of padding in the RTP packet in buffer to
      len. If len is 0, the padding is removed.
      
      NOTE: This function does not work correctly.
  
      Params:
        len = the new amount of padding
  */
  void padTo(uint len)
  {
    gst_rtp_buffer_pad_to(cast(GstRTPBuffer*)this._cPtr, len);
  }

  /**
      Unsets the extension bit of the RTP buffer and removes the extension header
      and data.
      
      If the RTP buffer has no header extension data, the action has no effect.
      The RTP buffer must be mapped READWRITE only once and the underlying
      GstBuffer must be writable.
  */
  void removeExtensionData()
  {
    gst_rtp_buffer_remove_extension_data(cast(GstRTPBuffer*)this._cPtr);
  }

  /**
      Modify the CSRC at index idx in buffer to csrc.
  
      Params:
        idx = the CSRC index to set
        csrc = the CSRC in host order to set at idx
  */
  void setCsrc(ubyte idx, uint csrc)
  {
    gst_rtp_buffer_set_csrc(cast(GstRTPBuffer*)this._cPtr, idx, csrc);
  }

  /**
      Set the extension bit on the RTP packet in buffer to extension.
  
      Params:
        extension = the new extension
  */
  void setExtension(bool extension)
  {
    gst_rtp_buffer_set_extension(cast(GstRTPBuffer*)this._cPtr, extension);
  }

  /**
      Set the extension bit of the rtp buffer and fill in the bits and length of the
      extension header. If the existing extension data is not large enough, it will
      be made larger.
      
      Will also shorten the extension data from 1.20.
  
      Params:
        bits = the bits specific for the extension
        length = the length that counts the number of 32-bit words in
          the extension, excluding the extension header ( therefore zero is a valid length)
      Returns: True if done.
  */
  bool setExtensionData(ushort bits, ushort length)
  {
    bool _retval;
    _retval = cast(bool)gst_rtp_buffer_set_extension_data(cast(GstRTPBuffer*)this._cPtr, bits, length);
    return _retval;
  }

  /**
      Set the marker bit on the RTP packet in buffer to marker.
  
      Params:
        marker = the new marker
  */
  void setMarker(bool marker)
  {
    gst_rtp_buffer_set_marker(cast(GstRTPBuffer*)this._cPtr, marker);
  }

  /**
      Set the total rtp size to len. The data in the buffer will be made
      larger if needed. Any padding will be removed from the packet.
  
      Params:
        len = the new packet length
  */
  void setPacketLen(uint len)
  {
    gst_rtp_buffer_set_packet_len(cast(GstRTPBuffer*)this._cPtr, len);
  }

  /**
      Set the padding bit on the RTP packet in buffer to padding.
  
      Params:
        padding = the new padding
  */
  void setPadding(bool padding)
  {
    gst_rtp_buffer_set_padding(cast(GstRTPBuffer*)this._cPtr, padding);
  }

  /**
      Set the payload type of the RTP packet in buffer to payload_type.
  
      Params:
        payloadType = the new type
  */
  void setPayloadType(ubyte payloadType)
  {
    gst_rtp_buffer_set_payload_type(cast(GstRTPBuffer*)this._cPtr, payloadType);
  }

  /**
      Set the sequence number of the RTP packet in buffer to seq.
  
      Params:
        seq = the new sequence number
  */
  void setSeq(ushort seq)
  {
    gst_rtp_buffer_set_seq(cast(GstRTPBuffer*)this._cPtr, seq);
  }

  /**
      Set the SSRC on the RTP packet in buffer to ssrc.
  
      Params:
        ssrc = the new SSRC
  */
  void setSsrc(uint ssrc)
  {
    gst_rtp_buffer_set_ssrc(cast(GstRTPBuffer*)this._cPtr, ssrc);
  }

  /**
      Set the timestamp of the RTP packet in buffer to timestamp.
  
      Params:
        timestamp = the new timestamp
  */
  void setTimestamp(uint timestamp)
  {
    gst_rtp_buffer_set_timestamp(cast(GstRTPBuffer*)this._cPtr, timestamp);
  }

  /**
      Set the version of the RTP packet in buffer to version.
  
      Params:
        version_ = the new version
  */
  void setVersion(ubyte version_)
  {
    gst_rtp_buffer_set_version(cast(GstRTPBuffer*)this._cPtr, version_);
  }

  /**
      Unmap rtp previously mapped with [gstrtp.rtpbuffer.RTPBuffer.map].
  */
  void unmap()
  {
    gst_rtp_buffer_unmap(cast(GstRTPBuffer*)this._cPtr);
  }

  /**
      Allocate enough data in buffer to hold an RTP packet with csrc_count CSRCs,
      a payload length of payload_len and padding of pad_len.
      buffer must be writable and all previous memory in buffer will be freed.
      If pad_len is >0, the padding bit will be set. All other RTP header fields
      will be set to 0/FALSE.
  
      Params:
        buffer = a #GstBuffer
        payloadLen = the length of the payload
        padLen = the amount of padding
        csrcCount = the number of CSRC entries
  */
  static void allocateData(gst.buffer.Buffer buffer, uint payloadLen, ubyte padLen, ubyte csrcCount)
  {
    gst_rtp_buffer_allocate_data(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, payloadLen, padLen, csrcCount);
  }

  /**
      Calculate the header length of an RTP packet with csrc_count CSRC entries.
      An RTP packet can have at most 15 CSRC entries.
  
      Params:
        csrcCount = the number of CSRC entries
      Returns: The length of an RTP header with csrc_count CSRC entries.
  */
  static uint calcHeaderLen(ubyte csrcCount)
  {
    uint _retval;
    _retval = gst_rtp_buffer_calc_header_len(csrcCount);
    return _retval;
  }

  /**
      Calculate the total length of an RTP packet with a payload size of payload_len,
      a padding of pad_len and a csrc_count CSRC entries.
  
      Params:
        payloadLen = the length of the payload
        padLen = the amount of padding
        csrcCount = the number of CSRC entries
      Returns: The total length of an RTP header with given parameters.
  */
  static uint calcPacketLen(uint payloadLen, ubyte padLen, ubyte csrcCount)
  {
    uint _retval;
    _retval = gst_rtp_buffer_calc_packet_len(payloadLen, padLen, csrcCount);
    return _retval;
  }

  /**
      Calculate the length of the payload of an RTP packet with size packet_len,
      a padding of pad_len and a csrc_count CSRC entries.
  
      Params:
        packetLen = the length of the total RTP packet
        padLen = the amount of padding
        csrcCount = the number of CSRC entries
      Returns: The length of the payload of an RTP packet  with given parameters.
  */
  static uint calcPayloadLen(uint packetLen, ubyte padLen, ubyte csrcCount)
  {
    uint _retval;
    _retval = gst_rtp_buffer_calc_payload_len(packetLen, padLen, csrcCount);
    return _retval;
  }

  /**
      Compare two sequence numbers, taking care of wraparounds. This function
      returns the difference between seqnum1 and seqnum2.
  
      Params:
        seqnum1 = a sequence number
        seqnum2 = a sequence number
      Returns: a negative value if seqnum1 is bigger than seqnum2, 0 if they
        are equal or a positive value if seqnum1 is smaller than segnum2.
  */
  static int compareSeqnum(ushort seqnum1, ushort seqnum2)
  {
    int _retval;
    _retval = gst_rtp_buffer_compare_seqnum(seqnum1, seqnum2);
    return _retval;
  }

  /**
      Get the default clock-rate for the static payload type payload_type.
  
      Params:
        payloadType = the static payload type
      Returns: the default clock rate or -1 if the payload type is not static or
        the clock-rate is undefined.
  */
  static uint defaultClockRate(ubyte payloadType)
  {
    uint _retval;
    _retval = gst_rtp_buffer_default_clock_rate(payloadType);
    return _retval;
  }

  /**
      Update the exttimestamp field with the extended timestamp of timestamp
      For the first call of the method, exttimestamp should point to a location
      with a value of -1.
      
      This function is able to handle both forward and backward timestamps taking
      into account:
        $(LIST
            * timestamp wraparound making sure that the returned value is properly increased.
            * timestamp unwraparound making sure that the returned value is properly decreased.
        )
  
      Params:
        exttimestamp = a previous extended timestamp
        timestamp = a new timestamp
      Returns: The extended timestamp of timestamp or 0 if the result can't go anywhere backwards.
  */
  static ulong extTimestamp(ref ulong exttimestamp, uint timestamp)
  {
    ulong _retval;
    _retval = gst_rtp_buffer_ext_timestamp(cast(ulong*)&exttimestamp, timestamp);
    return _retval;
  }

  /**
      Similar to gst_rtp_buffer_get_extension_onebyte_header, but working
      on the #GBytes you get from gst_rtp_buffer_get_extension_bytes.
      Parses RFC 5285 style header extensions with a one byte header. It will
      return the nth extension with the requested id.
  
      Params:
        bytes = #GBytes
        bitPattern = The bit-pattern. Anything but 0xBEDE is rejected.
        id = The ID of the header extension to be read (between 1 and 14).
        nth = Read the nth extension packet with the requested ID
        data = location for data
      Returns: TRUE if bytes had the requested header extension
  */
  static bool getExtensionOnebyteHeaderFromBytes(glib.bytes.Bytes bytes, ushort bitPattern, ubyte id, uint nth, out ubyte[] data)
  {
    bool _retval;
    uint _size;
    void* _data;
    _retval = cast(bool)gst_rtp_buffer_get_extension_onebyte_header_from_bytes(bytes ? cast(GBytes*)bytes._cPtr(No.Dup) : null, bitPattern, id, nth, &_data, &_size);
    data.length = _size;
    data[0 .. $] = (cast(ubyte*)_data)[0 .. _size];
    return _retval;
  }

  /**
      Map the contents of buffer into rtp.
  
      Params:
        buffer = a #GstBuffer
        flags = #GstMapFlags
        rtp = a #GstRTPBuffer
      Returns: true if buffer could be mapped.
  */
  static bool map(gst.buffer.Buffer buffer, gst.types.MapFlags flags, out gstrtp.rtpbuffer.RTPBuffer rtp)
  {
    bool _retval;
    GstRTPBuffer _rtp;
    _retval = cast(bool)gst_rtp_buffer_map(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags, &_rtp);
    rtp = new gstrtp.rtpbuffer.RTPBuffer(cast(void*)&_rtp, No.Take);
    return _retval;
  }

  /**
      Allocate a new #GstBuffer with enough data to hold an RTP packet with
      csrc_count CSRCs, a payload length of payload_len and padding of pad_len.
      All other RTP header fields will be set to 0/FALSE.
  
      Params:
        payloadLen = the length of the payload
        padLen = the amount of padding
        csrcCount = the number of CSRC entries
      Returns: A newly allocated buffer that can hold an RTP packet with given
        parameters.
  */
  static gst.buffer.Buffer newAllocate(uint payloadLen, ubyte padLen, ubyte csrcCount)
  {
    GstBuffer* _cretval;
    _cretval = gst_rtp_buffer_new_allocate(payloadLen, padLen, csrcCount);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new #GstBuffer that can hold an RTP packet that is exactly
      packet_len long. The length of the payload depends on pad_len and
      csrc_count and can be calculated with [gstrtp.rtpbuffer.RTPBuffer.calcPayloadLen].
      All RTP header fields will be set to 0/FALSE.
  
      Params:
        packetLen = the total length of the packet
        padLen = the amount of padding
        csrcCount = the number of CSRC entries
      Returns: A newly allocated buffer that can hold an RTP packet of packet_len.
  */
  static gst.buffer.Buffer newAllocateLen(uint packetLen, ubyte padLen, ubyte csrcCount)
  {
    GstBuffer* _cretval;
    _cretval = gst_rtp_buffer_new_allocate_len(packetLen, padLen, csrcCount);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new buffer and set the data to a copy of len
      bytes of data and the size to len. The data will be freed when the buffer
      is freed.
  
      Params:
        data = data for the new
            buffer
      Returns: A newly allocated buffer with a copy of data and of size len.
  */
  static gst.buffer.Buffer newCopyData(ubyte[] data)
  {
    GstBuffer* _cretval;
    size_t _len;
    if (data)
      _len = cast(size_t)data.length;

    auto _data = cast(const(void)*)data.ptr;
    _cretval = gst_rtp_buffer_new_copy_data(_data, _len);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
