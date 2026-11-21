/// Module for [RTCPBuffer] class
module gid.gstrtp1.rtcpbuffer;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gst1.buffer;
import gid.gst1.types;
import gid.gstrtp1.c.functions;
import gid.gstrtp1.c.types;
import gid.gstrtp1.rtcppacket;
import gid.gstrtp1.types;

/**
    Note: The API in this module is not yet declared stable.
    
    The GstRTPCBuffer helper functions makes it easy to parse and create regular
    #GstBuffer objects that contain compound RTCP packets. These buffers are typically
    of 'application/x-rtcp' #GstCaps.
    
    An RTCP buffer consists of 1 or more #GstRTCPPacket structures that you can
    retrieve with [gid.gstrtp1.rtcpbuffer.RTCPBuffer.getFirstPacket]. #GstRTCPPacket acts as a pointer
    into the RTCP buffer; you can move to the next packet with
    [gid.gstrtp1.rtcppacket.RTCPPacket.moveToNext].
*/
class RTCPBuffer : StructWrap!(GstRTCPBuffer)
{
  /**
      Create a `rtcpbuffer.RTCPBuffer` wrap type.
      Params:
        buffer = 
  */
  this(gid.gst1.buffer.Buffer buffer = gid.gst1.buffer.Buffer.init) nothrow
  {
    this.buffer = buffer;
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

  /** Scope of a structure mapped by [gid.gstrtp1.rtcpbuffer.RTCPBuffer.map] (see [gid.core.wrap.MapScope]) */
  alias MapScope = gid.core.wrap.MapScope!(gid.gstrtp1.rtcpbuffer.RTCPBuffer, gst_rtcp_buffer_unmap, gid.gst1.buffer.Buffer);

  private gid.gst1.buffer.Buffer _bufferRef; // Keeps borrowed field value alive

  /** */
  @property gid.gst1.buffer.Buffer buffer() nothrow
  {
    return cToD!(gid.gst1.buffer.Buffer)(cast(void*)(cast(GstRTCPBuffer*)this._cPtr).buffer);
  }

  /** */
  @property void buffer(gid.gst1.buffer.Buffer propval) nothrow
  {
    if (_refuseBorrowedStore("buffer"))
      return;

    _bufferRef = propval;
    (cast(GstRTCPBuffer*)this._cPtr).buffer = propval ? cast(GstBuffer*)propval._cPtr(No.Dup) : null;
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
  bool addPacket(gid.gstrtp1.types.RTCPType type, gid.gstrtp1.rtcppacket.RTCPPacket packet) nothrow
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
  bool getFirstPacket(gid.gstrtp1.rtcppacket.RTCPPacket packet) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_get_first_packet(cast(GstRTCPBuffer*)this._cPtr, packet ? cast(GstRTCPPacket*)packet._cPtr : null);
    return _retval;
  }

  /**
      Get the number of RTCP packets in rtcp.
      Returns: the number of RTCP packets in rtcp.
  */
  uint getPacketCount() nothrow
  {
    uint _retval;
    _retval = gst_rtcp_buffer_get_packet_count(cast(GstRTCPBuffer*)this._cPtr);
    return _retval;
  }

  /**
      Open buffer for reading or writing, depending on flags. The resulting RTCP
      buffer state is stored in rtcp.
  
      Params:
        buffer = a buffer with an RTCP packet
        flags = flags for the mapping
        rtcp = resulting #GstRTCPBuffer (mapped structure scope, unmapped by its `unmap()` or when it goes out of scope, use a local variable: `RTCPBuffer.MapScope rtcp;`)
      Returns: 
  */
  static bool map(gid.gst1.buffer.Buffer buffer, gid.gst1.types.MapFlags flags, out gid.gstrtp1.rtcpbuffer.RTCPBuffer.MapScope rtcp) nothrow
  {
    bool _retval;
    auto _rtcp = cast(GstRTCPBuffer*)rtcp._begin(buffer);
    _retval = cast(bool)gst_rtcp_buffer_map(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null, flags, _rtcp);
    rtcp._mapped = _retval;
    return _retval;
  }

  /**
      Create a new buffer for constructing RTCP packets. The packet will have a
      maximum size of mtu.
  
      Params:
        mtu = the maximum mtu size.
      Returns: A newly allocated buffer.
  */
  static gid.gst1.buffer.Buffer new_(uint mtu) nothrow
  {
    GstBuffer* _cretval;
    _cretval = gst_rtcp_buffer_new(mtu);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
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
  static gid.gst1.buffer.Buffer newCopyData(ubyte[] data) nothrow
  {
    GstBuffer* _cretval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtcp_buffer_new_copy_data(_data, _len);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
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
  static gid.gst1.buffer.Buffer newTakeData(ubyte[] data) nothrow
  {
    GstBuffer* _cretval;
    uint _len;
    if (data)
      _len = cast(uint)data.length;

    auto _data = cast(ubyte*)data.ptr;
    _cretval = gst_rtcp_buffer_new_take_data(_data, _len);
    auto _retval = _cretval ? new gid.gst1.buffer.Buffer(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Check if the data pointed to by buffer is a valid RTCP packet using
      [gid.gstrtp1.rtcpbuffer.RTCPBuffer.validateData].
  
      Params:
        buffer = the buffer to validate
      Returns: TRUE if buffer is a valid RTCP packet.
  */
  static bool validate(gid.gst1.buffer.Buffer buffer) nothrow
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
  static bool validateData(ubyte[] data) nothrow
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
  static bool validateDataReduced(ubyte[] data) nothrow
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
      [gid.gstrtp1.rtcpbuffer.RTCPBuffer.validateReduced].
  
      Params:
        buffer = the buffer to validate
      Returns: TRUE if buffer is a valid RTCP packet.
  */
  static bool validateReduced(gid.gst1.buffer.Buffer buffer) nothrow
  {
    bool _retval;
    _retval = cast(bool)gst_rtcp_buffer_validate_reduced(buffer ? cast(GstBuffer*)buffer._cPtr(No.Dup) : null);
    return _retval;
  }
}
