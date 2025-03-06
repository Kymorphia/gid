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
  GInputMessage cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.InputMessage");

    cInstance = *cast(GInputMessage*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property uint numVectors()
  {
    return (cast(GInputMessage*)cPtr).numVectors;
  }

  @property void numVectors(uint propval)
  {
    (cast(GInputMessage*)cPtr).numVectors = propval;
  }

  @property size_t bytesReceived()
  {
    return (cast(GInputMessage*)cPtr).bytesReceived;
  }

  @property void bytesReceived(size_t propval)
  {
    (cast(GInputMessage*)cPtr).bytesReceived = propval;
  }

  @property int flags()
  {
    return (cast(GInputMessage*)cPtr).flags;
  }

  @property void flags(int propval)
  {
    (cast(GInputMessage*)cPtr).flags = propval;
  }
}
