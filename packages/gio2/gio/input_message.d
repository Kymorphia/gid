/// Module for [InputMessage] class
module gio.input_message;

public import gid.basictypes;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;


import gio.socket_address;
import gio.socket_control_message;
import gobject.object;

/**
    Structure used for scatter/gather data input when receiving multiple
    messages or packets in one go. You generally pass in an array of empty
    #GInputVectors and the operation will use all the buffers as if they
    were one buffer, and will set @bytes_received to the total number of bytes
    received across all #GInputVectors.
    
    This structure closely mirrors `struct mmsghdr` and `struct msghdr` from
    the POSIX sockets API (see `man 2 recvmmsg`).
    
    If @address is non-null then it is set to the source address the message
    was received from, and the caller must free it afterwards.
    
    If @control_messages is non-null then it is set to an array of control
    messages received with the message (if any), and the caller must free it
    afterwards. @num_control_messages is set to the number of elements in
    this array, which may be zero.
    
    Flags relevant to this message will be returned in @flags. For example,
    `MSG_EOR` or `MSG_TRUNC`.
*/
class InputMessage : StructWrap!(GInputMessage)
{
  /**
      Create a `input_message.InputMessage` wrap type.
      Params:
        bytesReceived = will be set to the number of bytes that have been
            received
        flags = collection of #GSocketMsgFlags for the received message,
            outputted by the call
  */
  this(size_t bytesReceived = size_t.init, int flags = int.init) nothrow
  {
    this.bytesReceived = bytesReceived;
    this.flags = flags;
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

  /**
      Get `vectors` field.
      Returns: pointer to an
          array of input vectors
  */
  @property gio.types.InputVector[] vectors() nothrow
  {
    if (!(cast(GInputMessage*)this._cPtr).vectors)
      return null;

    return (cast(GInputMessage*)this._cPtr).vectors[0 .. (cast(GInputMessage*)this._cPtr).numVectors].dup;
  }

  /**
      Get `bytesReceived` field.
      Returns: will be set to the number of bytes that have been
          received
  */
  @property size_t bytesReceived() nothrow
  {
    return (cast(GInputMessage*)this._cPtr).bytesReceived;
  }

  /**
      Set `bytesReceived` field.
      Params:
        propval = will be set to the number of bytes that have been
            received
  */
  @property void bytesReceived(size_t propval) nothrow
  {
    (cast(GInputMessage*)this._cPtr).bytesReceived = propval;
  }

  /**
      Get `flags` field.
      Returns: collection of #GSocketMsgFlags for the received message,
          outputted by the call
  */
  @property int flags() nothrow
  {
    return (cast(GInputMessage*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = collection of #GSocketMsgFlags for the received message,
            outputted by the call
  */
  @property void flags(int propval) nothrow
  {
    (cast(GInputMessage*)this._cPtr).flags = propval;
  }

  private gio.types.InputVector[] _vectorsRef; // Vectors array referenced by the C structure (references the buffers)
  private bool _receiveAddress; // Receive the source address of the message
  private bool _receiveControlMessages; // Receive the control messages of the message
  private gio.socket_address.SocketAddress _address; // Source address of the last receive
  private gio.socket_control_message.SocketControlMessage[] _controlMessages; // Control messages of the last receive

  /**
  Create an input message which receives data into buffers.
  Params:
  buffers = the buffers to receive the message data into (scatter input, in order), kept alive by the message
  receiveAddress = true to receive the source address of the message (see [gio.input_message.InputMessage.address])
  receiveControlMessages = true to receive the control messages of the message (see
  [gio.input_message.InputMessage.controlMessages])
  */
  this(ubyte[][] buffers, bool receiveAddress = false, bool receiveControlMessages = false) nothrow
  {
    this.buffers = buffers;
    _receiveAddress = receiveAddress;
    _receiveControlMessages = receiveControlMessages;
  }

  /**
  Set the buffers to receive the message data into (sets the `vectors` and `numVectors` fields).
  Params:
  propval = the buffers to receive the message data into (scatter input, in order), kept alive by the message
  */
  @property void buffers(ubyte[][] propval) nothrow
  {
    if (_refuseBorrowedStore("vectors"))
      return;

    _vectorsRef = new gio.types.InputVector[](propval.length);

    foreach (i, buf; propval)
    {
      _vectorsRef[i].buffer = buf.ptr;
      _vectorsRef[i].size = buf.length;
    }

    (cast(GInputMessage*)this._cPtr).vectors = _vectorsRef.length > 0 ? _vectorsRef.ptr : null;
    (cast(GInputMessage*)this._cPtr).numVectors = cast(uint)_vectorsRef.length;
  }

  /**
  Get whether the source address of the message is received.
  Returns: true if the source address is received
  */
  @property bool receiveAddress() nothrow
  {
    return _receiveAddress;
  }

  /**
  Set whether the source address of the message is received (see [gio.input_message.InputMessage.address]).
  Params:
  propval = true to receive the source address
  */
  @property void receiveAddress(bool propval) nothrow
  {
    _receiveAddress = propval;
  }

  /**
  Get whether the control messages of the message are received.
  Returns: true if the control messages are received
  */
  @property bool receiveControlMessages() nothrow
  {
    return _receiveControlMessages;
  }

  /**
  Set whether the control messages of the message are received (see
  [gio.input_message.InputMessage.controlMessages]).
  Params:
  propval = true to receive the control messages
  */
  @property void receiveControlMessages(bool propval) nothrow
  {
    _receiveControlMessages = propval;
  }

  /**
  Get the source address of the message received by the last receive operation.
  Returns: the source address or null if not received (see [gio.input_message.InputMessage.receiveAddress])
  */
  @property gio.socket_address.SocketAddress address() nothrow
  {
    return _address;
  }

  /**
  Get the control messages received with the message by the last receive operation.
  Returns: the control messages, empty if none were received (see
  [gio.input_message.InputMessage.receiveControlMessages])
  */
  @property gio.socket_control_message.SocketControlMessage[] controlMessages() nothrow
  {
    return _controlMessages;
  }

  /**
  Receive messages with a C receive function (used by [gio.socket.Socket.receiveMessages] and
  [gio.datagram_based.DatagramBased.receiveMessages]). The C messages are temporary copies, with the address and
  control messages return locations set as requested by the messages, which take ownership of the received
  addresses and control messages afterwards.
  Params:
  messages = the messages
  context = API name for critical messages
  receive = delegate which calls the C receive function with the C messages and their count
  Returns: the receive function result, -1 if a message is null
  */
  package static int _receiveMessages(gio.input_message.InputMessage[] messages, string context,
  scope int delegate(GInputMessage* cMessages, uint numMessages) nothrow receive) nothrow
  {
    import glib.c.functions : g_free, g_log;
    import glib.c.types : GLogLevelFlags;

    foreach (i, msg; messages)
    {
      if (!msg)
      {
        g_log("Gid", GLogLevelFlags.LevelCritical, "%.*s messages[%d] is null", cast(int)context.length, context.ptr,
        cast(int)i);
        return -1;
      }
    }

    auto cMessages = new GInputMessage[](messages.length);
    auto addresses = new GSocketAddress*[](messages.length);
    auto controlArrays = new GSocketControlMessage**[](messages.length);
    auto numControls = new uint[](messages.length);

    foreach (i, msg; messages)
    {
      cMessages[i] = *cast(GInputMessage*)msg._cPtr;
      cMessages[i].address = msg._receiveAddress ? &addresses[i] : null;
      cMessages[i].controlMessages = msg._receiveControlMessages ? &controlArrays[i] : null;
      cMessages[i].numControlMessages = msg._receiveControlMessages ? &numControls[i] : null;
    }

    auto retval = receive(cMessages.length > 0 ? cMessages.ptr : null, cast(uint)cMessages.length);

    foreach (i, msg; messages)
    {
      auto cMsg = cast(GInputMessage*)msg._cPtr;
      cMsg.bytesReceived = cMessages[i].bytesReceived;
      cMsg.flags = cMessages[i].flags;

      msg._address = addresses[i]
      ? gobject.object.ObjectWrap._getDObject!(gio.socket_address.SocketAddress)(addresses[i], Yes.Take) : null;
      msg._controlMessages = null;

      if (controlArrays[i])
      {
        msg._controlMessages = new gio.socket_control_message.SocketControlMessage[](numControls[i]);

        foreach (j; 0 .. numControls[i])
          msg._controlMessages[j] = gobject.object.ObjectWrap._getDObject!(
        gio.socket_control_message.SocketControlMessage)(controlArrays[i][j], Yes.Take);

        g_free(controlArrays[i]);
      }
    }

    return retval;
  }

}
