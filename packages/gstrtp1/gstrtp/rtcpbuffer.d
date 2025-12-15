/// Module for [RTCPBuffer] class
module gstrtp.rtcpbuffer;

import gid.gid;
import gst.buffer;
import gst.map_info;
import gst.types;
import gstrtp.c.functions;
import gstrtp.c.types;
import gstrtp.rtcppacket;
import gstrtp.types;

/**
    Note: The API in this module is not yet declared stable.
    
    The GstRTPCBuffer helper functions makes it easy to parse and create regular
    #GstBuffer objects that contain compound RTCP packets. These buffers are typically
    of 'application/x-rtcp' #GstCaps.
    
    An RTCP buffer consists of 1 or more #GstRTCPPacket structures that you can
    retrieve with [gstrtp.rtcpbuffer.RTCPBuffer.getFirstPacket]. #GstRTCPPacket acts as a pointer
    into the RTCP buffer; you can move to the next packet with
    [gstrtp.rtcppacket.RTCPPacket.moveToNext].
*/
class RTCPBuffer
{
  GstRTCPBuffer cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gstrtp.rtcpbuffer.RTCPBuffer");

    cInstance = *cast(GstRTCPBuffer*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&cInstance;
  }

  /** */
  @property gst.buffer.Buffer buffer()
  {
    return cToD!(gst.buffer.Buffer)(cast(void*)(cast(GstRTCPBuffer*)this._cPtr).buffer);
  }

  /** */
  @property void buffer(gst.buffer.Buffer propval)
  {
    cValueFree!(gst.buffer.Buffer)(cast(void*)(cast(GstRTCPBuffer*)this._cPtr).buffer);
    dToC(propval, cast(void*)&(cast(GstRTCPBuffer*)this._cPtr).buffer);
  }

  /** */
  @property gst.map_info.MapInfo map()
  {
    return new gst.map_info.MapInfo(cast(GstMapInfo*)&(cast(GstRTCPBuffer*)this._cPtr).map, No.Take);
  }

  /**
      Add a new packet of type to rtcp. packet will point to the newly created
      packet.
  
      Params:
        type = the #GstRTCPType of the new packet
        packet = pointer to new packet
      Returns: true if the packet could be created. This function returns false
        if the max mtu is exceeded for the buffer.
  */
  bool addPacket(gstrtp.types.RTCPType type, gstrtp.rtcppacket.RTCPPacket packet)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_add_packet(cast(GstRTCPBuffer*)this._cPtr, type, packet ? cast(GstRTCPPacket*)packet._cPtr : null);
    return _retval;
  }

  /**
      Initialize a new #GstRTCPPacket pointer that points to the first packet in
      rtcp.
  
      Params:
        packet = a #GstRTCPPacket
      Returns: TRUE if the packet existed in rtcp.
  */
  bool getFirstPacket(gstrtp.rtcppacket.RTCPPacket packet)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_get_first_packet(cast(GstRTCPBuffer*)this._cPtr, packet ? cast(GstRTCPPacket*)packet._cPtr : null);
    return _retval;
  }

  /**
      Get the number of RTCP packets in rtcp.
      Returns: the number of RTCP packets in rtcp.
  */
  uint getPacketCount()
  {
    uint _retval;
    _retval = gst_rtcp_buffer_get_packet_count(cast(GstRTCPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Finish rtcp after being constructed. This function is usually called
      after [gstrtp.rtcpbuffer.RTCPBuffer.map] and after adding the RTCP items to the new buffer.
      
      The function adjusts the size of rtcp with the total length of all the
      added packets.
      Returns: 
  */
  bool unmap()
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_unmap(cast(GstRTCPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Open buffer for reading or writing, depending on flags. The resulting RTCP
      buffer state is stored in rtcp.
  
      Params:
        buffer = a buffer with an RTCP packet
        flags = flags for the mapping
        rtcp = resulting #GstRTCPBuffer
      Returns: 
  */
  static bool map(gst.buffer.Buffer buffer, gst.types.MapFlags flags, gstrtp.rtcpbuffer.RTCPBuffer rtcp)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_map(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags, rtcp ? cast(GstRTCPBuffer*)rtcp._cPtr : null);
    return _retval;
  }

  /**
      Create a new buffer for constructing RTCP packets. The packet will have a
      maximum size of mtu.
  
      Params:
        mtu = the maximum mtu size.
      Returns: A newly allocated buffer.
  */
  static gst.buffer.Buffer new_(uint mtu)
  {
    GstBuffer* _cretval;
    _cretval = gst_rtcp_buffer_new(mtu);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new buffer and set the data to a copy of len
      bytes of data and the size to len. The data will be freed when the buffer
      is freed.
  
      Params:
        data = data for the new buffer
      Returns: A newly allocated buffer with a copy of data and of size len.
  */
  static gst.buffer.Buffer newCopyData(ubyte[] data)
  {
    GstBuffer* _cretval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(const(void)*)data.ptr;
    _cretval = gst_rtcp_buffer_new_copy_data(_data, _len);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Create a new buffer and set the data and size of the buffer to data and len
      respectively. data will be freed when the buffer is unreffed, so this
      function transfers ownership of data to the new buffer.
  
      Params:
        data = data for the new buffer
      Returns: A newly allocated buffer with data and of size len.
  */
  static gst.buffer.Buffer newTakeData(ubyte[] data)
  {
    GstBuffer* _cretval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(void*)data.ptr;
    _cretval = gst_rtcp_buffer_new_take_data(_data, _len);
    auto _retval = _cretval ? new gst.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check if the data pointed to by buffer is a valid RTCP packet using
      [gstrtp.rtcpbuffer.RTCPBuffer.validateData].
  
      Params:
        buffer = the buffer to validate
      Returns: TRUE if buffer is a valid RTCP packet.
  */
  static bool validate(gst.buffer.Buffer buffer)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_validate(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Check if the data and size point to the data of a valid compound,
      non-reduced size RTCP packet.
      Use this function to validate a packet before using the other functions in
      this module.
  
      Params:
        data = the data to validate
      Returns: TRUE if the data points to a valid RTCP packet.
  */
  static bool validateData(ubyte[] data)
  {
    bool _retval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = cast(bool)gst_rtcp_buffer_validate_data(_data, _len);
    return _retval;
  }

  /**
      Check if the data and size point to the data of a valid RTCP packet.
      Use this function to validate a packet before using the other functions in
      this module.
      
      This function is updated to support reduced size rtcp packets according to
      RFC 5506 and will validate full compound RTCP packets as well as reduced
      size RTCP packets.
  
      Params:
        data = the data to validate
      Returns: TRUE if the data points to a valid RTCP packet.
  */
  static bool validateDataReduced(ubyte[] data)
  {
    bool _retval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _retval = cast(bool)gst_rtcp_buffer_validate_data_reduced(_data, _len);
    return _retval;
  }

  /**
      Check if the data pointed to by buffer is a valid RTCP packet using
      [gstrtp.rtcpbuffer.RTCPBuffer.validateReduced].
  
      Params:
        buffer = the buffer to validate
      Returns: TRUE if buffer is a valid RTCP packet.
  */
  static bool validateReduced(gst.buffer.Buffer buffer)
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_validate_reduced(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }
}
