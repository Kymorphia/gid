/// Module for [NetTimePacket] class
module gstnet.net_time_packet;

import gid.gid;
import gio.socket;
import gio.socket_address;
import glib.error;
import gobject.boxed;
import gst.types;
import gstnet.c.functions;
import gstnet.c.types;
import gstnet.types;

/**
    Various functions for receiving, sending an serializing #GstNetTimePacket
    structures.
*/
class NetTimePacket : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_net_time_packet_get_type != &gidSymbolNotFound ? gst_net_time_packet_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override NetTimePacket self()
  {
    return this;
  }

  /**
      Get `localTime` field.
      Returns: the local time when this packet was sent
  */
  @property gst.types.ClockTime localTime()
  {
    return (cast(GstNetTimePacket*)this._cPtr).localTime;
  }

  /**
      Set `localTime` field.
      Params:
        propval = the local time when this packet was sent
  */
  @property void localTime(gst.types.ClockTime propval)
  {
    (cast(GstNetTimePacket*)this._cPtr).localTime = propval;
  }

  /**
      Get `remoteTime` field.
      Returns: the remote time observation
  */
  @property gst.types.ClockTime remoteTime()
  {
    return (cast(GstNetTimePacket*)this._cPtr).remoteTime;
  }

  /**
      Set `remoteTime` field.
      Params:
        propval = the remote time observation
  */
  @property void remoteTime(gst.types.ClockTime propval)
  {
    (cast(GstNetTimePacket*)this._cPtr).remoteTime = propval;
  }

  /**
      Creates a new #GstNetTimePacket from a buffer received over the network. The
      caller is responsible for ensuring that buffer is at least
      #GST_NET_TIME_PACKET_SIZE bytes long.
      
      If buffer is null, the local and remote times will be set to
      #GST_CLOCK_TIME_NONE.
      
      MT safe. Caller owns return value (gst_net_time_packet_free to free).
  
      Params:
        buffer = a buffer from which to construct the packet, or NULL
      Returns: The new #GstNetTimePacket.
  */
  this(ubyte[] buffer = null)
  {
    GstNetTimePacket* _cretval;
    assert(!buffer || buffer.length == 16);
    auto _buffer = cast(const(ubyte)*)buffer.ptr;
    _cretval = gst_net_time_packet_new(_buffer);
    this(_cretval, Yes.Take);
  }

  /**
      Make a copy of packet.
      Returns: a copy of packet, free with [gstnet.net_time_packet.NetTimePacket.free].
  */
  gstnet.net_time_packet.NetTimePacket copy()
  {
    GstNetTimePacket* _cretval;
    _cretval = gst_net_time_packet_copy(cast(const(GstNetTimePacket)*)this._cPtr);
    auto _retval = _cretval ? new gstnet.net_time_packet.NetTimePacket(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Sends a #GstNetTimePacket over a socket.
      
      MT safe.
  
      Params:
        socket = socket to send the time packet on
        destAddress = address to send the time packet to
      Returns: TRUE if successful, FALSE in case an error occurred.
      Throws: [ErrorWrap]
  */
  bool send(gio.socket.Socket socket, gio.socket_address.SocketAddress destAddress)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_net_time_packet_send(cast(const(GstNetTimePacket)*)this._cPtr, socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, destAddress ? cast(GSocketAddress*)destAddress._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    return _retval;
  }

  /**
      Serialized a #GstNetTimePacket into a newly-allocated sequence of
      #GST_NET_TIME_PACKET_SIZE bytes, in network byte order. The value returned is
      suitable for passing to write(2) or sendto(2) for communication over the
      network.
      
      MT safe. Caller owns return value (g_free to free).
      Returns: A newly allocated sequence of #GST_NET_TIME_PACKET_SIZE bytes.
  */
  ubyte[] serialize()
  {
    ubyte* _cretval;
    _cretval = gst_net_time_packet_serialize(cast(const(GstNetTimePacket)*)this._cPtr);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[])_cretval[0 .. 16].dup;
      gFree(cast(void*)_cretval);
    }
    return _retval;
  }

  /**
      Receives a #GstNetTimePacket over a socket. Handles interrupted system
      calls, but otherwise returns NULL on error.
  
      Params:
        socket = socket to receive the time packet on
        srcAddress = address of variable to return sender address
      Returns: a new #GstNetTimePacket, or NULL on error. Free
           with [gstnet.net_time_packet.NetTimePacket.free] when done.
      Throws: [ErrorWrap]
  */
  static gstnet.net_time_packet.NetTimePacket receive(gio.socket.Socket socket, out gio.socket_address.SocketAddress srcAddress)
  {
    GstNetTimePacket* _cretval;
    GSocketAddress* _srcAddress;
    GError *_err;
    _cretval = gst_net_time_packet_receive(socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, &_srcAddress, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = _cretval ? new gstnet.net_time_packet.NetTimePacket(cast(void*)_cretval, Yes.Take) : null;
    srcAddress = new gio.socket_address.SocketAddress(cast(void*)_srcAddress, Yes.Take);
    return _retval;
  }
}
