/// Module for [InputMessage] class
module gio.input_message;

import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;

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
class InputMessage
{
  GInputMessage _cInstance;

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for gio.input_message.InputMessage");

    _cInstance = *cast(GInputMessage*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr()
  {
    return cast(void*)&_cInstance;
  }

  /**
      Get `numVectors` field.
      Returns: the number of input vectors pointed to by @vectors
  */
  @property uint numVectors()
  {
    return (cast(GInputMessage*)this._cPtr).numVectors;
  }

  /**
      Set `numVectors` field.
      Params:
        propval = the number of input vectors pointed to by @vectors
  */
  @property void numVectors(uint propval)
  {
    (cast(GInputMessage*)this._cPtr).numVectors = propval;
  }

  /**
      Get `bytesReceived` field.
      Returns: will be set to the number of bytes that have been
          received
  */
  @property size_t bytesReceived()
  {
    return (cast(GInputMessage*)this._cPtr).bytesReceived;
  }

  /**
      Set `bytesReceived` field.
      Params:
        propval = will be set to the number of bytes that have been
            received
  */
  @property void bytesReceived(size_t propval)
  {
    (cast(GInputMessage*)this._cPtr).bytesReceived = propval;
  }

  /**
      Get `flags` field.
      Returns: collection of #GSocketMsgFlags for the received message,
          outputted by the call
  */
  @property int flags()
  {
    return (cast(GInputMessage*)this._cPtr).flags;
  }

  /**
      Set `flags` field.
      Params:
        propval = collection of #GSocketMsgFlags for the received message,
            outputted by the call
  */
  @property void flags(int propval)
  {
    (cast(GInputMessage*)this._cPtr).flags = propval;
  }
}
