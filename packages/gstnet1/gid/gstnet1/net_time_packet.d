/// Module for [NetTimePacket] struct
module gid.gstnet1.net_time_packet;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gio2.socket;
import gid.gio2.socket_address;
import gid.glib2.error;
import gid.gobject2.object;
import gid.gst1.types;
import gid.gstnet1.c.functions;
import gid.gstnet1.c.types;
import gid.gstnet1.types;

/**
    Various functions for receiving, sending an serializing #GstNetTimePacket
    structures.
*/
struct NetTimePacket
{
  /**
      the local time when this packet was sent
  */
  ClockTime localTime;

  /**
      the remote time observation
  */
  ClockTime remoteTime;

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())gst_net_time_packet_get_type != &gidSymbolNotFound ? gst_net_time_packet_get_type() : cast(GType)0;
  }

  /** */
  @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  static void* _cDup(void* ptr) nothrow
  {
    return boxedCopy(_getGType, ptr);
  }

  /** */
  static void _cFree(void* ptr) nothrow
  {
    boxedFree(_getGType, ptr);
  }

  /**
      Make a copy of packet.
      Returns: a copy of packet, free with [gid.gstnet1.net_time_packet.NetTimePacket.free].
  */
  gid.gstnet1.net_time_packet.NetTimePacket copy() nothrow
  {
    GstNetTimePacket* _cretval;
    _cretval = gst_net_time_packet_copy(cast(const(GstNetTimePacket)*)&this);
    gid.gstnet1.net_time_packet.NetTimePacket _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gstnet1.net_time_packet.NetTimePacket*)_cretval;
      cValueFree!(gid.gstnet1.net_time_packet.NetTimePacket)(_cretval);
    }
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
  bool send(gid.gio2.socket.Socket socket, gid.gio2.socket_address.SocketAddress destAddress)
  {
    bool _retval;
    GError *_err;
    _retval = cast(bool)gst_net_time_packet_send(cast(const(GstNetTimePacket)*)&this, socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, destAddress ? cast(GSocketAddress*)destAddress._cPtr(No.Dup) : null, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
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
  ubyte[] serialize() nothrow
  {
    ubyte* _cretval;
    _cretval = gst_net_time_packet_serialize(cast(const(GstNetTimePacket)*)&this);
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
           with [gid.gstnet1.net_time_packet.NetTimePacket.free] when done.
      Throws: [ErrorWrap]
  */
  static gid.gstnet1.net_time_packet.NetTimePacket receive(gid.gio2.socket.Socket socket, out gid.gio2.socket_address.SocketAddress srcAddress)
  {
    GstNetTimePacket* _cretval;
    GSocketAddress* _srcAddress;
    GError *_err;
    _cretval = gst_net_time_packet_receive(socket ? cast(GSocket*)socket._cPtr(No.Dup) : null, &_srcAddress, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    gid.gstnet1.net_time_packet.NetTimePacket _retval;
    if (_cretval)
    {
      _retval = *cast(gid.gstnet1.net_time_packet.NetTimePacket*)_cretval;
      cValueFree!(gid.gstnet1.net_time_packet.NetTimePacket)(_cretval);
    }
    srcAddress = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.socket_address.SocketAddress)(_srcAddress, Yes.Take);
    return _retval;
  }
}
